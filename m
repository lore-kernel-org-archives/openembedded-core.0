Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEIz0-00015i-KA
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 14:02:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2012 04:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194489253"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 04:49:40 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 14:49:23 +0300
Message-Id: <5ad9edce72b7300237251048d1cddc22259d496f.1348052899.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
Subject: [RFC 5/7] gdk-pixbuf: generate the pixbuf loader's cache ar rootfs time
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
X-List-Received-Date: Wed, 19 Sep 2012 12:02:22 -0000

This will generate the loaders.cache file for pixbuf, at rootfs time.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   24 ++++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index 99f6cb4..c4afb97 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -57,18 +57,22 @@ FILES_${PN}-dbg += " \
 
 postinst_pixbufloader () {
 if [ "x$D" != "x" ]; then
-    exit 1
+# Update the target's pixbuf loader's cache. Since the native binary will
+# throw an error if the shared objects do not belong to the same ELF class,
+# we trick the gdk-pixbuf-query-loaders into scanning the native shared
+# objects and then we remove the NATIVE_ROOT prefix from the paths in
+# loaders.cache.
+gdk-pixbuf-query-loaders $(find $D/${libdir}/gdk-pixbuf-2.0/2.10.0/loaders \
+        -name *.so | sed -e "s:$D:$NATIVE_ROOT:g") > \
+        $D/${libdir}/gdk-pixbuf-2.0/2.10.0/loaders.cache || exit 1
+
+sed -i -e "s:$NATIVE_ROOT:/:g" $D/${libdir}/gdk-pixbuf-2.0/2.10.0/loaders.cache
+
+exit 0
 fi
 
-GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixbuf-query-loaders --update-cache
-
-if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
-    for icondir in /usr/share/icons/*; do
-        if [ -d ${icondir} ]; then
-            gtk-update-icon-cache -t -q ${icondir}
-        fi
-    done
-fi
+# Update the pixbuf loaders in case they haven't been registered yet
+GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
 }
 
 PACKAGES_DYNAMIC += "gdk-pixbuf-loader-*"
-- 
1.7.9.5



