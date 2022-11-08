Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCE4C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 00:09:06 +0000 (UTC)
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net [83.102.40.154])
 by mx.groups.io with SMTP id smtpd.web09.2313.1667866138585853107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 16:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: parse error for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 83.102.40.154, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 489A71684E;
	Tue,  8 Nov 2022 02:08:56 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id ffAQu6-It5tn; Tue,  8 Nov 2022 02:08:56 +0200 (EET)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 060851684B;
	Tue,  8 Nov 2022 02:08:56 +0200 (EET)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id DAA5E3FE0;
	Tue,  8 Nov 2022 02:08:53 +0200 (EET)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [RFC PATCH 1/3] Try to ensure 64 bit time on 32 bit glibcful hosts
Date: Tue,  8 Nov 2022 02:08:26 +0200
Message-Id: <20221108000828.42824-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 00:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172939

Add default C Preprocessor flags that ensure Y2038 compatible 64 bit
time on 32 bit host applications when glibc is used. Prerequisites
are glibc version 2.34 or newer and Linux kernel version 5.1 or newer.

Example of impact on 32 bit 'qemuarm' machine running
core-image-minimal. Before this change:

  root@qemuarm:~# /bin/busybox date
  Sun Nov  6 06:09:39 UTC 2022
  root@qemuarm:~# /sbin/hwclock.util-linux -w
  root@qemuarm:~# /sbin/hwclock.util-linux
  2022-11-06 06:09:49.994249+00:00
  root@qemuarm:~# /bin/busybox date -s 2040-01-01
  date: invalid date '2040-01-01'
  root@qemuarm:~# /bin/date.coreutils -s 2040-01-01
  Sun Jan  1 00:00:00 UTC 2040
  root@qemuarm:~# /sbin/hwclock.util-linux -w
  root@qemuarm:~# /sbin/hwclock.util-linux
  1931-03-04 06:26:23.000000+00:00
  root@qemuarm:~#

After this change:

  root@qemuarm:~# /bin/busybox date
  Sun Nov  6 06:02:20 UTC 2022
  root@qemuarm:~# /sbin/hwclock.util-linux -w
  root@qemuarm:~# /sbin/hwclock.util-linux
  2022-11-06 06:02:27.989730+00:00
  root@qemuarm:~# /bin/busybox date -s 2040-01-01
  Sun Jan  1 00:00:00 UTC 2040
  root@qemuarm:~# /sbin/hwclock.util-linux -w
  root@qemuarm:~# /sbin/hwclock.util-linux
  2040-01-01 00:00:20.992954+00:00
  root@qemuarm:~#

From here on, the adding of new flags can be disabled on recipe or
global level by resetting the value of associated variable containing
the CPPFLAGS specific for 64 bit time

  GLIBC_64BIT_TIME_CPPFLAGS =3D ""

which can be useful e.g. when working around failure to compile a
component due to lack of 64 bit time support on 32 bit build in the
component's source code.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/distro/include/tclibc-glibc.inc        | 3 +++
 meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb | 2 ++
 meta/recipes-devtools/pseudo/pseudo_git.bb       | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro=
/include/tclibc-glibc.inc
index f48d16939e..95770298e9 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -17,6 +17,9 @@ PREFERRED_PROVIDER_virtual/crypt ?=3D "libxcrypt"
=20
 CXXFLAGS +=3D "-fvisibility-inlines-hidden"
=20
+GLIBC_64BIT_TIME_CPPFLAGS =3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D6=
4"
+TARGET_CPPFLAGS +=3D "${GLIBC_64BIT_TIME_CPPFLAGS}"
+
 LIBC_DEPENDENCIES =3D "\
 		     glibc \
 		     glibc-dbg \
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_12.2.bb
index 8bda2ccad6..b3fafa0ea4 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
@@ -5,3 +5,5 @@ require gcc-sanitizers.inc
 # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8=
'
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
 ARM_INSTRUCTION_SET:armv5 =3D "arm"
+
+GLIBC_64BIT_TIME_CPPFLAGS =3D ""
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
index c34580b4ff..7734d0fbb0 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -19,3 +19,5 @@ PV =3D "1.9.0+git${SRCPV}"
=20
 # error: use of undeclared identifier '_STAT_VER'
 COMPATIBLE_HOST:libc-musl =3D 'null'
+
+GLIBC_64BIT_TIME_CPPFLAGS =3D ""
--=20
2.36.1


