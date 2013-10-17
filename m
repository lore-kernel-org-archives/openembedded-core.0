Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4EB6D069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:34:27 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Oct 2013 03:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,513,1378882800"; d="scan'208";a="376040028"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 17 Oct 2013 03:34:28 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:34:15 +0300
Message-Id: <bafff5d70224e4ec3e38433538730c4a2b9d7b0f.1382005791.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/8] tar: upgrade to 1.27
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
X-List-Received-Date: Thu, 17 Oct 2013 10:34:27 -0000

Refreshed remove-gets.patch to apply correctly.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../tar/{tar-1.26 => tar-1.27}/remove-gets.patch   |   18 ++++++++++--------
 ...tive_1.26.bb => tar-replacement-native_1.27.bb} |    0
 .../tar/{tar_1.26.bb => tar_1.27.bb}               |    6 ++----
 3 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-extended/tar/{tar-1.26 => tar-1.27}/remove-gets.patch (52%)
 rename meta/recipes-extended/tar/{tar-replacement-native_1.26.bb => tar-replacement-native_1.27.bb} (100%)
 rename meta/recipes-extended/tar/{tar_1.26.bb => tar_1.27.bb} (51%)

diff --git a/meta/recipes-extended/tar/tar-1.26/remove-gets.patch b/meta/recipes-extended/tar/tar-1.27/remove-gets.patch
similarity index 52%
rename from meta/recipes-extended/tar/tar-1.26/remove-gets.patch
rename to meta/recipes-extended/tar/tar-1.27/remove-gets.patch
index 2429d42..0b8be39 100644
--- a/meta/recipes-extended/tar/tar-1.26/remove-gets.patch
+++ b/meta/recipes-extended/tar/tar-1.27/remove-gets.patch
@@ -3,18 +3,20 @@ ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ re
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
-Index: tar-1.26/gnu/stdio.in.h
+Index: tar-1.27/gnu/stdio.in.h
 ===================================================================
---- tar-1.26.orig/gnu/stdio.in.h	2011-03-12 01:14:33.000000000 -0800
-+++ tar-1.26/gnu/stdio.in.h	2012-07-04 12:18:58.997081535 -0700
-@@ -163,8 +163,10 @@
+--- tar-1.27.orig/gnu/stdio.in.h	2013-06-29 08:54:26.000000000 +0300
++++ tar-1.27/gnu/stdio.in.h	2013-10-16 15:22:46.977204737 +0300
+@@ -710,10 +710,12 @@
  /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
+    so any use of gets warrants an unconditional warning; besides, C11
+    removed it.  */
 +#if defined gets
  #undef gets
+ #if HAVE_RAW_DECL_GETS
  _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
+ #endif
 +#endif
  
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
+ 
+ #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
diff --git a/meta/recipes-extended/tar/tar-replacement-native_1.26.bb b/meta/recipes-extended/tar/tar-replacement-native_1.27.bb
similarity index 100%
rename from meta/recipes-extended/tar/tar-replacement-native_1.26.bb
rename to meta/recipes-extended/tar/tar-replacement-native_1.27.bb
diff --git a/meta/recipes-extended/tar/tar_1.26.bb b/meta/recipes-extended/tar/tar_1.27.bb
similarity index 51%
rename from meta/recipes-extended/tar/tar_1.26.bb
rename to meta/recipes-extended/tar/tar_1.27.bb
index 8b774e6..6cf6f70 100644
--- a/meta/recipes-extended/tar/tar_1.26.bb
+++ b/meta/recipes-extended/tar/tar_1.27.bb
@@ -3,10 +3,8 @@ require tar.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r5"
-
 SRC_URI += "file://remove-gets.patch \
            "
 
-SRC_URI[md5sum] = "2cee42a2ff4f1cd4f9298eeeb2264519"
-SRC_URI[sha256sum] = "5a5369f464502a598e938029c310d4b3abd51e6bb8dfd045663e61c8ea9f6d41"
+SRC_URI[md5sum] = "74f51434bfb7756bd571a0f718b171ae"
+SRC_URI[sha256sum] = "2238c5c63c7ecaccc962f10482d76875b45cedfed69138ed852a88e344af3c7b"
-- 
1.7.9.5


