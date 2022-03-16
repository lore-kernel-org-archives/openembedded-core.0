Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A93EC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 18:32:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.379.1647455570203925795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC8D21476
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CD2F3F766
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] classes/flit_core: rename to python_flit_core
Date: Wed, 16 Mar 2022 18:32:42 +0000
Message-Id: <20220316183243.876234-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316183243.876234-1-ross.burton@arm.com>
References: <20220316183243.876234-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 18:32:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163353

To be more uniform with the other new Python classes, rename this to
python_flit_core and update the recipes that use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/{flit_core.bbclass =3D> python_flit_core.bbclass} | 2 +-
 meta/recipes-devtools/python/python3-flit-core_3.7.1.bb      | 2 +-
 meta/recipes-devtools/python/python3-installer_0.5.1.bb      | 2 +-
 meta/recipes-devtools/python/python3-tomli_2.0.1.bb          | 2 +-
 meta/recipes-devtools/python/python3-wheel_0.37.1.bb         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/classes/{flit_core.bbclass =3D> python_flit_core.bbclass} (8=
4%)

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/python_flit_co=
re.bbclass
similarity index 84%
rename from meta/classes/flit_core.bbclass
rename to meta/classes/python_flit_core.bbclass
index 81fdf93e47..eef361bb1b 100644
--- a/meta/classes/flit_core.bbclass
+++ b/meta/classes/python_flit_core.bbclass
@@ -4,7 +4,7 @@ DEPENDS +=3D "python3 python3-flit-core-native"
=20
 PEP517_BUILD_API =3D "flit_core.buildapi"
=20
-flit_core_do_configure () {
+python_flit_core_do_configure () {
     :
 }
=20
diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/me=
ta/recipes-devtools/python/python3-flit-core_3.7.1.bb
index dc815acf08..8d107384a6 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41eb78fa8a87=
2983a882c694a8305f08"
=20
 SRC_URI[sha256sum] =3D "3c9bd9c140515bfe62dd938c6610d10d6efb9e35cc647fc6=
14fe5fb3a5036682"
=20
-inherit pypi flit_core
+inherit pypi python_flit_core
=20
 # Need to install by hand as there's a dependency loop
 DEPENDS:remove:class-native =3D " python3-installer-native"
diff --git a/meta/recipes-devtools/python/python3-installer_0.5.1.bb b/me=
ta/recipes-devtools/python/python3-installer_0.5.1.bb
index 12d9fce249..f4f9e1bde6 100644
--- a/meta/recipes-devtools/python/python3-installer_0.5.1.bb
+++ b/meta/recipes-devtools/python/python3-installer_0.5.1.bb
@@ -10,7 +10,7 @@ SRC_URI +=3D "file://interpreter.patch"
=20
 SRC_URI[sha256sum] =3D "f970995ec2bb815e2fdaf7977b26b2091e1e386f0f42eafd=
5ac811953dc5d445"
=20
-inherit pypi flit_core
+inherit pypi python_flit_core
=20
 DEPENDS:remove:class-native =3D "python3-installer-native"
 DEPENDS:append:class-native =3D " unzip-native"
diff --git a/meta/recipes-devtools/python/python3-tomli_2.0.1.bb b/meta/r=
ecipes-devtools/python/python3-tomli_2.0.1.bb
index f8b423bbef..6118a6a9c3 100644
--- a/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
+++ b/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
@@ -6,7 +6,7 @@ BUGTRACKER =3D "https://github.com/hukkin/tomli/issues"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daaaaf0879d17df0110d1aa8c8c9f4=
6f5"
=20
-inherit pypi flit_core
+inherit pypi python_flit_core
=20
 SRC_URI[sha256sum] =3D "de526c12914f0c550d15924c62d72abc48d6fe7364aa8732=
8337a31007fe8a4f"
=20
diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/=
recipes-devtools/python/python3-wheel_0.37.1.bb
index efd6c2f968..2f7dd122ba 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D10;endl=
ine=3D10;md5=3D8227180126797a01
=20
 SRC_URI[sha256sum] =3D "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b6=
5a5e39d49529c1c4"
=20
-inherit flit_core pypi
+inherit python_flit_core pypi
=20
 SRC_URI +=3D " file://0001-Backport-pyproject.toml-from-flit-backend-bra=
nch.patch"
=20
--=20
2.25.1


