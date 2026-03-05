Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F93DF33A7F
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:06:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46272.1772723180680659386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 07:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6482497
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 07:06:13 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E0FE33F73B
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 07:06:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] tcl8: rewrite ptest (again)
Date: Thu,  5 Mar 2026 15:06:15 +0000
Message-ID: <20260305150615.1777393-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305150615.1777393-1-ross.burton@arm.com>
References: <20260305150615.1777393-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 15:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232498

Backport the previous commit's changes for tcl9 to the tc8 recipe:

I discovered that running a single test case with tcltest doesn't let
you know if the test failed or not, so when run-ptest moved away from
using all.tcl[1] we were always marking the tests as passing.

So, revert that commit and use all.tcl as a test runner. This is more
noisy, but importantly will let us know if a test failed.

Remove our un-upstreamable tweaks to the interp tests and instead skip
the test that is known to be fragile, so we don't have to carry a patch
forever.

Don't install another copy of the entire Tcl library for the tests, as
there is no real point.  This does then expose a bug in the tests where
clock-59.2 assumes that it is running in a source tree and behaves
differently if the system tzdata is being used.  This is being worked on
upstream[2], for now skip this test.

Clean up musl overriding so it's more resiliant.

Exit 1 if a test fails.

[1] oe-core 9c41887f2a ("tcl: improve test execution loop")
[2] https://core.tcl-lang.org/tcl/tktview/51aa53616067cb63900b17ca1d71f07=
b094ffa1a

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/tcltk8/tcl8/interp.patch | 40 -------------------
 meta/recipes-devtools/tcltk8/tcl8/run-ptest   | 32 ++++++++++-----
 meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb   |  5 +--
 3 files changed, 23 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcltk8/tcl8/interp.patch

diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipe=
s-devtools/tcltk8/tcl8/interp.patch
deleted file mode 100644
index c6412e7775..0000000000
--- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2d959d1fdfbd7e020f5177b1a7ff6a08809536ca Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 12 Jul 2021 14:50:13 +0100
-Subject: [PATCH] tcl: fix race in interp.test
-
-The interp-36.7 patch has race conditions and is missing cleanup.  This =
patch by
-a Tcl maintainer should improve matters.
-
-Upstream-Status: Inappropriate [tcl 8.x is obsolete; upstream submission=
 should be for 9.x patches]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tests/interp.test | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/tests/interp.test b/tests/interp.test
-index d64fdd4..9931dd1 100644
---- a/tests/interp.test
-+++ b/tests/interp.test
-@@ -3651,17 +3651,18 @@ test interp-36.7 {ChildBgerror sets error handle=
r of child [1999035]} -setup {
-         variable result
-         set result [lindex $args 0]
-     }
-+    set tout [after 5000 {set result timeout}]
- } -body {
-     child eval {
-         variable done {}
-         after 0 error foo
--        after 10 [list ::set [namespace which -variable done] {}]
--        vwait [namespace which -variable done]
-     }
-+    vwait result
-     set result
- } -cleanup {
-+    after cancel $tout
-     variable result {}
--    unset -nocomplain result
-+    unset -nocomplain result tout
-     interp delete child
- } -result foo
-=20
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-d=
evtools/tcltk8/tcl8/run-ptest
index 0422e28a9d..86b74a4177 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -1,16 +1,19 @@
 #!/bin/sh
=20
-# clock.test needs a timezone to be set
-export TZ=3D"Europe/London"
-export TCL_LIBRARY=3D@libdir@/tcl8/ptest/library
+set -u
+
+export LANG=3Den-US.UTF-8
+
+# Tell all.tcl to exit with an error code if there are failing tests
 export ERROR_ON_FAILURES=3D1
-export LC_ALL=3Den_US.UTF-8
-export LANG=3Den_US.UTF-8
=20
 # Some tests are overly strict with timings and fail on loaded systems.
 SKIP=3D""
 # 15321
 SKIP=3D"$SKIP async-\* event-\*"
+# This test behaves differently when using a system tzdata, skip until f=
ixed upstream
+# https://core.tcl-lang.org/tcl/tktview/51aa53616067cb63900b17ca1d71f07b=
094ffa1a
+SKIP=3D"$SKIP clock-59.2\*"
 # 14882
 SKIP=3D"$SKIP cmdMZ-6.6"
 # 15081
@@ -19,6 +22,8 @@ SKIP=3D"$SKIP exit-1.\*"
 SKIP=3D"$SKIP \*io-46.1"
 # io-13.6 explicitly says it can fail on slow/loaded machines
 SKIP=3D"$SKIP \*io-13.6"
+# Has race conditions and is missing cleanup
+SKIP=3D"$SKIP interp-36.7"
 # The socket tests seem to be problematic with tight timing conditions, =
skip them all.
 # 14825 15495
 SKIP=3D"$SKIP socket-\* socket_inet\* socket_inet6\*"
@@ -28,12 +33,19 @@ SKIP=3D"$SKIP http11-\*"
 # tries to access google.com
 SKIP=3D"$SKIP httpProxy-\*"
=20
-for i in tests/*.test; do
-    i=3D$(basename $i)
-    ./tcltest tests/all.tcl -file $i -skip "$SKIP"
+# Run all tests in tests/*.test unless tests are specified as arguments
+TESTS=3D${*:-tests/*.test}
+
+exitcode=3D0
+for name in $TESTS; do
+    ./tcltest tests/all.tcl -file $(basename $name) -skip "$SKIP"
     if [ $? -eq 0 ]; then
-        echo "PASS: $i"
+        echo "PASS: $name"
     else
-        echo "FAIL: $i"
+        echo "FAIL: $name"
+        exitcode=3D1
     fi
+    echo
 done
+
+exit $exitcode
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb b/meta/recipes-d=
evtools/tcltk8/tcl8_8.6.17.bb
index b97b20abd5..0f829a9d1b 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "${BASE_SRC_URI} \
            file://fix_non_native_build_issue.patch \
            file://tcl-remove-hardcoded-install-path.patch \
            file://alter-includedir.patch \
-           file://interp.patch \
            file://run-ptest \
            file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_=
Tim.patch \
            "
@@ -84,14 +83,12 @@ do_compile_ptest() {
=20
 do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
-	cp -r ${S}/library ${D}${PTEST_PATH}
 	cp -r ${S}/tests ${D}${PTEST_PATH}
-	sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
=20
 do_install_ptest:append:libc-musl () {
 	# Assumes locales other than provided by musl-locales
-	sed -i '/SKIP=3D"$SKIP socket.*$/a # unixInit-3* is suppressed due to h=
ardcoded locale assumptions\nSKIP=3D"$SKIP unixInit-3\\\*"' ${D}${PTEST_P=
ATH}/run-ptest
+	sed -i '/SKIP=3D"$SKIP.*$/a # unixInit-3* is suppressed due to hardcode=
d locale assumptions\nSKIP=3D"$SKIP unixInit-3\\\*"' ${D}${PTEST_PATH}/ru=
n-ptest
 }
=20
 # Fix some paths that might be used by Tcl extensions
--=20
2.43.0


