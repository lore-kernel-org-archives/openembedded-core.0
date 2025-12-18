Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633A3D6E2D8
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 17:42:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2581.1766079775118076692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 09:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F387E106F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:42:48 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB4423F73F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:42:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] libexif: rewrite ptest handling
Date: Thu, 18 Dec 2025 17:42:47 +0000
Message-ID: <20251218174248.2580279-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218174248.2580279-1-ross.burton@arm.com>
References: <20251218174248.2580279-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 17:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228132

What started as replacing the installation of libtool wrapper scripts
ended up being a rewrite of the ptest integration.

There are only ~15 tests so we can install the binaries with libtool,
extract the test names from the Makefile, and just run them with a few
lines of shell.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/libexif/libexif/run-ptest | 34 +++++++++++++++++--
 .../recipes-support/libexif/libexif_0.6.25.bb | 21 ++++--------
 2 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-support/libexif/libexif/run-ptest b/meta/recipe=
s-support/libexif/libexif/run-ptest
index 2d23159eb03..6a50f64822a 100644
--- a/meta/recipes-support/libexif/libexif/run-ptest
+++ b/meta/recipes-support/libexif/libexif/run-ptest
@@ -1,3 +1,33 @@
-#!/bin/sh
+#! /bin/sh
=20
-make -o Makefile runtest-TESTS
+all=3D0
+passed=3D0
+failed=3D0
+skipped=3D0
+
+for t in @TESTS@; do
+    "./$t"
+    case "$?" in
+        0)
+            echo "PASS: $t"
+            passed=3D$((passed + 1))
+            ;;
+        77)
+            echo "SKIP: $t"
+            skipped=3D$((skipped + 1))
+            ;;
+        *)
+            echo "FAIL: $t"
+            failed=3D$((failed + 1))
+            ;;
+    esac
+    all=3D$((all + 1))
+done
+
+if [ "$failed" -eq 0 ]; then
+    echo "All $all tests passed ($skipped skipped)"
+    exit 0
+else
+    echo "$failed of $all tests failed ($skipped skipped)"
+    exit 1
+fi
diff --git a/meta/recipes-support/libexif/libexif_0.6.25.bb b/meta/recipe=
s-support/libexif/libexif_0.6.25.bb
index 59c22753d04..c57855303f4 100644
--- a/meta/recipes-support/libexif/libexif_0.6.25.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.25.bb
@@ -23,25 +23,16 @@ do_compile_ptest() {
 }
=20
 do_install_ptest() {
-    install ${B}/test/test*[!\.o] ${D}${PTEST_PATH}
-    for f in ${D}${PTEST_PATH}/test*; do
-        sed -i "s/\(LD_LIBRARY_PATH=3D\).*\(:\$LD_LIBRARY_PATH\)\"/\1.\2=
/" $f
-    done
-
-    install ${B}/test/Makefile ${D}${PTEST_PATH}
-    sed -i -e "/^srcdir/c srcdir =3D \$\{PWD\}" ${D}${PTEST_PATH}/Makefi=
le
-
-    install -d ${D}${PTEST_PATH}/nls
-    install ${B}/test/nls/*[!\.o] ${D}${PTEST_PATH}/nls
-    install -d ${D}${PTEST_PATH}/.libs
-    install ${B}/test/.libs/* ${D}${PTEST_PATH}/.libs
-
     install ${S}/test/*.sh ${D}${PTEST_PATH}
=20
+    for file in $(find ${B}/test/test-* -executable -type f); do
+        ${B}/libtool --mode=3Dinstall install $file ${D}/${PTEST_PATH}
+    done
+
     install -d ${D}${PTEST_PATH}/testdata
     install ${S}/test/testdata/* ${D}${PTEST_PATH}/testdata
+
+    sed -i -e "s/@TESTS@/$(makefile-getvar ${B}/test/Makefile TESTS)/" $=
{D}${PTEST_PATH}/run-ptest
 }
=20
-RDEPENDS:${PN}-ptest +=3D "make bash"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


