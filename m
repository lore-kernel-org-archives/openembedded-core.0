Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AEBCA5FE3
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:16:16 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5975.1790925367210363324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Q11llmEK;
 spf=pass (domain: est.tech, ip: 52.101.65.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gD/Go26xa2KS7FScxGh0M0CgdMD810pn8YZeL/edYoYzx448aw1n794Lz0K9BFrDC5dYSVpU75EjZuhLKnOaXKg6zfV/wPi7dxVFFFUSeLSdJG0sTjqxg28zyNXWEsjam+/50sClXCjledFUhUguZLOZDOqob+C2c04hpCVQH6Ya/JvH+9g91VbJd0JpO58QUP0wExBeitS3eNWt8ElJoVWZ59if2nCRqkqutiRq+wMQq8taQT+peFO2HpR0tVXPespBv6ef+iWysVrupWtilGMgdklThbnQj5TmavASqml0o2/VaH3WDGjzegzY1aKhlOPN3lgRpJ4Kojtjv5VrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQKehHo88reaQ/hOV6ms7i6z9oAjb0i7MUv1qmuj7Uw=;
 b=r/IkR21p3xPYgpDPKYZo+hpj0ErOHN+sK0uWlOOtdcGnfLH1cBd7IJTMarwixKQ5xCd0luGkfXUnSb0212XW59qgKJJlhCghYyF8yeTvOwacSJaPeJO/AvswdJwaTPB5PZv2XKGrww+lTlp6GsN3EI47Zcr1QzWEiT8t8SAAwHDYwevr288Cj9GO+ElIh6fkNsiN2ILCPUw6flKagLYrK5reqgW1m6ST3+73dembjwrpkIA2PREbCavet+xc6+3duE17AQvGDIkjyTaGy2k9Ua7w72HPnJtOFUKOjPaIcsAOOJf6taYU0tyeEOzq4NIijHqh42TmRLvSARSsu4K5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQKehHo88reaQ/hOV6ms7i6z9oAjb0i7MUv1qmuj7Uw=;
 b=Q11llmEKt0aVwfq9BeGjtLA1A0OWv6CaUSepMFtdrPvpTaJokqj4ilirevAjUHsun0Jyd83QYcGsbvISrTJBwPXBz8P3V1RL3NnQoO3vfv6UAcnI2lXyr25CK3ilUUYhlNE1pEKtdu77TWDEVifzPPJvOR2yjhQyJrJDfzz4/ZVPEWgPOQ2UQUlXoBP26/v5D5jtLP7Laa3geVbiOqDOlaJ7OhSkQMfaKQQRgcdGI2hz39+tVDClIVryQDeDGHEGZDMRIs9iWJNcb32/BMSck2jc1iWgxAQWCfjBAyhv81U3vPLiLtbXNZ5raELB5orECa3rTkRpvH6/OYDbjlLXQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU7PPFF852A1B5A.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aee) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 07:16:04 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 07:16:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] shadow: upgrade 4.20.2 -> 4.20.3
Date: Fri,  2 Oct 2026 09:15:56 +0200
Message-ID: <20261002071557.74249-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
References: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU7PPFF852A1B5A:EE_
X-MS-Office365-Filtering-Correlation-Id: 779cd3d7-0ea2-44df-ce3a-08df205504f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|260925021911599003|260925021311599003|260925022911599003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	7vnOYyg1O7Q2pZvLQYC9FQHu/O/aWDrJhVYIihV/zogQKrdZ/EdllgLhqluRNhVnFoAx0M4A9Ehpz993sazF/dQMSpZjjLmzfF31nm8BjNkL5Mh/t64SaMsDfizM7u5Xdwa92T7C60D+IpYXq9UcPxWqYZCsmp+l3pTsaFh83pUQ7aiegPII3vKrQTpOQKcdUcfdZUyopSBqi1DA8nP3dfAn8mR+eILy3XFCX8Ws1tO+Tq8w0Gkal/IrZVWG8UgmqJETrIUH9P3iGHojWVixVqZR/LxV64ftcNZaJrbK0jMLDfj0UcP3SMt32M04enCci1KRQ8bxMv0c+p+Se7SFLCrIDxEaF05Up7yx+/m6n1TrJXAacWzomw9wz1B0Svi1TR2GXtKRAajbt/aD2L2zyzwFNlyg0xYEjzKrqlexzln8LNuDWERFRle28HLctE4mDVJ1gE5Jbrycrmg46fC884ZS4/sHGOY5MW5dXxKmNDBFUfGUfZNE0KfvFtIowgt0Yv+neCusKVB//2kHwQyRkmztZpfdvF5W0n1sgbdEPhOns6oIBF8E8MNepT8uX/2kDFR12A1lYab2DAP5YFyXro5u4NJ4VjBIIn//z/CwSy/3BpfWEhxjqGzz8UpXOu5jOIX5vPTsssyK/E+c6SHoBYyfPdzG4dOGPDX7PuvQaWY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sJQlw3ZvF0X3qmH/XwyF6F4I0sCIAny6idjzFWXRENwtnzgSie1h6zumzQRw?=
 =?us-ascii?Q?sDS2tqj9GJ6u0/rPzPioUz7GMKwAw3Loh/rjdckQ0MKMIFz+uXudGndbuhbp?=
 =?us-ascii?Q?zFFNf5faTTdmIHvNL9HfM/EAOtSAx9dzQidlbpoW93a1XRDZ13/+CuIKHzJD?=
 =?us-ascii?Q?iC+SRCe7NZBf5qvoAsquILhhAj4UZIUEuTnubKCoVNOkvq3gi0WFzoXOX9W4?=
 =?us-ascii?Q?HnkoCqXovBAu810ssyoxFbOYUtTdSGPZvKvrJBN5N/ysahtw2BVSW9eAgorE?=
 =?us-ascii?Q?hmCPDdWffUY3mDGdjhvptofF4dnzJi7s///ZWLdXMM3/lCpa0I4VrndNZi4i?=
 =?us-ascii?Q?ZGBzf4YZMvMe3XpA8KZIx0qJW+7qAV7RMCxvMuwm+AUYxVImknxPSB/XTGc7?=
 =?us-ascii?Q?EFrVnce0e0Lu7zuryHg5987ljf2S7/dhHps6mHZH0A9rP4g50ES5T9oppQpl?=
 =?us-ascii?Q?d3/ClskiVr0xVIcJEzDhti5KjHwUrFkVLaya+E2knO5Wju02fNPfNhiKEFu1?=
 =?us-ascii?Q?AGHGXNxo4EtSJv6ybVowrVRHbw+R3g1LAAqha57MPRyeucjUWbhAGCGu/uAy?=
 =?us-ascii?Q?7iCKP42GssBe7iPZHQZgQsTUfEPhL8dr3YOXw3r7KZyExaYk/uPOpeuDBnW1?=
 =?us-ascii?Q?sw1aRphcCPk0V715oJWlJSSOlSJAFNE3kacPVEjKYJgakEGKLRrmqi4UxA92?=
 =?us-ascii?Q?hFsnDIKpsevEiKX6nI4mavMY7vYe3cgWa7mU73svBFosn0DdZWCMgPa1jBEE?=
 =?us-ascii?Q?uVgVL7j6EfS4dejT4eM1y/bqiYReO0cXbLqT7XycXOkPmb7xqzcVqo71bKTX?=
 =?us-ascii?Q?rW2Ni8bkMId8BqboB9myI109JCQYPXls/+iIr8DQ8t1vLf/mWZddfBULddaX?=
 =?us-ascii?Q?//SuKBoF6gnltmFt4AzfnMRxAQRvrkSlbRnpfsGFxFXkcEOB9ihQYdJG0Dsu?=
 =?us-ascii?Q?lOjhVIlyEhWW7jsw8mTn1JznA6OsZhwnAaxEhzqGukUCqBvOtaG/U3iW0kta?=
 =?us-ascii?Q?uX6Rscm4eh/82Vhz+B9DonEYTJyEc68LoP9y6wzuFxoyir9CVnWVhsfSFXao?=
 =?us-ascii?Q?vY8ZBCoG3cMrX3v4HbCfd4N5iBhv4wOJjT1wlJr9ddnJ0yart6gKDWnpRt8D?=
 =?us-ascii?Q?R5aOnq9/WfIPBMBS/LXrR9j7twLAQ+9pva71MSkM9yZdPVENbUH99H4wJhaz?=
 =?us-ascii?Q?lwStNmgjRnl/5ZgkzJoPQB4Ycp2EaLBorWAnK2yy4nRJ6GLlYX/1TL4SiAfy?=
 =?us-ascii?Q?jjwz87uyYx+kSq3zBUVkJZp+ahOmUORnNbXuSs4mBQQeNUtfj3DoUp+H4FeI?=
 =?us-ascii?Q?Gr+oL+FkUGNtKMQdvN4zt1yVylaCXq50qFZmCMvfNYGnd40ANJRifA8UNAuP?=
 =?us-ascii?Q?HSlmGSJX9l+YvbDLstwCiQ3MLGY0zaOLcrfXcQFio1KD+5rKi8VRdExM7rKi?=
 =?us-ascii?Q?arjXZrSS16v10/ClTgpxrcXWXbHACqd90WgmQXEPTAR2j8bXS/qaHdA6n58C?=
 =?us-ascii?Q?lCOgcx9uBBEzKn57+5OPKCFvsMdu+99c9P7+ynxji62UzwyPkDhLUDMrWa70?=
 =?us-ascii?Q?+NQ4tX0kaqRpiN1KzBy2BvyncPDseh/NgYGH0Goa+mYPQKznBvumV1cmR5Q+?=
 =?us-ascii?Q?BNmyz/xBl6n/8k5PqJJtiVDuHvbOsSxf2EZUL40EdVLfa0Y50Rr96ouhzlYZ?=
 =?us-ascii?Q?v99fYaH3mSLAFb9Jt4To1BJGtpHEt33uSagpcUZJvTPakVsTd8CoSpZdaJdY?=
 =?us-ascii?Q?NjwsEARC0g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 779cd3d7-0ea2-44df-ce3a-08df205504f3
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:16:03.8572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0/aqJpqDQton93xPtEx+vrMx5e75JdhqPoNFBz1Oh9iu4hicP8ZRHg2FFzNCBqJRS0FutaAS4zQGSKrF1UzeFZLDRx2dThbTDZqv4nc2Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFF852A1B5A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247071

ChangeLog:
https://github.com/shadow-maint/shadow/releases/tag/4.20.3

Compare log: https://github.com/shadow-maint/shadow/compare/4.20.2...4.20.3

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-extended/shadow/files/notallylog.patch             | 2 +-
 .../shadow/{shadow_4.20.2.bb =3D> shadow_4.20.3.bb}               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.20.2.bb =3D> shadow_4.20.3.b=
b} (98%)

diff --git a/meta/recipes-extended/shadow/files/notallylog.patch b/meta/rec=
ipes-extended/shadow/files/notallylog.patch
index 6d6957bbf83..b3b30026ce2 100644
--- a/meta/recipes-extended/shadow/files/notallylog.patch
+++ b/meta/recipes-extended/shadow/files/notallylog.patch
@@ -1,4 +1,4 @@
-From 20dc49519cc177d4c829f4dd5cc277ada24376d7 Mon Sep 17 00:00:00 2001
+From a7d45933186754a1190509b46c51c56d48089004 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 21 Apr 2026 11:30:52 +0100
 Subject: [PATCH] shadow: Disable tallylog execution
diff --git a/meta/recipes-extended/shadow/shadow_4.20.2.bb b/meta/recipes-e=
xtended/shadow/shadow_4.20.3.bb
similarity index 98%
rename from meta/recipes-extended/shadow/shadow_4.20.2.bb
rename to meta/recipes-extended/shadow/shadow_4.20.3.bb
index cf7d253a7f1..f11ae61a85e 100644
--- a/meta/recipes-extended/shadow/shadow_4.20.2.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.3.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-target =3D " \
 SRC_URI:append:class-native =3D " \
            file://notallylog.patch \
            "
-SRC_URI[sha256sum] =3D "e5016b40541ee6fa02ea3d409547cef6e7eea9b31f0e3482e4=
874f87c1d0c7c5"
+SRC_URI[sha256sum] =3D "39006c9daf9228ddda9156605201fc9f59c43f9fdecc83c78b=
be0e72d9ffd58c"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
=20
 # Additional Policy files for PAM

