Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A3DBD73173
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:51 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546622"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:51 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:43 +0200
Message-Id: <e23af58a7379e425e388a27734975b6f179ed3b7.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/36] libcomps: add a recipe
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:51 -0000

libcomps is required by dnf.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch | 41 ++++++++++++++++++++++
 ...2-Set-library-installation-path-correctly.patch | 27 ++++++++++++++
 meta/recipes-devtools/libcomps/libcomps_git.bb     | 23 ++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps_git.bb

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
new file mode 100644
index 00000000000..26e8b06f378
--- /dev/null
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -0,0 +1,41 @@
+From ff4aae4c8beaf17cb8e7a3431f6c541eccfae244 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:22:09 +0200
+Subject: [PATCH 1/2] Do not set PYTHON_INSTALL_DIR by running python.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libcomps/src/python/src/python2/CMakeLists.txt | 2 +-
+ libcomps/src/python/src/python3/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libcomps/src/python/src/python2/CMakeLists.txt b/libcomps/src/python/src/python2/CMakeLists.txt
+index 3ad9e18..0e7dd4b 100644
+--- a/libcomps/src/python/src/python2/CMakeLists.txt
++++ b/libcomps/src/python/src/python2/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ find_package (PythonLibs 2.6)
+ find_package (PythonInterp 2.6 REQUIRED)
+ 
+-execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+ 
+ include_directories(${PYTHON_INCLUDE_PATH})
+ include_directories(${LIBCOMPS_INCLUDE_PATH})
+diff --git a/libcomps/src/python/src/python3/CMakeLists.txt b/libcomps/src/python/src/python3/CMakeLists.txt
+index 7fafa9f..ed82d3d 100644
+--- a/libcomps/src/python/src/python3/CMakeLists.txt
++++ b/libcomps/src/python/src/python3/CMakeLists.txt
+@@ -2,7 +2,7 @@ find_package (PythonLibs 3.0)
+ find_package (PythonInterp 3.0)
+ #add_custom_target(py3-copy)
+ 
+-execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#execute_process (COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+ 
+ include_directories(${PYTHON_INCLUDE_PATH})
+ include_directories(${LIBCOMPS_INCLUDE_PATH})
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch b/meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch
new file mode 100644
index 00000000000..ec1fdc409bf
--- /dev/null
+++ b/meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch
@@ -0,0 +1,27 @@
+From b1f61296e2f16c2b9a39c5501e4538628ff01ab4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:26:00 +0200
+Subject: [PATCH 2/2] Set library installation path correctly
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libcomps/src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcomps/src/CMakeLists.txt b/libcomps/src/CMakeLists.txt
+index e553d77..e2eef9c 100644
+--- a/libcomps/src/CMakeLists.txt
++++ b/libcomps/src/CMakeLists.txt
+@@ -52,7 +52,7 @@ add_dependencies(libcomps src-copy)
+ IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
+     SET (LIB_SUFFIX "64")
+ ENDIF (CMAKE_SIZEOF_VOID_P MATCHES "8")
+-set (LIB_INST_DIR ${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX})
++set (LIB_INST_DIR ${CMAKE_INSTALL_LIBDIR})
+ 
+ 
+ install (FILES ${libcomps_HEADERS} DESTINATION include/libcomps)
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
new file mode 100644
index 00000000000..448ea62f67c
--- /dev/null
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Libcomps is alternative for yum.comps library (which is for managing rpm package groups)."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
+           file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
+           file://0002-Set-library-installation-path-correctly.patch \
+           "
+
+PV = "0.1.8+git${SRCPV}"
+SRCREV = "01a4759894cccff64d2561614a58281adf5ce859"
+
+S = "${WORKDIR}/git"
+
+inherit cmake distutils-base
+
+DEPENDS = "libxml2 expat libcheck"
+
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
+OECMAKE_SOURCEPATH = "${S}/libcomps"
+
+BBCLASSEXTEND = "native"
+
-- 
2.11.0


