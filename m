Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09153CD4851
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 11:06:06 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8218.1778756754205133075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 04:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hv/SgsyO;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hv/SgsyO;
 spf=pass (domain: arm.com, ip: 52.101.65.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JWZipA8zlBBxi6UoV7w+anYO9wNdqudqTsIcfqU2qGcibJZc2LNFeaFhEjr1NZKRnRfoVo3m+UvoHdJB6ZrzQaMCnWHsIwjB9Ux77eseX57uEre1ZwRRhb4mHaxa/0Yu42GZQ3RHfeA+3qRyKSWjOr6y/z/fHVCFGHzKhzUPupRdvpY4dK4inMwSOkeKgRPBGDeC17hv8fRhPlfIGIz5qqm/a7j+AfqL184k1g5H2HpCgW+JeBHfU09hi0Z7hnDBatwesKzqsLeZ6ByRhnWC1gtKZQQbhL1/oVZkYaTwBz8ZAYGYPF6d6um/0ItLU6CyRMw/e8xiKvWuyT1xAHuKdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYHFUpirjcbU9H8XhSHYA631mAzdBTD5vX+3629nThM=;
 b=ITpa4kKiKzyjJy2+ig94jEAi5TnA/RbpOoLNqdDs2zBznwuIwYykzZhe8QO+NPV1dKODk8maAGwPwoWnwDCbQoZ/Z5rOJQb7Gk1ASVdzIdj9U0sS+d8yrPW2VCXXtepUin7Ucis4Tw/NcumWDksK/PpaCE/ZUJeJSkxdYe1PY5ZVIrivqMRqObutzmnV/hrPjfJdWCGYWrF062BS56ArdT7lFsFHQox+c/xQjeojB3g+Tv+MMurSb6bcMJsvqfS68QXXJ1MbhWBCaRaNcCPwKfWKGRF6i3viNvIHbedBLUZcaY7w+3pfjcTNuRcVbxe+CPaKAs///P6R5wN5AZgz6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYHFUpirjcbU9H8XhSHYA631mAzdBTD5vX+3629nThM=;
 b=hv/SgsyOSluIXvfAQeHPwyjPFdxYQ05ITt76a5r7mg7t54exco0cfQnUMGBFCHVZo8G9LcSrFL4qi578X+vIS9/7UPgNp9OFkILGKHqOceNB908BMlKpMwJANbFvkfpqVfiz9sS9eHD+6uiBu5OeW0gPMDpiHY6NUTFqSj3H9Zw=
Received: from AM0P309CA0026.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::7)
 by DU0PR08MB8712.eurprd08.prod.outlook.com (2603:10a6:10:400::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 11:05:50 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::37) by AM0P309CA0026.outlook.office365.com
 (2603:10a6:20b:28f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.0 via Frontend Transport; Thu,
 14 May 2026 11:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 11:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTV3SD5Xp0rczrqL4cqmuc5CEBbRFiRfTweTZ1FlzcTGHjqPwAY3zlzrUURrJMUkc4IbbWUB4fpGLzwS+7T+dwXOXbVsg0h0Op49apEYdnjd0soGMbKYTzsbOCEuOJjo8ZsBCugr9wCVQ/V0cVcL3jHUw2a3AAjrFYL3ZoidPEhMN8CDzLET4rLY1QWL0eamCjy0mORnFjzvX+BnRLDfQmi8olnCkd/0PIE9vycDp8Hu4aijNtD/IdEQw+Um/yoH5XjseSZk+z4iw0EtwfBhZ09GENIf9artmZzZfiRufYoM7C3iOWncEK8nBzVF8y9yD1S7SarKQEXQVFakD+apgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYHFUpirjcbU9H8XhSHYA631mAzdBTD5vX+3629nThM=;
 b=x2vdKgcJ3id/ahlDsr+L8VDCO1UHXKCTh/zA53YaU/bzYl/bSAYlLjaHy/9EGVMIFAFpMJdHBDXlio8gva4Xto9KpYNnlybErHL2kK6ILAldNUuFVxQuihq/7GejKtrm1GJYlgbSDmLdRxsTmCHilCYCNeuhoI1KrwIx2QcmuaH2ys5XR7SV7v372QipTsBR57gPOuqJjzSKMmqQRi054qzIIInyCaBXQEUD6G2Q9+mZ3vh4sGE0PO3HOwNSvGzHGdo0y2JlGC1jhNCrpVRjPMYQPjplUjaWT6jKtd5KXnwRjCvkoj3Niid9nVkSlLdOzlAIciujVI9u+um8Z84nUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYHFUpirjcbU9H8XhSHYA631mAzdBTD5vX+3629nThM=;
 b=hv/SgsyOSluIXvfAQeHPwyjPFdxYQ05ITt76a5r7mg7t54exco0cfQnUMGBFCHVZo8G9LcSrFL4qi578X+vIS9/7UPgNp9OFkILGKHqOceNB908BMlKpMwJANbFvkfpqVfiz9sS9eHD+6uiBu5OeW0gPMDpiHY6NUTFqSj3H9Zw=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DU4PR08MB11056.eurprd08.prod.outlook.com (2603:10a6:10:576::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 11:04:45 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 11:04:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "li.zhou@windriver.com" <li.zhou@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] xrandr: upgrade 1.5.3 -> 1.5.4
Thread-Topic: [OE-core][PATCH] xrandr: upgrade 1.5.3 -> 1.5.4
Thread-Index: AQHc4dxtGk9vLuic3E2wxuTao0LgrrYNXysA
Date: Thu, 14 May 2026 11:04:44 +0000
Message-ID: <E7E87A51-B95A-4E03-8377-C42D1B87A5FE@arm.com>
References: <20260512065535.117922-1-li.zhou@windriver.com>
In-Reply-To: <20260512065535.117922-1-li.zhou@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DU4PR08MB11056:EE_|AM3PEPF0000A798:EE_|DU0PR08MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f95202-ae45-482b-9fa0-08deb1a8c18d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original: 
 qZgkLcUCKhtJ/P37IP3qcehbqHJJwHmqBJWC5cgfiVT/eaMSYQnwKpGoeJL7rZN9C4xlHtuHJkLU5m8L3mkv3hvsZlfk0IBaQnckrSieVvfHrAxHdevmzSPB59EV7zZS/Axx0MGp0qwOrf3GvLgd+h32JvNWQ4py5qAglmK3cJnpt4NbP1ANZGSz6Th12YiRx3oLKabo8A+e/MzyiAcg9JyKrOzUxYDS1q8Eqg7Q+ONxPXmWiybrRiH84LhfAkV7oL/Em8KQJqWlA/q2zySL8vHEjENq0HbuIONyijhFWdPA7EOdMnPbD2aPMyCzCPqvLK2sdd9FXzN9pI25VAT54xqFG1FlY6GmcnWygaiVPTUTKcsmhlPO7e1fZuLsw2zZ/msQhL7XDrGKdf1HGT717pRVyG/f5J6naK+3sUd58LkA+APpLNfcSi+SoDxMFX4WAeZtVsKJSO/UQ/Qe0YPyY0xHBMmwuMakOEFWusi0OwtTkk7fw781LpAaxLkrHBzeDxdcyUAFB2eQbbOq7VbmV6r6DAAw/KMxwS3l6znsp4iErjf0/RJWnMxm0baTGpKRSyaXr1jDRRtUPJ1RUlb0gje/NtFjEAR4PMTT0s0+yiDgIqXHs5HO5n4BlZOsOMKKJDjf2FzhutzBMVrcyS2OEreVUELkAo0IwrRlMoqNMl3C0Q8N2oyGxyc17cXJYBy6+smCJcS2/AAzx3H+8HX1xA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DE33CF171B9114DBFB39D8B2365C033@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 rDb5zq5/qGpL1e1usYCTsyrXPelKfzp4CU8OM+dS3V+ltKC7ngbs1z/26uclNtNTR3MJuIm5AuPKjaZcBHKD3HqieEcrSZ3lHZhmvB7FPXdzEtBxzfPEEC8p85DIPwKL10T4Anmq2DFtZRczkMd12XCTfpQ3Bd63C0KGScOFwPCZdqpwBqQF513x+ROgPAMMpOKFkLkXlZQnEDFDan+zvkHkFFLTsXV9x6MJ/4G+EQRHl+rlcvS6qO0VtmgRlkEEcnN/PK0BaZbV5X6SP8N18L11u2zw3DhbUsQKzJBV1cmwxiAUyjFpn2VW+m2YXdgMmm4Q1XmUbMZBmkGK+6gWqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11056
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bf96a152-e613-4621-88da-08deb1a89b29
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|376014|36860700016|14060799003|1800799024|56012099003|11063799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	t+QVqcZ/WDTbOt2Vy65xMmf9mHeAxgPUWqEdnwlJpqr7XEWJdFoW1kp53YbRY7iNwM+f2jlnrF/VCC0X9+4RoKg1MQEchJf+Y8ImdCLgCw0ACNNN5xkvwOVkfSNAAV6EYlGnSjg5ZI/soiAXqHBcIaKMn10FKFuCNajAkrNQXitkEes6PDlFEx6AA86LxF7qzO52kVRn0ZCB0of3dLv2NTfR5wNCHfGZJ64JfVCxTlzGfrWcpFpifuEwveyX4qk8SmhryxN3HMJMK1WxDuBm/JyK2x0Syl6JCWeoh/11FWfqG8MXsADkQMoazdDRI7Lfm6OidG24FvZJzC2hccoU5qtWXdQ/1mmVrj8qNq9KpC/bSiH9Xo8+BJszr8igQjDV8tt/3PSr1B7wKS6l4xJDsS0BbiEODhjTSsZWbB/RO/hkzSgj+lXzTDqh/4bePZTPcKvIHVTVVI52j81JiC9ILHrBf8b8DbnNdj3HnBZnQ4xgcsjm3thaz3hGVUtka1r0+sbQx/7JObtpCdjCQOqKU18qUJ3xotdB1H3Spho17FDtjDh6F6vlOlq/fXtFtA0JyV3cM4J7mVHFCpJXYf5mSnrftt1Y3M//etIHyxJvIgECJ+pJsWJKGau/29zRLfuInlUgy4BI4Tjj1acH9N3BESzVpOS1m5S+1kDmNWT7CE3Bx8uFAwn2zJpiovj7fczc
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(36860700016)(14060799003)(1800799024)(56012099003)(11063799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	C3CGFGTrwNLLQyqPETFcgTFqZZtA4Vi23FiHCauATZVE6iujhNSiKWvp2zjTYeKswMzR4uKzoMgSJz3MG7H83aW9timLwaHTzelG8JueqXd6uTj6ps1gh/HRvunUT4x9W1E2rN3164ziJEWzoI0N5rV6MtnwKc3GoiXul7Ft0S4KkvJuoT9XQU+CpKeLlI5GpLDQwz2GAKk4Mahb1eypiOZCLM0w9IYoiRampgADYeAyW3QhQ+/WADisVAtvdUrI1Pz6SDtdYnjCrwOJMnTqdsjXNzMA+bHBBmSX+B3AI74s9nD8DnbRQCYS0sPdBTsNQPPRu11MOiZUz1EHP60nLuqnenpib6X44B8lGK0vBUbN8LDDQQalNqb8YbxLFdK7ayRTg+pEQS1nrK6eBVA5VSdqJ7j2bcLCErCPEU8g17iRI/Edv0iL86kgP8ZP6Tph
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:05:49.2681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f95202-ae45-482b-9fa0-08deb1a8c18d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8712
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 11:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237026

T24gMTIgTWF5IDIwMjYsIGF0IDA3OjU1LCBMaSBaaG91IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxsaS56aG91PXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IC1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1mZTE2MDhiZGIzM2Nm
OGM2MmE0NDM4ZjdkMzQ2NzliMyINCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJ
Tkc7bWQ1PTk3YTM2ZDVjNjY5NjViMWNlYTQ2NjZiMzcwOGNhNmU44oCdDQoNCkNoYW5nZXMgdG8g
dGhpcyBuZWVkIGEgTGljZW5zZS1VcGRhdGU6IHRhZyB0byB2ZXJpZnkgdGhhdCB5b3XigJl2ZSBy
ZWFkIHRoZSBjaGFuZ2VzLiAgSW4gdGhpcyBjYXNlIHRoZXkgaGF2ZSBubyBpbXBhY3QgYnV0IHRo
ZSBjb21taXQgZG9lc27igJl0IGNvbmZpcm0gdGhpczoNCg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL3hvcmcvYXBwL3hyYW5kci8tL2NvbW1pdC9kMjljYjQ5NThjNGNkZWY4ZDY5Mzlm
YzRlODkyNTcyZWE4YWU5NWU4DQoNCkNhbiB5b3UgYWRkIHRoaXMgdGFnIHRvIHRoZSBjb21taXQg
cGxlYXNlPw0KDQpSb3Nz

