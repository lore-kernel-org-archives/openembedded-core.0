Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94536C3DA70
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45949.1721746313938231802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 119981476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A4B33F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/37] python3-pyasn1: merge bb/inc
Date: Tue, 23 Jul 2024 15:51:21 +0100
Message-Id: <20240723145137.74198-21-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202388

As there's just a single user of the include, merge them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python-pyasn1.inc | 31 ------------------
 .../python/python3-pyasn1_0.6.0.bb            | 32 +++++++++++++++++--
 2 files changed, 30 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-pyasn1.inc

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipe=
s-devtools/python/python-pyasn1.inc
deleted file mode 100644
index 7b269f2940f..00000000000
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY =3D "Python library implementing ASN.1 types."
-HOMEPAGE =3D "http://pyasn1.sourceforge.net/"
-LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D190f79253908c986e6cacf380=
c3a5f6d"
-
-SRC_URI[sha256sum] =3D "3a35ab2c4b5ef98e17dfdec8ab074046fbda76e281c5a706=
ccd82328cfc8f64c"
-
-RDEPENDS:${PN}:class-target +=3D " \
-    python3-codecs \
-    python3-logging \
-    python3-math \
-    python3-shell \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-inherit ptest
-
-SRC_URI +=3D " \
-       file://run-ptest \
-           "
-
-RDEPENDS:${PN}-ptest +=3D " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb b/meta/=
recipes-devtools/python/python3-pyasn1_0.6.0.bb
index 0519ba5edb0..c321f4e58e5 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
@@ -1,3 +1,31 @@
-inherit pypi setuptools3
-require python-pyasn1.inc
+SUMMARY =3D "Python library implementing ASN.1 types."
+HOMEPAGE =3D "http://pyasn1.sourceforge.net/"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D190f79253908c986e6cacf380=
c3a5f6d"
=20
+SRC_URI[sha256sum] =3D "3a35ab2c4b5ef98e17dfdec8ab074046fbda76e281c5a706=
ccd82328cfc8f64c"
+
+inherit pypi setuptools3 pytest
+
+RDEPENDS:${PN}:class-target +=3D " \
+    python3-codecs \
+    python3-logging \
+    python3-math \
+    python3-shell \
+"
+
+SRC_URI +=3D " \
+       file://run-ptest \
+           "
+
+RDEPENDS:${PN}-ptest +=3D " \
+	python3-pytest \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


