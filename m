Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2B7C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:59:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146774.1783331987269097939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cWsvbMn5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cWsvbMn5;
 spf=pass (domain: arm.com, ip: 52.101.83.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Vp+Bu5pzn/gzsoOcv6MFKkO9Xu1rX2vMOSXIpywYG8pAP6AI0mtBAxMO81Yy8H2Td8VYhZpkAk2ytIowXvGjjVT3ja02XDo1Aj3DbUIaBW84V+yhZIFMbCHecGS4tbbZf7HUXuP7p+dcNMs9wZ9jGtyYqpt0Qmpzx0SurIi31BWYyTlZOGk5FUYCMW/jfm5cavC3WuJBW90h4d9S7vDX2XXH02VHfpiKDUwp4oAiCrki2twPSEhx0wQshj8KKqn9D1MZ2EL1on4QNx7/RVpr8vTnCYDk8hl5iofjKf8uciIgD9jphdbYusxkfujKur1EY9fnwK5Ak9ZcKJXfHnWH3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbX/Jg/PLNqcxU/ptSYi0JdttSPKgkB1zLB9+72LKGU=;
 b=Kz+CuNu5XNyrFyY/QHkR80AKeDj5TQxCXoTZESkszj0rgHsV68//avzht+w+D/+TBEnApX6z476anZWorCzZdugFZ8YRTdWrVvl2N9fPi7Vjugb8e055lIE0zy5zLuphkZCPHBv0GRv6Jn9KQGsBOVivBRs+12SRcUdV/ynC1NJc3QpP1/TF2dnsJYa19DbUz9oIvTzEQYCCGuMqxEj678++ztBmL5WDePlx4fIhiOVb/4gEEECRI5onLYRnRgYECnDar8z3raWKUbOZerlikoix86aPBQtw5/ulbKzPIlbHX6oVrHA8enPQv/2tgQLjJYhlPTyPluTj5rD7Fetp8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbX/Jg/PLNqcxU/ptSYi0JdttSPKgkB1zLB9+72LKGU=;
 b=cWsvbMn5QJe5Sn3e9Fpd9+22+Ti8jjMb4PaMrD80BjlrqMJZChDwjqqFs4AczvkfIrGffEVnZg1Wj98PLrLXyo3tUV7DjYiozDpNlrjkTgil5Zu8TyggSWicX4pf9rOpm+f3kc33ljaEmwvsbhFhDcIOoWbE2H+/GdpFX3gAj1U=
Received: from AS4P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::13)
 by DU0PR08MB8447.eurprd08.prod.outlook.com (2603:10a6:10:405::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 09:59:39 +0000
Received: from AMS1EPF00000090.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::69) by AS4P251CA0027.outlook.office365.com
 (2603:10a6:20b:5d3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 09:59:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000090.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 09:59:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMqjSQC7AIUQk6WsiOAjxtf9QR7ZwK0m/+FfGhEoKQHfO1PnOn9AqwGGSQOvz129HEV9QhGeoCcFFPWG6MhrCiD7m1iOYPTLdHhQTmGjPjzbjBgS1QP3cG+JybaSv1UZ+PghwiANbSAtosbYQCBq93XmwQQtBWvrss/uJfUs6mEs+6O/agVBYLX86dyu28NX4bs+k5vHJaFEkGCb02ZbT8wlK4H1+tl6eaOcYWDKsLiTfaJhjCjQxbPxVropTQbO9ZtVnWNKnt+NUThqDmev2aa6MbarfczHOdE9S0qURc6lYgfe969/7bE9Zb//Oc1kD+wKswXDD9BGXuj3aFxjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbX/Jg/PLNqcxU/ptSYi0JdttSPKgkB1zLB9+72LKGU=;
 b=fSA9NRemHvUWTxaWW1/9SgJYiWwVUGhZRM2b6Sf2U0TLMiWSwCJ4XtAP8tJuvDDtoEFfliEF+i+Bu2fTB2n4RP6kTO9AC+1r4QVbaQWVhWcHifLYuuv1wIu1wPdInwv9g6cCgAELbjdVo8SBEwQrR5VMAMtP8E2xL/aH580Z0MUYJFPJoU6LzZd8yxl634DNJXaqrigKoDbDpi39HjSQvEW7iITC8p5pGGUCoxkc7vapdeE2qPI4Sgfi1/Cgsnt8as8hCwIIHnaYF8E7BvbwRomp7Xc5z1iNG/g2noxyeKNhzxDLvsYTpOpHMQdbE6lLCr3x5U0gxGnz19FvKCYw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbX/Jg/PLNqcxU/ptSYi0JdttSPKgkB1zLB9+72LKGU=;
 b=cWsvbMn5QJe5Sn3e9Fpd9+22+Ti8jjMb4PaMrD80BjlrqMJZChDwjqqFs4AczvkfIrGffEVnZg1Wj98PLrLXyo3tUV7DjYiozDpNlrjkTgil5Zu8TyggSWicX4pf9rOpm+f3kc33ljaEmwvsbhFhDcIOoWbE2H+/GdpFX3gAj1U=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB9PR08MB7867.eurprd08.prod.outlook.com (2603:10a6:10:39e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 09:58:36 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 09:58:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, "Moritz.Haase@bmw.de"
	<Moritz.Haase@bmw.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] json-c: upgrade 0.18 -> 0.19
Thread-Topic: [OE-core] [PATCH v3] json-c: upgrade 0.18 -> 0.19
Thread-Index: AQHdCtpSY+JYB8d4LEafuBemOhq5xLZgNQgAgAAIsACAAAiKAA==
Date: Mon, 6 Jul 2026 09:58:35 +0000
Message-ID: <AD364370-1FC4-4E75-90DB-5DB5D651F9B2@arm.com>
References: <20260703105349.1664278-1-Moritz.Haase@bmw.de>
 <ebb0c3d6facbb9d88be4451aa981363d65c19d67.camel@linuxfoundation.org>
 <CANNYZj-ki4BiFoP1aYtDDs+2sngrV0T7o6Yh0KScuUHGu2TEVg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-ki4BiFoP1aYtDDs+2sngrV0T7o6Yh0KScuUHGu2TEVg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB9PR08MB7867:EE_|AMS1EPF00000090:EE_|DU0PR08MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e38b9b8-1483-4a99-c9ce-08dedb454b6d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 3WXOPv0da4Ou1eSJuMVmYxrIHUx/QUJDZ7nqRRElJikZk/1TBlwlbcxx0z8bwmTe5JUYbu+eBo5OdBz/S4sQPp320bdJw8Ws8/d9lR1UUKVOaMx36FjGDtw2YrUlMHMACorLybx7ijd3Ti0RmqUxCEXOZKrSMylXP1Ugyd9cs4g7zP4z9m3BhFELRyWCSBxuLDJFxLw9uKHCt2F2WfI7UMCkMW2LTUyADtndlkptcz261mnkf7s4Jf+VWaXVP5PAKwfJZybgBkJIxR2fL8p9QohaQGSl35Esy8vlnnj4V7gznk1x9MiVCfw2u9QInc319WFMJbITY5nA2X0gj4edsbpyvT3opbYFND7SCYsQDdva1tRQaYSPH8dpnKBvdjHEdksadLIhWYo/0/ep3PlWb7a6hnF7yRLVbq7w92O+i2sMB8Hns/X+Q/eIque7Ng/TA/9VS/eus9mG2/iwu/ZHfxNRCZCDYQKEoh5GAfGhKUaIWMx6pVaIOTJ0SrZzU4CIEm1Vtr+jO/cJCz9j9ntKCuQ03TrWXfDmjxd49d3eYjmpTsBohldAyjBHfuDZGy7XIbIsACWjlCdpPDqBiLOP4tRrTCQL9otcXcMe2RFFMyDxNy6Ro3b1/A+eCAICKzwGbVQMMDTA5Uj/fhoIaOqM+R1Onvz7BmfQjGiDcXjEep4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC419BEFFAA4EC47B35FEB945CF83C51@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 PTWdjHFMR4RyQCxrtmB87UQk+FdtpPXNje5FJBWc4q0rM9F723Sn+nWeSeOpH/I7y+/wr/Fu4oc93JreLSOE2yP3Zmp9Pl9JZdxIbZDbd8zfvBa7yhHHLQRXJvl7Y018lypUxbAFeskvDudnkNwmANHkkmTl9OS64lk8/kh4eZTjFEM/CSH5oBULqQ/CI9to+fagdkLWo3yZIKe+k8UqcFID9xi65UHf4Ln0S+kpqJbyUJSJ0jdCEPISeOPcIVFdq2znwKuJHJpIUb+Nc3u09LoYmCJd0BtHsexAzO+5BkKA1n3KjW04IPKZa/RoFaqzpr+LxnhdhV0RfdvRWDBJFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7867
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f63107f7-189a-4591-7abf-08dedb452501
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|35042699022|36860700016|23010399003|376014|11063799006|22082099003|4143699003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ZjeiVlIF4b+cJ+58c4Qb/QhYxsZn/b0/jKvdgzUnXlPzX1InhqOLuA0lz6RtK+8Vd4FOFa1S1+cxB9PZvPnXWe8BIuzJv0Kgm/xWgygvIjsYT5CRbNUNe9EuSzURLbSw2tKI4Os7w1c9nkluCuc2e9CMoQ2rT7qcJhxdT81LHg1eqd9YyQ7AgX492sShlpjzfD+fpcIcm/IUjRHt2VlpRzlnI4VCUpMu6I5wflRZjJd0OGyGwNHH6So4x3nlau0HDy8jentuKMzsQhSyJS3VodPhhZ7fj5OlPastU7SCVcIPDH3PnV4DKSLYJfWGuYUMICNrbFL2bKHv8xIRSeAg5HdqIqvkT39S39MO3q/OFPaxYI7uT3pMT7oBiO3APXImeq/dqriuHeopPewtO52Ehp/RiAomRTMrchpx2avErAiePE3ttob5+sxBVn6XXEtAAoM/q8He4niEnTobrkVcOa2ALDi958nucrVQSqXO7Bkr91mJKJzO5bKxXHln/Rd/rV8nlBA3Ft6yaFIuE+3VMushpsxaLIVhdejVnns7doMkHc2OvTRjlwT3KeXjd8YK/OrXJzbBZrb+QfqUEuXI2mHSe7XKLrqHMee3aP5xa3Y6hY/B4YU5Dw7fa1bJO2oPUHZb2taOCpTCRSHiNNfAWA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(35042699022)(36860700016)(23010399003)(376014)(11063799006)(22082099003)(4143699003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HUrm9BbosW1wsumC0bzGledFkSL5UxWOJMnbaRdyJkpmB/fzxTRcBZCEF3E6fUJlB3z3cPr1pZmn20r6yYC/1eYgTsgCH+J9OYrqXkIxHJ2F4FyMIPCShp2kTPnoFotDJCvbUxRtr/ljz+c5YVZVy/gnN3IewrDP997y5g1LU/7+bNrgNAJHGaUkHew470DQ6NV2L2iViGweqfjlaO7UJ4466YQxxHy//Q4S/I5H1X055Co8G9s/FPza6slqXvUV78Y+xSSQ8p0ZWu7mR8fvZ1GtJmRAmmN6hGdNz/dWlbtAn0Y0sXf0abu5znf5XWJ/Xj7L6ixnKuPEOhtMpxtTVxKThp1hAcgS5m92+28lNRUG0QgFMnHblDykN8NLPMknDZB/LjGLTlvEeuix65/8YNbl/y5PFlRzVKKd0WfW14KIk2Jf8XPCK5cirm9HBJj3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:59:39.6992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e38b9b8-1483-4a99-c9ce-08dedb454b6d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 09:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240234

T24gNiBKdWwgMjAyNiwgYXQgMTA6MjcsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCA2IEp1bCAyMDI2IGF0IDEwOjU2LCBSaWNoYXJkIFB1
cmRpZQ0KPiA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IA0K
Pj4gVGhpcyBwYXRjaCB0dXJucyBvdXQgdG8gYmUgdGhlIG9uZSBicmVha2luZyBvZS1zZWxmdGVz
dDoNCj4+IA0KPj4gZS5nLg0KPj4gDQo+PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVj
dC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8yMy9idWlsZHMvNDI3Ng0KPj4gaHR0cHM6Ly9hdXRv
YnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMzUvYnVpbGRzLzQy
MTYNCj4+IA0KPj4gVGhlIHJlYXNvbiBpcyB0aGF0IHByaW9yIHRvIHRoaXMgY2hhbmdlLCB0aG9z
ZSB0ZXN0cyBkb24ndCBidWlsZCBnbGliLQ0KPj4gMi4wIGJ1dCBhZnRlciB0aGVtLCB0aGV5IGRv
IGR1ZSB0byB0aGUgbmV3IHh4ZCAtPiB2aW0gLT4gZGVza3RvcC1maWxlLQ0KPj4gdXRpbHMgLT4g
Z2xpYi0yLjAgZGVwZW5kZW5jeSBjaGFpbi4NCj4+IA0KPj4gTm90IHF1aXRlIHN1cmUgd2hhdCB3
ZSdsbCBkbyBhYm91dCB0aGF0IHlldCwgd2UgbWF5IG5lZWQgdG8gYWRkIG1vcmUNCj4+IGxvY2Fs
ZXMgdG8gdGhlIHNlbGZ0ZXN0IEkgZ3Vlc3MgYnV0IHRoZSBleHRyYSBkZXBlbmRlbmNpZXMgYXJl
bid0DQo+PiBpZGVhbC4NCj4gDQo+IEkndmUgYSBwYXRjaCBmb3IgaXQgdG9vLCB3aGljaCByYXRo
ZXIgZGlzYWJsZXMgcHRlc3QgZGlzdHJvIGZlYXR1cmUgaW4NCj4gdGhhdCBwYXJ0aWN1bGFyIHNl
bGZ0ZXN0Og0KPiBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3Jl
LWNvbnRyaWIvY29tbWl0Lz9oPWFrYW5hdmluL3BhY2thZ2UtdmVyc2lvbi11cGRhdGVzJmlkPTE4
YjFjMWEwN2VjOGE0MmFmMzFhYTk1NzY3OTNmNGVjNzNmZmQwZDYNCj4gDQo+ICJzZWxmdGVzdC9s
b2NhbGVzOiBvcHQgb3V0IG9mIHB0ZXN0cyBpbiBESVNUUk9fRkVBVFVSRVMiIGlmIHNoYSBmb3IN
Cj4gdGhlIGNvbW1pdCBzaGlmdHMgaW4gdGhlIGJyYW5jaC4NCg0KU2VlbXMgbGlrZSBhIHNlbnNp
YmxlIHRoaW5nIHRvIGRvLCBjb25zaWRlcmluZyB0aGUgdGVzdCBpcyBmYWlybHkgZnJhZ2lsZSBh
bmQgcHRlc3RzIHRlc3QgdG8gcHVsbCBpbiBsYXJnZSBkZXBlbmRlbmNpZXMuDQoNCkFsc28sIGJ1
c3lib3jigJlzIHh4ZCBpcyBzdWZmaWNpZW50IGZvciB0aGlzIHRlc3Qgc3VpdGUsIHNvIEkgdGhp
bmsgd2Ugc2hvdWxkIGVuYWJsZSB0aGF0IGluIGJ1c3lib3ggYW5kIHRoZW4ganNvbi1jIHdvbuKA
mXQgbmVlZCB0byBwdWxsIHZpbSBpbnRvIHRoZSBidWlsZC4NCg0KUm9zcw==

