Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006E3CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 20:09:28 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.0])
 by mx.groups.io with SMTP id smtpd.web11.2114.1759781361621076539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 13:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SVrw0Z0V;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SVrw0Z0V;
 spf=pass (domain: arm.com, ip: 52.101.83.0, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aXmlLNlQ7KXvOSo533lF1+pGVx6TEWp0m9hWwP/uqsZN8CttVVxdjUz7KirUSWtI/KPoqEd0REdOQ3aF3gG3xeT5Zd5r7hkaCAi2MAtY9HBwwe/zQXZfoUihmwkBmIbufqPwPGCsxeGhl2aHzn0LMx8W2E5VaNrlBEhKs5NbIhEM+cq8V+O2sSrSUPjrI1a4q97PesuKkqyp83sK0eWekcsocflgwaAKlnctwk75iNG99jwP5mFlINM0EfT+9hoH6TaUDRpJkYThIhvEvPBzAkZmlvtbcQfPdy6HgBrvjdf3Evjaxdau6HuImcumo99da1IAlFpoFfyD8+mH5Vs3Zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zGaOOXct/AqugFfR4Hm5nx4ddtqmMpBYVtXXOCI+Cg=;
 b=S7gc03/ZSZ5WFzd92QrtxdWYeNAgTKYGt3IHJsQ5mcqxGjY1NNcSxyLViRSuvWrZDMvMa2B0iAQn76Yw4xgyEjSJr/EyxPIp7+gkTD/3nq/EESIVaby+b3XvYZzX6mzIKMZTTVBM+Pw9Fb59klS99HFGL2o7RsuWtBWTJs9u1AiY+PMwv9a1JZBXznc/J2ALvkZRUlM+Ld2yR37QkRMUdFtpjNlOujNTYAjph3VS/B5euMC7bu9udW6vg+5rX1Y4lHan6AMbd17tlrc1xUEx+tWsNI8mX0G4D0V2MxhpGCQ3/2A9IznkDHIdMn+8JqvuJBRqBAHAEYeRPYBdHGAYKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zGaOOXct/AqugFfR4Hm5nx4ddtqmMpBYVtXXOCI+Cg=;
 b=SVrw0Z0VTZfPbWYOY9kb4N1k9TIc99W4bZir6/dCTRXhgm9y/AGS/rRC9gbbgyxi07tVaTkX/HyJCpzDwc+BG7NLI29hANspgOqgN/3y7vyM7ueCl/83r8fak6LWcJ06yHJoc8mVlzuTOJpBQApNC3XYNF2SddC1rkyxReMod2g=
Received: from DB9PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:10:1d9::12)
 by GVXPR08MB10541.eurprd08.prod.outlook.com (2603:10a6:150:158::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 20:09:10 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::c6) by DB9PR02CA0007.outlook.office365.com
 (2603:10a6:10:1d9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 20:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Mon, 6 Oct 2025 20:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFmGwpCaZNsyHtaVmxMpulbrp/c8u1RILRRmsqmqNmk5Ngi8lN3ibjj8HTyAbh8WuXA2XvEveezgR/N+AO4ZTdujBd6KUe/NKgGAVzM8nSvHt2brez/iYjUp+vcgk5jwDGexqMntpSeLODtRUjqaXfVukiqeP1NNbkdU85qMtPAcTUSn3ozb3S6o0r/BQYc6Tuo4rmvUF8rCofjEvj/dEtAKtYV8eqozGuNUS6JCp1WLObpm6YUIdm/58c8ScObwQ6CeQqj1Ov+xP4Jd8cwxBZcYFFWU9aC4eFWYz6HUf9HqHuU1Nu5Iy/QYkLAXO9LCVEsFgCyplVJAQPJ8ad4ptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zGaOOXct/AqugFfR4Hm5nx4ddtqmMpBYVtXXOCI+Cg=;
 b=Sh1idwOyzvbMeL3WaCIIgkUdAmFlzFgautFa1SKECuncDRXwxtn9Tqh+cbDLY6VoArq4zuJjtWzyrnjXh1pxsIpZkm0C61I0JrnTQpFQk2wd0Ad64lmLUxU4hI2ivLi0BahmyDMoERUOJRTdmVrrRbZdW1FPoMG/2Zaav3g7fQIagtmuOXabYAkkCmLJ8q20XMflJ+YXesxD/F1AfvBFTa/9v17H5iy0174nB403j3C+F0AzNxwLZEq2Ds+iC7i9nQsS9rL9pjeM42649Wfxw5hb2n89EcZQgjtLt+LrFrIYp37ZKj0UjQFofI7QCpl34qEAuhUVGvbPfVsMXR6jIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zGaOOXct/AqugFfR4Hm5nx4ddtqmMpBYVtXXOCI+Cg=;
 b=SVrw0Z0VTZfPbWYOY9kb4N1k9TIc99W4bZir6/dCTRXhgm9y/AGS/rRC9gbbgyxi07tVaTkX/HyJCpzDwc+BG7NLI29hANspgOqgN/3y7vyM7ueCl/83r8fak6LWcJ06yHJoc8mVlzuTOJpBQApNC3XYNF2SddC1rkyxReMod2g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9551.eurprd08.prod.outlook.com (2603:10a6:20b:61c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 20:08:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 20:08:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "daniel.dragomir@windriver.com" <daniel.dragomir@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] wic/engine: fix copying directories into wic
 image with ext* partition
Thread-Topic: [OE-core][PATCH] wic/engine: fix copying directories into wic
 image with ext* partition
Thread-Index: AQHcNSjJYJI118WvkUKSaQoWGyJtlrS1j5oA
Date: Mon, 6 Oct 2025 20:08:30 +0000
Message-ID: <D8277C29-A859-491A-85B8-C518E37EB988@arm.com>
References: <20251003203130.23843-1-daniel.dragomir@windriver.com>
In-Reply-To: <20251003203130.23843-1-daniel.dragomir@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9551:EE_|DB5PEPF00014B9A:EE_|GVXPR08MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: 361c3b8c-2ae9-4524-568c-08de05143530
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cGtCRFJVek0vUkRrREhWbWRsTHFIbWU2TWJJSWhTR1NMN3EyWnV2elRac25N?=
 =?utf-8?B?bUNOYkpETmdrNkppSVJUOEUzTU13WWVHMElVU084SHBVWk9xN3ZwWmpPKzVQ?=
 =?utf-8?B?TEZKTzVicm5PaHdzNHJ6NWhyOHY4dWhLK2hXWW5CcFhoOW9mV0RCaDNyYXV5?=
 =?utf-8?B?d3hmNW1vZklhYUxvRFpaNURteHNSTU1iZmxpWWxUbTRleCtzbm1nNEFDNmZP?=
 =?utf-8?B?NHBqVklXOVBlTFJvNkwzZVlQeUlFYnpEeFBKWlJiWnp4MFJnSEJ3c01pd3FE?=
 =?utf-8?B?d3poOFY2YzJPNHBpQ1FFZ3FOVi95ZE1uMkhEbmhKdXRNQk04UlFNeDFxWkxY?=
 =?utf-8?B?bi93bjlXT3RUVkpxeDM3c3I5MGgwcWgwTStDbmFUalRUdmtndHRRNzRsejho?=
 =?utf-8?B?dEZ3NlcrSkdqRmtpeU5URGFad3RMdzVqRW9CVFBycm5xK1B4WVVuZ1d0S3JP?=
 =?utf-8?B?VGNZTTQ2TzVScjdzUDVYSHNSdEx4YkhpZVRyT1NoUHVwZzkrYVZSSCtqeW5x?=
 =?utf-8?B?Ymw4bUtzQ0xwZnB4N09MTElnWHVhcEJCbFVKVUxPaVQ1OEE5WkZLbGh3YkNR?=
 =?utf-8?B?MlY2TGdNaHVub0RKU1MwK1ZmZmY0TXE5TEJ4Q2hCR2R4NTZKaUkrdVFLNTZp?=
 =?utf-8?B?MndiaGtOZDlBNWQrdzBWNjJHZUlaMWpXTlByRkN3WHpiN01QWHBzSWxCaVh0?=
 =?utf-8?B?S1ducFl5YWRaQjd6cXdjSm1uRGNTcytPVFN4Zkd0WjFrNmtZUHlBemFKWW1T?=
 =?utf-8?B?MTRsT1puV1FjK2R6cEgrODYyRXVBVnBEak9RVWgzK1B4dFlJb2Y3VzVSMVBr?=
 =?utf-8?B?cnhnNzROUFhzMDhSdjNBdWxnbmpUY1JiaS9CQno0SU9XMS9LOTlsb0dKR1J2?=
 =?utf-8?B?S2JNbGZWYzRSZ2NTdFRsU24wdHZ3VjFZajJTeEpmNmlSc2JjMlpHMUh5RlV1?=
 =?utf-8?B?TDV4OFJ0NlhDa2gxMlMreTZpbEpRWThpcUVMUWFZb1ZVWVQwdzcyWm9hclla?=
 =?utf-8?B?bE5Kb1VVN0xYeGhsdE1MZWhFcVJ0Rmh5WVV0RXVLSGRRLythMEw3RW11NWRM?=
 =?utf-8?B?ZStERjJtVUdocnkybGlPKzVOYWNueWliN0ljMGJqaHhXeUlUclVkNXR0RWxh?=
 =?utf-8?B?SjZnd0JmbzRHTzRwcmhSYXgwSHZqZ3p2bFVuUVJHZ2NGMDVqS1E2QjlOcUZq?=
 =?utf-8?B?Q3RiQko3ajZxVkU3OUZOZDBPTjhSdFBud0k4Z0NMWGtiTDUrRnh4ZkN3U3Vk?=
 =?utf-8?B?Z3RqMkhaZDVtWDZaZTRXZ2duYXIxdjZiNGFYNFZiNVNlZlJWVWF6UXZJbzJ0?=
 =?utf-8?B?MDVTd0ltQmJ5bjNvaFpDK3RMSzlYUlVmYVl3VGJCcEV6MndybGlLNUx1eWpQ?=
 =?utf-8?B?WWFabTU1TFhZSlBsVEYxRkg5c2QwU2xDVXdhUmxha2hPb0NJYlYwcEtQaVRZ?=
 =?utf-8?B?VzVrRzgzRjNFb0RwZ3pwR1lna1ppRmtEWk5oMkxrRFBWT1ZnZFBZNVFGTllX?=
 =?utf-8?B?WFZuM3JuTFZLcGd2VmF3YUd0LzBBM2xVUVhvMnRoaWdacjZzbi82enpaejhj?=
 =?utf-8?B?YkVWdG5QSWtXYVFhUnV6NU5UL1VBOWcwRERVQ2xHQnk4VGtBY2VnQXkvelhO?=
 =?utf-8?B?ZXlyWitMbWNlN001VnZqMEppNlBvVFhkTzI1UFZmV3hhVHdONzZCZmkrVUFs?=
 =?utf-8?B?RXllOGFORHdrc0FOVGxuZGMrQkRjTGZTaHVCRkJwWFNPeVRjUEhRa2FmL0Zn?=
 =?utf-8?B?NzZhSXJPRktUQk14S29zbm1HaVZsaWNocjVjUGFPTlBnVHFoaDBXSG90VFpm?=
 =?utf-8?B?aGtQc014VWVrbzJpK2ZxaFFBckFEbndEZmt2SmhwWTVLclFaN1Iyam5DbUpF?=
 =?utf-8?B?QVZyOGVFclJOd0V5NmVRUng5TmZ3Q056QW05dXpHdFNyUW5pOVpUekh0RmNV?=
 =?utf-8?B?bkY3S21jZENZY25ENys3KzE3QnFlTWJtZFhiQmI1RmdVRTFDbEVRRmpWRDRF?=
 =?utf-8?B?aDZIVHE3WHhUWUgrejZreC91UHc2bm53Ym5RSWFFUDBmMnhTNkRNL3lSaVN0?=
 =?utf-8?Q?khJeat?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <86FEF307AF0BA94F96C2C8403557B44A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9551
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3573b9f6-cec8-4562-4d59-08de05141ed0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|35042699022|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S2YvZlN5QnlObGhXU2Vacnl2eHJodmNoV0dFY0lBSDRhbm9HeDJvMjdtMXhm?=
 =?utf-8?B?eUQxM0tpcC8wc1NjVlJoUjJmSnNYRzR5bi96ckJQZWN2ZHZLNWtST1g3RzZv?=
 =?utf-8?B?YkJ6UkVyMGJnZXk3a1d6d1VPZElJVFdTaGMyeS9vVUtJK1prRWdTQkdCMDAw?=
 =?utf-8?B?b2NPL282U2pVbG83V0R6NW9oNUhEU0VMNjdGSjhKRUMvUnI5U0w2RkJqMkZ2?=
 =?utf-8?B?c0JhTnl2ZlkvSms4YzFiNGJyR1JIOUduRktEMmpTVDdKTllGWWJQUG12YmhG?=
 =?utf-8?B?WjAvS2hHVm15RnByS2doR2d1TnRaeG1EOHVXN3lmN0xVOU42QWNrNldOY2Ji?=
 =?utf-8?B?UjlFeVlSVVY0am8wYnNmVENNNEM0L1FVKzU5WFhyZDN6QUF3MHVoVTNpS1Jk?=
 =?utf-8?B?RmRNQ05nYnJHM0ljQ01YR1V3Qzh4NjI0MGM1alJuVGZvOWN4SDVWMHZqYVFC?=
 =?utf-8?B?ajAzeDFWVTVrY2ZJczFTV2QwcmlWYW4rbTRpWlVnb3dNbkt4RHlwOHoyUU1F?=
 =?utf-8?B?WmhVeUZTekdXa2t1aUN4TzdsaEUxNVhBNXZEOUlqZHk0QnNKVlFoalp0N1Jl?=
 =?utf-8?B?MHo1ekdIN0NBV1NnenhLb056Tzg1ditpbVhpck5YZWVJTk8rYWZzSHl6TzNp?=
 =?utf-8?B?aThvTVBCQ1FQaHBjRmFMdXFJRmlVMWpPcGF5dkgvdkwwNmowNnhVUnVHNmI3?=
 =?utf-8?B?bzRjdW44MkJCTHpVVzdRNTEwS25RZkNZQ3JsY3Ftb29tQkJTRzNiNkJZNjZp?=
 =?utf-8?B?Z2FLMURXdm1NcVhWOG82b2V2cG5OdFFYVmtKWTR2L05PSjAxSk1VWU90RWRB?=
 =?utf-8?B?RitpTmt4enZxQlVYQlMwR3o2ZjZXMTZ2eUhycm0zUldZRUxEK3JQdmFmZnBp?=
 =?utf-8?B?OC9wTW9BSUxDVzdPdGZrdFoxMUUwS3hlYkVhaVdobER0OEMwZmlhVGVmSFdP?=
 =?utf-8?B?QmdBRk4zUlNHT1hwRDR2RlFaRzJMOHhGZlpSSk9QTFhuQXl1ZnNrVlZBdnhq?=
 =?utf-8?B?bTUvbVFVbzM5YjRJci9lNXpkNXlWNDA4RytEREl2TmY4R3g0QlV2c1F5TmE4?=
 =?utf-8?B?b0lSSmFRVjdMc2hmOFk1RUVUNVFFd3VrQXF0LzlNYVpRSnRSQks4MkMwVVFW?=
 =?utf-8?B?SnZVMGNSR0lvZk5JVitYSHVaQzQ4cFFHbXMrbDB3alNWTG5FOFZ4dys4M29K?=
 =?utf-8?B?L052K0IwenVsRHRVVWJvZlA0MmxaWlZwUDdJanphdXNka05jOTdod0pQT1Jh?=
 =?utf-8?B?VU5SQnczY2xFclN2TWRMYXQ0MWs3WWR4UFEvcXFqUGgvb1EyaE5CK2JnQnBC?=
 =?utf-8?B?alExaXF5LzJPYUdHMldhZXlNSXN2TWxLUWd2THNlNnJ5WU85dTRLTFlDRVlX?=
 =?utf-8?B?U2lJSHBtSlhWbVU5TjNscTBwMjZiVUxRVjdIa1BWbXNZdVoxU0pWRk0xa3px?=
 =?utf-8?B?aC8wYUppemM1LytMK1liT1JmcG1RYktDakFLWFJuL3Rzc3d4QVhyU1Yvd096?=
 =?utf-8?B?cFlpdXRMWXp5d21FTVpNWjFqT3RXK0pVZkVLdmF6SlRMZlNkKzdQSnNtVlQx?=
 =?utf-8?B?UVF6bnRGNERIWStYdHhFZFRtZnlhY0EyYldHejhVNy9RVmtKZE9tNmRPdkQ4?=
 =?utf-8?B?SGJ1TUNUelBYRkFaVmZyMUtpSVRyaXlPREUxelRObi80VHBuUm9lVlNoMHdw?=
 =?utf-8?B?VFhYYkt5V3dtNlZ0MkZXQkkraTl0SXZaS01DaldxcjFmU01Nc0hJd0RWWWF5?=
 =?utf-8?B?VW96OHdzSjRybzJOTis2R2s3VzN0SmlTRjZIWGV6cU1vV3Nwb0lxUE9TaWFF?=
 =?utf-8?B?Y29uMUM0cW02SnpwdFpBenVyYU1HVnZUb2FRMS95Z0N5cHAydUNLMkhnT1RT?=
 =?utf-8?B?R1oxTXk1MWVnSUdyM0JCazIxdVluUC9NYTh1d2g2eWVtdkluNDdzOWh2REtv?=
 =?utf-8?B?WHQ2KytMYi9uTWNTZTZKeUJjQzhGbTZvT3VDUkxrckx1OTJ5V1BnOHhseGhV?=
 =?utf-8?B?eWt0QXBncHArRE15QTAyTzRXNit6bTh2eUwxMXZkZDJqNWtjYXVZOE1rYllq?=
 =?utf-8?B?YnRkZUt3ZDNVNk8xZXRwMlBuZ3pabzFuVG9USjJ3QUM4SmFpa0prR2Vwc0t5?=
 =?utf-8?Q?UHAA=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(35042699022)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 20:09:08.2568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 361c3b8c-2ae9-4524-568c-08de05143530
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10541
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 20:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224502

T24gMyBPY3QgMjAyNSwgYXQgMjE6MzEsIERyYWdvbWlyLCBEYW5pZWwgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGRhbmllbC5kcmFnb21pcj13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gd2ljIHVzZXMgZGVidWdmcyB0byB3cml0ZSBvbiBleHQq
IHBhcnRpdGlvbnMsIGJ1dCBkZWJ1Z2ZzIGNhbiBvbmx5DQo+IHdyaXRlIHRvIHRoZSBjdXJyZW50
IHdvcmtpbmcgZGlyZWN0b3J5IGFuZCBpdCBjYW5ub3QgY29weSBjb21wbGV0ZQ0KPiBkaXJlY3Rv
cnkgdHJlZXMuIFJ1bm5pbmcgJ3dpYyBscycgb24gYSBjb3BpZWQgZGlyZWN0b3J5IHNob3cgdGhp
czoNCj4gICAgLWw6IEV4dDIgaW5vZGUgaXMgbm90IGEgZGlyZWN0b3J5DQo+IA0KPiBGaXggdGhp
cyBieSBjcmVhdGluZyBhIGNvbW1hbmQgbGlzdCBmb3IgZGVidWdmcyAoLWYgcGFyYW1ldGVyKSB3
aGVuDQo+IHJlY3Vyc2l2ZSBwYXJzaW5nIHRoZSBob3N0IGRpcmVjdG9yeSBpbiBvcmRlciB0byBj
cmVhdGUgYSBzaW1pbGFyDQo+IGRpcmVjdG9yeSBzdHJ1Y3R1cmUgKG1rZGlyKSBhbmQgY29weSBm
aWxlcyAod3JpdGUpIG9uIGVhY2ggbGV2ZWwNCj4gaW50byB0aGUgZGVzdGluYXRpb24gZGlyZWN0
b3J5IGZyb20gdGhlIHdpYydzIGV4dCogcGFydGl0aW9uLg0KDQpUaGlzIGlzIGdyZWF0LCBidXQg
Y291bGQgeW91IHBsZWFzZSBhZGQgYSB0ZXN0IGNhc2UgdG8gdGhlIHdpYyBzZWxmdGVzdHMgdG8g
ZXhlcmNpc2UgdGhpcyBhbmQgZW5zdXJlIGl0IGRvZXNu4oCZdCBicmVhayBpbiB0aGUgZnV0dXJl
Pw0KDQpUaGFua3MsDQpSb3Nz

