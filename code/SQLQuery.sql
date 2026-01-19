create database credit_card_db;
use credit_card_db

CREATE TABLE [staging_table] (
	[merchant_name] varchar(255),
	[merch_long] decimal(28,7),
	[merch_lat] decimal(28,7),
	[long] decimal(28,7),
	[lat] decimal(28,7),
	[last_name] varchar(255),
	[job] varchar(255),
	[is_fraud] bit,
	[gender] varchar(1),
	[first_name] varchar(255),
	[dob] datetime,
	[city] varchar(255),
	[category] varchar(255),
	[amount] real,
	[trans_date_trans_time] datetime,
	[state] varchar(255)
);

CREATE TABLE dim_cardholder (
	cardholder_id INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
	[name] VARCHAR(255),
	gender BIT,  -- 1 for Male, 0 for Female
	city VARCHAR(255),
	[state] VARCHAR(255),
	job VARCHAR(255),
	dob DATETIME
);

CREATE TABLE dim_datetime (
	datetime_id INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
	[hour] INT,
	[day] INT,
	day_of_week INT,
	[month] INT,
	[quarter] INT,
	[year] INT
);

CREATE TABLE dim_category (
	category_id INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
	category VARCHAR(255) UNIQUE NOT NULL  -- Natural key, enforce uniqueness
);

CREATE TABLE dim_merchant (
	merchant_id INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
	merchant_name VARCHAR(255) UNIQUE NOT NULL  -- Natural key, enforce uniqueness
);

CREATE TABLE fact_transaction (
	transaction_id BIGINT IDENTITY(1,1) PRIMARY KEY,  -- Using the original transaction ID as the primary key
	datetime_id INT,
	category_id INT,
	merchant_id INT,
	cardholder_id INT,
	amount REAL,
	distance REAL,
	is_fraud BIT,
	FOREIGN KEY (datetime_id) REFERENCES dim_datetime(datetime_id),
	FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
	FOREIGN KEY (merchant_id) REFERENCES dim_merchant(merchant_id),
	FOREIGN KEY (cardholder_id) REFERENCES dim_cardholder(cardholder_id),
);













