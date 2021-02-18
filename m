Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +VdDOU3UsfdqqjncafouvyjvnmF0DeSsGSeh3d+XUM66X97rbCFU50bme7jWzlgdZTcU1m8RVc
 ADoyv7TjbLPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163177945"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163177945"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:25 -0800
IronPort-SDR: R9zKLuw2dEWoMb+yZwnE4u6rC11rno8/h48ppuaqZmJigGKkrOdv3AHGFYacYRvYaUpcDRnTEN
 Fl2IEFQpsO/g==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269155"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:23 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/12] cmake: upgrade 3.19.3 -> 3.19.5
Date: Thu, 18 Feb 2021 12:24:07 +0800
Message-Id: <20210218042418.281245-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a patch which is no longer required as the issue has been fixed
upstream.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ative_3.19.3.bb => cmake-native_3.19.5.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc         |  3 +--
 ...cmake-do-not-try-to-run-the-test-bin.patch | 26 -------------------
 .../{cmake_3.19.3.bb => cmake_3.19.5.bb}      |  0
 4 files changed, 1 insertion(+), 28 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.19.3.bb => cmake-native_3.19.5.bb} (100%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch
 rename meta/recipes-devtools/cmake/{cmake_3.19.3.bb => cmake_3.19.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.19.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.19.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.19.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.19.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index a79b3922bc..e0f59a6c67 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,10 +20,9 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0002-cmake-Prevent-the-detection-of-Qt5.patch \
            file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
-           file://0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch \
 "
 
-SRC_URI[sha256sum] = "3faca7c131494a1e34d66e9f8972ff5369e48d419ea8ceaa3dc15b4c11367732"
+SRC_URI[sha256sum] = "c432296eb5dec6d71eae15d140f6297d63df44e9ffe3e453628d1dc8fc4201ce"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch b/meta/recipes-devtools/cmake/cmake/0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch
deleted file mode 100644
index 4483bbce18..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ca105727dc4862733c3aad09e9de819be63a7b6b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 27 Dec 2020 23:18:10 +0100
-Subject: [PATCH] cm_cxx_features.cmake: do not try to run the test binary
-
-This causes errors when cross compiling cmake.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Source/Checks/cm_cxx_features.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/Checks/cm_cxx_features.cmake b/Source/Checks/cm_cxx_features.cmake
-index 663d89a..e8dca3b 100644
---- a/Source/Checks/cm_cxx_features.cmake
-+++ b/Source/Checks/cm_cxx_features.cmake
-@@ -81,7 +81,7 @@ if(CMake_HAVE_CXX_MAKE_UNIQUE)
- endif()
- cm_check_cxx_feature(unique_ptr)
- if (NOT CMAKE_CXX_STANDARD LESS "17")
--  cm_check_cxx_feature(filesystem TRY_RUN)
-+  cm_check_cxx_feature(filesystem)
- else()
-   set(CMake_HAVE_CXX_FILESYSTEM FALSE)
- endif()
diff --git a/meta/recipes-devtools/cmake/cmake_3.19.3.bb b/meta/recipes-devtools/cmake/cmake_3.19.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.19.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.19.5.bb
-- 
2.29.2

