CREATE DATABASE final;

USE final;

# PARTE 1:

CREATE TABLE categorias(
	categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE fornecedores(
	fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(50),
    endereco VARCHAR(150),
    cidade VARCHAR(50)
);

CREATE TABLE produtos(
	produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL (10, 2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT,
    fornecedor_id INT,
    FOREIGN KEY(categoria_id) REFERENCES categorias(categoria_id),
	FOREIGN KEY(fornecedor_id) REFERENCES fornecedores(fornecedor_id)
);

CREATE TABLE clientes(
	cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    cpf VARCHAR(14) NOT NULL,
    endereco VARCHAR(150),
    cidade VARCHAR(50)
);

CREATE TABLE funcionarios(
	funcionarios_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    data_contratacao DATE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE pedidos(
		pedido_id INT AUTO_INCREMENT PRIMARY KEY,
		data_pedido DATE NOT NULL,
		cliente_id INT,
		funcionario_id INT,
		status_pedido VARCHAR(20),
		FOREIGN KEY(cliente_id) REFERENCES clientes(cliente_id),
		FOREIGN KEY(funcionario_id) REFERENCES funcionarios(funcionario_id)
	);

CREATE TABLE itens_pedido(
	item_pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY(pedido_id) REFERENCES pedidos(pedido_id),
	FOREIGN KEY(produto_id) REFERENCES produtos(produto_id)
);

CREATE TABLE pagamentos(
	pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    valor DECIMAL(10, 2) NOT NULL,
    metodo_pagamento VARCHAR(50),
    data_pagamento DATE NOT NULL,
	FOREIGN KEY(pedido_id) REFERENCES pedidos(pedido_id)
);

# PARTE 2:

INSERT INTO categorias (nome)
VALUES
	('Tecnologia e Eletrônicos'),   
	('Eletrodomésticos'),           
	('Acessórios de Tecnologia'),   
	('Utensílios para Cozinha'),     
	('Decoração e Móveis'),        
	('Moda e Vestuário');            

INSERT INTO fornecedores (nome, contato, endereco, cidade) 
VALUES
	('Tech World', 'techworld@exemplo.com', 'Av. das Tecnologias, 1234', 'São Paulo'),
	('Digital Store', 'contato@digitalstore.com.br', 'Rua dos Eletrônicos, 567', 'Rio de Janeiro'),
	('FrioTech', 'atendimento@friotech.com', 'Av. dos Eletros, 890', 'Curitiba'),
	('KitchenPlus', 'suporte@kitchenplus.com', 'Rua da Gastronomia, 321', 'Belo Horizonte'),
	('HomeDeco', 'contato@homedeco.com', 'Av. do Design, 654', 'Porto Alegre');

INSERT INTO produtos (nome, preco, estoque, categoria_id, fornecedor_id) 
VALUES
	('Smartphone X10', 1500.00, 25, 1, 1),
	('Notebook Ultrafino', 3200.00, 3, 1, 2),
	('Fone de Ouvido Bass+', 150.00, 18, 3, 1),
	('Geladeira FrostMax', 2800.00, 5, 2, 3),
	('Cafeteira Express', 400.00, 30, 4, 4),
	('Air Fryer HealthPlus', 300.00, 4, 2, 4),
	('Tênis Confort 2024', 250.00, 2, 6, 5),
	('Jaqueta Impermeável', 350.00, 50, 6, 5),
	('Camiseta Eco', 70.00, 15, 6, 5),
	('Mesa de Escritório Compact', 600.00, 4, 5, 5),
	('Cadeira Gamer', 1200.00, 10, 5, 2),
	('Mouse sem fio', 80.00, 45, 3, 1),
	('Teclado Mecânico Pro', 200.00, 8, 3, 2),
	('Caixa de Som Bluetooth', 300.00, 27, 3, 1),
	('Micro-ondas Compact', 500.00, 12, 2, 4),
	('Liquidificador Turbo', 150.00, 6, 2, 3),
	('Relógio Digital', 120.00, 40, 3, 1),
	('Cadeira Dobrável', 150.00, 3, 5, 5),
	('Aspirador de Pó PowerClean', 750.00, 21, 2, 3),
	('Smart TV 50\" 4K', 2800.00, 7, 1, 2);

INSERT INTO clientes (nome, email, telefone, cpf, endereco, cidade) 
VALUES
	('Ana Souza', 'ana.souza@email.com', '(11) 91234-5678', '123.456.789-01', 'Rua das Flores, 100', 'São Paulo'),
	('Bruno Oliveira', 'bruno.oliveira@email.com', '(21) 98765-4321', '234.567.890-12', 'Av. Atlântica, 555', 'Rio de Janeiro'),
	('Carla Mendes', 'carla.mendes@email.com', '(31) 99876-5432', '345.678.901-23', 'Rua das Acácias, 234', 'Belo Horizonte'),
	('Daniela Lima', 'daniela.lima@email.com', '(41) 91234-8765', '456.789.012-34', 'Av. Paraná, 321', 'Curitiba'),
	('Eduardo Silva', 'eduardo.silva@email.com', '(61) 92345-6789', '567.890.123-45', 'Rua Brasília, 120', 'Brasília'),
	('Fernanda Costa', 'fernanda.costa@email.com', '(71) 98712-3456', '678.901.234-56', 'Rua do Campo, 456', 'Salvador'),
	('Gabriel Santos', 'gabriel.santos@email.com', '(81) 92134-5678', '789.012.345-67', 'Av. Recife, 987', 'Recife'),
	('Helena Martins', 'helena.martins@email.com', '(85) 91122-3344', '890.123.456-78', 'Rua das Palmeiras, 200', 'Fortaleza'),
	('Isabel Ribeiro', 'isabel.ribeiro@email.com', '(51) 97865-4321', '901.234.567-89', 'Av. Ipiranga, 654', 'Porto Alegre'),
	('João Carvalho', 'joao.carvalho@email.com', '(19) 93456-7890', '012.345.678-90', 'Rua Campinas, 300', 'Campinas');

INSERT INTO funcionarios (nome, cargo, salario, data_contratacao, email, telefone) 
VALUES
	('Carlos Almeida', 'Vendedor', 2500.00, '2022-04-10', 'carlos.almeida@empresa.com', '(11) 91234-5678'),
	('Mariana Oliveira', 'Gerente', 4500.00, '2021-02-20', 'mariana.oliveira@empresa.com', '(21) 98765-4321'),
	('Lucas Pereira', 'Caixa', 1800.00, '2023-07-15', 'lucas.pereira@empresa.com', '(31) 99876-5432'),
	('Fernanda Costa', 'Consultora de Vendas', 2700.00, '2020-11-12', 'fernanda.costa@empresa.com', '(41) 91234-8765'),
	('Rafael Silva', 'Assistente de Estoque', 2000.00, '2023-03-05', 'rafael.silva@empresa.com', '(61) 92345-6789');

INSERT INTO pedidos (data_pedido, cliente_id, funcionario_id, status_pedido) 
VALUES
	('2024-10-01', 1, 1, 'Concluído'),
	('2024-10-02', 2, 1, 'Em andamento'),
	('2024-10-03', 3, 2, 'Concluído'),
	('2024-10-04', 4, 2, 'Concluído'),
	('2024-10-05', 5, 3, 'Em andamento'),
	('2024-10-06', 6, 1, 'Concluído'),
	('2024-10-07', 7, 4, 'Em andamento'),
	('2024-10-08', 8, 4, 'Concluído'),
	('2024-10-09', 9, 5, 'Em andamento'),
	('2024-10-10', 10, 3, 'Concluído');

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) 
VALUES
	(1, 1, 2, 1500.00), # Pedido 1 
	(1, 4, 1, 2800.00),
	(2, 6, 1, 300.00), # Pedido 2    
	(2, 7, 1, 250.00),
	(3, 3, 3, 150.00), # Pedido 3 
	(3, 10, 1, 600.00), 
	(4, 5, 1, 400.00), # Pedido 4     
	(4, 9, 2, 70.00),     
	(5, 11, 1, 1200.00), # Pedido 5 
	(5, 15, 1, 500.00),   
	(6, 13, 2, 200.00), # Pedido 6   
	(6, 19, 1, 750.00),  
	(7, 17, 1, 120.00), # Pedido 7  
	(7, 8, 1, 350.00),     
	(8, 14, 1, 300.00), # Pedido 8
	(8, 2, 1, 3200.00),    
	(9, 16, 1, 150.00), # Pedido 9   
	(9, 20, 1, 2800.00),   
	(10, 18, 1, 150.00), # Pedido 10  
	(10, 12, 1, 80.00);    
    
INSERT INTO pagamentos (pedido_id, valor, metodo_pagamento, data_pagamento) 
VALUES
	(1, 5800.00, 'Cartão de Crédito', '2024-10-02'), # Pedido concluído
	(2, 550.00, 'Boleto', '2024-10-03'), # Pedido em andamento, pagamento pendente
	(3, 1050.00, 'Transferência Bancária', '2024-10-04'), # Pedido concluído
	(4, 540.00, 'Cartão de Crédito', '2024-10-05'), # Pedido concluído
	(5, 1700.00, 'Cartão de Crédito', '2024-10-06'), # Pedido em andamento, pagamento pendente
	(6, 1150.00, 'Boleto', '2024-10-07'), # Pedido concluído
	(7, 470.00, 'Transferência Bancária', '2024-10-08'), # Pedido em andamento, pagamento pendente
	(8, 3500.00, 'Cartão de Crédito', '2024-10-09'), # Pedido concluído
	(9, 2950.00, 'Boleto', '2024-10-10'), # Pedido em andamento, pagamento pendente
	(10, 230.00, 'Transferência Bancária', '2024-10-11'); # Pedido concluído

# PARTE 2.1:

UPDATE produtos SET preco = preco * 1.1
WHERE categoria_id = (
	SELECT categoria_id FROM categorias
    WHERE nome = 'Tecnologia e Eletrônicos'
);

# PARTE 2.2:

UPDATE produtos SET preco = preco * 0.95
WHERE estoque > 20;

# PARTE 2.3:

UPDATE produtos SET preco = preco * 0.85
WHERE fornecedor_id = (
	SELECT fornecedor_id FROM fornecedores
    WHERE nome = 'Tech World'
);

# PARTE 2.4:

UPDATE clientes SET 
	telefone = '(61) 1234-5678', 
	endereco = 'Rua Paraná, 51'
WHERE cliente_id = 5;

# PARTE 2.5:

UPDATE funcionarios SET 
	cargo = 'Gerente',
    salario = salario * 1.20
WHERE funcionario_id = 3;

# PARTE 2.6:

UPDATE pedidos
SET status_pedido = 'Concluído'
WHERE EXISTS (
    SELECT 1
    FROM pagamentos
    WHERE pagamentos.pedido_id = pedidos.pedido_id
);

# PARTE 2.7:

ALTER TABLE produtos ADD COLUMN preco_original DECIMAL(10, 2);

UPDATE produtos
SET preco_original = CASE produto_id
    WHEN 1 THEN 1500.00
    WHEN 2 THEN 3200.00
    WHEN 3 THEN 150.00
    WHEN 4 THEN 2800.00
    WHEN 5 THEN 400.00
    WHEN 6 THEN 300.00
    WHEN 7 THEN 250.00
    WHEN 8 THEN 350.00
    WHEN 9 THEN 70.00
    WHEN 10 THEN 600.00
    WHEN 11 THEN 1200.00
    WHEN 12 THEN 80.00
    WHEN 13 THEN 200.00
    WHEN 14 THEN 300.00
    WHEN 15 THEN 500.00
    WHEN 16 THEN 150.00
    WHEN 17 THEN 120.00
    WHEN 18 THEN 150.00
    WHEN 19 THEN 750.00
    WHEN 20 THEN 2800.00
END
WHERE produto_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);

UPDATE produtos SET preco = preco_original;

# PARTE 2.8:

UPDATE produtos p
JOIN itens_pedido ip ON p.produto_id = ip.produto_id
JOIN pedidos ped ON ip.pedido_id = ped.pedido_id
SET p.estoque = p.estoque - ip.quantidade
WHERE ped.status_pedido = 'Concluído';

# PARTE 2.9:

UPDATE fornecedores SET 
	endereco = 'Rua dos Digitais, 123',
	contato = 'sac@digitalstore.com.br'
WHERE fornecedor_id = 2;

# PARTE 2.10:

UPDATE itens_pedido SET 
	quantidade = 3
WHERE item_pedido_id = 1;

# PARTE 3.1: 

SELECT 
    p.nome AS produto,
    c.nome AS categoria,
    f.nome AS fornecedor,
    p.estoque
FROM 
    produtos p
JOIN 
    categorias c ON p.categoria_id = c.categoria_id
JOIN 
    fornecedores f ON p.fornecedor_id = f.fornecedor_id
WHERE 
    p.estoque > 10;
    
# PARTE 3.2:

SELECT 
    cl.nome AS cliente,
    p.data_pedido,
    f.nome AS funcionario_responsavel,
    p.status_pedido
FROM 
    pedidos p
JOIN 
    clientes cl ON p.cliente_id = cl.cliente_id
JOIN 
    funcionarios f ON p.funcionario_id = f.funcionario_id
WHERE 
    cl.nome = 1 AND 
    p.data_pedido >= CURDATE() - INTERVAL 30 DAY;

# PARTE 3.3: 

SELECT 
    p.nome AS produto_nome,
    SUM(ip.quantidade) AS total_vendido
FROM 
    itens_pedido ip
JOIN 
    produtos p USING (produto_id)
GROUP BY 
    p.nome
HAVING 
    total_vendido > 1;
    
# PARTE 3.4: 

SELECT 
    p.pedido_id,
    p.valor AS valor_pagamento,
    p.metodo_pagamento,
    p.data_pagamento
FROM 
    pagamentos p
WHERE 
    p.data_pagamento >= CURDATE() - INTERVAL 60 DAY;
    
# PARTE 3.5: 
    
UPDATE pedidos SET status_pedido = 'Em andamento'
WHERE 
	pedido_id % 2 = 0;
    
SELECT 
    p.pedido_id,
    p.data_pedido,
    p.status_pedido,
    SUM(ip.quantidade * ip.preco_unitario) AS valor_total
FROM pedidos p
LEFT JOIN itens_pedido ip ON p.pedido_id = ip.pedido_id
LEFT JOIN pagamentos pg ON p.pedido_id = pg.pedido_id
WHERE (pg.pedido_id IS NULL OR p.status_pedido = 'Em andamento')
GROUP BY p.pedido_id, p.data_pedido, p.status_pedido
HAVING SUM(ip.quantidade * ip.preco_unitario) > 100
ORDER BY p.data_pedido;
 
# PARTE 3.6:

SELECT 
    p.nome AS nome_produto,
    p.estoque AS quantidade_estoque,
    p.preco AS preco,
    f.nome AS nome_fornecedor
FROM produtos p
INNER JOIN fornecedores f ON p.fornecedor_id = f.fornecedor_id
WHERE p.estoque < 5
ORDER BY p.nome;

# PARTE 3.7:

SELECT 
    c.nome AS cliente_nome,
    SUM(ip.quantidade * ip.preco_unitario) AS total_gasto
FROM clientes c
INNER JOIN pedidos p ON c.cliente_id = p.cliente_id
INNER JOIN itens_pedido ip ON p.pedido_id = ip.pedido_id
GROUP BY c.cliente_id, c.nome
HAVING SUM(ip.quantidade * ip.preco_unitario) > 500;

# PARTE 3.8:

SELECT 
    f.nome AS nome_funcionario,
    SUM(ip.quantidade * ip.preco_unitario) AS total_vendas
FROM funcionarios f
INNER JOIN pedidos p ON f.funcionario_id = p.funcionario_id
INNER JOIN itens_pedido ip ON p.pedido_id = ip.pedido_id
GROUP BY f.nome
HAVING SUM(ip.quantidade * ip.preco_unitario) > (
    SELECT AVG(total_vendas) FROM (
        SELECT SUM(ip.quantidade * ip.preco_unitario) AS total_vendas
        FROM pedidos p
        INNER JOIN itens_pedido ip ON p.pedido_id = ip.pedido_id
        GROUP BY p.funcionario_id
    ) AS subquery
);

# PARTE 3.9:

SELECT 
    YEAR(p.data_pedido) AS ano,
    MONTH(p.data_pedido) AS mes,
    SUM(ip.quantidade * ip.preco_unitario) AS total_vendas
FROM
    pedidos p
INNER JOIN itens_pedido ip ON p.pedido_id = ip.pedido_id
GROUP BY
    YEAR(p.data_pedido), MONTH(p.data_pedido)
HAVING
    SUM(ip.quantidade * ip.preco_unitario) > 1000
ORDER BY
    ano, mes;

# PARTE 3.10:

SELECT 
    p.nome AS nome_produto,
    c.nome AS categoria
FROM 
    produtos p
INNER JOIN categorias c ON p.categoria_id = c.categoria_id
WHERE 
    p.produto_id NOT IN (
        SELECT DISTINCT ip.produto_id
        FROM itens_pedido ip
        INNER JOIN pedidos pe ON ip.pedido_id = pe.pedido_id
        WHERE pe.data_pedido >= CURDATE() - INTERVAL 90 DAY
    )
ORDER BY 
    p.nome;
    
# PARTE 3.11:
    
SELECT 
    f.cargo,
    COUNT(f.funcionario_id) AS quantidade_funcionarios
FROM 
    funcionarios f
GROUP BY 
    f.cargo
HAVING 
    COUNT(f.funcionario_id) > 2;    
    
# PARTE 3.12:

SELECT 
    c.nome AS cliente,
    COUNT(p.pedido_id) AS total_pedidos,
    f.nome AS funcionario_responsavel,
    COUNT(CASE WHEN p.status_pedido = 'Concluído' THEN 1 END) AS pedidos_atendidos_por_funcionario
FROM 
    clientes c
JOIN 
    pedidos p ON c.cliente_id = p.cliente_id
JOIN 
    funcionarios f ON p.funcionario_id = f.funcionario_id
GROUP BY 
    c.cliente_id, f.nome
HAVING 
    COUNT(p.pedido_id) > 3; 
    
# PARTE 3.13: 

SELECT 
    c.nome AS cliente,
    p.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    pd.data_pedido
FROM 
    itens_pedido ip
JOIN 
    pedidos pd ON ip.pedido_id = pd.pedido_id
JOIN 
    produtos p ON ip.produto_id = p.produto_id
JOIN 
    clientes c ON pd.cliente_id = c.cliente_id
WHERE 
    c.cliente_id = 4
    AND pd.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
ORDER BY 
    pd.data_pedido DESC;
    
# PARTE 3.14: 

SELECT
    p.nome AS produto,
    SUM(ip.preco_unitario * ip.quantidade) AS receita_total
FROM
    produtos p
INNER JOIN itens_pedido ip ON p.produto_id = ip.produto_id
GROUP BY
    p.produto_id, p.nome
ORDER BY
    receita_total DESC
LIMIT 1;

# PARTE 4:

ALTER TABLE fornecedores 
ADD COLUMN telefone VARCHAR(20);

ALTER TABLE funcionarios 
ADD COLUMN cpf VARCHAR(14);

ALTER TABLE clientes 
ADD COLUMN cep VARCHAR(8);
