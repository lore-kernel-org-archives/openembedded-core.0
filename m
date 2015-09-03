Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE847700B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539461"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:46 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:10 +0300
Message-Id: <b8ff0174fb878e4f0d2cf7aabf6769a85c1c6d1d.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/12] ccache: update to 3.2.3
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:48 -0000

The LICENSE checksum has changed because of updated copyright years.

SRC_URI has been changed to git, because upstream tarball is broken
(includes configure.ac but not .m4 files it depends on).

Add a backported patch that fixes builds with older versions of make
and external zlib.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/ccache/ccache.inc            |  4 +-
 meta/recipes-devtools/ccache/ccache_3.1.11.bb      |  7 ---
 meta/recipes-devtools/ccache/ccache_3.2.3.bb       |  8 +++
 ...ion-in-recent-change-related-to-zlib-in-n.patch | 73 ++++++++++++++++++++++
 4 files changed, 84 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.1.11.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.2.3.bb
 create mode 100644 meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index 087cb7d..4790021 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -9,7 +9,9 @@ LICENSE = "GPLv3+"
 
 DEPENDS = "zlib"
 
-SRC_URI = "http://samba.org/ftp/ccache/ccache-${PV}.tar.xz"
+SRC_URI = "git://git.samba.org/ccache.git"
+
+S = "${WORKDIR}/git"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/ccache/ccache_3.1.11.bb b/meta/recipes-devtools/ccache/ccache_3.1.11.bb
deleted file mode 100644
index 7696003..0000000
--- a/meta/recipes-devtools/ccache/ccache_3.1.11.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
-
-SRC_URI[md5sum] = "0f6df80c8941d9020a1fd5df5ad57dd7"
-SRC_URI[sha256sum] = "60e9f3f1e60f528cfce910f3224bcc698029320f6ab77ec09a7b46bda2bc678e"
diff --git a/meta/recipes-devtools/ccache/ccache_3.2.3.bb b/meta/recipes-devtools/ccache/ccache_3.2.3.bb
new file mode 100644
index 0000000..357df75
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.2.3.bb
@@ -0,0 +1,8 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3c337e7664559a789d9f7a93e5283c1"
+
+SRCREV = "4cad46e8ee0053144bb00919f0dadd20c1f87013"
+
+SRC_URI += "file://0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch"
diff --git a/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch b/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch
new file mode 100644
index 0000000..a8400d5
--- /dev/null
+++ b/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch
@@ -0,0 +1,73 @@
+From f74c76107933046309861680b741adc67ac2a34e Mon Sep 17 00:00:00 2001
+From: Joel Rosdahl <joel@rosdahl.net>
+Date: Mon, 17 Aug 2015 19:05:14 +0200
+Subject: [PATCH] Fix regression in recent change related to zlib in
+ nonstandard location
+
+To allow for specifying a -L flag in LDFLAGS and have it take effect for
+-lz, 0220de9c8ebfb18caae2ac1aa163d060e98ceade put -lz in extra_libs
+instead of extra_ldflags. However, extra_libs is supposed to contain
+paths to libraries which are prerequisites of the ccache link rule, and
+some older versions of make got confused by seeing -lz as a
+prerequisite.
+
+This fix is to revert 0220de9c8ebfb18caae2ac1aa163d060e98ceade and
+instead make sure that LDFLAGS comes before extra_ldflags.
+
+Upstream-status: Backport
+---
+ Makefile.in  |  2 +-
+ NEWS.txt     | 10 ++++++++++
+ configure.ac |  2 +-
+ 3 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index e7515b1..d3621cd 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -20,7 +20,7 @@ RANLIB = @RANLIB@
+ 
+ all_cflags = $(CFLAGS)
+ all_cppflags = @DEFS@ @extra_cppflags@ -DSYSCONFDIR=$(sysconfdir) -I. -I$(srcdir) $(CPPFLAGS)
+-all_ldflags = @extra_ldflags@ $(LDFLAGS)
++all_ldflags = $(LDFLAGS) @extra_ldflags@
+ extra_libs = @extra_libs@
+ 
+ base_sources = \
+diff --git a/NEWS.txt b/NEWS.txt
+index f13feeb..eaeadf6 100644
+--- a/NEWS.txt
++++ b/NEWS.txt
+@@ -2,6 +2,16 @@ ccache news
+ ===========
+ 
+ 
++Unreleased 3.2.4
++----------------
++
++Bug fixes
++~~~~~~~~~
++
++- Fixed build error related to zlib on systems with older make versions
++  (regression in ccache 3.2.3).
++
++
+ ccache 3.2.3
+ ------------
+ Release date: 2015-08-16
+diff --git a/configure.ac b/configure.ac
+index 8d8ce92..9e65588 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -120,7 +120,7 @@ if test x${use_bundled_zlib} = xyes; then
+     extra_libs="zlib/libz.a"
+     mkdir -p zlib
+ else
+-    extra_libs="-lz"
++    extra_ldflags="-lz"
+ fi
+ 
+ dnl Linking on Windows needs ws2_32
+-- 
+2.1.4
+
-- 
2.1.4


