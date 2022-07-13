Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE911CCA483
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:28:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.24283.1657729707245133969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60B611C0A;
	Wed, 13 Jul 2022 09:28:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DADF3F792;
	Wed, 13 Jul 2022 09:28:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/8] python_pep517: use picobuild instead of manually calling
 the API
Date: Wed, 13 Jul 2022 17:28:18 +0100
Message-Id: <20220713162821.974801-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713162821.974801-1-ross.burton@arm.com>
References: <20220713162821.974801-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167970

Calling the PEP-517 API directly mostly works, but sometimes doesn't.
For example we don't verify build dependencies, which led to the cbor2
ugprade silently failing to actually package anything.

The standard frontend is pypa/build, but for source-based distributions
that can be annoying to build as it depends on the following packages:

- tomli
- pep517
- packaging
- pyparsing

Manually bootstrapping those recipes is possible, but tedious.

Picobuild is another frontend (written by myself) which is designed
explicitly to be used programatically by source-based distributions: it
doesn't support builds inside virtual environments as we're building
distribution packages, and it vendors the dependencies for bootstrapping
if they're not available.

Over time more packages are expected to move to using Flit to build
which makes the bootstrapping process slightly easier, and tomli will be
integrated into Python 3.11, so it's possible that in the future we
drop picobuild and switch to build.

This change means the PEP517_BUILD_API variable is obsolete, so remove
it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/python_pep517.bbclass                     | 10 ++++------
 .../recipes-devtools/python/python3-flit-core_3.7.1.bb |  2 +-
 .../recipes-devtools/python/python3-installer_0.5.1.bb |  8 ++++++--
 meta/recipes-devtools/python/python3-picobuild_0.1.bb  |  2 ++
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/classes/python_pep517.bbclass b/meta/classes/python_pep=
517.bbclass
index 34ffdc9c0db..7cdb9c8f9df 100644
--- a/meta/classes/python_pep517.bbclass
+++ b/meta/classes/python_pep517.bbclass
@@ -4,17 +4,16 @@
 # This class will build a wheel in do_compile, and use pypa/installer to=
 install
 # it in do_install.
=20
-DEPENDS:append =3D " python3-installer-native"
+DEPENDS:append =3D " python3-picobuild-native python3-installer-native"
=20
 # Where to execute the build process from
 PEP517_SOURCE_PATH ?=3D "${S}"
=20
-# The PEP517 build API entry point
-PEP517_BUILD_API ?=3D "unset"
-
 # The directory where wheels will be written
 PEP517_WHEEL_PATH ?=3D "${WORKDIR}/dist"
=20
+PEP517_PICOBUILD_OPTS ?=3D ""
+
 # The interpreter to use for installed scripts
 PEP517_INSTALL_PYTHON =3D "python3"
 PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
@@ -31,8 +30,7 @@ python_pep517_do_configure () {
 # When we have Python 3.11 we can parse pyproject.toml to determine the =
build
 # API entry point directly
 python_pep517_do_compile () {
-    cd ${PEP517_SOURCE_PATH}
-    nativepython3 -c "import ${PEP517_BUILD_API} as api; api.build_wheel=
('${PEP517_WHEEL_PATH}')"
+    nativepython3 -m picobuild --source ${PEP517_SOURCE_PATH} --dest ${P=
EP517_WHEEL_PATH} --wheel ${PEP517_PICOBUILD_OPTS}
 }
 do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
=20
diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/me=
ta/recipes-devtools/python/python3-flit-core_3.7.1.bb
index abe620374c0..fe6b16ac540 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "3c9bd9c140515bfe62dd938c6610d10=
d6efb9e35cc647fc614fe5fb3a5
 inherit pypi python_flit_core
=20
 # Need to install by hand as there's a dependency loop
-DEPENDS:remove:class-native =3D " python3-installer-native"
+DEPENDS:remove:class-native =3D " python3-picobuild-native python3-insta=
ller-native"
 DEPENDS:append:class-native =3D " unzip-native"
=20
 # We need the full flit tarball
diff --git a/meta/recipes-devtools/python/python3-installer_0.5.1.bb b/me=
ta/recipes-devtools/python/python3-installer_0.5.1.bb
index b7780702d6b..07bbafa81fb 100644
--- a/meta/recipes-devtools/python/python3-installer_0.5.1.bb
+++ b/meta/recipes-devtools/python/python3-installer_0.5.1.bb
@@ -12,11 +12,15 @@ SRC_URI[sha256sum] =3D "f970995ec2bb815e2fdaf7977b26b=
2091e1e386f0f42eafd5ac811953d
=20
 inherit pypi python_flit_core
=20
-# Bootstrap the native install by installing with ourself
-DEPENDS:remove:class-native =3D "python3-installer-native"
+# Bootstrap the native build
+DEPENDS:remove:class-native =3D "python3-picobuild-native python3-instal=
ler-native"
=20
 INSTALL_WHEEL_COMPILE_BYTECODE:class-native =3D "--no-compile-bytecode"
=20
+do_compile:class-native () {
+    python_flit_core_do_manual_build
+}
+
 do_install:prepend:class-native() {
     export PYTHONPATH=3D"${S}/src"
 }
diff --git a/meta/recipes-devtools/python/python3-picobuild_0.1.bb b/meta=
/recipes-devtools/python/python3-picobuild_0.1.bb
index 7555d97f91a..3c92b079f39 100644
--- a/meta/recipes-devtools/python/python3-picobuild_0.1.bb
+++ b/meta/recipes-devtools/python/python3-picobuild_0.1.bb
@@ -18,4 +18,6 @@ S =3D "${WORKDIR}/git"
=20
 inherit python_flit_core
=20
+DEPENDS:remove:class-native =3D "python3-picobuild-native"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


