Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QAbkc-0004iP-9f
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 07:39:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Apr 2011 22:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,216,1301900400"; d="scan'208";a="629026367"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by orsmga002.jf.intel.com with ESMTP; 14 Apr 2011 22:36:49 -0700
Message-Id: <13be26f5e7fcadbbe0037d6c404d4efa7633bf15.1302846043.git.ke.yu@intel.com>
In-Reply-To: <cover.1302846043.git.ke.yu@intel.com>
References: <cover.1302846043.git.ke.yu@intel.com>
Old-Date: Thu, 7 Apr 2011 15:16:01 +0800
Date: Fri, 15 Apr 2011 13:44:11 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 1/9] libdrm: upgrade from 2.4.23 to 2.4.25
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2011 05:39:26 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 .../drm/libdrm-2.4.23/installtests.patch           |   43 -----------------
 .../drm/libdrm-2.4.25/installtests.patch           |   49 ++++++++++++++++++++
 .../drm/{libdrm_2.4.23.bb => libdrm_2.4.25.bb}     |    5 +-
 4 files changed, 53 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm-2.4.23/installtests.patch
 create mode 100644 meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.23.bb => libdrm_2.4.25.bb} (54%)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index b164b77..3e9c9da 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -136,7 +136,7 @@ PREFERRED_VERSION_xtrans-nativesdk ?= "1.2.6"
 PREFERRED_VERSION_xvinfo ?= "1.1.1"
 PREFERRED_VERSION_xwininfo ?= "1.1.1"
 PREFERRED_VERSION_mesa-dri ?= "7.10"
-PREFERRED_VERSION_libdrm ?= "2.4.23"
+PREFERRED_VERSION_libdrm ?= "2.4.25"
 PREFERRED_VERSION_xcb-proto ?= "1.6"
 PREFERRED_VERSION_libxcb ?= "1.7"
 PREFERRED_VERSION_libxcb-nativesdk ?= "1.7"
diff --git a/meta/recipes-graphics/drm/libdrm-2.4.23/installtests.patch b/meta/recipes-graphics/drm/libdrm-2.4.23/installtests.patch
deleted file mode 100644
index 9d6a168..0000000
--- a/meta/recipes-graphics/drm/libdrm-2.4.23/installtests.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Index: libdrm-2.4.7/tests/Makefile.am
-===================================================================
---- libdrm-2.4.7.orig/tests/Makefile.am	2009-04-09 20:16:35.000000000 +0100
-+++ libdrm-2.4.7/tests/Makefile.am	2009-04-17 12:35:14.000000000 +0100
-@@ -6,10 +6,11 @@
-
- LDADD = $(top_builddir)/libdrm.la
-
--check_PROGRAMS = \
-+bin_PROGRAMS = \
- 	dristat \
- 	drmstat
-
-+check_PROGRAMS =
- SUBDIRS =
-
- if HAVE_LIBKMS
-Index: libdrm-2.4.7/tests/modeprint/Makefile.am
-===================================================================
---- libdrm-2.4.7.orig/tests/modeprint/Makefile.am	2009-02-17 19:52:37.000000000 +0000
-+++ libdrm-2.4.7/tests/modeprint/Makefile.am	2009-04-17 12:35:32.000000000 +0100
-@@ -3,7 +3,7 @@
- 	-I$(top_srcdir)/libdrm/intel/ \
- 	-I$(top_srcdir)/libdrm
-
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	modeprint
-
- modeprint_SOURCES = \
-Index: libdrm-2.4.7/tests/modetest/Makefile.am
-===================================================================
---- libdrm-2.4.7.orig/tests/modetest/Makefile.am	2009-02-17 19:52:37.000000000 +0000
-+++ libdrm-2.4.7/tests/modetest/Makefile.am	2009-04-17 12:35:42.000000000 +0100
-@@ -4,7 +4,7 @@
- 	-I$(top_srcdir)/libdrm \
- 	$(CAIRO_CFLAGS)
-
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	modetest
-
- modetest_SOURCES = \
diff --git a/meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch b/meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
new file mode 100644
index 0000000..2704ee6
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
@@ -0,0 +1,49 @@
+tests: also install tests app
+
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index bf1987f..d909e19 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -6,10 +6,11 @@ AM_CPPFLAGS = \
+ 
+ LDADD = $(top_builddir)/libdrm.la
+ 
+-check_PROGRAMS = \
++bin_PROGRAMS = \
+ 	dristat \
+ 	drmstat
+ 
++check_PROGRAMS =
+ SUBDIRS = modeprint
+ 
+ if HAVE_LIBKMS
+diff --git a/tests/modeprint/Makefile.am b/tests/modeprint/Makefile.am
+index c4862ac..7db76ea 100644
+--- a/tests/modeprint/Makefile.am
++++ b/tests/modeprint/Makefile.am
+@@ -2,7 +2,7 @@ AM_CFLAGS = \
+ 	-I$(top_srcdir)/include/drm \
+ 	-I$(top_srcdir)
+ 
+-noinst_PROGRAMS = \
++bin_PROGRAMS = \
+ 	modeprint
+ 
+ modeprint_SOURCES = \
+diff --git a/tests/modetest/Makefile.am b/tests/modetest/Makefile.am
+index 2191242..1d2c1b0 100644
+--- a/tests/modetest/Makefile.am
++++ b/tests/modetest/Makefile.am
+@@ -4,7 +4,7 @@ AM_CFLAGS = \
+ 	-I$(top_srcdir) \
+ 	$(CAIRO_CFLAGS)
+ 
+-noinst_PROGRAMS = \
++bin_PROGRAMS = \
+ 	modetest
+ 
+ modetest_SOURCES = \
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.23.bb b/meta/recipes-graphics/drm/libdrm_2.4.25.bb
similarity index 54%
rename from meta/recipes-graphics/drm/libdrm_2.4.23.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.25.bb
index 1546cea..177e444 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.23.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.25.bb
@@ -3,7 +3,8 @@ require libdrm.inc
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 
 SRC_URI += "file://installtests.patch"
-SRC_URI[md5sum] = "7577ff36ec364d88fae466d4f7fc5fc6"
-SRC_URI[sha256sum] = "c0f06d68c3edba7a1ad937f5481a8c287efd4cd368cee66cd9e678b06a911c18"
+
+SRC_URI[md5sum] = "f53dc4c72109b17908e4113c3b8addfe"
+SRC_URI[sha256sum] = "51f99a815a18876977991bbc6f190607791d25a6e47a3269880ce7679dbd0e9f"
 
 PR = "r0"
-- 
1.7.0.4



