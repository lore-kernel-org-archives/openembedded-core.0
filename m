Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 98AF160620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:30:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 16 Mar 2017 07:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,172,1486454400"; d="scan'208";a="1123568674"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2017 07:30:31 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E16662C8001;
	Thu, 16 Mar 2017 07:30:25 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 16:30:23 +0200
Message-Id: <1489674624-17346-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] cmake: Backport fix to enable -Wformat-security
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
X-List-Received-Date: Thu, 16 Mar 2017 14:30:30 -0000

Backport build fix that removes -Wformat-security for specific tests.
Enable "-Wformat-security" for cmake in security_flags.inc.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/conf/distro/include/security_flags.inc        |  1 -
 meta/recipes-devtools/cmake/cmake.inc              |  1 +
 ...L-tests-Remove-format-security-from-flags.patch | 33 ++++++++++++++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-KWIML-tests-Remove-format-security-from-flags.patch

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index b0a7754..da1c3a0 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -91,7 +91,6 @@ SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 
 # Recipes which fail to compile when elevating -Wformat-security to an error
 SECURITY_STRINGFORMAT_pn-busybox = ""
-SECURITY_STRINGFORMAT_pn-cmake = ""
 SECURITY_STRINGFORMAT_pn-expect = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
 SECURITY_STRINGFORMAT_pn-kexec-tools = ""
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 131ff70..6c8b36d 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -15,6 +15,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
            file://qt4-fail-silent.patch \
            file://avoid-gcc-warnings-with-Wstrict-prototypes.patch \
+           file://0001-KWIML-tests-Remove-format-security-from-flags.patch \
            "
 
 SRC_URI[md5sum] = "79bd7e65cd81ea3aa2619484ad6ff25a"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-KWIML-tests-Remove-format-security-from-flags.patch b/meta/recipes-devtools/cmake/cmake/0001-KWIML-tests-Remove-format-security-from-flags.patch
new file mode 100644
index 0000000..190133b
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-KWIML-tests-Remove-format-security-from-flags.patch
@@ -0,0 +1,33 @@
+From 0941395b146804abcd87004589ff6e7a2953412d Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 16 Mar 2017 14:39:04 +0200
+Subject: [PATCH] KWIML tests: Remove format-security from flags
+
+For the tests where "format" is removed from flags, "format-security"
+should be removed as well. Otherwise building cmake with
+"-Wformat -Wformat-security" fails:
+
+| cc1: error: -Wformat-security ignored without -Wformat [-Werror=format-security]
+
+Upstream-Status: Backport [part of commit f77420cfc9]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ Utilities/KWIML/test/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Utilities/KWIML/test/CMakeLists.txt b/Utilities/KWIML/test/CMakeLists.txt
+index 4f6f37b..1bf93bb 100644
+--- a/Utilities/KWIML/test/CMakeLists.txt
++++ b/Utilities/KWIML/test/CMakeLists.txt
+@@ -10,7 +10,7 @@ endif()
+ # Suppress printf/scanf format warnings; we test if the sizes match.
+ foreach(lang C CXX)
+   if(KWIML_LANGUAGE_${lang} AND CMAKE_${lang}_COMPILER_ID STREQUAL "GNU")
+-    set(CMAKE_${lang}_FLAGS "${CMAKE_${lang}_FLAGS} -Wno-format")
++    set(CMAKE_${lang}_FLAGS "${CMAKE_${lang}_FLAGS} -Wno-format -Wno-format-security")
+   endif()
+ endforeach()
+ 
+-- 
+2.1.4
+
-- 
2.1.4


