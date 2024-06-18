Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6052CC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 16:57:35 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web10.985.1718729848436501126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 09:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=j49Eye2l;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=j49Eye2l;
 spf=pass (domain: arm.com, ip: 40.107.20.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fIksfhVSkKCU1LHaTVG2lPNTvyaP2LQpbJyAQrVFIRiZOjwLBzIJdWpl66aybWrBMLEGqxWALAdb8YtWs3gLIoenNY9qGEjXbHPLXywsNuz4pNois8UMuEOllP2jnEZ2nMfaC2uaMxHe8UCAv9Bhuuv94g+DerVzFzEFGChyD8cIVEYrSv60vqHHAUC983eiDzuwoLJsz7rtoQJZF21T77gyfFXGtsDA4yeqFdtRu2ysEpd5K5v8BaX1xQ4+5iEb1UTnEEmcfpJcAMvBFpo22GHRqT8bFduM2s6O12eBjhsWQ9dzevkK5inR5bYOQ+eRgncY43nMUEMHV9A38Wmlsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u6JTRu8ebv4XeyZji4dbipPFul153NrU8eqzOi5KlM=;
 b=VYQKBlFChv7M3wPWK6F7fvmoStt86GocL1H8cpHvSuVKArytw1NYBDdYdN+Z/Mwksk5i1AviFrauCeSQE10y6HTxLTz/Xaryqcm/5luF4TQRYRNxZtX5M0o6Ld6KJhvNRihET5u/K2TuXfGlnglhQEqGQNwiCgVux5T5J5Cntu8mFP2KO0ZBhoa/mfC7tf+lEI1LBOWewiMY6UsG0uygEueau5FInrQasdO7uxiJiP/d1tE9FtuOqpJb/iBM5bbIlvhGTUWERLrC0g8WuHnwgJ8H9bIuIiwtsSZGesTMNlnAn9c7yZ0VLYtdaNh8BnEk2aodhrPQ6qN33Blu7XKHQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u6JTRu8ebv4XeyZji4dbipPFul153NrU8eqzOi5KlM=;
 b=j49Eye2lb9DITgGkgS5T7s7bmq8pMIy5M95x/HmSb0VoZnmGMtxAZgndWdhlZejVj60WR8BKYihHTorHpYa+UzBCzpj8nFhCHk2/OzvPoMOSJKyTeQojEayCsKDNce2qaVgEiqGDDrt1DiM6eSJMAkjrFJ3DsyqvSO/j8Or/OZM=
Received: from DU6P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::22)
 by AS8PR08MB7839.eurprd08.prod.outlook.com (2603:10a6:20b:52e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 16:57:24 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::e9) by DU6P191CA0007.outlook.office365.com
 (2603:10a6:10:540::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 16:57:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 18 Jun 2024 16:57:23 +0000
Received: ("Tessian outbound f73a80402c83:v339"); Tue, 18 Jun 2024 16:57:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ed4e7135737b50b
X-CR-MTA-TID: 64aa7808
Received: from 0722274e374b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C3274E37-ADE7-470E-B104-8EF844088626.1;
	Tue, 18 Jun 2024 16:57:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0722274e374b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Jun 2024 16:57:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctsOx0a/hmnW8QKuxnC5L9lyU2QYBNnRoHDvRXQOU8/AlB4Ra3k8gg0ZTSyJpMFYMNcYrQOdaV6d7IlHnzaqkaS3JMHG/hSI9V1TbwnI0NWp9h4lmWKWbtgzzNUT2Ll1RLui0kQ2B1mH+PkhtmI0QAfe0v7W15otJOvNmcMXX810eoj1/qZjr94J+iNuYHtISN6y2szJOcNphSIvHTyL6fSUGhnw7iWUcGDeNlQFMjXhgkU7L/WLrJ8owKga+OSgBzd+PmBGbLNwQFRsbfUHRsBYvdyROmMwHNadQ7NpWWdKTcAuF/vdHNTeTWr7uNv20fbEYdXR/qEiF40tyybUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u6JTRu8ebv4XeyZji4dbipPFul153NrU8eqzOi5KlM=;
 b=PQid2kfjPwdkaiyftuRYc88R+D5a7OIVorFlQniGEDZSg6rPPQLeBBoT/Oa4NVtlVSlGaIestXjYirhId174CFfHiThzPG1T0ROJsacG/YDKyCrOp90/TTcDm/txfdbK5Jm1i9NooT2R2wYcbl6GeOATH0VVoEWl7ViUE/JY5rxU3A4xMWF0y+kj7uMT6KsOFTW/Dx2MFVY4yg/xVwbvFktev+hlFhK5KOmuQW3gWG9l2Lu0Z3hZRPHKHZYiT5AG4FJAZxtVZ1W5XCYEK9P+XX2WN0Bizt0sFdciepluc/jekCDDmilsHeGqoyHcdUFAOEFbWd9qAP9QkprSui+O/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u6JTRu8ebv4XeyZji4dbipPFul153NrU8eqzOi5KlM=;
 b=j49Eye2lb9DITgGkgS5T7s7bmq8pMIy5M95x/HmSb0VoZnmGMtxAZgndWdhlZejVj60WR8BKYihHTorHpYa+UzBCzpj8nFhCHk2/OzvPoMOSJKyTeQojEayCsKDNce2qaVgEiqGDDrt1DiM6eSJMAkjrFJ3DsyqvSO/j8Or/OZM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9465.eurprd08.prod.outlook.com (2603:10a6:10:457::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 16:57:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:57:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "johannes.schneider@leica-geosystems.com"
	<johannes.schneider@leica-geosystems.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v1 2/2] systemd: bpf-framework: pass
 STAGING_INCDIR to eBPF compiler
Thread-Topic: [OE-core] [PATCH v1 2/2] systemd: bpf-framework: pass
 STAGING_INCDIR to eBPF compiler
Thread-Index: AQHaukkoYBoo53hI1kWdeIfRxFLAVbHNzIQA
Date: Tue, 18 Jun 2024 16:57:14 +0000
Message-ID: <9E1C8B14-8015-4691-9BB0-B02F401895E5@arm.com>
References: <20240609084321.1070686-1-johannes.schneider@leica-geosystems.com>
In-Reply-To: 
 <20240609084321.1070686-1-johannes.schneider@leica-geosystems.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9465:EE_|DB1PEPF000509FD:EE_|AS8PR08MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 9265d5e7-e4eb-4f74-9dc1-08dc8fb7b9d7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?OStnOG1uNzh6aERHWEpWNEsxNW5nU0RPVUlMMmNFUWx0c090a0FLZUU4OUkx?=
 =?utf-8?B?d1gyZThEQnUzRzlYRytiaUozckxsaEdpVXRYaFJQODdQKzYxaWEyOFpaTFVH?=
 =?utf-8?B?TVNsWXY3RWo1d2tCWTlrNzNQaVB6a0l6NERCUFJlV1lUeURkaEpnMFZ2ZUVs?=
 =?utf-8?B?cXNaY1h5d2NLV3lHZEpadnNtRnVnYkFVK0dIcHprVlFRdXFkcWx5bzZualFJ?=
 =?utf-8?B?d1N4a0ZyL05aVisrME1vWVE5L2EvVnk4V0dheTZSRUpPZDN3enhzTHcwcWtW?=
 =?utf-8?B?QzNCdzY4QUp1NGZTQWg2ZWFydmxTSXl3LzgxUzZHVGk4YmIzNGVQN2x6MUtV?=
 =?utf-8?B?cnJPYm9BSGIwcUN2bTVoUVQ1eXR3M2t2ZjZxRHF3QVh6ZzZubEVQQXBhK3dN?=
 =?utf-8?B?OTlxUlF4YWxMWTJueHNVcVBwOTk3ZWhkY2pBMDk0RmlTaHVwVCtzekd6MVIx?=
 =?utf-8?B?RG1tcU0rVTdYZ2MvbUw2akorRUhMUUtEQmhnNXErcnNlaVpTbk1oNzBwU3BS?=
 =?utf-8?B?YVhZSzcwUGlwTnhkald6ZnZyeXVaMTFXamp4K2JJL0NPOVJ5eWZKM1ZRL1Mw?=
 =?utf-8?B?QmVwaU9ma2gyN3RJM0N1dG1sa1JBYnZxNWtaOE12ZUxvSWlXRUdFQmsvS1JW?=
 =?utf-8?B?OUdsaUxuNUpERzJTWDd1VnBQSkxCQjV4WXRHVEMvNHpnT1JUNEZ2eDFDcWFS?=
 =?utf-8?B?VHJXdDI2NkJPMG1uR21DdThFYzhydHF3L2lpOTBOdzRWTkJQdURpTkxCajBq?=
 =?utf-8?B?RTM0YUJEZ1ZKMndCQXR3ZXpiSXN2M2I1dHlYdC8rNThGYUY0VHhNUkhQRkVG?=
 =?utf-8?B?eGEwVituU0ZwNGRUZ2xoVUZBM0RkU1VsMXY0V1BQaWRWcmNQZEFwbFVsN2Ro?=
 =?utf-8?B?NUsrRjVDL08xV2ZiZ1RPb2I2YUJwalJGMldiWmtOWmtDMnREUnpQWjdaQmYw?=
 =?utf-8?B?b1JkQnFMdUwvQmdpelRHeXhGUEZ4TE5VZCtpeVJTKytUMjNSN0dEL1Rud1JE?=
 =?utf-8?B?eGw0YTJ1ZURkMWFtMlYxVWo4T1krdGZSY21LTW1BMnFTcUlWYlQyeTB3Tllh?=
 =?utf-8?B?aEJjUjViV3lrUGdCcjFEeFUvaU8vb3JLKzN0eW9JZFMwSTc1cldiWkh6ck55?=
 =?utf-8?B?TUVvSEkzTm9GYWt6R01hRnFLbUZ1amdjZlk2YmRJakF0d2V0NTJsdlh3VlB1?=
 =?utf-8?B?TWpCSHhBcDFpTGM1ZG04aWhGSGw2TXVyR1JhZjhmMVBJVHZOa3Jmd0dENHhx?=
 =?utf-8?B?Zk03RkF1YTVaQ3NQLy95SjFTOXpLWExvSFQ2KzhMWDArQitLNkxKVkZ6YVpS?=
 =?utf-8?B?S0VnUE5GT0l0amZlYldmRG1ORWRHTlEzZEtKRXQ2cWNNRjMvUmZaOHV1UjF2?=
 =?utf-8?B?N1NvdU1SZ1VLTHV5c08xVzVaUFlubC9melBnbVNlSHpBdlhGQXhwejExM0s0?=
 =?utf-8?B?Qmd1QksyMjRWOFppdFNGYjJRZEFnQW9McWpzcFhhSEZjY3YzYVJIdzNhL3lC?=
 =?utf-8?B?M3o4eEMxVG9oNXhpeGRYVnRxb2ZBZVJBZlEvK2JWaUFFZ2dMQzdYZUwvYXY0?=
 =?utf-8?B?TTFPTHVuVU5rQW1yOHlpOFJ5QlhkYVlpTVpwZXFVdGJJUVN6a0tBdjErNzlW?=
 =?utf-8?B?eEtLZ2k2UmVoclNYZmR1T1NnbGtKdFZlS1VFWXdCek45WkZ5OVBxT0ppb2gy?=
 =?utf-8?B?UFM3cmsrU3JRa1J1Vlh4SGxsbW1DQWZEZlgrL01RWlpsSDFxM0xnU3RObkJD?=
 =?utf-8?B?NVo1N1UxMlB2V3NZZGpZOWorR2JvSm1RTXVRU3FUUHFwRllHZ2Rza05mT0NW?=
 =?utf-8?Q?eifTI8SAQ4dqqLhT1rBAKBlkE/BtOtPc7Bam4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F584A81E5849BE48BDD9D30879B33F2D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9465
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4324ce29-2f09-4d70-75c3-08dc8fb7b481
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|376011|1800799021|82310400023|34020700013|36860700010|35042699019;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aHYxTVllcWRDQjhVNmNnNlo5cThCQ3A3SzZZN0hRRUR3S2hUc0NqZlNvVTJV?=
 =?utf-8?B?T3drZ2pTTXgwTXhOQlJvZHltY3JuSFFHWTMzSjdVYWVQK1NmT2pEZ2RTS2l5?=
 =?utf-8?B?a3JjVDhERGI1aG81bytuMmFYZHZvWkpRMXdHblV0end6Z0ZueVRPVk9pY09a?=
 =?utf-8?B?V2JpU3h3M2o4N2Y1d2pBaGZvNGFWRzN1TnF5UDcwTVNVZkwvbmFWQitBUFBG?=
 =?utf-8?B?emhKV20yZnROeEZVeE5VemZKMWtxenVmMzZnQkJxSE9JT2lObDVKSnRyVE9a?=
 =?utf-8?B?dWdIMGhDd2tOdG1adWpCVDBRR045OHd1OGo4RzJKMm50QVEvanltamM0T2NQ?=
 =?utf-8?B?QWZjZ1Fod0ZxSldiRVh3YndTaEZFVDVpay91enRMUU4wbTNXWWtMaXd4MXp3?=
 =?utf-8?B?YmJ1enQwQ1dSZkxleVhVT0pwQWxMa1pIRUkxaDdUVmVKcnh2RjFGT3lOUkhm?=
 =?utf-8?B?cmdzV3JFME5UU0ZuWGJUNlJ6WmVoUm0wNzRrZGFGeDNCWmpxc21HYWZUeTNH?=
 =?utf-8?B?Vnp4MTNoaEp4UHNnUUdDTUM2bmtweTdvOWxJU2MxSFBENUdWY2NTUlVxdkN2?=
 =?utf-8?B?aDI4VE5ZZVdyM0JmNE0rd3Y0Q2Rnd1pHRHBrUzRWam9TRG5abWpPd3B0aElo?=
 =?utf-8?B?L1hST3dIZm9LQStPODNYUlRKaHVuTURXK29kMU5LMmFzTUpaUFAzUERFUVlH?=
 =?utf-8?B?dkVXazNVc0tQb0NkdFRwTkRlMTArNHU0S3FwOURvSUxxbXJXT0Eva2tja0V4?=
 =?utf-8?B?OXkwbFRmTXh3b0ZHdFA2OEs5WnI4RkpFQmFnYmV3TkhlSlZsU0RTSnk4b0VF?=
 =?utf-8?B?MkRjekZFWU94ZlJHSDhjdUY1VDZHY0pSL3JiVkd5VHdqVFN0cWx4djVUZzBa?=
 =?utf-8?B?NG9jYUxHbXJxeFpGeTJlY1JlVSt4VjVueEdscTZiNk1YT3R3cHd4NkNrSWVF?=
 =?utf-8?B?REQ0L0wrVWJJc0hkZm1WNkRCS0xxNGc4bUlQMkRnOXdSUVF3aWVLenBydWNN?=
 =?utf-8?B?eHQyUzNCZTIwTllHT3R1WEdnTGFGT29IeEZrMFA0bVhUMDdLR1ZRbi8xb1pr?=
 =?utf-8?B?Q0xBNi9ZbDFwS0E2SXZOenlocWxwenMwdkk5b1NNNGI3TXM0Lzl6MnJzVGdI?=
 =?utf-8?B?aFZFb0RuVndsQzB2Tnd3Vy9ML3B2K0luRmswYXJ0SkJlSlBONlovdThFZExk?=
 =?utf-8?B?YmRIK3FSMEZSRXptcDMwcXN0c1g5dExZNE1lbHpkQ2RDNmxub1IwcXRvcDRR?=
 =?utf-8?B?VUtEMzNaY2JnY1hDS3lMWU1NSHFyOGFkQW5tMk1wNVd4VDFieVNOb3piT3Q1?=
 =?utf-8?B?b054bUhZNGdQMFBUK2d6bmlqK083aTArUHhNVzM5cWlReWdZZ2RXdGJValhk?=
 =?utf-8?B?dDlQdUlORWJUQzNQWnFpWVhRUUxtdXowYjY0eGNXWElNQ1Q4N24yaDJ3Y2F1?=
 =?utf-8?B?L3BEZVc0ZUNYc21UeklEWVpLUXlwWVV3WnJCbldibFJzMVdOcHZMbWhhMFhM?=
 =?utf-8?B?ZjBsZnVJdGxTTEcxVUNBbXQzL1VjTGxrYWxNVGM4a00vUnVNeStMQkJLMEVZ?=
 =?utf-8?B?Rmo2OEdGK0hpajNhMFZtT0M3a2FJWEFRbzd1VGVmY1k4L1lYQldEeWNxTGpP?=
 =?utf-8?B?ZjRDbDFva004UGJJWHIvV3l2Yk1yY2lzOHN5alk5MlFtOTB5eWlHS2huNWNz?=
 =?utf-8?B?d1NtSTNLaGVvNUNOZXZVSkJ2WlpLWWl2aitWdktqVlY2Z0RveFZJSFJES1pm?=
 =?utf-8?B?aVI2bUhJQTlGZkZpd0FQVVlYekRBTDVrYUJaY0hhOHVjY0FrUWhaQXFvU0Jx?=
 =?utf-8?B?YUNnaWJ5ZnljajdrS3BOK3NiVmVVbW1iZUgvT0dBekc3alNBanRWM2Jpdk9O?=
 =?utf-8?B?c3cvZ0JQNk9TTEkvbDJJMzRXcVNZa3BnYjQxVGQ0RjJjZHc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(376011)(1800799021)(82310400023)(34020700013)(36860700010)(35042699019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:57:23.9470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9265d5e7-e4eb-4f74-9dc1-08dc8fb7b9d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7839
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 16:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200880

SSB3ZW50IHRvIGhhdmUgYSBxdWljayBsb29rIGF0IHRoaXMgYnV0IGNhbuKAmXQgYnVpbHQgYnBm
dG9vbDoNCg0KRVJST1I6IGJwZnRvb2wtbmF0aXZlLTEuMC1yMCBkb19jb21waWxlOiBvZV9ydW5t
YWtlIGZhaWxlZA0KRVJST1I6IGJwZnRvb2wtbmF0aXZlLTEuMC1yMCBkb19jb21waWxlOiBFeGVj
dXRpb25FcnJvcignL3dvcmsvcm9zcy9idWlsZC90bXAvd29yay9hYXJjaDY0LWxpbnV4L2JwZnRv
b2wtbmF0aXZlLzEuMC90ZW1wL3J1bi5kb19jb21waSkNCkVSUk9SOiBMb2dmaWxlIG9mIGZhaWx1
cmUgc3RvcmVkIGluOiAvd29yay9yb3NzL2J1aWxkL3RtcC93b3JrL2FhcmNoNjQtbGludXgvYnBm
dG9vbC1uYXRpdmUvMS4wL3RlbXAvbG9nLmRvX2NvbXBpbGUuMTA1MjYzNQ0KTG9nIGRhdGEgZm9s
bG93czoNCnwgREVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb19jb21waWxlDQp8IE5P
VEU6IG1ha2UgLWogNjQgVj0xIC1DIC93b3JrL3Jvc3MvYnVpbGQvdG1wL3dvcmstc2hhcmVkL3Fl
bXVhcm02NC9rZXJuZWwtc291cmNlL3Rvb2xzL2JwZi9icGZ0b29sIE89L3dvcmsvcm9zcy9idWls
ZC90bXAvd29yay9hYXJjbg0KfCBtYWtlOiBFbnRlcmluZyBkaXJlY3RvcnkgJy93b3JrL3Jvc3Mv
YnVpbGQvdG1wL3dvcmstc2hhcmVkL3FlbXVhcm02NC9rZXJuZWwtc291cmNlL3Rvb2xzL2JwZi9i
cGZ0b29sJw0KfCBnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiDi
gJgtZmNhbm9uLXByZWZpeC1tYXDigJk7IGRpZCB5b3UgbWVhbiDigJgtZm1hY3JvLXByZWZpeC1t
YXA94oCZPw0KfA0KfCBBdXRvLWRldGVjdGluZyBzeXN0ZW0gZmVhdHVyZXM6DQp8IC4uLiAgICAg
ICAgICAgICAgICAgICAgICAgICBjbGFuZy1icGYtY28tcmU6IFsgT0ZGIF0NCnwgLi4uICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGx2bTogWyBPRkYgXQ0KfCAuLi4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbGliY2FwOiBbIE9GRiBdDQp8IC4uLiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJiZmQ6IFsgT0ZGIF0NCnwNCnwgbWFrZSAtQyAv
d29yay9yb3NzL2J1aWxkL3RtcC93b3JrLXNoYXJlZC9xZW11YXJtNjQva2VybmVsLXNvdXJjZS90
b29scy9saWIvYnBmIE9VVFBVVD0vd29yay9yb3NzL2J1aWxkL3RtcC93b3JrL2FhcmNoNjQtbGlu
dXgvYnBmdG9cDQp8IAlERVNURElSPS93b3JrL3Jvc3MvYnVpbGQvdG1wL3dvcmsvYWFyY2g2NC1s
aW51eC9icGZ0b29sLW5hdGl2ZS8xLjAvYnBmdG9vbC0xLjAvbGliYnBmIHByZWZpeD0gL3dvcmsv
cm9zcy9idWlsZC90bXAvd29yay9hYXJjaHMNCnwgbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5
ICcvd29yay9yb3NzL2J1aWxkL3RtcC93b3JrLXNoYXJlZC9xZW11YXJtNjQva2VybmVsLXNvdXJj
ZS90b29scy9saWIvYnBmJw0KfCBnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5l
IG9wdGlvbiDigJgtZmNhbm9uLXByZWZpeC1tYXDigJk7IGRpZCB5b3UgbWVhbiDigJgtZm1hY3Jv
LXByZWZpeC1tYXA94oCZPw0KfCBnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5l
IG9wdGlvbiDigJgtZmNhbm9uLXByZWZpeC1tYXDigJk7IGRpZCB5b3UgbWVhbiDigJgtZm1hY3Jv
LXByZWZpeC1tYXA94oCZPw0KDQpMb29rcyBsaWtlIGEgcHJvYmxlbSB3aXRoIHRoZSBob3N0IGNv
bXBpbGVyIGJlaW5nIHBhc3NlZCB0YXJnZXQgZmxhZ3MuICBIYXZlIHlvdSBzZWVuIHRoaXM/DQoN
ClJvc3M=

