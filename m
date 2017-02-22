Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 097F573121
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302261"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:18 +0200
Message-Id: <18154a4a0b667faede549f0f16855f55522e1032.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 23/24] nss: update to 3.28.1
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:40 -0000

Rebase nss-fix-support-cross-compiling.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ... => 0001-nss-fix-support-cross-compiling.patch} | 51 ++++++----------------
 .../nss/{nss_3.27.1.bb => nss_3.28.1.bb}           |  8 ++--
 2 files changed, 18 insertions(+), 41 deletions(-)
 rename meta/recipes-support/nss/nss/{nss-fix-support-cross-compiling.patch => 0001-nss-fix-support-cross-compiling.patch} (49%)
 rename meta/recipes-support/nss/{nss_3.27.1.bb => nss_3.28.1.bb} (96%)

diff --git a/meta/recipes-support/nss/nss/nss-fix-support-cross-compiling.patch b/meta/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
similarity index 49%
rename from meta/recipes-support/nss/nss/nss-fix-support-cross-compiling.patch
rename to meta/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
index f0b3550bffd..d5403397e73 100644
--- a/meta/recipes-support/nss/nss/nss-fix-support-cross-compiling.patch
+++ b/meta/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
@@ -1,46 +1,23 @@
-nss: fix support cross compiling
+From 0cf47ee432cc26a706864fcc09b2c3adc342a679 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 22 Feb 2017 11:36:11 +0200
+Subject: [PATCH] nss: fix support cross compiling
 
 Let some make variables be assigned from outside makefile.
 
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- nss/coreconf/Linux.mk   | 12 +++++++++++-
- nss/coreconf/arch.mk    |  2 +-
- nss/lib/freebl/Makefile |  6 ++++++
- 3 files changed, 18 insertions(+), 2 deletions(-)
+ nss/coreconf/arch.mk    | 2 +-
+ nss/lib/freebl/Makefile | 6 ++++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
 
-diff --git a/nss/coreconf/Linux.mk b/nss/coreconf/Linux.mk
---- a/nss/coreconf/Linux.mk
-+++ b/nss/coreconf/Linux.mk
-@@ -16,11 +16,21 @@ ifeq ($(USE_PTHREADS),1)
- 	IMPL_STRATEGY = _PTH
- endif
- 
-+ifndef CC
- CC			= gcc
-+endif
-+
-+ifdef CXX
-+CCC			= $(CXX)
-+else
- CCC			= g++
-+endif
-+
-+ifndef RANLIB
- RANLIB			= ranlib
-+endif
- 
--DEFAULT_COMPILER = gcc
-+DEFAULT_COMPILER = $(CC)
- 
- ifeq ($(OS_TARGET),Android)
- ifndef ANDROID_NDK
 diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
-index 6557348..b722412 100644
+index 06c276f..9c1eb51 100644
 --- a/nss/coreconf/arch.mk
 +++ b/nss/coreconf/arch.mk
-@@ -37,7 +37,7 @@ OS_TEST := $(shell uname -m)
+@@ -30,7 +30,7 @@ OS_TEST := $(shell uname -m)
  ifeq ($(OS_TEST),i86pc)
      OS_RELEASE := $(shell uname -r)_$(OS_TEST)
  else
@@ -50,7 +27,7 @@ index 6557348..b722412 100644
  
  #
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 0d293f1..678f506 100644
+index 0ce1425..ebeb411 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -36,6 +36,12 @@ ifdef USE_64
@@ -59,7 +36,7 @@ index 0d293f1..678f506 100644
  
 +ifeq ($(OS_TEST),mips)
 +ifndef USE_64
-+	DEFINES += -DNS_PTR_LE_32
++       DEFINES += -DNS_PTR_LE_32
 +endif
 +endif
 +
@@ -67,5 +44,5 @@ index 0d293f1..678f506 100644
  	DEFINES += -DNSS_USE_ABI32_FPU
  endif
 -- 
-1.8.1.2
+2.11.0
 
diff --git a/meta/recipes-support/nss/nss_3.27.1.bb b/meta/recipes-support/nss/nss_3.28.1.bb
similarity index 96%
rename from meta/recipes-support/nss/nss_3.27.1.bb
rename to meta/recipes-support/nss/nss_3.28.1.bb
index c89470fb11c..fed86fc8e92 100644
--- a/meta/recipes-support/nss/nss_3.27.1.bb
+++ b/meta/recipes-support/nss/nss_3.28.1.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI = "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_27_1_RTM/src/${BP}.tar.gz \
-    file://nss-fix-support-cross-compiling.patch \
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_28_1_RTM/src/${BP}.tar.gz \
+    file://0001-nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
     file://nss-fix-nsinstall-build.patch \
@@ -26,8 +26,8 @@ SRC_URI = "\
     file://nss.pc.in \
     file://signlibs.sh \
 "
-SRC_URI[md5sum] = "f18e1ebfe07969c84b890e45843edcb7"
-SRC_URI[sha256sum] = "fd3637a1930cd838239a89633a7ed9a18859ae9b599043f3a18f726dc4ec2a6b"
+SRC_URI[md5sum] = "e98d48435cee5792f97ef7fc35a602c3"
+SRC_URI[sha256sum] = "58cc0c05c0ed9523e6d820bea74f513538f48c87aac931876e3d3775de1a82ad"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.11.0


