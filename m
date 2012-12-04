Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TftFz-0000Sj-8x
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 15:13:55 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2012 05:59:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="226378584"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 04 Dec 2012 05:59:33 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Tue,  4 Dec 2012 15:59:11 +0200
Message-Id: <e5441f19f27ed7063c8bda010ea21bcf7af5a43a.1354626535.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/5] gdk-pixbuf: generate the pixbuf loader's cache ar rootfs time
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
X-List-Received-Date: Tue, 04 Dec 2012 14:13:55 -0000

This will generate the loaders.cache file for pixbuf, at rootfs time.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index 65a2d68..2377d0e 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -58,9 +58,21 @@ FILES_${PN}-dbg += " \
 
 postinst_pixbufloader () {
 if [ "x$D" != "x" ]; then
-    exit 1
+# Update the target's pixbuf loader's cache. Since the native binary will
+# throw an error if the shared objects do not belong to the same ELF class,
+# we trick the gdk-pixbuf-query-loaders into scanning the native shared
+# objects and then we remove the NATIVE_ROOT prefix from the paths in
+# loaders.cache.
+gdk-pixbuf-query-loaders $(find $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders \
+        -name *.so | sed -e "s:$D:$NATIVE_ROOT:g") > \
+        $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache || exit 1
+
+sed -i -e "s:$NATIVE_ROOT:/:g" $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
+
+exit 0
 fi
 
+# Update the pixbuf loaders in case they haven't been registered yet
 GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixbuf-query-loaders --update-cache
 
 if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
@@ -93,6 +105,7 @@ do_install_append_class-native() {
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-query-loaders \
-		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
+		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
+		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
 }
 BBCLASSEXTEND = "native"
-- 
1.7.9.5



