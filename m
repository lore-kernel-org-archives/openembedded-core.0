Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2fB6-0006Tm-C9
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 10:51:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 01:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="281086841"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 01:35:07 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 11:34:55 +0200
Message-Id: <a306516e1af55efcd93563779e389448e16c97d3.1360055640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/8] add fontcache.bbclass
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
X-List-Received-Date: Tue, 05 Feb 2013 09:51:02 -0000

All font packages should inherit this class in order to generate the
proper postinst/postrm scriptlets.

The scriptlets will actually create a host intercept hook that will be
executed at the end, at do_rootfs time, after all packages have been
installed. This is good when there are many font packages.

[YOCTO #2923]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/fontcache.bbclass |   47 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta/classes/fontcache.bbclass

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
new file mode 100644
index 0000000..8381735
--- /dev/null
+++ b/meta/classes/fontcache.bbclass
@@ -0,0 +1,47 @@
+#
+# This class will generate the proper postinst/postrm scriptlets for font
+# packages.
+#
+
+DEPENDS += "qemu-native"
+inherit qemu
+
+FONT_PACKAGES ??= "${PN}"
+
+fontcache_common() {
+if [ "x$D" != "x" ] ; then
+	if [ ! -f $INTERCEPT_DIR/update_font_cache ]; then
+		cat << "EOF" > $INTERCEPT_DIR/update_font_cache
+#!/bin/sh
+
+${@qemu_run_binary(d, '$D', '/usr/bin/fc-cache')} --sysroot=$D >/dev/null 2>&1
+
+if [ $? -ne 0 ]; then
+    exit 1
+fi
+
+EOF
+	fi
+	exit 0
+fi
+
+fc-cache
+}
+
+python populate_packages_append() {
+    font_pkgs = d.getVar('FONT_PACKAGES', True).split()
+
+    for pkg in font_pkgs:
+        bb.note("adding fonts postinst and postrm scripts to %s" % pkg)
+        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+        if not postinst:
+            postinst = '#!/bin/sh\n'
+        postinst += d.getVar('fontcache_common', True)
+        d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+        if not postrm:
+            postrm = '#!/bin/sh\n'
+        postrm += d.getVar('fontcache_common', True)
+        d.setVar('pkg_postrm_%s' % pkg, postrm)
+}
-- 
1.7.9.5



