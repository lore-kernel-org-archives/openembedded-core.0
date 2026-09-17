Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7367EC982CF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 12:06:51 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38061.1789646805225010409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 05:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=B56f/UVD;
 spf=pass (domain: est.tech, ip: 52.101.69.33, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lg9bxh3pD1UBmxkYNOJEWOf42Is5yLQi9BCAZZCiODq5FpF3YNLw9ZDCczvYxde/3DPAcWTRIvI1OFLqXi1WntTcj/729YaPzFOnB0x0heYvcPBEUDc7PYSjddNMpsnPi4pLVdYI7FKQ1KkjoyJzS0StNmsfRi9ctDSebk8gG6y4+RZfbWKyWKyGY98LksgaEfwBk/RVmp3u3loWMj8ubu5YGAuE5JDetH5oDMo5nrnj+gPMcQoaWz4LVYUWzDJG0P5/UZm7bJAZYxJZTPKwUFxMGH++wDLElutSY3NTFrGPgZa4hYD4mf/37dgKD74/Gynki4IHiTcG3q2DFNpjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNbzq2rBdfoHYbY4PjBlSUqX3w+KIFiB4VtmAnr74l8=;
 b=Q1aa8dkOSS9OXHqb3S5q4L0dxuCDzm+KZ++i9NRE+TQzNIPePvVBm0Jz68mkATh1gE32OkjqL9N9tDQZ2wg1zSTnuvMDyxu32w4cCwqaB0qFGS297afhq/YtA5oxvTi/x81ToZ/For6PHKSr9xvBJ6rS5lMjvOSWwTHMenTwWqvtiQgf2qu6E8ZGrYQCXyqASDSDTxmInlaSGCFxhRHMteJ5yYzmnXNxO1y5INl6xa6+SuYRFOtYqtr9g8Ar2FufEeCCcByIK6y40If+/P4K9JdfwjNCdkIGEbvJsEG3kzbxYdZA3GhPB0WuFISzQdlbmKFiE+rmSxZyGHqKDlMtJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNbzq2rBdfoHYbY4PjBlSUqX3w+KIFiB4VtmAnr74l8=;
 b=B56f/UVDghZmA91zXlLyhhMpvGbrP/MMEYh0K8JozH83iu6HDb4W6iEN9UUur9ySaHgY4sbixS1rTnVAgoZnayVsZ8+w/I5tqpfr+86kOiftJGAhg3QR5gzCipONUznUNrBC1K0Rvho/MrZp/cQ0rp239ky/TMJl0y2K10gCPIV4xrFhYgjoiPM/Lz9qrWHv+xTi8D2isl4l18q7Dg0vcujcBL/C/bFDikhoXw0JkLYAOEQfE+fh1HMH5nrnxMA6TUVdrTF0MpNMyEw19l0p8y/ZzVnVCuU68XPraW4u8/7m+TFhBXWVsqXmaMkuWG2VTZgkDKoEfTaasyf5hQDgIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0747.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Thu, 17 Sep
 2026 12:06:36 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 12:06:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] glib-2.0: Upgrade 2.88.3 -> 2.90.0
Date: Thu, 17 Sep 2026 14:06:34 +0200
Message-ID: <20260917120634.53702-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO3P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0747:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5f074b-0516-4502-658d-08df14b41f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10067099003|3023799007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	K87MYvoba/hnwVH+Yri8ZhivvT9JTPSt5aXSZDYwMpKW4ebgEh991ckGS0jSQWX4oPmmvqdmT6ETvSyOVfSPYfwYLSUNN5y13JxOYRNI/a0zsyMxUujxdcgKJEvSqwhu4Pwv3BsvAGouWvq776+A4g7rnEntZ3hCmbVCS8Y8KNWA7Hr4AzX96QNKVdgxzSWKnvjsXojkj21kEmfia1bQOsYb3958L3Dnj8XFlkHBhI7LqXXrDJy2sEqO56I+UgPVPLKxNDoQoR4Spv/AC1IlHt2KTXaP2DRmOBxciVEuqs72XDkEMWZbk3ysItfvpN4HTI7HyAn8qw1UvLnB33HXOxK5Iv1TtdYXPNiJItr/OyEPK6eMRfRtXZFzXJ0YoCnyRDOhcnBiWO51KO/4ChYRqoqEouNH5EW84fZCsEWGPMl3/ObYkL4iUD12Yxg9c8LCyr0uUExw5btU0adjQJwE18dk1h4Ce8zDc1VAL1iFl9gs1+cfP8XsvqFV0OJ8pu5XBjfUIUYqNwCmEleF1UxCONRStdYEQuaXZwG7Obvv4ngsqKAp51lzvdBHcUUjXqyXjtdR/pMQX7yGo++Q6VcZ0y3RXLSftZoGhQ55JYY5tjc26e8woEr1gFr88/rxRLQV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(3023799007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5hQ5Uzogbdqcv4wnZWAhqPkJRhJBf3b3WX25cC59rSlGwm/Stz26GYNmm7Zt?=
 =?us-ascii?Q?wWkFvpcZoZjcNIua2jBYV/GGC+HpMdakU1Tn0w/wZouD+qkbhTGJ/+6mflV7?=
 =?us-ascii?Q?VA7GA4eCWTVP6tHUAZnbgeK+23+mAFglVmwcKvSzZS14kx9eXd4aVeAaep+h?=
 =?us-ascii?Q?r/LE7F/0XumJ7OtPwbaVF/6kTPgGUOUdKHaYLRPL46DlmgRLHjRTUfX4eqgt?=
 =?us-ascii?Q?Qzn9dkGq2GAasW52+gtUmxDnG5ZiEDas1TlXqokRPDWP+4Ozs8zTXIRA83Rl?=
 =?us-ascii?Q?nZvQVoJaWVCloCOB5tlpqeqC0bSVrHG8lbcBKBml38QQeiX3mX0veFYLbMS0?=
 =?us-ascii?Q?nsy8FZRNWS/mEnCkxD0nmtLzt2z9xMKuvbP0++rnX1Gg6Jam6zOPwRf77eZn?=
 =?us-ascii?Q?jSvCzLx6leFd/byv22oXx1GfJ5ZLOekq44RKT6fKvjMVn86ssSf1VOiKaEye?=
 =?us-ascii?Q?iloPxIEElacfYzqjVObcShgceCfA+2ygAy54ZyUU+S6Yy9Ns+iXfGxsQDOny?=
 =?us-ascii?Q?0j0RGylADpzcRCj41taHVupjBlFH6wHycT/eUKsopVzoKdX+7TAgZSKHuSlz?=
 =?us-ascii?Q?xZztniS1a6juTEtB0BKk1g94oOOFV82ta81+fP4txEFThwOcfJlprtSIytMf?=
 =?us-ascii?Q?ho0EGtHscvhJKHCGhtxpIeIg/M8u0+zh59suo2OfuP52yO58T2ylJPpFmo46?=
 =?us-ascii?Q?L2GXWNzjqtbyGbSErata9dfay6t3NU2i0S6Hpsqc4caSykCjqVntNabFBwOh?=
 =?us-ascii?Q?nxfcwbrRAKSbRm4qFKAW0/Q0lWBaBBZRhqUrKSJy3U5ctCPs9VmtbkhAWbv5?=
 =?us-ascii?Q?iJJkFrmjXmHNelqglx4Yagpp2vAIqulofeKjlZZwJjxecXNg2d0u9apmRMeV?=
 =?us-ascii?Q?Vh0nO2d+Aa31sFbVwn+ABhfba0xrXO7IU5R6A+PrXYw5WYMLWjO99NYgDLIp?=
 =?us-ascii?Q?BIWYfMHfHvx9fUQ2CyPE03qsOFqjwScfzOSTOAcv5EJ1fGQi2rZLFfHTCsTO?=
 =?us-ascii?Q?/oQgrgkAw5QIhHYqn+WaJklB7hyMp5KqCDIRryoNLQLnNePJe3681DggbKUb?=
 =?us-ascii?Q?5LpRKfJygdxQgPZM0iJNEsu5ZqPYCHxeQT4Ayh2caCbfxwAgIozwIjfJ1Jn0?=
 =?us-ascii?Q?wwninWWIbN1lEyP3WGSyMQzEkkV7+ZrceO4EJq5/YDnetVqrfI9xXF1R5KxR?=
 =?us-ascii?Q?sYV0tZvrIZY8pkEP/CML0DKMju2xtl0uQyvAsb9xWxJq83k0PIJMNVxSD7Az?=
 =?us-ascii?Q?MSRTUbgkog78Tcpyo+LtemvkBwV+/8dgUfro8Dp80KIQLEbkTInBYW15sTQC?=
 =?us-ascii?Q?HoArlIlQ5PkoCR9K4N0dKeYddOmBh3VfMBBqEA9u9RWlttxglv3j12b7uoUk?=
 =?us-ascii?Q?jfrfWtwNizlM0ySuVzI35kb4+/TWDG8+G6QBDwHiq219Sp4VT5IIkNYzAc3W?=
 =?us-ascii?Q?wlwQadOxBENvIy2HZygbGl+aC3DRY3nq9mbqfdza7tz13z4fdzhIcXf8rqxm?=
 =?us-ascii?Q?Hi1+hO9Mi8riZLnnDGp3AQyJ4Q8AlHJf7nsXIMonESYLG3Bvn4YAtOB+Y0+A?=
 =?us-ascii?Q?MuYk/51Y6Hg7Br5Vwwfxlfin4elwtLkwHl3TAnfk7PjMndEoL2TO74b4b7Nn?=
 =?us-ascii?Q?P23cA+09yNtk8gBbL6RPrewX0BY8cGZk/ttKYhGv8MrxmtPk88mGtMf0v5Fq?=
 =?us-ascii?Q?YErFEAT9vw7RpLasuH1BZJ6b42SdOUsq/3lEpRIGpdz3sqY1Zy+nsYcJnqwm?=
 =?us-ascii?Q?BTE1gLging=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5f074b-0516-4502-658d-08df14b41f69
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 12:06:36.4801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzSK8OOxgwhju2nfVc2oLxfD9KRHrdAZ5q8EV2Low0buBGp1v1/mSYEXz0OPTvwpsNyGbzVKdHsXaeci14dd4a+aaeJ1KRY4xzKGnr3tvMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 12:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246060

NEWS:
https://gitlab.gnome.org/GNOME/glib/-/releases/2.90.0
https://gitlab.gnome.org/GNOME/glib/-/releases/2.89.4

- Remove below patches where are part of release now
  CVE-2026-58016-1.patch
  CVE-2026-58016-2.patch
  0001-gio-tests-services-Fix-installed-service-file-using-.patch
  0001-gtype-Mark-the-G_DEFINE_TYPE-parent_class-variable-a.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
- Fix SRC_URI

 ...t-write-bindir-into-pkg-config-files.patch |  2 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  2 +-
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  2 +-
 ...es-Fix-installed-service-file-using-.patch | 35 -------
 ..._DEFINE_TYPE-parent_class-variable-a.patch | 44 ---------
 ...on-Run-atomics-test-on-clang-as-well.patch |  2 +-
 ...ot-enable-pidfd-features-on-native-g.patch |  2 +-
 ...dcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/files/CVE-2026-58016-1.patch     | 92 ------------------
 .../glib-2.0/files/CVE-2026-58016-2.patch     | 96 -------------------
 .../glib-2.0/files/relocate-modules.patch     |  2 +-
 .../files/skip-monotonic-time-similar.patch   |  6 +-
 .../glib-2.0/files/skip-timeout.patch         |  2 +-
 ...l_2.88.3.bb =3D> glib-2.0-initial_2.90.0.bb} |  0
 ...{glib-2.0_2.88.3.bb =3D> glib-2.0_2.90.0.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  9 +-
 18 files changed, 15 insertions(+), 287 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/0001-gio-tests-service=
s-Fix-installed-service-file-using-.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/0001-gtype-Mark-the-G_=
DEFINE_TYPE-parent_class-variable-a.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.3.bb =3D> glib-2.=
0-initial_2.90.0.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.3.bb =3D> glib-2.0_2.90.0=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into=
-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-writ=
e-bindir-into-pkg-config-files.patch
index c22ef9fdb3..41b2dfb5c4 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
@@ -1,4 +1,4 @@
-From 94f8f5bf51db5219022f6a646e784cb67d284282 Mon Sep 17 00:00:00 2001
+From 2ccf2016cae7dad83cbc3f00e3fefa3ca16ae707 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config file=
s
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclib=
c-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uc=
libc-Linux.patch
index bd7a04cccf..2b1a2134c8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
@@ -1,4 +1,4 @@
-From c80659ca01051f8e83dccd4eda15a811b0ea377d Mon Sep 17 00:00:00 2001
+From 8ec44223e9cdedc4ca5b0c2b806c02c215f07b45 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules=
-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-g=
io-querymodules-as-libexec_PROGRAM.patch
index 8f6fd98472..6968f725ed 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 25d6cb83b6b46181fbdad1a6f872a3788d6e4843 Mon Sep 17 00:00:00 2001
+From e18fd4c362b3e23ec10ac1c223ad9c5ee6b5993a Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about=
-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-=
Remove-the-warning-about-deprecated-paths-in-schemas.patch
index d64576b11e..022094bb17 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 29be4e2681b78d7856143056f769040be076b03d Mon Sep 17 00:00:00 2001
+From b920bbb775210dc81fff3e12260ee0cd9d4e6ef1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-co=
mment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 579999fd6d..402859149a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 12bf3fded3b4c0c7b2d7ae7810d6eef47ed747e5 Mon Sep 17 00:00:00 2001
+From d15b734a85ff94c8b80ccb1ad22154741140152e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-i=
nstalled-service-file-using-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-services-Fix-installed-service-file-using-.patch
deleted file mode 100644
index 755e51cdd3..0000000000
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installe=
d-service-file-using-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ed5956d0000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Thu, 30 Jul 2026 11:28:36 +0000
-Subject: [PATCH] gio/tests/services: Fix installed service file containing
- build path
-
-The refactoring in !5259 changed the installed service file's
-configure_file() to use the build output as input instead of the
-original .in template. Since @installed_tests_dir@ is already
-substituted in the build output, the installed version gets the
-build directory path instead of the install prefix.
-
-Use the .in template directly as input for the installed version.
-
-Closes #4011
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ed=
5956d]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- gio/tests/services/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gio/tests/services/meson.build b/gio/tests/services/meson.bui=
ld
-index 1111111..2222222 100644
---- a/gio/tests/services/meson.build
-+++ b/gio/tests/services/meson.build
-@@ -18,7 +18,7 @@ foreach service_file_name : dbus_service_files
-     # Build a second copy of the service file for the installed
-     # version of the tests.
-     installed_service_file =3D configure_file(
--      input: service_file,
-+      input: service_file_name + '.in',
-       output: service_file_name + '.to-install',
-       configuration: installed_cdata,
-     )
diff --git a/meta/recipes-core/glib-2.0/files/0001-gtype-Mark-the-G_DEFINE_=
TYPE-parent_class-variable-a.patch b/meta/recipes-core/glib-2.0/files/0001-=
gtype-Mark-the-G_DEFINE_TYPE-parent_class-variable-a.patch
deleted file mode 100644
index 642e02550b..0000000000
--- a/meta/recipes-core/glib-2.0/files/0001-gtype-Mark-the-G_DEFINE_TYPE-pa=
rent_class-variable-a.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1567250294e9666747ee63f5c6364bbceadd300b Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Sun, 30 Aug 2026 11:39:28 +0530
-Subject: [PATCH] gtype: Mark the G_DEFINE_TYPE parent_class variable as un=
used
-
-clang 23 added -Wunused-but-set-global, which fires on the
-type_name##_parent_class variable that _G_DEFINE_TYPE_EXTENDED_BEGIN_PRE
-emits whenever a type never chains up to its parent:
-
-  error: variable 'my_thing_parent_class' set but not used
-  [-Werror,-Wunused-but-set-global]
-
-Projects that promote the unused-but-set group to an error (pango, for
-one) now fail to build with clang 23, and they cannot fix it on their
-side because the variable comes from this macro.
-
-Annotate it G_GNUC_UNUSED, the same treatment the adjacent
-get_instance_private helper already gets.
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
-Fixes: #4038
-
-Upstream-Status: Backport [1567250294e9666747ee63f5c6364bbceadd300b]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- gobject/gtype.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gobject/gtype.h b/gobject/gtype.h
-index 1d383a8ea..de5188f9f 100644
---- a/gobject/gtype.h
-+++ b/gobject/gtype.h
-@@ -2295,7 +2295,7 @@ static void     type_name##_class_intern_init (gpoin=
ter klass) \
- static void     type_name##_init              (TypeName        *self); \
- static void     type_name##_class_init        (TypeName##Class *klass); \
- static GType    type_name##_get_type_once     (void); \
--static gpointer type_name##_parent_class =3D NULL; \
-+G_GNUC_UNUSED static gpointer type_name##_parent_class =3D NULL; \
- static gint     TypeName##_private_offset; \
- \
- _G_DEFINE_TYPE_EXTENDED_CLASS_INIT(TypeName, type_name) \
---=20
-2.43.0
-
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-o=
n-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-ato=
mics-test-on-clang-as-well.patch
index 3f9b9e4741..bbb85c2355 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
@@ -1,4 +1,4 @@
-From 0530e624dd47ee18aab18c8d403da12bb297f26e Mon Sep 17 00:00:00 2001
+From ebb658f1387978e88eee317920c15fae59d11ba1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enabl=
e-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-=
meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 0912859698..abf45bd809 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 0147fb147548e0657f298ab8e050ef8aaad3c850 Mon Sep 17 00:00:00 2001
+From b4b512340934801a004b69d37c83846ca63afc34 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-p=
ath-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not=
-hardcode-python-path-into-various-tools.patch
index c032d575eb..3ad5ab3f6d 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
@@ -1,4 +1,4 @@
-From 2bafa636db0241952b9168c62f051900ebf8b058 Mon Sep 17 00:00:00 2001
+From dedb9b25edc15c63c4068b87fb6ae2e205ab30da Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
deleted file mode 100644
index f6883ba85c..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 9a59b64b294843842efc86148485c8b3530cdfd1 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Thu, 16 Apr 2026 15:27:37 +0100
-Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <no=
de>
- element nesting
-
-The check for whether a `<node>` element in D-Bus introspection XML was
-nested correctly was broken. `<node>` elements can only be at the top
-level, or nested immediately within another `<node>` element.
-
-Fix the check and add some unit tests for it.
-
-Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit test
-uses example XML strings adapted from their report.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Fixes: #3932
-
-CVE: CVE-2026-58016
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c9=
da977c178fbfc0e4caf99f9fdf5dc433d6fcc2]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- gio/gdbusintrospection.c        |  2 +-
- gio/tests/gdbus-introspection.c | 33 +++++++++++++++++++++++++++++++++
- 2 files changed, 34 insertions(+), 1 deletion(-)
-
-diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index df5daa3..78a63e2 100644
---- a/gio/gdbusintrospection.c
-+++ b/gio/gdbusintrospection.c
-@@ -1258,7 +1258,7 @@ parser_start_element (GMarkupParseContext  *context,
-   /* --------------------------------------------------------------------=
-------------------------------- */
-   if (strcmp (element_name, "node") =3D=3D 0)
-     {
--      if (!(g_slist_length (stack) >=3D 1 || strcmp (stack->next->data, "=
node") !=3D 0))
-+      if (stack->next !=3D NULL && strcmp (stack->next->data, "node") !=
=3D 0)
-         {
-           g_set_error_literal (error,
-                                G_MARKUP_ERROR,
-diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspecti=
on.c
-index cb99c94..05710d4 100644
---- a/gio/tests/gdbus-introspection.c
-+++ b/gio/tests/gdbus-introspection.c
-@@ -300,6 +300,38 @@ test_extra_data (void)
-   g_dbus_node_info_unref (info);
- }
-=20
-+static void
-+test_invalid (void)
-+{
-+  const struct
-+    {
-+      const char *xml;
-+      GMarkupError expected_error_code;
-+    }
-+  vectors[] =3D
-+    {
-+      { "", G_MARKUP_ERROR_EMPTY },
-+      { "<node><interface name=3D\"I\"><method name=3D\"M\"><node><interf=
ace name=3D\"I2\"></interface></node></method>", G_MARKUP_ERROR_INVALID_CON=
TENT },
-+      { "<node><interface name=3D\"I\"><signal name=3D\"S\"><node><interf=
ace name=3D\"I2\"><signal name=3D\"S2\"></signal></interface></node></signa=
l>", G_MARKUP_ERROR_INVALID_CONTENT },
-+      { "<node><interface name=3D\"I\"><property name=3D\"P\" type=3D\"s\=
" access=3D\"read\"><node><interface name=3D\"I2\"></interface></node></pro=
perty>", G_MARKUP_ERROR_INVALID_CONTENT },
-+      { "<node><interface name=3D\"I\"><method name=3D\"M\"><arg type=3D\=
"\"><node><interface name=3D\"I2\"><method name=3D\"M2\"></method></interfa=
ce></node></arg>", G_MARKUP_ERROR_INVALID_CONTENT },
-+    };
-+
-+  for (size_t i =3D 0; i < G_N_ELEMENTS (vectors); i++)
-+    {
-+      GDBusNodeInfo *node;
-+      GError *local_error =3D NULL;
-+
-+      g_test_message ("Testing parsing of %s gives an error", vectors[i].=
xml);
-+
-+      node =3D g_dbus_node_info_new_for_xml (vectors[i].xml, &local_error=
);
-+      g_assert_error (local_error, G_MARKUP_ERROR, (int) vectors[i].expec=
ted_error_code);
-+      g_assert_null (node);
-+
-+      g_clear_error (&local_error);
-+    }
-+}
-+
- /* ----------------------------------------------------------------------=
------------------------------ */
-=20
- int
-@@ -317,6 +349,7 @@ main (int   argc,
-   g_test_add_func ("/gdbus/introspection-generate", test_generate);
-   g_test_add_func ("/gdbus/introspection-default-direction", test_default=
_direction);
-   g_test_add_func ("/gdbus/introspection-extra-data", test_extra_data);
-+  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
-=20
-   ret =3D session_bus_run ();
-=20
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
deleted file mode 100644
index 3acb16f75d..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 02e38caa6265e25da87836ec46c9e514d4a81159 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Thu, 16 Apr 2026 15:08:10 +0100
-Subject: [PATCH] gdbusintrospection: Add some assertions before array
- dereferences
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-The state handling inside the D-Bus introspection XML parser is
-complicated, and it=E2=80=99s possible that these dereferences of the
-`len - 1`th element might get reached when the array is empty.
-
-Make failures like that more debuggable by adding an assertion on the
-length beforehand.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Helps: #3932
-
-CVE: CVE-2026-58016
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/65=
6ad4582cb1d7a7fa8bafe3ce8aec6aa3c17da0]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- gio/gdbusintrospection.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index 78a63e2..4df8e87 100644
---- a/gio/gdbusintrospection.c
-+++ b/gio/gdbusintrospection.c
-@@ -1096,6 +1096,7 @@ parse_data_get_annotation (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->annotations, g_new0 (GDBusAnnotationInfo, 1));
-+  g_assert (data->annotations->len > 0);
-   return data->annotations->pdata[data->annotations->len - 1];
- }
-=20
-@@ -1105,6 +1106,7 @@ parse_data_get_arg (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->args, g_new0 (GDBusArgInfo, 1));
-+  g_assert (data->args->len > 0);
-   return data->args->pdata[data->args->len - 1];
- }
-=20
-@@ -1114,6 +1116,7 @@ parse_data_get_out_arg (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->out_args, g_new0 (GDBusArgInfo, 1));
-+  g_assert (data->out_args->len > 0);
-   return data->out_args->pdata[data->out_args->len - 1];
- }
-=20
-@@ -1123,6 +1126,7 @@ parse_data_get_method (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->methods, g_new0 (GDBusMethodInfo, 1));
-+  g_assert (data->methods->len > 0);
-   return data->methods->pdata[data->methods->len - 1];
- }
-=20
-@@ -1132,6 +1136,7 @@ parse_data_get_signal (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->signals, g_new0 (GDBusSignalInfo, 1));
-+  g_assert (data->signals->len > 0);
-   return data->signals->pdata[data->signals->len - 1];
- }
-=20
-@@ -1141,6 +1146,7 @@ parse_data_get_property (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->properties, g_new0 (GDBusPropertyInfo, 1));
-+  g_assert (data->properties->len > 0);
-   return data->properties->pdata[data->properties->len - 1];
- }
-=20
-@@ -1150,6 +1156,7 @@ parse_data_get_interface (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->interfaces, g_new0 (GDBusInterfaceInfo, 1));
-+  g_assert (data->interfaces->len > 0);
-   return data->interfaces->pdata[data->interfaces->len - 1];
- }
-=20
-@@ -1159,6 +1166,7 @@ parse_data_get_node (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->nodes, g_new0 (GDBusNodeInfo, 1));
-+  g_assert (data->nodes->len > 0);
-   return data->nodes->pdata[data->nodes->len - 1];
- }
-=20
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta=
/recipes-core/glib-2.0/files/relocate-modules.patch
index 6c982ca735..d5d97f3a4a 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 226f4955e53c6b3f360f346e41a0a22b74cbbaae Mon Sep 17 00:00:00 2001
+From c41b9b46ab9ada1c3a3e0d63ef1a0535a3c92457 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native bu=
ilds
diff --git a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.p=
atch b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
index 2ccefb6f3f..9cb03bc65c 100644
--- a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
@@ -1,6 +1,6 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From f663a6986d82001cc6f60c3625c3dc532651dcb1 Mon Sep 17 00:00:00 2001
 From: Pratik Farkase <pratik.farkase@est.tech>
-Date: Tue, 5 Aug 2026 08:00:00 +0000
+Date: Wed, 5 Aug 2026 08:00:00 +0000
 Subject: [PATCH] Skip /monotonic-time-ns/similar test
=20
 The test_similar test compares g_get_monotonic_time() and
@@ -19,7 +19,7 @@ Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
  1 file changed, 1 deletion(-)
=20
 diff --git a/glib/tests/monotonic-time.c b/glib/tests/monotonic-time.c
-index 1234567..abcdef0 100644
+index 04ff898..dae0533 100644
 --- a/glib/tests/monotonic-time.c
 +++ b/glib/tests/monotonic-time.c
 @@ -153,7 +153,6 @@ main (int argc, char *argv[])
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/rec=
ipes-core/glib-2.0/files/skip-timeout.patch
index 7bc83adf6b..86e2883a27 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 64e957f0fb32ed54748ceb4f220cb4773743d6ec Mon Sep 17 00:00:00 2001
+From 8f34800e6f3ad201b3fd6f6b333f32c45b2df591 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.90.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index d80cf6f267..91c9795547 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -225,8 +225,7 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D "\
=20
 PE =3D "1"
=20
-SRC_URI +=3D "\
-           file://run-ptest \
+SRC_URI +=3D "file://run-ptest \
            file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schema=
s.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
@@ -236,16 +235,12 @@ SRC_URI +=3D "\
            file://0010-Do-not-hardcode-python-path-into-various-tools.patc=
h \
            file://skip-timeout.patch \
            file://skip-monotonic-time-similar.patch \
-           file://CVE-2026-58016-1.patch \
-           file://CVE-2026-58016-2.patch \
-           file://0001-gio-tests-services-Fix-installed-service-file-using=
-.patch \
-           file://0001-gtype-Mark-the-G_DEFINE_TYPE-parent_class-variable-=
a.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "ab24d24e698dfa1e408b7bcdb508f4aafc906185a8=
b8ce72fdf79bbbdc9b383b"
+SRC_URI[archive.sha256sum] =3D "17d15cac2af80a33271127408e0abc2748eb297c59=
5c2a26409e81e14e7d1b8f"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.

