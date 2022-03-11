Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A86BC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 12:02:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4497.1647000131756506165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 04:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 787921763
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 04:02:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27E693F99C
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 04:02:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] meta: rename pip_install_wheel.bbclass to
 python_pep517.bbclass
Date: Fri, 11 Mar 2022 12:02:05 +0000
Message-Id: <20220311120205.3020751-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311120205.3020751-1-ross.burton@arm.com>
References: <20220311120205.3020751-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 12:02:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163049

pip_install_wheel shouldn't restricted to just using Pip to install
wheels (the installer module is simplier and likely a better option),
and in the future may be extended to also provide do_compile() using
the build module.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/flit_core.bbclass                |  6 ++---
 ...ll_wheel.bbclass =3D> python_pep517.bbclass} | 27 ++++++++++---------
 meta/classes/setuptools3.bbclass              |  8 +++---
 meta/classes/setuptools_build_meta.bbclass    |  6 ++---
 .../python/python3-flit-core_3.7.1.bb         |  2 +-
 .../python/python3-wheel_0.37.1.bb            |  2 +-
 6 files changed, 27 insertions(+), 24 deletions(-)
 rename meta/classes/{pip_install_wheel.bbclass =3D> python_pep517.bbclas=
s} (56%)

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbcl=
ass
index ce162bb75b..1ef8ce9429 100644
--- a/meta/classes/flit_core.bbclass
+++ b/meta/classes/flit_core.bbclass
@@ -1,4 +1,4 @@
-inherit pip_install_wheel python3native python3-dir setuptools3-base
+inherit python_pep517 python3native python3-dir setuptools3-base
=20
 DEPENDS +=3D "python3 python3-flit-core-native"
=20
@@ -12,8 +12,8 @@ PEP517_SOURCE_PATH ?=3D "${S}"
 # TODO: ideally this uses pypa/build
 flit_core_do_compile () {
     cd ${PEP517_SOURCE_PATH}
-    nativepython3 -mflit_core.wheel --outdir ${PIP_INSTALL_DIST_PATH}
+    nativepython3 -mflit_core.wheel --outdir ${PEP517_WHEEL_PATH}
 }
-do_compile[cleandirs] +=3D "${PIP_INSTALL_DIST_PATH}"
+do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
=20
 EXPORT_FUNCTIONS do_configure do_compile
diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/python=
_pep517.bbclass
similarity index 56%
rename from meta/classes/pip_install_wheel.bbclass
rename to meta/classes/python_pep517.bbclass
index 29cd544aa3..76660e70f8 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/python_pep517.bbclass
@@ -1,9 +1,12 @@
+# Common infrastructure for Python packages that use PEP-517 compliant p=
ackaging.
+# https://www.python.org/dev/peps/pep-0517/
+
 DEPENDS:append =3D " python3-pip-native"
=20
 # The directory where wheels should be written too. Build classes
 # will ideally [cleandirs] this but we don't do that here in case
 # a recipe wants to install prebuilt wheels.
-PIP_INSTALL_DIST_PATH ?=3D "${WORKDIR}/dist"
+PEP517_WHEEL_PATH ?=3D "${WORKDIR}/dist"
=20
 PIP_INSTALL_ARGS =3D "\
     -vvvv \
@@ -15,24 +18,24 @@ PIP_INSTALL_ARGS =3D "\
     --prefix=3D${prefix} \
 "
=20
-PIP_INSTALL_PYTHON =3D "python3"
-PIP_INSTALL_PYTHON:class-native =3D "nativepython3"
+PEP517_INSTALL_PYTHON =3D "python3"
+PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
=20
-pip_install_wheel_do_install () {
-    COUNT=3D$(find ${PIP_INSTALL_DIST_PATH} -name '*.whl' | wc -l)
+python_pep517_do_install () {
+    COUNT=3D$(find ${PEP517_WHEEL_PATH} -name '*.whl' | wc -l)
     if test $COUNT -eq 0; then
-        bbfatal No wheels found in ${PIP_INSTALL_DIST_PATH}
+        bbfatal No wheels found in ${PEP517_WHEEL_PATH}
     elif test $COUNT -gt 1; then
-        bbfatal More than one wheel found in ${PIP_INSTALL_DIST_PATH}, t=
his should not happen
+        bbfatal More than one wheel found in ${PEP517_WHEEL_PATH}, this =
should not happen
     fi
=20
-    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PIP_INSTALL_DIST_=
PATH}/*.whl
+    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PEP517_WHEEL_PATH=
}/*.whl
=20
     cd ${D}
     for i in ${D}${bindir}/* ${D}${sbindir}/*; do
         if [ -f "$i" ]; then
-            sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PIP_IN=
STALL_PYTHON}," $i
-            sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PIP_INSTALL_PYTH=
ON}:g" $i
+            sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PEP517=
_INSTALL_PYTHON}," $i
+            sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PEP517_INSTALL_P=
YTHON}:g" $i
             sed -i -e "s:${STAGING_BINDIR_NATIVE}:${bindir}:g" $i
             # Not everything we find may be Python, so ignore errors
             nativepython3 -mpy_compile $(realpath --relative-to=3D${D} $=
i) || true
@@ -41,9 +44,9 @@ pip_install_wheel_do_install () {
 }
=20
 # A manual do_install that just uses unzip for bootstrapping purposes. C=
allers should DEPEND on unzip-native.
-pip_install_wheel_do_bootstrap_install () {
+python_pep517_do_bootstrap_install () {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.w=
hl
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PEP517_WHEEL_PATH}/*.whl
 }
=20
 EXPORT_FUNCTIONS do_install
diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.=
bbclass
index dcf3561b8d..556bc801af 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -1,4 +1,4 @@
-inherit setuptools3-base pip_install_wheel
+inherit setuptools3-base python_pep517
=20
 # bdist_wheel builds in ./dist
 #B =3D "${WORKDIR}/build"
@@ -17,14 +17,14 @@ setuptools3_do_compile() {
         STAGING_INCDIR=3D${STAGING_INCDIR} \
         STAGING_LIBDIR=3D${STAGING_LIBDIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py \
-        bdist_wheel --verbose --dist-dir ${PIP_INSTALL_DIST_PATH} ${SETU=
PTOOLS_BUILD_ARGS} || \
+        bdist_wheel --verbose --dist-dir ${PEP517_WHEEL_PATH} ${SETUPTOO=
LS_BUILD_ARGS} || \
         bbfatal_log "'${PYTHON_PN} setup.py bdist_wheel ${SETUPTOOLS_BUI=
LD_ARGS}' execution failed."
 }
 setuptools3_do_compile[vardepsexclude] =3D "MACHINE"
-do_compile[cleandirs] +=3D "${PIP_INSTALL_DIST_PATH}"
+do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
=20
 setuptools3_do_install() {
-        pip_install_wheel_do_install
+        python_pep517_do_install
 }
=20
 EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/se=
tuptools_build_meta.bbclass
index 787fbd5f36..424be85608 100644
--- a/meta/classes/setuptools_build_meta.bbclass
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -1,4 +1,4 @@
-inherit pip_install_wheel setuptools3-base
+inherit setuptools3-base python_pep517
=20
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
=20
@@ -12,8 +12,8 @@ setuptools_build_meta_do_configure () {
 # TODO: ideally this uses pypa/build
 setuptools_build_meta_do_compile () {
     cd ${PEP517_SOURCE_PATH}
-    nativepython3 -c "from setuptools import build_meta; build_meta.buil=
d_wheel('${PIP_INSTALL_DIST_PATH}')"
+    nativepython3 -c "from setuptools import build_meta; build_meta.buil=
d_wheel('${PEP517_WHEEL_PATH}')"
 }
-do_compile[cleandirs] +=3D "${PIP_INSTALL_DIST_PATH}"
+do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
=20
 EXPORT_FUNCTIONS do_configure do_compile
diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/me=
ta/recipes-devtools/python/python3-flit-core_3.7.1.bb
index 1f14345d50..b12b8e42d7 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
@@ -21,7 +21,7 @@ PYPI_PACKAGE =3D "flit"
 PEP517_SOURCE_PATH =3D "${S}/flit_core"
=20
 do_install:class-native () {
-    pip_install_wheel_do_bootstrap_install
+    python_pep517_do_bootstrap_install
 }
=20
 PACKAGES =3D+ "${PN}-tests"
diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/=
recipes-devtools/python/python3-wheel_0.37.1.bb
index cf0d8191b4..a339e65824 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -13,7 +13,7 @@ SRC_URI +=3D " file://0001-Backport-pyproject.toml-from=
-flit-backend-branch.patch"
 DEPENDS:remove:class-native =3D "python3-pip-native"
=20
 do_install:class-native () {
-    pip_install_wheel_do_bootstrap_install
+    python_pep517_do_bootstrap_install
=20
     # pip install would normally generate [project.scripts] in ${bindir}
     install -d ${D}/${bindir}
--=20
2.25.1


