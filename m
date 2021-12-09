Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F57C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:17 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5668.1639013411655338325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504101"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504101"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298318"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:14 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 29/33] boost: allow searching for python310
Date: Thu,  9 Dec 2021 09:29:28 +0800
Message-Id: 
 <8d622afe96b67133f519fc888ff03222162f20f9.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159429

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8add0bdec7c51c9a7f851b2c63017c79faaa273)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ....cmake-allow-searching-for-python310.patch | 50 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.77.0.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch

diff --git a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch b/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
new file mode 100644
index 0000000000..0a9ee2cc95
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
@@ -0,0 +1,50 @@
+From e193f080c7d209516ac9b712fa0c50bb08026fa2 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 19 Oct 2021 12:24:31 +0000
+Subject: [PATCH] BoostConfig.cmake: allow searching for python310
+
+* accept double digits in Python3_VERSION_MINOR
+
+* if someone is using e.g.:
+  find_package(Python3 REQUIRED)
+  find_package(Boost REQUIRED python${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR})
+
+  with python-3.10 then it currently fails with:
+
+  -- Found PythonLibs: /usr/lib/libpython3.10.so (found version "3.10.0")
+  -- Found Python3: -native/usr/bin/python3-native/python3 (found version "3.10.0") found components: Interpreter
+  CMake Error at /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:141 (find_package):
+    Could not find a package configuration file provided by "boost_python310"
+    (requested version 1.77.0) with any of the following names:
+
+      boost_python310Config.cmake
+      boost_python310-config.cmake
+
+    Add the installation prefix of "boost_python310" to CMAKE_PREFIX_PATH or
+    set "boost_python310_DIR" to a directory containing one of the above files.
+    If "boost_python310" provides a separate development package or SDK, be
+    sure it has been installed.
+  Call Stack (most recent call first):
+    /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:258 (boost_find_component)
+    /usr/share/cmake-3.21/Modules/FindBoost.cmake:594 (find_package)
+    CMakeLists.txt:18 (find_package)
+
+Upstream-Status: Submitted [https://github.com/boostorg/boost_install/pull/53]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/boost_install/BoostConfig.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/boost_install/BoostConfig.cmake b/tools/boost_install/BoostConfig.cmake
+index fd17821..5dffa58 100644
+--- a/tools/boost_install/BoostConfig.cmake
++++ b/tools/boost_install/BoostConfig.cmake
+@@ -113,7 +113,7 @@ macro(boost_find_component comp required quiet)
+     set(_BOOST_REQUIRED REQUIRED)
+   endif()
+ 
+-  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9])$")
++  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9][0-9]?)$")
+ 
+     # handle pythonXY and numpyXY versioned components for compatibility
+ 
diff --git a/meta/recipes-support/boost/boost_1.77.0.bb b/meta/recipes-support/boost/boost_1.77.0.bb
index df8e08ad76..ba60281950 100644
--- a/meta/recipes-support/boost/boost_1.77.0.bb
+++ b/meta/recipes-support/boost/boost_1.77.0.bb
@@ -6,4 +6,5 @@ SRC_URI += "file://boost-CVE-2012-2677.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch \
+           file://0001-BoostConfig.cmake-allow-searching-for-python310.patch \
            "
-- 
2.33.1


