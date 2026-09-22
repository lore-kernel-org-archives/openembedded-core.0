Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA494C982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 13:02:56 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9498.1790082173288864764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 06:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZMyx+y6e;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZMyx+y6e;
 spf=pass (domain: arm.com, ip: 52.101.84.31, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MWDshEyEOuGRC6JVw/Y3nu7V/bS3HCa8/8iTYkR/6JmnXyM42LQuAzXXSTxIIDGE/77ECZUI/j+d/waWmcSCV5WUoX4jgc2T27w2byN/+4IYTVz/SneduLHoj8/37E6U8d+/mear/JFg9nHy1Fj0nxuZSHpFIZGGvf9RnP8VKWKf+qEjidQc7dvyUxeu2My1//h/Z+5oxv14MQs2flti/RIrRjrCKtWk9lFRDGmesDcvrafJRaJQaYAL6hMONKCU/CU8Q9sSQklCitGjqq1Pc0xLM3zufJH5QL4iRaduAJebNcTLbGuA7Q2CJsMM6oL+dNywLZR5hdhTYGvRYgfF2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dzEy6wFU5kREBQIkpCUVjHipmYvkzeSjd6PkM2tY9w=;
 b=GqVpTDf6xbKrkFhD3U/H7dbXHjS+T3cI+sC47tvU32/8KXWBUC9b+lPiXVLhU72FvC0STcMCer/xfhKg4mAYrMZRWvTqEe4Osf3OCdlqzQer6h8LBf9taiuXZ6gdz6hlOm3UsbzrAAEPGFHLAKt5S1BwQqfMu1jStG+dLYnBvfyMj8Tev9jGdCI5g3fCOOdg8z3XZHv8uZnjZj0L4j5oE5lZSLBMN/2YZn/n9g1wSxmFiIxl1lzZ8b3Dxw8CxWp9hVHVQ76uzuQuJkK3CsV1p18qK+4dx5jMyDg6THhLLQZ7oDECNXNvBRmlpewVVVa/sU8+oMGNLiNS9QZnspxfiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=prevas.dk smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dzEy6wFU5kREBQIkpCUVjHipmYvkzeSjd6PkM2tY9w=;
 b=ZMyx+y6eDKVvvRrFaiCHLEZlJuvQjfMWmcuiIUBw5N42M1JasCyeVUmOmKcauGoSJtreOINTtHqX/na9vWcEqgdhSRN5DpAaVBOCk3Hvzw2kxv32cnHemS2V2GhFwO0FnF78gK13ZD7mowSqfr+YYK2LHb+ew3DiH7/wOECr0j0=
Received: from DUZP191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::17)
 by VI0PR08MB10895.eurprd08.prod.outlook.com (2603:10a6:800:257::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Tue, 22 Sep
 2026 13:02:46 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::7f) by DUZP191CA0009.outlook.office365.com
 (2603:10a6:10:4f9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 13:02:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Tue, 22 Sep 2026 13:02:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3dmwaHYiWb70LUGFykiI4qnUAWAcKgkcTNfKu3a+6ieBC7aDDXWPLaCp3gDalfmtUx+nXePJnrIdG7+BKR6rYUnp1ChS41zLZlIOILBrLZqMj+hnKhchFXFzw+fytTNebliGr0gzH1Q70Vo7egNc3H9jHWh9XYlB05ZJEMKCKw7rt8QpCb5JqMAZl9dAP/jrw+3/WV+hdYU0GohxSMmXPxwSbF21b6XmlXraMQltbQ52KO5Gu8TWK68S1Ui4KbbaddL0si3crnxncKc/+6W2KruVB1Oc4PsbNkwlCmRcKC//QoYpVZaEmYfToye/eA8RyUpJctKF+Om6xknSbvIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dzEy6wFU5kREBQIkpCUVjHipmYvkzeSjd6PkM2tY9w=;
 b=X4SqJWX5XTnHDs1yEcdGnsThiyN6qCk9uI0CV/XEthEYtlIEAueRF1FtWb6wVgg/4vSDOdx//bH9qfltj91D7r2Y8ZiS3QZl2ofY/ukRFVcJybioFmB4JY1NlYAs3ww6A58KVEKPdoMfylzF9p3cgbzhxbQasPaVyT3irVp9WjpNKPcFkfD+zcrrYqYwsh9NO+z4K1V8msVYTy3AchxCm8AY4cisFHkWAvVPJa1dsl0zmNEy6EBS9S9/Z836ALfL6YFMDYwO0RMRx0shqMoKGddpFZoXPsUSX1nihl9kq0nmwULVgvd3I3cjgIbutxKiw3T+XVCxYj6RU6Ti7vPRQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dzEy6wFU5kREBQIkpCUVjHipmYvkzeSjd6PkM2tY9w=;
 b=ZMyx+y6eDKVvvRrFaiCHLEZlJuvQjfMWmcuiIUBw5N42M1JasCyeVUmOmKcauGoSJtreOINTtHqX/na9vWcEqgdhSRN5DpAaVBOCk3Hvzw2kxv32cnHemS2V2GhFwO0FnF78gK13ZD7mowSqfr+YYK2LHb+ew3DiH7/wOECr0j0=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by MI9PR08MB221397.eurprd08.prod.outlook.com (2603:10a6:290:86::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 13:02:14 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 13:02:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Stefano Babic
	<sbabic@nabladev.com>, Rasmus Villemoes <ravi@prevas.dk>
Subject: Re: [OE-core] [PATCH] libubootenv: add yaml PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH] libubootenv: add yaml PACKAGECONFIG
Thread-Index: AQHdRc35MZQEqGjtL0GQSKatT+e/ULbamYOA
Date: Tue, 22 Sep 2026 13:02:14 +0000
Message-ID: <9E72762F-D767-4977-9ECC-B473190A6BB1@arm.com>
References: <20260916112414.138992-1-ravi@prevas.dk>
In-Reply-To: <20260916112414.138992-1-ravi@prevas.dk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|MI9PR08MB221397:EE_|DB3PEPF00008860:EE_|VI0PR08MB10895:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ef7cf2-6d03-4497-40f7-08df18a9cc2c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|18002099003|22082099003|11063799006|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 YjwS33DesQ+BIwtLXWwtuKaALYm4uI1Qc21lItsnB8RLVhZ5kLktX96SYfRn2nFz3thW4VhxJDeurw/bUrW4f3StESIczY3mXx0zp09/b6Na0lQ2YXfttxC/PbsfocdiqRFVzNVEMiV8YYCNpdgrhloWqutqBTGHl/Ol80a5XDdsbT0d73NIQIfnF9YxQv3/5bU0yJ55jJrhW8jrNDbnm8S8SSifr5HYyKZh3XkXplKs61v+VC3QAG4+rh9y3oikDC7nQEXzadXTyG1jO1GU+P+k8jwndQ4m8AKK4uAMy/EBp5Sj++0Dx8HGo3LpL6Im7S2HOntvo4e3vWWvwZaokoaNdEi8wP/UH+uGYsUA5iDSNtrcqVSJVLGBXl0CAqNwG/8BDeH+C7+v2F56MD0iBy8W4L+h3F7F4vTDA4OZ0o5bfjVU324G5BG+h6C6YjSmNtKxM48BtlTe0YBQZ8WAiz27gsDeksBxSutyopEzepdoggNvzFWQWzpCsb1FvOqDh2AInHqItmJ5+mxo5jZZxNBaqyYpkZYrvsIpqTISyJ5+TdCUaEPqS8YRzhINg1KXwsQBtI4g7hnJSK3zvJ9EGn+juphYaNB8ZQJmEdK9CvNYLQt+1z/a7J0HRBabRVnkWbx29rNAF9S8pWvczPDGgFrBwPWBk8cbiHTVl79ccoXFNwWrNPM/h7VcazxB2MG4UrpKXI3H4/KrorX0AOr4bw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCB0EF235EEDA2468D3EE806FB21E508@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 EfYxxubTgw143/vmEjagw9Z36P/JYYBgXEmfMFgDRfQKHiM68zkIEcNTFEfafnsu8vDDxKn8C+2bBhMT+KYwI+q9OCbIYhw3cGeTZB24Pxtv1wnUya12IDJ0f0honrHsgbTFO7VatZUMZRRbmrmcgA7sj2u11ek/CFuXRad/rLQKxmsPKj/VaI/JmdouLSUjaMQyzA1mzEdnUsGWawtfd242GCIezp33KL6Zi6t9lDC82pEVsNEtHk+73l+zSf74D/gWbVQnNfYh4p+ODRlsIK980ovyKn0dcDTWGNHpKSQgJcgFi41MqwMsg8BKivGXQz6NHZQqrZ7gezdDlWa+xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR08MB221397
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a1dca87f-89a6-4c8c-6b44-08df18a9b912
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|14060799003|1800799024|376014|35042699022|82310400026|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	U115e1xGkWFQJf85/5LK9mfXt9qwaUzWmZiP24D48hclYuqS1a7gwVymrKhLluNtlsGvpd+G1bJJWHjnQdfBF9nk5Dq0NBV2gEzCtyxA7Tm4ErCwt6TlUloGsxV9r9xxoHSwrHiS7Q0ssunQvz81POcnAjNAK50zgDHhot857//3TH/zwxWJkvngA5PknTG9oEipzRTapsSXvbi54EAnXneG7Q6wy4KYWodMUh85d72i4URCmXHEXpkgg44UghwdUE9k3GssypTsGnAyg2KQnRDDEnq2nLfwU4hUBpppEYf8Sf6P9Fj4ToqcrpGU13oOVZHazMnjc2Obq6wF49OoIb/LLUiWN9H/4e2HZO9urUvbZB/0W3J7JpYKDWx0Sqgwws9cpGBO5JNKfwu23Pu/yKvlD/2t/XqLjVpEkg9it07Oa38/IOwglHUJnwRpBCiOX4fPWVbekEU9hb4k+eClk4ifzIfQ/bulkNEYFTTw3PZjvwDhLjLk2f1glpqs92BMBQvtF8fWg5oAKOfBSw4EPXJvH6leNaiYGoQ5pPQYOpoumgn6G1yBLILSj7NWPfS2CoaKeXedn7SypjyqsK7+pKn+uHeHtYRlPGFkkm3qdBYBHK1t0tljrBtGRUJwlrBrcM4WOyC5iHkq2B9V5v4WA7lUtRKIymqeIVE+ePbTrBvw8+YZ7V33dRAh9sXO0HCo
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(14060799003)(1800799024)(376014)(35042699022)(82310400026)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	H1+GIf9FSlYIlMmT2oqqYhF4wwwTbh5Y3KJRKPuF0WEVSdZ7w/+dgYhKZgCqh1++hmZPZvSJRCJ3Vfv0JbTOeA8N2E6dplTjCOzI84anxDGryfRAUmJeznJvM/lSeGOzPpKOtptLxSgLti5URHVQgutbCRCx0m7OhRsHs/J/4+xmXaoqCamYl06esnMCWdLi8pGw6+L2a5BzuiEVtVmU6vFVWxX04yXAUFIS7/hdZORGvFTzBqRnizWqYofrJ0GyPXCP+p1YUKwGJ9G+0Ly0+GS0fe8EOhlKfTLw3+iPWMSS4s0Ox7R+m5QQcJJMWmKgrp0gstSBSxcIdOAzYg6Qxe69ljOtnDauO7ilWRpWZ0d+gNzLcUVKsa8Q3z/dCDf01vk+AzweFuor/SwfeAVpdqLnhT3Ki9gpyr+nCb+lqWYpL4qqoaLXBkH2nGXwFtdU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 13:02:46.2936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ef7cf2-6d03-4497-40f7-08df18a9cc2c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10895
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 13:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246410

T24gMTYgU2VwIDIwMjYsIGF0IDEyOjI0LCBSYXNtdXMgVmlsbGVtb2VzIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxyYXNtdXMudmlsbGVtb2VzPXByZXZhcy5ka0BsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gDQo+ICtQQUNLQUdFQ09ORklHW3lhbWxdID0gIiwtRE5PX1lNTF9T
VVBQT1JUPU9OLGxpYnlhbWzigJ0NCg0KQ2FuIHlvdSBhZGQgLUROT19ZTUxfU1VQUE9SVD1PRkYg
c28gdGhhdCB3ZSBhbHNvIGhhdmUgYW4gZXhwbGljaXQg4oCceWFtbCBpcyBvbuKAnSBzdGF0ZW1l
bnQ/DQoNClJvc3M=

