Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71051CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:21:06 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.3])
 by mx.groups.io with SMTP id smtpd.web10.13082.1758277262094395850
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 03:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LkCIvvGN;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LkCIvvGN;
 spf=pass (domain: arm.com, ip: 52.101.70.3, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Dd/N604zcvcFiihDy208/LxMKA/an0rhELZwmWxt02B6wz5wXGFaBXDZ538SyHe+9QUvOt8WrZaCEurk1o7ybGi8VjYKihwj0IYx1O0hh+FxSXxbut+Qk4nA3TxPhEEtlyOImCRGELOU1isOfyR8HqTkupEQL5XWXt942S5GxF5VQ1qvEqQIucZMjEcondHbrokXMCYun659j21WH8sV5VvXXvL797qSUR31ygGYWV9Uwn87qgI2jQLd3ix5eOYgQrRLouZer+AVIbmMqO7jeXwKqA9XIUJYMrZx3EGFkUFsPiqk/4NSQrRexegSszLykzs5sZFp9PoxozsAMKW7OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWX46dClZ6qAJ/KWNPhclYVLom3xIIbR1uR3kYzFC3g=;
 b=lSoDg8+nOJ+K/UbGTbfuEwl8ZeB4dKYibTO8k1aevbbfjoJI6oClRQFr5Yp1n8/4g69OmRJ6iCo+KuQfrxr46oT2e3t1rSlRw+0k9Gf091C+OOCr3/LtiTrvric8DJlaSuXufCCH1HDZoSsS+B0Bqry5QPJa0FHEPEtYzl1ZfZ+/oA/ikAFwBqSY3kzVqmNxP81yr81+0ummoKxp98S5qUjmtTyxqS6x14O033Q8hKZOusO7tVfB8xpATq8JFafDLXTDM9+Lrsp3ZJP0a7Dlnrnmuv+yk2Dh+1bcB6mFJuJk9TaFwqz0BMImg6m1nutxWZyLnSlk9t0zmDgfwYoklQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWX46dClZ6qAJ/KWNPhclYVLom3xIIbR1uR3kYzFC3g=;
 b=LkCIvvGNLdC65WvIqhidTsiBmEw5rDU27sU4GxSeh/7A2YcwSbZ7M+uKafXF1KrSVK1Fx+MPdCcqb5LiHFCkvYhODdJ4Ps5sU7XAznODUUsAjTOiH+5Pq3AWUlFc4qEAgWcP4b2Me9d4K0ije5nwiG2M2ahZy7/2rVrE2/sSbwc=
Received: from CWLP123CA0144.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::36)
 by DBBPR08MB5897.eurprd08.prod.outlook.com (2603:10a6:10:203::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 10:20:55 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:401:87:cafe::fd) by CWLP123CA0144.outlook.office365.com
 (2603:10a6:401:87::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.16 via Frontend Transport; Fri,
 19 Sep 2025 10:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Fri, 19 Sep 2025 10:20:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzXN2+MwOA6cyd2ggJEILb/85p/UgMtnyHFOMWpaTz+Ij0CmggNmmCXs20ghbGCvZjBdRf0wWwvudL/sFX9MErEHgR0H5Blsio0Hi1+Tpva6dI456GaexWVA113XCalj83JflAdS4X6sl5f2dHYhXlwh7e80xxuftqMfWBjh+pbRV7ghWxsgfljbd+3y7k+c9seDBMYxRuHUjGiQMeuSmIUWOp1Ji/VTBV32hYNsYZ9dtG720CWw/BbIb1yZCM5pvpxjFiwRQ99l5LpuW9hvrvgoKuMoNLMkruKd4ThwozdvqLIaSADXfMOP/di80nOjMfBvFB38ZIo71WT9OuUvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWX46dClZ6qAJ/KWNPhclYVLom3xIIbR1uR3kYzFC3g=;
 b=ekli4QmIgN3BdozeNP9JcqoSMVxuwaUOEVoSczV8B128p1B7Sm2HC5SOFQELvIQuz+5UM+q48BJaUQm8n8S+nc5G3ZzGjc1re6BDe1gW4BRaBb8177kWSpzuaAtG51UVusJxzFqz8nCFozazmHeSjamjP2lDwhabEZQAUMO0eHqawrMPHGF7XwR6lFIM4cwgSlZY9UVg8NKFcjyYP3FGFMasH0wHPFFvB7veKcIyd17ITiRYGWQpnUvOxu/fwolB4ossQZcwC2ATqLrYNZKWKHizGO57Dk7P+M9qA9x/UaBz0xxY7rE8b+83AgkHfJYR3BNFEEo/vsXsRh8V1Ra6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWX46dClZ6qAJ/KWNPhclYVLom3xIIbR1uR3kYzFC3g=;
 b=LkCIvvGNLdC65WvIqhidTsiBmEw5rDU27sU4GxSeh/7A2YcwSbZ7M+uKafXF1KrSVK1Fx+MPdCcqb5LiHFCkvYhODdJ4Ps5sU7XAznODUUsAjTOiH+5Pq3AWUlFc4qEAgWcP4b2Me9d4K0ije5nwiG2M2ahZy7/2rVrE2/sSbwc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9281.eurprd08.prod.outlook.com (2603:10a6:102:306::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 10:20:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 10:20:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
CC: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Kokkonda, Sundeep"
	<sundeep.kokkonda@windriver.com>
Subject: Re: [OE-core] Remove rust-llvm dependency after LLVM split
Thread-Topic: [OE-core] Remove rust-llvm dependency after LLVM split
Thread-Index: AQHcJxlwutfFx8Zukk6BZwJbgLwV5LSXHeoAgAHo6oCAAUjqgA==
Date: Fri, 19 Sep 2025 10:20:17 +0000
Message-ID: <909D91E8-7C35-4975-9F76-5D49904F9B8D@arm.com>
References: <2906764e-7bca-4947-93f0-2564ccc75129@windriver.com>
 <4513AF0E-A093-4587-BD47-343AC3ECABDE@arm.com>
 <af52f896-b980-4923-bab2-d93c44c71970@windriver.com>
In-Reply-To: <af52f896-b980-4923-bab2-d93c44c71970@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9281:EE_|AM3PEPF00009BA2:EE_|DBBPR08MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 84491b62-6003-47dd-7e11-08ddf7663780
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y0dJU1lTQW5yY2U3ZjA5aHFiaWdyTGhwdUJxV1NXUkNJaGQ2NFVKWVdvZUs2?=
 =?utf-8?B?YVlUVzFRNXA0WGFZL24wUC9UdUJUY0cwSkFlVmIyNUlEZGgxWm5uMHpnTUdC?=
 =?utf-8?B?OHd3emZRTTQ1a0R1dmppV1pabDg1VGlHclRNblBjZnEwWWp2L1h2TkljUnFL?=
 =?utf-8?B?R0h6VDYrSlNJdVEreUhySEk3QUVWV2J0aklXS3I1TFhjUlpIa2NmYzlWNE9V?=
 =?utf-8?B?VUczY2JzQ3llSkVubFcyNDNBQWM0cHFlZVhGWC9OSnBrZEtTVlB3OWlxczZB?=
 =?utf-8?B?TEUyaVcwaUJlZkFPaEFKZXRhaGZLTFBsOER4NHlqaEdKaXhrUG1yVkcyVmVG?=
 =?utf-8?B?eFZXSitKWEVib0w1cDQ4bzJPL05mdzZRWUNQR29JS2VVbThOd0daSVNVeGFB?=
 =?utf-8?B?TjdvUzA1dG5nanYxbUtKSnRqRTdhUFlZZExoNmtNZUl1RXZycFlZT2pZVGJN?=
 =?utf-8?B?eTk2N2JrYmJNWTY0bURLV3B6YTZzYUEvSnlJUGpjVXk3anM2UVlwZVMzWm51?=
 =?utf-8?B?Zm94UUlYRmE3R3RWdVkyMVRVU2l2ck8wbndmeUtJRVRMMXZVY241Q2NoZnI0?=
 =?utf-8?B?bzFiWmFvVSs4amN5TUcvbHRMZXlQWjNnK2tPUFM1S2xQbDlpTk5qSVVZeldW?=
 =?utf-8?B?aDJFTXF2SGJYa0wydjJHK09vWUszRmZxSGovQTBISzcybXRsV0lJRjNVVEl3?=
 =?utf-8?B?UFNvYzUycGk0ckp4SDhFU1JZUm9XWXVlTTJvWTlsUmE5cUY4YldoWjB0MkxV?=
 =?utf-8?B?ZlhvY0QvSmVjMFBQVkZ2cGF2VzJCZkp4WFkvcHREYzdHMklyY2FYUGpRYmZo?=
 =?utf-8?B?cXQ2amFMTnhtRXViN2UvLzc3NWRyS0Z4M2I2UlRPQ1BrRWhNdGNTdVduYkVu?=
 =?utf-8?B?VnVRR0pDaEhTYnlDS2daOVpOWThYS1M0eHczeTJCWlowczFJdytZSlMrMWtT?=
 =?utf-8?B?RGhCZDJ3enU5MjhnTHovV09TbEhHeFU3Kzk0Rm42REFvd0xzL1VnK1dJV0xN?=
 =?utf-8?B?VnNIRFFSWXZ6T081NVU4cU1mbHptME9DdVgzVTR0MnhNWjNaeXRQSnhFN0tn?=
 =?utf-8?B?aHNqZEQwWU9MSHhJSXovZTNYVWdRcGt6VXNiK3FGUGdoays2VmV4THQ3blhp?=
 =?utf-8?B?MkZWZk9BWlZhQ2xhRjRqN1B0L0E1eUxhSkZhN0ZHL3pMZWFMTnJyWU12UjZY?=
 =?utf-8?B?Z1lvN01jYnJzb3FGN28wOXBvdG1jbStqNFkwbGZpdTg4bU5RU1lObk9DcFRQ?=
 =?utf-8?B?QU82ejd2MGdzSUsyQU0yWEk2ZGhlZm8rSis3UXN6MklqMW4yQ3BQTlI1Rkly?=
 =?utf-8?B?VXlUUE9BeFNzOWhOT3VpdW1nVFV2NHoycy9MRTI3QmJ5T2dWUSt4d0lKRGZ5?=
 =?utf-8?B?NnlFaHVrNU5pMTdvRVJHQ2Q0Wm43bEdDUU5QZTdxeTRseTBnRGw0a1BHZXZj?=
 =?utf-8?B?QUVIZm12eE42ZndGK3oyOC82TlUrK0RMclJ5TjUzbUdLMmpoN2dwaGI2RjRy?=
 =?utf-8?B?a21heE5BQ0pBaVkxYmFjU0NWc0tsVXI4RVZRR3lFcFZsczhka1d3b0ZKdEFE?=
 =?utf-8?B?MUpjWXJOd0R0MzZXSldkVGkzQVBXbmpYeGV2TnNCZm1iamJYTDBtSXl2cmxO?=
 =?utf-8?B?bS9UTTJraGlBM05pV21sN2pSKzdpdG9sZlErSEJsNHc3Q05EckQrQ3hNajRi?=
 =?utf-8?B?N2JudUxQdi8wV0Jmb3NjQ1UxVTNzRy9aY3c3dVBsY0tza2ZPUnJickNNS3hG?=
 =?utf-8?B?MEJLYmc1dFMyLzRaeE82QVREaGxNa3d2QU82Z0JwajZoWXFtL3FZeDlXWUhJ?=
 =?utf-8?B?ZlVHbnc4SFRaaEZZZTBVQTN0R1BlVVIvbFdESDYwb1ZCcExIdkZGUUduczd1?=
 =?utf-8?B?bmRjNUNzY0lPUXB5N0NzMHZXTHk2ZUR5d1d6eUpUU25sTWRERHpmY3E1OFRp?=
 =?utf-8?Q?hwIccaAsWAU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <05D01BDB21C75244B44EA977B08003C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9281
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c3b11322-8a55-4351-2080-08ddf766219d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|35042699022|14060799003|36860700013|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NU9VQmNCK2F6WDhJb2FoREg3Smpwbzd2aVJyOXF4NGNzK0o0VUNpZzVBR0JU?=
 =?utf-8?B?YUdIcHNDemFMeTRLcGtLMjhxOEllQnQvbHhoTTFnemp5M1ptYllzbDZDNUFW?=
 =?utf-8?B?UGZVeXlsM1IvTnFsbHQveC85bWFSd09wcXhsR2Q0czNJTGlvZFkyZ0U3RlM0?=
 =?utf-8?B?eWtUSHR1WFR6bkthRVZhY3IxaFE5TDBQSENhdXNPSjIweVRDVkJlTCs1SVdI?=
 =?utf-8?B?MldWYnpZQ3dZYWppSmlXY2VmUDdobmpUWDZsaFFJK3M4bmpYbWJDOHV3bmN6?=
 =?utf-8?B?S0F6eFMyVFg4UVFzTHhIVHl2QVJ6eHMydFpLUlJHZnZVQWtqS2kxYldPNlJh?=
 =?utf-8?B?enRCdnNTdGRyd3VQK1BodnRWdEt3dGdLNjg2dmdLNGxPdjFiRlhVWkFYays0?=
 =?utf-8?B?c1FTSXlMcFNoQjBORjRFQVJNck9zcGcyVmtzZ2JmQjlVdHFaTXpLTG5JS2JH?=
 =?utf-8?B?N2szMUZSVSs0U1pwSDZnVWE3clNpTEd2ZzA5TnNmRTdibGFvNmpiS3pyUk5w?=
 =?utf-8?B?MloyUFBsZVJ5aGZSQWJjV2c1eGs3OEQxQ1B5NmNCdWlxY01GbWFKL2s2SU1t?=
 =?utf-8?B?K042RXYyUzM0L0tVNm5Uam43R1NrMFV6SWNZaWcrWjZKR2VMMlRpeDRRZnlT?=
 =?utf-8?B?eEYvdnVPZXZ6MTg2WU80R3JMcE1vd0hKcmhTc0JXczZJVGtZNE9NSExMakRn?=
 =?utf-8?B?bUl3cEtNbC9IcmQzc1VZZS9lbExxM0REVVgvZ1QzYVgzZXFVSCtOa1VNWFVE?=
 =?utf-8?B?NE9rSFZqeDAyUlNsU0xzeHhjT3crSE1EVHo0V2V1T3orZjlERkdHUU5zSmNN?=
 =?utf-8?B?SFVmcFNzTTd3c29WUXB2RkJHb1ZkTlliZDJDRTVsUFc4MER6TzEyaUhFaFND?=
 =?utf-8?B?YmQxOGlFVkZ2Z1ZLUE1CU2pzTzl2aUM1RnJQYngyVjRYYnc3eXg1NnVGQ1Fi?=
 =?utf-8?B?UjdyRmRpZmpGQkEvaUN4bWp3MlBIeHdMM045WHFaRkRMbXBoTzFULzNiVCts?=
 =?utf-8?B?cVB1Nm9jYnNNNTMvM0FwK2lLS3F3RnpKaEZWZE1PVFJ1dkZEZUxDdUhyTzcy?=
 =?utf-8?B?MS9oOUFKbGV0RXlCRC9Oa0hJZE04cHo3eTVZSzlVOEc3TXJvRUZHOGZnWjA3?=
 =?utf-8?B?bzIwaWhoT3ptQ3JRUklRb0RwdERPOTNjcjJWV3FtWlM0Q1pQUEFGc09PQmZ6?=
 =?utf-8?B?eksvT1UvT2x1MDh2RGw5Nk1NMzhFTE8xZFlVTkE3R3pBK0ljNzEzdEJGMlhq?=
 =?utf-8?B?bkhlZ2lZRzNoVlhTN1RNam9GSWc4TUM0MHU1M0h3SXQwTjQrNGtlY1k5cE5t?=
 =?utf-8?B?dWEzV0pZY1hCa0ZqTXVnQzlabjhpMzJSUXRVWENHSFBmaCtLN0Q3Vzl0Z2VZ?=
 =?utf-8?B?cHZFRS9rbUE4c3lHdEE4OEpyVEUyRzV0a1IxcHBhbjhYMVNJTkFzZS9JVm9O?=
 =?utf-8?B?Y2hWSnNaMlhHaGo1Y2RyNkoycGRnU3ZvTzhkZU9MVElLdG5pT2FLTytKNGxT?=
 =?utf-8?B?dXlSbWVXMUFUQjVDTENHQTRtb0RWaVZuMmdHRG5XZnFpTzdlSnBzUnpLbFJt?=
 =?utf-8?B?cTdseldLemtDb1N0OFBLR0ZoY1ZFSDJsbW1FNnMzSTNJaHovcTB3LzlVUG1r?=
 =?utf-8?B?NGNVY25JTkNTRWh4bUZPWmM1K1FaSVQ0bGNoSUxQVzQwSUlscGZnNkFiOFVq?=
 =?utf-8?B?Ly95eUQ3MlJPYlcraG5OK0d2dlQyUDYyOWZBM0IyL2VrU3pjdTNhRlBjWmpn?=
 =?utf-8?B?Y1NndXNLTDVSN01aU2EramxmMklnYW5DL0d0cGRuTnA2cDhsWTh3UTRod1hX?=
 =?utf-8?B?aGxicU9MTXR1NG1WS0xhMkYrY21UV00zUVR1VTNPdGkzZzZqMGM1bGhwcXdv?=
 =?utf-8?B?MmJZZkllSGk5UkZHVkFlQjZZVTBqSnFEUGlubXpFZW44aG81TGVORW1rUmhO?=
 =?utf-8?B?Wm1XdDlaOG9Wb1hMU3ZEbUwvazh2NXc2M2pNL2Z4L1JZL2RzQzdycWo5Zk56?=
 =?utf-8?B?OWdtdTROdk1RPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(35042699022)(14060799003)(36860700013)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 10:20:54.5449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84491b62-6003-47dd-7e11-08ddf7663780
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5897
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 10:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223736

T24gMTggU2VwIDIwMjUsIGF0IDE1OjQyLCBEZWVwZXNoIFZhcmF0aGFyYWphbiA8ZGVlcGVzaC52
YXJhdGhhcmFqYW5Ad2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+PiBDYW4geW91IHNoYXJlIGEgYnJh
bmNoIHdpdGggeW91ciBjaGFuZ2VzIGluPyBJ4oCZZCBsb3ZlIHRvIHJ1biBpdCB0aHJvdWdoIHRo
ZSBwZXJmb3JtYW5jZSBidWlsZGVycyB0byBzZWUgd2hhdCBpdCBzYXlzLg0KDQpTbyBJIHJlYmFz
ZWQgdGhpcyBwYXRjaCBvbiB0b3Agb2YgbXkgY2xhbmcvbGx2bSBzcGxpdCBhbmQgdGhlIHJlc3Vs
dHMgYXJlIGVuY291cmFnaW5nOg0KDQpodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9ub24t
cmVsZWFzZS8yMDI1MDkxOC0xMDcvdGVzdHJlc3VsdHMvYnVpbGRwZXJmLWFsbWE4L3BlcmYtYWxt
YTgtdmtfcm9zc193cnJ1c3RsbHZtXzIwMjUwOTE4MTc1NDA3X2Y1Yzc0ZGM5N2QzLmh0bWwNCg0K
VGhlIGJ1aWxkIHRpbWUgcmVkdWN0aW9uIGlzIHNsaWdodGx5IG1vcmUgdGhhbiB3aXRoIGp1c3Qg
dGhlIHNwbGl0IHdoaWNoIGlzIGdvb2QsIGFuZCB0aGUgdG1wZGlyIHNpemUgZHJvcCBpcyB2ZXJ5
IG5vdGljYWJsZSB0b28uICBFeGNlbGxlbnQgd29yayENCg0KRm9yIHJlZmVyZW5jZSwgdGhpcyBp
cyB0aGUgYnVpbGRwZXJmIHJlc3VsdHMgZm9yIGp1c3QgdGhlIGNsYW5nL2xsdm0gc3BsaXQ6DQoN
Cmh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL25vbi1yZWxlYXNlLzIwMjUwOTEzLTc5L3Rl
c3RyZXN1bHRzL2J1aWxkcGVyZi1kZWJpYW4xMS9wZXJmLWRlYmlhbjEyLXZrX3Jvc3NfbGx2bV8y
MDI1MDkxMzE0NTA1MV9lNjVkMmI4OTRmZC5odG1sDQoNCkNoZWVycywNClJvc3M=

