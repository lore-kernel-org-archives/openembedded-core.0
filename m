Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEF1C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 14:02:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16205.1636725761136727881
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73E4DED1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DB763F70D
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] dtc: merge .bb/.inc
Date: Fri, 12 Nov 2021 14:02:32 +0000
Message-Id: <20211112140237.575404-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 14:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158219

No reason for these to be split, so merge them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/dtc/dtc.inc      | 28 ----------------------------
 meta/recipes-kernel/dtc/dtc_1.6.1.bb | 28 ++++++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc.inc

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dt=
c.inc
deleted file mode 100644
index b8a6b34f0c..0000000000
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY =3D "Device Tree Compiler"
-HOMEPAGE =3D "https://devicetree.org/"
-DESCRIPTION =3D "The Device Tree Compiler is a tool used to manipulate t=
he Open-Firmware-like device tree used by PowerPC kernels."
-SECTION =3D "bootloader"
-LICENSE =3D "GPLv2 | BSD-2-Clause"
-DEPENDS =3D "flex-native bison-native"
-
-SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter \
-           file://make_install.patch \
-           file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch=
 \
-           "
-
-UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
-
-EXTRA_OEMAKE=3D'NO_PYTHON=3D1 PREFIX=3D"${prefix}" LIBDIR=3D"${libdir}" =
DESTDIR=3D"${D}"'
-
-inherit pkgconfig
-
-S =3D "${WORKDIR}/git"
-
-do_install () {
-	oe_runmake install
-}
-
-PACKAGES =3D+ "${PN}-misc"
-FILES:${PN}-misc =3D "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}=
/dtdiff"
-
-RDEPENDS:${PN}-misc +=3D "bash diffutils"
diff --git a/meta/recipes-kernel/dtc/dtc_1.6.1.bb b/meta/recipes-kernel/d=
tc/dtc_1.6.1.bb
index de9a46d3ef..979b610576 100644
--- a/meta/recipes-kernel/dtc/dtc_1.6.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.1.bb
@@ -1,10 +1,34 @@
-require dtc.inc
+SUMMARY =3D "Device Tree Compiler"
+HOMEPAGE =3D "https://devicetree.org/"
+DESCRIPTION =3D "The Device Tree Compiler is a tool used to manipulate t=
he Open-Firmware-like device tree used by PowerPC kernels."
+SECTION =3D "bootloader"
+LICENSE =3D "GPLv2 | BSD-2-Clause"
+DEPENDS =3D "flex-native bison-native"
=20
 LIC_FILES_CHKSUM =3D "file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
-		    file://libfdt/libfdt.h;beginline=3D4;endline=3D7;md5=3D05bb357cfb7=
5cae7d2b01d2ee8d76407"
+                    file://libfdt/libfdt.h;beginline=3D4;endline=3D7;md5=
=3D05bb357cfb75cae7d2b01d2ee8d76407"
=20
+SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter \
+           file://make_install.patch \
+           file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch=
 \
+           "
 SRCREV =3D "b6910bec11614980a21e46fbccc35934b671bd81"
=20
+UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
+
+EXTRA_OEMAKE=3D'NO_PYTHON=3D1 PREFIX=3D"${prefix}" LIBDIR=3D"${libdir}" =
DESTDIR=3D"${D}"'
+
+inherit pkgconfig
+
 S =3D "${WORKDIR}/git"
=20
+do_install () {
+	oe_runmake install
+}
+
+PACKAGES =3D+ "${PN}-misc"
+FILES:${PN}-misc =3D "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}=
/dtdiff"
+
+RDEPENDS:${PN}-misc +=3D "bash diffutils"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


