Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EEAC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 17:17:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12211.1646932619680684346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 09:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AC051692
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 09:16:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38BF23F99C
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 09:16:58 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-installer: add installer module
Date: Thu, 10 Mar 2022 17:16:55 +0000
Message-Id: <20220310171656.3106028-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 17:17:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163032

Add a recipe for Installer, a minimal library/tool to install Python
Wheels.  Unlike PIP, it explicitly only installs wheels and does nothing
else.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-installer_0.5.0.bb         | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-installer_0.5.0.=
bb

diff --git a/meta/recipes-devtools/python/python3-installer_0.5.0.bb b/me=
ta/recipes-devtools/python/python3-installer_0.5.0.bb
new file mode 100644
index 0000000000..bde9397569
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-installer_0.5.0.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "A library for installing Python wheels"
+DESCRIPTION =3D "a low-level library for installing a Python package fro=
m a wheel distribution."
+HOMEPAGE =3D "https://installer.readthedocs.io/"
+BUGTRACKER =3D "https://github.com/pradyunsg/installer/issues"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5038641aec7a77451e31da828ebfa=
e00"
+
+SRC_URI[sha256sum] =3D "0cd6bdab3b358cf7e8749370b99aef9e12202751271c5ddb=
22126599b34dc665"
+
+inherit pypi flit_core
+
+DEPENDS:remove:class-native =3D "python3-installer-native"
+DEPENDS:append:class-native =3D " unzip-native"
+
+do_install:class-native () {
+    pip_install_wheel_do_bootstrap_install
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


