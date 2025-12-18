Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E657D6E2CA
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 17:42:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2580.1766079774619189231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 09:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00E8D106F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:42:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC6833F73F
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:42:53 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] libseccomp: allow out-of-tree builds
Date: Thu, 18 Dec 2025 17:42:44 +0000
Message-ID: <20251218174248.2580279-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218174248.2580279-1-ross.burton@arm.com>
References: <20251218174248.2580279-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 17:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228129

Out of tree builds appear to work fine, so use them. This means updating
do_install_ptest so that it correctly uses S or B as appropriate.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libseccomp/libseccomp_2.6.0.bb            | 38 +++++++++++--------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb b/meta/r=
ecipes-support/libseccomp/libseccomp_2.6.0.bb
index 998f1b5548d..dd56391e1ff 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "git://github.com/seccomp/libseccomp.git;br=
anch=3Drelease-2.6;protocol=3Dh
            file://run-ptest \
            "
=20
-inherit autotools-brokensep pkgconfig ptest features_check
+inherit autotools pkgconfig ptest features_check
=20
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3na=
tive', '', d)}
=20
@@ -31,27 +31,35 @@ do_compile_ptest() {
=20
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-    install -d ${D}${PTEST_PATH}/tools
-    for file in $(find tests/* -executable -type f); do
-        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    for file in $(find ${S}/tests/* -executable -type f); do
+        install -m 744 $file ${D}/${PTEST_PATH}/tests
     done
-    for file in $(find tests/*.tests -type f); do
-        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    for file in $(find ${B}/tests/* -executable -type f); do
+        install -m 744 $file ${D}/${PTEST_PATH}/tests
     done
-        for file in $(find tests/*.pfc -type f); do
-        install -m 644 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    for file in $(find ${S}/tests/*.tests -type f); do
+        install -m 744 $file ${D}/${PTEST_PATH}/tests
+    done
+        for file in $(find ${S}/tests/*.pfc -type f); do
+        install -m 644 $file ${D}/${PTEST_PATH}/tests
     done
     install -m 644 ${S}/tests/valgrind_test.supp ${D}/${PTEST_PATH}/test=
s
-    for file in $(find tools/* -executable -type f); do
-        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
+
+    install -d ${D}${PTEST_PATH}/tools
+    for file in $(find ${S}/tools/* -executable -type f); do
+        install -m 744 $file ${D}/${PTEST_PATH}/tools
+    done
+    for file in $(find ${B}/tools/* -executable -type f); do
+        install -m 744 $file ${D}/${PTEST_PATH}/tools
     done
     # Overwrite libtool wrappers with real executables
-    for file in $(find tools/.libs/* -executable -type f); do
-        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
+    for file in $(find ${B}/tools/.libs/* -executable -type f); do
+        install -m 744 $file ${D}/${PTEST_PATH}/tools
     done
-     # fix python shebang
-     sed -i -e 's@cmd /usr/bin/env python @cmd /usr/bin/env python3 @' $=
{D}/${PTEST_PATH}/tests/regression
-     sed -i -e 's@^#!/usr/bin/env python$@#!/usr/bin/env python3@' ${D}/=
${PTEST_PATH}/tests/*.py
+
+    # fix python shebang
+    sed -i -e 's@cmd /usr/bin/env python @cmd /usr/bin/env python3 @' ${=
D}/${PTEST_PATH}/tests/regression
+    sed -i -e 's@^#!/usr/bin/env python$@#!/usr/bin/env python3@' ${D}/$=
{PTEST_PATH}/tests/*.py
 }
=20
 FILES:${PN} =3D "${bindir} ${libdir}/${BPN}.so* ${PYTHON_SITEPACKAGES_DI=
R}/"
--=20
2.43.0


