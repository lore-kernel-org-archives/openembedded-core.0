Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8E30372F43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 06:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875559"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:29 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:21 +0200
Message-Id: <9f2b99ee0ef48cba56bd34e39a7395a380086f54.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 04/39] createrepo-c: add a recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2017 14:48:28 -0000

This is the current C reimplementation/replacement of the original createrepo.
https://github.com/rpm-software-management/createrepo_c/wiki

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...0001-Correctly-install-the-shared-library.patch | 28 +++++++++++++++++++
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch | 27 +++++++++++++++++++
 .../createrepo-c/createrepo-c_git.bb               | 31 ++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c_git.bb

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch
new file mode 100644
index 00000000000..01271246a22
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch
@@ -0,0 +1,28 @@
+From fef835e1fdedc72c97d9c3e5704302e56e1bdef0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 2 Jan 2017 17:23:59 +0200
+Subject: [PATCH] Correctly install the shared library
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index f3635e8..46dc037 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -110,7 +110,8 @@ CONFIGURE_FILE("deltarpms.h.in" "${CMAKE_CURRENT_SOURCE_DIR}/deltarpms.h" @ONLY)
+ IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
+     SET (LIB_SUFFIX "64")
+ ENDIF (CMAKE_SIZEOF_VOID_P MATCHES "8")
+-SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
++#SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
++SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")
+ 
+ INSTALL(FILES ${headers} DESTINATION "include/createrepo_c")
+ INSTALL(FILES "createrepo_c.pc" DESTINATION "${LIB_INSTALL_DIR}/pkgconfig")
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
new file mode 100644
index 00000000000..9531070937c
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -0,0 +1,27 @@
+From bef487b5c2515062c5dd73c21082ce42f69aa717 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:31:02 +0200
+Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/python/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
+index 9f1ac64..eae0cbb 100644
+--- a/src/python/CMakeLists.txt
++++ b/src/python/CMakeLists.txt
+@@ -19,7 +19,7 @@ else()
+     FIND_PACKAGE(PythonInterp 3.0 REQUIRED)
+ endif()
+ 
+-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+ INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
+ 
+ MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
new file mode 100644
index 00000000000..1e69067eebf
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "C implementation of createrepo."
+HOMEPAGE = "https://github.com/rpm-software-management/createrepo_c/wiki"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
+           file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
+           file://0001-Correctly-install-the-shared-library.patch \
+           "
+
+PV = "0.10.0+git${SRCPV}"
+SRCREV = "748891ff8ee524c2d37926c608cd2794f88013f3"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
+DEPENDS_append_class-native = " file-replacement-native"
+
+inherit cmake pkgconfig bash-completion distutils-base
+
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
+
+BBCLASSEXTEND = "native"
+
+# Direct createrepo to read rpm configuration from our sysroot, not the one it was compiled in
+do_install_append_class-native() {
+        create_wrapper ${D}/${bindir}/createrepo_c \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm
+}
+
-- 
2.11.0


