Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4DAC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 15:51:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15545.1709049110170633939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 07:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46B5EFEC
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 07:52:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B7803F762
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 07:51:49 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libexif: improve ptest packaging
Date: Tue, 27 Feb 2024 15:51:45 +0000
Message-Id: <20240227155145.2679899-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227155145.2679899-1-ross.burton@arm.com>
References: <20240227155145.2679899-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 15:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196278

From: Ross Burton <ross.burton@arm.com>

The NLS tests don't actually test anything useful and were not being ran
anyway, so don't install them.

Install the test binaries using libtool so that we install the actual
binaries instead of libtool wrapper scripts.  This means that if we also
tell the Makefile to use /bin/sh there's no need to RDEPEND on bash.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libexif/libexif/run-ptest |  2 +-
 meta/recipes-support/libexif/libexif_0.6.24.bb | 14 ++++----------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/libexif/libexif/run-ptest b/meta/recipe=
s-support/libexif/libexif/run-ptest
index 2d23159eb03..9713a1bec2d 100644
--- a/meta/recipes-support/libexif/libexif/run-ptest
+++ b/meta/recipes-support/libexif/libexif/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
=20
-make -o Makefile runtest-TESTS
+make -o Makefile SHELL=3D/bin/sh runtest-TESTS
diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipe=
s-support/libexif/libexif_0.6.24.bb
index b407ee52de0..69c91773097 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
@@ -23,18 +23,12 @@ do_compile_ptest() {
 }
=20
 do_install_ptest() {
-    install ${B}/test/test*[!\.o] ${D}${PTEST_PATH}
-    for f in ${D}${PTEST_PATH}/test*; do
-        sed -i "s/\(LD_LIBRARY_PATH=3D\).*\(:\$LD_LIBRARY_PATH\)\"/\1.\2=
/" $f
-    done
-
     install ${B}/test/Makefile ${D}${PTEST_PATH}
     sed -i -e "/^srcdir/c srcdir =3D \$\{PWD\}" ${D}${PTEST_PATH}/Makefi=
le
=20
-    install -d ${D}${PTEST_PATH}/nls
-    install ${B}/test/nls/*[!\.o] ${D}${PTEST_PATH}/nls
-    install -d ${D}${PTEST_PATH}/.libs
-    install ${B}/test/.libs/* ${D}${PTEST_PATH}/.libs
+    for f in ${B}/test/test*[!\.o]; do
+        libtool --mode=3Dinstall install $f ${D}${PTEST_PATH}
+    done
=20
     install ${S}/test/*.sh ${D}${PTEST_PATH}
=20
@@ -42,6 +36,6 @@ do_install_ptest() {
     install ${S}/test/testdata/* ${D}${PTEST_PATH}/testdata
 }
=20
-RDEPENDS:${PN}-ptest +=3D "make bash"
+RDEPENDS:${PN}-ptest +=3D "make"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


