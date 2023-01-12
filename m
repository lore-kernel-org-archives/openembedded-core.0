Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E63FC61DB3
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:23:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52586.1673522622681963492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 03:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62ED9AD7;
	Thu, 12 Jan 2023 03:24:24 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1CDA3F67D;
	Thu, 12 Jan 2023 03:23:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/4] python_pep517: use python3-build, not picobuild
Date: Thu, 12 Jan 2023 11:23:35 +0000
Message-Id: <20230112112336.2254765-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112112336.2254765-1-ross.burton@arm.com>
References: <20230112112336.2254765-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 11:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175793

Now that the bootstrap sequence for pypa/build is just
python3-packaging, and python3-pyproject-hooks, we can use build instead
of picobuild.

The only change visible outside of this class is that the variable
PEP517_PICOBUILD_OPTS is now PEP517_BUILD_OPTS, but I'm only aware of one
recipe that used that variable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_pep517.bbclass             |  7 ++++---
 meta/recipes-devtools/python/python3-build_0.10.0.bb  | 11 ++++++++++-
 .../python/python3-flit-core_3.8.0.bb                 |  2 +-
 .../python/python3-installer_0.6.0.bb                 |  2 +-
 .../recipes-devtools/python/python3-packaging_22.0.bb |  7 +++++++
 .../python/python3-pyproject-hooks_1.0.0.bb           |  7 +++++++
 6 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-rec=
ipe/python_pep517.bbclass
index 202dde0bc31..a1659c5f628 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -10,7 +10,7 @@
 # This class will build a wheel in do_compile, and use pypa/installer to=
 install
 # it in do_install.
=20
-DEPENDS:append =3D " python3-picobuild-native python3-installer-native"
+DEPENDS:append =3D " python3-build-native python3-installer-native"
=20
 # Where to execute the build process from
 PEP517_SOURCE_PATH ?=3D "${S}"
@@ -18,7 +18,8 @@ PEP517_SOURCE_PATH ?=3D "${S}"
 # The directory where wheels will be written
 PEP517_WHEEL_PATH ?=3D "${WORKDIR}/dist"
=20
-PEP517_PICOBUILD_OPTS ?=3D ""
+# Other options to pass to build
+PEP517_BUILD_OPTS ?=3D ""
=20
 # The interpreter to use for installed scripts
 PEP517_INSTALL_PYTHON =3D "python3"
@@ -36,7 +37,7 @@ python_pep517_do_configure () {
 # When we have Python 3.11 we can parse pyproject.toml to determine the =
build
 # API entry point directly
 python_pep517_do_compile () {
-    nativepython3 -m picobuild --source ${PEP517_SOURCE_PATH} --dest ${P=
EP517_WHEEL_PATH} --wheel ${PEP517_PICOBUILD_OPTS}
+    nativepython3 -m build --no-isolation --wheel --outdir ${PEP517_WHEE=
L_PATH} ${PEP517_SOURCE_PATH} ${PEP517_BUILD_OPTS}
 }
 do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
=20
diff --git a/meta/recipes-devtools/python/python3-build_0.10.0.bb b/meta/=
recipes-devtools/python/python3-build_0.10.0.bb
index bebc00a437d..770a32023d8 100644
--- a/meta/recipes-devtools/python/python3-build_0.10.0.bb
+++ b/meta/recipes-devtools/python/python3-build_0.10.0.bb
@@ -7,7 +7,16 @@ SRC_URI[sha256sum] =3D "d5b71264afdb5951d6704482aac78de8=
87c80691c52b88a9ad195983ca
=20
 inherit pypi python_flit_core
=20
-DEPENDS +=3D "python3-packaging-native python3-pyproject-hooks-native"
+DEPENDS +=3D "python3-pyproject-hooks-native"
+
+DEPENDS:remove:class-native =3D "python3-build-native"
+
+# Skip dependencies as we're doing a minimal build to bootstrap
+PEP517_BUILD_OPTS:class-native =3D "--skip-dependency-check"
+
+do_compile:prepend:class-native() {
+    export PYTHONPATH=3D"${S}/src"
+}
=20
 RDEPENDS:${PN} +=3D "python3-packaging python3-pyproject-hooks"
=20
diff --git a/meta/recipes-devtools/python/python3-flit-core_3.8.0.bb b/me=
ta/recipes-devtools/python/python3-flit-core_3.8.0.bb
index 3d815d53163..2e5b1e80695 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.8.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.8.0.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "d0f2a8f4bd45dc794befbf5839ecc0f=
d3830d65a57bd52b5997542fac5
 inherit pypi python_flit_core
=20
 # Need to install by hand as there's a dependency loop
-DEPENDS:remove:class-native =3D " python3-picobuild-native python3-insta=
ller-native"
+DEPENDS:remove:class-native =3D " python3-build-native python3-installer=
-native"
 DEPENDS:append:class-native =3D " unzip-native"
=20
 # We need the full flit tarball
diff --git a/meta/recipes-devtools/python/python3-installer_0.6.0.bb b/me=
ta/recipes-devtools/python/python3-installer_0.6.0.bb
index e728e47cecb..a2130a4507a 100644
--- a/meta/recipes-devtools/python/python3-installer_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-installer_0.6.0.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "f3bd36cd261b440a88a1190b1becca0=
578fee90b4b62decc796932fdd5
 inherit pypi python_flit_core
=20
 # Bootstrap the native build
-DEPENDS:remove:class-native =3D "python3-picobuild-native python3-instal=
ler-native"
+DEPENDS:remove:class-native =3D "python3-build-native python3-installer-=
native"
=20
 INSTALL_WHEEL_COMPILE_BYTECODE:class-native =3D "--no-compile-bytecode"
=20
diff --git a/meta/recipes-devtools/python/python3-packaging_22.0.bb b/met=
a/recipes-devtools/python/python3-packaging_22.0.bb
index bcf077d2c71..22f066416b7 100644
--- a/meta/recipes-devtools/python/python3-packaging_22.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_22.0.bb
@@ -8,3 +8,10 @@ SRC_URI[sha256sum] =3D "2198ec20bd4c017b8f9717e00f0c8714=
076fc2fd93816750ab48e2c41d
 inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# Bootstrap the native build
+DEPENDS:remove:class-native =3D "python3-build-native"
+
+do_compile:class-native () {
+    python_flit_core_do_manual_build
+}
diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.b=
b b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
index 10d8225c3d5..9aca5918ec1 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
@@ -10,3 +10,10 @@ inherit pypi python_flit_core
 PYPI_PACKAGE =3D "pyproject_hooks"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# Bootstrap the native build
+DEPENDS:remove:class-native =3D "python3-build-native"
+
+do_compile:class-native () {
+    python_flit_core_do_manual_build
+}
--=20
2.34.1


