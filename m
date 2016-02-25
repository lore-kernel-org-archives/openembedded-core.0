Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA48773A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220129"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:24 +0200
Message-Id: <7cf35240a0e9bd517c326828e076c4c3fc649b03.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/19] ccache: update to 3.2.4
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:10 -0000

Drop backported 0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../ccache/{ccache_3.2.3.bb => ccache_3.2.4.bb}    |  4 +-
 ...ion-in-recent-change-related-to-zlib-in-n.patch | 73 ----------------------
 2 files changed, 2 insertions(+), 75 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.2.3.bb => ccache_3.2.4.bb} (57%)
 delete mode 100644 meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch

diff --git a/meta/recipes-devtools/ccache/ccache_3.2.3.bb b/meta/recipes-devtools/ccache/ccache_3.2.4.bb
similarity index 57%
rename from meta/recipes-devtools/ccache/ccache_3.2.3.bb
rename to meta/recipes-devtools/ccache/ccache_3.2.4.bb
index 97f557a..fd45e41 100644
--- a/meta/recipes-devtools/ccache/ccache_3.2.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.2.4.bb
@@ -3,8 +3,8 @@ require ccache.inc
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3c337e7664559a789d9f7a93e5283c1"
 
-SRCREV = "4cad46e8ee0053144bb00919f0dadd20c1f87013"
+SRCREV = "2254797f1c5cfb83c4272da7b138f7f47218eb7d"
 
-SRC_URI += "file://0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch \
+SRC_URI += " \
             file://0002-dev.mk.in-fix-file-name-too-long.patch \
 "
diff --git a/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch b/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch
deleted file mode 100644
index f5bd9aa..0000000
--- a/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From f74c76107933046309861680b741adc67ac2a34e Mon Sep 17 00:00:00 2001
-From: Joel Rosdahl <joel@rosdahl.net>
-Date: Mon, 17 Aug 2015 19:05:14 +0200
-Subject: [PATCH] Fix regression in recent change related to zlib in
- nonstandard location
-
-To allow for specifying a -L flag in LDFLAGS and have it take effect for
--lz, 0220de9c8ebfb18caae2ac1aa163d060e98ceade put -lz in extra_libs
-instead of extra_ldflags. However, extra_libs is supposed to contain
-paths to libraries which are prerequisites of the ccache link rule, and
-some older versions of make got confused by seeing -lz as a
-prerequisite.
-
-This fix is to revert 0220de9c8ebfb18caae2ac1aa163d060e98ceade and
-instead make sure that LDFLAGS comes before extra_ldflags.
-
-Upstream-Status: Backport
----
- Makefile.in  |  2 +-
- NEWS.txt     | 10 ++++++++++
- configure.ac |  2 +-
- 3 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index e7515b1..d3621cd 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -20,7 +20,7 @@ RANLIB = @RANLIB@
- 
- all_cflags = $(CFLAGS)
- all_cppflags = @DEFS@ @extra_cppflags@ -DSYSCONFDIR=$(sysconfdir) -I. -I$(srcdir) $(CPPFLAGS)
--all_ldflags = @extra_ldflags@ $(LDFLAGS)
-+all_ldflags = $(LDFLAGS) @extra_ldflags@
- extra_libs = @extra_libs@
- 
- base_sources = \
-diff --git a/NEWS.txt b/NEWS.txt
-index f13feeb..eaeadf6 100644
---- a/NEWS.txt
-+++ b/NEWS.txt
-@@ -2,6 +2,16 @@ ccache news
- ===========
- 
- 
-+Unreleased 3.2.4
-+----------------
-+
-+Bug fixes
-+~~~~~~~~~
-+
-+- Fixed build error related to zlib on systems with older make versions
-+  (regression in ccache 3.2.3).
-+
-+
- ccache 3.2.3
- ------------
- Release date: 2015-08-16
-diff --git a/configure.ac b/configure.ac
-index 8d8ce92..9e65588 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -120,7 +120,7 @@ if test x${use_bundled_zlib} = xyes; then
-     extra_libs="zlib/libz.a"
-     mkdir -p zlib
- else
--    extra_libs="-lz"
-+    extra_ldflags="-lz"
- fi
- 
- dnl Linking on Windows needs ws2_32
--- 
-2.1.4
-
-- 
2.7.0


