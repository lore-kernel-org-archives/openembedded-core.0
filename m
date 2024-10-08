Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C35ECEFC34
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 17:09:33 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web11.1171.1728407371226814395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 10:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ur2WK5Jv;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ur2WK5Jv;
 spf=pass (domain: arm.com, ip: 40.107.21.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wiRl7kZ5uTDZkGhX94t7YPMDk5gix9f3BZVPhywvPOS+g32S2uvjHx5jkKX4h/3RqinUGHvmEy+KEQBn1ZNyzzs3Vju9UBRVE+uFGak5FKh3aDsjWgjlU9Q3YsbvyhEMe6ffFU+G6TguMcEDx+vpR6i5ODR7t3HpkofFSBRHxahoPV8J7nNrB9PYMJwGtdN21ztKu4WtX5lb+7OkoATIearz/BbrUDXDr/b7ZJSQw1zyetNlhEzMl9VXcdDTJAcrsF3WJTSZFgWBOTVxfG9adTCS2EVIt9qFULZSFKUf4raaiumvTmTqt9EAMHpFG3ntUV3TR2r8xE+tSWAd74pZYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ji3z7v7FrUrbMq2HB8JaeYOJ8Ws86bHjWU25tqkfRlQ=;
 b=xJeXC3Ov0mZPyq8XiEfZgp8uKEtN1ZYfeHw1TCQXSqIn1hAheiFt2Cebw3h67MjssjPe+bOr8pMn8z8o/HRgi8fTDPvEHcScqzm/evp5dCTMXoq4aT+OcPl5iF/bCSqWyEGWdjm9GUCCrMLOjwfMcrKeQgqEQDuC63KP7bd5qHgx05V8hxYda4tSFbZUoHwd4N9xJvSk6Gn7yOxEiwHXxD4t4448q/XSELE9V29t0h5Uzyg3JIyaCNLmIGR6Fjw4XogsbS8Mh/8xFa6Qh1Sj1suxnxITN2TU5w+ZWYDn0w9ZFUe8b2BC24kU2Tk61uiTxurwNSEs8xnsEcfihpZvfQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji3z7v7FrUrbMq2HB8JaeYOJ8Ws86bHjWU25tqkfRlQ=;
 b=Ur2WK5JvGBFITt/lE9BDnyQMD4sRmYgI9Oqi4w1EdrPBtKku0TRrMSOTpfXnJX501YNzRD4PyVG91YXr691LendP6EpB08Z6LI1v+e4FNNfTdv974AFmCua+XEtMV5deSOWAtI1jQZXQGtYRfmi72lsti3oI7PomR3MC3muKupc=
Received: from AM9P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::28)
 by PAWPR08MB9568.eurprd08.prod.outlook.com (2603:10a6:102:2f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 17:09:25 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::47) by AM9P192CA0023.outlook.office365.com
 (2603:10a6:20b:21d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 17:09:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13
 via Frontend Transport; Tue, 8 Oct 2024 17:09:24 +0000
Received: ("Tessian outbound 994fc319cf83:v473"); Tue, 08 Oct 2024 17:09:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0b6d8ff290d4673e
X-TessianGatewayMetadata: h/Zd9w+yXfWMvsfuu95z6DxMaViI/+Hwi6I4vay3bJt90UCSs0gD8pengeHGDCmtDhn4n8CHpmMPt/wCnBZO+DY60v+7d2fkxXnVOHNo26vQ2/kMz+iHxpsLT98SDbNSZKKcjLZ7uATWWkUva+r6pykaikvNZ4QzZBVjDhdBEy8=
X-CR-MTA-TID: 64aa7808
Received: from Lc8f7e020bf71.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F22FE246-C4E2-4AC0-9506-88F311AF12C6.1;
	Tue, 08 Oct 2024 17:09:18 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lc8f7e020bf71.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Oct 2024 17:09:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/UoLhDq1FQ8sy1pbHNP1LTmbdXz3bHrt7uj1Pktu/L1+tNKvqAEODOmuKQmTZZncEOP6ZgS3ISUCubxJhfIPajRhdNcsQxTeivT2Osj/VoU2WXRRoyxS7NC0UIfX5PsH5/3/bo3hBaGhoqfp8W0aADqlaaN+ACjFKxzkY5tUieWtJRpeNKpBUVkHDqZ7Dz+T2Ywi/2l3zvdj4FymBrMr//9YS4Kj859MgklTQaTE8zaMJi6U5Gp1x5KSCUu91yqCbHVOpdQJ6uRYiWxTi/BFxf346ZZT+qBp33ybiQGKhdAKcrd+4dQdvMqADh9OxrDCnziua6UaGSYTKdJy0V6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ji3z7v7FrUrbMq2HB8JaeYOJ8Ws86bHjWU25tqkfRlQ=;
 b=DinqYm9Cq7RoF81CLODe3BLzwYAugeigWNTNfQ8+uNxEmT7uXqIRYsLC4I6xu7ZLmTmMtRIgskCcGM+JJRz4QO533HolGMInof4peyARSEORY5RtO3AXd0/Lb0AMpQlbHMMATCZ2qn+jNOJHJn36hxd+MWzFD3Q/6fMRUcSXo2BA+EgYh8O/0hBd6PPYKwkvlG8mslZIFYEeJ8OICsIaiUXFNk0tUBUibc7RLvSgL3iuE0D3W/OOv+QSIp41ZGQSP9rKdyDSO0Sctj29YcZc5KUjTuRgTQsCMe6KTwx1yeqH+voxE5oZqT0XeAYjUoIymdhsNCurMzgCzTJ4umZbIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji3z7v7FrUrbMq2HB8JaeYOJ8Ws86bHjWU25tqkfRlQ=;
 b=Ur2WK5JvGBFITt/lE9BDnyQMD4sRmYgI9Oqi4w1EdrPBtKku0TRrMSOTpfXnJX501YNzRD4PyVG91YXr691LendP6EpB08Z6LI1v+e4FNNfTdv974AFmCua+XEtMV5deSOWAtI1jQZXQGtYRfmi72lsti3oI7PomR3MC3muKupc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB11027.eurprd08.prod.outlook.com (2603:10a6:150:1f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 17:09:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 17:09:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 00/11] systemd uki support
Thread-Topic: [OE-core] [PATCH v5 00/11] systemd uki support
Thread-Index: AQHbE9v80cYDC9lbXUOtNI86msIagrJ9IdeA
Date: Tue, 8 Oct 2024 17:09:16 +0000
Message-ID: <3171DB81-B36F-4E01-B65F-346841300E69@arm.com>
References: <20241001082821.26115-1-mikko.rapeli@linaro.org>
In-Reply-To: <20241001082821.26115-1-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB11027:EE_|AM3PEPF00009B9B:EE_|PAWPR08MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e71fbfb-5698-47cc-c1c9-08dce7bbf5e7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?N2p0SGErckFTMU5POERDdUFMSlpDRWdPR3VhbTdjWnFtby9DVnIyejkxbUhj?=
 =?utf-8?B?YzlsdlJqWnRBcy93MzlMbW1vSHoreHVzRElHOVVtRXEwTGs2clo5c0RrQ3hh?=
 =?utf-8?B?NHBtVDJwblBzcU9oTVU5emIvWjVydGdGRXpQNEo4cHc4V1pORmtzQkwwdERT?=
 =?utf-8?B?Ykp0VktKNnZnMG1UNnAwbDk5QTJTSWxFZksvSjUybTQ3Y2dRSVk2UUNJSlhk?=
 =?utf-8?B?V3JrYi9SZUdYQVBqVTFxakhKc1lQdWVoNU1zN2xUOUpoajYrbkRkbGR6MUhB?=
 =?utf-8?B?SDlMQVI3bUNEK29hbFpBaWFWVjJ3NmQwSk51VU5IcWExZlYwSUhjNG9EZERr?=
 =?utf-8?B?cnlMRkxNdU9LV0k4SSsxR0ZGdEw1RXdSU1IwNU4rNzJvREF4TUZTaEFtSlhm?=
 =?utf-8?B?dU1GQ0hQUkI5eU9tN2xxcXd6cUJTTENwWGROay9BYVpKSXFyb2tZZFJOOC9h?=
 =?utf-8?B?TXNqaU4zVFVWTlhBMml0SXNscUFRM01aUnR5YUNNTkJIVVc3aFRBNldaeVpI?=
 =?utf-8?B?cG1OTjJ0djdySHJZeHo2SXY4TFYvc0N6SUhCSUxwRElEaDRxY2xoa092aU5m?=
 =?utf-8?B?U01aUE05MmZLdHdwWkJCbWZ3Lys0UUxKU2lubTZjNU9XaVptbDBVMk1hbksy?=
 =?utf-8?B?eEE0STRlK3VNZ2dOK01sekdLeW8xci83Q3YvTEtxZUFHT2FLT0tqWGpRVXJS?=
 =?utf-8?B?K083WWk4TFJEMmxLZ2FPNEFpQ3FjcGVUd3FMTXVLWkVJa3k3Q29MbmNzcjdm?=
 =?utf-8?B?bHBsalhqaDljaWpBOGZiVm51Sm15aTlDWmhWVE0zYXZTbFBZb2pXZGpxK1hM?=
 =?utf-8?B?ZERocjVEV3JXUkE1aU9tVHNxU09zU0xHemMyOW96bmVJUXVyTDU3V1ZKTTY1?=
 =?utf-8?B?UXlKWXNsNlZtcENsMm9XRGx2aXdnYXZQYVBtLy9UMFlkT2x0WG9xQVJyenRD?=
 =?utf-8?B?R1lCa1NKVjkrNUNVVFRoeng2cmMvUkxOZzhoL1RzZ2tGNlJFTGxLTG5uY2Q2?=
 =?utf-8?B?eXd1YXEra25sWlk4aEJycWtRTHE1NnZ4MitJZG1oMzdyanRteDZOcEE0WGdF?=
 =?utf-8?B?dWwzQW4rMTdFcWlYY2tpY3hPT3d0NlJLdHdZa3JGSldDU1RjcXBnbjBONjlO?=
 =?utf-8?B?b3FHTHBYeUNJM05UWXdKZUhzeUZZdmNhOXREWElMVHJQckZsSjFOcFNzMGpI?=
 =?utf-8?B?eWZIZ3VUVmh6NTlhVlJJV0NSc3JINmNQcTk5SS9Oa1liYVl6cXVaMEI5dkFU?=
 =?utf-8?B?UytDTTQwWERtN2VRZGVEWHZCQWlzb2NLNU5vY2twdlZuUFlJbFZwS1AwYjF4?=
 =?utf-8?B?WnYvajgxMXRuSjlaaUJCOW5ValoyT3IwVGdRQk1kRU84blc5aDB0emIrWThy?=
 =?utf-8?B?RWtId3B3ZEdudmUyTENQRlBJTUY5ZlZNWGh0dkRyS2pGaktzN1FpcFR5N054?=
 =?utf-8?B?VFlmaGRxSytYcmRqTW9USXRGRXVhSHdmYmlpQkMrd1lKa2Z1QkI4akFyZXNn?=
 =?utf-8?B?T2xkVjlWZkpNczlZek1uWUpKbDBMQi9VVGJUelBtNFJZNFFodytzckQ0UC95?=
 =?utf-8?B?NVFjN3lTYUlGQVQ2MFJ0MXVPRGtyMEFWb1hoejVhR2NxWEt0V21LY2M0Y0J5?=
 =?utf-8?B?TTUxY0d2UStHTVlRNEhEZjZ1bDJoYm9jRmQ2UkVXYW15ZVNRVWdWejkrTDRU?=
 =?utf-8?B?TWtoSkFUbzJudlA2bGFXdDZOL29MUHlBazZ3TlBVZ01IbitBU2ttK3VmbnU4?=
 =?utf-8?B?cnpKQVVwd2tmaFZNMDc5dFdDc3pIUEI3QVhBKzNHUU5JMCtkd0xFcEg1NmJw?=
 =?utf-8?B?WGdIWTgxU3FRS05ZbnJOdz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B07BBFFEC3E5247BFC60964C858CEFA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11027
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4575923e-cdc8-4d33-032c-08dce7bbf0ba
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QVRLQXRBVk9qN1FHY0lHVGdicTd6NGN2L0FrdGlkMENaSmtMS1VHcDZZK0RK?=
 =?utf-8?B?U3J4aWttNWpiUjA0a2NxcWNMY2dDMENuenRWaUlpa0Zpbzlqb2dHNDNpa0RV?=
 =?utf-8?B?UG56cmd2cldaanlUand5c2VNYzdBcUZ4WDVMQUhLcEs1Rk5RTVhRQ2pVbTZV?=
 =?utf-8?B?K2hJMGtFMmNqaGZWSTc1OWgyYnlobFcxZmE1VkRFaUt6Yk50THhkblRaTGFw?=
 =?utf-8?B?MFpNOXJadHN1V01GUTdpYjdWNTk3ajVrZStOemRJV2hNTG13dUZxL3lKTSs4?=
 =?utf-8?B?TDBxMkREdFZHb2gzeVdUS0E0MEFiU1VPc1VRTFJsODk5RGowbGs1ak9ObFNN?=
 =?utf-8?B?b0l6Z2ZvVmo1bUk2d3ZHcnhtWFgxTC94blZCbzkvcVM2QVJLdzQ4LzJuQlUv?=
 =?utf-8?B?d084WWpGck9FOXJmV05tWnJPZEZ0clNEeWJkWGsyaHQ1dmN5YXBjVVNacHhZ?=
 =?utf-8?B?NHBqK1QwR2Y2T0cvN09qUFFNM2M5VnROM29vbldqQi9ialVqelRIV05VZjFV?=
 =?utf-8?B?Um1qcDAwRnd4S1NmWnR4THd3cENzMWRnTVd1ek1iK1I1Y20wR2dzTmZ2SUFM?=
 =?utf-8?B?MGtaZEkraXdjSzUzTVhmeGROQm03cjRzaUV3Z0xHZEUzZDI3N0kwSnFGbERB?=
 =?utf-8?B?b0tIQVBlYmd1ZjFOR1Qvd3hwdTJUekhVTzhPMTV6NXNyY09oVjVLSkJoY0ZL?=
 =?utf-8?B?TFlpT2FTUjQvQ2J4T0dvekJOdlRuRWt3MHhxQjFOTXV5T1FxdVBRZGxOdW50?=
 =?utf-8?B?R0FCWFhmdXRIQm5ieTU5TnYxeENtZFBOcGNFaGNkd0dBMlFndm5SL0tLWkF5?=
 =?utf-8?B?MDFjNVF3bEtYL1Q2dGYrZFpPS29PTmt3ZVE5RnI2ODRSWXkwbHdVTjMydWRI?=
 =?utf-8?B?RUZxd0VmdDBkUFVQRCtMVzdXd0QzbUJaY0RWTWU0U1N5Y2xVR0YxZXV6c2ow?=
 =?utf-8?B?MmNVRlJxNGZvZ2xlckRrdTUzbXY4Nk0rRWdySVpBdjBTUUFROXZnZWRHUy9B?=
 =?utf-8?B?YWsvMTNrMklKaXF3UGFpcjlzK3YwaXpiTFh0ZkRsZUhRNUVzNENuUzBFdTZr?=
 =?utf-8?B?YnFNcGF2U0JsNzdSSTMvUnVKRFkxZ01CblZHcm9EZkdDSWVmcTNBenZEcmYw?=
 =?utf-8?B?a25QUkFtQjVyR2d3YTB2N2ROTExxc0cyUkRJRVlPditBR1FZM2t2UHdjZXFa?=
 =?utf-8?B?M2xNakFjR1kzTkwydVpjRDRCYkxxTm1DZ0xqcktjLzJVamlUa0FjU1JYaVFF?=
 =?utf-8?B?dHRxem56UEM0NnBqck1kTVpYQjU4bWxZV21HVDVBTU9JaUQwWGtNcnNJWm9C?=
 =?utf-8?B?WDVFbFl2cVBjRkRvcEpvR2pLa0w0aHlEckw4Yy9wUGd5ZXFBU3BYRGtEREw3?=
 =?utf-8?B?Tys0dFUwdXpPYmwxdWwwVThsTEtnR1pKdjQ3Skl1bkJ5cXk1WjJ1Y1lDNUhu?=
 =?utf-8?B?aHBicE02MkI5TFp3SjEzdkdGSGJZNmVPZVpjK09XdlVWK1NxMkwwQTFTZ2NE?=
 =?utf-8?B?Uk5IZWQ5SW0vQ0Z5RkRZNVNua3hqWTVuNkw0T1BMQVhQbDV2RDI1UnpoZ0Zu?=
 =?utf-8?B?TEEwSWpUOVJ1TGJhL0RvR055dVpRVlBna0ZZL2ZXK3NVQ2g5YWgyQWRiMnpo?=
 =?utf-8?B?UzVWWHUvVkxBenJhRUlrU3ZHNjVFQ0NBSms1RGNLTzBQL0hNMm1TQVByc2Vz?=
 =?utf-8?B?WHI0KzRRZEdRdlVhTHVNdTQ2NmlwU2gyZHowUExBNStTelgzakN1M2ZRTW83?=
 =?utf-8?B?cG5CL2xlNUQxbXZrZlhZYUJMR2x5bHNYM0ZOSXNLRG9BNmlOZ3JvbThxUklY?=
 =?utf-8?B?ejVLdkFERXJCdE1LemZLL3VGa3RsUjVBSWhxVnpVL0JnbSt2N3lRNXdYU0ZX?=
 =?utf-8?Q?QAUgJJiXJ5Jyh?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:09:24.9806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e71fbfb-5698-47cc-c1c9-08dce7bbf5e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9568
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 17:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205299

T24gMSBPY3QgMjAyNCwgYXQgMDk6MjgsIE1pa2tvIFJhcGVsaSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8bWlra28ucmFwZWxpPWxpbmFyby5vcmdAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IFRoZXNlIGNoYW5nZXMgZW5hYmxlIGJ1aWxkaW5nIHN5c3RlbWQgdWtpIGltYWdl
cyB3aGljaCBjb21iaW5lDQo+IGtlcm5lbCwga2VybmVsIGNvbW1hbmQgbGluZSwgaW5pdHJkIGFu
ZCBwb3NzaWJseSBzaWduYXR1cmVzIHRvDQo+IGEgc2luZ2xlIFVFRkkgYmluYXJ5LiBUaGlzIGJp
bmFyeSBjYW4gYmUgYm9vdGVkIHdpdGggVUVGSSBmaXJtd2FyZQ0KPiBhbmQgc3lzdGVtZC1ib290
LiBObyBncnViIGlzIG5lZWRlZCBhbmQgVUVGSSBmaXJtd2FyZSBhbmQvb3INCj4gc3lzdGVtZC1i
b290IHByb3ZpZGUgcG9zc2liaWxpdGllcyBmb3IgYm9vdCBtZW51cy4NCj4gVGhlIHVraSBiaW5h
cnkgY2FuIGFsc28gYmUgc2lnbmVkIGZvciBVRUZJIHNlY3VyZSBib290DQo+IHNvIHRoZSBzZWN1
cmUgYm9vdCBleHRlbmRzIGZyb20gZmlybXdhcmUgdG8ga2VybmVsIGFuZCBpbml0cmQuDQo+IEJp
bmRpbmcgc2VjdXJlIGJvb3QgdG8gZnVsbCB1c2Vyc3BhY2UgaXMgdGhlbiBlYXNpZXIgc2luY2Ug
Zm9yIGV4YW1wbGUNCj4ga2VybmVsIGNvbW1hbmQgbGluZSBhbmQgaW5pdHJkIGNvbnRhaW4gdGhl
IHN1cHBvcnQgbmVlZGVkIHRvIG1vdW50DQo+IGVuY3J5cHRlZCBkbS12ZXJpdHkgZXRjIHBhcnRp
dGlvbnMsIGFuZC9vciBjcmVhdGUgcGFydGl0aW9ucyBvbiBkZW1hbmQNCj4gd2l0aCBzeXN0ZW1k
LXJlcGFydCB1c2luZyBkZXZpY2Ugc3BlY2lmaWMgVFBNIGRldmljZXMgZm9yIGVuY3J5cHRpb24u
DQoNClNvbWV0aGluZyBpbiBoZXJlIGJyZWFrcyBhIHdpYy9lZmkgaW1hZ2Ugd2hlbiBJIGRvbuKA
mXQgdG91Y2ggYW55dGhpbmcgZWxzZS4gIGVnIGdlbmVyaWNhcm02NCB3aXRoIHN5c3RlbWQ6DQoN
ClUtQm9vdCAyMDI0LjA3IChKdWwgMDEgMjAyNCAtIDE4OjA3OjE4ICswMDAwKQ0KDQpEUkFNOiAg
MjU2IE1pQg0KQ29yZTogIDUxIGRldmljZXMsIDE0IHVjbGFzc2VzLCBkZXZpY2V0cmVlOiBib2Fy
ZA0KRmxhc2g6IDY0IE1pQg0KTG9hZGluZyBFbnZpcm9ubWVudCBmcm9tIEZsYXNoLi4uICoqKiBX
YXJuaW5nIC0gYmFkIENSQywgdXNpbmcgZGVmYXVsdCBlbnZpcm9ubWVudA0KDQpJbjogICAgc2Vy
aWFsLHVzYmtiZA0KT3V0OiAgIHNlcmlhbCx2aWRjb25zb2xlDQpFcnI6ICAgc2VyaWFsLHZpZGNv
bnNvbGUNCk5vIFVTQiBjb250cm9sbGVycyBmb3VuZA0KTmV0OiAgIGV0aDA6IHZpcnRpby1uZXQj
MzINCg0Kc3RhcnRpbmcgVVNCLi4uDQpObyBVU0IgY29udHJvbGxlcnMgZm91bmQNCkhpdCBhbnkg
a2V5IHRvIHN0b3AgYXV0b2Jvb3Q6ICAwDQpTY2FubmluZyBmb3IgYm9vdGZsb3dzIGluIGFsbCBi
b290ZGV2cw0KU2VxICBNZXRob2QgICAgICAgU3RhdGUgICBVY2xhc3MgICAgUGFydCAgTmFtZSAg
ICAgICAgICAgICAgICAgICAgICBGaWxlbmFtZQ0KLS0tICAtLS0tLS0tLS0tLSAgLS0tLS0tICAt
LS0tLS0tLSAgLS0tLSAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAtLS0tLS0tLS0tLS0tLS0t
DQpTY2FubmluZyBnbG9iYWwgYm9vdG1ldGggJ2VmaV9tZ3InOg0KTm8gRUZJIHN5c3RlbSBwYXJ0
aXRpb24NCk5vIEVGSSBzeXN0ZW0gcGFydGl0aW9uDQpGYWlsZWQgdG8gcGVyc2lzdCBFRkkgdmFy
aWFibGVzDQpObyBFRkkgc3lzdGVtIHBhcnRpdGlvbg0KRmFpbGVkIHRvIHBlcnNpc3QgRUZJIHZh
cmlhYmxlcw0KTm8gRUZJIHN5c3RlbSBwYXJ0aXRpb24NCkZhaWxlZCB0byBwZXJzaXN0IEVGSSB2
YXJpYWJsZXMNCk1pc3NpbmcgVFBNdjIgZGV2aWNlIGZvciBFRklfVENHX1BST1RPQ09MDQogIDAg
IGVmaV9tZ3IgICAgICByZWFkeSAgIChub25lKSAgICAgICAwICA8TlVMTD4NCioqIEJvb3Rpbmcg
Ym9vdGZsb3cgJzxOVUxMPicgd2l0aCBlZmlfbWdyDQpCb290aW5nOiB2aXJ0aW8gMA0KTm8gbG9h
ZGVyIGZvdW5kLiBDb25maWd1cmF0aW9uIGZpbGVzIGluIFxsb2FkZXJcZW50cmllc1wqLmNvbmYg
YXJlIG5lZWRlZC4NCg0KTG9va3MgbGlrZSB0aGUgL2Jvb3QgcGFydGl0aW9uIGRvZXNu4oCZdCBo
YXZlIHdoYXQgaXQgc2hvdWxkIGluLg0KDQpSb3Nz

