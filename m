Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517ABC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 18:32:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.423.1647455567509534059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2301E1515
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C74AF3F766
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] classes/python_pep517: implement a standard do_compile
Date: Wed, 16 Mar 2022 18:32:37 +0000
Message-Id: <20220316183243.876234-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316183243.876234-1-ross.burton@arm.com>
References: <20220316183243.876234-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 18:32:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163348

As all PEP517-compliant build systems have a universal API, we can ask
that users of this class set PEP517_BUILD_API to the class that implement=
s
this API and call it ourselves, instead of users needing to implement
near-identical do_compile tasks themselves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/python_pep517.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/python_pep517.bbclass b/meta/classes/python_pep=
517.bbclass
index ac7c1e44c6..83c6dcb5c7 100644
--- a/meta/classes/python_pep517.bbclass
+++ b/meta/classes/python_pep517.bbclass
@@ -6,6 +6,9 @@ DEPENDS:append =3D " python3-installer-native"
 # Where to execute the build process from
 PEP517_SOURCE_PATH ?=3D "${S}"
=20
+# The PEP517 build API entry point
+PEP517_BUILD_API ?=3D "unset"
+
 # The directory where wheels should be written too. Build classes
 # will ideally [cleandirs] this but we don't do that here in case
 # a recipe wants to install prebuilt wheels.
@@ -16,6 +19,14 @@ PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
=20
 INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
=20
+# When we have Python 3.11 we can parse pyproject.toml to determine the =
build
+# API entry point directly
+python_pep517_do_compile () {
+    cd ${PEP517_SOURCE_PATH}
+    nativepython3 -c "import ${PEP517_BUILD_API} as api; api.build_wheel=
('${PEP517_WHEEL_PATH}')"
+}
+do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
+
 python_pep517_do_install () {
     COUNT=3D$(find ${PEP517_WHEEL_PATH} -name '*.whl' | wc -l)
     if test $COUNT -eq 0; then
@@ -33,4 +44,4 @@ python_pep517_do_bootstrap_install () {
     unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PEP517_WHEEL_PATH}/*.whl
 }
=20
-EXPORT_FUNCTIONS do_install
+EXPORT_FUNCTIONS do_compile do_install
--=20
2.25.1


