Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D2DC4757EF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 08:38:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t538cKDN020340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jun 2015 01:38:20 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 3 Jun 2015 01:38:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jun 2015 01:38:18 -0700
Message-ID: <f6f7ba4a719a8fe6e93d70541812a2b3af92e5cb.1433320510.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433320510.git.liezhi.yang@windriver.com>
References: <cover.1433320510.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gtk+/cairo: enable x11 or directfb
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
X-List-Received-Date: Wed, 03 Jun 2015 08:38:20 -0000
Content-Type: text/plain

The gtk+2 requires whether x11 or directfb to build, so we need enable
either of them. The cairo can be built without x11 or directfb, but gtk+
requires cairo, so enable x11 or directfb for cairo, too.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc      |    5 ++---
 meta/recipes-graphics/cairo/cairo.inc |    8 ++++++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 1c0558c..fcfb86f 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -14,9 +14,8 @@ X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
  cairo gdk-pixbuf"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-"
+# Requires x11 or directfb
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'directfb', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
 # without --with-gdktarget=directfb it will check for cairo-xlib which isn't available without X11 DISTRO_FEATURE
diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 1e45318..f6474bc 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -17,8 +17,12 @@ LICENSE_${PN}-perf-utils = "GPLv3+"
 X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+# Build cairo-xlib or cairo-directfb for gtk+
+PACKAGECONFIG ??= " ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', 'directfb', d)} \
+                    "
+
+# No directfb-native, so set PACKAGECONFIG to null when no x11
+PACKAGECONFIG_class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
 PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
-- 
1.7.9.5


