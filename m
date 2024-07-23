Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C54C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 16:03:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.834.1721750631213559320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 09:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BC081007
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 09:04:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 42F083F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 09:03:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libcap-ng: clean up recipe
Date: Tue, 23 Jul 2024 17:03:46 +0100
Message-Id: <20240723160346.2247691-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 16:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202410

This package is split into two recipes, one of the actual C library and
one for the Python bindings.

- Move common inherits into the common .inc.
- Clean up install in the python recipe
- Remove obsolete setuptools dependency
- Remove obsolete explicit .debug packaging
- Update homepage as freecode.com redirects to the top of SourceForge

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libcap-ng/libcap-ng-python_0.8.5.bb        | 18 ++++--------------
 meta/recipes-support/libcap-ng/libcap-ng.inc   |  4 +++-
 .../libcap-ng/libcap-ng_0.8.5.bb               |  2 --
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb b/m=
eta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
index 4790134ae9f..f8a6b2c3177 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
@@ -4,26 +4,16 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/libcap-ng:"
=20
 SUMMARY .=3D " - python"
=20
-inherit lib_package autotools python3targetconfig
+inherit python3targetconfig
=20
-# drop setuptools when version > 0.8.3 is released; it's needed only for=
 distutils
-DEPENDS +=3D "libcap-ng python3 swig-native python3-setuptools-native"
+DEPENDS +=3D "libcap-ng python3 swig-native"
=20
 S =3D "${WORKDIR}/libcap-ng-${PV}"
=20
 EXTRA_OECONF +=3D "--with-python3"
=20
-do_install:append() {
-    rm -rf ${D}${bindir}
-    rm -rf ${D}${libdir}/.debug
-    rm -f ${D}${libdir}/lib*
-    rm -rf ${D}${libdir}/pkgconfig
-    rm -rf ${D}${datadir}
-    rm -rf ${D}${includedir}
+do_install() {
+    oe_runmake 'DESTDIR=3D${D}' install -C ${B}/bindings/python3
 }
=20
-# PACKAGES =3D "${PN}"
-
 FILES:${PN} =3D "${libdir}/python${PYTHON_BASEVERSION}"
-FILES:${PN}-dbg =3D+ "${PYTHON_SITEPACKAGES_DIR}/.debug/_capng.so"
-
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-=
support/libcap-ng/libcap-ng.inc
index 12b4002d117..85b51c4dc67 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -1,7 +1,7 @@
 SUMMARY =3D "An alternate posix capabilities library"
 DESCRIPTION =3D "The libcap-ng library is intended to make programming \
 with POSIX capabilities much easier than the traditional libcap library.=
"
-HOMEPAGE =3D "http://freecode.com/projects/libcap-ng"
+HOMEPAGE =3D "https://github.com/stevegrubb/libcap-ng"
 SECTION =3D "base"
 LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
@@ -13,6 +13,8 @@ SRC_URI =3D "https://people.redhat.com/sgrubb/libcap-ng=
/libcap-ng-${PV}.tar.gz \
=20
 SRC_URI[sha256sum] =3D "3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185=
dfd844cc8c7ac6ff"
=20
+inherit lib_package autotools
+
 EXTRA_OECONF:append:class-target =3D " --with-capability_header=3D${STAG=
ING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk =3D " --with-capability_header=3D${S=
TAGING_INCDIR}/linux/capability.h"
=20
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb b/meta/rec=
ipes-support/libcap-ng/libcap-ng_0.8.5.bb
index 3dbe3e2ffd9..b482368a41b 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
@@ -1,7 +1,5 @@
 require libcap-ng.inc
=20
-inherit lib_package autotools
-
 EXTRA_OECONF +=3D "--without-python3"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


