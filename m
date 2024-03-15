Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DFDC54E68
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 14:38:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23985.1710513474978042443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 07:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAD25DA7
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:38:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F37503F73F
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:37:53 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python-*: don't set PYPI_ARCHIVE_NAME and S when PYPI_PACKAGE is sufficient
Date: Fri, 15 Mar 2024 14:37:50 +0000
Message-Id: <20240315143751.1235135-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315143751.1235135-1-ross.burton@arm.com>
References: <20240315143751.1235135-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 14:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197137

From: Ross Burton <ross.burton@arm.com>

There's no need to explicitly set PYPI_ARCHIVE_NAME and S when
PYPI_PACKAGE is set correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-jsonschema-specifications_2023.12.1.bb   | 6 ++----
 meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb   | 4 ++--
 meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb      | 4 +---
 .../python/python3-sphinxcontrib-applehelp_1.0.8.bb         | 5 ++---
 .../python/python3-sphinxcontrib-devhelp_1.0.6.bb           | 5 +----
 .../python/python3-sphinxcontrib-htmlhelp_2.0.5.bb          | 5 +----
 .../python/python3-sphinxcontrib-qthelp_1.0.7.bb            | 5 +----
 .../python/python3-sphinxcontrib-serializinghtml_1.1.10.bb  | 5 +----
 8 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-jsonschema-specificatio=
ns_2023.12.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifi=
cations_2023.12.1.bb
index bffd59a719e..eb63509fce4 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2023=
.12.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2023=
.12.1.bb
@@ -9,10 +9,8 @@ SRC_URI[sha256sum] =3D "48a76787b3e70f5ed53f1160d2b81f58=
6e4ca6d1548c5de7085d168267
=20
 inherit pypi python_hatchling
=20
-DEPENDS +=3D "${PYTHON_PN}-hatch-vcs-native"
-
-S =3D "${WORKDIR}/jsonschema_specifications-${PV}"
+PYPI_PACKAGE =3D "jsonschema_specifications"
=20
-PYPI_ARCHIVE_NAME =3D "jsonschema_specifications-${PV}.${PYPI_PACKAGE_EX=
T}"
+DEPENDS +=3D "${PYTHON_PN}-hatch-vcs-native"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb b/=
meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
index dfb29c4b863..540fdffaeda 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM =3D "\
 SRC_URI[sha256sum] =3D "fa7a4001eae8aa572ee84f35feb510b321bd652e5cf92932=
49d62853e1f935a2"
=20
 inherit python_poetry_core pypi
-PYPI_ARCHIVE_NAME =3D "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
-S =3D "${WORKDIR}/poetry_core-${PV}"
+
+PYPI_PACKAGE =3D "poetry_core"
=20
 RDEPENDS:${PN}:append:class-target =3D "\
     python3-compression \
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb b/met=
a/recipes-devtools/python/python3-rpds-py_0.18.0.bb
index 01fb3d47ce7..cece2cb8ccd 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb
@@ -10,8 +10,6 @@ require ${BPN}-crates.inc
=20
 inherit pypi cargo-update-recipe-crates python_maturin
=20
-S =3D "${WORKDIR}/rpds_py-${PV}"
-
-PYPI_ARCHIVE_NAME =3D "rpds_py-${PV}.${PYPI_PACKAGE_EXT}"
+PYPI_PACKAGE =3D "rpds_py"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp=
_1.0.8.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_=
1.0.8.bb
index 6ea7c516d50..67dd299b72b 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.=
bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.=
bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7715857042d4c=
8c0105999ca0c072c5"
=20
 SRC_URI[sha256sum] =3D "c40a4f96f3776c4393d933412053962fac2b84f4c99a7982=
ba42e09576a70619"
=20
-inherit pypi python_flit_core
+PYPI_PACKAGE =3D "sphinxcontrib_applehelp"
=20
-PYPI_ARCHIVE_NAME =3D "sphinxcontrib_applehelp-${PV}.${PYPI_PACKAGE_EXT}=
"
-S =3D "${WORKDIR}/sphinxcontrib_applehelp-${PV}"
+inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1=
.0.6.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.=
6.bb
index dd7ba3dc956..31f77a0a141 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
@@ -5,11 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfd30d9972a142=
c857a80c9f312e92b93"
=20
 SRC_URI[sha256sum] =3D "9893fd3f90506bc4b97bdb977ceb8fbd823989f4316b28c3=
841ec128544372d3"
=20
-PYPI_PACKAGE =3D "sphinxcontrib-devhelp"
+PYPI_PACKAGE =3D "sphinxcontrib_devhelp"
=20
 inherit pypi python_flit_core
=20
-PYPI_ARCHIVE_NAME =3D "sphinxcontrib_devhelp-${PV}.${PYPI_PACKAGE_EXT}"
-S =3D "${WORKDIR}/sphinxcontrib_devhelp-${PV}"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_=
2.0.5.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.=
0.5.bb
index 532d1fc22aa..e30c61c3980 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.b=
b
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.b=
b
@@ -5,11 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D24dce5ef6a135=
63241c24bc366f48886"
=20
 SRC_URI[sha256sum] =3D "0dc87637d5de53dd5eec3a6a01753b1ccf99494bd756aafe=
cd74b4fa9e729015"
=20
-PYPI_PACKAGE =3D "sphinxcontrib-htmlhelp"
+PYPI_PACKAGE =3D "sphinxcontrib_htmlhelp"
=20
 inherit pypi python_flit_core
=20
-PYPI_ARCHIVE_NAME =3D "sphinxcontrib_htmlhelp-${PV}.${PYPI_PACKAGE_EXT}"
-S =3D "${WORKDIR}/sphinxcontrib_htmlhelp-${PV}"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.=
0.7.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.=
bb
index b24f7f8e6fe..2225ec521e7 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
@@ -5,11 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df7a83b72ea86d=
04827575ec0b63430eb"
=20
 SRC_URI[sha256sum] =3D "053dedc38823a80a7209a80860b16b722e9e0209e32fea98=
c90e4e6624588ed6"
=20
-PYPI_PACKAGE =3D "sphinxcontrib-qthelp"
+PYPI_PACKAGE =3D "sphinxcontrib_qthelp"
=20
 inherit pypi python_flit_core
=20
-PYPI_ARCHIVE_NAME =3D "sphinxcontrib_qthelp-${PV}.${PYPI_PACKAGE_EXT}"
-S =3D "${WORKDIR}/sphinxcontrib_qthelp-${PV}"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializi=
nghtml_1.1.10.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-ser=
ializinghtml_1.1.10.bb
index b13bc829775..49be5200f0f 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_=
1.1.10.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_=
1.1.10.bb
@@ -5,11 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D32a84ac5cd3bb=
d10c4d479233ad588b6"
=20
 SRC_URI[sha256sum] =3D "93f3f5dc458b91b192fe10c397e324f262cf163d79f3282c=
158e8436a2c4511f"
=20
-PYPI_PACKAGE =3D "sphinxcontrib-serializinghtml"
+PYPI_PACKAGE =3D "sphinxcontrib_serializinghtml"
=20
 inherit pypi python_flit_core
=20
-PYPI_ARCHIVE_NAME =3D "sphinxcontrib_serializinghtml-${PV}.${PYPI_PACKAG=
E_EXT}"
-S =3D "${WORKDIR}/sphinxcontrib_serializinghtml-${PV}"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


