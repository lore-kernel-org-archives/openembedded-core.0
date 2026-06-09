Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D714CD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:57:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76619.1781002622828333628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UuVvcM5X;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UuVvcM5X;
 spf=pass (domain: arm.com, ip: 52.101.65.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jUn52nhaxL3Trljj18VWXhCjcPh4WTziDpVcdbkPvbZgxY1aeGZ+x7rGwEaP1lqiCHXbCogEl16YWNpGOw0FQoonM9LWr8WefiMYatQcCW72nZd+7xQA+6vDx/G/aLAGUDw4wRHPIHZk4o0mdQ/MK0Ysuz6NHTB7BNgz8ggeMTmStVw0qZ9EMsNdGu6IZGuQ2uZajihJv66Ivw7HfzS3MGhS/zOhm53nFoojL+QYzil3A7SsmF1MXZFShIVfYvQw3v1F0Jr/d7RaeFwYp3rouH25KJ6+903nbEak8vQRY3bOcYuimQQObjDcxMDgTmWQfCIa+0JqNfKpOmY6GI004g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IHcLeiEQRZ2f/t9wZFIzb6g87ChOngTAabwWd6CuUI=;
 b=pY9CGD1TYjOZ3+WKHC9xnN3lNJPhARsDcqgt77eM6ktWFYA4+VbVSFUPSrkAdCKSDKPaXbLKQ8L+JzuZqSEOopeUBGJWtmwvgE215kFXp5LrLl/kDrOILLovrEhXT0WuL+Vp8I9i4Nfugw1r4NbpkPDp/A8V7nb5PGTjDEHTqn2NLOeefMkkRE9oSoyKmo2vQ6ce6f6dJR2Y8Ke3q7RKb5U1avqytFoD1RQ6aLMjz1Dm+rjXc9Woqm+zYiWqE8Gt3JQAva0fdIdKOSvTUkdAnhMla076+lWaUZURpmksvNojAo7mK6zyb/sJ7xiqmQKj84cYdC+00fckI3xOwypcLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IHcLeiEQRZ2f/t9wZFIzb6g87ChOngTAabwWd6CuUI=;
 b=UuVvcM5XrufYsCBWvTMa3yqySaL8OwnUWEL/WniRaO7rLVLL9mfRrAKLdtTOXQDzjEuF8/jP/OLU5RCsJJXJjeR84ulIEjR01MWTXGt0u5ga6dwX0SzgcLpX2eMhZbinWcrigzPQ/rqYi3Mc6mCeAARFJ0XLz3pMiZiSpC5JrCg=
Received: from DUZP191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::16)
 by PAWPR08MB9542.eurprd08.prod.outlook.com (2603:10a6:102:2ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:56:57 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::1f) by DUZP191CA0006.outlook.office365.com
 (2603:10a6:10:4f9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 10:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Tue, 9 Jun 2026 10:56:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKYOFxNb/ZbQLV2wm9VXa6b4/sBbk1PyHmnJeGKrpaLyE/2etBYiryw8PgaTI6L+YP6ycLdiD3G74HK9G+1gCVSkb4maSaaONs7a7BHgBFXGtEK6f1xToHNA0LPc0yj/N3qqX/ST5186y06ix2ZeNVekJyVWfNL80wfOvQF6Iey2ZZBhoCy/AcKrIJZ6BrIrGzsYDlY40zbNrZc4xWUHO1ahQaWAIvO0NkAoT1Fs2dgZPQK5NrtEffsrCFI8ERMnOpJXClTIHFX9OfgR7611rP2ODynErlGFTK/H6Fivzb6esk7/Ml5JBSToS1zgA6mp2od6f7POiv97/40cno7xTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IHcLeiEQRZ2f/t9wZFIzb6g87ChOngTAabwWd6CuUI=;
 b=BJzu8Zvl0X0TLc07eikx5PN1HzcC/ncoSpDr6luZ4dxP2VjiTOvMqmIB4LVUjVLxNGtm+vVl2vC8qsJDXPXTgEMmXYlWMDwzmR8QaZlDQ5zhlEYEoKzIyPu/3MVfCdGBba1b9PK/EQvv7buRbSuSi+b3DCgwlltGSf5d69cNYawLfXkMmRCG0ctY0b0xEcZrMKqVAQ+G20WbFZ7pVW3C2AdmHhU2lkUVTr7D/fczABSM9m/S75vbLeIt6gE3W+D8dp9zblAAJrZf6kjdyLAnUsHrcw5aiO9Axa2vlh4QmlEWB5QQ2akmgOzMSf3+mOnm1O3EWJz4KtrcErbRNNSGHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IHcLeiEQRZ2f/t9wZFIzb6g87ChOngTAabwWd6CuUI=;
 b=UuVvcM5XrufYsCBWvTMa3yqySaL8OwnUWEL/WniRaO7rLVLL9mfRrAKLdtTOXQDzjEuF8/jP/OLU5RCsJJXJjeR84ulIEjR01MWTXGt0u5ga6dwX0SzgcLpX2eMhZbinWcrigzPQ/rqYi3Mc6mCeAARFJ0XLz3pMiZiSpC5JrCg=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA1PR08MB11622.eurprd08.prod.outlook.com (2603:10a6:102:556::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:55:53 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 10:55:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] diffstat: upgrade 1.68 -> 1.69
Thread-Topic: [OE-core] [PATCH] diffstat: upgrade 1.68 -> 1.69
Thread-Index: AQHc8wZugCtmCmFQRkylLZkTY9FUirY2FvyA
Date: Tue, 9 Jun 2026 10:55:53 +0000
Message-ID: <936DE046-F202-4C73-A1F3-3A2FEC8E89F4@arm.com>
References: <20260603030911.3769426-1-changqing.li@windriver.com>
In-Reply-To: <20260603030911.3769426-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA1PR08MB11622:EE_|DU2PEPF0001E9C0:EE_|PAWPR08MB9542:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b0bf9c-2b37-47fe-478e-08dec615d2b4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|3023799007|56012099006|38070700021|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 w7nMqcXegfRmZCYw3o3R33npy/7/hBTUEP7QSXooBD1Hd6vuzUthmaYMpfZmJL2zn6ZHsDDypV6igySWHT3tk659SL6kV8b4/1S2Kbk7PgR+0uKrzJn4i+gKS6BY48k11OqtlIhlRQ+H2MLvP850QX2uhh8mSpu8R3m0HgcS186g/ugHatXVN1Ghalip6lfX12hUP5ti9feV9MZzbvudrEzAy7k1/x2F144FDxdgfbLxEbfhF0DSr2VbBU4eOvleJC/rtPB9oDTyCcWCiW0fdLEz5818Mv2pxy0bmzngCTKAJ15gZHkCt8RthdNAvKRz0uH6kc6sVnDg3t7iFiO4xLWwvCbx2yUBzYO/3xd8VZ6UrNBnnUohO5mknklEPbmqICAyCxuVZkbccU1apyvfSs9BBBIXIP5jqLa9LAqPeQ7GtCHe7rgVpgCa4gywzQdNPISEvQfpju+V1MxdO1Q7t4Lyu9ywezLV15Y+ntORny/m56J5NehihgYL0/kDPZSAfT6FfxjbkB/qx+8y3MW29iJHUDGJ4o0TgafeMvrMDSkPtAgdmRPvNSqWcOAyMa1fcpXXWe2s0VavArpNtPQdwlrL9H3JyzrvrCARTd43TN31tQJ7S4Nc/PhDJ9bwJS/YvW/hSpdWimpVLJ76H7XD1FI56r1INSiRCKprf8QFZEAzo17cm8zu6EHQBGkvQHVEwnqFJGuhQ2bYZDeqnt7/eK1egmfAhAB4uc1Qo5LIUlRKgCSfYtSsRUfJKvf/U+Q9
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(3023799007)(56012099006)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC620BAE577BB441A461D9A08FDB3946@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 CmTlt8ex4apMAgq/UPOLBPzyJZXrmIOtwaI3dForOOp4OMGzd/w2CndUvIQjGfCknbvEJan7c9jNgvTkKq4mqGIwFDuwclpS1sJ+EVQF/fkNYpkXFkf5Q7Lgsakgzri0muVGMBCjk/paFK66zaIfwBXsA7BOz6WqikSepUIn2lSPrW7gV0KZtIjlkBDVNypsrLSiKoMGbL6CgkJufS4ccCdq5pTpu2GKoxUg3nGe+7RtJAqo1BPUZ+36W4e7tMBK0W411SZ1pj1CpfkMvES9mN9+VidFKsBZt/1kbWmu7Wcjc17MEitCeYMBWBx4WRNhvQQtt4UVG5xM04b8ZUsqGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR08MB11622
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9486add4-9bc8-4bc5-56a3-08dec615ad11
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|36860700016|35042699022|1800799024|82310400026|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	+CTGQL2xZxIR6LuIv22R61DdXGCP7TT70i2YY8ytkamydp9mLkIw+jFJTmDnkVSeJZGWsVg0SJzhIhkpVPPbAEfGw0wIx7/QZ84kf4pMyCvHHTmQ29/cuW4CPCInoja/Cjgx6nLnXWRIHdicE4K9LXDqKMOW7xv1QDZ57oIMxCQXevxWT9JbqELuT9xqn1bCbw/TgzLVyKatxhV2nvdRr070tEFewhYxJ1OrV8cDb+L2ChHJ8B46N6FqaITBnDzdXqcU1up3Hwk94151hDgHjpQthUe/TJGejfFTBb9ZJ7mGCzE8gPdlQtfWdckjOUEWT1BM3LfQi8z5jy3YZ9KPqI2Yx0IK2wsDWjxjkl/7Z2J3p5TnftmE9SUAUfh4vVBTOXO25AFXuP59Y30PcLMHgHDfTPuQESUROLPCPsH8/rAGIveZZLomoSovDOSWtq5LqqJsHafFDh7aNscJBizlrFj7OPnkA+N23bsPP73tp6BPITY8RF9iy3YVgV1EnnPycfDqp1FLgOA7S9gwC/gw3tEHGEJ7Ga37ydeJlSw3cj4x1MpWpXw4WvOk1K1GAuj+Yhj3MM1VMiCnOcF6ANH4Us+I29NEI4+bP/7Tl30r4goXrc1DxEaVvhGDz9AGtZp4t56InPy7LUtZocf/QNzyVn4+bw4qTzfRF0tobFd6GA6C3rR/zOlQawEYp5GDWdM3nGITsU/acXm87EkwXVJcRPhxMrC1ub+wjv1sUSI+jbQ=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700016)(35042699022)(1800799024)(82310400026)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iofvSyiR75nIrvoqGHKRXsqwWAjtRZCfE4ZVUqJYiXuYZXfczqv96E/v818RyMN/yD/8d/CLfKD9TLoLR+uYdEQ+s3iaQXbK3lOUGryo8+mbkp+qeKroBUiGysb+o0UZAv6ON9gnpE4zduYeFU+qlhnlmDyMra/XNl/Q9yyBQl0WNiZw/tfqzPHHONP0cTt9Ycqis/+gxeO75XqIbKZmRhX7DKpt18RYH1jAztJyIPYbriuIH3xms3sEOlp66qzBDtN7w38PQUnezyagNzQxOYbiCLV3RPrwbbDYr45K21HBfpw5xR0lrhau5Oaaon1yYaKAa3uIHhIgl78zrDXuo3dNNQe4BdQL61Xts7ZT4JVxn1sC2hKlFk9gQqAlwyvy/lja6PdZ1EwBajo/u2vPf5MRJ7ZwLa9y7Sj+TPGP+MX/TKhI1Oh/IvUO1lY4SH/p
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:56:56.4355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b0bf9c-2b37-47fe-478e-08dec615d2b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9542
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 10:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238288

SGksDQoNCk9uIDMgSnVuIDIwMjYsIGF0IDA0OjA5LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiBMaWNlbnNlLVVwZGF0ZTogIExpbmNlbnNlIFllYXIgdXBkYXRl
DQo+IA0KPiByZWZyZXNnIHN0YW5kYXJkLWF1dG9jb25mLnBhdGNoIGJhc2VkIG9uIDEuNjkNCg0K
VHlwbyBpbiDigJxMaW5jZW5zZeKAnSBhbmQg4oCccmVmcmVzZ+KAnSwgYnV0IGxvb2tpbmcgYXQg
dGhlIHJlYmFzZWQgcGF0Y2ggSSB3b25kZXIgaWYgd2UgY2FuIGRyb3AgaXQgaW4gdGhpcyB1cGdy
YWRlLiBUaGUgcHJvYmxlbSBiZWZvcmUgd2FzIHRoYXQgbmV3IGF1dG9jb25mIG5vdGljZXMgYW5k
IGVycm9ycyBvbiB0aGUgZm91ci1hcmd1bWVudCBBQ19PVVRQVVQgY2FsbCB0aGF0IGRpZmZzdGF0
IGRvZXMgKGV4cGVjdGluZyB0aGUgYXV0b2NvbmYgZm9yayBpcyBiZWluZyB1c2VkKS4gIEl0IGRv
ZXNu4oCZdCBkbyB0aGlzIG5vdywgc28gd2UgbWlnaHQgYmUgYWJsZSB0byBkcm9wIHRoZSBwYXRj
aCBhbmQgc2ltcGx5IGRlbGV0ZSBjb25maWdfaC5pbiBpbiBhIGRvX2NvbmZpZ3VyZTpwcmVwZW5k
KCkuDQoNClJvc3MNCg0K

