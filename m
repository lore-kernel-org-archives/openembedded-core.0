Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B450CCD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 12:56:59 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19280.1780491409518416084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 05:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=f5PnBumI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=f5PnBumI;
 spf=pass (domain: arm.com, ip: 52.101.65.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RfRL+wqMJeOBABs/o1O7POI3MDWCFh2UDC3FkXYsLdZSg91HS2GXTkDWeIqjMxxKA2+A7sbcfAIk+EQp9KhDHFjh250rmOHUs/b1wjFN+UtNYsgYuHakhyHTIlL0nr7NrHefB5WSg3DBEcT9SNvvPwkt5LU2R4cTEi0VRmm2pSJjz0C8cNkBgMl7YMVFW4WZZPKmFpDeamXL0SrbapllmvW2dP/M4ZkpOySdLQoEEWGONRPwhLa9gSAMbr6hAyhFtEHtmWf8NwKrRd741wlkkAG3p6Kfug2TMH5meV37135P7bcMB/JicfYQ2jdzeAPum7qzrh95M4d1kyRMNBo9bQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSxf4RfL5LOxBe/dd2L3vcu32K8ZJ8cNW+dg8SvQRPY=;
 b=MW7dBcD8ov9BCqIcbYOBpqskCeczOHSmqTbFll/MU6hJ/YhdUW/lgUonwvBx0Furd8wX6sFkKC/1mLwg2p9MlV79M5nknXv5aPS2J5HHFG0E6zxkOPIsj7JHIl4kaZBETvLqpcNa86olMcN0NBINKwftawkQd7P+j6/OOBnwrmML4lrbAe6PemdqL9AVXnVoq6CrVRMKFuCGBtSBHE8TAfkX/edS/DqHrxjic4tCVQGc6H39GF3Bx31B3pDQzSksEmFYHKGjdzEQ0e6WAA2ovm0ezJif1aFpSonFqYitnDtVgAakuEuMm2UHDR2Tkz3nhhVjI63jl809T62et4NIPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSxf4RfL5LOxBe/dd2L3vcu32K8ZJ8cNW+dg8SvQRPY=;
 b=f5PnBumIUho2dgiBbYszm73L/4USIRKweo8XEfhU9wpLxUAUmvQDyL/8JhozB/vY5BtlP9aGg+m43l2lFXW+K/UqiKSVcrRl/A7L76n0wx2eWFpnKAk5Rva7VzFJHTSwVjXnLXmXI/wd1uvKH1Xw+BXnXso7KerqIz3fMg0GK9k=
Received: from DB8PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:10:110::40)
 by AS4PR08MB8191.eurprd08.prod.outlook.com (2603:10a6:20b:58e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 12:56:43 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::38) by DB8PR04CA0030.outlook.office365.com
 (2603:10a6:10:110::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 12:56:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 12:56:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzXyAs0yhlpiwhaHvokaNnt46jMM3nXLX3r+ahgHGh+qIx09AIdwOTlj4ZZq/+69uORLi/iI2uoOijX8KHM1FnDrfj6vOn9xl9W997pBWpzQe/WEyRLL8rSYZRp8K9/5xhs46mpXn/kSJ7OZma2Fa5vcKDowNJQJkQUO4HntpUgbgzIj9Lah07AxKLp3wwZzrCl6YiRHw9pQ3/qieeNUmWZ/Yr2xnk/r2D6ydp+K9ZRs/mtkTTWM4iFdGuqBKEoC6bba4K7e9p5c35fGJTIH0awB50iT4r7FBgbVCt+eRJtsPPljKo6/JiU6Ee4laa2oDaZP5ZA8w3CesQ2pzEzKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSxf4RfL5LOxBe/dd2L3vcu32K8ZJ8cNW+dg8SvQRPY=;
 b=b+ZFLKnl2A9O9JpTpJAsXs8wHHIo18fB3+WD+WvsPxMjEH4cKcInwzufrwFrqA3lRGDDqodFej2Lf7Y1uMzoQg4Yr5gHsEKkvmuwsQBCeZ3XFbHmmJkgkNnxaChz5j9DF53nluLo/ksxvvAqKPMjrwW8qrlnmBlU+7T8/Ov+jY1ElqkaOMw9UIbiB+Mqpl/zQQHS2DJTIQszJ97aWikT0HJXxk2RjwWfTeyEuaanRowh9MMUOxiKwrKYo9IPFSTi/sndPcofy+2IVqHQdV66R2IIztcitxW7k8aU32WRddYYQ2BalsgnvEtxF9woUDHYQk8d1kxMwq8mTfmYG+4FQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSxf4RfL5LOxBe/dd2L3vcu32K8ZJ8cNW+dg8SvQRPY=;
 b=f5PnBumIUho2dgiBbYszm73L/4USIRKweo8XEfhU9wpLxUAUmvQDyL/8JhozB/vY5BtlP9aGg+m43l2lFXW+K/UqiKSVcrRl/A7L76n0wx2eWFpnKAk5Rva7VzFJHTSwVjXnLXmXI/wd1uvKH1Xw+BXnXso7KerqIz3fMg0GK9k=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV1PR08MB8667.eurprd08.prod.outlook.com (2603:10a6:150:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 12:55:37 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 12:55:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, Patches and discussions about
 the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
Thread-Topic: [OE-core] [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
Thread-Index: 
 AQHc46bnpDeMaUADskCpkasHyeafyrYNtmIAgAAA1YCAHfAKgIABDasAgAAexYCAABV+gA==
Date: Wed, 3 Jun 2026 12:55:36 +0000
Message-ID: <E1BF746A-2230-46B2-ACC0-E4A07E631EC6@arm.com>
References: <20260514133748.219486-1-ross.burton@arm.com>
 <CAMKF1soV8G-LLutq=9Ba-pkz=XyEJ=5812eQnaYOP834pvBNDg@mail.gmail.com>
 <8FD4DA19-AA50-430F-9B77-0B79D6E70F26@arm.com>
 <CANNYZj_2Ky4KYra153oe85KSArHOe5Uawi4aK=SZe+-c5zvuaA@mail.gmail.com>
 <77901880-9008-468E-9FD3-07408FFA9310@arm.com>
 <CAMKF1sopgUP2e=_GroM9H4WWZ1TBdViLx0egROwhYYBiM=4YVQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sopgUP2e=_GroM9H4WWZ1TBdViLx0egROwhYYBiM=4YVQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV1PR08MB8667:EE_|DB5PEPF00014B8C:EE_|AS4PR08MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: db296a0a-d226-4944-e182-08dec16f8fd2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 e4SHOWhRPT6z7AfjXTeUCEwjLzoWxSSPJ/aXWRcirUMiC0MZvNpzsWAtmerxjnGBKg4k15HT5xa2ZROr6o8BrMyPxTSNYW9OTMuT3SKtHur6a9f2v9WexWn5hbXGu3kYUdf3yAgZMfXP4GSQZ/smxVfNN4vSQoprpPPXquWfnf2Xy17i89rPwQY6xVVW+H2GmVqBCNBrU57hYURrcTpiZpU9JmBx+iBi3RrHRJK3GzPlyMO/uS1v1GrpSoFi3CSL9VbULnFTIV8HG+8nTaIaAKNF12nmCe2G6NI5IYSkIwYmcmZAWLKRlmiqRrueimAF1JuFb3f+VA74lc0svm5asTtCA+RGFahc1femvUbw3O2tROxj+CHSm2xJhHkPdYYCMeCRKfvnh6g7m+8iZPuc9nNO9TyUS9ZpwHOHogW6Vh1TS486bpNLI3KB0PQvtDAxXNoh8v5BJRBwvKKQqC1G4WY1J1IVJJH9S+mvR9+rAgJO4IN/DzNpNQfU7xoMa9QghpTfDJZf+P6Ff9vNNO9sSAePcitXCxwWHRMrJxSCAoH6G3c/Gw6DjX4Aw6QRLucbppLwk50mJEly1Om7GShcN52omjDEnLoRjWUw1kn4VknL20a2EwjKzUJCUu03aAz00XNK8yRlqYqV4nlji3UvqD1VJHuZLtc2a832rH/trOurk83TqiUrO7UBCDFMkM826nwF3WK0TzJ2cuhNSnaT4HLwtsIXVV24bk09ULwJbOu/aAqF/AdjwYxOkP3zGjcH
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DA582034F58ED4AAE10A104FE14CAE0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 Y8Vyrrt9/TsgF3rsHrQIHL+OP7lWmb5Iq7xTVe14VujiSyX9oU5Zs8/zbyJbesKLfzsxkOE+x+iaeAZPKIfnAfwv3iZsEDQKIVfr6lhDfSQxJatX3rIdisn8ozZy7r0+BQXiruozYegXvk1YAnkxo8QUtUWen/EZpvVdUVUst5ymrbVVjHydHNeeZbPHqm2vEZJ5RJA5iqRU8eRjFdurPOS30jprI0vWOv3rTpXuhk5XCiMdKTM7Vd61kbUZFREtI3Rvl+TQ/wAKlSQt0hteRPknv4ycJqrX7pndRJVfPyz+esa3FLijPWCZ4n4J0Pl7QlEq+CXGgfVUaEW7x1x7+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8667
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	09a736b5-9f69-438f-88a6-08dec16f67d4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|376014|82310400026|36860700016|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	xiV8e6CGHEoAZS7lQUYSrNHJYsj6HqRF8omAtUtxLAFHWYMw6QyyoTsqq2YzS/TmmLLTkFbeaVqGnLQ4U7sp1N9VfGzcikJSfPr7ojblYXEuggoS++g5L3pdMk6xWW9LINrldgTZt4Qwzb3+Sh2HO17909Wt2D+Uq/HNGs32CdKeO1ti6Ion2UavBnim2Iwhnegir2BU7OqeKlB03Qr2c6I5teSDHRilXXkMVnW3pe1T4/7RsDVT/AWLT/GKcrjUL7h2K4hHXg1CP5WQSEgQfOcUhGlNq2qrzhFEMAmE1C4S5/oC7j3RcV+DVXrgxCjx4bANgBqEImPgQVTtOQ8WY4PDx088TRx6lNG7WrWKHi6NSiHzG0QEwAeFvoz3M0nv+i+CApag0GXm5/+btRohu4xIrFq3e8b4VxfcH7/rDp0iQT+YmWS4q20K91QigenmIeQWvVDWwwtkgrx1B6CGCPKXYsnUpZzjVBHFpeV9w+lkC7HzzgUHjZsVctauXsYl5kmWdVKc+Ww7Rmqw5fJ8d4ZLsZ/k71jRr6qn8QnFEXuWkRet1sTyusezr2k8DgwwKXMfEB7E4XjGuJcmjswYs+PkrHrhfOoXurtizvTB0IfmAhSLh2qPcCCSAB2jX/ddi04izK/1wqJ3K2scIkBSvLEy08x2DqLajqQ2W3rNn+irGgaY5jIRyYoQTRoqNDnbEHV4Qkn7wB3VYul1fAwEtLv3L8r56E/NI2n6WVo1iwE=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(376014)(82310400026)(36860700016)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WGzQROv+wS5uc1aviUHy7KqJr1pguSgqJ6t4tNZsYWc//BoJC+dy+a55WPDpKGMmhp/MbrrGcB68cPK4xkdcTk3ZEJWLEqMjAisP3cC7vynzjvVKaHqAj7oM+J9H4gH6Ns3uDvNQ/xPOo100sXn0Ra8fP+6RNt+yZgvMxAklC/UL8jKV65GyMzrdx6omIG8Aw3fzfEjmZDxQqrOOijCggknNwHPwIsEUqt6tKAcCufoa7eeoXChQLZ3ns3ax6Ak777Z3TYlyskvEQsF5BrQAu8cbtiPPlspTlGoAVFwdvB39d6SKsudHKD6LaLqjMAbYj+XGSElF/rProfQbKrxG9rNHMzm3yKR5g2aV4rdIu5UHtJYlBrs9jgi2ClTKrumIYQkupTrsT89vc+U00zYCSENF10Lo8kAetmmFrs1Lvf6KQwr1RLhY3UaPVmxruEqH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 12:56:43.0656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db296a0a-d226-4944-e182-08dec16f8fd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 12:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238095

T24gMyBKdW4gMjAyNiwgYXQgMTI6MzgsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4gSGkgUm9zcywNCj4gDQo+IERvIHdlIGtub3cgaWYgb3RoZXIgZGlzdHJpYnV0
aW9ucyBhcmUgYWxyZWFkeSBzaGlwcGluZyAwLjktcmM0PyBJZiB0aGV5IGFyZSwgdGhlbiB3ZSBh
cmUgbGlrZWx5IGluIGEgc2FmZXIgcG9zaXRpb24uDQoNCkdlbnRvbyBoYXMgLXJjMywgQXJjaCBo
YXMgLXJjNCwgc28gd2Ugd291bGRu4oCZdCBiZSBhbG9uZS4gIEFuZCBJIHJlYWxseSBob3BlIHRo
YXQgdGhleSByZWxlYXNlIGEgcHJvcGVyIDAuOSBiZWZvcmUgd2Ugc2hpcCBvdXIgbmV4dCByZWxl
YXNlIQ0KDQpSb3Nz

