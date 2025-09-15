Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DA8CAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 09:45:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.59])
 by mx.groups.io with SMTP id smtpd.web11.28778.1757929551079182654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 02:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iaMo6umI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iaMo6umI;
 spf=pass (domain: arm.com, ip: 52.101.83.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VeBnXnovEPWvqIqEgVv1s/6inGzRQoxAkSkjWfl51pDRmgV9I4i9MLdqJ5pvWlG07XJ2svQwBIQVCOZTHG9xv44R3qQMeCZLEGo0rr5JqaD0qh21C60ucxk/7j+f8Y3hE6h0Gidi0Tfj7t5eJR6KjKKvyS98MGu5DzH2iRU7jrnh+NDGV/IqpWEgmhyF5Np1UY8gyfHkVxbshVxcqBnJXf1AcXTOOP0g4pcisaDXybkkQ/uhwpLISotj2c4mSAs13WLuHgM+wG1wv+aDx2oOmQtYEyEpBwMOrSm8Jbrav6c/aCG1UZQf123Nl7l1Ll/qQEjDNPEXqEcIho9vMbMpQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DvDLn4TZM2gzIgaCw0YIaF0gK7QK6o3PQX+voVfygg=;
 b=PYQJH+jMQWJYwy8yVC9SlPFElQ5boVLZQmL745wvhsNI1W4ImAapPKfnn7wLhI3YpnZEmVm21I9GfbROpll7pVwPMaeSgWmzhFzsd8/69eCoUvfyevS1iAqihfHTW40OdwDcjOczZPDHaddRzIjzgzd9tG49MpdBbtikVbfFroroocUXZ2hWS97NVQ7Q1cbaHrhLgLSTcZqmxL2c5HSxJhD1Hkrp2UQI0FKe/fZIR9V9ax8lRe1IuldjRoFQSRkCnkrEzJo4tFAFNHIW5G0N0/ZFwF8aR8rushHavrevX5N6TJ+gJHQIYX/waGBl4/zSYMJFJBLB1FhwR47VjFGy7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DvDLn4TZM2gzIgaCw0YIaF0gK7QK6o3PQX+voVfygg=;
 b=iaMo6umIqiQrLihyCtLUPZLAGdMHup4Ea1rhjF4doMC/Oy3N0s96LP6kCqLuu35U9JxKtGnJ0o7hT4FV5Rse3Dxvg0I/sQa0OE9/HRZHVboJqQz0BM5//ZOXSU4Xf8CJUZWszOTuQD7CiEZSGaFay5ADgS5535+vD+z7FM7s76w=
Received: from AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::26)
 by DBBPR08MB6010.eurprd08.prod.outlook.com (2603:10a6:10:20a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 09:45:45 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:208:17c:cafe::2a) by AM0PR10CA0016.outlook.office365.com
 (2603:10a6:208:17c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.20 via Frontend Transport; Mon,
 15 Sep 2025 09:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 15 Sep 2025 09:45:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gA+Z/s7cQfY91tzEBsqiAE85cHp1/kvcKNEr+JMQxLL413BY6DP7g+7yihFuhscMcUvGWmWyLNlJx0Y6OMZGUD816ZDn7BrZUAe1QPHEqdKxTzqu+B02Ackc6Z90cphYv0VMYsEfyHItG2R/14HoSGfXEZxcdtV8agQsHwPoVRNfmZVWbLAn8NIFmigVjT8uc0w+4Awvj086HhKLz9p8I5Gm4Jd+abiz9EXAoIew4YZFVMCIOfxHZpkD1bUr1iHWDRo8sNnpG29RGHrT1f3Hw5Ul+ISjcENHzPNQ4aqZ0cNQyRaoMVCPfD+UZBkW0WRETeux1qvXXGiJD7oBaWuRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DvDLn4TZM2gzIgaCw0YIaF0gK7QK6o3PQX+voVfygg=;
 b=EvTdBiEm0cf3GVisENzMMJFUSULEsvQbbRdgRIOZjUkhIVX9HvRNiXIekLVtlev6A+BMmXd7krW9f2JK7oude7besWj8uMC7hs0nz/NKSaTMAEW/vBTtFJLuoj1LBSbVI6Zweep4JIVumRkVrj9eThhgL4JKOl1t+2jNsW3PqNR/CudFGrz1KHFP2hjiSq+pDqS3fSqDeqrhgWQI9vPHEtv4ElZ1f/N/VU6/1XtXAgQKMHHAgNYCHlpsKmoHPcBKtbVGduVWiBG4Ynqar5pD5nNK0wFmpZkOiF83ZVT8hF++a6Tgo1mS7Nruewp8v1UsA/WigMDNihZLlVvB0HYvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DvDLn4TZM2gzIgaCw0YIaF0gK7QK6o3PQX+voVfygg=;
 b=iaMo6umIqiQrLihyCtLUPZLAGdMHup4Ea1rhjF4doMC/Oy3N0s96LP6kCqLuu35U9JxKtGnJ0o7hT4FV5Rse3Dxvg0I/sQa0OE9/HRZHVboJqQz0BM5//ZOXSU4Xf8CJUZWszOTuQD7CiEZSGaFay5ADgS5535+vD+z7FM7s76w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6132.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 09:45:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 09:45:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/6] clang: improve opt-viewer PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH v2 1/6] clang: improve opt-viewer PACKAGECONFIG
Thread-Index: AQHcJXwitrxkt8yKjkS4pP3PPUTsNrSTtuiAgABI7IA=
Date: Mon, 15 Sep 2025 09:45:10 +0000
Message-ID: <2ED94C84-624D-4885-85FC-2441F74A4AC3@arm.com>
References: <20250914133258.2625735-1-ross.burton@arm.com>
 <CAMKF1sonXyyzKUeSDeYjZXieBxmYsUNBaawDsk45QDmn-=JawA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sonXyyzKUeSDeYjZXieBxmYsUNBaawDsk45QDmn-=JawA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6132:EE_|AM3PEPF0000A796:EE_|DBBPR08MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a758f8-e37e-4bf2-0ee3-08ddf43ca352
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?c2VRRFZKZ1NIUUJYS1M3ZDlGUWtrRGgrK0V0bUtPbzdsYncrdTI2bWYyWk9k?=
 =?utf-8?B?WVFBaGJiM1dDVWdENnZXc1plRHp2cy9ZbHp4cjlVZmM0Q2duMTY3Q2dwZm95?=
 =?utf-8?B?VnMwL0hvZ3JWcS9pTVdMVEVVL2JVNldLdjFiNVFsZHJST3RNVGpmRjBZSVFo?=
 =?utf-8?B?LzNCY1FUa1hubjNFZzMxMjNhcExIQnBFVFJHSXNvLzdIL1UrRFJ0NTBaTENa?=
 =?utf-8?B?VDFSWXhCeFNlMnlYVnI1NnZ0bisrQlZCWEFiVFJTVVNIWWhDbjdEaFJRSEFk?=
 =?utf-8?B?UzVaWFo0czBDQWh4c28xbXQ2T1k3UkFpK0ZFQ3BVM0ZwdUZremFOc3JXaGM1?=
 =?utf-8?B?STQwM0RlNXliSkFVNkE1MkJJa2Z5M1F0blh6OVpzdEJRVFZsMGhTTWhieFZZ?=
 =?utf-8?B?WjNQNEFCRVlnNURwWDJ6bXdLZDBKOHlzaEF3OW1EclV1NVp0SFNpVmdoY2wx?=
 =?utf-8?B?akMrano1YlVjMnNqMW81RXFtL2YzQy9qTms4SnE2MVBZbTZWQmZORXFYN0tW?=
 =?utf-8?B?eDF1alpmK295aWNST0JFY0RzNUFKOUJxWWhTdXR5TDVsRHpacFIwdnVDcWhP?=
 =?utf-8?B?dENqWm1NTnUvdy9CVXVOV2Z1d2VzWlJTVE9rd2Jid1VsOC9YVEpkSDR5VHdL?=
 =?utf-8?B?WjlBWUFrTXUvbDgzZk10engxbFRMUktMNzFSK29MTTlmckdtWWJQMWh6eVhs?=
 =?utf-8?B?UCsyU2hSMnU3Sm9uNlh3aTNHZno3dERNUy9jaGdlVVBIUkR2cE9UOXdzY0Q5?=
 =?utf-8?B?TXBNc1BlS1JmaG9JQTYwVzdtVkR5UERDb0ErNXV1NTRXUDdLUUc3Vm9Ddkwv?=
 =?utf-8?B?cEoyR3VwbHE4czU4N1BWUmVnc0FWTEh6Y3JpOS9GSHJqdVFNZ2t0RlR2dUY3?=
 =?utf-8?B?S3B6QnlFMUZEaWE3R0x1S3YwMW9tVi9GdUhwMW1mQk0rOFZaenNTOWQ5ZTFh?=
 =?utf-8?B?WXV1ZWNidXYrOWVDVzBFNk9oL1V1LzJsakpHc1VVN0NDRTB0bWNodHFITU83?=
 =?utf-8?B?MGk5UmVsZmk1SURMeHV1bGFPbnJadDhxaDhBSkxpU2JiVTZGWHNZcUFMT3Iz?=
 =?utf-8?B?ek8wNlJuRUIyTEhZWFlwbCtYNHJnUkhRTThjNE8wemx5aENqRmlUb3JvVEk4?=
 =?utf-8?B?QlBueitTL2FEYjVUOXMyWHM0U3YwYlVKU3hHV3Njb1VhblhDQzBaMWMrQWhY?=
 =?utf-8?B?eDNFU1RwYmJldHoyZDJIbEpoSkJBOXNidnlMT25XRnhSZDRDTEh2STdoVjdi?=
 =?utf-8?B?eVdlOWkyUC9aQVVtTEgydUJRWUhxbFpwQ1pCcVQySGhrV1dRSkFUOU5EOUdo?=
 =?utf-8?B?Z0xJTHNPcTVIeEE4Z0dPL0wxS1NlTG5rT3ZYeHZMc2o4dkY4TkVwNkdUS2R5?=
 =?utf-8?B?MXg5ejZkRUtqMFJ6QlhOSDJZSG5UU0pJMFU1OG1idEt1ejcvN2x4SmlIc1A0?=
 =?utf-8?B?VmdTa0IvM0NZRk94MVZFdEk0OEdocEw3M3lXK2RzUk9xWllzT3E3bXQ3ZThK?=
 =?utf-8?B?QTdRN0QvSXV6M3F2eWkvOVZLd1JPRVNzcUw3bi83b0JRenhHYVZVVHcvOXdi?=
 =?utf-8?B?cktpVTJJY25xdFVBb21xQ3NaY2F6cysyS1Vpb3JYVm82S3JTbG5pcGxKRnRL?=
 =?utf-8?B?OWJ4WXh0WVdtVHh1MVh1S2Q0N2lGTTlxSjdhcDlNVUVJb2s4d0pEQzZJNkwx?=
 =?utf-8?B?ZUNFNkIvTGk3RWp4UXg5UWhUVlByUmg5YURBdVk3QVJXWFYvbnM5cmpEVEha?=
 =?utf-8?B?UGs2Y0tQVEF4RXhadXZESFlnUWMwL1AxVDFwdENFK0F6aVZxbUlkdHJUc1F1?=
 =?utf-8?B?STNXZE1IbFdiTkZlQzF6K0I0NnRHajE2RS9MdWpDc2tFelNNUEVQenhQYzBS?=
 =?utf-8?B?VVVWQ1VuTWcrRElsbVdVQzhiQTdzWnF2ZzFLUlFEaUdkaGp1a2wwR2dHYkw0?=
 =?utf-8?B?cGZHT01CUjBRZGRNNm40Y3ZaSWs0WktQN2dZS1h0MS9HYXRPZmxtK3pCN2ZU?=
 =?utf-8?B?SFlVTlEwdlJBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E19336030722E429A793237CBA2D15B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6132
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	751cc9ba-f19a-41e3-22bd-08ddf43c8fa0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|35042699022|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cTJrRGpLV0pzVzRXdVlDaUFmQlY4K204ZE1nQ002cnpkQlUyc3I0bnNFeHpx?=
 =?utf-8?B?Y3QzK3p6dVR5clNLN0JsY3h3bU9pSWFlT0VQZFkyemVUYzVGSUEyRmQ5citD?=
 =?utf-8?B?Q2pHZ0dWMk50RzM0MzEzb1BqZklzbStBNVF6aEdQRnZXSWFRdlFqalh4TGhP?=
 =?utf-8?B?UlZHZGVQa0RYYWVhYm5kdno4UWdYeXFFVk9EbEVOb08rUkt6aHZ3d2gvNG5z?=
 =?utf-8?B?UnM2U0txeklXMnVNRmNUU0dwMzBjT3A0VTZaWVhXQ1JLN1NxTjd2eFBPa3E0?=
 =?utf-8?B?cWEvUFhha2pwNjNJNUZ6UzNFdDBUMUZ4TnNMRTBQMSs1L0ZkM1RBSjZmeU8r?=
 =?utf-8?B?UnNhQzIvQUNSZEdxWFordmZmd1hWMnNVRE5HT1pIUFhqbFpic1ArVmlmOUhE?=
 =?utf-8?B?K0VyM1FZSmpDZDMxRUQ3eUZTeXZCMjl4SUVCWVBYRWpORXlPMXJZeTZ4WER3?=
 =?utf-8?B?T081bStYRm9LaWNzR3FFcFN6M2FyRW1JTEFzc2JybHRVZEswZEo0RS9yRG9h?=
 =?utf-8?B?eTRHOVU4TGRxWndqUnZJZ3FGM3dmUUt4Mk1ESCt4ZmZXSTJIMUV5YytJWEFH?=
 =?utf-8?B?Nldybm9vVGpJellFdzFCZDF3dm8wNXZlMkdRS2R0RHNEMGRMRlZ5cmZDUVZV?=
 =?utf-8?B?Z2p1OFZYQ3czeU5kRXZaRUd2RDBrUzlQellpSkVQQlRrcUNDamZxTzByM0s1?=
 =?utf-8?B?ckRTWEJiU1hwTkxFQTNMNXNQMzZiTHVrRUx0cVdPWFNwZXhwNm9aVU1zYURk?=
 =?utf-8?B?cUY2QWFWb0REcDhJTGtyNEFjcXNYbFRNMDV1VzE5cEV2aEtVdU5yYXpNRmNC?=
 =?utf-8?B?WEhJNThKRCtpT24zd3I2QnNEakVzMjZpUERPcWVERlAwa0FETlNLS1MxYVhM?=
 =?utf-8?B?TEFBalFsZzhIU0lGK09icDQ1UjBHekMwVEwySSs3YXJZVjV3K3lIU3k4b1RZ?=
 =?utf-8?B?cGJmdGkzdW1nbzJvZWdUMStvQWpXeWVVZlJSRmZaTmhTNFNUVlA3T2tXZmxQ?=
 =?utf-8?B?a3NUSlRsQmhGNGtUMm5hdDhqR3h4VEZyTGkyWS9sWldoeWowby83c2F5V3hY?=
 =?utf-8?B?ckcwNkl0VE55SjNXQ0FiN3ZjMTRqeXlKd3oyOVlmK29FNVR4YU81NnNzcERk?=
 =?utf-8?B?QmlqUk9HZE13OVVnaTRoMzM3M2tQWUJ3YnZ2K1NrODV3Mllta0dEajl1Mlpa?=
 =?utf-8?B?TUxuZVpqN0MwOTVmTVd1WUFVWFpGRDhYazZNRWZIWS8vcWZ6NVJWYVRIYUJK?=
 =?utf-8?B?b1RxQ0JobE5KVmxPYUJyK2pTTU9WQVJtQzIxRC9SNFppOFVyeVdodDlVdmhE?=
 =?utf-8?B?bFZkZk9pR2trdDI5SG1PT0c2MWFOV2xRanU1aG5QeS9uaW03ZEZ2amYyb1l1?=
 =?utf-8?B?UDFYclVUWm05cUxuTnJ0TVlXZzRSNFY0RUszUDZxdlRIWTBrdS9SRkRIcjZj?=
 =?utf-8?B?QVNiLzBWTExWQ3ZKMEdQME5uWWJNdzBHS0t2VnhUL2R6QWd1a1hkbHpHM0w0?=
 =?utf-8?B?V2pSR2tXTi9KMjNWVTl2M3d2QmxmOGRLa3FEbVExVTdwTmVVRFZrc3VLeW12?=
 =?utf-8?B?RktiaUR3WDhOa2NYdzlpYTZ0dTRGUTgwcEJoTC9FdUdxR0ZRUDZiNHp4UnRy?=
 =?utf-8?B?YytKam1uQldPeEdEODdnN0xMa2ZvOEtBOUJLaHg1WmtlUmRaMEhDYk1Oa050?=
 =?utf-8?B?VWhBSE01MkxDcXA1Y1p2NDJ4dkpEUEYwckJza0NHMWI3dVRhRm1BeVMwTkVn?=
 =?utf-8?B?UjEwVndOeTRFc1dxN0NuM1BkSTlCVnBiV0QyZGtoQlVpdm8vNFFrR0hmREt2?=
 =?utf-8?B?Z29SUFpZcTZTK2VjQ1RDWmhkMS9OM3BxNGM0KzloaC9FQ2RsaEpWY0l2ay8w?=
 =?utf-8?B?dG1lZVlZYWxBT205WUtJUitjeVVrOUlPZEhFcTF1cTRySGZkak1nSkVpcmx0?=
 =?utf-8?B?YlMrcFFseS80K3N4MmtjOEJINE9ycXBFTTg5dCtmM0k5T3JOSFJJbVRudEdW?=
 =?utf-8?B?L3RqbkxpK29pSk9UblBrQnNZMlFiRnBOejNSdjNBZ3VNQk5nUDAwQjIrUUtD?=
 =?utf-8?Q?svEL64?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 09:45:43.1289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a758f8-e37e-4bf2-0ee3-08ddf43ca352
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223396

T24gMTUgU2VwIDIwMjUsIGF0IDA2OjIzLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IE9uIFN1biwgU2VwIDE0LCAyMDI1IGF0IDY6MzPigK9BTSBSb3NzIEJ1cnRv
biB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IA0KPj4gSW5zdGVhZCBvZiBwYXRjaGluZyB0
aGUgcHl0aG9uIG1vZHVsZSBkZXRlY3Rpb24sIHdlIGNhbiB1c2UgdGhlIGhpZGRlbg0KPj4gb3B0
aW9uIExMVk1fVE9PTF9PUFRfVklFV0VSX0JVSUxELg0KPiANCj4gSG93IGFyZSB0aGVzZSBoaWRk
ZW4gb3B0aW9ucyBtYXRlcmlhbGl6ZWQgPyBpdCB3aWxsIGJlIGdvb2QgdG8NCj4gZGVzY3JpYmUg
dGhhdCBiZWNhdXNlIHRoZXJlIGlzIG5vIGRlc2NyaXB0aW9uIG9mDQo+IExMVk1fSEFWRV9PUFRf
VklFV0VSX0JVSUxEDQo+IGFueXdoZXJlIGluIGxsdm0gc291cmNlcy4NCg0KSG9sZGluZyBiYWNr
IG15IHJhbnQgYWJvdXQgdGhlIGxsdm0gYnVpbGQgc3lzdGVt4oCmLiBhbGwgb2YgdGhlIGRpcmVj
dG9yaWVzIGluIGxsdm0vdG9vbHMvIGhhdmUgZW5hYmxlL2Rpc2FibGUgb3B0aW9ucyBjcmVhdGVk
IGZvciB0aGVtLCB3aGljaCBhcmUgbWFya2VkIGFzIOKAnGFkdmFuY2Vk4oCdIHNvIHRoZXkgZG9u
4oCZdCBldmVuIGFwcGVhciBpbiB0aGUg4oCcbGlzdCB0aGUgb3B0aW9uc+KAnSBvdXRwdXQuDQoN
CihsbHZtL3Rvb2xzL0NNYWtlTGlzdHMgY2FsbHMgY3JlYXRlX2xsdm1fdG9vbF9vcHRpb25zKCkg
d2hpY2ggY2FsbHMgY3JlYXRlX3N1YmRpcmVjdG9yeV9vcHRpb25zKCkgd2l0aCBMTFZNIGFuZCBU
T09MIHdoaWNoIGNyZWF0ZXMgb3B0aW9ucyBmb3IgZWFjaCBkaXJlY3RvcnkgaXQgZmluZHMpLg0K
DQpSb3Nz

