Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D7DC87FCC
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 08:59:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2685.1753779584081330278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 01:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A59791516
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:59:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 395883F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:59:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/7] setuptools3: tidy up do_compile
Date: Tue, 29 Jul 2025 09:59:32 +0100
Message-ID: <20250729085935.1290438-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729085935.1290438-1-ross.burton@arm.com>
References: <20250729085935.1290438-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 08:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221040

This function was untidy and has pointless logging, rewrite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/setuptools3.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recip=
e/setuptools3.bbclass
index 0adce5e2ece..f6194426cd9 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -32,11 +32,13 @@ setuptools3_do_configure() {
=20
 setuptools3_do_compile() {
         cd ${SETUPTOOLS_SETUP_PATH}
-        STAGING_INCDIR=3D${STAGING_INCDIR} \
-        STAGING_LIBDIR=3D${STAGING_LIBDIR} \
-        ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
-        bdist_wheel --verbose --dist-dir ${PEP517_WHEEL_PATH} ${SETUPTOO=
LS_BUILD_ARGS} || \
-        bbfatal_log "'python3 setup.py bdist_wheel ${SETUPTOOLS_BUILD_AR=
GS}' execution failed."
+
+        export STAGING_INCDIR=3D${STAGING_INCDIR}
+        export STAGING_LIBDIR=3D${STAGING_LIBDIR}
+
+        nativepython3 setup.py --verbose \
+            bdist_wheel --dist-dir ${PEP517_WHEEL_PATH} \
+            ${SETUPTOOLS_BUILD_ARGS}
 }
 setuptools3_do_compile[vardepsexclude] =3D "MACHINE"
 do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
--=20
2.43.0


