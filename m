Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740C1C43219
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 17:10:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.22571.1653585009676254892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 10:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E98A61688;
	Thu, 26 May 2022 10:10:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 896323F66F;
	Thu, 26 May 2022 10:10:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH 04/10] python3-installer: bootstrap by installing
 installer with installer
Date: Thu, 26 May 2022 18:09:55 +0100
Message-Id: <20220526171001.4074388-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526171001.4074388-1-ross.burton@arm.com>
References: <20220526171001.4074388-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 17:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166190

The installer can install itself by simply adding src/ to PYTHONPATH.

As this previously used unzip, we need to disable bytecode as otherwise
the newly packaged .pyc files conflict with the any generated .pyc files
in the sysroot.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-installer_0.5.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-installer_0.5.1.bb b/me=
ta/recipes-devtools/python/python3-installer_0.5.1.bb
index f4f9e1bde64..b7780702d6b 100644
--- a/meta/recipes-devtools/python/python3-installer_0.5.1.bb
+++ b/meta/recipes-devtools/python/python3-installer_0.5.1.bb
@@ -12,11 +12,13 @@ SRC_URI[sha256sum] =3D "f970995ec2bb815e2fdaf7977b26b=
2091e1e386f0f42eafd5ac811953d
=20
 inherit pypi python_flit_core
=20
+# Bootstrap the native install by installing with ourself
 DEPENDS:remove:class-native =3D "python3-installer-native"
-DEPENDS:append:class-native =3D " unzip-native"
=20
-do_install:class-native () {
-    python_pep517_do_bootstrap_install
+INSTALL_WHEEL_COMPILE_BYTECODE:class-native =3D "--no-compile-bytecode"
+
+do_install:prepend:class-native() {
+    export PYTHONPATH=3D"${S}/src"
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


