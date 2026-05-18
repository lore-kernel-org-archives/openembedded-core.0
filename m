Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E683CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 12:30:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7261.1779107397421866208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 05:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Yvjp4rQD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Yvjp4rQD;
 spf=pass (domain: arm.com, ip: 52.101.72.27, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tuBv5ubN2xjVtaeXA4v9yygY6kdhLFpxBO+xWWl1DaCtD072D35T3m86wRMKvRDiqNE68FFzHw6KWi8Uk5VWkj/CudbepMOLk7qLQRV8/qHJfa4b3Zy8RE+Kam5WNDewU8wJ7WPsSC5oROIUPkEijbaTdSamxi8quBx8PvTVHRDrov7d5paTiAwHBLCMij0WfYpQE7wa+F8rnPbN/eI/uGz3JBLal+7aRlgg21WI8hejRi9HIT5V7ebunEa/dTZlX6rEI9+vlrOFqaSwLC4IBIj1avoO5nO2n8wX55bsU3b1dAwOS/VdvufTFkx/2ucMPWYhtM1Zhl1lTRfTGcgSPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhBDXZzf7jCViDSaptHhxTWLx7E3nyNzeWPYq8dE7f0=;
 b=Dteq0qNNnaCgwTSh4Ed9z24Mq6AUGWyLn/BNNUFcCP+YNhvqyQxpHSTXqwj4MbS0Jg7CS4kUlGx1r4OR6wvHaKcYnUMDPcyMsgSWRpEzzJH3zhzaQfw4s0XBaztqgNGkk/kP/7AotgGCCJo25nl2RUA97637bD8gx81NDxuwpR6RoFqKiCsflFHQFbdcDOaUgGBT1hpH23d+ov1xa5QXTguSlzuBewmCSIUlgXkmUiyfNFlFxAOaMzKf9V0F93xzmW+17BhxKJZzUXPEuCAIUFmhjJMWlG8px2g+NC+KHK8wcUdFKkbyUYGmoPn3On42N5te3IZ2hAuSqBv5zuza2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhBDXZzf7jCViDSaptHhxTWLx7E3nyNzeWPYq8dE7f0=;
 b=Yvjp4rQDYsuYD2YIClNTjYFt5hpyTirAPHcgh1xO3f/8N5Qt+kJ0g/X4SPQ81eLqXX1eMoA0w7OGj0ZWHV9pYp0NwjYMtzJ20I3ICebA5jMkWU8W5/z30Mkwe16oFAh42vJPZU/lTspRzz2efKXGSdoBIaP+h9TqjqSwfy8wMXQ=
Received: from CW1P123CA0016.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:292::10)
 by AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Mon, 18 May
 2026 12:29:50 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:400:292:cafe::59) by CW1P123CA0016.outlook.office365.com
 (2603:10a6:400:292::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 12:29:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Mon, 18 May 2026 12:29:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YX6oRiHwrUmlaZb+Um2Q1208Y1D++p3LjeerKyehmju7jWsrNJFoOUXOt35Oi4XOV3O0BbYBMtu2sZX1WxaVbF532DIsCj8KkwYSRxE7V0DgGY6l7vTpwWGuj/2Dbt0i17teNq3UKpOImSkgMbqOqFUOulAt1/s56jbouzt6UTbf6/R3P/IZ7zGS0/Eca+nq1tVJ2PUSKf2ozXve1CgagtsZ4YqFn5cM+sU7GUMBm6lJnQnp8YmE4Xa9/iFXIdpjN+9nkrpE5JWLFBllcwAVSaMrkLDm+F+JQ5fTD3Dy+YFtG/bLkIqs/x4wZ5aM18M4CvZLKDspOrrBkbLr9fP0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhBDXZzf7jCViDSaptHhxTWLx7E3nyNzeWPYq8dE7f0=;
 b=Zz5HAwNUfltvyN8mFti8b/6qsnOcxNIxhq2EuxAzOjliYk+smZERdiZTvbVfQZ6CFdPTLG2ISP5jCQZcpZDFVhpfKh3jDfrTl2uYXxD7ORsaRr5RfFR+Po6FXWRtc4zLOEz/KdB9pFsUXsnYXVrY7wLwEXal5Ty6yC88GXQCeL3IVuLocsoQSAy1NRWIjSEYBMf4DE8X7pLzZ+yUMBW9UrlVtPh/U6n+0uu/sQbSm3FqNSSjVWr3u27LlQ5JcnA05prmrAt7ztNYmEGUNWjLfc1pP+OT6X6HaKhGYtvOIEr3Qxu2uVOiKtnG4stWECiS5XGfeMRz8ybU1Htz3ZgRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhBDXZzf7jCViDSaptHhxTWLx7E3nyNzeWPYq8dE7f0=;
 b=Yvjp4rQDYsuYD2YIClNTjYFt5hpyTirAPHcgh1xO3f/8N5Qt+kJ0g/X4SPQ81eLqXX1eMoA0w7OGj0ZWHV9pYp0NwjYMtzJ20I3ICebA5jMkWU8W5/z30Mkwe16oFAh42vJPZU/lTspRzz2efKXGSdoBIaP+h9TqjqSwfy8wMXQ=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA4PR08MB7459.eurprd08.prod.outlook.com (2603:10a6:102:2a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 12:28:46 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 12:28:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Pratik Farkase <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libxslt: add ptest support
Thread-Topic: [OE-core][PATCH v1] libxslt: add ptest support
Thread-Index: AQHc3Tm0hcd0bYCrN02MQQP9mYS9ebYTxc2AgAADHYCAAABUAA==
Date: Mon, 18 May 2026 12:28:46 +0000
Message-ID: <73EC01E4-0507-4D3B-8517-6B2938F58C71@arm.com>
References: <20260506092057.27057-1-pratik.farkase@est.tech>
 <901B1CC5-1D3C-49F3-9BD3-BA18871B4D02@arm.com>
 <GV2P189MB3005CF211986FF7B7DFCF15FFE032@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: 
 <GV2P189MB3005CF211986FF7B7DFCF15FFE032@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA4PR08MB7459:EE_|AMS0EPF00000192:EE_|AS8PR08MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: d11f467f-99d1-4d5e-ffd8-08deb4d927d7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|11063799003|4143699003|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 8ey/0zp09HViP4YMJ/6oaUiVGaW2iLFYZcXb2QD2Pd9kb79I24D+x/4uFa+l1/enVaS3HCGfJbGVgaM7/PLqXjA0dxIAY5Q/JV3D8fRkPaxrd38U3vqbmFQB9vSkk3ZldAT/E1/+1Y0PY/EndhIahfrobzXaJU7zzoQf2M+D+CgTHEkgbS/NNTjdISoFP1gG/bfRYjhX5h4Cg6oM55KLVhpNcRqSaZfLbLu/w30lj/1Z+dMBQxJbT7+Rkzj8/178lgrp+XJlTURyXD2ag6kdATMk9pv5kkhil6//evXJgiCGnMwa7ucoVxbhNnOj0uBREDcNL6zMm0QYVgZKY/S2HQ7T8ybq7SU82reiJldJS6oP7P3vjVwp8kXi8KCIbjyapFAvVi1l5YtQu3VtgIDm4wL2uWL2ig4q+LZ4LBxvT2/urRfnOh+xs04QRrhD9Z2JuJ9JKaD0Yk5YcfBBI8HnGVMxVaZHlySVnj6nVGfTuFSuymB06sbNv8WHEff5EpNmEmm52LQxoSf1MN1vO/NWfe2nuYXytkGwFiLe0UKA1JMI/uaMbew1icorNc3WqOWEHjjgHsJwTJyy1UglY7qscxp/lIpYvxyH+cwlm4J/RZGaXd7sq4RG7D+EDyj8YqQ+uyFP0qUq6PH62Y9CXhfuaDqqaCp4Br0oZ8UoCAmAOEn2RqPnIY4sk6W0RbLgqH0ENmsPiaO/QRSf5eRKWTObm/coOG+8XaVhlwlFY8GPII0KeozR44ng7enUjc84rur8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(4143699003)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EE2802602F3D84EB3467A9B05D9F3FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 H0SvstOnWsWdtrAXa2PAKx5X/69DWcDgucIkg8WuMxEhwsA4vzHlZjRJF7Z0ZHWNiUvIhu28F+aTV2NsDsGl6zwOJM+lBxwZ4nlzXz/A0RtTk/FHzpVLJrDz64IfITMcLIN83d9YsAmCv1ublL5fDsNseyE6v7zXhP6CopavQjsUpflfOFqpWSBQlcHSEib9DLCf3k0OGnKO5VMBF3I9pVqKMJlJU6Z8e0xDUMUvOo0/CjvE93P48qhFViCDEZhYUaDlrOzBE5OTGL6GZFBftxCxnwZEXYtZhXSRDSg2q4nsU++Iha5kvRXGoD/CoV5/PSAe7zaKG9APV1Fr8aBwrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7459
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	275a2f98-1799-49ec-1226-08deb4d901cd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|82310400026|376014|36860700016|35042699022|18002099003|22082099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	OqkkAIQrO7jJLAw0YCVYzV6ET3jXfCz5n+iOONCKnyVf3MtSIqib1brHe4Q7xlPg8S2DEz7Mc3tK6rN6PKJWyECPHw+Hk6uFADPbWqH40YeAWQw/YAChj7WubqhXpEFdINli4IHbKKgKZQeYbVVAAPTl5HjrONGmndj6meolwEEwE4AlJidIG8U/3UrgX3BDNosvr/E0QUgP4viZ1YJ7eNHSKn4sgU3irc+sv8edrPyDDPzI0EdC95M5P9PO7UE+ClsAYDOjF7UgKA/um2oVyG3v7MP54oqhUkUma/itGNxGJiR/QlEgAjLmOKemBJANJRHwmqresopBdkFmcEq/X886m4QHOGBDCNdJiB5XEIHzQUbARtupCyypgIvXmbOEePgLhdif5wcci8ExFIej8r0pngOFDGYBfFDBEF9HgtGZVXcS8GvPluB0J0X9FO0YJ6IjcBqDnlusm4BldADYF3Y7UxVBwT0T4gik9Ks9VCsoneUqldzurScd7IdeDJuC+JG1QT68jhgF4sPLc3hO3sf2BrIFt5FV9/g9vIS2Zq6MXsD1awIVuD0O2FIgkrfs6H/gX3e1FjqE3tUiqAUgYsWofwPJKPcfuwAa78ZzM7tgs1G3rg1I9odNZnqmChGytWgkEhAxQPBGFNgwnmc1+ZDzj0spxzH0NzL2kYFuenyXIGGYg1VwZr/3ShxQoAvFVPtZDU8kCdxUPfD5/U7tAs6pk8wycN884aSeILQYpk0=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(376014)(36860700016)(35042699022)(18002099003)(22082099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3MmbMP8Vk8U4TkiHKFPN2jfUL68JNjWlIv5y2DjfR/PZ1Itsv7vTgTXQr787szNLzh84l17wbOUxNofJCX7Vu+DqywEDtE/FpMYETylVBFBokEyfujLzDdpX5ZvYgFfu64NY1gb29TE8FNtL0XcRSiNQC9t4PmK/QwVx0Jp+4NYBAKhd5TNxbo3SJPEGuS41Rh6LbBFFNfdMBRA7iH99uzSnHz9TWvLELMemdaHL6d0jAKo9s0ExrGy7rK/XdKk4xmiDS4d1LwY54h010WsG53+Q2U7WpjnaGpkZCXcTv/Lv2bCAFlOX0PLz+lxS7P+/oz7uDokr1kQFb97DYQ0ECb4QFsbk6ZRJ0wOIGHFZgTSsEhDersM33GyLNZ7UGfGLqRDRAUJOe4yeYl3MVh74G/PAorocCB5Qi5wES52fYXg4TlkTm5vhStiVcTXVyJRK
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:29:50.1641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d11f467f-99d1-4d5e-ffd8-08deb4d927d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 12:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237239

T24gMTggTWF5IDIwMjYsIGF0IDEzOjI3LCBQcmF0aWsgRmFya2FzZSA8cHJhdGlrLmZhcmthc2VA
ZXN0LnRlY2g+IHdyb3RlOg0KPiBZb3UncmUgcmlnaHQsIHRoYXQncyB1bm5lY2Vzc2FyeS4gU2lt
cGxpZmllZCBpbiB2Mi4NCg0KSeKAmW0gY3VyaW91cyB3aHkgeW91IHRob3VnaHQgdG8gZG8gdGhh
dCBpbiB0aGlzIHRlc3QgY2FzZSBhbmQgbm90IHRoZSBvdGhlcnM/

