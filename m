Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33424C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 14:38:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.28013.1684507129319410394
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 07:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98FC82F4;
	Fri, 19 May 2023 07:39:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D88A3F793;
	Fri, 19 May 2023 07:38:48 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] libnl: clean up ptest
Date: Fri, 19 May 2023 15:38:45 +0100
Message-Id: <20230519143846.378675-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519143846.378675-1-ross.burton@arm.com>
References: <20230519143846.378675-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 14:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181554

From: Ross Burton <ross.burton@arm.com>

libnl builds lots of test-* binaries but these are for manual testing
purposes.  Instead, the test suite is entirely contained in the
check-all binary.

Clean up the compilation by simply building check-all, and install it
with libtool so the binary is installed correctly.

There is no need to RDEPEND on libcheck as that happens automatically,
and the rpath workaround appears to be obsolete.

Finally rewrite run-ptest to invoke the test directly, and use the new
automake-style output that has been added to libcheck.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libnl/files/enable-serial-tests.patch     | 29 -------------------
 meta/recipes-support/libnl/files/run-ptest    | 17 ++---------
 meta/recipes-support/libnl/libnl_3.7.0.bb     | 20 +++----------
 3 files changed, 6 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-support/libnl/files/enable-serial-tests.=
patch

diff --git a/meta/recipes-support/libnl/files/enable-serial-tests.patch b=
/meta/recipes-support/libnl/files/enable-serial-tests.patch
deleted file mode 100644
index db774ad8217..00000000000
--- a/meta/recipes-support/libnl/files/enable-serial-tests.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b1476d89bf7a0bc6062438731ee4e9026696328b Mon Sep 17 00:00:00 2001
-From: Eric Xu <chi.xu@windriver.com>
-Date: Fri, 9 Mar 2018 03:38:49 +0000
-Subject: [PATCH] Add ptest for libnl
-
-serial-tests is required to generate those targets.
-
-Upstream-Status: Inappropriate [oe-specific]
-Signed-off-by: Eric Xu <chi.xu@windriver.com>
----
- configure.ac | 2 +-
- 1 files changed, 1 insertion(+), 1 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index dfead98..2cc8257 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -46,7 +46,7 @@ AC_INIT(libnl, [libnl_version], [], [], [http://www.in=
fradead.org/~tgr/libnl/])
- AC_CONFIG_HEADERS([lib/defs.h])
- AC_CONFIG_AUX_DIR([build-aux])
- AC_CONFIG_MACRO_DIR([m4])
--AM_INIT_AUTOMAKE([-Wall foreign subdir-objects])
-+AM_INIT_AUTOMAKE([-Wall foreign subdir-objects serial-tests])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES(yes)], [])
- m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
-=20
---=20
-2.13.3
-
diff --git a/meta/recipes-support/libnl/files/run-ptest b/meta/recipes-su=
pport/libnl/files/run-ptest
index e5c9eb0a328..0d0c665cd22 100755
--- a/meta/recipes-support/libnl/files/run-ptest
+++ b/meta/recipes-support/libnl/files/run-ptest
@@ -1,16 +1,3 @@
-#!/bin/sh
+#! /bin/sh
=20
-num_fail=3D0
-
-for test in check*
-do
-    ./"$test" \
-         && echo "PASS: $test" \
-         || {
-            echo "FAIL: $test"
-            num_fail=3D$(( ${num_fail} + 1))
-         }
-
-done
-
-exit $num_fail
+CK_AUTOMAKE=3D1 ./check-all
diff --git a/meta/recipes-support/libnl/libnl_3.7.0.bb b/meta/recipes-sup=
port/libnl/libnl_3.7.0.bb
index ef286a6429d..38d21ffe9c9 100644
--- a/meta/recipes-support/libnl/libnl_3.7.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.7.0.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c"
 DEPENDS =3D "flex-native bison-native"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace=
('.','_')}/${BP}.tar.gz \
-           file://enable-serial-tests.patch \
            file://run-ptest \
            "
=20
@@ -51,26 +50,15 @@ FILES:${PN}-xfrm  =3D "${libdir}/libnl-xfrm-3.so.*"
 RREPLACES:${PN}-genl =3D "libnl-genl2"
 RCONFLICTS:${PN}-genl =3D "libnl-genl2"
=20
-RDEPENDS:${PN}-ptest +=3D "libcheck"
-RRECOMMENDS:${PN}-ptest +=3D "kernel-module-dummy kernel-module-bonding"
 DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'libcheck', '',=
 d)}"
-
-# make sure the tests don't link against wrong so file
-EXTRA_OECONF +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', '--disable=
-rpath', '', d)}"
+RRECOMMENDS:${PN}-ptest +=3D "kernel-module-dummy kernel-module-bonding"
=20
 do_compile_ptest() {
-    # hack to remove the call to `make runtest-TESTS`
-    sed -i 's/$(MAKE) $(AM_MAKEFLAGS) runtest-TESTS//g' Makefile
-    oe_runmake check
+    oe_runmake ./tests/check-all
 }
=20
-do_install_ptest(){
-    # legacy? tests are also installed, but ptest-runner will not run th=
em
-    # upstream are not running these tests in their CI pipeline
-    # issue opened https://github.com/thom311/libnl/issues/270
-    install -m 0755 tests/.libs/* ${D}${PTEST_PATH}/
-    # contains build paths
-    rm ${D}${PTEST_PATH}/*.la
+do_install_ptest() {
+    ./libtool install install ./tests/check-all ${D}${PTEST_PATH}/
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


