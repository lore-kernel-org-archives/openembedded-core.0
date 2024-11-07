Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6D4D5D67A
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 17:24:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.78033.1731000254849724109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 09:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57887497
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:44 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1323D3F6A8
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 7/8] python3-*: inherit cython
Date: Thu,  7 Nov 2024 17:24:03 +0000
Message-Id: <20241107172404.4017047-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107172404.4017047-1-ross.burton@arm.com>
References: <20241107172404.4017047-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206848

Change recipes that depend on python3-cython-native to inherit cython
instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-cython_3.0.11.bb           | 32 +++----------------
 .../python/python3-numpy_1.26.4.bb            |  4 +--
 .../python/python3-pyyaml_6.0.2.bb            |  4 +--
 3 files changed, 7 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cython_3.0.11.bb b/meta=
/recipes-devtools/python/python3-cython_3.0.11.bb
index efce67d0921..020a8e7205c 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.11.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
@@ -10,42 +10,20 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D61c3ee=
8961575861fa86c7e62bc9f69c"
 SRC_URI +=3D "file://0001-WIP-prefix-map.patch"
 SRC_URI[sha256sum] =3D "7146dd2af8682b4ca61331851e6aebce9fe5158e75300343=
f80c07ca80b1faff"
=20
-inherit pypi setuptools3
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "Cython"
+inherit pypi setuptools3 cython
=20
-do_install:append() {
-	# Make sure we use /usr/bin/env python3
-	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
-		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
-	done
+# No need to depend on self
+DEPENDS:remove =3D "python3-cython-native"
=20
-    # remove build paths from generated sources
-    sed -i -e 's|${WORKDIR}||' ${S}/Cython/*.c ${S}/Cython/Compiler/*.c =
${S}/Cython/Plex/*.c
+UPSTREAM_CHECK_PYPI_PACKAGE =3D "Cython"
=20
+do_install:append() {
     # rename scripts that would conflict with the Python 2 build of Cyth=
on
     mv ${D}${bindir}/cython ${D}${bindir}/cython3
     mv ${D}${bindir}/cythonize ${D}${bindir}/cythonize3
     mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
 }
=20
-PACKAGESPLITFUNCS =3D+ "cython_fix_sources"
-
-cython_fix_sources () {
-	for f in ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FlowControl.c \
-		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FusedNode.c \
-		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Scanning.c \
-		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Visitor.c \
-		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Actions.c \
-		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Scanners.c \
-		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Runtime/refnanny.c \
-		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Tempita/_tempita.c \
-		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
-		if [ -e $f ]; then
-			sed -i -e 's#${WORKDIR}/cython-${PV}#${TARGET_DBGSRC_DIR}#g' $f
-		fi
-	done
-}
-
 RDEPENDS:${PN}:class-target +=3D "\
     python3-misc \
     python3-netserver \
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/=
recipes-devtools/python/python3-numpy_1.26.4.bb
index 95614361be0..7de92f687c3 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
@@ -18,9 +18,7 @@ SRC_URI[sha256sum] =3D "2a02aba9ed12e4ac4eb3ea9421c4203=
01a0c6460d9830d74a9df87efa4
 GITHUB_BASE_URI =3D "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
=20
-DEPENDS +=3D "python3-cython-native"
-
-inherit ptest setuptools3 github-releases
+inherit ptest setuptools3 github-releases cython
=20
 S =3D "${WORKDIR}/numpy-${PV}"
 # numpy built with setuptools fails to build correctly when out-of-tree,=
 so
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb b/meta/=
recipes-devtools/python/python3-pyyaml_6.0.2.bb
index 10e61274b07..9f9320a5949 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
@@ -4,8 +4,6 @@ HOMEPAGE =3D "https://pyyaml.org/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d8242660a8371add5fe547adf083=
079"
=20
-DEPENDS +=3D "python3-cython-native"
-
 SRC_URI[sha256sum] =3D "d584d9ec91ad65861cc08d42e834324ef890a082e591037a=
be114850ff7bbc3e"
=20
 SRC_URI +=3D "\
@@ -16,7 +14,7 @@ SRC_URI[test.sha256sum] =3D "b6a8a2825d89fdc8aee226560f=
66b8196e872012a0ea7118cbef1
=20
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "PyYAML"
=20
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest cython
=20
 PACKAGECONFIG ?=3D "libyaml"
 PACKAGECONFIG[libyaml] =3D "--with-libyaml,--without-libyaml,libyaml"
--=20
2.34.1


