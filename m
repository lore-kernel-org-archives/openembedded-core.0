Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TlgD6-0005Zs-BF
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 14:30:52 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2012 05:14:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,322,1355126400"; d="scan'208";a="260184612"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2012 05:15:44 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 15:15:39 +0200
Message-Id: <1356009340-15874-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
References: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH v2 2/3] gtk-immodules-cache.bbclass: allow for offline cache generation
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
X-List-Received-Date: Thu, 20 Dec 2012 13:30:52 -0000

In order to support a RO rootfs, the cache generation during postinstall
has to be done on host. However, gtk-query-immodules application will
only be able to parse shared objects from the same ELF class.
In order not to have a native package for all the recipes providing
an input method, so we can generate the cache file natively, run
gtk-query-immodules through qemu emulator.

[YOCTO #3602]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/gtk-immodules-cache.bbclass |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 515d28b..9ffb03b 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -2,9 +2,24 @@
 #
 # Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to update the inputmethod modules
 
+DEPENDS =+ "qemu-native"
+
+inherit qemu
+
 gtk_immodule_cache_postinst() {
 if [ "x$D" != "x" ]; then
-    exit 1
+    for maj_ver in 2 3; do
+        if [ -x $D${bindir}/gtk-query-immodules-$maj_ver.0 ]; then
+            IMFILES=$(ls $D${libdir}/gtk-$maj_ver.0/*/immodules/*.so)
+            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-$maj_ver.0')} \
+                $IMFILES > $D/etc/gtk-$maj_ver.0/gtk.immodules 2>/dev/null &&
+                sed -i -e "s:$D::" $D/etc/gtk-$maj_ver.0/gtk.immodules
+
+            [ $? -ne 0 ] && exit 1
+        fi
+    done
+
+    exit 0
 fi
 if [ ! -z `which gtk-query-immodules-2.0` ]; then
     gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
-- 
1.7.9.5



