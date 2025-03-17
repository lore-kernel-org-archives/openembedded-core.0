Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97950C35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 15:12:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.55027.1742224341588975955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 08:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9E3913D5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 08:12:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B1E6C3F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 08:12:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libcap: recipe cleanup
Date: Mon, 17 Mar 2025 15:12:13 +0000
Message-ID: <20250317151216.3484052-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 15:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213106

Drop 0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch,
fixed upstream in "libcap: Fix for older kernels"[1].

Drop 0002-tests-do-not-run-target-executables.patch, doesn't appear to
be needed anymore and most likely resolved by "Don't build the
tests/binaries until we want to run them"[2].

There's no need to set PACKAGECONFIG:class-native as we disable PAM in
the native DISTRO_FEATURES.

The recipe LICENSE needs to reflect the _source_ license, so it can't
be controlled by PACKAGECONFIG. Also update the license to reflect the
actual licensing.

No need to set COPTS, since "Canonicalize build system"[3] the exported
CFLAGS/CPPFLAGS/LDFLAGS are respected.

Merge multiple make arguments into EXTRA_OEMAKE to remove duplication.

SYSTEM_HEADERS is not used upstream, remove.

Remove redundant FILES:PN-dev, this is part of the default.

[1] f1c3ac995d02d4f17b9d15656ab6d58f4c87435a
[2] 99799844ad9272d43892881d1090369e6032aec2
[3] 2762c2c1a8c98d9012fcd40f20d133493a0b3219

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ..._NAME_CAPS-is-defined-when-it-is-use.patch | 35 -------------------
 ...-tests-do-not-run-target-executables.patch | 29 ---------------
 meta/recipes-support/libcap/libcap_2.74.bb    | 27 ++++----------
 3 files changed, 7 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-support/libcap/files/0001-ensure-the-XAT=
TR_NAME_CAPS-is-defined-when-it-is-use.patch
 delete mode 100644 meta/recipes-support/libcap/files/0002-tests-do-not-r=
un-target-executables.patch

diff --git a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME=
_CAPS-is-defined-when-it-is-use.patch b/meta/recipes-support/libcap/files=
/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
deleted file mode 100644
index c576351e819..00000000000
--- a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-i=
s-defined-when-it-is-use.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From bda8da622bd3f4d8b0e577387e988ce364b917c4 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Thu, 23 Jun 2016 16:26:43 +0800
-Subject: [PATCH] Ensure the XATTR_NAME_CAPS is defined when it is used
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-VFS_CAP_U32 can not ensure that XATTR_NAME_CAPS is defined, and failed t=
o build
-libcap-native in old release, like CentOS release 6.7 (Final), with the =
blow
-error:
-     cap_file.c: In function =E2=80=98cap_get_fd=E2=80=99:
-     cap_file.c:199: error: =E2=80=98XATTR_NAME_CAPS=E2=80=99 undeclared=
 (first use in this function)
-     cap_file.c:199: error: (Each undeclared identifier is reported only=
 once
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- libcap/cap_file.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcap/cap_file.c b/libcap/cap_file.c
-index 0bc07f7..37bc34e 100644
---- a/libcap/cap_file.c
-+++ b/libcap/cap_file.c
-@@ -44,7 +44,7 @@ extern int fremovexattr(int, const char *);
-=20
- #include "libcap.h"
-=20
--#ifdef VFS_CAP_U32
-+#if defined (VFS_CAP_U32) && defined (XATTR_NAME_CAPS)
-=20
- #if VFS_CAP_U32 !=3D __CAP_BLKS
- # error VFS representation of capabilities is not the same size as kern=
el
diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-targ=
et-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-no=
t-run-target-executables.patch
deleted file mode 100644
index 8cabed6342a..00000000000
--- a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-exec=
utables.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 5846ba594bedd66c8fd216cad6518f7be11b7a92 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 20 Dec 2019 16:54:05 +0100
-Subject: [PATCH] tests: do not run target executables
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/Makefile | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/tests/Makefile b/tests/Makefile
-index 3d03721..fbb1d78 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -69,13 +69,11 @@ endif
-=20
- # unprivileged
- run_psx_test: psx_test
--	./psx_test
-=20
- psx_test: psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< -o $@ $(LINKEXTRA) $(LIBPSXL=
IB)
-=20
- run_libcap_psx_test: libcap_psx_test
--	./libcap_psx_test
-=20
- libcap_psx_test: libcap_psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< -o $@ $(LINKEXTRA) $(LIBCAPL=
IB) $(LIBPSXLIB)
diff --git a/meta/recipes-support/libcap/libcap_2.74.bb b/meta/recipes-su=
pport/libcap/libcap_2.74.bb
index 75019fd35fd..9240763e9a5 100644
--- a/meta/recipes-support/libcap/libcap_2.74.bb
+++ b/meta/recipes-support/libcap/libcap_2.74.bb
@@ -3,19 +3,16 @@ DESCRIPTION =3D "A library providing the API to access =
POSIX capabilities. \
 These allow giving various kinds of specific privileges to individual \
 users, without giving them full root permissions."
 HOMEPAGE =3D "http://sites.google.com/site/fullycapable/"
-# no specific GPL version required
-LICENSE =3D "BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM_PAM =3D "file://pam_cap/License;md5=3D905326f41d3d1f8df=
21943f9a4ed6b50"
+
+# The library is BSD | GPLv2, the PAM module is BSD | LGPLv2+
+LICENSE =3D "(BSD-3-Clause | GPL-2.0-only) & (BSD-3-Clause | LGPL-2.0-or=
-later)"
 LIC_FILES_CHKSUM =3D "file://License;md5=3D2965a646645b72ecee859b43c592d=
caa \
-                    ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${LIC_=
FILES_CHKSUM_PAM}', '', d)} \
+                    file://pam_cap/License;md5=3D905326f41d3d1f8df21943f=
9a4ed6b50 \
                     "
=20
 DEPENDS =3D "hostperl-runtime-native gperf-native"
=20
-SRC_URI =3D "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2=
/${BPN}-${PV}.tar.xz \
-           file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-=
use.patch \
-           file://0002-tests-do-not-run-target-executables.patch \
-           "
+SRC_URI =3D "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2=
/${BPN}-${PV}.tar.xz"
 SRC_URI:append:class-nativesdk =3D " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-contain=
ing.patch \
            "
@@ -26,11 +23,10 @@ UPSTREAM_CHECK_URI =3D "https://www.kernel.org/pub/li=
nux/libs/security/linux-privs
 inherit lib_package
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
-PACKAGECONFIG:class-native ??=3D ""
-
 PACKAGECONFIG[pam] =3D "PAM_CAP=3Dyes,PAM_CAP=3Dno,libpam"
=20
 EXTRA_OEMAKE =3D " \
+  ${PACKAGECONFIG_CONFARGS} \
   INDENT=3D  \
   lib=3D'${baselib}' \
   RAISE_SETFCAP=3Dno \
@@ -38,23 +34,16 @@ EXTRA_OEMAKE =3D " \
   USE_GPERF=3Dyes \
 "
=20
-EXTRA_OEMAKE:append:class-target =3D " SYSTEM_HEADERS=3D${STAGING_INCDIR=
}"
-
 do_compile() {
-	unset CFLAGS BUILD_CFLAGS
 	oe_runmake \
-		${PACKAGECONFIG_CONFARGS} \
 		AR=3D"${AR}" \
 		CC=3D"${CC}" \
 		RANLIB=3D"${RANLIB}" \
-                OBJCOPY=3D"${OBJCOPY}" \
-		COPTS=3D"${CFLAGS}" \
-		BUILD_COPTS=3D"${BUILD_CFLAGS}"
+		OBJCOPY=3D"${OBJCOPY}"
 }
=20
 do_install() {
 	oe_runmake install \
-		${PACKAGECONFIG_CONFARGS} \
 		DESTDIR=3D"${D}" \
 		prefix=3D"${prefix}" \
 		SBINDIR=3D"${sbindir}"
@@ -71,8 +60,6 @@ do_install:append() {
 	fi
 }
=20
-FILES:${PN}-dev +=3D "${base_libdir}/*.so"
-
 # pam files
 FILES:${PN} +=3D "${base_libdir}/security/*.so"
=20
--=20
2.43.0


