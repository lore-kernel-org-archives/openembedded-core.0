Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52995C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 15:21:34 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.28])
 by mx.groups.io with SMTP id smtpd.web11.43908.1753111293178564916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 08:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=e8PjqfKm;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=e8PjqfKm;
 spf=pass (domain: arm.com, ip: 52.101.66.28, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=txT6hP4as08j0UE83pJzgAD7JEPuhApsKDuPYTDHiGMBHbqLwcoNIIhQFAiYQFR68gsyhrzMVyUraAFd2rRG4suaXB6ukMnhaAhXBrvGrlJNP1Kg+Rj7ZTxvjqOG99Xk9FbKBAYxza1xCXhMdS+oxxmOGjk3LRezkcs/84s4m7NVyy00m5VA7XL9Owfwgz6GFMeNP3/2vFU/rtPUHOo6KVn7F7BlcLHznrzU0glI+ts1u/tQMfmgZMlgM0quS6l1T8PjkQjchVymhEQbEg24ETDtmsSIYV6qpbHR2Yzxt+4cNDJxD19IyFvpPku7OqSdKFMliT6HSBSdEcTqEieF1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzhlavIpFqGFD1BECF1OK//X6yQ7gLD4bCqWxRXPo9Y=;
 b=O6eUpF/3CXdwTqlvJSSE3Cdywu7SGTj895VbSMp7dXVQzgDZN7eoTBcXblhYtJQUw/OxkFJgNKrKPIOa8PY1X+2pIcASR5swFqaR/GEHsHYD+R3Eg/TaD6Okc6jvPHbdGPCNoz82bNs8ENmO5yksVu+w/rG3E2wr0N64nQMpvK4UKTz+H4CmIOo+Y5NryzvO89/pwi3kIKll4Y4vMas+J9q5jBgQjB7pBnM7LCZRk1aGIntm0PQhHFGQ1shZVO5rwB0WHgpXdLp0RwXQWpzxzMi/Ut5B3exMZkxONvTNXIHEHXHXuQz0OuW8ZM9JKKvos3XOnh/L/cpATW1roeHlqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzhlavIpFqGFD1BECF1OK//X6yQ7gLD4bCqWxRXPo9Y=;
 b=e8PjqfKm/YgP9OUpL5T9YHzT6oW5ENEt1HX+rsVC26pdBwmNMWx8ql7LkyIlZxjGMTyzr3uVPRFvjTyX+HWTdfmS1el5SF0ipYYR9+BaJd31xeS0lQhFu6SRCXCRy28N9FIpEdP3FF76r/kaqB4nGzZFF8qAAP4RUBA7Mn7GAGQ=
Received: from DB8PR06CA0048.eurprd06.prod.outlook.com (2603:10a6:10:120::22)
 by PAVPR08MB9307.eurprd08.prod.outlook.com (2603:10a6:102:304::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 21 Jul
 2025 15:21:29 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::c6) by DB8PR06CA0048.outlook.office365.com
 (2603:10a6:10:120::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 15:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 15:21:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwucgdK/S08NP2V0Kp2ePTzrx5+esulDC2efNWfmLueD6csKwaTS6GCi7fmiZ9KpXjUq8wDQXS6gkHcE76fhwmbkIguNwdlcgerh8RpoCV65NKL0JSL5WlY7vTFsnC4dnjBGKbmU6uvw6QLDxLpukTyl8lB7vKsxEvRTh30kWWxzB6eSPFh7GhKLl1zUo1JH3HNbcuHDxrtTn5OfemnAhPek/jJmelQQva8ol5o6zXI8jTRfV3YDfPNov8lmhMjIbDtM37HDLttwX5tRT4PdBW9oME42aNZcvsA8FHMNAS1t5VUj7YUCXA0ihWHwnCQF2s/l8cdwRTg6nm/SKJXc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzhlavIpFqGFD1BECF1OK//X6yQ7gLD4bCqWxRXPo9Y=;
 b=G0XexAR2vttK4VaZHjOICgejeDxUtTnq1Hv+L9VWIkeKER0xS7AOHeh/X1Y7iBfpIjctmyohlHp70SjU26j8yntLi5musAlcgpNJUZwb9h47Ub0N5eZamwz3TJ6TIloayRq2O9J/eHwhET8I+mwYoM9/09Zvub8QNV7XPsCIHIS6UbAEir93rajU4tL5mNlqOdHOz4nClnD+Bqm6aBAOU6eO7HoDpSxx8k5t41p7VqnSQYGveQVwREm6oO4LK3I5WxHO0oXtD276njT//DhhUBo+LP8Q/sKqKFqKCFC2G3QUi2Ml+xMdE3SZeKhXQj3C6P77utG16Un9qoSvFs4WuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzhlavIpFqGFD1BECF1OK//X6yQ7gLD4bCqWxRXPo9Y=;
 b=e8PjqfKm/YgP9OUpL5T9YHzT6oW5ENEt1HX+rsVC26pdBwmNMWx8ql7LkyIlZxjGMTyzr3uVPRFvjTyX+HWTdfmS1el5SF0ipYYR9+BaJd31xeS0lQhFu6SRCXCRy28N9FIpEdP3FF76r/kaqB4nGzZFF8qAAP4RUBA7Mn7GAGQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10432.eurprd08.prod.outlook.com (2603:10a6:150:14f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 15:20:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 15:20:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/3] cmake: drop CCACHE_COMPILERCHECK
Thread-Topic: [OE-core] [PATCH v2 1/3] cmake: drop CCACHE_COMPILERCHECK
Thread-Index: AQHb9/YZ4sZr76TI30mfd8ByNLY7Y7Q4rJ8AgAQJfwA=
Date: Mon, 21 Jul 2025 15:20:52 +0000
Message-ID: <D04BB559-D95D-4B2A-B69F-BE43CDC4F299@arm.com>
References: <20250718151017.3153315-1-ross.burton@arm.com>
 <CAMKF1so=FcHd4ioR6POqTc7VvK-LAxEpndWZBohomnqKtQtZFA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so=FcHd4ioR6POqTc7VvK-LAxEpndWZBohomnqKtQtZFA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10432:EE_|DU6PEPF0000B61E:EE_|PAVPR08MB9307:EE_
X-MS-Office365-Filtering-Correlation-Id: f73bc7ae-d1a3-4199-aba6-08ddc86a4443
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SkdYQlNHeWg2b2E2WHVjQ01EZnRMRFJZK29GWFNjUU83UVNDWU5wM0V2YzZW?=
 =?utf-8?B?S21RUG5jMkd6eE5JTW5FZmZ0NDA3bjRrSS9aZzN6K2hBOVQ4S29sVjloQ3pK?=
 =?utf-8?B?Y1hsakt6eUpqazE1NEt1anExWGgxTkhXKzFNOXdDeGVQWHJzclpxRmltVXE2?=
 =?utf-8?B?UUxicW10Qzd0QllHcm9IeDBmS3VzRzhiemFQZTU0dGlURUFtRTV3bklkWnE5?=
 =?utf-8?B?dElYdFJMTFZzaUZRbzZCdWZrVUF3c1ZwRTdTOVppUTlzamFzY0N1K1pVWlR3?=
 =?utf-8?B?Z1RqUjFQZnI2bDQrQkZKVUFuTmVMOStvSzc0RmNJNllJOTNDcWt5VGY3TmNF?=
 =?utf-8?B?czlsSGFiL2R0UldQYUxEbFZKVFZBSEowanRLZit5cXVWVVVZanJQeGVUa1Q3?=
 =?utf-8?B?anZaN055RjlXclZPeXNYRiswSWExOGRodDBTZXpOV1ZZWTUyOFZQTGpiQUIw?=
 =?utf-8?B?c2Jza21KRWR6NlpKVjBDZWYwazRQQkF1ZUZWeUNHYUV0YW5OaW9JbEpjdzFt?=
 =?utf-8?B?Z2pBTVRjUEtpUWw0NHd2UU1GeHo0MWwrUERHTTVORjBiS0ZIaG9IUUZXeW5S?=
 =?utf-8?B?RnR0S01kOW93MlY0cEEwR2NwYUk1ZFA3NHZjZndOQjcxZlFRRUN3NEY0WE9C?=
 =?utf-8?B?Z3JPeFRUb3liR24ybVlQNTQ2NnJiTUxzYWZuL0xrc3Y2emdrVy9XV0dZeDg3?=
 =?utf-8?B?em1PeHVGWEkrLzJ4V3hKQm5ZOG1pcUFKQm1BZmw4L0didXdyZGl0U2ZVcHMw?=
 =?utf-8?B?dHdudjNkbkdYWGRXeXFGT0NwWFpCNGpVd3hkbUNsRE42UCtYaldseEhhenJX?=
 =?utf-8?B?eEM2L1p6bkhqQUJETXI5T2xRTXV4RUYwR0U5MlhSMWhDNHlUbk0rTzQwQkZW?=
 =?utf-8?B?dzZwWHJoNURTOG5TbE96cW90bUZkSi9oelpkVzRQdFh5bjBRUk1Tci93ZEFI?=
 =?utf-8?B?dDBpak5OU1U3d0c0SkExNUlPaitESFdFQzRaaEtpZGRzeTdtQlF4aHJxNEI1?=
 =?utf-8?B?ZGd2a0I1NWhsZmZ5Nk5pRGY5VzFqN1RlOXM2RGVJM25DbU1Pcy82WDY5RkZp?=
 =?utf-8?B?TEJVSjk1VnBwbzVKZzhOZjByTEFCbUE4OWJNZFlYY2p4em1Vdnc1S2VycHJ0?=
 =?utf-8?B?MnRqcFNaSUNwb0hmZVpONEVYWWRnZDF4Z3dNNFo2elY5eFlzRUh3ZDdWM25H?=
 =?utf-8?B?KzdGUFgvSDhFTTd2T1hSMVoyQitZYlBWZWxlNTZJUWtHNmwyS2RSVDA3Q0lO?=
 =?utf-8?B?enp0MXRXSW0vWksxWVpVRnhMaGdXbmhKWXBmTUZNSUNTWFRMbjRUYXZqejFF?=
 =?utf-8?B?WE1NcG1yMUJjQ0E4UmJ4UmhrbkFESWpNZlJjamNsMWJYMTA3NituZnhJcnVD?=
 =?utf-8?B?cDg4QlJXYXhXc3ZYWGhMbGx1STFUTnV0MnFoOHFjTUo1ci9LWjd0UWQ4bFoz?=
 =?utf-8?B?Ti9oR25lZERDc1NkY3RjWk1NYVRYVnEwWXBrUk1Rd3FuR2NUeTkzL2tHeXVu?=
 =?utf-8?B?a3JUQjdhR25INjV5eUM1cjM2cVNIaEZSU3RudWNsTUNQYnppUEtxb210a1RK?=
 =?utf-8?B?bjJPaENSc2R3MnhpYVBKdjZNdzRRcTFVNkltU2pMTnp3djk2QU1IQUhVWWIz?=
 =?utf-8?B?ZXdyOXJHa1BpTDNWeXVXbUxFMWtMWUhXaUlpVXh5QzhvRXNHVitKZmpWUmFy?=
 =?utf-8?B?MDYybUFmNUFBUGZkZlVIby9yNXUvL04wQXZNQnIwRThHRXdZei9xNnhHaEhP?=
 =?utf-8?B?eFpETFNzN0V3WC8xSGc2dWY2L2NEejNSeXN5YzhFTUNtdnJGMXlIK1VWSkRB?=
 =?utf-8?B?VnhiUjF4NmcyT25SUFk2RktrZ2FmaXhiZUtaekRYT1VHOFVjOWViKzRFSk5a?=
 =?utf-8?B?MXZxQkpoZ2FYak16aW1UUzNVZ0R0eCsyVExON04wYXpxUGJ3MlZxTUFVeTRZ?=
 =?utf-8?B?YnVxRjdxRFZDZjdwa3k2NDB1Tk1qNnFwYmM0SHlPeEIvK1R4MngzMDFsT2FD?=
 =?utf-8?B?eEt0aytxSXJnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <256E840FA8C1BB48A8C47A5D2D082340@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10432
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5e2174e9-b886-47f0-5d7d-08ddc86a2e94
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|35042699022|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MW1XaDhBNjR2UG5QajM5Y3NmWFJ3MDd4SVVnaEVFcmJUYWFkbDVUK2ZhU3l0?=
 =?utf-8?B?Wit2MUw3Vm9LcXJwN0NtQ0psR0lQanRCWGJJSG5mWlQ2REVmaUIwS3I3TDhZ?=
 =?utf-8?B?QVZDdlhUdXpnMzk1K2lZKzVXN2tNaHlXY3JOYzd5MHpNbEpNeWNFOFJKM1A1?=
 =?utf-8?B?Mll0T2t2ZkNWb043Wm5QbWZCRCszRng1OEFQanFHNTVpQnRYcDQ0aXlpeEhF?=
 =?utf-8?B?anNXSW10MzI5WWN4UjRrRktiY2ZUcExEb2hiVjFDRFREWUh5ZldTTlgwZ0xK?=
 =?utf-8?B?UVF0WC92QU1YTGZwb05IbktDTmZSRzE3R1dxL2ZwVHRyUWRVMHJSam1EcDFL?=
 =?utf-8?B?UUN1djFnOUtyVXRqNnhIRWQ0d0hDSk5EVStrL2t5cnh5VWRKTko1VHVPR3R1?=
 =?utf-8?B?UzNSRE9jN3VhS2pjbVV1QmQ1L1FCam1vS0dlVjFUY1BFVkNBN1ZqSjFPTVhK?=
 =?utf-8?B?TU43dU5CeXlCMEd1TDhxSURQN04zME5ZM1lxK1l2cERwbTYrS2pnSDhqRU84?=
 =?utf-8?B?eWI0TllFUkJsajJOY3FOcGE2OTRSc3lQaEM1K0ZveUYrdURBNGV2NGVmQk00?=
 =?utf-8?B?RmZPb0N2dUdnQUtkZThkaUJwUjhZbGl6VnAyVVJwcFdpVEZFTW5PemdhTkJS?=
 =?utf-8?B?bytNKzJpYUJBWDNiM0NjbEpERXVaQU0wS1hLMEFCZHgrZ21JYmdQMkVmeHpF?=
 =?utf-8?B?cDJ1cUZVWE9FSlFHU0xmMkRtWjlJM3NaTjZZZnhDcWJxM2liSk1MRGErZUZO?=
 =?utf-8?B?M3MyNXJJbXBzSXJDQlU4akFVa0VjT09lc2dEUWxPNHdJbkppK3FHUGhaSWR3?=
 =?utf-8?B?cVdQZFNRWHQ0QUVUYyt1dk5RcW9DZFBKNCt2SHVybWg3ZXFUZTVjTHFkNk5K?=
 =?utf-8?B?M0tOQkNDa1YwRytSeFpzWUZURUduRERpZHBFcHZZNDdUSktKd3pmOGhYMHlY?=
 =?utf-8?B?dldueVZkMkQ3NHllNGRaMGF1NG4veCtHVlF4TjlYTUZQcjh3clM1aUlYMGs0?=
 =?utf-8?B?cVBXUU9TTElJbCtCdDZ3L1JDanpVSklINE5lYTJSQXZXemZWUkUrNE5VR1pC?=
 =?utf-8?B?cDdrbVlyRHNGTXg3UnZCV0pVSEtDUzN3Wk8xZk5GNUluWWkrejJqWU5tL2E5?=
 =?utf-8?B?MXliNklhaHlKKzIxcGFOZS9vMjhsMG9JNDRQYTBpSW5ZQVR6aXM1RHBlSmkz?=
 =?utf-8?B?RHRjOXozRUZPT09pZ1RiZEVQNDRubjRzd2k2S1FpRHBMU21XV2U0M3NoN1ox?=
 =?utf-8?B?NnpkaGFUWGhvbTNLTmpxUFdhSyttcDFRUkcrdkhMYTFXS1pYMWNnY3lNcWdi?=
 =?utf-8?B?QjAxVjhTdlVoREorZ0RvdHk0VkxpY04zVHNSbG9lcnU3MmZPUzZRU2tvazBP?=
 =?utf-8?B?VFQzTkdnVnZlM2k2dEtBOGZMbzJDU0dnNHJ1bW5vdTZScnVHNjNRVHFSemFJ?=
 =?utf-8?B?SE5UZHNveThGWFl3S1V2WEV2cmVmRmNNNEo0ekYzb09zeENyYVp1ajlDZi9n?=
 =?utf-8?B?WTVYRVN5TzBjVEY0TXIwb0RVZ0ZaeFNGM3kweVR0Ky8vRExQNVpaQ1FiV3V6?=
 =?utf-8?B?R01OOXlmdTdWcnE1cGp5UnhSK0kyTEsySFVNTi9FaVFUdnBacTlqUjVKN1J4?=
 =?utf-8?B?VjVZa0RMTFRCSFhxa1lTLzJPUlBCV1NmUWpvMW1DWU03MC9iaGJnM1htdUwx?=
 =?utf-8?B?UWEzdkRtUUwrMG1Fc1BlZXJDdnJyR29LWVh4M2lLZnJ3VmIxZngyNnRNNkpU?=
 =?utf-8?B?SjBSVVdWUXRSeTltZXhSUm8rMnRTWVExcG8zRlIybWZCazdGdjkrZHM4VkxN?=
 =?utf-8?B?dUltem54VlZUbURwT01OL3MvcHE3NGdFQ1VQaGRHSEgvbW9hYzcycklMcGo3?=
 =?utf-8?B?bURmZ3JpQ0xIUlBZZXpMbmxoYXNwRlVxM2lEQy9oek1DQm1zdXlWRU5tS3FE?=
 =?utf-8?B?bTFsRTQ5Q1VCSEJhdlFjdGdoN1VyVkpvWGdPcGw5Tk9pcituT1JoQUFIdnJM?=
 =?utf-8?B?Z3IvVXZqRmZDbS9Od25SRnEwYktubHM4OGw1ZWJvYVV4ZkdZM0d4SmFlaDQ3?=
 =?utf-8?Q?0ZHdFQ?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(35042699022)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 15:21:29.3390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f73bc7ae-d1a3-4199-aba6-08ddc86a4443
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9307
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 15:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220701

T24gMTkgSnVsIDIwMjUsIGF0IDAyOjQxLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IE9uIEZyaSwgSnVsIDE4LCAyMDI1IGF0IDg6MTDigK9BTSBSb3NzIEJ1cnRv
biB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IA0KPj4gVGhpcyB2YXJpYWJsZSBjb250cm9s
cyBob3cgY2NhY2hlIGRldGVybWluZXMgaWYgdGhlIGNhY2hlIGlzIHZhbGlkIG9yIG5vdA0KPj4g
Zm9yIGEgZ2l2ZW4gY29tcGlsZXIuDQo+PiANCj4+IEJ5IGRlZmF1bHQsIGNjYWNoZSBsb29rcyBh
dCB0aGUgbXRpbWUgb2YgdGhlIGNvbXBpbGVyIGJpbmFyeS4NCj4+IA0KPiANCj4gdGhpcyBtYXkg
YmVjb21lIGludGVyZXN0aW5nIHdoZW4gY29tcGlsZXIgYmluYXJ5IGlzIHVzZWQgZnJvbSBzc3Rh
dGUNCj4gYnVpbHQgb24gYW5vdGhlciBtYWNoaW5lLCBpdCBtaWdodCBiZSBpZGVudGljYWwgYmlu
YXJ5DQo+IGJ1dCBtdGltZSBtYXliZSBkaWZmZXJlbnQuDQoNCkkgd2FzIGhhdmluZyB0aGVzZSB0
aG91Z2h0cyBhZnRlciBwb3N0aW5nIHRvby4NCg0KSSBfdGhpbmtfIHRoZSBtdGltZXMgYXJlIHBy
ZXNlcnZlZCBzbyByZXVzZWQgc3N0YXRlIHNob3VsZCBzdGlsbCBiZSBpZGVudGljYWwgbXRpbWVz
Lg0KDQpSb3Nz

