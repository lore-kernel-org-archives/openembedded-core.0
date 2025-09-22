Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56650CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:21:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.53335.1758550862249882136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 07:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 705061424
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:20:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3D5C03F66E
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:21:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] libdnf: remove non-functional gtk-doc support
Date: Mon, 22 Sep 2025 15:20:30 +0100
Message-ID: <20250922142031.3625684-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922142031.3625684-1-ross.burton@arm.com>
References: <20250922142031.3625684-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 14:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223828

The gtk-doc integration doesn't actually work, as it isn't built by
default and the targets need to be triggered manually.

As clearly nobody was using it, and upstream appears to prefer doxygen
for API documentation, remove the gtk-doc support.

This also means adding gettext to the dependencies, as this was being
pulled in via gtk-doc before but is actually needed for the translations.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-drop-the-requirement-for-GTKDOC_SCA.patch | 28 -------------------
 meta/recipes-devtools/libdnf/libdnf_0.74.0.bb | 11 ++++----
 2 files changed, 6 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.c=
make-drop-the-requirement-for-GTKDOC_SCA.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-dr=
op-the-requirement-for-GTKDOC_SCA.patch b/meta/recipes-devtools/libdnf/li=
bdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
deleted file mode 100644
index 0bd5eeb1dae..00000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-=
requirement-for-GTKDOC_SCA.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 45d06c71976823c610a4719731b68dcd6096888e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 24 Nov 2016 14:33:07 +0200
-Subject: [PATCH] FindGtkDoc.cmake: drop the requirement for
- GTKDOC_SCANGOBJ_WRAPPER
-
-For some reason cmake is not able to find it when building in openembedd=
ed,
-and it's bundled with the source code anyway.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/l=
ibdnf/pull/312]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- cmake/modules/FindGtkDoc.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/modules/FindGtkDoc.cmake b/cmake/modules/FindGtkDoc.c=
make
-index 92b2cc7e..39f34bd5 100644
---- a/cmake/modules/FindGtkDoc.cmake
-+++ b/cmake/modules/FindGtkDoc.cmake
-@@ -52,7 +52,7 @@ find_program(GTKDOC_MKHTML_EXE gtkdoc-mkhtml PATH "${G=
LIB_PREFIX}/bin")
- find_program(GTKDOC_FIXXREF_EXE gtkdoc-fixxref PATH "${GLIB_PREFIX}/bin=
")
-=20
- find_package_handle_standard_args(GtkDoc
--    REQUIRED_VARS GTKDOC_SCAN_EXE GTKDOC_SCANGOBJ_EXE GTKDOC_SCANGOBJ_W=
RAPPER GTKDOC_MKDB_EXE GTKDOC_MKHTML_EXE GTKDOC_FIXXREF_EXE
-+    REQUIRED_VARS GTKDOC_SCAN_EXE GTKDOC_SCANGOBJ_EXE GTKDOC_MKDB_EXE G=
TKDOC_MKHTML_EXE GTKDOC_FIXXREF_EXE
-     VERSION_VAR GtkDoc_VERSION)
-=20
- # ::
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb b/meta/recipes=
-devtools/libdnf/libdnf_0.74.0.bb
index aa9e18e763f..fafd8c5905a 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
@@ -5,7 +5,6 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
 SRC_URI =3D "git://github.com/rpm-software-management/libdnf;branch=3Ddn=
f-4-master;protocol=3Dhttps \
-           file://0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_=
SCA.patch \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own=
-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-li=
bdn.patch \
            file://enable_test_data_dir_set.patch \
@@ -17,14 +16,16 @@ SRC_URI =3D "git://github.com/rpm-software-management=
/libdnf;branch=3Ddnf-4-master;p
 SRCREV =3D "91a0bf9aada36a722855051526f012e0b5ab1af9"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
=20
-DEPENDS =3D "glib-2.0 libsolv librepo rpm gtk-doc libmodulemd json-c swi=
g-native util-linux"
+DEPENDS =3D "glib-2.0 libsolv librepo rpm libmodulemd json-c swig-native=
 util-linux"
=20
-inherit gtk-doc cmake pkgconfig setuptools3-base
+inherit cmake pkgconfig setuptools3-base gettext
=20
-EXTRA_OECMAKE =3D " -DPYTHON_INSTALL_DIR=3D${PYTHON_SITEPACKAGES_DIR} -D=
WITH_MAN=3DOFF -DPYTHON_DESIRED=3D3 \
+EXTRA_OECMAKE =3D " -DPYTHON_INSTALL_DIR=3D${PYTHON_SITEPACKAGES_DIR} -D=
PYTHON_DESIRED=3D3 \
+                  -DWITH_GTKDOC=3DOFF -DWITH_MAN=3DOFF -DWITH_HTML=3DOFF=
 \
                   -DWITH_TESTS=3DOFF \
                   -DWITH_ZCHUNK=3DOFF \
-                  -DWITH_HTML=3DOFF \
                 "
+
 BBCLASSEXTEND =3D "native nativesdk"
+
 SKIP_RECIPE[libdnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES', 'packa=
ge_rpm', '', 'Does not build without package_rpm in PACKAGE_CLASSES due d=
isabled rpm support in libsolv', d)}"
--=20
2.43.0


