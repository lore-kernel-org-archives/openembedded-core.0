Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB14C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:32:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10211.1646757131562660696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2806B1650
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C823A3FA45
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] python3-wheel: clean up PYPA_WHEEL usage
Date: Tue,  8 Mar 2022 16:32:02 +0000
Message-Id: <20220308163206.4039089-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308163206.4039089-1-ross.burton@arm.com>
References: <20220308163206.4039089-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 16:32:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162938

Remove the use of PYPA_WHEEL in the native do_install() as this variable
will be disappearing shortly.

Remove the bbfatal_log in the native do_install(), if this breaks then
something has gone very wrong and the user is not expected to fix it.

Also flit_core inherits setuptools3-base, so no need to inherit it again.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-wheel_0.37.1.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/=
recipes-devtools/python/python3-wheel_0.37.1.bb
index 91bff82509..83a7c986a8 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D10;endl=
ine=3D10;md5=3D8227180126797a01
=20
 SRC_URI[sha256sum] =3D "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b6=
5a5e39d49529c1c4"
=20
-inherit flit_core pypi setuptools3-base
+inherit flit_core pypi
=20
 SRC_URI +=3D " file://0001-Backport-pyproject.toml-from-flit-backend-bra=
nch.patch"
=20
@@ -15,9 +15,7 @@ DEPENDS:remove:class-native =3D "python3-pip-native"
 do_install:class-native () {
     # We need to bootstrap python3-wheel-native
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    PYPA_WHEEL=3D"${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
-    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
-    bbfatal_log "Failed to install"
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.w=
hl
=20
     # pip install would normally generate [project.scripts] in ${bindir}
     install -d ${D}/${bindir}
@@ -37,4 +35,3 @@ EOF
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
--=20
2.25.1


