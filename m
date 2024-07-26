Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DC2C3DA63
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 08:12:57 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.96])
 by mx.groups.io with SMTP id smtpd.web10.56350.1721981570690059044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 01:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=HXR+4LHK;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=GDtj4GSP;
 spf=pass (domain: topic.nl, ip: 52.101.66.96, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=aTkxsDtAS8AEWCrtds3RsDxfmvfG7xp2WoR4Y3JJ84eRIzOnBn8En40iV8MWeFUG0w8LbS6X+RJY4Br3ubgE7zTgfXy3iZ8/qnw+4H+nw6R8hOZUlqRoaHzXxEQtS1wpEaGrzGFaZh9jzroVTvtYpqexAJ5f+UFUmY0yiseAnEk0CHf9McJ6Bk6/4uOCF79Nkuzf2TARoTgxVUSGN5mWFeJ8WWhA0apEjay7AiniVOpq8OXrZb9uNw2Txj91YRtK0n4aucczV7fq7VTa4mBPy/nGeKt2JC3Wdk2Yw32QIWslqZtk0iHHjb9e58yWA1OaJJ7wT1mEPguvlnMMcj6USg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhOo7w1kjLGX23U1xsN3gWpc3tQxtWriQud3pAbUitg=;
 b=YiyFqWafvlQpeaV5dTHxR6vrN5NHduOdhWvHmj9I0vc1MnzO5fGLokDlxzHjZ+welFbEhjbcd3Wys55BXUNfp8sy+VQH669ZPC6aXa0xfbq3ndSCrVJe75zI/Nqwv8c6p1s6dxRgvt2AwSOT7lTaXBZ67OgT4kPeTsfCD3rnU+cA14XcB2bwv15jxWALNfVv/fBaWFQlX0sjQSKmavvC/4SqLS1G9EcMQ5colo0ocA8zrCJ1pDZygkkC1clRMTTs/tEDkSXPVXb7n1Jkm+JZC+xCkvmMsXozid18ep3ngu4sBI+OgQHgM3FA/kwbRXhP+HoAiPKaTuQmnHCufcSIJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=topic.nl; dkim=fail (signature did not verify) header.d=topic.nl;
 arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhOo7w1kjLGX23U1xsN3gWpc3tQxtWriQud3pAbUitg=;
 b=HXR+4LHKNnCaxZxmpk4/1pwillFI3amQqPkdIXdyL9j5/1YJR80TbiwhwSfMHX25WbpAEySkp1Vf7HD5eGSAF7MwkumU+wXXd3FfijsglHPiAkhLTwGbhqloYtwkolT0jpHIXVzydXmHX1cd/m+Hw74gwqceVVpiEgRXQ0ZIGI0ND0TqkJ/1Gj4HXSXqQQMSjHP2XJnV1ISotxfMUJnf1SyNwdWVLOVQ10QS55XRp8QpYFloIkGDt4If5NbUYbz0GmuGt27vZ7PiCk7zwc2FkqnFF0jNhnmzt2Mt+1hRDJTOMZJFS9VWQFvD4cW88EW0tmgPoomwzdfTxIZMC2nqTg==
Received: from AS4P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::18)
 by AM7PR04MB7128.eurprd04.prod.outlook.com (2603:10a6:20b:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 08:12:46 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::a3) by AS4P251CA0013.outlook.office365.com
 (2603:10a6:20b:5d2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Fri, 26 Jul 2024 08:12:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 08:12:46 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com (40.93.65.26) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 26 Jul 2024 08:12:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsIHnri52pDeSnkAJ89y8vKhLOOqyy8mLaNiB5w6TlSz259+LR+EQYeBy2eBYkOsiLdZ07GpA0N9P1jZd5PNzjxBkEi8SS48987xbQ9SpHrutyYc5PGitAnEY5eMF2UKQlexM6TKJlDMrlDrK082qnqmS0+Zp+4YjYHa1XQrbfZ7gl0/wo3vL8NL1xWHXrOdoyAxfdfxndTr+c6mVThbbuZhZiiC37h4VmgXkIG04MK7L+muRsvTob8g9jH/qPn+4OJnPe3TVZeUrO1kFh1BsdmcuBboRT5bEkFuTgoOpYZgxvsH9NpIWb+LW32mCqt1nbU9EfzV/BhQlPd+4QuCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YF889qz/xsOE/xb24FyMSYQKkEnxjgtLpw59lOpVqA4=;
 b=GbzB6Y6ypSR3bRkEUIazrKEFtAbCSjVmAPFswxMvRMP+yK4MekO/yUimS3ZBkO3b3MUe6aIF2r8hjCcmwBi+DcLKle5rcC+cPwADIpSZ/ez/AUEb2HT3/e5UBqmgzZ0HOL+mpG2dbhdsJCrbttDSL1TNzGYXZfMR5yuqMwgSAQxhnKRlVUftp1UrSjUj0tFEL6rVIfy5tNAY9rO4Tzv5lc0XZTrVdARn3bUbvHvxak4QbFl918NRpVjInA8Do04v3bG1PV5Nz6lTZGGHOYfA69HGU/Y7WXiWGMoXL0scmYlxbX5KnoDOfpS3/L9diEUSQljzHIGL4TBrtXjqBgCX6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YF889qz/xsOE/xb24FyMSYQKkEnxjgtLpw59lOpVqA4=;
 b=GDtj4GSPFmi3fNFK/pi1Kh9FNVT72dj6hevvqRVXQ+5ip/N5aJUZsbE2kqlMPGzSZOdkZ2SjCgzwVkAVGDxDxj2VsCHWqtl0dqbRSUVVmyA9urDbD6TjyD6aIRMVzYl/mUiDUpwnS+JoIVCTbtznOxXG8uZPU7t417k5PxbkPuYhCNa74sgwv4yQU1w6xovaXtLBgERyxoB7W6rgGizTRRwSkTafsJXVFtLsd8iJWxaU/u+PrN1SWBmOBhgmDxWnSJ1fqtHs7qzxDYUiFUs90MFI/NLdTrrcERQSx/QiYayWUVYw7fDSiVcDx5IN1aLnO5fj/7dk/t+z/q2BvVOJFQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from DU2PR04MB8645.eurprd04.prod.outlook.com (2603:10a6:10:2dc::21)
 by AS8PR04MB8293.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 08:12:44 +0000
Received: from DU2PR04MB8645.eurprd04.prod.outlook.com
 ([fe80::4789:86b:b7cd:c965]) by DU2PR04MB8645.eurprd04.prod.outlook.com
 ([fe80::4789:86b:b7cd:c965%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 08:12:43 +0000
Message-ID: <26e91af4-2cf7-4284-9ff2-31e23dfb8b85@topic.nl>
Date: Fri, 26 Jul 2024 10:12:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [Bug] virtual/kernel menuconfig disabled with multiple
 uboot configs
To: openembedded-core@lists.openembedded.org
References: <skoU.1721845689752134562.U1br@lists.openembedded.org>
Content-Language: en-US, nl
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
In-Reply-To: <skoU.1721845689752134562.U1br@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::8) To DU2PR04MB8645.eurprd04.prod.outlook.com
 (2603:10a6:10:2dc::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	DU2PR04MB8645:EE_|AS8PR04MB8293:EE_|AM1PEPF000252E1:EE_|AM7PR04MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 761defb5-94f1-4171-44b3-08dcad4abb89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MWtKamEvaU5wRjg4dk1qUUIxNDZhYVYxUVZ0blVxSnpRQVFmVDEwVFAzbERT?=
 =?utf-8?B?cDlpWUFZT1IvbWFLdCtnaEZCeVl5MTFlSTZHY2xlU1F5ZmJpZmZyOWo1TTRh?=
 =?utf-8?B?bW9rUDVLd0gwSzlMUW8yYThiVmxIWkpsYjJoOGM2Y0tKN1RFazQvMEN5NzZT?=
 =?utf-8?B?OTA5dE84eUgwaVlYcjRQbGNxMlNVa3N6cUREVGw5Q3o5RGxXK0FzTlhhS1I1?=
 =?utf-8?B?UFhycHBLTEVKZVhVOU5XcnBacWh1dWFaUHpoaHNGdGlXQ2pTbkQrRU9td2lj?=
 =?utf-8?B?NGF5ZFJIVWtEa2FkQWs3YVZ3QzNsbHdOcGNTL0h6eENFNUdKNHAwWHBiYlcr?=
 =?utf-8?B?RWF3WHRTT0xPOVhHRC85aE9uZmNPdEZtMUMvZlpTUFlOdzdnZ1RMNlQ4WWpk?=
 =?utf-8?B?TlBIM0lqK3BJSlB5Z09XcFhrWGxIODN5blhXbnVpcTJtWVRZYXE0L2dIeUU4?=
 =?utf-8?B?RXNqYTdWclZTZXRUT3BmTWdxa2dGUnVOWDEvTjNnWFc0SnB3b3pTQ3g1dC9P?=
 =?utf-8?B?NzdySWdrN0ZuRGd0Y2dkUjRMc2F2NWY2MmxIR09xTmdFdE8yUmdNdzNXNjRr?=
 =?utf-8?B?TDdqWjVBMUE5TXdCTkpSVytKZGhrL1VONmpKdXpodE1iL20wc3dBcnREVitN?=
 =?utf-8?B?U1p2YWgvM25IN3RSa3FhRlUyM1oyOVAzYjQxSFluWWhsaFExVVZDSGpkcUM4?=
 =?utf-8?B?dFdLQ2dBeWg3UjMxR24yQlpYdVd3SC91d1QyVG15QU9xZ0U2NzBnN0MwMVhu?=
 =?utf-8?B?YWNDczdwRlpRSGZob3ZybVF1V3kzeVBjeEd3Nm9UUW1QNkNuQ2hiVWtwVm9p?=
 =?utf-8?B?WDFGaVJMT2NPTmJoRFVjaFdOdHFJSmdIRUEwNHNsY2VVNzA2OGw2MzJFUFhH?=
 =?utf-8?B?L241eW9haCtGZU5kd2l1MjBmdjJXLzFqLy9KbENETm95Q0xEK1FMVGNkT1ZN?=
 =?utf-8?B?bXc4L1dhc3IyVnJOQ0F5MDc2ZW01R3NZU2poamZZWjZrRCtia2xXRVBscDF4?=
 =?utf-8?B?dUFpbVdMY25wU0FTOUZqdENVdGJnRXE0R2poeFVudVlGZUJWQXlscDZZMytx?=
 =?utf-8?B?VGxvZWtKUmVTNnVaQVVja0REc1daUGtoWGc0c09TbWtlTFlXYWNWZ1VVdUth?=
 =?utf-8?B?VFJkZUFVREJ3ai9aMG5oanNrRmFuRjloSktGYU51bWI0dndYM01TTDRzZ3ZD?=
 =?utf-8?B?WUdiZTR1TjcyNWdQWTNZWHZkMmlZWnVndWIwU3V4UU9LdXN0Z29JWmRyOTlU?=
 =?utf-8?B?OEtKUThhSTQxZjNmZURSUFdKa1oyN0ZGaDRsN0lLTkgwT2U5ZUI1NEp1OUhL?=
 =?utf-8?B?cTIyUWhpSVkrbjBJYWRlSnNROUZrVFpwNVZLdndzUDBkM0wxVTREK3A2RlNH?=
 =?utf-8?B?TTJFSGF0aklBY0V4R1pIRklUenVuLzE5dUNHRndLZVhWOVRmVkZwK2JkZnRQ?=
 =?utf-8?B?RjRwajc2Wi9oZkN1Q0ZRN1lRT3B5STRpT0tPNldBQkVZMTVWd0FjNVlRWExx?=
 =?utf-8?B?S3JwTk9wNVBHcStjd0RwRjJ2aDRNVlNVa0RrY1pob2JydkVJc1dKT2w0UFR2?=
 =?utf-8?B?OVptNUZvTkJNT29TYU9PNWV5VTFKRDhMZi9DUlRTbzFnRzlRSGtyN3JVaGN2?=
 =?utf-8?B?L3RlRUxuTnc1MGNMSTg1UjM2bGJrNkZzYVMxak1QYkRONC9OcEg2T0RuMUs2?=
 =?utf-8?B?U1dORTVSN0loK1FvNEwyQU5DSmdlR0pNdVBZOXI4S3VpRnJRMFNFODhUVHV2?=
 =?utf-8?B?aVJMSGllZURaa1Q0bDBzT1JjMSsxUmRYSFV2VVNmWk1SMHcxd25tWUtwbCtW?=
 =?utf-8?Q?mUfxW0TTh4Q3P+tklmjC4lJz27JexvF66JG1g=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8645.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8293
X-CodeTwo-MessageID: efa5de57-c396-4a1e-81d2-9be05d4013a5.20240726081245@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	be6ab2ad-79e8-4b1a-1576-08dcad4ab9da
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S1NreDRobW5BODBKMkcvNTk3QnhFWUFaRmlHamRVazJ2SU1VMjRlNFZ5eXov?=
 =?utf-8?B?WDIyWTY5YmsrR1NzUHVpN0l4UHMwQm0rNU9GTkhWVzN0b2RUaFFUM255eXZM?=
 =?utf-8?B?VFkyZk16cElJb2dWdm1SY0RlVm1Hb1RXNDFjbnRPWXdHek5LOVRaSGFJdWJ0?=
 =?utf-8?B?SU0xRWFvUmJZTTgzeGhEU2NOc2Y2RG40c2xRR2ZTOWJ3eGErQjhhbzdpdHNT?=
 =?utf-8?B?UW0rR0ZSVjZsaDRuTWl6Y2JZRXNZTzUxVmhSS0lvTDVFUWVWNlpSVlNFeWlS?=
 =?utf-8?B?OFNFbDAva2Zza0hkUzdGM2tGZXZVM1d2WkJSWlJleWlYcm44NGdSVmZYUTN2?=
 =?utf-8?B?VkZWeCtOZ1dHZkhVZ0ZSS1o3c0tabHZLd1lGeC9HK3E3WlI0NytRWnkzdUVz?=
 =?utf-8?B?d3hyUi9vWVYyMjBDMnBHQi9sNHFaa3EvUVY2YWR1WlYvRFBCZUVvYmF5Ullx?=
 =?utf-8?B?QjJhWG0ycnlpNmV6UUY5SEJYWG03eVU2c1B3TnBmUWhxMHBEMGV1ZmJ4VHox?=
 =?utf-8?B?c0IreGs2YXpFTU12dmZDRUhFeXpMZHp4VTBSMW5tZ2NZZ1QwejJ3c3IxMjFS?=
 =?utf-8?B?VFZCL0F5ZTlxZ0g5d1NtRTRBRkNpWDlsUDJIcS95ZmZOS0xzYXZYVlRoeDdN?=
 =?utf-8?B?M0c5VWpQVnZxOVJ5OGxFZWRlRVIrM29MR3M1SEppeHZkT3V3dk5IcWpHVXBw?=
 =?utf-8?B?cWVEMkQ1NWRIRC8wWGxsbFN5aVVyaXoySXBNbkZLb1h0dExOV0FKdlJUZlVs?=
 =?utf-8?B?RUlHaS8rRUlMV3dNY1BhZ0xoK3dtSHNKMHNkN1ZDQUpkSkx4aEhoamNJNEhr?=
 =?utf-8?B?M3NJaGtiNzlZbzAwN05uZC9ER2hDemNENStocUlNYThIaWloZ2pEUFhPdGhW?=
 =?utf-8?B?bFNhcGlwZlRDNkE1V0sweEszQXNuVkhacXA1anNaYUJjV1k3RWl6TW9Bc21n?=
 =?utf-8?B?MXAyRHo5L1NUQ2hJZkV5eThadkw5NWFYSFZscXRlWklaUi9GVGpGVkw2dDRP?=
 =?utf-8?B?T2lNWFBZL0d0SEdWVW4yV1orb0dpazFQUjIrNmU1Mnh3dXZGQ1dNSG92YUZX?=
 =?utf-8?B?M0phRjVaZXlrSHFHeVBuNUE1WnFaR0xHdTBZbnF6L3Fqb3dLQmFxYzd1ZXhz?=
 =?utf-8?B?UjhZRStVSGt5Sis3TGVWY0R4ckhlRlNtWHRKOVpIL2dVM01KY0dPblBZVUF5?=
 =?utf-8?B?dms3NUN1UXVmbEFFRHlCcHBYUmVxaW9wbERiMGdpeUt6Smo1eHNJMmhGT3VZ?=
 =?utf-8?B?c21tSjlQVm1yejh6RVhpbmJNam5XRmUzdmhtUHpZMi93R2wxcjNQSnBxQzM5?=
 =?utf-8?B?WjgvRWtDZ0JUWTEvTE1iYXE2cXNJcUNTbVQ4YldYS0JXcklLS2VvOWpnMlJX?=
 =?utf-8?B?aVNtZ0ZGY1ZGL2FHaDE1ckoxc0Q5ZFBqM2RteC9DTmQwZ0NVSUNzTGNTeWRV?=
 =?utf-8?B?UnB4Qk1Tcm4vK2JtVXNUb2VRbEg1UVozeTZCQ1liQkEwdW1NRmdra3lSdkNV?=
 =?utf-8?B?Vytzd2lvWHhjWm0vR29QVG9JVjVFR1I2Z1h5WlFBMVY2YTB0QnJQcmZmUk45?=
 =?utf-8?B?MTNDQ05Sa0phTEltRGxaaEpQSlRzMi9ZUG45MmhCVTA3cFJrM0hsVjJodjRW?=
 =?utf-8?B?MWxyZDdXNElSay9JU3NvWWwxWmxLR3VBclo4V3hwMnZ3UDNGMDNwM2QzYndO?=
 =?utf-8?B?Y1lUT3hMaU9pVnlmY25MUEpISThWWnZCaXYweVZYWDZ5QncyQzY1bCt4Wk9m?=
 =?utf-8?B?cXd1U2c5U00zcVliQ29IZm5Ya1Q0U0dmSlJVZVd4SFlQYXNCeXJyL2VlUlg1?=
 =?utf-8?B?R0FIVStBOG9RL01tZVJQN0JoZjBCNzNyWDBqYTV6ckx4L0xQd040Y2lIellY?=
 =?utf-8?Q?nn5rYiYBa7tLj?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 08:12:46.5132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 761defb5-94f1-4171-44b3-08dcad4abb89
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 08:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202518

I encountered the same issue and posted a patch, you might want to try=20
that out.

See:
https://patchwork.yoctoproject.org/project/oe-core/patch/20240521135705.444=
470-1-mike.looijmans@topic.nl/#19364

On 24-07-2024 20:28, John Ripple via lists.openembedded.org wrote:
> Hi, I've found a bug in the kernel-fitimage.bbclass when it uses the=20
> uboot-config.bbclass. The Yocto bugzilla wouldn't let me create an=20
> account to report it so I thought I would at least post it here.
>
> On the Scarthgap 5.0.0 Yocto release, the kernel-fitimage.bbclass=20
> inherits the uboot-config.bbclass (both in=20
> openembedded-core/meta/classes-recipes). This is normally fine but if=20
> you are building multiple uboot configs then the uboot-config.bbclass=20
> disables the menuconfig for the recipe. This is a good idea when=20
> you're building uboot since you don't know what menuconfig to use, but=20
> since the kernel inherits this class too, the kernel menuconfig task=20
> gets disabled as well.
>
> Steps to reproduce:
> 1. Set UBOOT_CONFIG to have multiple configs (I did this in my machine=20
> file).
> UBOOT_CONFIG ??=3D "uboot-a uboot-b"
> 2. bitbake virtual/kernel -c menuconfig
> =C2=A0 =C2=A0 ERROR: linux-fslc-imx-6.6.28+git-r0 do_menuconfig: do_menuc=
onfig=20
> is disabled, please check KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.
> =C2=A0 =C2=A0 ERROR: Logfile of failure stored in:=20
> /extra/temp/tlo-p700-seval-build/build/tmp/work/p700_quad-keysight-linux/=
linux-fslc-imx/6.6.28+git/temp/log.do_menuconfig.995135
> =C2=A0 =C2=A0 ERROR: Task=20
> (/extra/temp/tlo-p700-seval-build/build/../layers/meta-freescale/recipes-=
kernel/linux/linux-fslc-imx_6.6.bb:do_menuconfig)=20
> failed with exit code '1'
> ...


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




