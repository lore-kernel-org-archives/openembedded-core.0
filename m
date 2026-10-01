Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8F1CA5FC5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 07:50:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6175.1790841048643880662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 00:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=moxLh+Wy;
 spf=pass (domain: est.tech, ip: 52.101.84.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQzjuiQ7kPe90LsIEmfEmetAiabxOMGbd2gaHqehcsj9J8+gLBAuqTVLTG5fxitstzLC1bTEHtGu3RU65mcqXAJhs0XNTvQAAnI1jOr/xwtVC8n4gvPLQa1gEIRoA+/c2HeKrzaYyv6ZMEHjyrp17TXy6295wpobD8VA+N7PMgUe43DH3Ep6WxL+UeCSlaeZcpepxISLuys/jNpknZ/NfD2u+PMY6f4+o4mCSDttemdk3zwygIVPhUwnfA6jM2QOvNApfDO5+DqTX8bFrhF0MaVgidaxgsk7pdNlVRS1Ve4ZlNN42fbdY+HutBDJYlqEF9z1hEAPMfmmSAJY6PWIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjNKb2UOneL5fKtMlsuric+wZm0HSRdJPc46QckLre8=;
 b=reJcK6eMmMGg+nQcd/7OzvvHwGKjZxLWL3lBQbcjV2EXV2oKy4r6vkOHJEUZ3HdaDH2CWKmxPLNRxtCjV3+orbkNkt0U/LnD/nj4CbLVFQx5Clnhh0WIhqbyKBmH4h2j7WH27GKZnkLhSNBiZQLzdezkpRXoB5XcvRbjRA6klcbdiTZWEt02VvF27xfbS0vERzx3b8CYMYYOfHefB2umX9yaaW6cD6CQwKoe6kh5hl6GA4LbVUO8wizi6ETZTU3mJVFbb5fIGhfpgCjJIZW2qp5+5bbVdCZ4ybjRar4Ou8m8z8kyVxgk1gUHXhUksP47H5IvsYk13Nth+kdu7N7E2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjNKb2UOneL5fKtMlsuric+wZm0HSRdJPc46QckLre8=;
 b=moxLh+Wy70/3gIiSvmpKmNtyWARVOASueLLr/IqdMyN4h+732QOiiSj0y02IhMAZUgbDh4HV58sNTlXW1AjympjvVNsgMQxi6cz/qdVKNz2EQmAsaYTuSewJsmC+/B7Agx8uhiE16EaX6VAwSeFnIbdWkUdkJd6rhkKEGt9NOsUeWWPEMlvMvIaNJhdkPVE+zAzvjtXklhbSqKgQvj6Wmp6uoEc+zW2+aMFwWBFzp6CTUsJ8oEjasQKpJMdt7sr6Aq/PdrJyBWt5QOgoBzhNHs07b7aHtwtRTVOTfFUATPLwFqwwAzDFL+5w/k0I2Ccv0MN6O5ry2Ble5FtdjgltkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by MIWP189MB305102.EURP189.PROD.OUTLOOK.COM (2603:10a6:290:d5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 07:50:43 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 07:50:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] systemd: Upgrade 261.3 -> 262
Date: Thu,  1 Oct 2026 09:50:39 +0200
Message-ID: <20261001075039.4339-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
References: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0469.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|MIWP189MB305102:EE_
X-MS-Office365-Filtering-Correlation-Id: bebeae19-10f5-4eb2-e247-08df1f90b0bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|260925021911599003|260925021311599003|260925022911599003|10067099003|56012099006|6133799003|3023799007|11063799006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	v23e+nefm6lQQyauunlpAawllgAGngekka98prlFc9UPDx2DvF4czrTJ1Q5xFCNWPg7XF+9QsSKfNVChZqW8Cilz0E9vEbKxr6yudJmFJku8/hysFczGEgWabnOzTTxyQOds9M2yfrDnv6M9tuVz2HY+HB0AS6EH8gycRXNeOLlx+pcA1pwMchUuzIvThBJlFnozlkbwzmESK1rzt4JnPzJV+qS98jDkeP8VaHieLOAYjdY1wAnzgsRj+pYVnqPPg0IbHEjPLTWE2lPDS/8/cYdC2tY8P/T6oCNITkp5bPC0KDDYkiF6zfvb03f/iL9R0LWBnC0vSiqVETr96epZuEcYC8YrVGDnhvxInN+xTBFwmqLl2ZEPhIPqPgPY7cCGlTEy19GmEGzrduwkDzcAc853G0nrvdnLkRSY+VU1dzKrMKiUJDx8FLpafuiPAskCepCqKLRWfCXu3aoUIdkT+F/MKmbckA6CbvJcb1/TCsbyf3GnTt4PkPp5+1q8iirSw7S4Fn9/J/VmO6oX7hntwaWk/AqLi6q1e7Y2lM28myr1CtX5o7+YWETzIT3rmGR1bcfyYSF9jME4pnXZSMQ3vu7L/EyiyPJuaB/JEF6DjNKxCpRP08u8PVLV7+74K5xf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(56012099006)(6133799003)(3023799007)(11063799006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1YuqFetGn8D/yJS5HqueI2Lh8qHE+nVvnJYg3Q85PCCuINzCewfLsxxshAnN?=
 =?us-ascii?Q?yT7l1NlqciA8p1/rZKiuAAEH7batr8a6qAglo8F8nreXqGCC5vOzN50ggrVQ?=
 =?us-ascii?Q?oaWlJxxDleU0qjtvKFh/nEcdvcvv0eD1RDFinDvf9D9BukoMENbGhDuGvNlt?=
 =?us-ascii?Q?x0lm7xkbWaCy9qneGHxfJqGofrXt0DDb4lm7F+KP46QYhWtDyt4E7KuMxKhg?=
 =?us-ascii?Q?8eBrSIpI8qn6RAtWQaIDHEay5dpY9pyXEwUR8sTQMjajpKnsziHPpZRJqt7W?=
 =?us-ascii?Q?2XDrnfUxiIvF8m3tkjuxCuGW4IvX2I6hEPrsVmwAnuNAOfg9yickm0iE80OY?=
 =?us-ascii?Q?RbNO1DJ1r7jW1gM5e/acV51BqGHQ7ujaG6mfg9GenOF97TDjVzaRLz289PoB?=
 =?us-ascii?Q?5ltwCUJIvpbEjoqR+sjXvUK4lzj7kILUJ5ctIhNhTDFuG62H2K9e2wdkr+1I?=
 =?us-ascii?Q?pmzofmV/vjlbnH+SuqS8Ccx364MJzKmrHdIdwHLTlhTSOaTWfCBYgIDXFZJ8?=
 =?us-ascii?Q?urPXHwqaLw3Azn7qhVhYv0XlE2JoKLNUj1Qg99pSbHgDX2vE/XKqTDsjDivo?=
 =?us-ascii?Q?9OH0fZjBWjOsiYQK3z1/Cl3+xNZH00JwyNkiE/k5RHOKoSVt/Exlzt4FckGQ?=
 =?us-ascii?Q?Rn1M0I79aShyU9JnaYK6ZNiQ8ybnmx5wNmdKY4e/eAkUOdt4h4kPEMRFTHTE?=
 =?us-ascii?Q?bOTm7gR/g6PnLCVbufkX11wJp7/i6eny1V/n0FObKhXNS5ljrBwKkiROVADo?=
 =?us-ascii?Q?JbY1SxZnYRccY1Oyd+BB41RUbGTsthj4auwof1Rorhgvp98HgsM5MoAv/dec?=
 =?us-ascii?Q?3Mo2hnjtzuczmsubJc3rXy5tE88yK2tP2KCiEEo/dD0avrC9fX+f/tWpLY0d?=
 =?us-ascii?Q?NdzF8SkEEMfAFrYlH+BbEkfMs2M44/iYXtegePhZKFrtM2OJEFcD3icOu8fe?=
 =?us-ascii?Q?FCSZsLNPIgCvTU/3B0NZfKJvHJw38IXOVPydUVcCGr1gdIA+e5I7tBObxaUl?=
 =?us-ascii?Q?tqM52pQMZtyClxplHOL/86oucqS157FBoOGbLSJExGZXDVmtqwSlf0UKZH66?=
 =?us-ascii?Q?BbnSK46+t/IdLqoLQC3heZX90aW+zge3OQJ1XDEeYsfnnhBoP4VLiGVOm0Sg?=
 =?us-ascii?Q?bt+d1c3YdROfwabbLsYLxYqDgLHWfUhpK+BEuYGvTPhW+RUOO+PMnWjhfJem?=
 =?us-ascii?Q?0V7pOjjd4EI/9i8R0EXrRAm2KK9Zmfaej4mDFCPYw0pMnZTlnDpPvneT9FKE?=
 =?us-ascii?Q?80pjUSrvTkDznUgqctIYjdaneixIeidU+ZKI7RXZqJcbIxBHW+Mvm2g6C44K?=
 =?us-ascii?Q?949GdGz9sppnlXMhjyVAle2phT1oHrcURrD/F6K/DRNM2M0pob5nRtueXfpk?=
 =?us-ascii?Q?9ADPVyMmtGraP+CJDikJO98+CgvJWYUPMTOKt1oXzwPLsI9ehZAn4HvmA0WF?=
 =?us-ascii?Q?bRXlVPZJ8daY1A9gEESx2T77dBbVGKNKyHOv8BXFlmIa/hrH+4+0yqb2RwzA?=
 =?us-ascii?Q?Tg/C1j4LchIfTf/e/kLMdu0v3i6TZoDAQ8/rJ0gb5xRhZxal+nHqbIfeD9g3?=
 =?us-ascii?Q?e3BBhTS0VjbHYhuSPU4noAzajOWo00lPTn/sEiZv47cpyKDGZnStC8ezWIIt?=
 =?us-ascii?Q?Kl0lwpa0UuX4O9atgrdzH6nKFDbWAuTUf1bwYaFdLd5nfGkNXBuai01RN9JI?=
 =?us-ascii?Q?Me5uWGJBlQKi1OVjJSXzz+nUvhiP5fsDf97frK9k9qXcDPVj4HAYz7ykB1uU?=
 =?us-ascii?Q?83NLSrQ37w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bebeae19-10f5-4eb2-e247-08df1f90b0bf
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 07:50:41.2495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6ipo04vByw8c4li2fbJV/3WAhU047Ak48BBSaHeN2BuzIpyA/u4mJqZkIZriG/h593tSOD3Fxd95SnEJJnmyN3x29Qe0R0ATs4PCtVfI4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWP189MB305102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 07:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247015

NEWS: https://github.com/systemd/systemd/blob/v262-stable/NEWS#L3-L877

- Refresh patches for v262
- Drop deprecated meson build options [1]
- Drop 0001-include-fix-limits.h-override.patch [2]
- Add rules: install 60-persistent-media-controller.rules [3]
- Gate systemd-coredumpd.service on kernel >=3D 6.19

  262's systemd-coredumpd.service needs PIDFD_INFO_COREDUMP_SIGNAL (Linux
  6.19); on older kernels its ExecCondition fails and the unit flaps into
  start-limit-hit, failing test_systemd_failed on qemu*-alt (6.18). Add a
  ConditionKernelVersion=3D>=3D6.19 drop-in so it is skipped on 6.18 and ac=
tive
  on 7.2. Upstream report: [4]

[1] https://github.com/systemd/systemd/blob/v262-stable/NEWS#L41
[2] https://github.com/systemd/systemd/commit/6a131b32e0fe948e845ae4bf41f8f=
ed003ec30ce
[3] https://github.com/systemd/systemd/commit/d153b49473
[4] https://github.com/systemd/systemd/issues/43963

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v2:
   - Add conditional kernel version for systemd-coredumpd.service

Changes since v1:
   - Drop 0001-include-fix-limits.h-override.patch

 ...ve_261.3.bb =3D> systemd-boot-native_262.bb} |  0
 ...temd-boot_261.3.bb =3D> systemd-boot_262.bb} |  0
 ...e_261.3.bb =3D> systemd-tools-native_262.bb} |  3 -
 meta/recipes-core/systemd/systemd.inc         |  4 +-
 ...tall-dependency-links-at-install-tim.patch |  8 +-
 .../0001-include-fix-limits.h-override.patch  | 74 -------------------
 .../0003-Do-not-create-var-log-README.patch   |  2 +-
 .../systemd/coredumpd-kernel-version.conf     | 14 ++++
 .../{systemd_261.3.bb =3D> systemd_262.bb}      | 13 +++-
 9 files changed, 32 insertions(+), 86 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_261.3.bb =3D> system=
d-boot-native_262.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_261.3.bb =3D> systemd-boot_=
262.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_261.3.bb =3D> syste=
md-tools-native_262.bb} (93%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-include-fix-limi=
ts.h-override.patch
 create mode 100644 meta/recipes-core/systemd/systemd/coredumpd-kernel-vers=
ion.conf
 rename meta/recipes-core/systemd/{systemd_261.3.bb =3D> systemd_262.bb} (9=
8%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_261.3.bb b/meta/=
recipes-core/systemd/systemd-boot-native_262.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_261.3.bb
rename to meta/recipes-core/systemd/systemd-boot-native_262.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_261.3.bb b/meta/recipes=
-core/systemd/systemd-boot_262.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_261.3.bb
rename to meta/recipes-core/systemd/systemd-boot_262.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_261.3.bb b/meta=
/recipes-core/systemd/systemd-tools-native_262.bb
similarity index 93%
rename from meta/recipes-core/systemd/systemd-tools-native_261.3.bb
rename to meta/recipes-core/systemd/systemd-tools-native_262.bb
index bffaf5a2f08..359bc972ccf 100644
--- a/meta/recipes-core/systemd/systemd-tools-native_261.3.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_262.bb
@@ -18,9 +18,6 @@ EXTRA_OEMESON +=3D "--auto-features disabled"
 # Link the binaries statically as we don't install libsystemd-shared.so
 EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse -Dlink-udev-shared=3Df=
alse"
=20
-# Ensure unused build paths are not in the binary
-EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
-
 # Target-absolute paths that satisfy both tools from one meson configure:
 #  - systemd-hwdb needs prefix=3D/usr so the compiled-in UDEVLIBEXECDIR
 #    (/usr/lib/udev) matches the target rootfs layout, letting
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index 3ee898958fd..5ea45a78b2d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,8 +15,8 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e6e=
72d2c6 \
                     file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420a0=
07368f2"
=20
-SRCREV =3D "3255daee1572366b74fe92f002a3d60ecbb27103"
-SRCBRANCH =3D "v261-stable"
+SRCREV =3D "8cc40e0c5e9234bf45084751ac53b1fbfe70b492"
+SRCBRANCH =3D "v262-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH};tag=3Dv${PV}"
=20
 CVE_PRODUCT =3D "systemd"
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-de=
pendency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/000=
1-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index b83803aa08e..0b9eb4ac3cc 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependenc=
y-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependenc=
y-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 451af4755f0c1da552498682d910f4f4c5209639 Mon Sep 17 00:00:00 2001
+From 4793a67d3d738520f0193a9edff491989e8d77bc Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time fo=
r
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 7 insertions(+), 2 deletions(-)
=20
 diff --git a/units/meson.build b/units/meson.build
-index 27d8ef2f72..864caa44bb 100644
+index 9f8f8d0e41..9a74236690 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -168,7 +168,6 @@ units =3D [
+@@ -172,7 +172,6 @@ units =3D [
          {
            'file' : 'proc-sys-fs-binfmt_misc.automount',
            'conditions' : ['ENABLE_BINFMT'],
@@ -36,7 +36,7 @@ index 27d8ef2f72..864caa44bb 100644
          },
          {
            'file' : 'proc-sys-fs-binfmt_misc.mount',
-@@ -279,7 +278,6 @@ units =3D [
+@@ -283,7 +282,6 @@ units =3D [
          {
            'file' : 'systemd-binfmt.service.in',
            'conditions' : ['ENABLE_BINFMT'],
diff --git a/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-ov=
erride.patch b/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-=
override.patch
deleted file mode 100644
index d11a5fe3f82..00000000000
--- a/meta/recipes-core/systemd/systemd/0001-include-fix-limits.h-override.=
patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 6a131b32e0fe948e845ae4bf41f8fed003ec30ce Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Tue, 22 Sep 2026 01:55:01 +0900
-Subject: [PATCH] include: fix limits.h override
-
-This is especially necessary since GCC 16.x.
-
-=3D=3D=3D=3D=3D
-$ gcc --version
-gcc (GCC) 16.2.1 20260819 (Red Hat 16.2.1-2)
-Copyright (C) 2026 Free Software Foundation, Inc.
-This is free software; see the source for copying conditions.  There is NO
-warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.
-=3D=3D=3D=3D=3D
-
-Without this change, /usr/include/limits.h is not included, hence POSIX
-constants are not defined:
-=3D=3D=3D=3D=3D
-$ echo '#include <limits.h>' | gcc -E -H -isystem ~/git/systemd/src/includ=
e/musl - 2>&1 >/dev/null | grep '^\..*limit'
-. /home/watanabe/git/systemd/src/include/musl/limits.h
-.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
-... /usr/lib/gcc/x86_64-redhat-linux/16/include/syslimits.h
-=3D=3D=3D=3D=3D
-
-With this change, /usr/include/limits.h is included, thus POSIX
-constants are defined:
-=3D=3D=3D=3D=3D
-$ echo '#include <limits.h>' | gcc -E -H -isystem ~/git/systemd/src/includ=
e/musl - 2>&1 >/dev/null | grep '^\..*limit'
-. /home/watanabe/git/systemd/src/include/musl/limits.h
-.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
-... /usr/include/limits.h
-...... /usr/include/linux/limits.h
-.. /usr/lib/gcc/x86_64-redhat-linux/16/include/limits.h
-=3D=3D=3D=3D=3D
-
-Replaces #43824.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/43831]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/include/musl/limits.h | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/src/include/musl/limits.h b/src/include/musl/limits.h
-index 9620a3b0ac..bcc585be2c 100644
---- a/src/include/musl/limits.h
-+++ b/src/include/musl/limits.h
-@@ -1,6 +1,26 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- #pragma once
-=20
-+/* GCC introduces a spurious, tricky inclusion cycle:
-+ *    GCC's limits.h
-+ *      -> GCC's syslimits.h
-+ *         -> GCC's limits.h (again!!!)
-+ *            -> glibc/musl's limits.h
-+ *               -> define POSIX defines
-+ *      -> define ISO C defines
-+ * This works only when GCC's limits.h is included first, but a user over=
ride breaks the cycle. Hence, we
-+ * need to manually achieve the cycle here. If GCC is not used (e.g., Cla=
ng), then including the compiler's
-+ * limits.h twice should be redundant but harmless. */
-+
-+/* First, get the POSIX defines from glibc/musl's limits.h. When the two =
macros below are defined, GCC's
-+ * limits.h includes the next limits.h, that is, one from glibc/musl. */
-+#define _GCC_LIMITS_H_
-+#define _GCC_NEXT_LIMITS_H
-+#include_next <limits.h>        /* IWYU pragma: export */
-+#undef _GCC_NEXT_LIMITS_H
-+#undef _GCC_LIMITS_H_
-+
-+/* Next, get the ISO C defines from GCC's limits.h. */
- #include_next <limits.h>        /* IWYU pragma: export */
-=20
- #include <assert.h>
diff --git a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-R=
EADME.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-=
README.patch
index 175ec7955bd..c64bfa82491 100644
--- a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
@@ -1,4 +1,4 @@
-From 0d4a5976056387ff3801fdb7f53e6d0760df0475 Mon Sep 17 00:00:00 2001
+From e36f6fc852f8331791f391a216885b9bea543aff Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 21 Jan 2025 05:02:00 +0100
 Subject: [PATCH] Do not create /var/log/README
diff --git a/meta/recipes-core/systemd/systemd/coredumpd-kernel-version.con=
f b/meta/recipes-core/systemd/systemd/coredumpd-kernel-version.conf
new file mode 100644
index 00000000000..dcc23825f42
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/coredumpd-kernel-version.conf
@@ -0,0 +1,14 @@
+# systemd 262's kernel coredump socket manager (systemd-coredumpd.service)
+# requires the PIDFD_INFO_COREDUMP_SIGNAL pidfd flag, added in Linux 6.19
+# (PIDFD_INFO_COREDUMP itself is from 6.16). Its ExecCondition
+# (systemd-coredump --check-requirements) fails on older kernels, and comb=
ined
+# with Restart=3Don-failure and the Upholds=3D relationship the unit flaps=
 into
+# start-limit-hit instead of being skipped, which fails the systemd runtim=
e
+# tests. OE-Core ships both linux-yocto 6.18 (< 6.19) and 7.2 (>=3D 6.19),=
 so
+# gate activation on the kernel version at runtime: this keeps coredumpd a=
ctive
+# on 7.2 while cleanly skipping it on 6.18. A ConditionKernelVersion=3D fa=
ilure is
+# a clean skip and does not trigger the restart/start-limit escalation.
+# The per-coredump systemd-coredump@.service path remains available on all=
 kernels.
+# Upstream report: https://github.com/systemd/systemd/issues/43963
+[Unit]
+ConditionKernelVersion=3D>=3D6.19
diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-core=
/systemd/systemd_262.bb
similarity index 98%
rename from meta/recipes-core/systemd/systemd_261.3.bb
rename to meta/recipes-core/systemd/systemd_262.bb
index 0901736e7c9..d613f01c582 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -34,9 +34,9 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://init \
            file://99-default.preset \
            file://systemd-pager.sh \
+           file://coredumpd-kernel-version.conf \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-Do-not-create-var-log-README.patch \
-           file://0001-include-fix-limits.h-override.patch \
            "
=20
 PAM_PLUGINS =3D " \
@@ -144,7 +144,6 @@ PACKAGECONFIG[journal-color] =3D ",,,less"
 PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Denabled,-Dlibcurl=3Ddisable=
d,curl"
 PACKAGECONFIG[kmod] =3D "-Dkmod=3Denabled,-Dkmod=3Ddisabled,kmod,libkmod"
 PACKAGECONFIG[ldconfig] =3D "-Dldconfig=3Dtrue,-Dldconfig=3Dfalse,,ldconfi=
g"
-PACKAGECONFIG[libidn] =3D "-Dlibidn=3Denabled,-Dlibidn=3Ddisabled,libidn"
 PACKAGECONFIG[libidn2] =3D "-Dlibidn2=3Denabled,-Dlibidn2=3Ddisabled,libid=
n2"
 # Link udev shared with systemd helper library.
 # If enabled the udev package depends on the systemd package (which has th=
e needed shared library).
@@ -355,6 +354,15 @@ do_install() {
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
 	install -Dm 0644 ${UNPACKDIR}/99-default.preset ${D}${systemd_unitdir}/sy=
stem-preset/99-default.preset
=20
+	# Gate the new (v262) kernel coredump socket manager on a kernel
+	# that actually supports it (>=3D 6.19). See the drop-in for the full rat=
ionale.
+	if [ -e ${D}${systemd_system_unitdir}/systemd-coredumpd.service ]; then
+		install -Dm 0644 ${UNPACKDIR}/coredumpd-kernel-version.conf \
+			${D}${systemd_system_unitdir}/systemd-coredumpd.service.d/99-kernel-ver=
sion.conf
+		install -Dm 0644 ${UNPACKDIR}/coredumpd-kernel-version.conf \
+			${D}${systemd_system_unitdir}/systemd-coredump-register.service.d/99-ke=
rnel-version.conf
+	fi
+
 	# add a profile fragment to disable systemd pager with busybox less
 	install -Dm 0644 ${UNPACKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.=
d/systemd-pager.sh
=20
@@ -799,6 +807,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
                ${nonarch_libdir}/udev/rules.d/60-persistent-alsa.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-hidraw.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-input.rules \
+               ${nonarch_libdir}/udev/rules.d/60-persistent-media-controll=
er.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage.rules =
\
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-mtd.ru=
les \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-tape.r=
ules \

