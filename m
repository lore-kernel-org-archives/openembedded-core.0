Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9219EC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 13:33:55 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8041.1790256832300428457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 06:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wPyYFKvi;
 spf=pass (domain: est.tech, ip: 52.101.72.64, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfAYhp3x9QaUC4yptLHnR8os5qJLt/G9V65rqe+5VaxM6fz1wZ0NgTIzgJDekLmxgd7jTRd4yb+MoIynaUY8CgHPQeua9Vdw3cAefnOtAv88sy4X12H6KROM+yVc8H3C63ZU7hSqUs4hbi9W3y5lN3rdl7D+O0HmnQXYDIYmHQ0HbdHe8b2yVVj5iDViVUhBCe8SDbpj++PGAiiaYecMKCJdEx26dPuKAL9psh8EuQtfc2S2oFaoUxftkhfcuWtzXCsPUsv1MWUICWfGdu+Ydrs5+GQVKVG0IPUDzkgM9eAyVvmYnazGsqrbQ9g6v0chria0YJ6rJ1Qgjl12DggfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5WKLurk3u01RJ7nHNwhkICqjCo5acUUs/Zd7zaqsmE=;
 b=OZlMzgFV++AsEhBbGxvYwEFfS457ljvN6EwCf+WOjFfGT5fnn6iTBbc8jtUhcXdCgxRqCz1qY4delNc0A0Yiy1Ok68R8sjdBnJGTHfVRY8c+qr9kU7xgDYBIjEP2bSLSDyO/fsj6KVv63JKQ+jwARDJXoKR/xwsF0B5wvilrgKWGJ56QglnTnh6nydjnA305PMOX1jmDmzhx5Ri5+v1/EU6wLUIgpHdQwdHfTjnQNNVXvMsGVebxXpnSdn9JfAIbAS1ybFXYr0l5lAaJR9i30Hr8Cqnmof/dORmvNonTCmWP/BMu1sfvaMCU5rSSx9Mj4C5o1Rn0+GjkaMHJ1QKTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5WKLurk3u01RJ7nHNwhkICqjCo5acUUs/Zd7zaqsmE=;
 b=wPyYFKviutShmyqKLYSlKrgStGY3qz0jTzYXSJNItSiuKcpLoit+iwjPD9X/3XsK/UdUNKiqL+iUxewfbnhCX195HwQ4muvfJIhd9PZmMueKQH9nZ+tk5P4uLlj/9MzoNqd8xEDCailVtPN8NOw1OfAQopOUq97sq+RXLFvZMUroCsO4GV/VbBWGtDtA3bOHJDL1CbFRosi72H2qb0THeJT929bkyz2+MmsMK2rfKgJgAjxOvY0hPH+dlv6m/1fqxDhjl5oFgl7vIk31YdcX/C/Bx9BPoSpcRIhJwWcZ4a7gArZyi/posA9hBbUnA6Phzz1Y0d2MxCkczIoc6WFUjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3296.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 13:33:47 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 13:33:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4] systemd: backport fix for limits.h override
Date: Thu, 24 Sep 2026 15:33:45 +0200
Message-ID: <20260924133345.29097-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3296:EE_
X-MS-Office365-Filtering-Correlation-Id: 934306ac-84f8-457f-5086-08df1a407649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|10067099003|18002099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	NwsMXzWWQFU/PY1M4X7IjwdXzQPFXPkJMTnZCX/QMQBP+AHQwTCoIHRWtfSOjcZUVjF3PUr/jHy5PxMyzk5o6kumJcMMVEWEgXWDiVzvJvER7Tva/ki2zr04Nz3nqZ8C6dAm0cHBs+DGURi4bhciNPD70AeAIV9vvIfJu5Qpet5UuGIrAtdG8d8GxcgTBHmoxZMqolj2jCE21sUJ4uFphLI7MzmI9gdY/UqctAtrBKy6AOwusTblu2x/FxfWNJ6FPFxMtff/moxzGqYLKczxCHOdSY4ew+gIzj80yxjXbVdj70UetM8qdaZl+OgS2WJswPJn5fmyb5L7/FhYduO5ReYE/gGsyyTzy0aybwyv4f1rjZU2C10MhfOvN0Cj3KBgKxsNy/hi0rXlN3/nt6jxLnuSn6Qf/X9Omeqq47bg8/d3bheDwoqGASt3vzeSDVglg2+e88nVICXtca744eAtHiWSgeAZpsnO1WZrECjEa/0HNLyacM6gJ31tcAprB4PX9w24upii94L2wTcdkQ7fdk+H0VgyYGtcZzCF8MI90GHq8InF4pXxKdkOrD0BTDnxM3Y6FMASGJxg7klHGSYWAUoxeJotpnwTLvc0P97585kn8GOxoHomaOAZHfv1vp8MyguOGAef+Rc8wZGTiYEccEgZIxsvvLlR3x870kIWACs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v1TJ6l/qJ2ZjvDPn41US1BJU2CXVwu3lwNTaslz/GbaZEk6Gx00p9hi6Xpn9?=
 =?us-ascii?Q?F6BqxEvhc6nFTTbs/PYakTozwLl6XSxVLorgM3Y02+/PZL3L7iS0A9/28b2+?=
 =?us-ascii?Q?tAvEwaK8JqR8XngviB9v1b43XpSTYO3bb4FT86IUbvjDwei0Hw9MP2lXC+/H?=
 =?us-ascii?Q?VggmkqoVD07MUMzC8iNaRSaytRRCQIwWHIEcw2tiArJox7fO8Zgo748hUqUb?=
 =?us-ascii?Q?y9LBQETAqiQGZ8v3P8n252nFW3U1N9V6DIl6w4lLiGP03RqgL+93YLyyx9+8?=
 =?us-ascii?Q?WEv/A3F2MnvBPcDbPBxITYOccOxK5zmgATsV4n1XvPEc6t406grcu3E46in/?=
 =?us-ascii?Q?cANQ5TYcfm6gXd/JQiMSweAdobXJPy7y0t+UXYmN+F2UG5kL3bc/+BCc+Za/?=
 =?us-ascii?Q?TeuHp9ls42aRqQR4zsGFJ4kwPJYxo1NTryqJLG/znKPee3bxPDA/FliFRqtO?=
 =?us-ascii?Q?flf6jkBCcl/z/5lwRWf0ZMm/EucOvOZecNXcRgh1cUqJx6d7QRJD8jcfOFAf?=
 =?us-ascii?Q?DtpNe+/Lt3WzIsU47qw9vh6GgLQ91kiWrRjVzWc6B4nVh1WWxAfdwo4sC8+g?=
 =?us-ascii?Q?B+oHGdXBD608sOUI9qinQteNAUsoPjqWTIBLH4MGFrK0cWeJw92XkhYOAnKO?=
 =?us-ascii?Q?gylKRzX2GS2clvjXWJEcVcfaQ07HXI2Ht/JN3/l/TzhspNaucRV078tqkxpF?=
 =?us-ascii?Q?9gyBWZzzCpwgrYI3OzXMmAlvb54iwywI2VT/ZGezMQgAV7szECw3am/SKnbY?=
 =?us-ascii?Q?KPahaAZdEZmQ+14vmuH+AHEhdcm+d59iRXmmfFNol42XrOf1Qt6H9eHO1spu?=
 =?us-ascii?Q?5qgDoEnNYiGhesWD4ktE9u7rZ+NwNUMV7Nof8XClfSuQxqbEsxMWrptLwTTJ?=
 =?us-ascii?Q?oQysDoPSiL4qlyb9LAIKDZHikhCP5GuMO4Pf5WHWrKthgHATcdDYKH5nkYnt?=
 =?us-ascii?Q?UUpczLXh2Blz28DTBCpKtk6qIa2m/tHG4J67fusg1UR4+qzBOX/7hkD+Cg/7?=
 =?us-ascii?Q?/H701afoUdd9c4hABY/1Vexvj5FTTMgYt4BIk5G/z0zH4UYdT1874EVbgcZb?=
 =?us-ascii?Q?38+5qJzHSb1Tn1+1+pMPK/kMELY/M7A5W/EVpNerpWbcsTroc8oHBi06b8wK?=
 =?us-ascii?Q?S9wPsLyQ/VCRHO2h8+TdrL2buz5ITgPz/3tHwutFlPlpoYZSdryTM2AWQJDX?=
 =?us-ascii?Q?r87x2ALekIn0XjgzjcmdJf3/4ylYuv/Qx4+bCw8f9wsfhjcDLupwDTEBQGGe?=
 =?us-ascii?Q?ezfxXoXXn5Bur0ZbPxyCdQkswr0gXYnZjqYsKy2tQuJzMkpKeFx4K1/7v7MC?=
 =?us-ascii?Q?jYYEyHJPUBrhgUlaZ76O0+Sohr5skZ7v1hmuBA+VNUS62s0D1JLKxuLfjuA5?=
 =?us-ascii?Q?E6m2RSv+vCFW/+L2kXSYLOFuZQ6y3gXSNvXLMMbKh2Mc6HTr1kfE+dhUrbcQ?=
 =?us-ascii?Q?0FBjxDe3u1gDh2FLw9QXEoWBrDVh0ZFc6UFhyazDJh+bBnBpRRLQWMTmsft9?=
 =?us-ascii?Q?WIS+w3mGJ8meedIdTSxSUCq8nIvA69nEIN/uqLts9F9TCUvzYvEsnF+fJ+Zh?=
 =?us-ascii?Q?AcktqOcL1AiUM19s3JdAmjfx1GvOrBnXp9YT2KMyacXHChNiManFQsO+/wgH?=
 =?us-ascii?Q?sU4eAYqt9sbZ/Fw987Ti7/QBkTOGPxVsueu8AXBbZuSYVs4WyCSxP7C/9wqp?=
 =?us-ascii?Q?Cd/XCsWXgHpohZO3GQsx2n+FI6QAnh+nmYZJpiwooOvkuxjySRjR5X0OioAp?=
 =?us-ascii?Q?irKr//A+2A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 934306ac-84f8-457f-5086-08df1a407649
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:33:47.5981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfNfIF4QK59ye/7TE6vdFJCUis/w9hvKETInGB8IJKxc3keyVrUPdClNwP5TSEA8hppNJOUm4an8zjE9HWXsq1a5/vZrvUW3bUIx/+aFpPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3296
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 13:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246587

Backport the upstream fix for the limits.h override, which breaks GCC's
<limits.h> include cycle (notably GCC 16.x) and fails musl builds.

Upstream fix: https://github.com/systemd/systemd/pull/43831

[ changed SRC_URI addition to not use overrides - RB ]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-include-fix-limits.h-override.patch  | 74 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_261.3.bb    |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-include-fix-limi=
ts.h-override.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-ov=
erride.patch b/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-=
override.patch
new file mode 100644
index 0000000000..d11a5fe3f8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-override.=
patch
@@ -0,0 +1,74 @@
+From 6a131b32e0fe948e845ae4bf41f8fed003ec30ce Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Tue, 22 Sep 2026 01:55:01 +0900
+Subject: [PATCH] include: fix limits.h override
+
+This is especially necessary since GCC 16.x.
+
+=3D=3D=3D=3D=3D
+$ gcc --version
+gcc (GCC) 16.2.1 20260819 (Red Hat 16.2.1-2)
+Copyright (C) 2026 Free Software Foundation, Inc.
+This is free software; see the source for copying conditions.  There is NO
+warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.
+=3D=3D=3D=3D=3D
+
+Without this change, /usr/include/limits.h is not included, hence POSIX
+constants are not defined:
+=3D=3D=3D=3D=3D
+$ echo '#include <limits.h>' | gcc -E -H -isystem ~/git/systemd/src/includ=
e/musl - 2>&1 >/dev/null | grep '^\..*limit'
+. /home/watanabe/git/systemd/src/include/musl/limits.h
+.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
+... /usr/lib/gcc/x86_64-redhat-linux/16/include/syslimits.h
+=3D=3D=3D=3D=3D
+
+With this change, /usr/include/limits.h is included, thus POSIX
+constants are defined:
+=3D=3D=3D=3D=3D
+$ echo '#include <limits.h>' | gcc -E -H -isystem ~/git/systemd/src/includ=
e/musl - 2>&1 >/dev/null | grep '^\..*limit'
+. /home/watanabe/git/systemd/src/include/musl/limits.h
+.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
+... /usr/include/limits.h
+...... /usr/include/linux/limits.h
+.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
+=3D=3D=3D=3D=3D
+
+Replaces #43824.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/43831]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/include/musl/limits.h | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/src/include/musl/limits.h b/src/include/musl/limits.h
+index 9620a3b0ac..bcc585be2c 100644
+--- a/src/include/musl/limits.h
++++ b/src/include/musl/limits.h
+@@ -1,6 +1,26 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ #pragma once
+=20
++/* GCC introduces a spurious, tricky inclusion cycle:
++ *    GCC's limits.h
++ *      -> GCC's syslimits.h
++ *         -> GCC's limits.h (again!!!)
++ *            -> glibc/musl's limits.h
++ *               -> define POSIX defines
++ *      -> define ISO C defines
++ * This works only when GCC's limits.h is included first, but a user over=
ride breaks the cycle. Hence, we
++ * need to manually achieve the cycle here. If GCC is not used (e.g., Cla=
ng), then including the compiler's
++ * limits.h twice should be redundant but harmless. */
++
++/* First, get the POSIX defines from glibc/musl's limits.h. When the two =
macros below are defined, GCC's
++ * limits.h includes the next limits.h, that is, one from glibc/musl. */
++#define _GCC_LIMITS_H_
++#define _GCC_NEXT_LIMITS_H
++#include_next <limits.h>        /* IWYU pragma: export */
++#undef _GCC_NEXT_LIMITS_H
++#undef _GCC_LIMITS_H_
++
++/* Next, get the ISO C defines from GCC's limits.h. */
+ #include_next <limits.h>        /* IWYU pragma: export */
+=20
+ #include <assert.h>
diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-core=
/systemd/systemd_261.3.bb
index 1a256a598a..0901736e7c 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -36,6 +36,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-Do-not-create-var-log-README.patch \
+           file://0001-include-fix-limits.h-override.patch \
            "
=20
 PAM_PLUGINS =3D " \

