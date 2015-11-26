Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B2526601D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574723"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:11 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:17 +0200
Message-Id: <3c0500b00ff508cb02ec3e86936ac8bf27358086.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/29] gtk+: enable gobject introspection
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:10 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index a197b9d..3ccdbe8 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -25,13 +25,12 @@ PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS
 # without --with-gdktarget=directfb it will check for cairo-xlib which isn't available without X11 DISTRO_FEATURE
 PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
 
-inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache
+inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache gobject-introspection
 
 PACKAGES += "libgail gtk-demo"
 
-FILES_${PN} = "${bindir}/gtk-update-icon-cache-2.0 \
+FILES_${PN} += "${bindir}/gtk-update-icon-cache-2.0 \
 	${bindir}/gtk-query-immodules-2.0 \
-	${libdir}/lib*${SOLIBS} \
 	${datadir}/themes ${sysconfdir} \
 	${libdir}/gtk-2.0/${LIBV}/engines/libpixmap.so"
 
@@ -71,6 +70,10 @@ RRECOMMENDS_${PN}_libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
 ALTERNATIVE_${PN} = "gtk-update-icon-cache"
 ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-2.0"
 
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
+}
+
 do_install () {
 	autotools_do_install
 
-- 
2.6.2


