Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA4BC88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 13:27:40 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39451.1789133257789659915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 06:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KlMYpWWl;
 spf=pass (domain: est.tech, ip: 52.101.65.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtmJFb4A/Z2Xvg37VvouqvIz1A+Uv4y0FX3BRgJ8PCOPocDUmwciEqI6rA5WT/HSVd1t5Z2DpZ8Rf2D+sZ/JH7pCbEMUS356KSWg5pNmkXhmCyR5nhNS52rEEyOdgyb3aRvHD1+n6q/dSW1I1k6zosC+hj/oYkBptOldn0DXTk8IfGRVN2tLv+vdXPDiAjPmDjMO50tCzL08VYc3UxQR748NSmUfIoNEiUxlfj8qlv2EsHM7hKE8fi9B1/jx1g25PSK1fyQgUtQrfKwxGpUoj3I4XJASHyund3oYZYG4wBuxlkfvcGRUO1JXwaQYQp/YTBjvGqgMlA1RQ/sJWSlwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8jjx0oyy4z5rqebK8W/3jOH/vItad+LUzHr9/2lYPM=;
 b=bsJNRlqOdSfZM1MeOuRJLnxfhXx+r29STBJlOR2DmjgOTdWdpVpTVTucY5bPvVBiNr7q3wGlWDpjJ8BqtDt7x6r/2XfBKOOr04j18vCGuEU+PJJdXC67kDvfHsxirmFEmByGicrsW0AmrbgTIjX1rSIc+3e88sn/HGUfx0cYZwi/GmGnPbWj1azaVjEzrNYskOYSsrYBhMtMaLqaMMK+Nm6Jidz4uMR3HQ2HL8xSU9cxeMwsVS3PEcLUp/ng8dwTXMMj9Fqd+UpQbNWUY3eQNN7V9vkQ+eXvhgCfWf1X3rrkKdrKJUi2PizkrDi7L7NGy1NI36AYn+KiVKWuETCakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8jjx0oyy4z5rqebK8W/3jOH/vItad+LUzHr9/2lYPM=;
 b=KlMYpWWlqbvmNzYczFnbc/iY/rtXIyIUXBWxKPTsy/q4VlI2vq5vvBOVHeW2SQAREzf4YLcAwG5EMZjuLTs7VwArUDbhviV0CD2G5nsxIuOqwAibAauavBfYHXDtfQdlA4+QZDQNLiTTd45KYtxdZa4cgOp94wQJYSvfg9PvueyR4DDL3jlqfrncRLd0vXMHkwBzQC//Y48ZLXkYyCciVfr9MUrPh1ZS0cTMuVtr1sFQzWUq+uXjkcBv8SK7TnlsjYVcyTbIU3jlSUUIAwY9J0Y76+U64sis3ugRPV+ygnPg/5ooU2M7B7JM5kZPxp29KoOEwCPBz683tE7whACs4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM0P189MB0785.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 13:27:29 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:27:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: upgrade 261.2 -> 261.3
Date: Fri, 11 Sep 2026 15:27:27 +0200
Message-ID: <20260911132727.42602-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0158.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM0P189MB0785:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a0cbdb-aaef-49b9-1f55-08df10086d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|3023799007|6133799003|10067099003|56012099006|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info: 
	j3EmKYyf20IZcPRs6Gul2LnqfcAEgXBobdUF5UE74j/q3QkGPNX8dp8GmxXuoNxsK81iLNdRiRlc8i7BuYgKGLn2TwI+sljARvDdk5BEDy97qB38Fruf0JWs8qFSnZkrmQXgH/m3dG/VPj1jZRAsrERNqpnn+m57eavcxlCsX/GrIillKGiMBUG3DflacfXsJ/m9G0kAAUi5xftvXFeKlbJ51TEe5hSEqCgneMN+bdG2DGfwHWHNx7FN08xDDr/b4vKKTUf/ULsJUc1yNS7UzjJZ7T6/MZFOAFR1gCjSwLitFjBGKm5RlJ63R15Ax+3dMt9s9vhmJNzoCo97W234Lhui2tM8vbbrTtduEgEnjcj5XVjeGHR1QLUrICO7ti/5u5jl5TV89gnw84ymnF25uXCdaOYPiwCJ1IM0qtlNi8O/tZqreo3xiQea9jIoLtl3siWT6Pc+vsFWPPEiX3ODMymYJnM72jTTnzjph0qS6np46+gm0S3E+ee+Byb8MdQat7331LJtHajnWo0QWjqEKExxj6kpw70IrRABSD4N5rtfIyF7Ll08KBOQgkMmeiPG1+2++CL5KH1VWDzQBu2AyJb5Yarf6YC91dWvtsPLQTIzvNj6UikmaopHY77DnO1kYcgq/or/myKYmLMU9oIb7D38Bg5/GAHeaLz32YvvEKU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aa3YrwIoYf2RpIJD3QOjgXhzxQDDd2QuW/dynd4L6F6reJD4lAA4Q0loKGDD?=
 =?us-ascii?Q?TYvl82QSA+2rnqNptsBXVfZWPDoXrGHLNDG46tAAlNz8k9bazi0MVIFsCDDS?=
 =?us-ascii?Q?OYDLBB/hz59iUTy9zavYCc4HN6I/LPswLftNr5GrHC757mkfqlbrxq/iOiNW?=
 =?us-ascii?Q?4CBFVuTdCcV4AdISn3nJNgnx4lqISHjPqc0F2Hr/sxdTP4hM/73bo7tRx7au?=
 =?us-ascii?Q?BIbuzwd1iVcU/qSTteEt4kVKUKY/tTybytsjs1B38NPx0cypijaMIWrwEz1Z?=
 =?us-ascii?Q?amKJRD32ddqhyHIOoH3aFme9GQ/o9WlCcnHnpL+lhYgBgmh9731fpdt6IsQC?=
 =?us-ascii?Q?l/YtC0uWc4IsazV4o0ISGPdPxQLKSZ2RluQyO3YnG8/72NDCQ/2rWP5do01z?=
 =?us-ascii?Q?l954GZbr24sAv/LTzi29Z/5OaSK7RD/9jvbENisiYelEZmBzMQyfjJrhN+A3?=
 =?us-ascii?Q?i9/yDw8mBu9Cs+RO8QjD7bqHPVjlcRNYuCwSUZ1xCn1B4RSC7V6iZapgh2Ix?=
 =?us-ascii?Q?kbLWLmjCwUB1JCst+W9RL0Ims2WMoOjfHoiMkOCz/OuYYTNQNAun1i9Ahz3L?=
 =?us-ascii?Q?esLbIx+ZpS11XER+63rBRqApRKNVHodz9VQTDnN3pLhNiIb/VXz4Y9ZLOrxe?=
 =?us-ascii?Q?LlL0fr/DekWBAyFAKzkjnsMmIq2Adw20+RCNTmt6xSnyythtnTH3agfXJovx?=
 =?us-ascii?Q?4yCgavNiuNscA/uBpxWJJjQWEU+wGV5nXlZcDKdkl+pA1n8zUtpXKEfQ4GWS?=
 =?us-ascii?Q?OWlxP7fjKjvN3+mxuCQvKsmZGxISWZJsMfaDTMb9PAyfNME7EwhJvLTL+CSs?=
 =?us-ascii?Q?49NLkWq/VtSC52yOGwsegOrqLQuBOAYNcZFsatKm4LWPwqWfBiDfzVGGWNa/?=
 =?us-ascii?Q?3knYZfihch7PgqohsG8EHUp8vR69nv4dBel7rAC7DdjhkiY2eOlLoDJOLV8m?=
 =?us-ascii?Q?FLDiPHrnh2o17Kxq6nwUORr/7Ws5nxX0k1s1CBwAL5cLkn5UCdWL6+SB4+hi?=
 =?us-ascii?Q?XtR6HwoCd0Q5xXIohNLbHEgVvahJrFdxiFTQJiYs1Pq4iEJSgPN88/fAe5Gp?=
 =?us-ascii?Q?JQQ+bb9B9qdPZ88A9Q+Sj1A8fGFTUgqcacl4s2Gf+dpO2BydK4pW98Zrsc9b?=
 =?us-ascii?Q?Ex0CKzGOVe5ewcvhu3S8MM2S1SlLegJOMPofNvjN9V2DL/H8GEqbCDb2OEQj?=
 =?us-ascii?Q?dNkJd4S6nMI7sC6ektNAmdwXmhehAp2FHax1CAEEiPyD1iiAMEiJQvcciB22?=
 =?us-ascii?Q?+f/rxLULMLmP+QBJ+SphEeirl3gVjQLnIXr7AFoAcS0rJZ6X2qPjIZsfrHaJ?=
 =?us-ascii?Q?BAf3oYyvBKVG3wQsEuZmHQjaL5/mDMINfpMLHgXuSjUaD6Ij0+9b1qkQRFXz?=
 =?us-ascii?Q?h1NV+hnqITwsqqNkirz2F9e8l+NhyWj4ESYMF8JKSO9acBjWY9Ob3YDtAW+h?=
 =?us-ascii?Q?BtLLyOGU8eNrrYUvKaX9nj608AabONmlcgc9buoBkJgGYk0Sxss1fWfXRwgW?=
 =?us-ascii?Q?FFCobpu5vJBc8fgm0DGAtE+VtXhn4B/IOt8nVwhLw+ljg4xe7EzP3b8yKf6e?=
 =?us-ascii?Q?b/Ln4+ynvSeuaibkoNkIvfmbSFTe4yHq3jMCA76IjvVZYfatJ+Hi92V6aCFG?=
 =?us-ascii?Q?Xrr5INa4VSuab1mYnk9If5EBDgtllKJvva7waOHyX32CFxI2gXAyBGC0PAV8?=
 =?us-ascii?Q?2uaTKmWX8qSWpxAUpZpHmvHfLl0HHU0BYFwEPJQFrcuBwrx43yLTTZNViGw9?=
 =?us-ascii?Q?9Kwwxc7nDw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a0cbdb-aaef-49b9-1f55-08df10086d77
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:27:29.3942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TL+qnhucX11Pdi2bVCwCMN+dP2XAeA6YiYxAyHiIqLgy5w7uwloZcgNtOpH1tmithFEfCkaP1SkJH/SoPJC7qGSmN6O51glstQicbhBoHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 13:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245649

 - Upgrade systemd-tools-native,systemd-boot,systemd-boot-native inline
 - Remove tools: fix building manpages with lxml 6.1.3 patch

261 Stable NEWS: https://github.com/systemd/systemd/blob/v261-stable/NEWS

Compare Log: https://github.com/systemd/systemd/compare/v261.2...v261.3

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ..._261.2.bb =3D> systemd-boot-native_261.3.bb} |   0
 ...md-boot_261.2.bb =3D> systemd-boot_261.3.bb} |   0
 ...261.2.bb =3D> systemd-tools-native_261.3.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...tall-dependency-links-at-install-tim.patch |  15 +--
 .../0003-Do-not-create-var-log-README.patch   |   6 +-
 ...issing-STATX_MNT_ID-on-older-kernels.patch | 112 +++++++++---------
 ...396d2c5bc1adb6b044e7784a30b7187f6fbd.patch |  59 ---------
 .../{systemd_261.2.bb =3D> systemd_261.3.bb}    |   4 +-
 9 files changed, 69 insertions(+), 129 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_261.2.bb =3D> system=
d-boot-native_261.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_261.2.bb =3D> systemd-boot_=
261.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_261.2.bb =3D> syste=
md-tools-native_261.3.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b04=
4e7784a30b7187f6fbd.patch
 rename meta/recipes-core/systemd/{systemd_261.2.bb =3D> systemd_261.3.bb} =
(99%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_261.2.bb b/meta/=
recipes-core/systemd/systemd-boot-native_261.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_261.2.bb
rename to meta/recipes-core/systemd/systemd-boot-native_261.3.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_261.2.bb b/meta/recipes=
-core/systemd/systemd-boot_261.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_261.2.bb
rename to meta/recipes-core/systemd/systemd-boot_261.3.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_261.2.bb b/meta=
/recipes-core/systemd/systemd-tools-native_261.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-tools-native_261.2.bb
rename to meta/recipes-core/systemd/systemd-tools-native_261.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index 70c5ac758d..3ee898958f 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e6e=
72d2c6 \
                     file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420a0=
07368f2"
=20
-SRCREV =3D "4925d9f07fc697efccd98a93046ff535b8832445"
+SRCREV =3D "3255daee1572366b74fe92f002a3d60ecbb27103"
 SRCBRANCH =3D "v261-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH};tag=3Dv${PV}"
=20
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-de=
pendency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/000=
1-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 8061ff1000..b83803aa08 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependenc=
y-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependenc=
y-links-at-install-tim.patch
@@ -1,8 +1,8 @@
-From b1ab58d3b4a8164e5978409706d6769f5cfde404 Mon Sep 17 00:00:00 2001
+From 451af4755f0c1da552498682d910f4f4c5209639 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
-Subject: [PATCH 01/16] binfmt: Don't install dependency links at install t=
ime
- for the binfmt services
+Subject: [PATCH] binfmt: Don't install dependency links at install time fo=
r
+ the binfmt services
=20
 use [Install] blocks so that they get created when the service is enabled
 like a traditional service.
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 7 insertions(+), 2 deletions(-)
=20
 diff --git a/units/meson.build b/units/meson.build
-index 4f47a3b2bd..237870025b 100644
+index 27d8ef2f72..864caa44bb 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -154,7 +154,6 @@ units =3D [
+@@ -168,7 +168,6 @@ units =3D [
          {
            'file' : 'proc-sys-fs-binfmt_misc.automount',
            'conditions' : ['ENABLE_BINFMT'],
@@ -36,7 +36,7 @@ index 4f47a3b2bd..237870025b 100644
          },
          {
            'file' : 'proc-sys-fs-binfmt_misc.mount',
-@@ -263,7 +262,6 @@ units =3D [
+@@ -279,7 +278,6 @@ units =3D [
          {
            'file' : 'systemd-binfmt.service.in',
            'conditions' : ['ENABLE_BINFMT'],
@@ -74,6 +74,3 @@ index 318bf8efc2..6ef684861d 100644
 +
 +[Install]
 +WantedBy=3Dsysinit.target
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-R=
EADME.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-=
README.patch
index 0128c83d9f..175ec7955b 100644
--- a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
@@ -1,4 +1,4 @@
-From a7f6a296707642d05463aec22ea3dfce7d06c989 Mon Sep 17 00:00:00 2001
+From 0d4a5976056387ff3801fdb7f53e6d0760df0475 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 21 Jan 2025 05:02:00 +0100
 Subject: [PATCH] Do not create /var/log/README
@@ -15,7 +15,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axi=
s.com>
  1 file changed, 3 deletions(-)
=20
 diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
-index cdef21fa9b..7890abcdef 100644
+index 7036c12b7c..80120b04b4 100644
 --- a/tmpfiles.d/legacy.conf.in
 +++ b/tmpfiles.d/legacy.conf.in
 @@ -13,6 +13,3 @@
@@ -25,5 +25,3 @@ index cdef21fa9b..7890abcdef 100644
 -{% if CREATE_LOG_DIRS %}
 -L$ /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
 -{% endif %}
---=20
-2.34.1
diff --git a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-=
on-older-kernels.patch b/meta/recipes-core/systemd/systemd/Handle-missing-S=
TATX_MNT_ID-on-older-kernels.patch
index 9d74872034..7e96550dd3 100644
--- a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-olde=
r-kernels.patch
+++ b/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-olde=
r-kernels.patch
@@ -1,6 +1,6 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 4f04acacb42d410d7002cae3e2bb6c51d47331d6 Mon Sep 17 00:00:00 2001
 From: Daniel Turull <daniel.turull@ericsson.com>
-Date: Mon, 23 Jun 2026 12:00:00 +0200
+Date: Tue, 23 Jun 2026 12:00:00 +0200
 Subject: [PATCH] Handle missing STATX_MNT_ID on older kernels
=20
 On hosts lacking STATX_MNT_ID (kernel < 5.8, e.g. RHEL 8), native tools
@@ -22,24 +22,55 @@ Upstream-Status: Inappropriate [oe specific]
 Assisted-by: kiro:claude-opus-4.6
 Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
 ---
- src/basic/chase.c   | 20 ++++++++++++++-
- src/basic/fd-util.c | 63 +++++++++++++++++++++++++++++++++++++++++++--
+ src/basic/chase.c   | 21 +++++++++++++++-
+ src/basic/fd-util.c | 61 +++++++++++++++++++++++++++++++++++++++++++--
  src/basic/fd-util.h |  1 +
- 3 files changed, 82 insertions(+), 2 deletions(-)
+ 3 files changed, 80 insertions(+), 3 deletions(-)
=20
---- a/src/basic/fd-util.h	2026-06-25 14:01:12.009875526 +0200
-+++ b/src/basic/fd-util.h	2026-06-25 14:01:20.909060415 +0200
-@@ -188,6 +188,7 @@ static inline int dir_fd_is_root_or_cwd(
- }
-=20
- int fds_inode_and_mount_same(int fd1, int fd2);
-+int fd_get_mount_id(int fd, uint64_t *ret);
+diff --git a/src/basic/chase.c b/src/basic/chase.c
+index 23a523798e..08ef95b3dd 100644
+--- a/src/basic/chase.c
++++ b/src/basic/chase.c
+@@ -40,7 +40,9 @@
+         (CHASE_MUST_BE_DIRECTORY|CHASE_MUST_BE_REGULAR|CHASE_MUST_BE_SOCK=
ET)
 =20
- int resolve_xat_fdroot(int *fd, const char **path, char **ret_buffer);
+ static int chase_statx(int fd, struct statx *ret) {
+-        return xstatx_full(fd,
++        int r;
++
++        r =3D xstatx_full(fd,
+                         /* path=3D */ NULL,
+                         /* statx_flags=3D */ 0,
+                         XSTATX_MNT_ID_BEST,
+@@ -48,6 +50,23 @@ static int chase_statx(int fd, struct statx *ret) {
+                         /* optional_mask=3D */ 0,
+                         /* mandatory_attributes=3D */ 0,
+                         ret);
++        if (r =3D=3D -EUNATCH) {
++                uint64_t mnt_id;
++
++                /* Kernel lacks STATX_MNT_ID; fall back to /proc/self/fdi=
nfo. */
++                r =3D xstatx(fd, /* path=3D */ NULL, /* statx_flags=3D */=
 0,
++                           STATX_TYPE|STATX_UID|STATX_INO,
++                           ret);
++                if (r < 0)
++                        return r;
++                r =3D fd_get_mount_id(fd, &mnt_id);
++                if (r < 0)
++                        return r;
++                ret->stx_mnt_id =3D mnt_id;
++                ret->stx_mask |=3D STATX_MNT_ID;
++        }
++
++        return r;
+ }
 =20
---- a/src/basic/fd-util.c	2026-06-25 14:01:12.011875567 +0200
-+++ b/src/basic/fd-util.c	2026-06-25 14:01:40.007456905 +0200
-@@ -1082,6 +1082,38 @@ int path_is_root_at(int dir_fd, const ch
+ static int chase_openat2(int root_fd, int dir_fd, const char *path, Chase=
Flags chase_flags) {
+diff --git a/src/basic/fd-util.c b/src/basic/fd-util.c
+index c6e78c59b6..7f33d900e5 100644
+--- a/src/basic/fd-util.c
++++ b/src/basic/fd-util.c
+@@ -1082,6 +1082,38 @@ int path_is_root_at(int dir_fd, const char *path) {
          return fds_inode_and_mount_same(dir_fd, XAT_FDROOT);
  }
 =20
@@ -78,7 +109,7 @@ Signed-off-by: Daniel Turull <daniel.turull@ericsson.com=
>
  int fds_inode_and_mount_same(int fd1, int fd2) {
          struct statx sx1, sx2;
          int r;
-@@ -1092,7 +1124,20 @@ int fds_inode_and_mount_same(int fd1, in
+@@ -1092,7 +1124,20 @@ int fds_inode_and_mount_same(int fd1, int fd2) {
          r =3D xstatx(fd1, /* path =3D */ NULL, AT_EMPTY_PATH,
                     STATX_TYPE|STATX_INO|STATX_MNT_ID,
                     &sx1);
@@ -100,7 +131,7 @@ Signed-off-by: Daniel Turull <daniel.turull@ericsson.co=
m>
                  return r;
 =20
          if (fd1 =3D=3D fd2) /* Shortcut things if fds are the same (only =
after validating the fd) */
-@@ -1101,7 +1146,19 @@ int fds_inode_and_mount_same(int fd1, in
+@@ -1101,7 +1146,19 @@ int fds_inode_and_mount_same(int fd1, int fd2) {
          r =3D xstatx(fd2, /* path =3D */ NULL, AT_EMPTY_PATH,
                     STATX_TYPE|STATX_INO|STATX_MNT_ID,
                     &sx2);
@@ -121,40 +152,15 @@ Signed-off-by: Daniel Turull <daniel.turull@ericsson.=
com>
                  return r;
 =20
          r =3D statx_mount_same(&sx1, &sx2);
---- a/src/basic/chase.c	2026-06-25 14:01:12.013875609 +0200
-+++ b/src/basic/chase.c	2026-06-25 14:01:47.117604514 +0200
-@@ -40,7 +40,9 @@
-         (CHASE_MUST_BE_DIRECTORY|CHASE_MUST_BE_REGULAR|CHASE_MUST_BE_SOCK=
ET)
-=20
- static int chase_statx(int fd, struct statx *ret) {
--        return xstatx_full(fd,
-+        int r;
-+
-+        r =3D xstatx_full(fd,
-                         /* path=3D */ NULL,
-                         /* statx_flags=3D */ 0,
-                         XSTATX_MNT_ID_BEST,
-@@ -48,6 +50,23 @@ static int chase_statx(int fd, struct st
-                         /* optional_mask=3D */ 0,
-                         /* mandatory_attributes=3D */ 0,
-                         ret);
-+        if (r =3D=3D -EUNATCH) {
-+                uint64_t mnt_id;
-+
-+                /* Kernel lacks STATX_MNT_ID; fall back to /proc/self/fdi=
nfo. */
-+                r =3D xstatx(fd, /* path=3D */ NULL, /* statx_flags=3D */=
 0,
-+                           STATX_TYPE|STATX_UID|STATX_INO,
-+                           ret);
-+                if (r < 0)
-+                        return r;
-+                r =3D fd_get_mount_id(fd, &mnt_id);
-+                if (r < 0)
-+                        return r;
-+                ret->stx_mnt_id =3D mnt_id;
-+                ret->stx_mask |=3D STATX_MNT_ID;
-+        }
-+
-+        return r;
+diff --git a/src/basic/fd-util.h b/src/basic/fd-util.h
+index 86bddb6dac..34370c8943 100644
+--- a/src/basic/fd-util.h
++++ b/src/basic/fd-util.h
+@@ -188,6 +188,7 @@ static inline int dir_fd_is_root_or_cwd(int dir_fd) {
  }
 =20
- static int chase_openat2(int root_fd, int dir_fd, const char *path, Chase=
Flags chase_flags) {
+ int fds_inode_and_mount_same(int fd1, int fd2);
++int fd_get_mount_id(int fd, uint64_t *ret);
+=20
+ int resolve_xat_fdroot(int *fd, const char **path, char **ret_buffer);
+=20
diff --git a/meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b044e7784a=
30b7187f6fbd.patch b/meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b0=
44e7784a30b7187f6fbd.patch
deleted file mode 100644
index 8eb9f5c164..0000000000
--- a/meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b044e7784a30b7187=
f6fbd.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From a019396d2c5bc1adb6b044e7784a30b7187f6fbd Mon Sep 17 00:00:00 2001
-From: Luca Boccassi <luca.boccassi@gmail.com>
-Date: Wed, 2 Sep 2026 20:32:51 +0100
-Subject: [PATCH] tools: fix building manpages with lxml 6.1.3
-
-manpages build fails on Arch with new lxml:
-
-Traceback (most recent call last):
-  File "/work/src/tools/make-directive-index.py", line 169, in make_page
-    _extract_directives(directive_groups, formatting, page)
-    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-  File "/work/src/tools/make-directive-index.py", line 18, in _extract_dir=
ectives
-    t =3D xml_parse(page)
-  File "/work/src/tools/xml_helper.py", line 25, in xml_parse
-    doc =3D tree.parse(page, _parser)
-  File "src/lxml/etree.pyx", line 3717, in lxml.etree.parse
-  File "src/lxml/parser.pxi", line 2045, in lxml.etree._parseDocument
-  File "src/lxml/parser.pxi", line 2071, in lxml.etree._parseDocumentFromU=
RL
-  File "src/lxml/parser.pxi", line 1962, in lxml.etree._parseDocFromFile
-  File "src/lxml/parser.pxi", line 1231, in lxml.etree._BaseParser._parseD=
ocFromFile
-  File "src/lxml/parser.pxi", line 647, in lxml.etree._ParserContext._hand=
leParseResultDoc
-  File "src/lxml/parser.pxi", line 765, in lxml.etree._handleParseResult
-  File "src/lxml/parser.pxi", line 689, in lxml.etree._raiseParseError
-  File "../src/man/hostname.xml", line 5
-lxml.etree.XMLSyntaxError: Entity 'entities' not defined, line 5, column 1=
1
-
-The above exception was the direct cause of the following exception:
-
-Traceback (most recent call last):
-  File "/work/src/tools/make-directive-index.py", line 180, in <module>
-    _xml =3D make_page(_template_path, _xml_files)
-  File "/work/src/tools/make-directive-index.py", line 171, in make_page
-    raise ValueError('failed to process ' + page) from e
-ValueError: failed to process ../src/man/hostname.xml
-
-Relying on XMLParser() defaults leaves the external parameter entity
-used to load custom-entities.ent unresolved. Request entity resolution exp=
licitly.
-
-Follow-up for 1a13e31d275430ffba713c8a68ee7f22093c29e0
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/a0193=
96d2c5bc1adb6b044e7784a30b7187f6fbd]
-
----
- tools/xml_helper.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/xml_helper.py b/tools/xml_helper.py
-index 87c24ab02a0f..e26ca92d9454 100755
---- a/tools/xml_helper.py
-+++ b/tools/xml_helper.py
-@@ -16,7 +16,7 @@ def resolve(self, url, _id, context):
-         return None
-=20
-=20
--_parser =3D tree.XMLParser()
-+_parser =3D tree.XMLParser(resolve_entities=3DTrue)
- # pylint: disable=3Dno-member
- _parser.resolvers.add(CustomResolver())
-=20
diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-core=
/systemd/systemd_261.3.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_261.2.bb
rename to meta/recipes-core/systemd/systemd_261.3.bb
index 68b894be9a..1a256a598a 100644
--- a/meta/recipes-core/systemd/systemd_261.2.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -27,8 +27,7 @@ CONFLICT_DISTRO_FEATURES +=3D "sysvinit"
 # so that systemctl can be used in postinst scripts
 PACKAGE_WRITE_DEPS +=3D "systemd-tools-native"
=20
-SRC_URI +=3D " \
-           file://touchscreen.rules \
+SRC_URI +=3D "file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://org.freedesktop.hostname1_no_polkit.conf \
            file://00-hostnamed-network-user.conf \
@@ -37,7 +36,6 @@ SRC_URI +=3D " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-Do-not-create-var-log-README.patch \
-           file://a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch \
            "
=20
 PAM_PLUGINS =3D " \

