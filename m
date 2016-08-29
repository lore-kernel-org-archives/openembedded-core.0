Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 18C716FF97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688670"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:32:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:12 +0300
Message-Id: <940c1c1ac5b12f973b7e340865fc87a961aae770.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/15] bdwgc: update to 7.6.0
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:07 -0000

Remove backported NIOS2 patch.
README.QUICK checksum updated; the license part of the file is unchaged.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../bdwgc/bdwgc/0002-Altera-NIOS2-support.patch    | 71 ----------------------
 .../bdwgc/{bdwgc_7.4.4.bb => bdwgc_7.6.0.bb}       |  7 +--
 2 files changed, 3 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-support/bdwgc/bdwgc/0002-Altera-NIOS2-support.patch
 rename meta/recipes-support/bdwgc/{bdwgc_7.4.4.bb => bdwgc_7.6.0.bb} (85%)

diff --git a/meta/recipes-support/bdwgc/bdwgc/0002-Altera-NIOS2-support.patch b/meta/recipes-support/bdwgc/bdwgc/0002-Altera-NIOS2-support.patch
deleted file mode 100644
index c73c540..0000000
--- a/meta/recipes-support/bdwgc/bdwgc/0002-Altera-NIOS2-support.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 2571df0e30b4976d7a12dbc6fbec4f1c4027924d Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Thu, 28 Jan 2016 04:13:13 +0100
-Subject: [PATCH] Altera NIOS2 support
-
-Add simple nios2 configuration support.
-
-* include/private/gcconfig.h (NIOS2): New macro.
-* include/private/gcconfig.h (mach_type_known, CPP_WORDSZ, MACH_TYPE,
-OS_TYPE, DYNAMIC_LOADING, _end, __data_start, DATASTART, DATAEND,
-ALIGNMENT, HBLKSIZE, HBLKSIZE, LINUX_STACKBOTTOM, NO_GETCONTEXT):
-Define for NIOS2.
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Backport [ https://github.com/ivmai/bdwgc.git 2571df0e30b4976d7a12dbc6fbec4f1c4027924d ]
----
- include/private/gcconfig.h | 24 +++++++++++++++++++++++-
- 1 file changed, 23 insertions(+), 1 deletion(-)
-
-diff --git a/include/private/gcconfig.h b/include/private/gcconfig.h
-index c467c26..92d4727 100644
---- a/include/private/gcconfig.h
-+++ b/include/private/gcconfig.h
-@@ -181,6 +181,10 @@
- #    endif
- #    define mach_type_known
- # endif
-+# if defined(__NIOS2__) || defined(__NIOS2) || defined(__nios2__)
-+#   define NIOS2 /* Altera NIOS2 */
-+#   define mach_type_known
-+# endif
- # if defined(DGUX) && (defined(i386) || defined(__i386__))
- #    define I386
- #    ifndef _USING_DGUX
-@@ -1658,6 +1662,24 @@
- #   endif
- # endif
- 
-+# ifdef NIOS2
-+#  define CPP_WORDSZ 32
-+#  define MACH_TYPE "NIOS2"
-+#  ifdef LINUX
-+#    define OS_TYPE "LINUX"
-+#    define DYNAMIC_LOADING
-+     extern int _end[];
-+     extern int __data_start[];
-+#    define DATASTART ((ptr_t)(__data_start))
-+#    define DATAEND ((ptr_t)(_end))
-+#    define ALIGNMENT 4
-+#    ifndef HBLKSIZE
-+#      define HBLKSIZE 4096
-+#    endif
-+#    define LINUX_STACKBOTTOM
-+#  endif /* Linux */
-+# endif
-+
- # ifdef HP_PA
- #   define MACH_TYPE "HP_PA"
- #   ifdef __LP64__
-@@ -2622,6 +2644,7 @@
- #if ((defined(UNIX_LIKE) && (defined(DARWIN) || defined(HURD) \
-                              || defined(OPENBSD) || defined(ARM32) \
--                             || defined(MIPS) || defined(AVR32))) \
-+                             || defined(MIPS) || defined(AVR32) \
-+                             || defined(NIOS2))) \
-      || (defined(LINUX) && (defined(SPARC) || defined(M68K))) \
-      || ((defined(RTEMS) || defined(PLATFORM_ANDROID)) && defined(I386))) \
-     && !defined(NO_GETCONTEXT)
--- 
-2.7.0
-
diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.4.bb b/meta/recipes-support/bdwgc/bdwgc_7.6.0.bb
similarity index 85%
rename from meta/recipes-support/bdwgc/bdwgc_7.4.4.bb
rename to meta/recipes-support/bdwgc/bdwgc_7.6.0.bb
index 600ced7..55ea452 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.4.4.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.6.0.bb
@@ -19,12 +19,11 @@ DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
 HOMEPAGE = "http://www.hboehm.info/gc/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.QUICK;md5=55f5088f90a982fed7af9a4897047ef7"
+LIC_FILES_CHKSUM = "file://README.QUICK;md5=4f81f24ec69726c312487c2ac740e9e3"
 
-SRCREV = "d8bfa89c2a9c7c86fb98acbc53b5750600b95492"
-SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_4 \
+SRCREV = "8ac1d84a40eb7a431fec1b8097e3f24b48fb23fa"
+SRC_URI = "git://github.com/ivmai/bdwgc.git \
            file://0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch \
-           file://0002-Altera-NIOS2-support.patch \
           "
 
 FILES_${PN}-doc = "${datadir}"
-- 
2.9.3


