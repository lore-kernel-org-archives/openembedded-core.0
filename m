Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TlPFn-0002Cr-LH
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 20:24:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Dec 2012 11:09:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,318,1355126400"; d="scan'208";a="234033982"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 19 Dec 2012 11:09:46 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2012 21:09:44 +0200
Message-Id: <1355944184-30294-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355932969-25071-2-git-send-email-laurentiu.palcu@intel.com>
References: <1355932969-25071-2-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH v2] gtk-immodules-cache.bbclass: allow for offline cache generation
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
X-List-Received-Date: Wed, 19 Dec 2012 19:24:34 -0000

In order to support a RO rootfs, the cache generation during postinstall
has to be done on host. However, gtk-query-immodules application will
only be able to parse shared objects from the same ELF class.
In order not to have a native package for all the recipes providing
an input method, so we can generate the cache file natively, run
gtk-query-immodules through qemu emulator.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---

Changes in v2:
 * Used qemu_target_binary() function, in order to obtain the qemu binary
   corresponding to the current target, as suggested by Phil (thank you,
   I didn't know that function existed);

Thanks,
Laurentiu

 meta/classes/gtk-immodules-cache.bbclass |   21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 515d28b..72595ee 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -2,9 +2,28 @@
 #
 # Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to update the inputmethod modules
 
+DEPENDS =+ "qemu-native"
+
+inherit qemu
+
 gtk_immodule_cache_postinst() {
 if [ "x$D" != "x" ]; then
-    exit 1
+
+for maj_ver in 2 3; do
+    if [ -x $D${bindir}/gtk-query-immodules-$maj_ver.0 ]; then
+        IMFILES=$(ls $D${libdir}/gtk-$maj_ver.0/*/immodules/*.so)
+        DYNAMIC_LOADER=$D$(readelf -a $D${bindir}/gtk-query-immodules-$maj_ver.0 |\
+            grep "Requesting program interpreter"|sed -e 's/^.*\[.*: \(.*\)\]/\1/')
+        LIBRARY_PATH=$D${base_libdir}:$D${libdir}
+        ${@qemu_target_binary(d)} $DYNAMIC_LOADER --library-path $LIBRARY_PATH \
+            $D${bindir}/gtk-query-immodules-$maj_ver.0 $IMFILES > $D/etc/gtk-$maj_ver.0/gtk.immodules 2>/dev/null && \
+            sed -i -e "s:$D::" $D/etc/gtk-$maj_ver.0/gtk.immodules
+
+        [ $? -ne 0 ] && exit 1
+    fi
+done
+
+exit 0
 fi
 if [ ! -z `which gtk-query-immodules-2.0` ]; then
     gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
-- 
1.7.9.5



