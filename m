Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C24CAC5A8
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:21:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.53333.1758550860983796837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 07:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 312971424
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:20:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECB7F3F66E
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:20:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] libdnf: don't depend on libcheck
Date: Mon, 22 Sep 2025 15:20:28 +0100
Message-ID: <20250922142031.3625684-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 14:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223826

Apply a patch to make libcheck optional, so we don't need to depend on
it as we don't install the tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libdnf/libdnf/optional-check.patch        | 52 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.74.0.bb |  4 +-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/optional-check.pa=
tch

diff --git a/meta/recipes-devtools/libdnf/libdnf/optional-check.patch b/m=
eta/recipes-devtools/libdnf/libdnf/optional-check.patch
new file mode 100644
index 00000000000..9228b0560f3
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/optional-check.patch
@@ -0,0 +1,52 @@
+From a4abd42a6b92f6aa16490c0f482bf08c4a6c2864 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 18 Sep 2025 11:23:33 +0100
+Subject: [PATCH] Move libcheck dependency to tests/
+
+If we're not building the tests then there's no point in depending on
+libcheck, so move the pkg_check_modules() call to tests/CMakeLists.
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/li=
bdnf/commit/6a127aec78d2ef837776e0e5a8e3636101a54ab0]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ CMakeLists.txt       | 1 -
+ tests/CMakeLists.txt | 7 +++----
+ 2 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a489ea73..d1969899 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -59,7 +59,6 @@ find_package(LibSolv 0.7.21 REQUIRED COMPONENTS ext)
+=20
+=20
+ # build dependencies via pkg-config
+-pkg_check_modules(CHECK REQUIRED check)
+ pkg_check_modules(GLIB REQUIRED gio-unix-2.0>=3D2.46.0)
+ include_directories(${GLIB_INCLUDE_DIRS})
+ pkg_check_modules(JSONC REQUIRED json-c)
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index e4909682..78743f4e 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -1,3 +1,6 @@
++pkg_check_modules(CHECK REQUIRED check)
++pkg_check_modules(CPPUNIT REQUIRED cppunit)
++
+ add_subdirectory(libdnf/conf)
+ add_subdirectory(libdnf/module/modulemd)
+ add_subdirectory(libdnf/module)
+@@ -7,10 +10,6 @@ add_subdirectory(libdnf/sack)
+ add_subdirectory(hawkey)
+ add_subdirectory(libdnf)
+=20
+-
+-
+-pkg_check_modules(CPPUNIT REQUIRED cppunit)
+-
+ set(LIBDNF_TEST_SOURCES
+     ${LIBDNF_TEST_SOURCES}
+     ${CMAKE_CURRENT_SOURCE_DIR}/run_tests.cpp
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb b/meta/recipes=
-devtools/libdnf/libdnf_0.74.0.bb
index 6ac518564b4..0dce8dc183b 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
@@ -11,12 +11,13 @@ SRC_URI =3D "git://github.com/rpm-software-management=
/libdnf;branch=3Ddnf-4-master;p
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://armarch.patch \
+           file://optional-check.patch \
            "
=20
 SRCREV =3D "91a0bf9aada36a722855051526f012e0b5ab1af9"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
=20
-DEPENDS =3D "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd j=
son-c swig-native util-linux"
+DEPENDS =3D "glib-2.0 libsolv librepo rpm gtk-doc libmodulemd json-c swi=
g-native util-linux"
=20
 inherit gtk-doc gobject-introspection cmake pkgconfig setuptools3-base
=20
@@ -31,4 +32,3 @@ EXTRA_OECMAKE:append:class-nativesdk =3D " -DWITH_GIR=3D=
OFF"
=20
 BBCLASSEXTEND =3D "native nativesdk"
 SKIP_RECIPE[libdnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES', 'packa=
ge_rpm', '', 'Does not build without package_rpm in PACKAGE_CLASSES due d=
isabled rpm support in libsolv', d)}"
-
--=20
2.43.0


