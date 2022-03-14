Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0696EC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:39:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26857.1647268767856121871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2BDDED1
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:39:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F4203F7D7
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:39:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v2 2/2] python_pep517: use installer instead of pip
Date: Mon, 14 Mar 2022 14:39:23 +0000
Message-Id: <20220314143923.939188-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314143923.939188-1-ross.burton@arm.com>
References: <20220314143923.939188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:39:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163151

Instead of battling pip to install a wheel, use installer. Installer
does one thing, so it's faster and easier to work with.

This means setuptools, pip, and wheel are no longer part of the
bootstrap phase, so they can be built normally.  To avoid sysroot file
conflicts these three recipes can't install .pyc files to the native
sysroot.

We currently patch pypa/installer to allow us to override the interpreter
used, which means we can drop the interpreter seding.

We don't need to recompile any Python which is found in $bindir as
Python doesn't actually load those files.

Across a build of oe-core, the only differences between using pip and
installer are:

- the .dist-info/RECORD files are ordered differently
- the .dist-info/REQUESTED and INSTALLER files are not created
- the hashbang in native scripts is "/usr/bin/env nativepython" instead
  of pointing directly at the native sysroot python3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/python_pep517.bbclass            | 27 +++-----------
 .../python/python3-flit-core_3.7.1.bb         |  2 +-
 .../python/python3-pip_22.0.3.bb              | 35 +++----------------
 .../python/python3-setuptools_59.5.0.bb       | 12 +++----
 .../python/python3-wheel_0.37.1.bb            | 26 +++-----------
 5 files changed, 18 insertions(+), 84 deletions(-)

diff --git a/meta/classes/python_pep517.bbclass b/meta/classes/python_pep=
517.bbclass
index 756333bcf2..ac7c1e44c6 100644
--- a/meta/classes/python_pep517.bbclass
+++ b/meta/classes/python_pep517.bbclass
@@ -1,7 +1,7 @@
 # Common infrastructure for Python packages that use PEP-517 compliant p=
ackaging.
 # https://www.python.org/dev/peps/pep-0517/
=20
-DEPENDS:append =3D " python3-pip-native"
+DEPENDS:append =3D " python3-installer-native"
=20
 # Where to execute the build process from
 PEP517_SOURCE_PATH ?=3D "${S}"
@@ -11,19 +11,11 @@ PEP517_SOURCE_PATH ?=3D "${S}"
 # a recipe wants to install prebuilt wheels.
 PEP517_WHEEL_PATH ?=3D "${WORKDIR}/dist"
=20
-PIP_INSTALL_ARGS =3D "\
-    -vvvv \
-    --ignore-installed \
-    --no-cache \
-    --no-deps \
-    --no-index \
-    --root=3D${D} \
-    --prefix=3D${prefix} \
-"
-
 PEP517_INSTALL_PYTHON =3D "python3"
 PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
=20
+INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
+
 python_pep517_do_install () {
     COUNT=3D$(find ${PEP517_WHEEL_PATH} -name '*.whl' | wc -l)
     if test $COUNT -eq 0; then
@@ -32,18 +24,7 @@ python_pep517_do_install () {
         bbfatal More than one wheel found in ${PEP517_WHEEL_PATH}, this =
should not happen
     fi
=20
-    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PEP517_WHEEL_PATH=
}/*.whl
-
-    cd ${D}
-    for i in ${D}${bindir}/* ${D}${sbindir}/*; do
-        if [ -f "$i" ]; then
-            sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PEP517=
_INSTALL_PYTHON}," $i
-            sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PEP517_INSTALL_P=
YTHON}:g" $i
-            sed -i -e "s:${STAGING_BINDIR_NATIVE}:${bindir}:g" $i
-            # Not everything we find may be Python, so ignore errors
-            nativepython3 -mpy_compile $(realpath --relative-to=3D${D} $=
i) || true
-        fi
-    done
+    nativepython3 -m installer ${INSTALL_WHEEL_COMPILE_BYTECODE} --inter=
preter "${USRBINPATH}/env ${PEP517_INSTALL_PYTHON}" --destdir=3D${D} ${PE=
P517_WHEEL_PATH}/*.whl
 }
=20
 # A manual do_install that just uses unzip for bootstrapping purposes. C=
allers should DEPEND on unzip-native.
diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/me=
ta/recipes-devtools/python/python3-flit-core_3.7.1.bb
index b12b8e42d7..dc815acf08 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "3c9bd9c140515bfe62dd938c6610d10=
d6efb9e35cc647fc614fe5fb3a5
 inherit pypi flit_core
=20
 # Need to install by hand as there's a dependency loop
-DEPENDS:remove:class-native =3D " python3-pip-native"
+DEPENDS:remove:class-native =3D " python3-installer-native"
 DEPENDS:append:class-native =3D " unzip-native"
=20
 # We need the full flit tarball
diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/re=
cipes-devtools/python/python3-pip_22.0.3.bb
index bfeeee789c..9ca8fbc1e5 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -6,43 +6,14 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030"
=20
 inherit pypi setuptools_build_meta
=20
-DEPENDS +=3D "python3"
-
-# To avoid a dependency loop; we bootstrap -native
-DEPENDS:remove:class-native =3D "python3-pip-native"
-DEPENDS:append:class-native =3D " unzip-native"
-
 SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
 SRC_URI +=3D "file://no_shebang_mangling.patch"
 SRC_URI +=3D "file://reproducible.patch"
=20
 SRC_URI[sha256sum] =3D "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c53=
49d70aa581b333d0"
=20
-do_install:class-native() {
-    python_pep517_do_bootstrap_install
-
-    # pip install would normally generate [console_scripts] in ${bindir}
-    install -d ${D}/${bindir}
-    # We will skip the ${bindir}/pip variant as we would just remove it =
in the do_install:append
-    cat << EOF >> ${D}/${bindir}/pip3 | tee ${D}/${bindir}/pip${PYTHON_B=
ASEVERSION}
-#!/bin/sh
-'''exec' ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} "\$0"=
 "\$@"
-' '''
-# -*- coding: utf-8 -*-
-import re
-import sys
-from pip._internal.cli.main import main
-if __name__ =3D=3D '__main__':
-    sys.argv[0] =3D re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
-    sys.exit(main())
-EOF
-    chmod 0755 ${D}${bindir}/pip3 ${D}${bindir}/pip${PYTHON_BASEVERSION}
-}
-
 do_install:append() {
-    if [ -e ${D}/${bindir}/pip ]; then
-        rm ${D}/${bindir}/pip
-    fi
+    rm -f ${D}/${bindir}/pip
 }
=20
 RDEPENDS:${PN} =3D "\
@@ -59,3 +30,7 @@ RDEPENDS:${PN} =3D "\
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# This used to use the bootstrap install which didn't compile. Until we =
bump the
+# tmpdir version we can't compile the native otherwise the sysroot unpac=
k fails
+INSTALL_WHEEL_COMPILE_BYTECODE:class-native =3D "--no-compile-bytecode"
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/=
meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index d93972b9a0..35bec19e33 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -17,14 +17,6 @@ SRC_URI[sha256sum] =3D "d144f85102f999444d06f9c0e8c737=
fd0194f10f2f7e5fdb77573f6e2f
=20
 DEPENDS +=3D "${PYTHON_PN}"
=20
-# Avoid dependency loop; we bootstrap -native
-DEPENDS:remove:class-native =3D "python3-pip-native python3-setuptools-n=
ative"
-DEPENDS:append:class-native =3D " unzip-native"
-
-do_install:class-native() {
-    python_pep517_do_bootstrap_install
-}
-
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-2to3 \
     ${PYTHON_PN}-compile \
@@ -59,3 +51,7 @@ RDEPENDS:${PYTHON_PN}-pkg-resources =3D "\
     ${PYTHON_PN}-plistlib \
     ${PYTHON_PN}-pprint \
 "
+
+# This used to use the bootstrap install which didn't compile. Until we =
bump the
+# tmpdir version we can't compile the native otherwise the sysroot unpac=
k fails
+INSTALL_WHEEL_COMPILE_BYTECODE:class-native =3D "--no-compile-bytecode"
diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/=
recipes-devtools/python/python3-wheel_0.37.1.bb
index a339e65824..efd6c2f968 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -10,26 +10,8 @@ inherit flit_core pypi
=20
 SRC_URI +=3D " file://0001-Backport-pyproject.toml-from-flit-backend-bra=
nch.patch"
=20
-DEPENDS:remove:class-native =3D "python3-pip-native"
-
-do_install:class-native () {
-    python_pep517_do_bootstrap_install
-
-    # pip install would normally generate [project.scripts] in ${bindir}
-    install -d ${D}/${bindir}
-    cat << EOF >> ${D}/${bindir}/wheel
-#!/bin/sh
-'''exec' ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} "\$0"=
 "\$@"
-' '''
-# -*- coding: utf-8 -*-
-import re
-import sys
-from wheel.cli import main
-if __name__ =3D=3D '__main__':
-    sys.argv[0] =3D re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
-    sys.exit(main())
-EOF
-    chmod 0755 ${D}${bindir}/wheel
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
+
+# This used to use the bootstrap install which didn't compile. Until we =
bump the
+# tmpdir version we can't compile the native otherwise the sysroot unpac=
k fails
+INSTALL_WHEEL_COMPILE_BYTECODE:class-native =3D "--no-compile-bytecode"
--=20
2.25.1


