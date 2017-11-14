Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BA2EE784E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:02 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:57:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402205"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:57:58 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:39 +0200
Message-Id: <20171114145754.9643-12-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/27] librepo: update to 1.8.1
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:03 -0000

Drop upstreamed patches, rebase the PYTHON_INSTALL_DIR patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ly-set-the-library-installation-directory.patch | 28 -------------
 ...to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 49 +++++++++++++++-------
 ...-race-when-deleting-temporary-directories.patch | 41 ------------------
 ...rrect-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch | 40 ------------------
 .../librepo/{librepo_git.bb => librepo_1.8.1.bb}   |  6 +--
 5 files changed, 36 insertions(+), 128 deletions(-)
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch
 rename meta/recipes-devtools/librepo/{librepo_git.bb => librepo_1.8.1.bb} (68%)

diff --git a/meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch b/meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
deleted file mode 100644
index 08a58f17554..00000000000
--- a/meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 36d87919223db9b054862ad38cdda8d9222a2bab Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:04:35 +0200
-Subject: [PATCH 1/4] Correctly set the library installation directory
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/librepo/pull/110]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- librepo/CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/librepo/CMakeLists.txt b/librepo/CMakeLists.txt
-index 2fe76d8..5026def 100644
---- a/librepo/CMakeLists.txt
-+++ b/librepo/CMakeLists.txt
-@@ -60,7 +60,8 @@ CONFIGURE_FILE("version.h.in" "${CMAKE_CURRENT_SOURCE_DIR}/version.h" @ONLY)
- IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
-   SET (LIB_SUFFIX "64")
- ENDIF (CMAKE_SIZEOF_VOID_P MATCHES "8")
--SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
-+#SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
-+SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")
- 
- INSTALL(FILES ${librepo_HEADERS} DESTINATION include/librepo)
- INSTALL(TARGETS librepo LIBRARY DESTINATION ${LIB_INSTALL_DIR})
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 7138dfce21d..d69deb5110d 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -1,41 +1,62 @@
-From 1570ad33dd7e5d83f3ee80bd104b114709ac1e34 Mon Sep 17 00:00:00 2001
+From 5b6849d9d7e030c3a521b5245d86f853b0271a61 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
-Subject: [PATCH 2/4] Do not try to obtain PYTHON_INSTALL_DIR by running
+Subject: [PATCH 1/2] Do not try to obtain PYTHON_INSTALL_DIR by running
  python.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- librepo/python/python2/CMakeLists.txt | 2 +-
- librepo/python/python3/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ librepo/python/python2/CMakeLists.txt | 12 ++++++------
+ librepo/python/python3/CMakeLists.txt | 12 ++++++------
+ 2 files changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/librepo/python/python2/CMakeLists.txt b/librepo/python/python2/CMakeLists.txt
-index 3615e17..cffa99f 100644
+index 5ffbd62..90d3c22 100644
 --- a/librepo/python/python2/CMakeLists.txt
 +++ b/librepo/python/python2/CMakeLists.txt
-@@ -1,6 +1,6 @@
+@@ -1,11 +1,11 @@
  FIND_PACKAGE (PythonLibs 2 )
  FIND_PACKAGE (PythonInterp 2 REQUIRED)
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
+-from sys import stdout
+-from distutils import sysconfig
+-path=sysconfig.get_python_lib(True, prefix='${CMAKE_INSTALL_PREFIX}')
+-stdout.write(path)"
+-OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
++#from sys import stdout
++#from distutils import sysconfig
++#path=sysconfig.get_python_lib(True, prefix='${CMAKE_INSTALL_PREFIX}')
++#stdout.write(path)"
++#OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
 diff --git a/librepo/python/python3/CMakeLists.txt b/librepo/python/python3/CMakeLists.txt
-index dfecac9..38bcc72 100644
+index 47559f7..b39adc2 100644
 --- a/librepo/python/python3/CMakeLists.txt
 +++ b/librepo/python/python3/CMakeLists.txt
-@@ -10,7 +10,7 @@ message("--- ${PYTHON_INCLUDE_DIR}")
+@@ -10,12 +10,12 @@ message("--- ${PYTHON_INCLUDE_DIR}")
  
  FIND_PACKAGE(PythonLibs 3.0)
  FIND_PACKAGE(PythonInterp 3.0 REQUIRED)
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
+-from sys import stdout
+-from distutils import sysconfig
+-path=sysconfig.get_python_lib(True, prefix='${CMAKE_INSTALL_PREFIX}')
+-stdout.write(path)"
+-OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
++#from sys import stdout
++#from distutils import sysconfig
++#path=sysconfig.get_python_lib(True, prefix='${CMAKE_INSTALL_PREFIX}')
++#stdout.write(path)"
++#OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python3 install dir is ${PYTHON_INSTALL_DIR}")
 -- 
-2.11.0
+2.14.1
 
diff --git a/meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch b/meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
deleted file mode 100644
index 89ca60e8186..00000000000
--- a/meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b1a5c92dbd1d11f1afdc094fccea64de334d2783 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:06:24 +0200
-Subject: [PATCH 3/4] tests: fix a race when deleting temporary directories
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/librepo/pull/110]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/python/tests/test_yum_repo_downloading.py | 2 +-
- tests/python/tests/test_yum_repo_locating.py    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/python/tests/test_yum_repo_downloading.py b/tests/python/tests/test_yum_repo_downloading.py
-index ad597dc..4a32519 100644
---- a/tests/python/tests/test_yum_repo_downloading.py
-+++ b/tests/python/tests/test_yum_repo_downloading.py
-@@ -32,7 +32,7 @@ class TestCaseYumRepoDownloading(TestCaseWithFlask):
-             os.environ.pop('GNUPGHOME')
-         else:
-             os.environ['GNUPGHOME'] = self._gnupghome
--        shutil.rmtree(self.tmpdir)
-+        shutil.rmtree(self.tmpdir, True)
- 
-     def test_download_repo_01(self):
-         h = librepo.Handle()
-diff --git a/tests/python/tests/test_yum_repo_locating.py b/tests/python/tests/test_yum_repo_locating.py
-index 8f4bea5..db4294c 100644
---- a/tests/python/tests/test_yum_repo_locating.py
-+++ b/tests/python/tests/test_yum_repo_locating.py
-@@ -34,7 +34,7 @@ class TestCaseYumRepoLocating(TestCase):
-             os.environ.pop('GNUPGHOME')
-         else:
-             os.environ['GNUPGHOME'] = self._gnupghome
--        shutil.rmtree(self.tmpdir)
-+        shutil.rmtree(self.tmpdir, True)
- 
-     def test_read_mirrorlist(self):
-         h = librepo.Handle()
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch b/meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch
deleted file mode 100644
index b0c7d1ca309..00000000000
--- a/meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a4bbbccce6edc1a2d1bd475506e2975fd7696c88 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 8 Jun 2017 16:31:30 +0800
-Subject: [PATCH] Fix typo: correct LRO_SSLVERIFYHOST with
- CURLOPT_SSL_VERIFYHOST
-
-In commit 51d32c6cd88ba0139c32793183fd6a236c1ef456
----
-Author: Tomas Mlcoch <tmlcoch@redhat.com>
-Date:   Mon May 5 14:31:35 2014 +0200
-
-    Add LRO_SSLVERIFYPEER and LRO_SSLVERIFYHOST options (RhBug: 1093014)
----
-
-It incorrectly setopt CURLOPT_SSL_VERIFYPEER for LRO_SSLVERIFYHOST.
-Use CURLOPT_SSL_VERIFYHOST to correct.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- librepo/handle.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/librepo/handle.c b/librepo/handle.c
-index ccea79b..ff39db4 100644
---- a/librepo/handle.c
-+++ b/librepo/handle.c
-@@ -629,7 +629,7 @@ lr_handle_setopt(LrHandle *handle,
- 
-     case LRO_SSLVERIFYHOST:
-         handle->sslverifyhost = va_arg(arg, long) ? 2 : 0;
--        c_rc = curl_easy_setopt(c_h, CURLOPT_SSL_VERIFYPEER, handle->sslverifyhost);
-+        c_rc = curl_easy_setopt(c_h, CURLOPT_SSL_VERIFYHOST, handle->sslverifyhost);
-         break;
- 
-     case LRO_SSLCLIENTCERT:
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/librepo/librepo_git.bb b/meta/recipes-devtools/librepo/librepo_1.8.1.bb
similarity index 68%
rename from meta/recipes-devtools/librepo/librepo_git.bb
rename to meta/recipes-devtools/librepo/librepo_1.8.1.bb
index 3238b14face..0324104a37a 100644
--- a/meta/recipes-devtools/librepo/librepo_git.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.8.1.bb
@@ -3,15 +3,11 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/rpm-software-management/librepo.git \
-           file://0001-Correctly-set-the-library-installation-directory.patch \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
-           file://0003-tests-fix-a-race-when-deleting-temporary-directories.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
-           file://0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch \
            "
 
-PV = "1.7.20+git${SRCPV}"
-SRCREV = "e1137cbbda78fecb192146300790680a5bc811b1"
+SRCREV = "7b9b7bf388f3f059529c6f50c40b30919fef30f9"
 
 S = "${WORKDIR}/git"
 
-- 
2.15.0


