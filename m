Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E3A1977BE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:40:23 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 21 Apr 2017 05:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,229,1488873600"; d="scan'208";a="251889263"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2017 05:40:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:39:56 +0300
Message-Id: <05619651d9fa71ba4504c85fd450001f7092f0af.1492777818.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/11] libdnf: update to 0.8.1
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
X-List-Received-Date: Fri, 21 Apr 2017 12:40:24 -0000

Rebase the patches.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...parameters-for-both-libsolv-and-libsolvext-libdn.patch | 13 +++++++------
 ...libsolv-variables-with-pkg-config-cmake-s-own-mo.patch | 15 ++++++++-------
 meta/recipes-devtools/libdnf/libdnf_git.bb                |  4 ++--
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 954add6e738..77b20c2734d 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,28 +1,29 @@
-From 5958b151a4dbb89114e90c971a34b74f873b7beb Mon Sep 17 00:00:00 2001
+From 3012a93745223751cc979e3770207a09a075bec6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
-Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
+Subject: [PATCH 5/5] Get parameters for both libsolv and libsolvext (libdnf is
  using both)
 
 Upstream-Status: Pending [depends on whether https://github.com/openSUSE/libsolv/pull/177 is accepted]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b531da1..e512da0 100644
+index 8b2ab9a..e2d33d7 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -28,7 +28,7 @@ find_package (PkgConfig REQUIRED)
+@@ -29,7 +29,7 @@ find_package (PkgConfig REQUIRED)
  SET (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
  PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.44.0 REQUIRED)
  FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
 -PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv libsolvext)
  set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
- pkg_check_modules (CHECK REQUIRED check)
- pkg_check_modules (REPO REQUIRED librepo)
+ if (ENABLE_RHSM_SUPPORT)
+     pkg_check_modules (RHSM REQUIRED librhsm)
 -- 
 2.11.0
 
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 931959b5f38..fc3b048b7d9 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,29 +1,30 @@
-From 6d2718b925453f9a6915001f489606eb8e4086c8 Mon Sep 17 00:00:00 2001
+From 55cbe6f40fe0836385e1a7241ec811cbe99e5840 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
-Subject: [PATCH 4/4] Set libsolv variables with pkg-config (cmake's own module
+Subject: [PATCH 4/5] Set libsolv variables with pkg-config (cmake's own module
  doesn't work properly).
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  CMakeLists.txt | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8edb627..b531da1 100644
+index a75df04..8b2ab9a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -28,7 +28,8 @@ find_package (PkgConfig REQUIRED)
+@@ -29,7 +29,8 @@ find_package (PkgConfig REQUIRED)
  SET (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
  PKG_CHECK_MODULES(GLIB gio-unix-2.0>=2.44.0 REQUIRED)
  FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
 -find_package (LibSolv 0.6.21 REQUIRED COMPONENTS ext)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
- pkg_check_modules (CHECK REQUIRED check)
- pkg_check_modules (REPO REQUIRED librepo)
- FIND_PROGRAM (VALGRIND_PROGRAM NAMES valgrind PATH /usr/bin /usr/local/bin)
+ if (ENABLE_RHSM_SUPPORT)
+     pkg_check_modules (RHSM REQUIRED librhsm)
+     include_directories (${RHSM_INCLUDE_DIRS})
 -- 
 2.11.0
 
diff --git a/meta/recipes-devtools/libdnf/libdnf_git.bb b/meta/recipes-devtools/libdnf/libdnf_git.bb
index ef28611f8a0..2acbd89659a 100644
--- a/meta/recipes-devtools/libdnf/libdnf_git.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_git.bb
@@ -10,8 +10,8 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            "
 
-PV = "0.2.3+git${SRCPV}"
-SRCREV = "367545629cc01a8e622890d89bd13d062ce60d7b"
+PV = "0.8.1"
+SRCREV = "233287f4f80e24a917d5f6a26967f54080ffa255"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


