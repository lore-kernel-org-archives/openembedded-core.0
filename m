Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BB7CCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 17:40:16 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.17])
 by mx.groups.io with SMTP id smtpd.web11.39193.1761586808778800662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 10:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=X+niCXg1;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=X+niCXg1;
 spf=pass (domain: arm.com, ip: 52.101.66.17, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PiuK8JihN8cJVIzJNdCtH6llnEoD3DBK2d6BuhfZwUDajpErpCicEnhLhDYy0BJeVrD0bRGfQQBAi7jg3f+ftlYW2YuFaAsrIii+IDv+abymbnSHbCfKTP+I2RtsuirDl7omaSz58xtHgF34Bvy1zc6GrRyWO1mHIx0KJh7E/dUuooU1fT02PTs23lEqxVRgaZc5ZHzZO4MFzTC48z6vR4Y71jAEUIXZgt/cpk0msdTFxsl2QD9UPcFQ2hAlis/GZmqe88AVLjyd6otWI796WZANiLe6idDoNoFUeOPOnAZrXVzImxjDTASN9PVC0Hu+cLW3a1pe9eXTHW95U8GSaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mmr0dCNbpuXl4hQlL+/BaF8x6CyR2God8T969+KmRxE=;
 b=YQ0f23FjZ9al3GjCw5idEFdWqz4hd4a7AFIyuvLE3hzf6AcNtCV8b9RvwWnQycF8iD7GS+IRpx+0cQma3y3iFzt8ghs8/5y/IAyTdqmMEW0T4FS6Zv0O3F0CiJw9syNZKpqUCSVFYsBlChwLrAsKm10gxHaPPCGiKxJj8cTtmh+Lz8JitBi1YO7sKtgJfaaMbvieBdE/HerKNmNiT1kknBJ7FHJf5nmrv5/DTYbiVUbcq0HWxKTFxIYMMrTmM3o8DSLUtL9XWPMdrxnMc0mk6+X2XSU/H7ncW7QYdci4R8DgOZ3CeWCwT+d+JdmVoaliDqbu/ZfHl6oIxZ5GkcE9PA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=smile.fr smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mmr0dCNbpuXl4hQlL+/BaF8x6CyR2God8T969+KmRxE=;
 b=X+niCXg1Irw6/Qf6dtxp/IHp3QfTp593AxREyWE8BKydxlBlkMwI/POqe/I1cS4TkDxavdMsZ+v/4yA+u2WUF7VdOmIwQkKziIqQWDPTwGgyCydrH0SIV/ZJdRAXmpy6OuzoUAVqAABl9Xt7lbQ7DYeYkWJ/9+B8E83JQsv5Q5E=
Received: from AM0PR07CA0017.eurprd07.prod.outlook.com (2603:10a6:208:ac::30)
 by FRZPR08MB10926.eurprd08.prod.outlook.com (2603:10a6:d10:13d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:40:05 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:208:ac:cafe::c) by AM0PR07CA0017.outlook.office365.com
 (2603:10a6:208:ac::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Mon,
 27 Oct 2025 17:40:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:40:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=de+Oer3HL1M7uCx8pGHlAqocpCOv9+hUFebePJAWogPlghR4k9ApjceZS5vQGZTNa82350B2tdIgO3UNVx3aVZ0XIUoK2LgWe+hh4+5gyfL6bPIFbF4yyKmNfAhD/okSHOuhi8e3226pSNrn8dnUY38aUMSdebKTcka6sVqVJonMI48olhoXlZBCo+bnG1PuGw6lP7zCUmA+7rrpdpi8dvj+ADPskfV64VFoUcf9m0NFSrgSMfE7DD4HP6Y3YplA4k2zR0NN21wzopjJAFT/Z1WawvRxoDS2N3Ffo5syG/7JpkS5ZMsqruNwFy1K2wOqM567i+o+HOS2QpISVnTCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mmr0dCNbpuXl4hQlL+/BaF8x6CyR2God8T969+KmRxE=;
 b=E8OwL+SIIN3YMKa5JgExBjZSQQe/8DGXosCyxEP5SryqFJko5Li2ZPqLGrFyE1OKgjseuV4B5xzCh72LqylgVX9W/YpIMvlJ1OghQ9PtGVTaS5dSk+UwtLPWJlnDzVwuDQvmHdE1E0Z9bKQHUO2e9FGGCUWmrnOdu3sD9SGGbXZrDP6XbIZ1VLGGUsr4pFSm1Y8RyRiAKlkgGxGEj5/dEtu+fahn7Q3cFe2vjjiDpEQYmWfQIrDGcAnscIX59+3bOZKoixHVZM2mB7biJJ9+AtKUhPLLaJ5wZGSsCrFlRU+9t03CD/rRwd3hpJDYoRFQM4519eZH8Zha9MVi0ZgfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mmr0dCNbpuXl4hQlL+/BaF8x6CyR2God8T969+KmRxE=;
 b=X+niCXg1Irw6/Qf6dtxp/IHp3QfTp593AxREyWE8BKydxlBlkMwI/POqe/I1cS4TkDxavdMsZ+v/4yA+u2WUF7VdOmIwQkKziIqQWDPTwGgyCydrH0SIV/ZJdRAXmpy6OuzoUAVqAABl9Xt7lbQ7DYeYkWJ/9+B8E83JQsv5Q5E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10232.eurprd08.prod.outlook.com (2603:10a6:10:49b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:39:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:39:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pierre-loup.gosse@smile.fr" <pierre-loup.gosse@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] u-boot: make initial environment binary image
Thread-Topic: [OE-core] [PATCH] u-boot: make initial environment binary image
Thread-Index: AQHcRLkkowwLkXxvxUWej3Qs/7zyH7TWR9AA
Date: Mon, 27 Oct 2025 17:39:32 +0000
Message-ID: <AEBBFD72-49FE-46DB-A159-3961D1E92D1F@arm.com>
References: <20251024073738.1060583-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20251024073738.1060583-1-pierre-loup.gosse@smile.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10232:EE_|AM3PEPF0000A79B:EE_|FRZPR08MB10926:EE_
X-MS-Office365-Filtering-Correlation-Id: 686d5bb6-3d9b-41ca-11fa-08de157fdd1a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y1VqM1RFNFhtQmt1eitSUUhVd0RiZzRtc2tTejVRMjJReWk2UE8zelk0WThi?=
 =?utf-8?B?cmhDQ0lPaDRHbzBSeXlTMEZkUStQbjdiZks5RjdqRTlvTE10WWRrMFFGWFUr?=
 =?utf-8?B?cERES2padEFpR1VycjVlbkZHZEVGOG4wT0FGZXpoT05BUXdBRndSby9KalRL?=
 =?utf-8?B?ZkwrV2dwWWo1SFYwWDZqcHpzQjVCNGVmQU9VcFNUdmZSU25VT1V6c0NTNzBi?=
 =?utf-8?B?VzJuUG96c2tXR2JKZVRXbHNSQ0p0cFFUR2JyTW82QzFWNHppZERnVGdjRXd0?=
 =?utf-8?B?bGxqL2lNeDY1RHBYaHJHdXArNWd0NjJQMjlHK2IzeEsydVUxa25KNG1LUDU3?=
 =?utf-8?B?SE9PcUtFU2pYdDRKa2owZXBZWmhTRDhBU2d1OFlDaEtieGhGNkVRRnFNdldT?=
 =?utf-8?B?SzhYaTdhc1M1anVsbkxONmZGOVh2MjUrNVhqMEI0VXk5bHNWZ2dMOVZ1MnRv?=
 =?utf-8?B?ejh2bFRXNHpnREw3Z2Y3OTJmZnZucEU0R2srbUNOUEdQdTZ1M3VsektETG8x?=
 =?utf-8?B?bDlROFNqQmk0OUprdFlQSDBWZkNKNDk2QlgxR2ZEYUJtSWtXQThmTWV1d2pv?=
 =?utf-8?B?TCt6eFZwUDJvRTVuRjlqS0tqb09UWlNIYWYwYXZCQldxOU5pS3lwZUQ1NnZs?=
 =?utf-8?B?TlA4Y0JsbVZ2Y0lycURzT284V1VEeDJWVVdBa2hLdm1kQml6L2c2d0VpdXBZ?=
 =?utf-8?B?YldVNTZLR3hNYlA4d2I3MkN6bU5GQll3eXJDcDZkcnhvNkpPVzJnUE9PM0xn?=
 =?utf-8?B?UjY4YURxbDBlU2xUQkowUUV5MlNJdkwyNTZ3UDcwczJsUWh3VERIeVdZWjRa?=
 =?utf-8?B?aEpUUytNY0dVTGxkWVlDZnhMS1JRaUxHYytNWWg1STFkajFjYjl1ckVnZUtG?=
 =?utf-8?B?eThDamYvajN6MloxT1d1eHcvbEI4YUw3REtxQVNlcEY4UDdzcUVqK2ZjbVVT?=
 =?utf-8?B?UjJmbnZpSUlUQ1pWWDVQdlpCRWpnbFp6ZG9DbDN4aHhTM0tKN2U3U3lkcFln?=
 =?utf-8?B?a2VpUFlkZTA5RUZjRlBnK3JhV1ZPQ2oxWW1zUmRoOFoyakhvbUw2UXVjWHNt?=
 =?utf-8?B?THdaK0hKRE1idURicVdmcVgyNmovcktYYmRjV0tNb0pKbnh1a3FXc3JJM0pF?=
 =?utf-8?B?dXRKRXZLVU13ODl5UlFVbVdlWm5rdmJWQ01ac3MwVG43N09ZdVJDOHFHRlVu?=
 =?utf-8?B?cTM3YjJJak1rMzBxWjNna0ZMcjFpVVhXYVltc2tUazFYcy9QdE56c0tlaGdT?=
 =?utf-8?B?V0RrckRPYWJ2eHFpK053enVqc2JmdGlydVZoR04yeXpEZHpHcEllSjY2MDQ5?=
 =?utf-8?B?N1JLRFJVMWVwNDc5ak1rYVlRc1BYeVhjYWh1bFlvL1FLTG1pRW1aczArWE04?=
 =?utf-8?B?MDVlOVNOL2owUTdkL0FGZEUvWStXb0NPR1ExdklTN3JUczkwZGV5TFNUY3Yv?=
 =?utf-8?B?TUw3eXptTXg1WTVRRjJmeTFaUDUrZmt0VUdDZE85SmtMVng5UVJDV21peXU2?=
 =?utf-8?B?dk4vRmY3NWlNUHY3RUljNVJtdnZMZGIvallEWFYzOUpjOFlrVUpyUnVUMUhj?=
 =?utf-8?B?OXlQbzIyQ1pQdksraE53Q2ROVWU3VC9KU29JRkVoT2h2YmNjOUZaZ1pjZXpR?=
 =?utf-8?B?VzAvQVBvRjhUQkYzaEoxN1VUTytOL3VxV0NhQmw3TVFYN3lTaklaOTM0ZHlj?=
 =?utf-8?B?N3FHVWwzK0VDY1FaSDRBRnBQM3pFNGRCa2ZoSnZEME84N3BJbGxZeCtRcXlo?=
 =?utf-8?B?elp2d28zYlFlMDQrakw5dW11cExoVWJwSGNZNDVhdFVjTDZ6d2lCb3d4VDJQ?=
 =?utf-8?B?bDBiR0I0YnplbmZvTCt3Z3kwYlpDMkVkWnhFYWhBa05JWjgyalhxU2RlTzNz?=
 =?utf-8?B?M2FEcms5YkNrWDVrTTcrYnlYeHhkVGkrLzNLUk1NN2VhMGU1cWQ5Ny82YWVh?=
 =?utf-8?B?WFBUakVYWGhnaWxValgrS2xQbkFVczhvOWREY3VlRktTZkhqeEZsMlBtOW40?=
 =?utf-8?B?RndLcW82TFVqNE1tOGdUSEpJb0JtUGlGTEs4VlNuNnRBSkEwZnkrRkFuYWN4?=
 =?utf-8?Q?/xmuXR?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <08E5F808099BC348B299AF51D9A4978D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10232
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e777295b-0941-4941-55c1-08de157fc9c9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|376014|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SjlzYzBRTjd2VTZRWktkN1A1VUd1NE9qaTFVTmNsYjl4VmFOZ1d6VE5tRXps?=
 =?utf-8?B?VlhmSVIxTE9HY2pTT29ZaXd0b1Flc29lNVpGVXNTQ1MyS0RPbmt0dy9hZW1M?=
 =?utf-8?B?dTZOK09vTEVadU9qbVFpRXV4WXFyQld6ZWV5VmhhZkRzZXlLRzlKRHpUbnhI?=
 =?utf-8?B?eUJHMFd1eHdiUHcwVW9tN21oeS9HbFZNNytoZzRXdTVrTGNLN0pQWVZkclRs?=
 =?utf-8?B?TTNwWmhvVG0zREtYMmdOMXQ0NFd2aFc4K0pkaU1GbE1pbkk3eTBzMXhEYWFI?=
 =?utf-8?B?N3haTU4xaW5ORmpLMk5yNUdoRUZEOU9GT3JteS9CZFJuY2VGNUkxaGV5NE9h?=
 =?utf-8?B?dnF6YWwzZ0R5VXZFcklqT0NpLzVxV1d6d0V4SmNNcDZXSWl1ajI2b3Z0ZUpu?=
 =?utf-8?B?anNoUXRRWXVhd1hQRmJrNFRrU1ZxZ2U4ZFJFNWZhS3lhRUJZL2c3OFdNd1Ur?=
 =?utf-8?B?dkdNRU5XTkszOTI1bFZEdmNKcEpDVDM1QXZsdWxPMWJZWjNzZ0ZLUFJadFBP?=
 =?utf-8?B?M3Zsemowd0dhdWd5QXJGTDZVZURIUW11aE9oQnA0czJKa3duSDZhNkNHYnZl?=
 =?utf-8?B?Z1ZhSVJkREt6T1FTM0NtNTAwb2tKc2xyQUVQYzFld2MraWhkRzMzWmlRUlov?=
 =?utf-8?B?Z3B1a1NqWW53MmtuVVROSkZKMnBHd3ZPM0ZqTnIrS3BkOVY2S0FNRTdQWUll?=
 =?utf-8?B?L3VxN2h3VEJzc0krbzV4VzI3dEY4UXVlWXhmVTFnU2lWQXhKWDhSRHpmTERj?=
 =?utf-8?B?c1JuSWhxUkcrNzhOVGRkUjhTSXQ3SGpRVUxKMkIwZDFhWWlyblVQN0RTMmFN?=
 =?utf-8?B?dFFvRlpEQ3Z3akE3b3VzMjNJTWIrRWl3S3FiTXVhT3cvNmhaWStGcEd5dmxm?=
 =?utf-8?B?bUhHY1JwMklNQ1hMOVZVcUhTbGUxTGgwNGVYbXc4R0szRWgrOFhGRzVOQ1pw?=
 =?utf-8?B?NWlhbmpXa0RtcEltVy9hZlU5Ylp1cXBBLzdCdjJwZXZ2WGFWNldZZW43cHJG?=
 =?utf-8?B?dFBVam5rTlcrWEZPUkJGY0dJbnZrKy80Ym1uM2o0QWp5eHNQYm9IVHcyVWFa?=
 =?utf-8?B?a2lRbWdBNENleXNudzZyQTNQUGt3cWpaOEU0QVJQOEtJRDhJWERSNjhoWlVk?=
 =?utf-8?B?SGlKYmdvaWNWZWpnWjFEWWZrTWQ4VVVlQmtjTTFHQjRTS2QvUlhzZUY2UFRK?=
 =?utf-8?B?SHV6ZzFnaW9aRFlPd3M0NkVGRDVYVVlncmRJODVkQWVzc1VWd2RFWUVueTR6?=
 =?utf-8?B?cjdaRGlCUndTWFFlRzl1U1gycGUzdDY3eENhTkxMTmxiTlNhclpCeWVhYVNp?=
 =?utf-8?B?ZU83NjFhOEJBNlpJWWJSeUdBK2FjZ3E3dGhSRXB1eWF1dlE1U2dITzh2N1FI?=
 =?utf-8?B?NWNYNlVhNEFJWkVUdElYUTZwOWtvRlVNd3ViZGJMc1ZsWmZaRGdlelJzTElH?=
 =?utf-8?B?THVWbmFReUk5aUhkVGljSmN3VFdITkRTcW1hUkhVbjJweHVLdXNQMzJnR2Zj?=
 =?utf-8?B?WmpxZnMxSC9hMmZBTnA1cDFsS2hqbFJmZGswSEdQL3VwNGVYOVJISWdVTFJz?=
 =?utf-8?B?Ti9WYXlvRzhKOTF3a2JQY0VqQVRRcHdLMUl3Vk1JcGNNZ2txN2JyVVNDVEMy?=
 =?utf-8?B?a1NDQjF3eUg3ajdDK1IwZ2dMdHBVb2dRVjVZdlQzb3JhSk05dVk5eXFienY3?=
 =?utf-8?B?RWp5ZUNJWUttOVVUSmpiVEVXOHIzdW9CVlUrS0d2TUp6ZUdXem9PQi9oczhz?=
 =?utf-8?B?TENERmtuNG1lWnArYnlObmRrS0RwbWhwZjZVYXQ1dFZWMW52M3hlWVV2ODhS?=
 =?utf-8?B?VnBxbWpZeFpncTY5NDBibUJuU0FLZ0dnVUQ0RHpkV2tvZ1hOZ1ZNek5CWXB2?=
 =?utf-8?B?UkVkZEJtOC9idHBvN09SZE5JeHcyRjQ4N0hBVTM5c3JCM0xmeVRmbXJvNHkv?=
 =?utf-8?B?bzFaREtqUkwzL2srQjk2QjE0Nnc2YlZ2Q1ZnaC9UcTRqQzI4SnQrbGk4MXFU?=
 =?utf-8?B?c2o4S1RKMmVEYXQ2ZUFRd2FZN24wMk11eTFKK200cXBIa1dZdEtQb2g1QkND?=
 =?utf-8?B?UU9mRWxtMXlYeE9tT0p6WVh1dEZlbVFJbkpwYTlpUTNHY0p5Z1E1aFBhQXBZ?=
 =?utf-8?Q?eX9s=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(376014)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:40:04.7195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 686d5bb6-3d9b-41ca-11fa-08de157fdd1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 17:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225343

T24gMjQgT2N0IDIwMjUsIGF0IDA4OjM3LCBQaWVycmUtbG91cCBHT1NTRSB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cGllcnJlLWxvdXAuZ29zc2U9c21pbGUuZnJAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBQaWVycmUtTG91cCBHT1NTRSA8cGllcnJlLWxv
dXAuZ29zc2VAc21pbGUuZnI+DQo+IA0KPiBCdWlsZCB0aGUgVS1Cb290IGluaXRpYWwgZW52aXJv
bm1lbnQgYmluYXJ5IGltYWdlIGlmDQo+IFVCT09UX0lOSVRJQUxfRU5WX0JJTkFSWSBpcyBzZXQg
dG8gIjEiLiBUaGUgZW52aXJvbm1lbnQgcGFydGl0aW9uIHNpemUNCj4gKGluIGJ5dGVzLCBoZXhh
ZGVjaW1hbCBvciBkZWNpbWFsKSBtdXN0IGJlIGRlZmluZWQgdXNpbmcNCj4gVUJPT1RfSU5JVElB
TF9FTlZfQklOQVJZX1NJWkUuDQo+IA0KPiBJZiBVLUJvb3QgZW52aXJvbm1lbnQgcmVkdW5kYW5j
eSBpcyBlbmFibGVkLA0KPiBVQk9PVF9JTklUSUFMX0VOVl9CSU5BUllfUkVEVU5EIG11c3QgYmUg
c2V0IHRvICIxIi4NCj4gDQo+IFRoZSByZXN1bHRpbmcgYmluYXJ5IGNhbiBiZSBmbGFzaGVkIHVz
aW5nIFdJQyBhdCB0aGUgZW52aXJvbm1lbnQgb2Zmc2V0LA0KPiBvdmVycmlkaW5nIGFueSBleGlz
dGluZyBlbnZpcm9ubWVudCBpZiBwcmVzZW50LCBmb3IgZXhhbXBsZToNCj4gDQo+ICBwYXJ0IC0t
c291cmNlIHJhd2NvcHkgLS1zb3VyY2VwYXJhbXM9ImZpbGU9dS1ib290LWluaXRpYWwtZW52LXNk
LmJpbiIgLS1vbmRpc2sgc2RhIC0tbm8tdGFibGUgLS1vZmZzZXQgNDA5Ng0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUGllcnJlLUxvdXAgR09TU0UgPHBpZXJyZS1sb3VwLmdvc3NlQHNtaWxlLmZyPg0K
PiAtLS0NCj4gTm90ZTogT25jZSBtZXJnZWQsIGEgcGF0Y2ggd2l0aCB0aGUgbmV3IHZhcmlhYmxl
cyB3aWxsIGJlIHN1Ym1pdHRlZCB0byB0aGUgDQo+ICAgICAgZG9jdW1lbnRhdGlvbiBtYWlsaW5n
IGxpc3QuDQoNClRoYXTigJlzIGdyZWF0LCBidXQgdGhpcyBpcyBhIG5ldyB2YXJpYWJsZSB3aXRo
b3V0IGFueSB0ZXN0cy4gIENhbiB5b3UgYWxzbyBhZGQgYSB0ZXN0IGNhc2UgdG8gdGhlIHUtYm9v
dCB0ZXN0cyBpbiBtZXRhL2xpYi9vZXFhIHBsZWFzZT8NCg0KVGhhbmtzLA0KUm9zcw0KDQo=

