Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TwAfX-0002Kz-3D
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:03:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2013 03:47:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,491,1355126400"; d="scan'208";a="245575092"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 03:47:54 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 13:48:32 +0200
Message-Id: <a33524c2f10b8d4da7eeebb33b3cffbbe5683299.1358509450.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1358509450.git.constantinx.musca@intel.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1358509450.git.constantinx.musca@intel.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
Subject: [PATCH 4/4] cairo: use directfb instead of gtk-directfb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 12:03:35 -0000

- we now have directfb as DISTRO_FEATURE
- DirectFB is not supported by gtk versions >= 2.18

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-graphics/cairo/cairo.inc       | 4 ++--
 meta/recipes-graphics/cairo/cairo_1.12.8.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 217e297..9bec6c2 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -13,9 +13,9 @@ LICENSE = "MPL-1 & LGPLv2.1"
 X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'gtk-directfb', 'gtk-directfb', '', d)}"
+           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
 PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
-PACKAGECONFIG[gtk-directfb] = "--enable-directfb=yes,,directfb"
+PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
 BBCLASSEXTEND = "native"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
diff --git a/meta/recipes-graphics/cairo/cairo_1.12.8.bb b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
index 567a17f..49b1786 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.8.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-- 
1.7.11.7



