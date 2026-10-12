Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A757CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:13 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13139.1791811212025663397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=kySRol6s;
 spf=pass (domain: est.tech, ip: 52.101.66.48, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKnFZf69aQ7U5M+FOFyipexDUPJm7Ad4GMTg4roTj2fmELlcFGN/2ZAxunMj+r4Vbuu1Np0LP3YKm2DomvvDja5D1sIEMX0LnO0L/5kw+pbgRb5jnEZCgQ5JLghvzVur46XW85FTLoXpZmNWJbzSDBBffUjRoWm3hBQEjhO4Pehe+gH9C9t0kiBEqcrbkIMtYKq14jQ+cZ/N29yGFujzw49eqRGjUx0dAvPo4GS0n24uXKZPmk8+P4kTCSze6j8L4P9IsjTa7xKdNJ+rukfBcgxGrTMCjWz0NoLVV4OkkqUbsvxpGDPfHSS2VWAHN783oTFlZ62RvPepZEBQbYrS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c1lioqtUNaTSMebJ9aeLn9XvX3Q7VuovYbB3CxXRZM=;
 b=gL3ppeD5XNiB7uTX+PztqNZlQ6kNDn5ZXSYKAKyAz4cWp8/fXgiLNvXSwNnj0ELjfkKCZRBQ1KkqW4F0b8LQbo1zqb6TRAxEjw3iB8T6xKk6qggoN7kYmV+7IgbsJhTPw8svON/oOmwnoz4zITSBoU/M3c+F+D9h6p/nCEpZKK1xdUoZNXhZC6FG+eQ64thltBfO94YD06sRQH5ajYKpBHahOcgNx1tw2+kcX7BSS086iLEod7QkOCyWMfdw5GCCcn3ZZB98cmzabMrqEfv8rlEAZNd2vwz+B+N4M7S0Fzs73sbBG4+bzdVY492wZ5yNnjwNFjMh7P0p9ZekpDbfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c1lioqtUNaTSMebJ9aeLn9XvX3Q7VuovYbB3CxXRZM=;
 b=kySRol6s52mhxxirzzxGR4rFOc5eRRutNb+8iFhi2TI6fT/7PZLZbjYR5blYc8s9f5y1uiqQCcUuDdboBmSxV4X60SCXtkakczV9hhCXlLaNAwyd/VYdFUrfiekw5zfFCMbZVgiWg6RZrECNybkolZKfbrcyntTQ3gsYZ0W4C7R2NzAOCf8ZvAw5FDTlXW42OKnis6gJMMx0eVAvF9R+/OZtXEr3TILegGEtuaKrEWsDPKbqt1uzGN8HXZ9s17Bi6PrJ2kPpjgnkHp5IL+QAKb+XF5bwEWw+lsJOisc5oKhKans4QLfWgnOu13IP1WTtsn+Z40RBW+0bccO+T6cf3w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:08 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:08 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/18] pkgconf: upgrade 3.0.7 -> 3.0.8
Date: Mon, 12 Oct 2026 15:19:48 +0200
Message-ID: <20261012132005.23909-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::34) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7f81e4-96fc-498e-a486-08df2863898f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|3023799007|261009223027099003|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	BWwc2irrFw0UQReHNOio/Z98JP7VSuwBfcd9mIRnY4R17dT9+H8kzux9ng7UZuJara5HrsJVvMFaehC8OwtUcs1BudMUlBX2mIvJA2WtC3y/Rk9y0rI2LBqtxnV8bLTNzbjDEp8QpZNq5REu+kB7FrSULEKAM6K7iKmoIBgn72ln3KRqwV8IcwRn4oxSkA+3MayzcBE0YIe5q/O33Lqr13hKsqkkb/3e7LlrIfk3Alm3Lq4bo1eEXPIVSIx40dHt4Wpz6wXXDL5j4+jLYtKp2TuzW8glxIF0m9lS++QXGT42yF3BqUATC96n31A2gBWtriE2cGarLL7CrWCnXO0uRI7RvJfiyhRaJUAjjtjDCp9BvNBJ6GPsbhNlwr+UjzufLnlp+Nji58LkuxF3MV9q39h51ex9oQOy9g8Akq6b3I0JG/RFaa7ih8h7lAZPTq3VzTCuHPIU7s2fkzNL9mLbLBQ3+xOKPVLKfQOXtApmCvjPLUvFDDgjwJnYZaItvXYhgfYgvZnEWwegMSXWXRv6r4BXIWq523yur5IvXKXTznsr588x2UYN+4rxaAKLNd9x5bdgtfjoiuIjbE6DmThvKOi4Ltzukj6NpbUkxavt+JcocLU+CEb33DmfdBJBiiZmrD3p3BKn2w1o3UYgoj4CnXJPxdpJJCj66e86XtqVFG8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(3023799007)(261009223027099003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DY9yPQulMmT9oztldkGHQocwrLNtenan/j1nQ4CiYYnhXXlPWARtq8GE/LEc?=
 =?us-ascii?Q?Nfl0OCBIUUt/qWI/pSolKNeH++lKsQvIg+Pn51t1OGTttAROkC0BziB4HyWa?=
 =?us-ascii?Q?VZGRuxD+2Ym5CL4c6DdPW1HNX3x52pFp3erZrJu+CihD1SKGNy3ULfvI97md?=
 =?us-ascii?Q?X6+x5qJFijoakICd0dakVCDdY/bjcT9L+d/LX/IhDrEVb1yqm8xEwLFLdqKJ?=
 =?us-ascii?Q?6AxGOugIDAxiswfa0wkgZ0EcaQ1a4DRA4+pQryjjCiQ7QUXaK5BBG9p1N02/?=
 =?us-ascii?Q?BJ2JZHGgsXgn+hzSnxXEdVjuzGC07Dm9Yoknt5B/VkyJibp4R4mMiO5PfwTc?=
 =?us-ascii?Q?SaQnkU3lOelupEuqUZ5MfwI6i5phKuDW/7ZGQOi5qBoHPBaVWeTEAhEwldkP?=
 =?us-ascii?Q?am8gRGECvXBRI2b7WVg5yLm0aCPJbVSVPHWnxL6qEFD0baG0Voz0mBKG21fT?=
 =?us-ascii?Q?tVFBsr2gFl6J3nXwt/zoctt/iMIqshzeXecD03anZ5utwre1rCjvLWxt+89r?=
 =?us-ascii?Q?ChVYq651vQRuS8EObHfyIdC4d/CfjAPYlkbTOlYS/LDZPHk0rLpAZaXgz0H2?=
 =?us-ascii?Q?MrC5acoXQWWa5JJDA4AuaQNCJLMclLCNPro24CuU7vhI8mqHNYpAJqkDTtvA?=
 =?us-ascii?Q?JiRmR6Ihz0P7SPKfXWRDUHebc46B74yZ9re8z+0gW+xYyUtPKuq19XwVJiV0?=
 =?us-ascii?Q?itFb6SDxkpQQoEjjzxb+i94MWOzhwVUVfghBYuba710OX7wtpduuK5pQ9pAV?=
 =?us-ascii?Q?8ydO7k2hpKEzr3KmROnR8oP++PhH/l4Bk/LWZvJxr5LQuv5j/yYO0PEoiSFt?=
 =?us-ascii?Q?scYt8q/GN/xZ0q1QQ/sTm1+gtGMmUsnT24KxuOpRpzvEwAtr1GmclZ1slo9c?=
 =?us-ascii?Q?W64niVPxm3iMOKviAeveKolqMRFCXG3WBoC9QB6PiHw8G3Z+jRmrCzQ3fTZb?=
 =?us-ascii?Q?+K3E+yQcVM4oV31enhBMXzuq6goIRll5Y6ndhsrrm4n7qjwRWA+Aak+OB55q?=
 =?us-ascii?Q?Z5pQnsj5/Z3B84uIQY1hnGfo35+Yz3fFODQBIDjYVCAIKzCSJSARWe3s/2xd?=
 =?us-ascii?Q?BAlrmf6Rf9eTJKyv1KnMnRBEQTCN9fAigsmI/xBPgJEf4CuUYXa34fV2uhf+?=
 =?us-ascii?Q?Os8ArjWXNjjRE1sgcWC5keEzmDQCLuuodpDKaihh+CA8UXcL385pswHlp2hr?=
 =?us-ascii?Q?p98SUHxe/37MpBsloSIkTgHKesmAY2GD51wIDMUyYMJy1YfMjWYLQyIDslYU?=
 =?us-ascii?Q?AHRj2LtZGjSlt9pXXx8HzDbNo58JtU3HSIp6WmlulCouXRaEYTljmkvK0yst?=
 =?us-ascii?Q?sO/NdcwByzU0ZNUWGKRplI6kGSFL+4MDE4QAXHWdJ1ebEvAuvCZRmce4Phuy?=
 =?us-ascii?Q?5p1t9XcfPT5dLZAabUtUqphIvc2/uJcfupSCMpWcnGlrZGWeCwy/Sleathuz?=
 =?us-ascii?Q?tE2RGV6ea2KsbMe9sQtbne7kmiL7b0Tg82c4IcWt/ZyCkcwqVhBO2IwfrOSk?=
 =?us-ascii?Q?xcvCDAcKHWRW15QZQ9WVZ0dFpSVgndIQIo6EnzPgr/FTZ3iejFc070okaZXI?=
 =?us-ascii?Q?8mFVQVZPibFPiNv/bdx0hyr20JdyIoDvvJ1TDqSQSY8YG3aFJ9NXztl1RpNk?=
 =?us-ascii?Q?eNBqgvGeChC3AjbHd0rgtdIR+kpQrXZHBUUQ7/FgrxcUEdoUrOS/RYTyG9mu?=
 =?us-ascii?Q?Q7GrI9n1i4k1WmYx+ZjUZEhYfqqCpNz/XhAMmH9WAGpOZXaBQIuk8JR9SGzU?=
 =?us-ascii?Q?uRJ9QUyGew=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7f81e4-96fc-498e-a486-08df2863898f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:08.6200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwupBTs9LPjxRQalreMtUe2TvnFAV5s3c/rkr4d6VbbB4uChX7GzmmShhj7w0/3Kqlo0ERJcr6ElNc2vJMcH39Vc4U523gu5qygO5LtIXLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247645

Changes from 3.0.7 to 3.0.8: [1]
----------------------------
* Correctness and portability fixes:
  - spdxtool now percent-encodes problematic ASCII characters in generated
    SPDX URLs and URNs.  Patch by Tuukka Pasanen, sponsored by The FreeBSD
    Foundation.
  - The built-in pc_path, pc_system_libdirs and pc_system_includedirs varia=
bles
    now use the platform path separator, fixing their output for multiple p=
aths
    on Windows.  Patch by Christoph Reiter.

* Documentation and build fixes:
  - Correct the pkgconf(1) description of --variable to document that it pr=
ints
    values for every module specified on the command line.  Patch by Christ=
oph
    Reiter.
  - Update the bug-report URL embedded by Meson builds to point to the pkgc=
onf
    issue tracker on GitHub.

[1] https://github.com/pkgconf/pkgconf/blob/pkgconf-3.0.8/NEWS

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../pkgconf/{pkgconf_3.0.7.bb =3D> pkgconf_3.0.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.7.bb =3D> pkgconf_3.0.8.=
bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb b/meta/recipes-=
devtools/pkgconf/pkgconf_3.0.8.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
index 4579476ae4..cd55484c30 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] =3D "c926ff491cbd9a331a589160811bd97ab1749b4d5198a51933=
8f2cdfabe6940a"
+SRC_URI[sha256sum] =3D "943f0bc88bcaeceb630b00262e2a8ad5ea4fac3fba72a4267d=
8b9ec6b35d1194"
 UPSTREAM_CHECK_REGEX =3D "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
=20
 inherit autotools pkgconfig

