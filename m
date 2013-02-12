Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5Ijy-0000zO-20
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:30:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284742072"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:12:57 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:42 +0200
Message-Id: <98e7f52a29cfab913534c60fc6904cede805fa2c.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
Subject: [PATCH 07/11] gdk-pixbuf: use the new pixbufcache class
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

[YOCTO #3582]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb |   48 ++------------------
 1 file changed, 3 insertions(+), 45 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
index 64f1450..cc2ea50 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
@@ -20,9 +20,9 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.26/gdk-pixbuf-${
 SRC_URI[md5sum] = "339329e6d619ee3e1cb93979111b04c0"
 SRC_URI[sha256sum] = "77696fd163bca95a130a1883dbd78d0ae4d782de2fc85a9a38556d13681f5c84"
 
-PR = "r0"
+PR = "r1"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext pixbufcache
 
 LIBV = "2.10.0"
 
@@ -56,48 +56,6 @@ FILES_${PN}-dbg += " \
 	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
 "
 
-postinst_pixbufloader () {
-if [ "x$D" != "x" ]; then
-# Update the target's pixbuf loader's cache. Since the native binary will
-# throw an error if the shared objects do not belong to the same ELF class,
-# we trick the gdk-pixbuf-query-loaders into scanning the native shared
-# objects and then we remove the NATIVE_ROOT prefix from the paths in
-# loaders.cache.
-gdk-pixbuf-query-loaders $(ls -d -1 $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.so |\
-        sed -e "s:$D:$NATIVE_ROOT:g") > \
-        $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
-        2>$D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.err
-
-# gdk-pixbuf-query-loaders always returns 0, so we need to check if loaders.err
-# has anything in it
-if [ -s $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.err ]; then
-	echo "${PN} postinstall scriptlet failed:"
-	cat $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.err
-	rm $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.err
-	# we've got errors, postpone postinstall for first boot
-	exit 1
-fi
-
-sed -i -e "s:$NATIVE_ROOT:/:g" $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
-
-# remove the empty loaders.err
-rm $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.err
-
-exit 0
-fi
-
-# Update the pixbuf loaders in case they haven't been registered yet
-GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixbuf-query-loaders --update-cache
-
-if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
-    for icondir in /usr/share/icons/*; do
-        if [ -d ${icondir} ]; then
-            gtk-update-icon-cache -t -q ${icondir}
-        fi
-    done
-fi
-}
-
 PACKAGES_DYNAMIC += "^gdk-pixbuf-loader-.*"
 PACKAGES_DYNAMIC_class-native = ""
 
@@ -106,7 +64,7 @@ python populate_packages_prepend () {
 
     loaders_root = d.expand('${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders')
 
-    do_split_packages(d, loaders_root, '^libpixbufloader-(.*)\.so$', 'gdk-pixbuf-loader-%s', 'GDK pixbuf loader for %s', postinst_pixbufloader)
+    d.setVar('PIXBUF_PACKAGES', ' '.join(do_split_packages(d, loaders_root, '^libpixbufloader-(.*)\.so$', 'gdk-pixbuf-loader-%s', 'GDK pixbuf loader for %s')))
 }
 
 do_install_append_class-native() {
-- 
1.7.9.5



