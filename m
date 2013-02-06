Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U38Ef-00050g-3Y
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 17:52:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Feb 2013 08:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,616,1355126400"; d="scan'208";a="253404659"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 06 Feb 2013 08:36:40 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 18:36:26 +0200
Message-Id: <4ac0c041b62e5495bff97bd2d7dc5a4e31d7ce5f.1360166922.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360166922.git.laurentiu.palcu@intel.com>
References: <cover.1360166922.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360166922.git.laurentiu.palcu@intel.com>
References: <cover.1360166922.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/6] Add pixbufcache class
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
X-List-Received-Date: Wed, 06 Feb 2013 16:52:43 -0000

All packages exporting pixbuf loaders should inherit this class in order
to generate the correct postinst/postrm scriptlets.

[YOCTO #3852]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/pixbufcache.bbclass |   57 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 meta/classes/pixbufcache.bbclass

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
new file mode 100644
index 0000000..575f8c2
--- /dev/null
+++ b/meta/classes/pixbufcache.bbclass
@@ -0,0 +1,57 @@
+#
+# This class will generate the proper postinst/postrm scriptlets for pixbuf
+# packages.
+#
+
+DEPENDS += "qemu-native"
+inherit qemu
+
+PIXBUF_PACKAGES ??= "${PN}"
+
+pixbufcache_common() {
+
+if [ "x$D" != "x" ]; then
+	if [ ! -f $INTERCEPT_DIR/update_pixbuf_cache ]; then
+		cat << "EOF" >$INTERCEPT_DIR/update_pixbuf_cache
+#!/bin/sh
+
+export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
+
+${@qemu_run_binary(d, '$D', '/usr/bin/gdk-pixbuf-query-loaders')} \
+	>$GDK_PIXBUF_MODULEDIR/../loaders.cache 2>/dev/null
+
+sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
+EOF
+	fi
+	exit 0
+fi
+
+# Update the pixbuf loaders in case they haven't been registered yet
+GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
+
+if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
+    for icondir in /usr/share/icons/*; do
+        if [ -d ${icondir} ]; then
+            gtk-update-icon-cache -t -q ${icondir}
+        fi
+    done
+fi
+}
+
+python populate_packages_append() {
+    pixbuf_pkgs = d.getVar('PIXBUF_PACKAGES', True).split()
+
+    for pkg in pixbuf_pkgs:
+        bb.note("adding pixbuf postinst and postrm scripts to %s" % pkg)
+        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+        if not postinst:
+            postinst = '#!/bin/sh\n'
+        postinst += d.getVar('pixbufcache_common', True)
+        d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+        if not postrm:
+            postrm = '#!/bin/sh\n'
+        postrm += d.getVar('pixbufcache_common', True)
+        d.setVar('pkg_postrm_%s' % pkg, postrm)
+}
-- 
1.7.9.5



