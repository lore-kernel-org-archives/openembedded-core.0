Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61420C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 08:50:10 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34821.1789635005384430420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 01:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hPAYNgOd;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hPAYNgOd;
 spf=pass (domain: arm.com, ip: 52.101.65.2, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Kq0mqZU26ErmEuL1L4uMWXPyYJ7j2jc4D3cbgvxYBLe/FE0LZY3XHAUU+QGKHx1ISaFAk1SeDP/2v4DMoWOnir5F2/P3iwuSabBBtLAiMle21yDk/mvdsJpAoF6KYgG2/W8BeLt28SyhLlP2qLvilBkjtHDcMJw8XewGNuPiGND981YH1PsXxcA71Kj3UebzHIgNMV2nVUzSFC5rTi0+GE2TXdNrLlUjWgWDz4Csicfi2n3Ors4V8GKSzgwXMhxJOMmQzUi9FL6+dh6c6dLo4xxyv1nR4BaEfAhDRlG0M5W7PfBN8BNNjlXpnKSBs2Icv52QLm2Lr+YEk0wRVGR0+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zM+oEztCkn+BbtUTQhYGaSnEMBvbwb+Vj3pXmuUsx4s=;
 b=ACaUOHgsXQQ5QFykEnW/nr/XDQ4bHs4khPWYRcbLSPtotqrgPAo4c5mwBLlm9b/Rs0+n/Egh1WfbVw82D6p0LDheAmQhnTMHc4KpLk43jiNj214K2QhRbmWUwi9FE31AGjDos7DMi8Djz2Mw0uvgO0mUuyjhv9G9ivo9JH1fdnyDTiQ8EEaF/z3O88NJ/5CuMHk7hOs6NFZExAf1GV2ka+/HVsrK47qyUAGMrkMki3peMlcJiAMPJBRJhNMDCg/3mETdlQtCh1u+/ItudtoJwdzDG3AgV2dopXuNB7i3wObQqREW9WlLBB96H1ZP9jzulnbe/4mxL89ByNOT3rZIaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zM+oEztCkn+BbtUTQhYGaSnEMBvbwb+Vj3pXmuUsx4s=;
 b=hPAYNgOdCcAVkTCXoU6+ticNFajmlpSILybVzRIE8ilUuJr8oIA1dTNtWyHDUb2R6v7FJtUuFlmMCFuc8nGcm/cPwVenqneSc4EH26kHzzLufZclRVL0CGcJCM9kjyMIwQUFrYTtpPAn219Ik0XnKoAhbQU/9BNPiuKhR2mUbMw=
Received: from PA7P264CA0043.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:34b::17)
 by PAWPR08MB9638.eurprd08.prod.outlook.com (2603:10a6:102:2e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Thu, 17 Sep
 2026 08:50:00 +0000
Received: from MI3PEPF00008489.eurprd02.prod.outlook.com
 (2603:10a6:102:34b:cafe::d) by PA7P264CA0043.outlook.office365.com
 (2603:10a6:102:34b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 08:50:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008489.mail.protection.outlook.com (10.167.240.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 17 Sep 2026 08:49:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfCKe+tIIXnteLCpIJArTUOauEGKNzEWWyMjv1r3yOghLNB61XpmpNDlgTAN7z/3uR9BucC2NgU4rqDi2xOKbZ1TmnYLbxJQbbcbZdkX+4wGnK7E8FbiAirz6QoD7iGhbQmvOiRsUOmKGyMln3fKNvr6WXEQ4Zw5sotywvEVCV2oyp9LOxeWTKyqXXFeN7UUv+rSfhtBpXCUOoXE1jahhLBS1PZpQczwNrl/oD7P5Poqpq2fj4RGnyszWUF/kxLDP52hloWBHsYEd9vMRVXQ1xJsQvphVkifg27ab6rTwpT6457jPf5BMidKbynftZpTXIF/MMXCtlBrRN8tkdJARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zM+oEztCkn+BbtUTQhYGaSnEMBvbwb+Vj3pXmuUsx4s=;
 b=lf/GgUAChoIcqonQ4KiEb+JUI5pak5f6DdqTUfKZT0EsweMcEhVEu5ZA17GYL/HswJtafqqVwbr+qaLR5M2cVbVqDfKMB3MnKVndVxuP0Zh0XZixoowoMIHzI2cniaTveZzXxIL2wQAQuHeCulV87xQWIHYIrf9pHr/WuNYeiTHvVV0w3PSQIGQtT2GtD7nPfkaszoG1sMSLl2T7NDnLdhl5B4xokPrA15awDi7Qw8AAoBHUTk76Wa+LPoPiVi8DszYvK1WFSUIMIjiAaUpfHXpR2Sd9i9mDR/tHYNR9UuYg9HukBnTbkMT98OlY1SjEhyKy2LOkfTLTG+rMEJCfEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zM+oEztCkn+BbtUTQhYGaSnEMBvbwb+Vj3pXmuUsx4s=;
 b=hPAYNgOdCcAVkTCXoU6+ticNFajmlpSILybVzRIE8ilUuJr8oIA1dTNtWyHDUb2R6v7FJtUuFlmMCFuc8nGcm/cPwVenqneSc4EH26kHzzLufZclRVL0CGcJCM9kjyMIwQUFrYTtpPAn219Ik0XnKoAhbQU/9BNPiuKhR2mUbMw=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAXPR08MB6463.eurprd08.prod.outlook.com (2603:10a6:102:157::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Thu, 17 Sep
 2026 08:49:27 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.004; Thu, 17 Sep 2026
 08:49:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] seatd: add PACKAGECONFIG for the man-pages
Thread-Topic: [OE-core] [PATCH 1/3] seatd: add PACKAGECONFIG for the man-pages
Thread-Index: AQHdRfTbXHQ1wMl7YEuOU9No252nRbbSTbqAgAApMwA=
Date: Thu, 17 Sep 2026 08:49:26 +0000
Message-ID: <8D8E3674-E56A-4C0F-B247-7254309BADD6@arm.com>
References: <20260916160246.276107-1-ross.burton@arm.com>
 <626e0f4314d6573170afb8adc9d0271f4b2b88aa.camel@linuxfoundation.org>
In-Reply-To: 
 <626e0f4314d6573170afb8adc9d0271f4b2b88aa.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAXPR08MB6463:EE_|MI3PEPF00008489:EE_|PAWPR08MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7da9c7-0c7e-4e2d-8222-08df1498a816
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 JmeJpN22yFHoCYZWrWFHLnZM5nhIUbeI/yBN3SH2/crLRnVkjTHkqglJdApPpqyyuYN/dmgyDU1T7haI81DcC1YyCqNhqFUfQUnfsf3Cy9KCSDn/YgNFwOAvRUyCygJCMTc+cYSKo8tZKhk2aeRJI9Amf+zEmVnaJQweYD5fwiLpWxNKHyHp3WhG5T0yGC8UjX6+etWS5kNj9FJ0XQl71rkYemhgRMIUUqHo2rgtG5XoJtCnhbQRal4niiUF+wFvRx9LGdN59Z8PSkrSbau8op1q2o67He/ImG6AFaP7mkcf1bH692q/fQdA6wvzynSBDEJNuYtSkp7ZsZcbPqVU9swH2/SDGDr7LUzoMG0gxFBXFHOmDh3FOvPJHKekIXQ/3QGOIGRJGA75IuyBDefMDbwfkqAFT6XRcZIQN29IuSKooUmBqmAIhASCu4JYAry85hFUn9uTnN819XC5oqhrWGfJlNwcYKEoS9irOzJwSZsg75q+uquZDyr3eEM0MfZ05x3aZH8VyopeLneDDukQTJYAdJNlmIkK3lNF70Ug4BiPNymdYWaQdnwioTcmBJoZbeO7P5WKr/Z/oHBY9ufldWRN3/n1LRiYIuy7EVhxcFH/w4hKLHI7TO43RyqXtb6V90Kd1YGaZ8TdTF8dwPjcw+lF4Kk/WAoUSGYS/FwE5mRBKz30+1JJxp0e3ei8MOXqehXZMwL83ouOmB0KLOycolMh4kIWAALyEU0Fbi1/Gro=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA9E71D069751A41B3C1E58B3B77773D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 gEH9AnKDZYq4aMrULp6lu1GHZzb11Hlcx8XMKGsIkPC0743+KqLGBzJZ+LoyPoem1bPlDa9EMPmH7u3hMJlLqSLgYsyq37fFRo0S5aw6PUm5qbGGyPcReZXk5zO+YKb4jbr3Oo/VoWe6/3R6ktyZ08Ux57xpBSWVeKlyOdo7HeI0AtlTlwltHr60T0V6of0MC2ozx4Z45lyCWkKEJKeiVYeFr2GHig0N93qmyaXaie3i2I9EbyVK5s0KQ61P48CuRitea9E5OSZuLFntTYw7s0oH8RtoyePnLPqaskNZFA4aPOBbjT9sKzhMqlb8qfe5ygujxMWIlJj5zn9x+/W4ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6463
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MI3PEPF00008489.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cb188c86-eaf2-4bed-2c48-08df14989480
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|1800799024|14060799003|82310400026|23010399003|36860700016|56012099006|4143699003|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	WakzvBsqUHb2UkN/l6OfJ1Dp8iPd52WLLoqwAWZRkRD1SlkdqiMctLSjtptTbKB4NEsS6J8WDPuhAXEQfRR8Akd1PD7kyb1CvUQMnS/yGcfXcfhuq43o6wOJxMaXwCcQQcYqph/sesbMEqa9sWCSqIwEUoXweO+Z3KKq68F/fCe69yzDlsmwqzXSeOZAQWfPcqdweGWYXJgBevKLFw26L3JEX0x2HVbqYm5yxQDqvsWFgPv7+q4OI3NkOYerGu2HKVBx4cGOCupssQ7O/HFodWDInsRYXMcCkdqfw0ldd2iXZl+SCQUqndEyplJtsyvNcUVlTJGuwzEdwspx0qcJABNH/EmqxlvVWs0/TlOtv+Cb8s3zQXwfDV1KmkjCYbQdAVlj/627sOm7jlPvPsnCnrfFlXw5q9xrtrpHFVJSllMUQtHA2v3nJs55CCWZkN5EnDvoOZ5j8KwgWxZpBsoIHwA60CIS7p2qvztd8OuAO+hMdAft7c+F8gpKP7LcHNzQPrW168HlHojvnHhaQCEvOynEz+cWUcajl9S/ed30V/H42+DOB+xfOY2I7ebF9OIWht3x80xRZ5RoIbK/XbKs7q5rp4jLWvVW+qghUGWmdbFlIFBOE7eA5qvOTCQhqXcB52jJ8gNcInfqewtL8dqlkeAJv22EENn3fh2m9iCWd8p/2+P3fSxgsttA4cOjWNDyVKjau+HVxa3qhvDuqoTCmg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(14060799003)(82310400026)(23010399003)(36860700016)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9najBAos8v+cCDU8uQ7H7xGhbnno6dC90HMAaOFTwcRVIk/ipSURLoDilK43lMi/Sg0LO8BZApRk8+cB/xRiCCsLd3Xqcelr44zh9hKDYBmVm2ulrhf+9I4iVGIYyQkmDTn1ITs4vLttuSW/8Wm5Fr4/ZDvXNXDn+jOT5cWTYi5Yv8/JMi9rZmZx4A+BGM/u8H3i+3NvD47HfpZgHgdA51Q4p2jy5GQnYjpO/0+6GNY9Xt7tuA3EfLVFi+Bh2++hOtSwGz87y80lNS6UZrl4soUGGRvCp+dzceM+hWLJVQZOD1FL28JZqF52kg9NbfWNxsoG23h2uWRPVGFq4hz/wBkO8OlTCzu6fdGQ2Qvehbh9gAjuOLhOCCYa3XfaCWI9hnojp3q4dPL4QX7iww+i4hkd8FqvvY2Zz61uxIkkYb4u0foyy/k86lhvgacnAA52
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 08:49:59.6491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7da9c7-0c7e-4e2d-8222-08df1498a816
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008489.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9638
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 08:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246048

On 17 Sep 2026, at 07:21, Richard Purdie <richard.purdie@linuxfoundation.or=
g> wrote:
>=20
> You mean -Dman-pages=3Ddisabled

Sigh, sorry about that.  Can you tell I have api-docs enabled?

Ross=

