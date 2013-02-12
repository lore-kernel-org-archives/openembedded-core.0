Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5Ijy-0000zM-7S
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:30:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284742085"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:12:58 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:43 +0200
Message-Id: <d773ef071663da1a3871d600ec450f2f03d36c02.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
Subject: [PATCH 08/11] librsvg: use the new pixbufcache class
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
X-List-Received-Date: Tue, 12 Feb 2013 16:30:19 -0000

Also, fix the GDK_PIXBUF_QUERYLOADERS path.

[YOCTO #3582]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |   21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 3621045..ff17cf7 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -11,9 +11,9 @@ DEPENDS = "gtk+ cairo libxml2"
 DEPENDS_class-native = "cairo-native pango-native gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
-PR = "r11"
+PR = "r12"
 
-inherit autotools pkgconfig gnome gtk-doc
+inherit autotools pkgconfig gnome gtk-doc pixbufcache
 
 EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz"
 
@@ -31,7 +31,7 @@ SRC_URI[archive.md5sum] = "4b00d0fee130c936644892c152f42db7"
 SRC_URI[archive.sha256sum] = "91b98051f352fab8a6257688d6b2fd665b4648ed66144861f2f853ccf876d334"
 
 do_configure_prepend () {
-	export GDK_PIXBUF_QUERYLOADERS="${libdir}/gtk-2.0/version/loaders"
+	export GDK_PIXBUF_QUERYLOADERS="${libdir}/gdk-pixbuf-2.0/2.10.0/loaders"
 }
 
 PACKAGES =+ "librsvg-gtk librsvg-gtk-dbg librsvg-gtk-dev rsvg"
@@ -53,18 +53,5 @@ FILES_librsvg-gtk-dbg += "${libdir}/gdk-pixbuf-2.0/.debug \
                           ${libdir}/gtk-2.0/.debug \
                           ${libdir}/gtk-2.0/*/*/.debug"
 
-pkg_postinst_librsvg-gtk() {
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
-if [ -d ${libdir}/gtk-2.0/2.10.0/loaders ] ; then
-	export GDK_PIXBUF_MODULEDIR=${libdir}/gtk-2.0/2.10.0/loaders
-else
-	export GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
-fi
-
-test -x ${bindir}/gdk-pixbuf-query-loaders && gdk-pixbuf-query-loaders > ${sysconfdir}/gtk-2.0/gdk-pixbuf.loaders
-test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q ${datadir}/icons/hicolor
-}
+PIXBUF_PACKAGES = "librsvg-gtk"
 PARALLEL_MAKE = ""
-- 
1.7.9.5



