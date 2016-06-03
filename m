Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DD0717750E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440242"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:55 +0300
Message-Id: <83aae4b874ecd70cb1ba48d2ff25e550ead6f10f.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/25] icu: update to 57.1
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:27 -0000

Point to the actual license file in the recipe.
Drop icu-release-56-1-flagparser-fix.patch, merged upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../icu/icu/icu-release-56-1-flagparser-fix.patch  | 24 ----------------------
 .../icu/{icu_56.1.bb => icu_57.1.bb}               |  7 +++----
 2 files changed, 3 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch
 rename meta/recipes-support/icu/{icu_56.1.bb => icu_57.1.bb} (72%)

diff --git a/meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch b/meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch
deleted file mode 100644
index 1519d84..0000000
--- a/meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-icu: Ticket #11959: pkgdata dies when compiled with lots'o'flags
-
-See: http://bugs.icu-project.org/trac/ticket/11959
-
-The patch avoids premature failure which results in a segfault.
-
-Upstream-Status: Backport of r38081
-Signed-off-by: Mike Crowe <mac@mcrowe.com>
-
-Index: source/tools/toolutil/flagparser.c
-===================================================================
---- source/tools/toolutil/flagparser.c	(revision 38046)
-+++ source/tools/toolutil/flagparser.c	(working copy)
-@@ -96,8 +96,8 @@
-     uprv_free(buffer);
- 
-     T_FileStream_close(f);
--    
--    if (U_FAILURE(*status)) {
-+
-+    if (U_FAILURE(*status) && *status != U_BUFFER_OVERFLOW_ERROR) {
-         return -1;
-     }
- 
diff --git a/meta/recipes-support/icu/icu_56.1.bb b/meta/recipes-support/icu/icu_57.1.bb
similarity index 72%
rename from meta/recipes-support/icu/icu_56.1.bb
rename to meta/recipes-support/icu/icu_57.1.bb
index db0de10..90c2b82 100644
--- a/meta/recipes-support/icu/icu_56.1.bb
+++ b/meta/recipes-support/icu/icu_57.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../license.html;md5=64eff4aadff4d104d6d437c4fde0e6d7"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=787d3b37867445c1cdd6f6167bd0e347"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV', True).split('.')
@@ -16,14 +16,13 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-           file://icu-release-56-1-flagparser-fix.patch \
           "
 
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "c4a2d71ff56aec5ebfab2a3f059be99d"
-SRC_URI[sha256sum] = "3a64e9105c734dcf631c0b3ed60404531bce6c0f5a64bfe1a6402a4cc2314816"
+SRC_URI[md5sum] = "976734806026a4ef8bdd17937c8898b9"
+SRC_URI[sha256sum] = "ff8c67cb65949b1e7808f2359f2b80f722697048e90e7cfc382ec1fe229e9581"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.8.1


