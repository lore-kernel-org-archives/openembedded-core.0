Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7D1C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 17:16:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1060.1783962992836323391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 10:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Cxxem1ko;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Cxxem1ko;
 spf=pass (domain: arm.com, ip: 40.107.130.20, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WpJgMx5XxK5qqRTBhey8CII+1t5HrVK+IrIcqiQKhagk86JSXfShmD+TjB40Lkrd80WL8XPJc25RBZSVepd4114W9QyOl1gBNfTxdryYpNyvcUoiuFwyikToMTRDcInyH+q88I9nQul2jaimjbHuFAuUoW90nhvKtBxlXPJBP+J0RqlvCvu5y9Cg9+EOpgVjOSBg7ysXEKztF7YrUk5MzMfymHA+BewbIGwjm9Rtp5Ert7JfZan6EZaRfHGDJ9zxhRm5DQ9CrQ9Uae+Kct762h1npSywmVhH4h62M1MyxpbGSnmgU0IGeNTp0hVZ09ZXNrNyr1lQyO7Bl3xCEHFp3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X92AT4NcHGzcqZEBgleHuaelXXt03zePBwqdmOwYkZg=;
 b=FvAKkfLyM3rszIQgz2Kxfny/tY09+aRXcIfouM1Pkrf51eWae75zjDzU2y3+HrTuMjykF7djZm+JN8QRfDSL/yLRw0Xw4/hl1NtncTKp1TYkdOmL4vZxiLtmftIXpMQypzUIYKeSSJxqxNsQvTlAP+a7t8DY8iORFCY+mhUjfEZpx+2cE3FbvYon6SFyNMtj56t2ZZmEQ4iHqSf5yw4V/utosLiz+KOiHZrzGdZ/mFHJkPKfdbujmmsNzsNhHFQj/28e8OHRde4FidmM26s0L/wgScCERJvN6Tft4hxHVVyp587gG9SZ3PHEBrzkV/FuMLPR/SF7SYTAJT5CDc/NyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lge.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X92AT4NcHGzcqZEBgleHuaelXXt03zePBwqdmOwYkZg=;
 b=Cxxem1konpt6e2gfoLJccZ54osDF4qex5Y/uDZ2/ZjatSTQT7h4Syta0vSYz7jRPgBkNKoh8in1nNQOAEnEA/rtEnGSorYmrzxVxLjcwQH88loWwWiFyT3MDrkE6Fy14SJqJHQkW0/8Ev4I0MXdwS3JLDD2zOIk/Q6wG0t1F+cM=
Received: from DU6P191CA0034.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::6) by
 GV1PR08MB10955.eurprd08.prod.outlook.com (2603:10a6:150:1f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Mon, 13 Jul
 2026 17:16:25 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::8f) by DU6P191CA0034.outlook.office365.com
 (2603:10a6:10:53f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 17:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 17:16:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOUmdVqIFZvD/ksucm6H1o5YCZUrtvVzrhDrkhkib5wtNMe+anUxTvUtOIf+fbXUqNaBrjhWuRxJG5XjJkBDN5iqzclnjhJpsUwvaqw8eF6oVSC1rRJZu5DgSgDDpXL+lUD2h9c/tusFCzO/q33JShi3UHTd3KbTZfwZvwYfsrX+ZUmsUnhFz0Y8vhpAEcixao5xZqc1Gmfr6YEflPQLhY9s1OG8NLbb/qsQhy0TSbccyHM/RjonLp7r+pqtxeVi1UYfVCnyCA0bvf0ZAOCQgBivyJmTmEqVaLbs5mSZ+lEEKgVdjUdy+FDxUQfIOGERGBws5XQs+p8NRk8zy33Q9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X92AT4NcHGzcqZEBgleHuaelXXt03zePBwqdmOwYkZg=;
 b=n8kHULQfBay2aD4TCZV9oqJENR+op9s8Ux2EyWAjOZXOQTWb+UWmHLVfV6JGTrs6zsNw6gDrcjqGifi9wWHXUDZJVUHqaOdZawD35HQTKQ4q9/kYdtGvQ/C+RacFvEe9DWJTK2vY0eeksisF1EkqZcRS0MwcNnv2Ce2ME7z92W25oQ/Zr9nfBFKLFm5NQ94gXbt9TPk4e7c665nvBqt3s5XQ1U4MMIQNhqD1W00gmGGLqTrzI7s0ASgKe6oCX6HtWuGIGDPbrA+uXZ7Ijmw1wK9PTvpOkUSVADl9UJH8MabIbH91FUPsQNQ80SlFuPK+n8qrspPR1K4tFmJecztJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X92AT4NcHGzcqZEBgleHuaelXXt03zePBwqdmOwYkZg=;
 b=Cxxem1konpt6e2gfoLJccZ54osDF4qex5Y/uDZ2/ZjatSTQT7h4Syta0vSYz7jRPgBkNKoh8in1nNQOAEnEA/rtEnGSorYmrzxVxLjcwQH88loWwWiFyT3MDrkE6Fy14SJqJHQkW0/8Ev4I0MXdwS3JLDD2zOIk/Q6wG0t1F+cM=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AMDPR08MB11368.eurprd08.prod.outlook.com (2603:10a6:20b:71c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:15:23 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 17:15:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mark.yang@lge.com" <mark.yang@lge.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/4] python3-cryptography: set CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH 1/4] python3-cryptography: set CVE_PRODUCT
Thread-Index: AQHdED/w8LK6i5IlvkG2HCCikhXBvbZrtdKA
Date: Mon, 13 Jul 2026 17:15:22 +0000
Message-ID: <28D154C5-B096-4414-9077-D5BCD987B9D5@arm.com>
References: <20260710074415.3341616-1-mark.yang@lge.com>
In-Reply-To: <20260710074415.3341616-1-mark.yang@lge.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AMDPR08MB11368:EE_|DU2PEPF00028D05:EE_|GV1PR08MB10955:EE_
X-MS-Office365-Filtering-Correlation-Id: 159e20f7-b019-4509-aa6c-08dee10277e5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|38070700021|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 8mFw9dVzZ1SIpMYXkPN0ofQwtyDByNzEaqIRn5ifUFsFllYMz22lvOoRuDTeyjaCGsByJ/OSeBO0lHUmIB1iKNIMUF/7S4JXfgAG4YHXTUlWRRGU5XGlLT6BQuUUHPDrfUz9OMkGLL/TyyY97LVo0o9D6iE55Dew86utNdHHlznSXy4rqeZjpqV71oMO4DsUbl+nafKUuxQwpCD6SdQK6YZFw5OB1yCC0V5rh6qf53b0gGMzkqX7UlHYe2wk+C3uqAU5WrZS39UL99hoB2ObVr7OSddL8dOYwdZ/K7Eh9PSGxJWL1xYyR3KSLrwuXMaKjYYeLKo1J6G7nY1rgdjA5HuTcHLYA7X8IyR27xNSzGka22KN6Y3TubEGnEkZQa5LL+i+RbTWdKefJCvVQoqmKPPSsc8rAnwvstjw927Nb+ombwm9KgulHqXQ6NqMbP4h4xseYsAwDYpLg6IqVwb5ZyZLoSaWJ1tK0lTObodhrBPoYePy0ngg+8IE7AUE6qb8TupUNnao8Ga2iVmmeN/0HO8/v2UJwuDCKufsZ1UoXhUb/gXmAv+oUw5Dh5zWsAVSWjXD0yDRpDN6jFpbFqEc6+uY71TVazUBj0FlOP15j/MHVSVp6VnzGq4Ldj67ZOFhuyXdIN6mNXY2niOOoowiQRBzk1ET7mDbhVUvP+dY1o9a0LRGXoSuM7MeSH0yurvl9iaYRE7VmzzZXpAqe9ov3MFrBUc17hJ31x9/EuM1dTo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <62D14FBD8926C24AA2CAB90FF4F86C9A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 JuQy8EPjvGYlLHHQ3scveCT3XqdgMhBwLKLobAOnd5SznFetylvxpP2Ae3197WQFqX7ty2GajtuEAXlpBBuAeXo4+ztpv4wEzwoZLvknFZeWavRhLvV5P6kj2/D7eRnpR3nDsqJNULhLIDI7pLeXqsBQiZvOh2/KlieQMnOR2xLvl3ed/uaG6wPYKvKxUZYR0jbVPrVnYiCHs+YpC3OVIWQk2B/wXkioPZVycSjgOZ2UFyN7g4P5ParkjbWXuZmCkTAcCjBDkUPgPFyzflFHZ0Arthd4vXN9zPPfM/BeT9Ulobiub4U27HQXNHTsRG6KxG0L54LsUEgTRB3wWKPq5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11368
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ee55dbd3-5a98-4c33-498f-08dee1025273
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|1800799024|36860700016|23010399003|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4YLjjLPYGmmuwOJ0cZIJ1DuLTbfT3jYHoRjLCXHwwMGie9uccnk9jNjZnXy02b64tDbVN1/y9a+9gTVVBa7OyCefcPca9WrFBGxPlrtC42uzIC4uWQRGXn4hVdzt5NWjDxnVJihLn+VjiAl/ezlKh3HV9ZgLqKx92zkKiWrqEPBnuGExmtcV/G9Ls2s7LnKnD4x/zuvou43kqW8LUpN6Q/QA9BPI2MRA+SWpB0AmvE1C6EYlxzIUoB6376gX8EV3Tpi3vkqlYhBs4zCrkRIgK7Z3lx5NRYgldVjqFBGPnWYXjY3yWTsUsMq2oe6zhuCRrAsHLL05DVmow1ukvAPIZgkPiubOWeYVsbdkJIayxR6MNhhMRIrX/+GPEBHyFDlGD9Ioj290fKGoimLujttWhz7TB6doha3l0tXkaGulU9hrAwOcyl6u248Pf2GLCPQi01s6doUp6KnIOJmYqiqOT8jKhbNclQ59VxaXFXlUHHripWukWRTY5iTvvy4rG6Z+Sn7fnsH2zYvXR5wL536todgKV75DxBT3sPiy+mPORCq/GoqZtfMCuEyrxFN5nO3QDcy9cCzQnodO8dA+lxWGGKYi7KoiRbE+ClZHVDCutO47zukXB2S10pGQkcBmKm9wJfzctcmI5izwSLDyEBP0u71y+jouroHrWn8tUn1JhzAvHo7lWUYerjR3tCUwvlR9Tjp6rsNGJcMcg7mFDHj2jg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	N8m/hLj1oDAdSdIeCchjRKOdRDJk+Y/SUGzQD+nOr698W3uAobrfG/z2cKrpS7cllS8yrbXmuvL1t2MBq3SszxtBSKr/XXr2Kf4Fduw9mK7ZjFzhaVXbsyP9394OnvIOAZsPdWIrbFe0aNDQa5fZVJ+LVP8HWU2g+CGc0asI9d6ZlLSo6GpsAG99OKI3ObjvQtmuF/maaQsmsJfEin8ee/7adXkQxNcBBDrqvwpeJL++wHkxEofNl2h1mHLVgxL9vp3JOhPvJ+6h5eTPAB/ilJdCtJvPc7LC45OevBLOhPCm2oKi9cCJ8yTGNMMvef07iGY0UBIob9/xSssqwRaQGHa/x6BGHJrAkL53KzMF76TU7zZxPJ7FtH6bjGMpPRDvlHXg4luTuju44CHHRl6/jXoN2OPi1mWTHoi33p8Yig7Mx5w+OHMWd/cA7A6zpqNm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 17:16:25.0447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 159e20f7-b019-4509-aa6c-08dee10277e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10955
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 17:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240850

T24gMTAgSnVsIDIwMjYsIGF0IDA4OjQzLCBtYXJrLnlhbmcgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPG1hcmsueWFuZz1sZ2UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiBOVkQgbGlzdHMgaXQgYXMgY3J5cHRvZ3JhcGh5LmlvOmNyeXB0b2dyYXBoeSwNCj4gYW5kIENO
QSBsaXN0cyBpdCBhcyBweWNhOmNyeXB0b2dyYXBoeSwgc28gQ1ZFX1BST0RVQ1QgaXMgc2V0IHRv
IGNyeXB0b2dyYXBoeS4NCg0K4oCcY3J5cHRvZ3JhcGh54oCdIGlzIHZhZ3VlIGFuZCB3aWxsIG5v
IGRvdWJ0IGNhdXNlIGZhbHNlLXBvc2l0aXZlcyBpbiB0aGUgZnV0dXJlLCBhbmQgQ1ZFX1BST0RV
Q1QgaXMgYWN0dWFsbHkgYSBsaXN0LCBzbyBzZXR0aW5nIGl0IHRvICJjcnlwdG9ncmFwaHkuaW86
Y3J5cHRvZ3JhcGh5IHB5Y2E6Y3J5cHRvZ3JhcGh54oCdIHdpbGwgbWF0Y2ggY29ycmVjdGx5IGFu
ZCBwcmVjaXNlbHkuDQoNClJvc3M=

