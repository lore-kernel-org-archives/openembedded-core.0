Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E08DE782E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:00:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 19 Jul 2017 08:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="1174411206"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2017 08:00:45 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id ED56A58037A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:00:42 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 18:01:20 +0300
Message-Id: <1500476485-20310-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/6] libjpeg-turbo: upgrade to 1.5.2
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
X-List-Received-Date: Wed, 19 Jul 2017 15:00:46 -0000

1.5.1 -> 1.5.2

Remove this backported patch:
        1. fix-mips.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../jpeg/libjpeg-turbo/fix-mips.patch              | 45 ----------------------
 ...bjpeg-turbo_1.5.1.bb => libjpeg-turbo_1.5.2.bb} |  8 ++--
 2 files changed, 4 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-graphics/jpeg/libjpeg-turbo/fix-mips.patch
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_1.5.1.bb => libjpeg-turbo_1.5.2.bb} (90%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo/fix-mips.patch b/meta/recipes-graphics/jpeg/libjpeg-turbo/fix-mips.patch
deleted file mode 100644
index 4d41237..0000000
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo/fix-mips.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Fix a regression that causes the MIPS code from building.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 7bfb22af123ac10798a9a4c9ec7b23e5065db35e Mon Sep 17 00:00:00 2001
-From: DRC <information@libjpeg-turbo.org>
-Date: Mon, 26 Sep 2016 17:59:14 -0500
-Subject: [PATCH] Fix broken MIPS build
-
-Regression introduced by 9055fb408dcb585ce9392d395e16630d51002152
-
-Fixes #104
----
- ChangeLog.md      | 3 +++
- simd/jsimd_mips.c | 2 ++
- 2 files changed, 5 insertions(+)
-
-diff --git a/ChangeLog.md b/ChangeLog.md
-index e2b9df3..71ddcaa 100644
---- a/ChangeLog.md
-+++ b/ChangeLog.md
-@@ -6,6 +6,9 @@
- 1. Fixed a regression introduced by 1.5.1[7] that prevented libjpeg-turbo from
- building with Android NDK platforms prior to android-21 (5.0).
- 
-+2. Fixed a regression introduced by 1.5.1[1] that prevented the MIPS DSPR2 SIMD
-+code in libjpeg-turbo from building.
-+
- 
- 1.5.1
- =====
-diff --git a/simd/jsimd_mips.c b/simd/jsimd_mips.c
-index 63b8115..02e90cd 100644
---- a/simd/jsimd_mips.c
-+++ b/simd/jsimd_mips.c
-@@ -63,6 +63,8 @@ parse_proc_cpuinfo(const char* search_string)
- LOCAL(void)
- init_simd (void)
- {
-+  char *env = NULL;
-+
-   if (simd_support != ~0U)
-     return;
- 
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.2.bb
similarity index 90%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.2.bb
index de2eeaf..58646d3 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.2.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=05bab7c7ad899d85bfba60da1a127
 DEPENDS_append_x86-64_class-target = " nasm-native"
 DEPENDS_append_x86_class-target    = " nasm-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://fix-mips.patch"
-SRC_URI[md5sum] = "55deb139b0cac3c8200b75d485fc13f3"
-SRC_URI[sha256sum] = "41429d3d253017433f66e3d472b8c7d998491d2f41caa7306b8d9a6f2a2c666c"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6b4923e297a7eaa255f08511017a8818"
+SRC_URI[sha256sum] = "9098943b270388727ae61de82adec73cf9f0dbb240b3bc8b172595ebf405b528"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.4.0


