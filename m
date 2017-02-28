Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5E372F6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:27:11 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 28 Feb 2017 01:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,218,1484035200"; d="scan'208";a="70423324"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2017 01:27:13 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 7F6856A4080;
	Tue, 28 Feb 2017 01:27:11 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 11:26:59 +0200
Message-Id: <ff3ce9305d1d0be4d276ae1d8120d3e6fd3ba81b.1488272553.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488272553.git.jussi.kukkonen@intel.com>
References: <cover.1488272553.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 6/6] vkcube: Add recipe for minimal vulkan demo
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
X-List-Received-Date: Tue, 28 Feb 2017 09:27:12 -0000

It currently requires libvulkan_intel.so (mesa intel vulkan driver),
meaning that mesa needs to be built with "vulkan" PACKAGECONFIG.
Also, currently vkcube is only buildable with both X and wayland
support without other options.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../vkcube/0001-Install-the-vkcube-binary.patch    | 38 ++++++++++++++++++++++
 meta/recipes-graphics/vulkan/vkcube_git.bb         | 18 ++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vkcube/0001-Install-the-vkcube-binary.patch
 create mode 100644 meta/recipes-graphics/vulkan/vkcube_git.bb

diff --git a/meta/recipes-graphics/vulkan/vkcube/0001-Install-the-vkcube-binary.patch b/meta/recipes-graphics/vulkan/vkcube/0001-Install-the-vkcube-binary.patch
new file mode 100644
index 0000000..012ee52
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vkcube/0001-Install-the-vkcube-binary.patch
@@ -0,0 +1,38 @@
+From 18d1d30a6c7ad73b25751152cc4dda89e9cf77dd Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Sat, 25 Feb 2017 18:27:54 +0200
+Subject: [PATCH] Install binary, never clean generated files
+
+We don't have the tools to regenerate the spv.h files, don't
+clean them.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ Makefile.am | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 78724bb..e208152 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -11,7 +11,7 @@ CFLAGS = -std=c11				\
+ 
+ CXXFLAGS = -std=c++11 $(common_CFLAGS)
+ 
+-noinst_PROGRAMS = vkcube
++bin_PROGRAMS = vkcube
+ 
+ BUILT_SOURCES = \
+ 	vkcube.vert.spv.h			\
+@@ -30,7 +30,5 @@ vkcube_SOURCES =				\
+ 	esTransform.c				\
+ 	esUtil.h
+ 
+-CLEANFILES = $(BUILT_SOURCES)
+-
+ vkcube_CFLAGS = $(CFLAGS) $(MINIGBM_CPPFLAGS) $(LIBDRM_CFLAGS) $(WAYLAND_CFLAGS)  $(LIBPNG_CFLAGS)
+ vkcube_LDADD = $(MINIGBM_LDFLAGS) $(MESA_LDFLAGS) $(LIBDRM_LIBS) $(WAYLAND_LIBS)  $(LIBPNG_LIBS) -lgbm -lm -lvulkan -lxcb
+-- 
+2.11.0
+
diff --git a/meta/recipes-graphics/vulkan/vkcube_git.bb b/meta/recipes-graphics/vulkan/vkcube_git.bb
new file mode 100644
index 0000000..88ade83
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vkcube_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A simple Vulkan demo"
+HOMEPAGE = "https://github.com/krh/vkcube"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://main.c;endline=24;md5=9eb35fa5573e696e3f59ec043ad2b5bc"
+
+PV = "0.1+git${SRCPV}"
+
+SRC_URI = "git://github.com/krh/vkcube.git \
+           file://0001-Install-the-vkcube-binary.patch"
+SRCREV = "80c0d047c257f486d054f28b0b381abef3327069"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11 wayland"
+
+DEPENDS = "libpng libxcb wayland mesa libdrm vulkan"
-- 
2.1.4


