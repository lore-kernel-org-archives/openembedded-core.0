Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7EB6EE4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 13:45:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Feb 2014 05:45:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,838,1384329600"; d="scan'208";a="480885825"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2014 05:45:20 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 15:45:19 +0200
Message-Id: <b123956388741389e9456a5d986e8e3b33fca234.1392298949.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392298949.git.valentin.popa@intel.com>
References: <cover.1392298949.git.valentin.popa@intel.com>
In-Reply-To: <cover.1392298949.git.valentin.popa@intel.com>
References: <cover.1392298949.git.valentin.popa@intel.com>
Subject: [PATCH 1/2] wayland: upgrade to 1.4.0
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
X-List-Received-Date: Thu, 13 Feb 2014 13:45:20 -0000

(*) tested on qemux86 and genericx86 with
core-image-weston and core-image-sato

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../wayland/wayland/just-scanner.patch              | 21 +++++++++++++++++----
 .../wayland/{wayland_1.3.0.bb => wayland_1.4.0.bb}  |  6 +++---
 2 files changed, 20 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.3.0.bb => wayland_1.4.0.bb} (87%)

diff --git a/meta/recipes-graphics/wayland/wayland/just-scanner.patch b/meta/recipes-graphics/wayland/wayland/just-scanner.patch
index 234a9c5..ae9935e 100644
--- a/meta/recipes-graphics/wayland/wayland/just-scanner.patch
+++ b/meta/recipes-graphics/wayland/wayland/just-scanner.patch
@@ -1,3 +1,8 @@
+From f674544d4f6f5f763e449207da77a561b22eff97 Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Fri, 7 Feb 2014 16:36:47 +0200
+Subject: [PATCH] just scanner
+
 We only build wayland-native for the scanner, so disable the bits we don't
 actually need.  This gives us a small speed up but importantly should allow
 wayland-native to compile on older hosts such as CentOS 5 which currently fails:
@@ -10,22 +15,27 @@ wayland-native to compile on older hosts such as CentOS 5 which currently fails:
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Valentin Popa <valentin.popa@intel.com>
+---
+ Makefile.am     | 2 +-
+ src/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 306d7b3..571fe89 100644
+index 99607b0..ecce1f1 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -2,7 +2,7 @@ if BUILD_DOCS
  doc_subdir = doc
  endif
  
--SUBDIRS = src protocol $(doc_subdir) tests cursor
-+SUBDIRS = src protocol $(doc_subdir)
+-SUBDIRS = protocol src $(doc_subdir) tests cursor
++SUBDIRS = protocol src $(doc_subdir)
  
  ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
  
 diff --git a/src/Makefile.am b/src/Makefile.am
-index e1d04ea..702342e 100644
+index 15f44a5..b938d17 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -1,4 +1,4 @@
@@ -34,3 +44,6 @@ index e1d04ea..702342e 100644
  noinst_LTLIBRARIES = libwayland-util.la
  
  include_HEADERS =				\
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-graphics/wayland/wayland_1.3.0.bb b/meta/recipes-graphics/wayland/wayland_1.4.0.bb
similarity index 87%
rename from meta/recipes-graphics/wayland/wayland_1.3.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.4.0.bb
index 212e08a..9cf6064 100644
--- a/meta/recipes-graphics/wayland/wayland_1.3.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.4.0.bb
@@ -11,10 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
-SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
+SRC_URI[md5sum] = "332cf9191837be12638a29265ed7cf46"
+SRC_URI[sha256sum] = "18f33b9f15b4c8b662fb1968e7636e7926b419dfc48de8a164b3a3d7095c5a58"
 
 SRC_URI_append_class-native = " file://just-scanner.patch"
+EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
 
 inherit autotools pkgconfig
 
@@ -24,7 +25,6 @@ BBCLASSEXTEND = "native"
 DEPENDS_virtclass-native = "expat-native libffi-native"
 DEPENDS = "expat libffi wayland-native"
 
-EXTRA_OECONF_virtclass-native = "--disable-documentation"
 EXTRA_OECONF = "--disable-documentation --disable-scanner"
 
 # Wayland installs a M4 macro for other projects to use, which uses the target
-- 
1.8.3.2


