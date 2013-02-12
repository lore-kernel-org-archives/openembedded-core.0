Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5Ijx-0000zN-5q
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:29:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284742060"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:12:56 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:41 +0200
Message-Id: <f780e60fbf3c3d56ce4742ca25384e94fd0890aa.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
Subject: [PATCH 06/11] Add pixbufcache class
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
X-List-Received-Date: Tue, 12 Feb 2013 16:30:04 -0000

All packages exporting pixbuf loaders should inherit this class in order
to generate the correct postinst/postrm scriptlets.

[YOCTO #3852]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/pixbufcache.bbclass |   50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/classes/pixbufcache.bbclass

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
new file mode 100644
index 0000000..fc749de
--- /dev/null
+++ b/meta/classes/pixbufcache.bbclass
@@ -0,0 +1,50 @@
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
+#
+# On host, the postinstall MUST return 1 because we do not know if the intercept
+# hook will succeed. If it does succeed, than the packages will be marked as
+# installed.
+#
+pixbufcache_common() {
+if [ "x$D" != "x" ]; then
+	$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} libdir=${libdir} bindir=${bindir}
+	exit 1
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



