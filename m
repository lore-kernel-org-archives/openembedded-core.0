Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F377AD2CE17
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 10:59:36 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web10.12059.1729767571804475646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 03:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=a2qox8j9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=a2qox8j9;
 spf=pass (domain: arm.com, ip: 40.107.21.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=na4R0VEdkTB0K3WFpouC3fSEy0BAV/yquwvntz1zScLHt2dApY0rAX/Q8VpJpJeLWvsLVle75CZ13jhlpoDQ3CAzFzOcddm723P+TF0f+J8beDAQtVWBKOWGoyg4vHO1HHeCRbmqOhD2wNuXpMerObKgCQZTMzwna23wldLyh5Br1TmkTJ0CWTEMtP33/gUVLUSO+nFFxr6FX/s3kEjRpqLLVNzK+xXWJ0omdDEwe4ru9K8RMJXYuQn41cNrOJA/JkquT76rCt3R8wKdpIqzwrzZs9v/dCtXxcRfaAY5MZDXpajXMlSi6DfYxfVFJp6B4Q9evXwCioIEKAFg3eDbaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBsisnLN9nckqDac3KxWCbbenBdHMavWXBzFM4vLH7o=;
 b=AtJR4JcQTpenMCioaH2xKvuIjqZRwOL/Xuyfs8a5FYvnoy7EWOdjSR+hgH2pvzQ/opDS14MAq48IxdJ+ni4GKH+RqfnBxrvsix9sPgPif0XPXvOuUq57wERk48X4K+RgbtNl6Iq0fzlgZGiV86O6Lw92kL986OZLLrfaTL1SwkOXQb3qXVp5U/jOMYTFMHzLnI/eYbm2AmLyjtC/fFa+DxRQ0PWbRWF9hET+y1Rnj077cUvzPGoZDNtn1ObP1fS7vO9msTJ8KB+lWnjuHZ1T9S9VqFs9YTnBGnT6PfhSaA0gCJj3RV6nw6k5emnInpfYdZs8dZRHMUhM+4gInWoANg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBsisnLN9nckqDac3KxWCbbenBdHMavWXBzFM4vLH7o=;
 b=a2qox8j9UmtW1CqdOKR8IWYkhVDlrbvClUGv+nmXGtCSUrBL/j2W3LxVk3uJd9jPXIqa83ep2WSsh/KZhLBR8Pqp5iR2679jzLC+lh37btTaYfrqWQFbP+ZutHwvg/VpeaJqrEy3UEQCIvzov7gnc+f9/e/c0SHws1QwvrWe8ZU=
Received: from DB3PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:8::48) by
 DB9PR08MB7723.eurprd08.prod.outlook.com (2603:10a6:10:392::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.17; Thu, 24 Oct 2024 10:59:27 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::b6) by DB3PR08CA0035.outlook.office365.com
 (2603:10a6:8::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26 via Frontend
 Transport; Thu, 24 Oct 2024 10:59:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Thu, 24 Oct 2024 10:59:27 +0000
Received: ("Tessian outbound 373849c2df5a:v490"); Thu, 24 Oct 2024 10:59:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1fe8acbd93e7c301
X-TessianGatewayMetadata: hkLd+Xx7EbRNtgoTswWAgJVOfSVfCs9wbSvaeD3tzN5VV/Af7PYyptJ71xbYBPxYX9ERtD46HDKqMOgJc8GNxdHugK/VFQ6KnUKO5oEnAM3/1nodPEmTu+7K6keDEPU0oN5Ek8QrqdK3aKDqONgSNKjlq5b1jtzYYH0wd4rDiU0=
X-CR-MTA-TID: 64aa7808
Received: from Leb1992f63f62.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2AFD0BE7-D9B4-45D9-A22C-02357A98B766.1;
	Thu, 24 Oct 2024 10:59:20 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Leb1992f63f62.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Oct 2024 10:59:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKXZM8Rxwk7KIuBeh7BmBpq6A41pGQn2yyVbzZ7x290/L75hP7wns2W8r7JWhBEuNar4T9lDjLNihF9wgWlezL6wR0FHOs88T9FsDVqOtxxtd6J8I/LbyVdfiZXEw/Y5FnKtllCEO5y/7yPYh8NR4b2YDM8OYHxkYrv3HgALS7rgcBPeRYd9KtT3L+XQhJiV7aAqsZCQ/UxzwJ+ajvD+mYCpvbNaoUXTXLn5repFyUkw9PfxCiUR05uCREXxwVqvOWpf2xdzUXV1yAoDUNEwkG4FipQ8CKNGur7GlsF2oKcZ/U9cDWgNPB0JLfqeddMldnpG47K55ar/Ld5CgEGTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBsisnLN9nckqDac3KxWCbbenBdHMavWXBzFM4vLH7o=;
 b=HJGhXFT+x+yihSNQ2BZSX/CyOQzJ5kJjC55OHjpZkjDYY8TbQHVMaNPSC9HDaGwte3jfSdgO2eaLLYdVRhl0nD81NzhoYE0P2WcOZXUWX6nu++XaI6X2ERU+oIb3I5E2f/cmz/JEw8lfBrbrFRv+7NpdXIknM42cAQPCMMd7IXIR9MEftPAYNwMlbfZokvc3WH3sIhRj+mpk6ZFjdE5UGBh+Jn8bs2Fc9VM8iw+vrBeOywUNAadVSkV2y3p5UsRNxBIVP7YLDB3+6jZaQD43+e/K0jjGdMr7mGshYCnbBb41zu3l5ni/uQWOI8s+D8oStm/mk1q4+Dh/jWj128wYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBsisnLN9nckqDac3KxWCbbenBdHMavWXBzFM4vLH7o=;
 b=a2qox8j9UmtW1CqdOKR8IWYkhVDlrbvClUGv+nmXGtCSUrBL/j2W3LxVk3uJd9jPXIqa83ep2WSsh/KZhLBR8Pqp5iR2679jzLC+lh37btTaYfrqWQFbP+ZutHwvg/VpeaJqrEy3UEQCIvzov7gnc+f9/e/c0SHws1QwvrWe8ZU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6372.eurprd08.prod.outlook.com (2603:10a6:20b:369::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 10:59:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 10:59:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liu.ming50@gmail.com" <liu.ming50@gmail.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2 1/2] toolchain-shar-extract.sh: check
 required tool before extracting SDK
Thread-Topic: [OE-core] [PATCH V2 1/2] toolchain-shar-extract.sh: check
 required tool before extracting SDK
Thread-Index: AQHbJV3o6F3Wl1ojGkulwJmC9nVaL7KVvMKA
Date: Thu, 24 Oct 2024 10:59:17 +0000
Message-ID: <E55625D9-E305-463B-B7C4-4E75B41A8646@arm.com>
References: <20241023151127.3611757-1-liu.ming50@gmail.com>
In-Reply-To: <20241023151127.3611757-1-liu.ming50@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6372:EE_|DB5PEPF00014B8C:EE_|DB9PR08MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 708ce978-c610-49ba-5f9a-08dcf41aed77
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Z3hLMUNNRkR5M3BzOGFsVFppUDMrdkJLcmNnSlRDTU11bWxLSXJ4M3ZCSjBE?=
 =?utf-8?B?Tko4TVFNWnJpdjBHRzRiRlA4ZlIzYTBDZEZuQVNreW45VDIxbURkYkt3bExh?=
 =?utf-8?B?UDcwVEtWMGtla3g5MXFiaUMvbitEdVQ5UGd0SUJ4RWlyLzB0VytUOVpwaElV?=
 =?utf-8?B?QVZnUDNQOEFKN0ZGc3d4RXVoOVp1SzB5VlZLU1NlVGEwQmVNSGJrWFMxNTNS?=
 =?utf-8?B?N0QxdGJiWERYa1VpYVplUzluOUpqOVU3YmFLb3hjTVYyZ1BFS0FVVVpaZUlz?=
 =?utf-8?B?OFdIMWtoalRYaEY4WnVqQnJvYU5kL0JvNTkwdWt1Y0JaQWdibG9MSVZYZDZx?=
 =?utf-8?B?SUlxYW9qRmhTd0NYSldZTXE2b0grTWRkNFVJK0RZdkhZT0RVV3cyb1hEODhT?=
 =?utf-8?B?SzlLSFdwRkl0dk1hRXU0bm1xOE01YWdXamVaWDN5T3V6S1Nsdm1LcEpFcXB1?=
 =?utf-8?B?SGJVYkNwa0x1Q0o3Y3lZVUR5VkgxN0Nrd3N6eDNjRFlGSUZZK2Fzak1DNHd0?=
 =?utf-8?B?S2VhZHJDeUcyeTlPOUR0ZzZFbEdBaXREOGhjMlZxdmtFd2lhRW1MZzdZL0lS?=
 =?utf-8?B?YlFwN2crbFdNYWVkQnZmZUh1ODZTQWtvamlFYkMrazRydG1xMjRqblJGUWx0?=
 =?utf-8?B?MDVPUGRNRzcwNDJUZnZlanVDU0NIbFdLQWNrVjVpSk9vNEpibEdaS0hDVGN0?=
 =?utf-8?B?ZElFNk0rMzF0ME9FaHFYd2ExbzNGTUN5NmVGdnc4aHlZYklRZHdyZmNlazJX?=
 =?utf-8?B?U2JaRHdjd2dEV3RFSlhLVUg2WjF4TURrVVJHc3RWSVJ0eDhZdll4NkNTQzB0?=
 =?utf-8?B?cnJiM01NRFlJWjlLU3VyNTk3TVNlRE5TZDdtOVpyQlV3aDA1SjdqV3pPQWwr?=
 =?utf-8?B?OGIyeExCQW1UTlk0ZUk1OUhOM0FlODBTcTdGR0lGc1dodU5JS09KL1IyZFhT?=
 =?utf-8?B?TlM2TGVRV2J4R1dmajE3TFBtYytlbDN6a1dQUHkzaW5TQmdXV1JnMW9ISlVJ?=
 =?utf-8?B?OHhNbUFwNytNRktMOTBTbndHcUc1RXF0T3AwbHNsdDY2ZGk4cW5BNEpvV1kz?=
 =?utf-8?B?ZS91Z29mK0JiK3puWnhnMWM2T1hSMDRZcExxZGgyb1hvTW9SZC95Z201VjdE?=
 =?utf-8?B?Rk5JSmxtNy9JZ1R0MlJsZWJvV0JBcktBS3hHOS8wQ0VSaTBDM3BnaXdmUS85?=
 =?utf-8?B?OWl6MW1pUmVjL3BCR0Z1MTFCdFREaGVxU0xBcUVGR2JKS0xRWlBMN1Y5eDF1?=
 =?utf-8?B?RU5DWmpaTmFVSVNFTVhYMHFTTkFweUVGVjlrT0dJdUM0Tndpbk4rd1ROY2xH?=
 =?utf-8?B?azZ1M1Y0WkpuUFZwd1RJTkZxU0VUOXprMlpCaXQ3TlJ5NVlzYk1adFNyQ3Na?=
 =?utf-8?B?R2VaY1pzTjF3cjlMcjRPc09XMCtFWlVobW5velp2V015TDVKV0ppQWY0TVlx?=
 =?utf-8?B?RDgzdkJlZlV6S3NVZjZDR1RMZEJXWGlVT2Y3WUI2NHVGdzl2SGcvbkI5dVdT?=
 =?utf-8?B?Q2kwc3pLODcvK1F3RmM5TGpjWWdPdkJLci9STVN4V2NJR1U0NjIwRCt4ZFhV?=
 =?utf-8?B?Q3IyOWZMTEV2M1luYWtBR3NUS0JCNFZDTGRQejIwa05mZklpL1B6bEtKajcw?=
 =?utf-8?B?SmZPTk1FQ0d6SzVXUWttdWc1ZVdsZmxZamRxU1RodWxIamtSNUFVRGVhcVNK?=
 =?utf-8?B?Q0EvaFZYb3FWNy9pUzEzZUM3OEl5eDlLQ0V0bHFpZzVLVUUrTnpDRENsKzZJ?=
 =?utf-8?Q?buKSDt4D9wUNPLuRLd5Y+Xjxs6YJj31YPOVuZtT?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <918E15922DEF44498FA743C56BD7DBC7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6372
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6aad4f3a-de15-4cac-0ca5-08dcf41ae806
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UW0xSU9LbFRYdTR4SGpLZXU5NTN6OFpTWnQwc2hTQWNKTGN1MWdvNUFsMUZN?=
 =?utf-8?B?cGowOGhWeS9KZ0hkbGE1aHJrdWtOdTBOWHlCQkJFNDZXcWxRT29HZlFKb2tG?=
 =?utf-8?B?K2oydkdiSC9SdHlBUUx6UmtYVnRrem5xZldybStjaEpIdEFXMEh5UjlFaVAv?=
 =?utf-8?B?V3dmWGtoQ0JoK1JURDcyYUliSUtjUGJWeTVkSEZmdEVpaGFvZkZJUkZJSFc1?=
 =?utf-8?B?Si9YYWRrUlFacmp3czZFTzQ0MWlLWERUMVdNZTlsK0pKdytPbEtaSmt5dW1y?=
 =?utf-8?B?WTkweDZ1cTFjZEM2ckt4WUhaVDdsMkNHdUNKQmRTOW9nN3pZS3owSTJFdHVG?=
 =?utf-8?B?NlZzcnJyYkJMdXpDck1sSTdyUjRZVEtxcnFrWXo0UnJlK25qaUt4QzZKZEdS?=
 =?utf-8?B?ZXBxaDcxZGlqZHRvUWN1enBsNmtBMFRpM0ppVFlWemh0YzBEb3dJck1WSWRo?=
 =?utf-8?B?ZHJIWkR6bkszUUptWnVrbFhlUUJQUFU0NC9hUk9CdW5HRU5qTTRURitOQ1hY?=
 =?utf-8?B?KzJ5WEJ1V3VYbEVUTlo5Y0IvWVZiSTdkRGtGQ1N3eUtidTQyWkpQOXJLNVZ0?=
 =?utf-8?B?S081ZjZLblN4b3diWFUxdDlmREZjWUhoSXROUG9wdzR2VTg1TFUvc1hnSEY3?=
 =?utf-8?B?cHU4WXJnMFU0MkJRVHAzZ2hkYjhteUhXdHlnRXBQUVB5dlo4cWpvd1NycFg4?=
 =?utf-8?B?VHlUUWJabi9VWlNaZzJWVU9ZemE3dWdadUYxNWVZcXdEYnFzVGsyNUtDUTNn?=
 =?utf-8?B?VE5wMFlmL0NDQy9UdVJKWXhzcmtDQVFqakN1Mm4wR3QyM0hWMUh2TWVzSm92?=
 =?utf-8?B?emIxdjg0S2VpVVBnUDNsWnpWZmhvZExVZWluTnNNcUVaTFo4OEJ6OS9mZCtJ?=
 =?utf-8?B?amJmUExGQkppeDdTdyt1a0s2enk1b0ZYdXBLaHhUWkxsUDlSUSs4SWdLUW1P?=
 =?utf-8?B?K2hRdXV1N2IwR3Z4bDFCMTZqam1Xa3V2Y2gwMG9aLzdZVXdJUmdEWm5LdHZp?=
 =?utf-8?B?bzFHbm45VTROQWdFSTVKK2pMUUxKSFhtalh0c2lWRXhZeUQ2czByWWRQc0pP?=
 =?utf-8?B?L3hWV1B2L1F4WTk1cnFLa2MyZnV5UldBODZoSFBkSzZCQjBodDIwZVRBbCsw?=
 =?utf-8?B?RkJ3Y253UFBEU2JOZDhIMjQxRms2Q3Fla21hU05RRUxqK1FkeUR5OEF6WWov?=
 =?utf-8?B?V2diV2syTVlGT3NhOFRUR3NOZlFWa2RvRmM0NG16WGRzeXM5OEhnYXZYemQr?=
 =?utf-8?B?ZndWZ1NnK1pYRjhGUGlTeDdDMnU4L01PckUwcWlRWjhoVmhZQmp4dDIrUzE3?=
 =?utf-8?B?a0QrU1lDNWxWeEIzcVd2ZUw0MzVrN25KTWxPd0VWanFOUWt5TlJtcFZ0Zm5r?=
 =?utf-8?B?d3lZNk91am15V3ZJSWo1WTNmcG1uSFkxbVVTdGZQeHBkMW5aUytlQmFHdDRJ?=
 =?utf-8?B?TmlOdkVWNGxyTm1nWWRzWW50VjhYL0hpaDZOTU8raEQ5L1B5SWp2MGk3WlpU?=
 =?utf-8?B?cEdqN3E0b0lDT0pJdW5YTjgyZE5jNmRXMURPMVRWMkIyYmZpRjMyeXBNMnN2?=
 =?utf-8?B?YkpOclpiblNsTzU5YUtTN3J0L2dlTHR5SkVwZTFYbzliMHNMQ3V5RTMvVW9v?=
 =?utf-8?B?Ym5FZFM3Q2Z1SiswRy85U0loaTB2OEI2WWFKOTBkVmJOZEFqU2t2ZkhLNkN5?=
 =?utf-8?B?c3JRbEFWcnRYWEdkODVCMDFGVjdIYW90VUxDaExEdUJWRFcwZUdRemFwQlc0?=
 =?utf-8?B?VEJzWTZmVDIvL1lYdVcvWkgrNlFKZnBZbFZud3FsVFIwMDkvelY5K3R5NFFJ?=
 =?utf-8?Q?y3e2BZWmh0XvbvpLD5iSX7hFa/A8vkmsmaizw=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 10:59:27.0118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 708ce978-c610-49ba-5f9a-08dcf41aed77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7723
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 10:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206287

T24gMjMgT2N0IDIwMjQsIGF0IDE2OjExLCBNaW5nIExpdSB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8bGl1Lm1pbmc1MD1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBUbyBleHRyYWN0IHRoZSBTREsgYXJjaGl2ZSwgdGhlIHByb3BlciB0b29scyBuZWVk
IHRvIGJlIHByZXNlbnQgb24NCj4gc3lzdGVtLCBjaGVjayB1bnppcCBmb3IgemlwIGFyY2hpdmUg
dHlwZSwgY2hlY2sgeHogZm9yIHRhci54eiBhcmNoaXZlDQo+IHR5cGUuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBNaW5nIExpdSA8bGl1Lm1pbmc1MEBnbWFpbC5jb20+DQo+IC0tLQ0KPiBtZXRhL2Zp
bGVzL3Rvb2xjaGFpbi1zaGFyLWV4dHJhY3Quc2ggfCA4ICsrKysrKysrDQo+IDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2ZpbGVzL3Rvb2xj
aGFpbi1zaGFyLWV4dHJhY3Quc2ggYi9tZXRhL2ZpbGVzL3Rvb2xjaGFpbi1zaGFyLWV4dHJhY3Qu
c2gNCj4gaW5kZXggM2I0NjQ3ZmNhNy4uOWI3MjQ5OWNjZiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9m
aWxlcy90b29sY2hhaW4tc2hhci1leHRyYWN0LnNoDQo+ICsrKyBiL21ldGEvZmlsZXMvdG9vbGNo
YWluLXNoYXItZXh0cmFjdC5zaA0KPiBAQCAtMjQ1LDYgKzI0NSwxMCBAQCBmaQ0KPiANCj4gcHJp
bnRmICJFeHRyYWN0aW5nIFNESy4uLiINCj4gaWYgWyBAU0RLX0FSQ0hJVkVfVFlQRUAgPSAiemlw
IiBdOyB0aGVuDQo+ICsgICAgaWYgWyAteiAiJCh3aGljaCB1bnppcCkiIF07IHRoZW4NCj4gKyAg
ICAgICAgZWNobyAiQWJvcnRlZCwgdW56aXAgaXMgcmVxdWlyZWQgdG8gZXh0cmFjdCB0aGUgU0RL
IGFyY2hpdmUsIHBsZWFzZSBtYWtlIHN1cmUgaXQncyBpbnN0YWxsZWQgb24geW91ciBzeXN0ZW0h
Ig0KPiArICAgICAgICBleGl0IDENCj4gKyAgICBmaQ0KDQpVbmZvcnR1bmF0ZWx5IOKAmHdoaWNo
4oCZIGlzIG5vdCBQT1NJWCBvciBldmVuIHVuaXZlcnNhbGx5IGluc3RhbGxlZCBvbiBMaW51eCBz
eXN0ZW1zLg0KDQpodHRwczovL2h5bmVrLm1lL3RpbC93aGljaC1ub3QtcG9zaXgvDQoNClVzaW5n
IGNvbW1hbmQgLXYgaXMgdGhlIHBvcnRhYmxlIGFsdGVybmF0aXZlLg0KDQpSb3NzDQoNCg==

