Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA0ECDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 17:22:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2277.1782148963404545892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 10:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kgQzHFL8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kgQzHFL8;
 spf=pass (domain: arm.com, ip: 52.101.65.23, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IDFSQ5bcE5yQ4nXrfy2MAuOyKK7VprdK/FfV3L1Q0GrZM/kCbJ6KwawXscUSrgjKiGs+S3hs0r0MitVbpLnK0Mk4YRMux/70U76JdxfkR9mMxMaLEM63VDw8NdV1wNG73oUw7NkdfjKAnLPy6+Y1uTTFXjvbWJNsVF2ih5mgKY6Vqffi7nS+rIjCSTSYKbx0FBUVaDPiA56Qhy9IR8I70ij++NsNmDjFEqIrM1jt/DIS5MOx8wGf+WrBfV4EUcI6STBsxDcKEEX46nf6zdaXFsvq43nr9x67D9eMUBxyRHGmmPDTTWZA7Tpa86m6KwvZUm4B/MIV48XjwP1cIq3lVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csUyfLKlsU1CIENyG/dKc/cWBVE2VspN5cdjanvG7zc=;
 b=oePX0DIFU9LWXnM6Cq5O5NxUUsBFD73rpQ2nugKrO6G6h3rCCYSRhvyqvx+P1k0zEp5GGwNrUsygE3w752EfNbbqGqyr4F6DIXMhcUAKH/CyZbM0KJ7c0f9ZgfoUt8uO5+RXA59piBbBZFDMGPwHwGVYJiN71YwTiGDk86yV4LdAvc/ZY0qPLhsDUUJRMYbkdcOwBs0JbQ6g55GdVhq8+5YtJQR/+HB7TjLsGasl5I5mS59hkN57m5lhQn1aRazdn9YRxMrWnHssfMOOBGUH5KgYxwwFBx9ZGsyzk8YWzbUT26rUhJeJ0fETyuZoWk1Yc+/NaEuYRk2+rSAf5rukxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csUyfLKlsU1CIENyG/dKc/cWBVE2VspN5cdjanvG7zc=;
 b=kgQzHFL8eS1AzOjW0/+tc51k3D+7/iWBMBpkfN/me/1uIN8NFkgSubdIuh4wqmEh/F/Swhfki1G586u6ctWHkdZPfzvWnUbRRIIRQsWJHqVF5Ufa82ijOg5yk5UQIlMlUbbx57cEdd8Bv1HoVqeDCOC8HUXnQUUL5VkZc9G02MQ=
Received: from DU2P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::34)
 by AM0PR08MB11257.eurprd08.prod.outlook.com (2603:10a6:20b:6fb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 17:22:39 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::87) by DU2P250CA0029.outlook.office365.com
 (2603:10a6:10:231::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 17:22:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Mon, 22 Jun 2026 17:22:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvFNPwwTUb1DIuJi/UD2tKF7xTGxMgqc+ek75z+XG3x7/h9f9syfrAAiFetiORbczTG8suy4OPOMwVchIrzkNEkDliawn+TCjTk3rkThTHBv3DBcNIr4OW6iSYbSWcLVZZUz0NjXwSLaZgILFebnLsCN/W/qauCHHsh/ojeulpAmCHpYaRLr26bMudmxXOPcFuUlyf6LVAu5L0S8b6kelnm4Ae0bNZXfSRD3BPKXClrP9hZBmQxqGzamcxni0JCACxK6GjtLiuFA49BV4HaSe0BfxCuLaZq+ruhucqngcyPy1R98b7OBzn90zeeB3iHAigHcfD6qWenCQZONaX0L/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csUyfLKlsU1CIENyG/dKc/cWBVE2VspN5cdjanvG7zc=;
 b=B8YLKZ4/gvNDo3oEywY4RzASu0lMGYAuZRrliThjJU02AHuqJjRD82nv92K2CATm28oRxtyr8n7rk4/t8EAurONxfU/KW64nO2e9J3xdlHd1wmUBA6abv9NLkV3MwDqpqDp3wnNouE7dwV1/T42zE85fGM2pawU33CJ8YJA7dnlCCn9T9F7ww2bH9bisQy67RanWA+h0L+BX9CVbFYKPsC+MDm4jddBngKjBjmdad8iHzlE8WJlEGs5RnqG9J9TlXCYJrUKbnVpu53KZGDLg946YnAd+xihlndSwXKPfDJjk3gDYqhTh9Sl2xegEZqZnx+lfLYWTTKuerx8IO730sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csUyfLKlsU1CIENyG/dKc/cWBVE2VspN5cdjanvG7zc=;
 b=kgQzHFL8eS1AzOjW0/+tc51k3D+7/iWBMBpkfN/me/1uIN8NFkgSubdIuh4wqmEh/F/Swhfki1G586u6ctWHkdZPfzvWnUbRRIIRQsWJHqVF5Ufa82ijOg5yk5UQIlMlUbbx57cEdd8Bv1HoVqeDCOC8HUXnQUUL5VkZc9G02MQ=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 17:21:35 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 17:21:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sivakumar.bs@gmail.com" <sivakumar.bs@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/devtool: add regression test for
 kernel cfg in subdirs
Thread-Topic: [OE-core] [PATCH] oeqa/selftest/devtool: add regression test for
 kernel cfg in subdirs
Thread-Index: AQHc/wNcU8i59om5a0+6RaIt544wtrZK2RMA
Date: Mon, 22 Jun 2026 17:21:34 +0000
Message-ID: <639C09DF-7336-4819-B0A2-B201BE80A608@arm.com>
References: <20260618091736.2319572-1-sivakumar.bs@gmail.com>
In-Reply-To: <20260618091736.2319572-1-sivakumar.bs@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV1PR08MB8497:EE_|DU6PEPF0000B61C:EE_|AM0PR08MB11257:EE_
X-MS-Office365-Filtering-Correlation-Id: 353171e0-a7b9-4c54-5387-08ded082dc06
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|38070700021|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 oS9kJGVwsSS8iCdnoILia36ui9ocM2pF6/N2P0vwfiY7vKJD57SoJ6BqDXzgOR6v2X/90+dBC3f9AQekLWmx9zpJjZL1yALl4PVgCMr6weWdIphZZnY6C3coRpyoCw8Tt6nNtnxflkm4wbzUCq839dsbSDwFSeGbHdWhVMKMBIKQAIFWtT5XLadJGrbJc9bcHwYVLk0tzaQSBi98XcY19dk/VhgiYW9enuU4lfWvxgKF5ZXOxM/we1GbboC15oy95Dom5RoVIjmJNCr9B1BCvmC4Vwlqlomz+jPSkcaxQ3mhGmG0p9X22l8wVqlZQFSZgPRB0+WxK5WkLZKnWDrAETAHViwHVJekea8x3ePBOC+Rne8Y+Tuq5s0kWy6ACLkOohboNcyJ5x0YSCmlG77jjkMrGpFMd55BujoxFCJIrkUBjGYWjv3dRDMQi0mKF+as5NF5rfE8jzuPmDVvM5IO+z7qF4eoRL5w3jBhmrfggSnABH3U2JL/KEB4vO+ajWLW8zInADB86GAUKdMwdnpQVpaXprBwJD1snNbiXMlJC168aoVj6HDJWby+39zwvSDsAIx8LZ/uL77mJ+sp8uGNBzF2Bkoepy0VzzokCC8mYpejxnR+eAHpqEpVyiBPjRqOOCv6hv2SPv/f74sQxDfEByg1mGXgHhd3c5pcklotlABvQcsJDqrt/JDXu3V7ZmAdhwobLtDAaI21aWymBYdihbpOyZJ+1JLa6UDezL7lRZ0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <58E04FE49E413A44ADEB45007D5795AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 jGsCPdvTI+UQaU57FX4jAdbVfhHgEJlQTqAzQZLT6RqicxdcOzCc1X/W/zOEf8JDAWUeouK3Q/+w/WqmMgWs1aQ00ICHb9A8DIfvt11KPIRhEpTDqvcHpJw3orQWoga/Evsw/GY2PmFh6UCSOBf63t8CR9CPUt0pitCJ/VLGZl5R8/KUVSc+pySz5wWt5Azl6533z9zZkbNPjrL80zo7OeAu1WdaKtGBb6/KTBJfVjPmAaBzzlxzUG06rBWj4Meyj+yH87eEq0k532JP0s6m2yvFQtbuHel7XO2P9TpKS9E0uXL+qBu2d7B9U8pUpw6Zcv8cnM9RPTTykzcfjQ2G3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8497
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	000dfa5d-5576-4371-382e-08ded082b5e0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|35042699022|23010399003|14060799003|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	/iQvvEkDwOOcs0qzTBWzfQFSqkoW5Lw36SecuPKTsAntXyPJwKt3XXeb8HBPLSzebzsYfepCqYdnyRCQR3f03UVSpz6cwYwU4oKd8/d+pUS+7BB8A/Pdf2KPyIVJP2ApyZ3IGBwSEWLhYBtg+h24AOHeol4PSGlcyp1TKsLvolJClP3qSCB8APN1JeUwOSABqJAjMd8xE2tN6uH43wmOma8V5h8ZEWIQiz48AS1AY9AaRHtA3GKYVjIilIMbCsOcqR4Dh8zqIHshSRyxdcPqvBJjDTs/cPH7ZtSN3dGsmYhQz5EFUSpOgxJ72aN9TXGitrfF/YLAQ7WOrQhh4lD7STNxeR7DRXaXH1KkBMksO91Zc+JCBC1/zEKS768l6GAQAABE1FnHN0ZmG8joQvt+RWwil9w1sYMBGjxXtSDzRVVSRys7WbURlPFhWnaYU4SYT6PgnfzLNUrI2P7+bkow1zX9/bZt/ZTf+029cQqvf+q9dIxQJ/awu3+4kIRwdD6LRzBuABnxnJxS61UJDWoUzLE0/l3IxsDEesEdrv68pNtE6RiQMCRkCQL/5pY39rWSAklJJrNguFzAJRZws16a+yQ7OzrZdFdLhj9DUVJh8TbOeaO0C+MFK/Jy8rwbyluXrRCkeCuJVd0RZlo9l7GGZIjIPkJn+MubCsCxiNIZGyjmSfmoWMP6Kw92HGp5eDku7gP5dvBJYXNp5lBwqA3GNw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(35042699022)(23010399003)(14060799003)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	D5k136EccPUcbA9zf/u99cIYX49qVsDZ4t2CP8x+NpW6ynMkwoxog0KKFlQkHoCRywNcgy/fwtkg4z7+Tt+12inXrk2b1Q6X9IW5jcZaZBczsUIWf6dpwUZFKYNPzTFbXWnEO7DsISVDl6U/ED9v/q4/WVd59OnY2eUZFTKO96TIcwoGibysBDrZap2oFKg/pVIllNZ9krldS9WAJCK0Pk7DYum2oOSSfqsM0zsssVMyXCFM9AqRtGrSuafwxdQO7BehNpnsrDAXu4hB2qwySHfS0Vpfq8SCz4TEe/mzE9Xfn2KKFbxkIdDgrGfvVY7VumGRKKnpmPLWaLfZffsmmaLvUB+LGR5l3b7PlXaWDViFskln8Qgqw4Cw2Y1G/i4e3omp5G86PMWIz2so1A89AkSWo17gRPAcyXgVhIk6Kppcx0qzC+QAscSFZCFEFYBI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 17:22:38.8382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 353171e0-a7b9-4c54-5387-08ded082dc06
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11257
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 17:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239313

T24gMTggSnVuIDIwMjYsIGF0IDEwOjE3LCBTaXZhIEJhbGFzdWJyYW1hbmlhbiB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8c2l2YWt1bWFyLmJzPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gKyAgICAgICAgdGVtcHBhcmVudGRpciA9IHRlbXBmaWxlLm1rZHRl
bXAocHJlZml4PSdkZXZ0b29scWEnKQ0KPiArICAgICAgICBzZWxmLnRyYWNrX2Zvcl9jbGVhbnVw
KHRlbXBwYXJlbnRkaXIpDQoNCkkga25vdyB0aGF0IHRoaXMgaXMgd2hhdCBvdGhlciB0ZXN0cyBz
bywgYnV0IHVzaW5nIOKAnHdpdGggdGVtcGZpbGUuVGVtcG9yYXJ5RGlyZWN0b3J5KOKApinigJ0g
aXMgbmVhdGVyLg0KDQo+ICsgICAgICAgIGJpdGJha2UoJyVzIC1jIGNsZWFuc3N0YXRlJyAlIHJl
YWxyZWNpcGUpDQoNClRoZXJlIHNob3VsZCBiZSBubyByZWFzb24gdG8gY2FsbCBjbGVhbnNzdGF0
ZS4gIFRoaXMgaXMgdXN1YWxseSBhIHByb3h5IGZvciDigJxJIHdhbnQgdG8gY2F1c2UgdGhpcyBy
ZWNpcGUgdG8gcmVidWlsZOKAnSB3aGljaCBjYW4gYmUgZG9uZSB3aXRoICJiaXRiYWtlIC1DIHVu
cGFjayBbcmVjaXBlXeKAnSwgYnV0IGFzIHRoaXMgdGVzdCBqdXN0IGRvZXMgYSDigJhkZXZ0b29s
IG1vZGlmeeKAmSBJ4oCZbSBub3Qgc3VyZSB3aGF0IGl04oCZcyBhY2hpZXZpbmc/DQoNCj4gKyAg
ICAgICAgdGVtcGRpciA9IHRlbXBmaWxlLm1rZHRlbXAocHJlZml4PSdkZXZ0b29scWEnKQ0KPiAr
ICAgICAgICBzZWxmLnRyYWNrX2Zvcl9jbGVhbnVwKHRlbXBkaXIpDQoNCkFzIGFib3ZlLg0KDQpS
b3Nz

