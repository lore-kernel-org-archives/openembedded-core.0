Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5547EEB64DB
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 12:34:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9139.1687264448017413444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 05:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EF5D12FC;
	Tue, 20 Jun 2023 05:34:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 279123F71E;
	Tue, 20 Jun 2023 05:34:07 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] sysfsutils: update 2.1.0 -> 2.1.1
Date: Tue, 20 Jun 2023 13:34:03 +0100
Message-Id: <20230620123404.3854578-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620123404.3854578-1-ross.burton@arm.com>
References: <20230620123404.3854578-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 12:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183134

From: Alexander Kanavin <alex.kanavin@gmail.com>

Drop all patches, as issues are all fixed upstream.

License-Update: clarification that GPL applies to all executables
(not just test), formatting.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../obsolete_automake_macros.patch            | 15 -----
 .../sysfsutils-2.1.0/separatebuild.patch      | 65 -------------------
 .../sysfsutils-2.0.0-class-dup.patch          | 23 -------
 ...ysfsutils_2.1.0.bb =3D> sysfsutils_2.1.1.bb} | 14 ++--
 4 files changed, 5 insertions(+), 112 deletions(-)
 delete mode 100644 meta/recipes-core/sysfsutils/sysfsutils-2.1.0/obsolet=
e_automake_macros.patch
 delete mode 100644 meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separat=
ebuild.patch
 delete mode 100644 meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsut=
ils-2.0.0-class-dup.patch
 rename meta/recipes-core/sysfsutils/{sysfsutils_2.1.0.bb =3D> sysfsutils=
_2.1.1.bb} (55%)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/obsolete_autom=
ake_macros.patch b/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/obsolete=
_automake_macros.patch
deleted file mode 100644
index 9d828d7026e..00000000000
--- a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/obsolete_automake_mac=
ros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [http://sourceforge.net/tracker/?func=3Ddetai=
l&aid=3D3600345&group_id=3D44427&atid=3D439544]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd sysfsutils-2.1.0/configure.ac sysfsutils-2.1.0/configure.ac
---- sysfsutils-2.1.0/configure.ac	2006-08-07 08:08:00.000000000 +0300
-+++ sysfsutils-2.1.0/configure.ac	2013-01-11 08:13:08.651550634 +0200
-@@ -2,7 +2,7 @@
- AC_INIT(sysfsutils, 2.1.0, linux-diag-devel@lists.sourceforge.net)
- AM_INIT_AUTOMAKE
- AC_CONFIG_SRCDIR([config.h.in])
--AM_CONFIG_HEADER([config.h])
-+AC_CONFIG_HEADERS([config.h])
-
- # Checks for KLIBC support (should be before AC_PROG_LIBTOOL and AC_PRO=
G_CC)
- AC_CHECK_KLIBC
diff --git a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.=
patch b/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.patch
deleted file mode 100644
index 82e725e2aca..00000000000
--- a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Pending
-
-Fix out of tree build issues so ${B} !=3D ${S} works.
-
-RP 2013/03/18
-
-Index: sysfsutils-2.1.0/cmd/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- sysfsutils-2.1.0.orig/cmd/Makefile.am	2013-03-08 08:57:27.224556508 =
+0000
-+++ sysfsutils-2.1.0/cmd/Makefile.am	2013-03-08 08:57:27.480556502 +0000
-@@ -1,6 +1,6 @@
- bin_PROGRAMS =3D systool=20
- systool_SOURCES =3D systool.c names.c names.h
--INCLUDES =3D -I../include
-+INCLUDES =3D -I$(srcdir)/../include
- LDADD =3D ../lib/libsysfs.la
- EXTRA_CFLAGS =3D @EXTRA_CFLAGS@
- AM_CFLAGS =3D -Wall -W -Wstrict-prototypes $(EXTRA_CFLAGS)
-Index: sysfsutils-2.1.0/lib/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- sysfsutils-2.1.0.orig/lib/Makefile.am	2013-03-08 08:57:27.224556508 =
+0000
-+++ sysfsutils-2.1.0/lib/Makefile.am	2013-03-08 08:57:27.480556502 +0000
-@@ -1,7 +1,7 @@
- lib_LTLIBRARIES =3D libsysfs.la
- libsysfs_la_SOURCES =3D sysfs_utils.c sysfs_attr.c sysfs_class.c dlist.=
c \
-       sysfs_device.c sysfs_driver.c sysfs_bus.c sysfs_module.c sysfs.h
--INCLUDES =3D -I../include
-+INCLUDES =3D -I$(srcdir)/../include
- libsysfs_la_LDFLAGS =3D -version-info 2:1:0
- EXTRA_CFLAGS =3D @EXTRA_CLFAGS@
- libsysfs_la_CFLAGS =3D -Wall -W -Wstrict-prototypes $(EXTRA_CLFAGS)
-Index: sysfsutils-2.1.0/test/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- sysfsutils-2.1.0.orig/test/Makefile.am	2013-03-08 08:57:27.224556508=
 +0000
-+++ sysfsutils-2.1.0/test/Makefile.am	2013-03-08 09:06:48.196543326 +000=
0
-@@ -2,14 +2,14 @@
- BUILT_SOURCES =3D test.h
- CLEANFILES =3D test.h
- test.h:
--	./create-test
-+	$(srcdir)/create-test $(srcdir)/libsysfs.conf
- get_device_SOURCES =3D get_device.c
- get_driver_SOURCES =3D get_driver.c
- get_module_SOURCES =3D get_module.c
- testlibsysfs_SOURCES =3D test.c test_attr.c test_bus.c test_class.c \
- 		       test_device.c test_driver.c test_module.c test_utils.c \
- 		       testout.c test-defs.h libsysfs.conf create-test
--INCLUDES =3D -I../include
-+INCLUDES =3D -I$(srcdir)/../include
- LDADD =3D ../lib/libsysfs.la
- EXTRA_CFLAGS =3D @EXTRA_CLFAGS@
- AM_CFLAGS =3D -Wall -W -Wstrict-prototypes $(EXTRA_CLFAGS)
-Index: sysfsutils-2.1.0/test/create-test
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- sysfsutils-2.1.0.orig/test/create-test	2005-11-28 10:22:10.000000000=
 +0000
-+++ sysfsutils-2.1.0/test/create-test	2013-03-08 09:07:03.372542838 +000=
0
-@@ -2,7 +2,7 @@
-=20
- rm -f test.h
-=20
--conf_file=3D./libsysfs.conf
-+conf_file=3D$1
-=20
- . $conf_file
-=20
diff --git a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsutils-2.0=
.0-class-dup.patch b/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsu=
tils-2.0.0-class-dup.patch
deleted file mode 100644
index 1a35b7897a7..00000000000
--- a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsutils-2.0.0-clas=
s-dup.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Backport [from fedora core 9]
-
-This patch is from the Fedora Core 9 sysfsutils-2.1.0-3.fc9 package.
-
-It fixes a problem in the upstream package where not all devices=20
-will be returned by the function.
-
-The package License indicates this is GPLv2 licensed.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -puN lib/sysfs_class.c~sysfsutils_class_dup lib/sysfs_class.c
---- sysfsutils-2.1.0/lib/sysfs_class.c~sysfsutils_class_dup	2006-09-07 1=
7:01:26.000000000 -0500
-+++ sysfsutils-2.1.0-bjking1/lib/sysfs_class.c	2006-09-07 17:01:26.00000=
0000 -0500
-@@ -66,7 +66,7 @@ static int cdev_name_equal(void *a, void
- 		return 0;
-=20
- 	if (strncmp((char *)a, ((struct sysfs_class_device *)b)->name,
--				strlen((char *)a)) =3D=3D 0)
-+				SYSFS_NAME_LEN) =3D=3D 0)
- 		return 1;
-=20
- 	return 0;
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/reci=
pes-core/sysfsutils/sysfsutils_2.1.1.bb
similarity index 55%
rename from meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
rename to meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
index fd72cf41659..64a6cc26d33 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
@@ -5,17 +5,13 @@ HOMEPAGE =3D "http://linux-diag.sourceforge.net/Sysfsut=
ils.html"
 LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
 LICENSE:${PN} =3D "GPL-2.0-only"
 LICENSE:libsysfs =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3d06403ea54c7574a9e581c6478cc=
393 \
-                    file://cmd/GPL;md5=3Dd41d4e2e1e108554e0388ea4aecd8d2=
7 \
-                    file://lib/LGPL;md5=3Db75d069791103ffe1c0d6435deeff7=
2e"
-PR =3D "r5"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcc19fa9307a50017fca61423a7d9=
754 \
+                    file://cmd/GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 \
+                    file://lib/LGPL;md5=3D4fbd65380cdd255951079008b36451=
6c"
=20
-SRC_URI =3D "git://github.com/linux-ras/sysfsutils.git;protocol=3Dhttps;=
branch=3Dmaster \
-           file://sysfsutils-2.0.0-class-dup.patch \
-           file://obsolete_automake_macros.patch \
-           file://separatebuild.patch"
+SRC_URI =3D "git://github.com/linux-ras/sysfsutils.git;protocol=3Dhttps;=
branch=3Dmaster"
=20
-SRCREV =3D "0d5456e1c9d969cdad6accef2ae2d4881d5db085"
+SRCREV =3D "da2f1f8500c0af6663a56ce2bff07f67e60a92e0"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


