Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AE9A371DCF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:50 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546613"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:50 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:42 +0200
Message-Id: <089a5dde366f28e2b57168c541c9c08aa9656cdf.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/36] librepo: add a recipe
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:50 -0000

librepo is needed by dnf and libdnf.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ly-set-the-library-installation-directory.patch | 28 +++++++++++++++
 ...to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 41 ++++++++++++++++++++++
 ...-race-when-deleting-temporary-directories.patch | 41 ++++++++++++++++++++++
 ...ariables-with-pkg-config-not-with-cmake-m.patch | 29 +++++++++++++++
 meta/recipes-devtools/librepo/librepo_git.bb       | 24 +++++++++++++
 5 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
 create mode 100644 meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
 create mode 100644 meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
 create mode 100644 meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
 create mode 100644 meta/recipes-devtools/librepo/librepo_git.bb

diff --git a/meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch b/meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
new file mode 100644
index 00000000000..01fea40467e
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
@@ -0,0 +1,28 @@
+From 36d87919223db9b054862ad38cdda8d9222a2bab Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:04:35 +0200
+Subject: [PATCH 1/4] Correctly set the library installation directory
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ librepo/CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/librepo/CMakeLists.txt b/librepo/CMakeLists.txt
+index 2fe76d8..5026def 100644
+--- a/librepo/CMakeLists.txt
++++ b/librepo/CMakeLists.txt
+@@ -60,7 +60,8 @@ CONFIGURE_FILE("version.h.in" "${CMAKE_CURRENT_SOURCE_DIR}/version.h" @ONLY)
+ IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
+   SET (LIB_SUFFIX "64")
+ ENDIF (CMAKE_SIZEOF_VOID_P MATCHES "8")
+-SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
++#SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
++SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")
+ 
+ INSTALL(FILES ${librepo_HEADERS} DESTINATION include/librepo)
+ INSTALL(TARGETS librepo LIBRARY DESTINATION ${LIB_INSTALL_DIR})
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
new file mode 100644
index 00000000000..7138dfce21d
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -0,0 +1,41 @@
+From 1570ad33dd7e5d83f3ee80bd104b114709ac1e34 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:05:36 +0200
+Subject: [PATCH 2/4] Do not try to obtain PYTHON_INSTALL_DIR by running
+ python.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ librepo/python/python2/CMakeLists.txt | 2 +-
+ librepo/python/python3/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/librepo/python/python2/CMakeLists.txt b/librepo/python/python2/CMakeLists.txt
+index 3615e17..cffa99f 100644
+--- a/librepo/python/python2/CMakeLists.txt
++++ b/librepo/python/python2/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ FIND_PACKAGE (PythonLibs 2 )
+ FIND_PACKAGE (PythonInterp 2 REQUIRED)
+-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+ INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
+ 
+ MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
+diff --git a/librepo/python/python3/CMakeLists.txt b/librepo/python/python3/CMakeLists.txt
+index dfecac9..38bcc72 100644
+--- a/librepo/python/python3/CMakeLists.txt
++++ b/librepo/python/python3/CMakeLists.txt
+@@ -10,7 +10,7 @@ message("--- ${PYTHON_INCLUDE_DIR}")
+ 
+ FIND_PACKAGE(PythonLibs 3.0)
+ FIND_PACKAGE(PythonInterp 3.0 REQUIRED)
+-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+ INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
+ 
+ MESSAGE(STATUS "Python3 install dir is ${PYTHON_INSTALL_DIR}")
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch b/meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
new file mode 100644
index 00000000000..0d2fae434ad
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
@@ -0,0 +1,41 @@
+From b1a5c92dbd1d11f1afdc094fccea64de334d2783 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:06:24 +0200
+Subject: [PATCH 3/4] tests: fix a race when deleting temporary directories
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/python/tests/test_yum_repo_downloading.py | 2 +-
+ tests/python/tests/test_yum_repo_locating.py    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/python/tests/test_yum_repo_downloading.py b/tests/python/tests/test_yum_repo_downloading.py
+index ad597dc..4a32519 100644
+--- a/tests/python/tests/test_yum_repo_downloading.py
++++ b/tests/python/tests/test_yum_repo_downloading.py
+@@ -32,7 +32,7 @@ class TestCaseYumRepoDownloading(TestCaseWithFlask):
+             os.environ.pop('GNUPGHOME')
+         else:
+             os.environ['GNUPGHOME'] = self._gnupghome
+-        shutil.rmtree(self.tmpdir)
++        shutil.rmtree(self.tmpdir, True)
+ 
+     def test_download_repo_01(self):
+         h = librepo.Handle()
+diff --git a/tests/python/tests/test_yum_repo_locating.py b/tests/python/tests/test_yum_repo_locating.py
+index 8f4bea5..db4294c 100644
+--- a/tests/python/tests/test_yum_repo_locating.py
++++ b/tests/python/tests/test_yum_repo_locating.py
+@@ -34,7 +34,7 @@ class TestCaseYumRepoLocating(TestCase):
+             os.environ.pop('GNUPGHOME')
+         else:
+             os.environ['GNUPGHOME'] = self._gnupghome
+-        shutil.rmtree(self.tmpdir)
++        shutil.rmtree(self.tmpdir, True)
+ 
+     def test_read_mirrorlist(self):
+         h = librepo.Handle()
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
new file mode 100644
index 00000000000..6665b316cbb
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
@@ -0,0 +1,29 @@
+From a36be8192615e2a1fb5a5856d44565277f15583b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:23:27 +0200
+Subject: [PATCH 4/4] Set gpgme variables with pkg-config, not with cmake
+ module (which doesn't work properly)
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ef07d2d..f1fa09b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -31,7 +31,8 @@ PKG_CHECK_MODULES(GLIB2 glib-2.0 REQUIRED)
+ PKG_SEARCH_MODULE(LIBCRYPTO REQUIRED libcrypto openssl)
+ FIND_PACKAGE(EXPAT REQUIRED)
+ FIND_PACKAGE(CURL REQUIRED)
+-FIND_PACKAGE(Gpgme REQUIRED)
++PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
++set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
+ FIND_PACKAGE(Xattr REQUIRED)
+ 
+ INCLUDE_DIRECTORIES(${GLIB2_INCLUDE_DIRS})
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/librepo/librepo_git.bb b/meta/recipes-devtools/librepo/librepo_git.bb
new file mode 100644
index 00000000000..70e88c47b9e
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = " A library providing C and Python (libcURL like) API for downloading linux repository metadata and packages."
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://github.com/rpm-software-management/librepo.git \
+           file://0001-Correctly-set-the-library-installation-directory.patch \
+           file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
+           file://0003-tests-fix-a-race-when-deleting-temporary-directories.patch \
+           file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
+           "
+
+PV = "1.7.20+git${SRCPV}"
+SRCREV = "e1137cbbda78fecb192146300790680a5bc811b1"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "curl expat glib-2.0 openssl attr libcheck gpgme"
+
+inherit cmake distutils-base pkgconfig
+
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
+
+BBCLASSEXTEND = "native"
+
-- 
2.11.0


