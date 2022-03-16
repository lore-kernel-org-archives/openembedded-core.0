Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2656DC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 18:32:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.439.1647455571597451941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F3EF1515
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F83A3F766
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] classes/python_pep517: consolidate stub do_configure
Date: Wed, 16 Mar 2022 18:32:43 +0000
Message-Id: <20220316183243.876234-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316183243.876234-1-ross.burton@arm.com>
References: <20220316183243.876234-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 18:32:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163354

As PEP517 doesn't have an explicit configure step, we can stub out the
do_configure task once instead of the calling classes doing it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/python_flit_core.bbclass      | 6 ------
 meta/classes/python_pep517.bbclass         | 8 +++++++-
 meta/classes/python_poetry_core.bbclass    | 6 ------
 meta/classes/setuptools_build_meta.bbclass | 6 ------
 4 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/meta/classes/python_flit_core.bbclass b/meta/classes/python_=
flit_core.bbclass
index eef361bb1b..96652aa204 100644
--- a/meta/classes/python_flit_core.bbclass
+++ b/meta/classes/python_flit_core.bbclass
@@ -3,9 +3,3 @@ inherit python_pep517 python3native python3-dir setuptool=
s3-base
 DEPENDS +=3D "python3 python3-flit-core-native"
=20
 PEP517_BUILD_API =3D "flit_core.buildapi"
-
-python_flit_core_do_configure () {
-    :
-}
-
-EXPORT_FUNCTIONS do_configure
diff --git a/meta/classes/python_pep517.bbclass b/meta/classes/python_pep=
517.bbclass
index 73bcf9ba07..34ffdc9c0d 100644
--- a/meta/classes/python_pep517.bbclass
+++ b/meta/classes/python_pep517.bbclass
@@ -22,6 +22,12 @@ PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
 # pypa/installer option to control the bytecode compilation
 INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
=20
+# PEP517 doesn't have a specific configure step, so set an empty do_conf=
igure to avoid
+# running base_do_configure.
+python_pep517_do_configure () {
+    :
+}
+
 # When we have Python 3.11 we can parse pyproject.toml to determine the =
build
 # API entry point directly
 python_pep517_do_compile () {
@@ -47,4 +53,4 @@ python_pep517_do_bootstrap_install () {
     unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PEP517_WHEEL_PATH}/*.whl
 }
=20
-EXPORT_FUNCTIONS do_compile do_install
+EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes/python_poetry_core.bbclass b/meta/classes/pytho=
n_poetry_core.bbclass
index 3fecb6c6bb..577663b8f1 100644
--- a/meta/classes/python_poetry_core.bbclass
+++ b/meta/classes/python_poetry_core.bbclass
@@ -3,9 +3,3 @@ inherit python_pep517 python3native setuptools3-base
 DEPENDS +=3D "python3-poetry-core-native"
=20
 PEP517_BUILD_API =3D "poetry.core.masonry.api"
-
-python_poetry_core_do_configure () {
-    :
-}
-
-EXPORT_FUNCTIONS do_configure
diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/se=
tuptools_build_meta.bbclass
index 62b037363d..b2bba35a0b 100644
--- a/meta/classes/setuptools_build_meta.bbclass
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -3,9 +3,3 @@ inherit setuptools3-base python_pep517
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
=20
 PEP517_BUILD_API =3D "setuptools.build_meta"
-
-setuptools_build_meta_do_configure () {
-    :
-}
-
-EXPORT_FUNCTIONS do_configure
--=20
2.25.1


