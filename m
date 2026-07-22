Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539DFC4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:05:33 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43651.1784711129153324579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NdJm1ufI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NdJm1ufI;
 spf=pass (domain: arm.com, ip: 52.101.69.6, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aYZvEH0VInPlxNdTs2HjumkjrjesHtJhEnCgphmVlVh66Fp+UQcjcVv02ukX153Rsg2Zxp2e1rcAXaWCraolGf9W0xjChS+G8LfVfOw/y8cQKc3ekvQXJevzdqOMOQdqLFRyAm5GnY0pIzx+AfswMiWx+YeRzixI6qQjNCY4e3y4WXIA+NbcZLY9Z3kPhx+aRFx6bgCFDoMWBRpdL++3QOUyE0u5oVUPPG5MLys1MJRP2j1ivlqZA+RQnYs4MEuFjQEVYX/tOdyTwrszAbuLlMxr+ZFtbYMaA7vJ4DNwefVWAaBXdewNYD+YD58OVfdL7ttjs1QwEUvmVYwQbFIstg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/aslK6H9Si8faD/J2Rr+VjVXnnb8NGoaGQRLLMXmWo=;
 b=FVj63C8tw9pg2zB6fAKcC0OjAa2MG+Zhke9b1uluXn+rdcRPhqumnvV9AzvlUC0wKtlosKW7DoqxrUD0LWwQ+RNrL4e+la1bsXT0ipKTEe5TVQUsIVXgmphymvYNM76QR8SbPOZ4HPTC4ZvhT1+7K21RvE1VPkWxD1ITG5464UAZZTm9IeXyZdXxiD2tSlmx+KqE3p6gmVunAN5SCIk5URph/LEREcogW/Dafz0z5D8UVAIEXh/kGidVW6ER81b0KaY5GvkNjh4ZiyOWyGBGKdgPcM3E+GOJNUNuhRGk8AiCvkK2xph7DpvhL1UeC2gx9xLyeOQHwq7gECXJQhNSmA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/aslK6H9Si8faD/J2Rr+VjVXnnb8NGoaGQRLLMXmWo=;
 b=NdJm1ufI9zvmjUC8/WOndPUnuxlvOmpGYnBxC8xtpSo/UQg1vT70zC57AGjVlayQMEO4HQmNj3fnouNsgFjVseBnTR3lu5iit5VWMnaLZZDmjb+ekZ7Ic5r+CVHaDx/hs+G8qPm0e2th6s2fhWg2xOFvXTTNNmvDM89qAALDuNQ=
Received: from AM8P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::6)
 by DU0PR08MB9300.eurprd08.prod.outlook.com (2603:10a6:10:41f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:05:21 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::a1) by AM8P251CA0001.outlook.office365.com
 (2603:10a6:20b:21b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 09:05:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 09:05:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=It8JzmUnqdsDhT6kNm/lQKg5fsLnEYKfPHwdMq41ZIOtv4viez0Vj/ht7arTFgK3lzyZyhhQwJQ7tgN795+1dmJycT1kJH8aSEvB7YdImmLd9VKf7kZcgkSaKzaT+uEsanrdprXkDtJ7xIv0U0nnMvbK8XhSaDhJLrXovuLhbl7Jr54X1Ty+2TlCsi2A3gBU/qKmtH3F2a/5ynbfOW1xUV4omoYAIlh76gt89unGtHbZhYSVqTuFmtv2HTquZvUTAj5bY/JtmMUYiz5bvvaaQvjxbRPSq1CZn1IqF36i6GvZ2GUgTwQd9sZsNtvlH128V11sAijHIWhsGCMdSX2mBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/aslK6H9Si8faD/J2Rr+VjVXnnb8NGoaGQRLLMXmWo=;
 b=Qr6TsGk0P2xbGus2JBY+ct6Be7bNZ7Lfw29nrBvvoDwD4POueO3uqXdCWqNUs/FkBG+ggmT7/vWGyYKCFDVf3i21xaUSEUKjrekHx2ZZn78wh27vr3SrQJTiPPfb8VBdYFtKm2v7PB/gbc6P4e8ctpTPk8IsHCl59wAPy4jA8r8TqESP3l+GxWfYpcCzcOJrBUJTWxTwDzQVsz6c0POtkFzlfJKWZ44oaBw/kDf8GoUl3TWOuKIjL2K3/Oy9U1fHUJDSZz50qG5FI4GOxxGlav5YAuWz0g+iux8wggJQotEhnRHO9g0foOqTGm4YZsoO79WAfKG8/pU2nk7/4V83Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/aslK6H9Si8faD/J2Rr+VjVXnnb8NGoaGQRLLMXmWo=;
 b=NdJm1ufI9zvmjUC8/WOndPUnuxlvOmpGYnBxC8xtpSo/UQg1vT70zC57AGjVlayQMEO4HQmNj3fnouNsgFjVseBnTR3lu5iit5VWMnaLZZDmjb+ekZ7Ic5r+CVHaDx/hs+G8qPm0e2th6s2fhWg2xOFvXTTNNmvDM89qAALDuNQ=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA4PR08MB6302.eurprd08.prod.outlook.com (2603:10a6:102:ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:04:17 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 09:04:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] systemd: no need to use qemu for hwdb
 update
Thread-Topic: [OE-core] [PATCH 2/2] systemd: no need to use qemu for hwdb
 update
Thread-Index: AQHdGSw26LqfmhEY/EKMvW4Y2zr0ZrZ5BxOAgAA4roA=
Date: Wed, 22 Jul 2026 09:04:17 +0000
Message-ID: <9BF45BDC-0418-4C4F-B295-BDEA3F7A72DB@arm.com>
References: <20260721161511.2946619-1-ross.burton@arm.com>
 <20260721161511.2946619-3-ross.burton@arm.com>
 <DK4UY8M71S6S.4ER6FHTQXGJD@bootlin.com>
In-Reply-To: <DK4UY8M71S6S.4ER6FHTQXGJD@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA4PR08MB6302:EE_|AM3PEPF0000A793:EE_|DU0PR08MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b88f68b-4f59-4d00-a97d-08dee7d05b5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|38070700021|10067099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info-Original: 
 Rp0MRp3DXrJjmyuWwuC8IroPCZRekWF+eeAIf3/XPAyhXB1YvOmPh7Ys/UEeLLREbMmQXdqV51AbvlnJKjXN72BgjxMINEQIccy50AzD1JoUD2ydfwqNhGGH6RXHq5ne4he7qNsymsrCI3BxPDiGmIU1JOge8QYMgPcckj1dC2enUP4ZVG+PxT/Fqdf8iXe+KOFYZdyHoNhEGXqaP0htEMjWzOG70ROBOM921BovK2gzGyBTcabSLWwcppx+yXChKGoUb5iI5hYPSt8lbvHFtXBFaulYy8pn8Cj3W3jGDDIRYxgvNJFUZHHiQeLrsrMBuYLPtP1NAxqV1HYPbrSyjJIcHEPIyw7Skk5v8xDf77E75LTEoGHaYImDkRRkeiOL6kZp0+HoNbSSwTbgSxYxsfvYk2CrAURj+VLyqAHQLrrAbHcL3TphXfu9xJ4z8F6uEpbBF+IQ+z64WZoCza/jNPo6S792xpA8+0mThi/lV3tNljNq45g80ecA9pX90F2H+w86BkJ7qb11L8uQbfOD6B9AqJKg8Hir3iPiplB/+GksG8SC04nnZr96ezmuHtivRtb3pSgXVgXCuV2SrQ1/aaoK+g8l4gllBZwVuA4HqOdYgK65TfCf1AjMAOgnUkJE7z7QT9Mq2dV0bJiFPJVEizTe9sWZ8WSem43LZT0R1VPruq5qo5UWsSYDVFi2WASOIAM6rxFolUvD462FiGNUyw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AE1B0F4305FA844BB888A76078C40FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 fgu0J0/eJUNOCqRCxEEySyGQqslgneGJwv641tbaJGBJW5ra2KxU+tOBOz447c9Y/YtuZeQPQknKXmg06nuyvbQfDLgxZGh+lsFXFSSdkPgb26jqM4ajpQ9VTG13CAje/NEZn12qro7uyNIt7rnHR34CXO9u4o2J2Yk0Ij+DDk66cTcqnPpR15d9sfVRH2RqtWHUAScmuC+YaRKtrsisyQ6n8u0OewxNWML19Pz9WfhZ0NN0qivi7IU7B6JsADMTK2uevSWfrUFcEBOPLtcPBVOKXIZxSmV0Hnbw3L8xKiD0n4/GOCs0O9zZTD6iADLH+/vhIGj7WxfTVkbzJsKH7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6302
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ee78a2dc-e23d-4fac-5a23-08dee7d03606
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700016|376014|14060799003|23010399003|1800799024|82310400026|6133799003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	uzces5LDSA0mAfAtU0eCHxpwwJ6tp6tU6atnjket3v9JlPBerEOBLKj8N93/zmtQofDJr3oYfBlprEx2XuDaI6m94RsCb3Q2GrwvvIw7O4g1QCP1nWdwkZ+JBNN6hHwjTdrlqMCXcIiXmLS8aJ54PoaTfUw9cGhsZDKp7PddzLZzNDBkx3IntEjND52a8+0y756vzWlgH3U6NY5yJrdhLll9APDBWW3jAh1tvzLY3iFWrVzMAEabXopmY5xUYi7Om4Xq1YffKvYkEOsV4vo7E/oeXNQFeeD+pN6I6ybKXTUEFG7tWsIcoAQwShD+tDalEsLt0UxY/KyPK4CvPVwqM0E8SqF3SXvBIYE1vG59lc+KjEi8yGooV1Jr1aV7fRWzdQhJ1KYhsP31b5QpzQWSH+faUfA4U3jJPU2FIO+r9JzYV8ulwfn09A5//3UVaC7rbybSIvBhMxR/vaaGF058YlY45Qn9uNBBIHRYbpXBcCvdw83WLK34yl9s28MpaE7WGoNP/khZ5PNRGBgvJClSsNFt8jZDKhJy/FmzU/+NXSYIAh15hy/H1xl0qOwiMKiY6FOphWinWdmZoxOOJSF0fewSUlgBOjNBhiEjRVag5Lvq+WtxaufT/VCjEJL9zrwYUXeZaxTpi7pjPU8oRDjGDdoFrJP4T6wDli/5Y8kUPV0vQOT8FKJ740BoUsxPzO+2kGZUV04PCZtS78NYb/PdNA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(376014)(14060799003)(23010399003)(1800799024)(82310400026)(6133799003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cqbEXpNGKKH8UtZhvhoH78C4+AlCjXiMpdtTjfLYGgT4dvCz1Gy7qq5PItTPNYoKNDSP/rx0LrP5Mm7N/3ZONDX3y2YWotTAy73hk9ZY4y5NXdyvxTuCguTtN55QEzRjJDZqKTHh2jMXRDiHzUoAC/4qjYz5I4dsWcQmJyN9RaRnC5r8IEaK2lewrBxrKpdDY9lke8oCir0j8nC3sXrKRgeLaZClhjBRSqEYZB9jSyO00NqNtxrpHnwNanQGdmTKmFRSBz09friLee/p3la6NAUAECv6u/ensE2CbTCXHNcByYQpxTuWb2Nn4AGWKFJfmcxiQcrPBFMTBdfZjKC71x4leKtfsuKELmreWlbB3P4EmrjA+U+14FZsXYy8OYHbOTCFpgtpQfK4/YhXM64D1R0sE9tjmxX/4MghwZsS4n6MMlCf7CDsr3KFCSBGUIl7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:05:20.4933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b88f68b-4f59-4d00-a97d-08dee7d05b5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9300
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 09:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241634

T24gMjIgSnVsIDIwMjYsIGF0IDA2OjQxLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUu
ZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUgSnVsIDIxLCAy
MDI2IGF0IDY6MTUgUE0gQ0VTVCwgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgd3JvdGU6DQo+PiBOb3cgdGhhdCBzeXN0ZW1kLXRvb2xzLW5hdGl2ZSBnaXZlcyB1cyBhIG5h
dGl2ZSBzeXN0ZW1kLWh3ZGIsIGFuZCB0aGUNCj4+IGRhdGFiYXNlIGZvcm1hdCBpcyBrbm93biB0
byBiZSBoYXJkd2FyZS1hZ25vc3RpYywgd2UgY2FuIHNpbXBseSBydW4NCj4+IHN5c3RlbWQtaHdk
YiBkaXJlY3RseSBpbnN0ZWFkIG9mIHJ1bm5pbmcgaXQgaW5zaWRlIHFlbXUtdXNlciBpZiB3ZSdy
ZQ0KPj4gdXNpbmcgc3lzdGVtZCBpbnN0ZWFkIG9mIGV1ZGV2Lg0KPj4gDQo+PiBTaWduZWQtb2Zm
LWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+IC0tLQ0KPiANCj4gSGkg
Um9zcywNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCj4gDQo+IEl0IGxvb2tzIGxpa2Ug
d2UgaGF2ZSBwb3N0aW5zdGFsbCBmYWlsdXJlczoNCj4gRVJST1I6IGNvcmUtaW1hZ2UtZnVsbC1j
bWRsaW5lLTEuMC1yMCBkb19yb290ZnM6IFRoZSBwb3N0aW5zdGFsbCBpbnRlcmNlcHQgaG9vayAn
dXBkYXRlX3VkZXZfaHdkYicgZmFpbGVkLCBkZXRhaWxzIGluIC9zcnYvcG9reWJ1aWxkL3lvY3Rv
LXdvcmtlci9nZW5lcmljYXJtNjQtYWx0L2J1aWxkL2J1aWxkL3RtcC93b3JrL2dlbmVyaWNhcm02
NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtZnVsbC1jbWRsaW5lLzEuMC90ZW1wL2xvZy5kb19yb290
ZnMNCg0KSSBzaG91bGQgaGF2ZSBwaW5nZWQgeW91IGRpcmVjdGx5LCB0aGVzZSBwYXRjaGVzIHJl
bHkgb24gYSBwc2V1ZG8gdXBkYXRlLiAgSSBzZW50IHRoZXNlIGJlZm9yZSB0aGUgcHNldWRvIHVw
ZGF0ZSBmb3IgcmV2aWV3IGFuZCBzbyB0aGUgc3lzdGVtZCB1cGRhdGUgY2FuIGJlIHJlYmFzZWQu
DQoNCknigJlsbCBjaGVjayB0aGUgZmFpbHMgdG8gbWFrZSBzdXJlIHRoZXnigJlyZSB3aGF0IEkg
ZXhwZWN0LCBidXQgc29ycnkgZm9yIGJyZWFraW5nIHlvdXIgYnVpbGQhDQoNClJvc3M=

