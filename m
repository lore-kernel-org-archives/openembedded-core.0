Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42B7C7EE2A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 16:08:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21556.1684426104058154081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 09:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB4312F4;
	Thu, 18 May 2023 09:09:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 689C53F762;
	Thu, 18 May 2023 09:08:22 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] python3-gitdb: remove python3-async dependency
Date: Thu, 18 May 2023 17:08:20 +0100
Message-Id: <20230518160821.3661890-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 16:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181525

From: Ross Burton <ross.burton@arm.com>

The dependency on the async module was removed back in 0.6.0 (November
2014).

Whilst here, also merge the bb/inc and stop using PYTHON_PN, as we only
support Python 3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python-gitdb.inc | 23 -------------------
 .../python/python3-gitdb_4.0.10.bb            | 23 +++++++++++++++++--
 2 files changed, 21 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-gitdb.inc

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes=
-devtools/python/python-gitdb.inc
deleted file mode 100644
index d92d6453d84..00000000000
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =3D "A pure-Python git object database"
-HOMEPAGE =3D "http://github.com/gitpython-developers/gitdb"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D59e5ecb13339a936eedf83282eaf4=
528"
-
-inherit pypi
-
-PYPI_PACKAGE =3D "gitdb"
-
-SRC_URI[sha256sum] =3D "6eb990b69df4e15bad899ea868dc46572c3f75339735663b=
81de79b06f17eb9a"
-
-DEPENDS =3D "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_=
PN}-smmap"
-
-RDEPENDS:${PN} +=3D "${PYTHON_PN}-async \
-                   ${PYTHON_PN}-compression \
-                   ${PYTHON_PN}-crypt \
-                   ${PYTHON_PN}-io \
-                   ${PYTHON_PN}-mmap \
-                   ${PYTHON_PN}-shell \
-                   ${PYTHON_PN}-smmap \
-"
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.10.bb b/meta/=
recipes-devtools/python/python3-gitdb_4.0.10.bb
index 2dcd9c8affb..3a430c30f09 100644
--- a/meta/recipes-devtools/python/python3-gitdb_4.0.10.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_4.0.10.bb
@@ -1,3 +1,22 @@
-inherit setuptools3
-require python-gitdb.inc
+SUMMARY =3D "A pure-Python git object database"
+HOMEPAGE =3D "http://github.com/gitpython-developers/gitdb"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D59e5ecb13339a936eedf83282eaf4=
528"
=20
+DEPENDS =3D "python3-smmap"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE =3D "gitdb"
+
+SRC_URI[sha256sum] =3D "6eb990b69df4e15bad899ea868dc46572c3f75339735663b=
81de79b06f17eb9a"
+
+RDEPENDS:${PN} +=3D "python3-compression \
+                   python3-crypt \
+                   python3-io \
+                   python3-mmap \
+                   python3-shell \
+                   python3-smmap \
+"
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


