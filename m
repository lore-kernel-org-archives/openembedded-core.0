Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:29:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FeXTi//F3AAzk4wQhm/MUQsyCr6KBv2TTjgwF8NQIU/+tPTyZQTQcEvFu5Jn4zVpsQddW2jc+l
 QVbwEnCmJ93w==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428921"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428921"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:59 -0800
IronPort-SDR: cReqB0ab1Zevw3Rp5WmEeNABKT92U6jNQWMWmqgYiA2KadIINthCt96LAk0DAdjIBytiD0OvoN
 +quqpv/Y8GDw==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490138"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:58 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 21/22] apt: remove host contamination with gtest
Date: Fri,  6 Nov 2020 14:28:19 +0800
Message-Id: <111178b8f26345679432cf7bbf3cd0d20097c125.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

(From OE-Core rev: 41aa60cdb1e26617e1eeac95a6ffcdd6561c539f)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 600cb136cd3ed474f3e890297f4768071358fc13)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...t-configure-packages-on-installation.patch |  2 +-
 ...-init-tables-from-dpkg-configuration.patch |  2 +-
 ...n-dpkg-configure-a-at-the-end-of-our.patch |  2 +-
 ...ibapt-do-not-use-gtest-from-the-host.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_1.8.2.1.bb      |  1 +
 5 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
index 2322bd8e78..81b328a2ee 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
@@ -1,4 +1,4 @@
-From 1ad21140787a6b8b0f774f75b50444d2c30a56f6 Mon Sep 17 00:00:00 2001
+From 96d23fc57d1ff9c851d563d6d6a6c4752dc4f1b6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:28:12 +0000
 Subject: [PATCH] Do not configure packages on installation
diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index d3d3ab026d..1417153e81 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From b18d7aa7d71b53b86bac21cd1d8c3accabb28f2b Mon Sep 17 00:00:00 2001
+From bf45c314867e5fb12141803fba06f3e45679d628 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 8c4cc04503..37f969690c 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From 742fbb243f99e940c3e6b31296f7f416f550a57a Mon Sep 17 00:00:00 2001
+From 34700bebc52659e7e3eecd252f65bd36e669eee8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
diff --git a/meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch b/meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch
new file mode 100644
index 0000000000..503b5a5c0b
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch
@@ -0,0 +1,40 @@
+From 28e389a0d1275e7693df84a7d4a58b28364be1a9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 22 Oct 2020 17:33:38 +0200
+Subject: [PATCH] test/libapt: do not use gtest from the host
+
+This really does not work when cross-compiling.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ test/libapt/CMakeLists.txt | 16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/test/libapt/CMakeLists.txt b/test/libapt/CMakeLists.txt
+index 035ff07..280b83c 100644
+--- a/test/libapt/CMakeLists.txt
++++ b/test/libapt/CMakeLists.txt
+@@ -6,22 +6,6 @@ find_path(GTEST_ROOT src/gtest.cc
+ find_package(GTest)
+ set(GTEST_DEPENDENCIES)
+ 
+-if(NOT GTEST_FOUND AND EXISTS ${GTEST_ROOT})
+-   include(ExternalProject)
+-   ExternalProject_Add(gtest PREFIX ./gtest
+-                             SOURCE_DIR ${GTEST_ROOT}
+-                             INSTALL_COMMAND true)
+-
+-   link_directories(${CMAKE_CURRENT_BINARY_DIR}/gtest/src/gtest-build)
+-
+-   set(GTEST_LIBRARIES "-lgtest")
+-   set(GTEST_DEPENDENCIES "gtest")
+-   set(GTEST_FOUND TRUE)
+-   find_path(GTEST_INCLUDE_DIRS NAMES gtest/gtest.h PATHS ${GTEST_ROOT}/include)
+-
+-   message(STATUS "Found GTest at ${GTEST_ROOT}, headers at ${GTEST_INCLUDE_DIRS}")
+-endif()
+-
+ if(GTEST_FOUND)
+    # gtest produces some warnings with the set of warnings we activate,
+    # so disable the offending warnings while compiling tests for now
diff --git a/meta/recipes-devtools/apt/apt_1.8.2.1.bb b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
index bd1f4f39c3..de0e150a2e 100644
--- a/meta/recipes-devtools/apt/apt_1.8.2.1.bb
+++ b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Disable-documentation-directory-altogether.patch \
            file://0001-Fix-musl-build.patch \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
+           file://0001-test-libapt-do-not-use-gtest-from-the-host.patch \
            "
      
 SRC_URI_append_class-native = " \
-- 
2.28.0

