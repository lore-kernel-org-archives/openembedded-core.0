Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80588C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:32:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10210.1646757131052342508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D9D6139F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC0603FA45
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] python3-pip: clean up PYPA_WHEEL usage
Date: Tue,  8 Mar 2022 16:32:00 +0000
Message-Id: <20220308163206.4039089-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 16:32:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162937

There's no need to set PYPA_WHEEL as the default is sufficient.

Remove the use of PYPA_WHEEL in the native do_install() as this variable
will be disappearing shortly.

Remove the bbfatal_log in the native do_install(), if this breaks then
something has gone very wrong and the user is not expected to fix it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pip_22.0.3.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/re=
cipes-devtools/python/python3-pip_22.0.3.bb
index 8d6dfcede7..d7000b891a 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -18,13 +18,10 @@ SRC_URI +=3D "file://reproducible.patch"
=20
 SRC_URI[sha256sum] =3D "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c53=
49d70aa581b333d0"
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
=20
     # pip install would normally generate [console_scripts] in ${bindir}
     install -d ${D}/${bindir}
--=20
2.25.1


