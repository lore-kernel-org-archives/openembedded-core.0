Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6B31094471
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 12:00:56 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9625.1774094448864723190
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 05:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R4CbvHzB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R4CbvHzB;
 spf=pass (domain: arm.com, ip: 52.101.66.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YYgqHhXb23kmmWaytKBTw0wg91xJyCfrSpM6RW3BXZ+iJMcZWSWz/WpDrGW80IFdDBeXVUeEXSPcgsPtxpIvBzhJvPQIh+ONFeOsVNYb+I0eDIlYe5bNY0TPGuCQBCWcQSl1S2wmuJHU/NL7JpBTYUa4bN5b7hLryomV8NqE4udW91okoHGqIjCZR3alo7l/ZHixwwPNGyWebPBKCEOEHXpRNoyoBGHXzhqHuiifGjOYaC0iU9x78ZQHBMNzlyj0QDCSL6fRa+fjJHQVeoH/FK0TQ3Dwvev2k4PJcmjGjtf1p/U/HSKH/QVRv2rBon4N9n/9pzNJ586K2xI9U6m91w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5lHi01z4fPCWJMxzL2wBQAF/b1DGN04wgM8j93A8ak=;
 b=O8G1ZeYxygi3gZax8wNGckeXCoCpr4XSSQU7QRPkGQU1gJZ7SlVIGvx6UYvvHHa58bLVjuUtkrZhOlyZlITxL3mOHREcVVD4fu9VFFPfGNnW6fZ4KDkzaRXI8kx/bWXXpzuCu/irqQXYOwhCjGc4ZCzriTi+c+nmmOBBliOnFXIrOH6D6h+M9p/LdN7IxirkMHpZL07T+SZgFrRZRIMwHYBY4L6bSNfUPPtk1xP5VxLXItT3kjoHby13oPjud7Pu32QfnBgtLAA/NJPYMjtYIEkZ/AAcu0Ic6XX4WM5GcWbT1FLDy1a4ajSmllRAebYE995Va5Bt4BjheNMkxE2kcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5lHi01z4fPCWJMxzL2wBQAF/b1DGN04wgM8j93A8ak=;
 b=R4CbvHzBGWa+avVzrTJGAuL6lBKZmidbdIcAfgZsCDLcRALM+yA6vZI9T9uQvcu/8t5nDpp5a5qq/ABhwKn6i9DMweshog4kApnk42bUu6cA6KSIZIUjED9dugzBwtfp1mkCYOxd03roCvHlafbDlX+wVOBOnEzfzG6D1wReG2s=
Received: from AM6P194CA0082.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::23)
 by AS2PR08MB9248.eurprd08.prod.outlook.com (2603:10a6:20b:59c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Sat, 21 Mar
 2026 12:00:44 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:209:8f:cafe::4f) by AM6P194CA0082.outlook.office365.com
 (2603:10a6:209:8f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Sat,
 21 Mar 2026 12:00:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Sat, 21 Mar 2026 12:00:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/YPkjrnFJJUP+K2QHQk7RagPw5gdKtul8aC/vmNLqvkvia2suNUfiGLQ1RkensgPtzb+TyTYJIXW04ox6Nu9Loa/S7s4FiKGnfK4veBM3pAzS+5fPllWdi00cGBffjK86wlUPFkvDZPivwFoN4cTaPzPNA98qOYiqdALbr2zOnD7qoVeVswJ4DXi3dcC07jQteIwh+6aI5sBdIo0mYxKwXpyQ70BdcESIB+i9cUnaGu+cNORqTirAuopl/C6BMqrvm67eaOPev6NZWlS/WKL0c96QYJXWgXaYXTpzEv7JcbJfsrFbNWU+KG5ltiA4JVEXxDmpASvLtZ+3wMMjvNGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5lHi01z4fPCWJMxzL2wBQAF/b1DGN04wgM8j93A8ak=;
 b=OQTyqhRnHBkcohFpD44Yj4I6Vr74kEwtFUcZ/zVCoO0F8ciQuHAvXiqmLgRN+EQIwQbb7GRhJonJ0K5CZNYi4/z8qrFC0q9Uzq/oYsiacrF5uKCHjhVC/2tmXguH+bYGjzLPgsdaUXRY9kDbj3kEEaHQ3G2sMOJVJcDdU9B/3ls9w4O81LeUAFvADusEYufuYV4N+22LZo8QfVaZdaWepsCOI134P+NawmgTECHWDKET1Lcas4xqLkRczjDqUW6oKUpU+VRnppMiHignQ3jeR00Vx9rQBzGdLJmgHMzjBCCdWDdn7aqkuwQEm71SMYM0YU2tBsldQ4nwf2h3LqVlpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5lHi01z4fPCWJMxzL2wBQAF/b1DGN04wgM8j93A8ak=;
 b=R4CbvHzBGWa+avVzrTJGAuL6lBKZmidbdIcAfgZsCDLcRALM+yA6vZI9T9uQvcu/8t5nDpp5a5qq/ABhwKn6i9DMweshog4kApnk42bUu6cA6KSIZIUjED9dugzBwtfp1mkCYOxd03roCvHlafbDlX+wVOBOnEzfzG6D1wReG2s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB10746.eurprd08.prod.outlook.com (2603:10a6:10:52b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 11:59:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9723.019; Sat, 21 Mar 2026
 11:59:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/7] class/pkgconfig: use pkgconf instead of
 pkgconfig
Thread-Topic: [OE-core] [PATCH 5/7] class/pkgconfig: use pkgconf instead of
 pkgconfig
Thread-Index: AQHcuGUWAIeQmRGWUkC5ZX4XSHr1v7W4NosAgACtAQA=
Date: Sat, 21 Mar 2026 11:59:39 +0000
Message-ID: <19151BEF-3A4C-4FAE-BB26-3FF8FDF17FFB@arm.com>
References: <20260320122732.1630715-1-ross.burton@arm.com>
 <20260320122732.1630715-5-ross.burton@arm.com>
 <CAMKF1sorLiSe3ip43iPs1vQrfO1LBr5D7BuvvyfEmH6KKCRF2g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sorLiSe3ip43iPs1vQrfO1LBr5D7BuvvyfEmH6KKCRF2g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB10746:EE_|AM4PEPF00027A65:EE_|AS2PR08MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: 120337e5-28b0-43b0-49a3-08de87417b16
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 hYVi7TwLzhuRkYtTQ7qvw5znQwjLSIgsd+ai0C4Zq470nDWO+Z6hffq6M9jmTFrh2CaIoZ1Fpi4we8jJuFJUchb6ijCfCSl8ba1prD+Uc2XmPDDsXvlpwsfaDcE1kuPfmd8jXBoD91HVtWFf9jw3tei8QYBdeLgPGjQT/LgKAurGRbF1l05zml8UoJwDxLvUg3hf4Derr7zT//imP+niaYNmy98CNlPgonfCH3D7ojfBkch1wzTUN88s9A6nDSgTB98SmQxt479r9kUjjqzPU1bEeuTjmj46x627zEzVdnNomSkahRM/7TcbCJGXbehx5GiawbYcf0avJeaiqrQ+DHNgqrmibiBkoJDZQ4BpI0QvisMefrc8KtpIDvEzCVKU0aVx9FqXtkZf7hAQCkM80H6BoacTj+AbAsqqMiKbhhPQ6H1Zrzn2yrAFTL4Rm+7q77NgG5E1hsLoiFi1KVzDGgMJULQu8WW3yuDxZqUTBhi8SXQqkFvui5VKB4w8zX/XfBsi2fP8edA1YXvc8W/m86TEgEVrFhp3kO7bnzqPHNhbsM17dASayoyRu06hwnABMN31r6toRnKbTqjRQZfo7ZXCnB29+hIm41edapP7qMtqj5GuCkgruqQHlQcj4Qv7McXH75x13eqrYa4ghEZycY9xjy9mMHzyW2VRbzaFvxQvoVwySVfSocNUb2m9Cx+Z3FFlOBm3udLk88Z3GqsCEhMH+7U1liVe1A2+0V4DII2xoA7DNzpcaXALYia/dFcgR07lb4W9reHn9t1d3chWZlbyfm9w1SwtYOFJdZ1CWBg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CD77F4300823E40ACC6C71629D7364D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 OHWepR21c6oc9Zqr7vQI2Bei5+41n0ojc5NhtCS2oNhebPY93QjzPktv9v1aO/NSca4MkBFhKi1+eCFa/FworJQSrqTwWuAHR3as3NyVSkAtfr+iGZEI5UxFCAin6I36NIL9gU3adg3rLFmJnSqJ9Fmt/b5pWppnnZaeRNz23KzmG/LvOYXc2hzHB+dfkyq+em4AOTkcAT1f74cQBSC2O2AqNXhaXJJhwpv+77w/CC5zXZ3W0B05IEoUGLp0Etpm6VxdZLLVHywVVyILBuuafKQy4ry4a7HfkMIhWp4EBj9ca8OKML7Dc2sfCkwCc8M/39ApdvOXfuwO6NPdlMrh9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10746
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	533c5bfd-a64e-4d25-d3f1-08de87415466
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|35042699022|14060799003|36860700016|13003099007|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	cvdT/j4MPwCza1Sx9oSLhtyG5es+QSABroCQxtWSupoN6nJAI5HPCrtgYsqXXI6xaeyZopmhFCbrAPBOScc8sXgIpXpMLKTC2esdK5Nggvjy63uHh12T2jFnjucFhnIEDtlsCyuCOMSHaFF/fN1WsNZMMr6TkBYXkWT5FFK6E+X5xgpuKjd3CucDSyXrccgUjsBOztDaaeekwbrHYEMxj9+LtTPZrHSQER0gQ7U17b4LfgoymK8x0w1GlsEwiiiY0QpEC/R+5TbwUqIEFwVYM9NLzGkqyVTLQ8w+p5A8QKcrqcwqGjiuwqSAyLufN0wi1A85ssrntESTSb4a0X50DakIH7Zp2ctJlvxZtq8jTDYd30Lhi32NOZ4jh6w+7h4bphGYYVQlal04kOevWUh59pz0dVf0bQ4WV7MuemLGDW6KAB9GIWm9wGSV2WmlYsFf+vYSB45zLNcqd/FhyuK0wldutRVWY7Ot5SwYSSbgnqUR/52qBq1QleodRqmRGlVLSz1L4D9x02HJYV89jQ0J1QzRWlDH+hrwpLoEikdB//tF8GhK2KyVOBcr89N1+utTrmOEXgZLV+cH+DtQ6qU0GE/wNwedFB6ZGMUdjhQV7PUnVC2XyBqoWBuCP0OqStEI51i+ZEa5EvdATI8CYWEHUV6O5aEE8GQCcS8Ig77xU4dspcT5FyIcaMu3WTMq3N6g3fGU6DgwJzU9iWlNG19e4eBA8XLbCJqQncMXN5nxBgO8J4ZE4r0GKdISnfUoqYJTzGZFBIWQ5pPq8qkDdRNT3Q==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(14060799003)(36860700016)(13003099007)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	a0oZhxX889J0/v4w/c4RbkJJ8uI6m3ujStbFRt8obfVWmdoGhlAQ4/S30xXvivDDhaV28Fwx+pLQ/AWIYvqNIsvswaltJmTH5RmTSqlABC/EKEEsO434ssOaq87NU+9tiImRbEVgFUWhoVJgmkdH4i3MX7rxoKhFCcM1MJgVyi3IURn6pA/Y3ZHoTZuMXGWMvYtECQsLi2jfdCYpK3FM65CwtS9L8yrUSE8OalUiZwOQ7jNY2jmdV2MrQw07VJvntph4B7SaibFxQgtbHUzaPbbbEEanCQpDW1EzN6pJ01755xXfCPNsIq6tr3ti5LGy9xQbzgBNjQaKnF/LHshWNuMPmciMCyKEXJS/WjOrbnhvSw94kNmHApxN0lpSrBtBmGK6MIracsv9ZI7akNwvl0WfvuDvMQJzHzCb3v5OYNkHedivSS1ZUiHpIkJV22Lr
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 12:00:44.0457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 120337e5-28b0-43b0-49a3-08de87417b16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9248
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 12:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233656

T24gMjEgTWFyIDIwMjYsIGF0IDAxOjQwLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IEZXSVcgdGhlcmUgYXJlIHR3byByZWNpcGVzIGluIG1ldGEtb2Ugd2hpY2gg
YXJlIHJlZ3Jlc3Npbmcgd2l0aCB0aGlzDQo+IA0KPiB4bWxzZWMxIGFuZCBwcm90b2J1Zg0KPiAN
Cj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllL2FwaS92Mi9s
b2dzLzU5NDEzNjUvcmF3X2lubGluZQ0KDQpUaGUgcHJvdG9idWYgY2hhbmdlIGlzIGJlY2F1c2Ug
dGhlcmXigJlzIHNvbWUgZnJhbmtseSBob3JyaWZ5aW5nIHNlZGRpbmcgb2YgLnBjIGZpbGVzIHdo
aWNoIEnigJltIHN1cnByaXNlZCBzdXJ2aXZlZCB0aGUgcmVjZW50IGNoYW5nZXMgdG8gaG93IHBr
Z2NvbmZpZy5iYmNsYXNzIHdvcmtzLiAgVGhlcmXigJlzIGdvdCB0byBiZSBhIGJldHRlciB3YXkg
dG8gZG8gdGhpcy4NCg0KVGhlIHhtbHNlYyBmYWlsdXJlIGxvb2tzIHNpbWlsYXIuDQoNCkkgY2Fu
IGxvb2sgYXQgdGhlc2Ugb24gTW9uZGF5IGFuZCB0cnkgYW5kIHNvcnQgb3V0IHRoZSBtZXNzLg0K
DQpSb3Nz

