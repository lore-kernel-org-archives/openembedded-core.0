Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3A26FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:07:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083675"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:26 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:58 +0200
Message-Id: <8eb8114e582fd3b042fb7199e1c978281a6668b4.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/24] gtk+: enable gobject introspection
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
X-List-Received-Date: Wed, 09 Mar 2016 15:07:27 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 936870b..5bbfe6b 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -29,13 +29,12 @@ PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS
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
 
@@ -68,6 +67,10 @@ RRECOMMENDS_${PN}_libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
 ALTERNATIVE_${PN} = "gtk-update-icon-cache"
 ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-2.0"
 
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
+}
+
 do_install () {
 	autotools_do_install
 
-- 
2.7.0


