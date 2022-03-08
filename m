Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3ECAC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:30:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8703.1646749840906692608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:30:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AD95139F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 06:30:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 474B43FA58
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 06:30:40 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] python3-flit-core: improve recipe
Date: Tue,  8 Mar 2022 14:30:35 +0000
Message-Id: <20220308143035.3569559-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308143035.3569559-1-ross.burton@arm.com>
References: <20220308143035.3569559-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162927

flit_core can bootstrap itself, so the python3-flit-core recipe can just
inherit flit_core and set PEP517_SOURCE_PATH to the flit_core submodule.

Also setting FILES:${PN} is redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-flit-core_3.7.1.bb          | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/me=
ta/recipes-devtools/python/python3-flit-core_3.7.1.bb
index f5e7506d5d..55ce256550 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
@@ -10,31 +10,22 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41eb78fa8a=
872983a882c694a8305f08"
=20
 SRC_URI[sha256sum] =3D "3c9bd9c140515bfe62dd938c6610d10d6efb9e35cc647fc6=
14fe5fb3a5036682"
=20
-inherit pip_install_wheel python3native python3-dir pypi setuptools3-bas=
e
+inherit pypi flit_core
=20
+# Need to install by hand as there's a dependency loop
 DEPENDS:remove:class-native =3D " python3-pip-native"
 DEPENDS:append:class-native =3D " unzip-native"
=20
 # We need the full flit tarball
 PYPI_PACKAGE =3D "flit"
-
+PEP517_SOURCE_PATH =3D "${S}/flit_core"
 PIP_INSTALL_PACKAGE =3D "flit_core"
-PIP_INSTALL_DIST_PATH =3D "${S}/flit_core/dist"
-
-do_compile () {
-    nativepython3 flit_core/build_dists.py
-}
=20
 do_install:class-native () {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ./flit_core/dist/flit_core-$=
{PV}-py3-none-any.whl
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/fli=
t_core*.whl
 }
=20
-FILES:${PN} +=3D "\
-    ${PYTHON_SITEPACKAGES_DIR}/flit_core/* \
-    ${PYTHON_SITEPACKAGES_DIR}/flit_core-${PV}.dist-info/* \
-"
-
 PACKAGES =3D+ "${PN}-tests"
=20
 FILES:${PN}-tests +=3D "\
@@ -42,4 +33,3 @@ FILES:${PN}-tests +=3D "\
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
--=20
2.25.1


