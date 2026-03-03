Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D8EEDA6BC
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 17:20:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24072.1772558413967148975
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 09:20:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A26A339
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 09:20:07 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06F923F73B
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 09:20:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] tcl: rewrite ptest (again)
Date: Tue,  3 Mar 2026 17:20:08 +0000
Message-ID: <20260303172009.2064612-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 17:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232332

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
 .../0005-tcl-fix-race-in-interp.test.patch    | 40 -------------------
 meta/recipes-devtools/tcltk/tcl/run-ptest     | 24 +++++++++--
 meta/recipes-devtools/tcltk/tcl_9.0.3.bb      |  6 +--
 3 files changed, 21 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-=
interp.test.patch

diff --git a/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.=
test.patch b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.=
test.patch
deleted file mode 100644
index 07912da5b3..0000000000
--- a/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.pa=
tch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fd75e3613613726786c54a25ee611c5176b33510 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 12 Jul 2021 14:50:13 +0100
-Subject: [PATCH] tcl: fix race in interp.test
-
-The interp-36.7 patch has race conditions and is missing cleanup.  This =
patch by
-a Tcl maintainer should improve matters.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tests/interp.test | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/tests/interp.test b/tests/interp.test
-index 0092a03..eecfd3b 100644
---- a/tests/interp.test
-+++ b/tests/interp.test
-@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handle=
r of child [1999035]} -setup {
- 	variable result
- 	set result [lindex $args 0]
-     }
-+    set tout [after 5000 {set result timeout}]
- } -body {
-     child eval {
- 	variable done {}
- 	after 0 error foo
--	after 10 [list ::set [namespace which -variable done] {}]
--	vwait [namespace which -variable done]
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
diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index 506529eada..dc61d66cc1 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -1,13 +1,19 @@
 #!/bin/sh
=20
-export TCL_LIBRARY=3D@libdir@/tcl/ptest/library
-export ERROR_ON_FAILURES=3D1
+set -u
+
 export LANG=3Den-US.UTF-8
=20
+# Tell all.tcl to exit with an error code if there are failing tests
+export ERROR_ON_FAILURES=3D1
+
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
@@ -16,6 +22,8 @@ SKIP=3D"$SKIP exit-1.\*"
 SKIP=3D"$SKIP \*io-46.1"
 # io-13.6 explicitly says it can fail on slow/loaded machines
 SKIP=3D"$SKIP \*io-13.6"
+# Has race conditions and is missing cleanup
+SKIP=3D"$SKIP interp-36.7"
 # The socket tests seem to be problematic with tight timing conditions, =
skip them all.
 # 14825 15495
 SKIP=3D"$SKIP socket-\* socket_inet\* socket_inet6\*"
@@ -25,11 +33,19 @@ SKIP=3D"$SKIP http11-\*"
 # tries to access google.com
 SKIP=3D"$SKIP httpProxy-\*"
=20
-for name in tests/*.test; do
-    ./tcltest $name -skip "$SKIP"
+# Run all tests in tests/*.test unless tests are specified as arguments
+TESTS=3D${*:-tests/*.test}
+
+exitcode=3D0
+for name in $TESTS; do
+    ./tcltest tests/all.tcl -file $(basename $name) -tmpdir /tmp -skip "=
$SKIP"
     if [ $? -eq 0 ]; then
         echo "PASS: $name"
     else
         echo "FAIL: $name"
+        exitcode=3D1
     fi
+    echo
 done
+
+exit $exitcode
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.3.bb b/meta/recipes-devt=
ools/tcltk/tcl_9.0.3.bb
index 21a6cbb23d..3c0a257238 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-sr=
c.tar.gz \
            file://0002-tcl-fix-a-build-issue.patch \
            file://0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-=
tar.patch \
            file://0004-tcl-update-the-header-location.patch \
-           file://0005-tcl-fix-race-in-interp.test.patch \
            "
 SRC_URI[sha256sum] =3D "407a073ee8f718200c3a004bc2186deccc33356ee5112a71=
d8b01b55230f4ee4"
=20
@@ -80,15 +79,12 @@ do_compile_ptest() {
=20
 do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
-	cp -r ${S}/library ${D}${PTEST_PATH}
 	cp -r ${S}/tests ${D}${PTEST_PATH}
-        # handle multilib
-        sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
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


