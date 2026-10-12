Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C95ACA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:24 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13139.1791811212025663397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TnGB9QYZ;
 spf=pass (domain: est.tech, ip: 52.101.66.48, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfZWCHuxo6obE83PdqlsiTnPmzuVH/fbspejD5AjFxtlrxBFf+HDWmf76MpQG/MRQdCptGvHBabE1DJi9uw149t8bmjkVdA52SLMz5Aj+9xLleZjCXpff4K8pC5yS99pd0fjwhKnV3aNIw9VBsH23UujPSvpJyWJ5W0yvaDt5AYMdfuNeafSMlpJd2R3vHM82DbZ4NMiwHjam4PRbZPPoO7R6NKnR+bFutinK9bNhgqK/5KdAMVU2lKj/i+xGIT9gaYzaGhiDp193nroFgo62jkQiViSQPXloZ/Apajwu90gwQlRHVWZMSWRqW6loVqLwCw8mK8KLpgAu1tjCNRllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5mIk6v++s2SWX9slfr/0ZyRd2ABJU7f9TGYsTi4A4M=;
 b=Pear/z4cJW5OIJqLrb9c8tJMuMYa7ZYsXEDh5wDxirBjuwNZuPt6tXVczlhkYiq8avujcPE177PExs/4B5Qaz1/029BSWP10KrMMvMixWyCC95+GELwybg8P/i1J+GxAf1rTZwggZOGBx/OXCqetPWuKPVZ7Z2gNjKAneHwQbev8X4hRtVvjdMGz9jo8qY4Muv/qcL4ZvPBX8/XURP6fotP6YTqtEfR48D9gXFoGJUYDPSEr0VRGJPDkLpKYwhsTGJYlfcFwSKivsWuuUIj60lcT8QeBYzkx1CNoxIgYXsltejAmH0qEKf/b4bh2TWf+fAdcyAKD5rhnfGQBc1lUIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5mIk6v++s2SWX9slfr/0ZyRd2ABJU7f9TGYsTi4A4M=;
 b=TnGB9QYZAtCBSSHul2d0YftdOnR4OJgntbFkjk39yv31kqtXY/KwEY30on8Ca16zxAr6IEpvx6h41REsVgukZ2Okv637oFR8ncXjV7woV5W1LvzIc95Ik+e15aSP43xqG3hjgCpr+HnC649t5ToKdvZcPlmzyGVd24KNOcEdPUWEYZ8AqXETFlgBGAMgzsXp7xSeIf7z1a7Ov5obMx0U8LO2ccqf6H2dazRU+0DixdG6wYNEdcIQjKev5JLhhnNcLpSdAnljfVrpcXLXfGn13eoIRMAJs8c43i4XxZn0i0Jry6xIcVd4Yj1XJF+xp9S1DEQIxJ9E2MLmWP3Al/exfw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:12 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:12 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/18] python3-pycparser: Upgrade 3.0 -> 3.11
Date: Mon, 12 Oct 2026 15:19:50 +0200
Message-ID: <20261012132005.23909-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0032.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 208847e1-c539-4f94-9d6b-08df28638b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|261009223027099003|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	3zpquGhAYvApxewe0EV2eQ8H1SNTHOKK177dV2WtOXRqmCOihQyATrRtp5c4h06BJPVZSpQXY0Ii3Q6xyYzapHxoulDpaX4DXbjWCWJrhSkzekiUNJ//LsLSCX1/ZeqLBwUV7Osy+9c4DbiN7ERvfozPl+ARSDKTngkFC+UXbQ0GDGRre/fppXlqzyeBDHOa53EAMsucgdgr7qhIYmY2xLzQe6cVB1BIYf8+WXVlR/mGWd7USCVAZW+Ph/5n5WidQCbXDOnAeYH0FYgO2tZmEiLIW0tR3D0QTuitEINk1FtQB60ogbOzY5PcxpaL7cI7h6y+0w2Ap/QSwTAIBR0S2Pz0U9xa+ytrWqLsNQC0MY6DAekDi9OnnV9+5fBHCPnBmnk5+TQFpHmVqtOkcGp1TI0OWuxy2h+ncRaP8NrcFjs1sKjxRYqwPNuXJ2oQPX7mIdKtSsdpW0IGsbwCQAi3tKizvfC+UF2AiCUnlSgX/hvVPWuWmZBuO+kRy+ExX5LUXqwGYIIHb3FcpPtqlIwh2NXyfBsoWDWedryo9BnJLYc2BtCwTmYt+gRvgOTxIvg5VX8JuBaRvMhUtCM4hLgnhH2aZN/faIgKiCKrDYevFwlgzcImj64AjCfX1hA45w87WsBDqFpVvW00N6vQQciMYV4MEptLWb2Fzwt8KcgSMxA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(261009223027099003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HaDwrRHiJyT3S2xkt2jgDOf7bLIqxLkPuj2UqTZCFEiCkYtqyPPvkknaUDA0?=
 =?us-ascii?Q?cA6En3SIP2djrXOLBFEujavKSyfJuDsthp8kV2EBjpl4rgKj+eOScfyoHnrP?=
 =?us-ascii?Q?dHVJSU+OVipLWxFAsSmd5JA1V0TB5fRNpXrOZ0F02rZlvfcZBEWj1BdJb+BY?=
 =?us-ascii?Q?7SMKCQMcE2p9y10gZn0QtUqlcvhKJV0D/tH4KSeq+B5unszMFjlUkopkUc7B?=
 =?us-ascii?Q?xNJ0P6yBQpVymgk3DKodn3v3yoGuZr9UzZZosgAs5+UTrQSDaWLnkkImV5rj?=
 =?us-ascii?Q?mw8bJeswOkyCVaiOZaeM8KtWg6GZzI/tNOFiP093ox1t70ov7alCqAnbEb7Q?=
 =?us-ascii?Q?kclEL5d9Hj1Fx4O+C0zeXkWXv2V5FOqzHxn2bLTEdTTrDw5PGJ/VZ7OooSQi?=
 =?us-ascii?Q?kjN41g34nfV9aNSQ/UW+ndBrQRQFpGUP78oqpErtsvfQ4tWqsB1ltLl5Gf+g?=
 =?us-ascii?Q?vhGbR9LDZnsYvBgxwiq0q6G2bai00N+GOQjzC8cDihlaRq9iU1Mc0r3r53YP?=
 =?us-ascii?Q?tum2ABUEitFwSItVDtm8bNXs51GxspP04yHhiVkMkbT/Ytx77AUEBtRXwxVG?=
 =?us-ascii?Q?/D+sAG2gVaLeW75kQpjjQFe0OjAi0HCMfjVcmLZ5BgzOQoGsq6vmnYiferP4?=
 =?us-ascii?Q?AUT0C8pbC2xp+dLMpsmR6P3RLFk7ux2QyldrJ5GqIgQ5+84TnCziGeQwUG4V?=
 =?us-ascii?Q?9/AkT+TVzEhY2Uqv1Mjx5pxkpD5wmtEcADvrwvNXYjJMUiBGbXN6yPmsMTWl?=
 =?us-ascii?Q?nd9KFYby1Z0J2/RI4eJlGmTwQ4FQ09PR1+/9Cah6u1+1voZNe6UBuv/NeM9r?=
 =?us-ascii?Q?jLr5yprBoQBjdQT8WYHtX8aP4ZUKFIUeDG3Y28cmg2v0oWPfTfSiYR2wFcjX?=
 =?us-ascii?Q?inF6x3sH2yJKVmR7InPyyVDnQ64iOwlEKJ8YsPZHrgAAzC/upU+UUtTPcteK?=
 =?us-ascii?Q?fuxsMoeUzE3aPMl74jjUzf37q1F3Ze2Cft+vWqbUbVsJu3JSwpskwHbQwWTg?=
 =?us-ascii?Q?YqYhkgSadsJE7L8lIsoVHdL3kg6do6+1rLlx8/d3esl5HCVJhE7I/d6JyU3x?=
 =?us-ascii?Q?knm9kcPDAr/S0jDCTC7A56T74W+i0DwZw48U0/ZlFLT8By4LQ99/PmM3iVme?=
 =?us-ascii?Q?N0bxvxYhXeeXue28ls/SgyiSEeP/QJkBQLgeXu4K7hnvsOOEAIT7sl1Puc8Z?=
 =?us-ascii?Q?Y63EAD69gsjn9v/S7NpF3eHPi/Wdqdyl0KXjHcNHiwnzZDf07iOfrI9BuSP3?=
 =?us-ascii?Q?H1qCZQAevYdpTYP7uTmlUcP939+57mY19P8mXI7I57LQZLl9/JWf/qzsDX3u?=
 =?us-ascii?Q?OTKsZvXG5rKah61KuLEQDJSXgvsDO2TAyWm0LzlAl0aW6DKs6stTn+JLRouH?=
 =?us-ascii?Q?yIU/guMdpkGXha9OTwG3biUig95M+69lQNemZwJ1Es1DWUmlmtD1S4PqO0FW?=
 =?us-ascii?Q?VOrKix+fCUmtZiibzxGa1a5Fbk6uABu+ntnYPUlXfvhogkhGj7NOVglC08hw?=
 =?us-ascii?Q?G2+57qTt6xhWzMvnSZA3P1MIJlILHvRPhs3BitzyYAgmrgLfm12ZEQoYADor?=
 =?us-ascii?Q?DHgx10hvsYPcT7f5GMLpDk55P0iozNmQ9fy4jOFuZpzlBMOm79GDOipLVvYr?=
 =?us-ascii?Q?ugbbZAAI/700ZM4mGq1ELTWVV9ItG6JRkV6pcHJftcb2t/JbgWihJuVydy6b?=
 =?us-ascii?Q?uDupf12Px6gt/D13wfEo2PLfav6pWMj7MnOvqJM638AlBYfB7rjCYZkRJ4kt?=
 =?us-ascii?Q?M6x2fkncSA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 208847e1-c539-4f94-9d6b-08df28638b8d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:11.9923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VEeqNUBNreL0gCweA+ty60nENe/iCfsnUfTWY+0hInav31T8EEhZNNq6l0th8O3itNYKNrJYN+bLBFCpTI4oMe2r2xbEGtG7UiyRh2u2Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247647

CompareLog: https://github.com/eliben/pycparser/compare/release_v3.00...rel=
ease_v3.11

License-Update: copyright years updated.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-pycparser_3.0.bb =3D> python3-pycparser_3.11.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycparser_3.0.bb =3D> python3=
-pycparser_3.11.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_3.0.bb b/meta/r=
ecipes-devtools/python/python3-pycparser_3.11.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-pycparser_3.0.bb
rename to meta/recipes-devtools/python/python3-pycparser_3.11.bb
index ea7b7cc14b..adeb882a3e 100644
--- a/meta/recipes-devtools/python/python3-pycparser_3.0.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.11.bb
@@ -1,9 +1,9 @@
 SUMMARY =3D "Parser of the C language, written in pure Python"
 HOMEPAGE =3D "https://github.com/eliben/pycparser"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9761c3ffee7ba99c60dca0408fd3262=
b"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc453675224ee9a35b46135214d26c05=
5"
=20
-SRC_URI[sha256sum] =3D "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a95=
04c5cdfdfc6b29"
+SRC_URI[sha256sum] =3D "d875f09c3507d00e1aba0eecc6dcadc1352f30fff09dc6bff2=
f1c2935e97c2bc"
=20
 inherit pypi python_setuptools_build_meta
=20

