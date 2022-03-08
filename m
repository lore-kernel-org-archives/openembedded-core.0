Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B590C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:32:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10209.1646757131052147159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95A761516
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40FC93FA45
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] python3-setuptools3: clean up PYPA_WHEEL usage
Date: Tue,  8 Mar 2022 16:32:01 +0000
Message-Id: <20220308163206.4039089-2-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/162936

There's no need to set PYPA_WHEEL as the default is sufficient.

Remove the use of PYPA_WHEEL in the native do_install() as this variable
will be disappearing shortly.

Remove the bbfatal_log in the native do_install(), if this breaks then
something has gone very wrong and the user is not expected to fix it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-setuptools_59.5.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/=
meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index 2155101d30..9d2c2fd744 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -21,13 +21,10 @@ DEPENDS +=3D "${PYTHON_PN}"
 DEPENDS:remove:class-native =3D "python3-pip-native python3-setuptools-n=
ative"
 DEPENDS:append:class-native =3D " unzip-native"
=20
-PYPA_WHEEL ?=3D "${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
-
 do_install:class-native() {
     # Bootstrap to prevent dependency loop in python3-pip-native
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
-    bbfatal_log "Failed to unzip wheel: ${PYPA_WHEEL}. Check the logs."
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PIP_INSTALL_DIST_PATH}/*.w=
hl
 }
=20
 RDEPENDS:${PN} =3D "\
--=20
2.25.1


