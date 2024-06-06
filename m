Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58068C27C5F
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 17:20:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20645.1717694420781543657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 10:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CAD72F4
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Jun 2024 10:20:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B77273F792
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Jun 2024 10:20:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-cython: remove redundant .inc file
Date: Thu,  6 Jun 2024 17:20:15 +0000
Message-Id: <20240606172015.3118703-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606172015.3118703-1-ross.burton@arm.com>
References: <20240606172015.3118703-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 17:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200409

There is no python-cython recipe in core, so merge the .bb and .inc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python-cython.inc | 45 ------------------
 .../python/python3-cython_3.0.10.bb           | 47 +++++++++++++++++--
 2 files changed, 42 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-cython.inc

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipe=
s-devtools/python/python-cython.inc
deleted file mode 100644
index 87a2e88a1a7..00000000000
--- a/meta/recipes-devtools/python/python-cython.inc
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY =3D "The Cython language"
-HOMEPAGE =3D "https://pypi.org/project/Cython/"
-DESCRIPTION =3D "Cython is a language specially designed for writing Pyt=
hon extension modules. \
-It's designed to bridge the gap between the nice, high-level, easy-to-us=
e world of Python \
-and the messy, low-level world of C."
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7e62=
bc9f69c"
-PYPI_PACKAGE =3D "Cython"
-BBCLASSEXTEND =3D "native nativesdk"
-
-SRC_URI[sha256sum] =3D "dcc96739331fb854dcf503f94607576cfe8488066c61ca50=
dfd55836f132de99"
-UPSTREAM_CHECK_REGEX =3D "Cython-(?P<pver>.*)\.tar"
-
-inherit pypi
-
-RDEPENDS:${PN}:class-target +=3D "\
-    python3-misc \
-    python3-netserver \
-    python3-pkgutil \
-    python3-pyparsing \
-    python3-setuptools \
-    python3-shell \
-    python3-xml \
-"
-
-RDEPENDS:${PN}:class-nativesdk +=3D "\
-    nativesdk-python3-misc \
-    nativesdk-python3-netserver \
-    nativesdk-python3-pkgutil \
-    nativesdk-python3-pyparsing \
-    nativesdk-python3-setuptools \
-    nativesdk-python3-shell \
-    nativesdk-python3-xml \
-"
-
-do_install:append() {
-	# Make sure we use /usr/bin/env python
-	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
-		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
-	done
-
-        # remove build paths from generated sources
-        sed -i -e 's|${WORKDIR}||' ${S}/Cython/*.c ${S}/Cython/Compiler/=
*.c ${S}/Cython/Plex/*.c
-}
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.10.bb b/meta=
/recipes-devtools/python/python3-cython_3.0.10.bb
index 07638d7ad78..754543e711f 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.10.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.10.bb
@@ -1,9 +1,17 @@
-inherit setuptools3
-require python-cython.inc
+SUMMARY =3D "The Cython language"
+HOMEPAGE =3D "https://pypi.org/project/Cython/"
+DESCRIPTION =3D "Cython is a language specially designed for writing Pyt=
hon extension modules. \
+It's designed to bridge the gap between the nice, high-level, easy-to-us=
e world of Python \
+and the messy, low-level world of C."
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7e62=
bc9f69c"
+PYPI_PACKAGE =3D "Cython"
=20
-RDEPENDS:${PN} +=3D "\
-    python3-setuptools \
-"
+SRC_URI[sha256sum] =3D "dcc96739331fb854dcf503f94607576cfe8488066c61ca50=
dfd55836f132de99"
+UPSTREAM_CHECK_REGEX =3D "Cython-(?P<pver>.*)\.tar"
+
+inherit pypi setuptools3
=20
 # running build_ext a second time during install fails, because Python
 # would then attempt to import cythonized modules built for the target
@@ -11,6 +19,14 @@ RDEPENDS:${PN} +=3D "\
 SETUPTOOLS_INSTALL_ARGS +=3D "--skip-build"
=20
 do_install:append() {
+	# Make sure we use /usr/bin/env python3
+	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
+	done
+
+    # remove build paths from generated sources
+    sed -i -e 's|${WORKDIR}||' ${S}/Cython/*.c ${S}/Cython/Compiler/*.c =
${S}/Cython/Plex/*.c
+
     # rename scripts that would conflict with the Python 2 build of Cyth=
on
     mv ${D}${bindir}/cython ${D}${bindir}/cython3
     mv ${D}${bindir}/cythonize ${D}${bindir}/cythonize3
@@ -35,3 +51,24 @@ cython_fix_sources () {
 	done
 }
=20
+RDEPENDS:${PN}:class-target +=3D "\
+    python3-misc \
+    python3-netserver \
+    python3-pkgutil \
+    python3-pyparsing \
+    python3-setuptools \
+    python3-shell \
+    python3-xml \
+"
+
+RDEPENDS:${PN}:class-nativesdk +=3D "\
+    nativesdk-python3-misc \
+    nativesdk-python3-netserver \
+    nativesdk-python3-pkgutil \
+    nativesdk-python3-pyparsing \
+    nativesdk-python3-setuptools \
+    nativesdk-python3-shell \
+    nativesdk-python3-xml \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


