Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A80ED31763
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 16:12:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23809.1730823157453310225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 08:12:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 026AFFEC
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 08:13:07 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6CAA3F6A8
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 08:12:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] python3-pyyaml: rearrange recipe
Date: Tue,  5 Nov 2024 16:12:27 +0000
Message-Id: <20241105161227.2324296-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105161227.2324296-1-ross.burton@arm.com>
References: <20241105161227.2324296-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 16:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206722

Sort the recipe into a more traditional order, and remove a duplicated
DEPENDS on libyaml.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-pyyaml_6.0.2.bb            | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb b/meta/=
recipes-devtools/python/python3-pyyaml_6.0.2.bb
index a41d073af95..10e61274b07 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb
@@ -1,38 +1,39 @@
 SUMMARY =3D "Python support for YAML"
-DEPENDS +=3D "libyaml python3-cython-native"
 HOMEPAGE =3D "https://pyyaml.org/"
=20
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d8242660a8371add5fe547adf083=
079"
=20
-inherit pypi python_setuptools_build_meta
+DEPENDS +=3D "python3-cython-native"
=20
 SRC_URI[sha256sum] =3D "d584d9ec91ad65861cc08d42e834324ef890a082e591037a=
be114850ff7bbc3e"
+
+SRC_URI +=3D "\
+    https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca57122=
0c966bbfe2ac43c335/tests/test_dump_load.py;name=3Dtest \
+    file://run-ptest \
+"
+SRC_URI[test.sha256sum] =3D "b6a8a2825d89fdc8aee226560f66b8196e872012a0e=
a7118cbef1a832359434a"
+
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "PyYAML"
=20
+inherit pypi python_setuptools_build_meta ptest
+
 PACKAGECONFIG ?=3D "libyaml"
 PACKAGECONFIG[libyaml] =3D "--with-libyaml,--without-libyaml,libyaml"
=20
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${UNPACKDIR}/test_dump_load.py ${D}${PTEST_PATH}/tests/
+}
+
 RDEPENDS:${PN} +=3D "\
     python3-datetime \
     python3-netclient \
 "
=20
-inherit ptest
-SRC_URI +=3D "\
-    https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca57122=
0c966bbfe2ac43c335/tests/test_dump_load.py;name=3Dtest \
-    file://run-ptest \
-"
-SRC_URI[test.sha256sum] =3D "b6a8a2825d89fdc8aee226560f66b8196e872012a0e=
a7118cbef1a832359434a"
-
 RDEPENDS:${PN}-ptest +=3D " \
 	python3-pytest \
 	python3-unittest-automake-output \
 "
=20
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${UNPACKDIR}/test_dump_load.py ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


