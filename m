Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0A1C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 11:40:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8501.1646912439496792177
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 03:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC6C91691
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 03:40:37 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B15E3F7D8
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 03:40:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] pip_install_wheel: add a generic do_install for
 bootstrapping
Date: Thu, 10 Mar 2022 11:40:33 +0000
Message-Id: <20220310114035.2226442-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 11:40:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163014

Several recipes are duplicating the same bootstrap logic for installing
a wheel without using any tools.  Add an implementation to
pip_install_wheel to centralise the code, and remove the duplicated code
from the following recipes:

- python3-flit-core
- python3-pip
- python3-setuptools
- python3-wheel

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/pip_install_wheel.bbclass                    | 6 ++++++
 meta/recipes-devtools/python/python3-flit-core_3.7.1.bb   | 3 +--
 meta/recipes-devtools/python/python3-pip_22.0.3.bb        | 4 +---
 meta/recipes-devtools/python/python3-setuptools_59.5.0.bb | 4 +---
 meta/recipes-devtools/python/python3-wheel_0.37.1.bb      | 4 +---
 5 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_in=
stall_wheel.bbclass
index 3861dae75a..29cd544aa3 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -40,4 +40,10 @@ pip_install_wheel_do_install () {
     done
 }
=20
+# A manual do_install that just uses unzip for bootstrapping purposes. C=
allers should DEPEND on unzip-native.
+pip_install_wheel_do_bootstrap_install () {
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.w=
hl
+}
+
 EXPORT_FUNCTIONS do_install
diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/me=
ta/recipes-devtools/python/python3-flit-core_3.7.1.bb
index 196e391a8d..1f14345d50 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
@@ -21,8 +21,7 @@ PYPI_PACKAGE =3D "flit"
 PEP517_SOURCE_PATH =3D "${S}/flit_core"
=20
 do_install:class-native () {
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/fli=
t_core*.whl
+    pip_install_wheel_do_bootstrap_install
 }
=20
 PACKAGES =3D+ "${PN}-tests"
diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/re=
cipes-devtools/python/python3-pip_22.0.3.bb
index d7000b891a..f7fcf47c06 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -19,9 +19,7 @@ SRC_URI +=3D "file://reproducible.patch"
 SRC_URI[sha256sum] =3D "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c53=
49d70aa581b333d0"
=20
 do_install:class-native() {
-    # Bootstrap to prevent dependency loop in python3-pip-native
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.w=
hl
+    pip_install_wheel_do_bootstrap_install
=20
     # pip install would normally generate [console_scripts] in ${bindir}
     install -d ${D}/${bindir}
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/=
meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index 9d2c2fd744..7cd67b85f9 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -22,9 +22,7 @@ DEPENDS:remove:class-native =3D "python3-pip-native pyt=
hon3-setuptools-native"
 DEPENDS:append:class-native =3D " unzip-native"
=20
 do_install:class-native() {
-    # Bootstrap to prevent dependency loop in python3-pip-native
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.w=
hl
+    pip_install_wheel_do_bootstrap_install
 }
=20
 RDEPENDS:${PN} =3D "\
diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/=
recipes-devtools/python/python3-wheel_0.37.1.bb
index 83a7c986a8..cf0d8191b4 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -13,9 +13,7 @@ SRC_URI +=3D " file://0001-Backport-pyproject.toml-from=
-flit-backend-branch.patch"
 DEPENDS:remove:class-native =3D "python3-pip-native"
=20
 do_install:class-native () {
-    # We need to bootstrap python3-wheel-native
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.w=
hl
+    pip_install_wheel_do_bootstrap_install
=20
     # pip install would normally generate [project.scripts] in ${bindir}
     install -d ${D}/${bindir}
--=20
2.25.1


