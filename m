Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8107DC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 20:31:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26681.1739392280590513264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 12:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A6AA12FC
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 12:31:41 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABB3F3F5A1
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 12:31:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-license-expression: fix ptest installation
Date: Wed, 12 Feb 2025 20:31:13 +0000
Message-ID: <20250212203113.398422-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 20:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211278

This recipe was overriding do_install_ptest which is provided by the
ptest-python-pytest class, so there was no tests or run-ptest installed.

Use an append override, and minimise the installed files: use a symlink
so that scancode-licensedb-index.json is found and install setup.cfg.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-license-expression_30.4.1.bb            | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4=
.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
index 649b53ea492..ec613f6eaac 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
@@ -22,8 +22,9 @@ RDEPENDS:${PN} +=3D "\
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-do_install_ptest() {
+do_install_ptest:append() {
+    # The tests need some files from the source tree
     install -d ${D}${PTEST_PATH}/src
-    cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
-    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
+    ln -s ${PYTHON_SITEPACKAGES_DIR}/license_expression/ ${D}${PTEST_PAT=
H}/src/
+    install -m644 ${S}/setup.cfg ${D}${PTEST_PATH}/
 }
--=20
2.43.0


