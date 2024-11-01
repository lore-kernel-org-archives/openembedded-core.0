Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1722E6B246
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 11:52:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web10.35973.1730461957791044481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 04:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EZ5qSb6b;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EZ5qSb6b;
 spf=pass (domain: arm.com, ip: 40.107.22.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wFoMHuzWOw3zxgYWx0hK283V7K49JclVXqTtBeY9MmhXCxB359AfQUl85hZSvyeYmk0brCt1IvwFgPnCY+qrbKPy4w6IhATA86i4MkKu5NozU4bFERgHA8Ht/p7D/w4xhZqymNvDdlCo6xir26hbR7fA7F/0HjVEeGNzGYjk1nTa0w/8jLJITtJClAJBVBDkpSCz4MqdZ1LR6pnNpimZAHAd5v8feaMhAsDsza8JtKx3G6DZskrL1NZxnHXSNgVp/lOojCjY42oDxgp9cBtVdvt1W1cEgQzPLEHmWBEs+afN+4LOa1xWncsEeeLIIdDzrz2VgHLHTmqYWccf1a23nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdIna/77ouWCzdmquSJ3xZRuYWg75FWf2+na8LHQt2Q=;
 b=vW49oWKcb6sNZhmKLGOnjD/+Gm0EBjmsa5idMEKsoNnOfw2XmmiPKMHvHOJUtbA6/vX7acPVjl+hPozbtrmW5w05DdBFKkFvUl/4yYclZQkKr75t7nXr3uE1QJTl2SWIbkAXurAdnldf2RRInvGiNhI07PuKy1cSyBQ4dQqDPjEv64qcYWyGb8aC4rkCRKm9NFViYCRArDsslsqLEGPYuGMayZ9rw+S69oJPbb6o+04OoYwIpabyUhzS5+xS1LFiEw+bUt+NX8XJVUtyY3gBXRO7iadp4H4uEyBPTodpEO1ngYwEI5EH49kybwcIlokswkn5GFRDm/76xLeIw+8NSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdIna/77ouWCzdmquSJ3xZRuYWg75FWf2+na8LHQt2Q=;
 b=EZ5qSb6bDJKMMz5NX22ZbIcbO2+NI+AvZKOIK4SSwL72ohXOCclZtX5/gegkmVRwcB5sAKm+wFnM0zoDhIdMelt1EbQ6rX+NmbPxZJ0lyPP6ZxQwWwLYY78qZ57T6mdPAewsF5J/SGIA8N6695VHR1JQ485+pmFTneehcBz57GA=
Received: from AM0PR02CA0122.eurprd02.prod.outlook.com (2603:10a6:20b:28c::19)
 by DB9PR08MB9561.eurprd08.prod.outlook.com (2603:10a6:10:452::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Fri, 1 Nov
 2024 11:52:33 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::da) by AM0PR02CA0122.outlook.office365.com
 (2603:10a6:20b:28c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24 via Frontend
 Transport; Fri, 1 Nov 2024 11:52:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Fri, 1 Nov 2024 11:52:33 +0000
Received: ("Tessian outbound 373849c2df5a:v490"); Fri, 01 Nov 2024 11:52:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37fc3c3f6f8f1655
X-TessianGatewayMetadata: AbbkSAjD239unxySg+6H5Gsi4ZDmQltrdCshJBzpFuhkXx7nugNMesqet/gdwamHdOxmW1qbXprE1nCZCpkEPA5CE/m4grb/lJbYNK3m5meRfM6PEGTpNyip6ZfQLq9K/gWPHiRhlAeLkI3XAEKe4kOi1U3gCvWUn5siuQtvA2M=
X-CR-MTA-TID: 64aa7808
Received: from Lf2eb8b3be659.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D686D752-F2CD-49C7-8703-CC6223C8F7B7.1;
	Fri, 01 Nov 2024 11:52:27 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf2eb8b3be659.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 01 Nov 2024 11:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2tabvPpLiyZcuBm4TflWitW5lQselZufYilrLIwpZpUCRBSn/dV9Din85SM+UBWQa0zf5+/kTrM5Lf2NK6hs57gV6D3Slzrcpe5MTysNquQjJjtZqpQTB8Z/EhJ/tS/RpspO8i8pvECVlJncODKo43mfZB3A3K9I+Xe8JHwJR/daWwPq/Xi64AUiZMCCONdnI3/SHYEqk1+cWEpuTWnxGTdoOLGe866scf/inqyDVlU1sv1RO0wEmB9aTOhwa95Tt8AF52kG+elNPPPYPg25vYiHu0LWT7+ASMm/aEL+9SDJy8bz3mVQZqyG/62nZ2VIEfnrPcdD0WU7PGgF44kPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdIna/77ouWCzdmquSJ3xZRuYWg75FWf2+na8LHQt2Q=;
 b=jzGCSYqrKlSiMLfn9oR+EuopIdejc2jEauxVgrPJjZrAhuVQ2kIrjkZry+pP0lGjJfDV+R+HyuDjdzKQKci1NR5Va8Xbo9TxOV/jLaLOsDTyJg1TZ6Qk1RmVIFYjFBDzPWH7dwXaZg3p8KY06tt5htBX0UXRSL3Aou23LGOQOG41WWR5SP8+Dm/QaGUTCrKaQquuqoo3VIenRUup+ThS1W/oIxD36dsomqNiNa7E9KlR6kXv3txnayCH1Yl8O44FANAN4YnLqf0wNILqdrYnaRXlM7Wys3gQBXN+v5437rgH5jMzY0E5IMzH0Nhqa/vR0qqiG3e3fUzk/5ePcxpz7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdIna/77ouWCzdmquSJ3xZRuYWg75FWf2+na8LHQt2Q=;
 b=EZ5qSb6bDJKMMz5NX22ZbIcbO2+NI+AvZKOIK4SSwL72ohXOCclZtX5/gegkmVRwcB5sAKm+wFnM0zoDhIdMelt1EbQ6rX+NmbPxZJ0lyPP6ZxQwWwLYY78qZ57T6mdPAewsF5J/SGIA8N6695VHR1JQ485+pmFTneehcBz57GA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5387.eurprd08.prod.outlook.com (2603:10a6:10:115::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Fri, 1 Nov
 2024 11:52:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 11:52:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Jinfeng.Wang.CN@windriver.com" <Jinfeng.Wang.CN@windriver.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 2/2] glib-2.0: fix glib-2.0 ptest failure when
 upgrading tzdata2024b
Thread-Topic: [oe-core][PATCH 2/2] glib-2.0: fix glib-2.0 ptest failure when
 upgrading tzdata2024b
Thread-Index: AQHbLAJDKB7vrAsuU0ywuz0NRTSox7KiUPcA
Date: Fri, 1 Nov 2024 11:52:24 +0000
Message-ID: <34B7E04E-9649-4DE2-8116-FC7B6174BF3B@arm.com>
References: <20241028080425.2232475-1-jinfeng.wang.cn@windriver.com>
 <18028F3A690769AE.20159@lists.openembedded.org>
 <b039e834-4deb-49b9-80f1-267174c7d942@windriver.com>
In-Reply-To: <b039e834-4deb-49b9-80f1-267174c7d942@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB8PR08MB5387:EE_|AM4PEPF00027A69:EE_|DB9PR08MB9561:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8d37e7-9e39-450d-f473-08dcfa6bac04
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bUZYTHNYODlVNElQSHprdE1LTlk0MGd4WXhHaXFjWkdqWDI2Q0xpRE5jRC9x?=
 =?utf-8?B?S1BFaGMxZzVETEg5WHdYZ3dTTCs5aWRPVUw2Mk00R3M2aHhqQml1T2tJTThR?=
 =?utf-8?B?bG1DSnI0UmVKUWgzQjdOOXNmUkdtaE9WT2xDWlhhNVdpSCtTeFB1THRQZXpS?=
 =?utf-8?B?bS9rYmo2UFE2cHRnMWY3bDF0VjB4UysxWitJQ1hTdk5QSkc2d2FZZ042dysv?=
 =?utf-8?B?WmVZdlpkUG5zTFp3RWpNQWFLZW41NTdXSlJBcUNzRERlR1BNQUhkK3psNU92?=
 =?utf-8?B?cDVNZGhNY0VzeFZBd1JCQUdiSW1lZStTeUhVTmcxQUtzV2tiMFdCY2NIaEtK?=
 =?utf-8?B?VExoektvUG1HNkUxVGhIUjZicDhRUXBDS0ozWjR0UlFWSUhLNDIza01VVWZM?=
 =?utf-8?B?UVNzL3Q1TzU3TXpTWVhYQVdFTzNJdjdmUjk0TVRwbGdIbE11eUNJU2dXSVVx?=
 =?utf-8?B?a25RRXdpVkVvLzBNYTZTTTlGbWFRVnRGNXliMWpISWw5WlVMaFJValo5aC90?=
 =?utf-8?B?Q0FTMkVzZDNuOCtJSXhYWW5RWWpkVlJKS2tlS0wrdGwzSDVpcDJINnFnZ1hi?=
 =?utf-8?B?VUs4VTlhTEhXZmlFWGZMYjMraXhlL1Ewa25CaHVwdlplMDdZOVlnSEhtOWlz?=
 =?utf-8?B?YW9Jd3VlTS9zbzRrK1hzR0tSZlNMdGx3ZzZkaHN1NVp4YXBnRkY4SFdPUWVN?=
 =?utf-8?B?WGt3c2EwRXlZSkZUcmE0RDhhQTRPYVdjQ2RFTUlYaStTL2pDckdHZGZ4cGNi?=
 =?utf-8?B?a2tCLzlXbzM0d1FpVGsybkEvbHNQemFCNEE2UVFNYU0xdUl2OWdENzQzU1hR?=
 =?utf-8?B?R0pKNmdaNGZ1K1EzUTJlaTNvei9aTTRSU090QkpSWXFuZnpYK2l2SmtMOENV?=
 =?utf-8?B?UVBPZnI0Z0kwV09UNEwyamJLa3hYcFIrSklOTElhYlp1RTduUVB3N2FTQnRW?=
 =?utf-8?B?TmcwTkgxeWZhcThJbWd4TU4xNWllZnJ2a2VIaGtDMWFpb1kwVmNFNkVxNjh1?=
 =?utf-8?B?azJyOVo2alZMWEhNZlZERVJPTXhvSEYvQ0hoaUN3MmJaVGxZR2Z1eVlQZnZr?=
 =?utf-8?B?UHJTeVdkVHNqYUM1TVA0b3VHRDBPaHh6Qmt0MnFBb3VXY2VXYkNIQUxwTitr?=
 =?utf-8?B?SzlUUTRoL2NKQ2M5Y1FhT3NXZWVtZzJ3dnlreGVDSjcxWkdIcVJuSi9zZWdh?=
 =?utf-8?B?T1ZSaUhLME1IN2lQd2NHVXBhNW9NRSszNjE5b2lCSFF3T2NBdXZzb2t0N2xI?=
 =?utf-8?B?cjl6ZVZ6YUJvaTlrWjBBdTB1WUNYWTBBRUorVWNBa05NUkM4d3RhRFN1Tm05?=
 =?utf-8?B?MGo4aTR5bWM1dUdVNUROVHE4SXRFbnR3N0JkOU9NNmx0ZlRIRStVRnVkeDNu?=
 =?utf-8?B?cFVJb1ZhZUxGZXRXZXBycW9oNTNrYzdNUHpsQ2NodWllWm1qalJpNzhqQjR2?=
 =?utf-8?B?eklkLzdvMnRVUzVFekVERHpCZFVYSG5rYlIzQmc3MlRGdnhCQWM1RW9MRU1w?=
 =?utf-8?B?clJXRld2d1RKd0RuQ3lFcjBaaGNYQ0NXdGFZUFRhWUhFbDFWOHRyOEQ3T0dK?=
 =?utf-8?B?RG13QUdZZDIxL0REM1lCbWc0T1lxWENzMXNnUjV5dU9TSklDTTRld1kwVjlp?=
 =?utf-8?B?cUo3Y1BMME9xNEJ6bTN6c3IwdVBBdk9aaytPbFhFYVNFK25kNFNSZ1c2M3ha?=
 =?utf-8?B?T3hleHp0VTRadnlBZjA0U052UU1uRkFIREtVWFRFZU4xeGlXQ00vZ21teC9z?=
 =?utf-8?B?U0pqN1FwTDFKRTFZcWJCU1hXOW16VGtrWERVdFF4WnBxS3ZnU1JvUVl3aTNx?=
 =?utf-8?Q?Cp7+dq3grGny3depkbWdRMCTHv0mR7ufD9E9o=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED84EE999B45664D8AE6C58BC41A8D70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5387
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b70087e1-c3fb-4f91-b8c7-08dcfa6ba708
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d3lEZ2d3YWlJM29SdFNJUGtieG9GcXg2WnpjMFQxL3lNY1FiT1VpQnZTRnEr?=
 =?utf-8?B?L0o3aGVEYmJsWHZSTmJSRFpuaHRSTmNDM2J4UUtDWTRFUlRTOVIxS1Z1ME5F?=
 =?utf-8?B?M0FMOW1RUUtTTUpYT2x6M0NhYStRWnRXenJUa1RNUnpDTjIrZnZKS00xcHBH?=
 =?utf-8?B?N0dUWkNzSkMrWHNmRHgzOEtnRVpNa01kazRSekFzUzQ2TmR6MHVWL2FCb1dh?=
 =?utf-8?B?eXVNa0JBWDhkRXhFT0NjLzJncVkyTU53S1p0YmZVTHNQMGpXc1FhMXhhakpo?=
 =?utf-8?B?bHgrYkJIZEZOM2lEd3JjQ0JOTjI0bjdrNHdJZzhtdG5aenhGdVVZNlhpVXVV?=
 =?utf-8?B?NjFpMWorNjJPbTNuQm5WVTkzdndkVzRjMUNmQS9Gd2JFeks1OTJadTFtbXZz?=
 =?utf-8?B?T090ZWlyc0JIakpSZWxTc1hManp1QlBCdVMxWXBwRWlJa01Ya0NOaEl6eDhY?=
 =?utf-8?B?Ny9KZDZucEdWUzhueUR3dFBvbHFRNmFic040aVFqbVRmZzY5bFcxc3oyQUwr?=
 =?utf-8?B?cWordktHa1UxaXkxSEZmNkI1a1NWM0xhZGJ0VW1iN2RVRDIra1pNcWRMTjli?=
 =?utf-8?B?MHBhL2VnYU4vK0cxVktHQnRsWlIvWThVMlhtZDA0NXZEUjZXWnZmUGpUbFRW?=
 =?utf-8?B?Z1JwRWREcmxZKzg1SFhXUnBrckhQUHljUTdoR25mMTNOVkhLNFhoL0tXUGxv?=
 =?utf-8?B?RUZ1cGJhY3FySUFicHJST1ZIUUkzKzNhbUprQjI0TGxkdnBTczVpSWhWYkgz?=
 =?utf-8?B?MER2QnIxeEhZUUxvNjhIZTladmR6anpHZ3hSVDZ2aVpDV1VPMTlPa09ybTRW?=
 =?utf-8?B?eDJlR0lrMmpybEZlOGtjMEUwb2MxTExiclgwUXVCL1pkc3RJamVBNGdyQXJD?=
 =?utf-8?B?QWdod1l5bnFZVkVPeE1KQy82OVBGUkxOa0x1QTYyZ0V3a3FSUzJLbnNKTkxS?=
 =?utf-8?B?NGNBYmw0MUpBWDdhYy9SOWViSWhqdi9sMys0RHFpUW9qbU5hc1B5eVA0L3kw?=
 =?utf-8?B?bGRTS2hTUElBdGdrODF2bTI0RExaRnNkYlBuN21pQVZRQlBodWFjWEJxd01P?=
 =?utf-8?B?U3VoUVB1bHpNcDd4aXBpUjZRd0RRa0FWQlg0L0ZzT2s0MEQ0RXBCTVpNQ0xn?=
 =?utf-8?B?SFF3K2dEbmxaZVV2ZDJuaXI0OFhwUTVTQzZuL2Vqb3oyYlNKWThrSkwwS0o5?=
 =?utf-8?B?eFpKdTV6MkpQajZVYm9ZUE9ta3FlWnV1Z0RHaVExK01YZjRMNTZRRzV1bm9x?=
 =?utf-8?B?WGlrSmZsa3FmeVVyMXJuTVZ4WVVMK2JBZ2d6RjY0TzF3UUN6ZUN0UlBrUWd5?=
 =?utf-8?B?YWk3WGxEVjR3OHYzWXEyYTBrZWo5dDNiMWQyakR5YVZXa1BObUFHZjdZUndh?=
 =?utf-8?B?TE9zK1VEeXk4YmVwNWNQWjBIRi9HYXl2dzBKUUZ1VXhqS2dka3RRdkQvTEpw?=
 =?utf-8?B?bHVNbjBJOTlWNWRkZ0xmN1MrU1lrSEYrQWRtRUJpM2Y3bHMvb3JtV2lLWEls?=
 =?utf-8?B?WGc5VlFHR0FYRDFKV1VWUkhSVzRWVjUyQjZmSVFwQThkWk1XYk01d2piVUt2?=
 =?utf-8?B?eW95VEtTNUtMV1dFQzhUOWQzcFZNelliZFhJL1VPb3cySExGSnM0ejJHdUhZ?=
 =?utf-8?B?S3o1Q1NKcWpsSFZJSFBXemMrdHZNY3BGOVhmREV1NHVCaU04b1VpTTNzcGxy?=
 =?utf-8?B?bVNBaGVXMVpLMUJHYXZBbHczK0tvWWhiWXB5TmtEZ2JCRkljcVlYWUZsVXkw?=
 =?utf-8?B?SDcyTDhOTTYwVUN5OE1MOXhzcEN2OVpOTTVJRW5DT0tPQm1pV0dsQjcrVHRU?=
 =?utf-8?B?aWNLUmpUNlJRK2VvcGs3czA2Mm9HL3hQZ2tYMmlBKyswY0RpcVEyRURwOWFW?=
 =?utf-8?B?bzF3U1hKWVRFRkx4Nm9JY29QUWxVWUtsQmVQeTJYODJ0d0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 11:52:33.3593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8d37e7-9e39-450d-f473-08dcfa6bac04
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9561
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 11:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206615

T24gMSBOb3YgMjAyNCwgYXQgMDI6MDMsIFdhbmcsIEppbmZlbmcgKENOKSB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8SmluZmVuZy5XYW5nLkNOPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guIEkgd2ls
bCBzZW5kIGEgVjMgbGF0ZXIuDQoNCkNhbiB5b3UgZWxhYm9yYXRlIG9uIHdoYXQgdGhlIHByb2Js
ZW0gd2l0aCB2MiBpcz8gSXQgcGFzc2VkIHRoZSBBQiB0ZXN0aW5nLCBzbyBJ4oCZbSBjdXJpb3Vz
IGlmIHlvdeKAmXZlIGZvdW5kIHByb2JsZW1zIHRoYXQgdGhlIEFCIGRvZXNu4oCZdCB0ZXN0Lg0K
DQpDaGVlcnMsDQpSb3Nz

