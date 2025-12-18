Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC72D6E2D1
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 17:42:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2581.1766079775118076692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 09:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DCE5FEC
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:42:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 663263F73F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:42:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libseccomp: use libtool to install test binaries
Date: Thu, 18 Dec 2025 17:42:45 +0000
Message-ID: <20251218174248.2580279-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218174248.2580279-1-ross.burton@arm.com>
References: <20251218174248.2580279-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 17:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228130

Instead of installing the libtool wrapper scripts and hoping that the
real binaries are in .libs/, just use libtool to install the binaries
directly.

This will relink if needed, and removes any assumptions about file
locations.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libseccomp/libseccomp_2.6.0.bb             | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb b/meta/r=
ecipes-support/libseccomp/libseccomp_2.6.0.bb
index dd56391e1ff..2c06824a799 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
@@ -32,13 +32,13 @@ do_compile_ptest() {
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     for file in $(find ${S}/tests/* -executable -type f); do
-        install -m 744 $file ${D}/${PTEST_PATH}/tests
-    done
-    for file in $(find ${B}/tests/* -executable -type f); do
-        install -m 744 $file ${D}/${PTEST_PATH}/tests
+        install $file ${D}/${PTEST_PATH}/tests
     done
     for file in $(find ${S}/tests/*.tests -type f); do
-        install -m 744 $file ${D}/${PTEST_PATH}/tests
+        install $file ${D}/${PTEST_PATH}/tests
+    done
+    for file in $(find ${B}/tests/* -executable -type f); do
+        ${B}/libtool --mode=3Dinstall install $file ${D}/${PTEST_PATH}/t=
ests
     done
         for file in $(find ${S}/tests/*.pfc -type f); do
         install -m 644 $file ${D}/${PTEST_PATH}/tests
@@ -47,14 +47,10 @@ do_install_ptest() {
=20
     install -d ${D}${PTEST_PATH}/tools
     for file in $(find ${S}/tools/* -executable -type f); do
-        install -m 744 $file ${D}/${PTEST_PATH}/tools
+        install $file ${D}/${PTEST_PATH}/tools
     done
     for file in $(find ${B}/tools/* -executable -type f); do
-        install -m 744 $file ${D}/${PTEST_PATH}/tools
-    done
-    # Overwrite libtool wrappers with real executables
-    for file in $(find ${B}/tools/.libs/* -executable -type f); do
-        install -m 744 $file ${D}/${PTEST_PATH}/tools
+        ${B}/libtool --mode=3Dinstall install $file ${D}/${PTEST_PATH}/t=
ools
     done
=20
     # fix python shebang
--=20
2.43.0


