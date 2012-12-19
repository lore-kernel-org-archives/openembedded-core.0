Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TlczB-000326-5p
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 11:04:20 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Dec 2012 01:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,322,1355126400"; d="scan'208";a="183018628"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Dec 2012 08:04:23 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2012 18:03:52 +0200
Message-Id: <1355933032-25392-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] pango: have postinstalls run at do_rootfs time
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
X-List-Received-Date: Thu, 20 Dec 2012 10:04:22 -0000

Since pango-native is built anyway and all the modules are in the native
sysroot, create the cache file by scanning those files instead of the
target files. The latter will fail because the shared objects wouldn't
be from the same ELF class.

[YOCTO #3600]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/pango/pango.inc |   26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 839c00d..81c2a7e 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.0+"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils pango-native"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
@@ -44,13 +44,31 @@ LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.6.0"
 
 postinst_prologue() {
+if ! [ -e $D${sysconfdir}/pango ] ; then
+	mkdir -p $D${sysconfdir}/pango
+fi
+
 if [ "x$D" != "x" ]; then
-  exit 1
+pango-querymodules $(ls -d -1 $D${libdir}/pango/${LIBV}/modules/*.so|\
+    sed -e "s:$D:$NATIVE_ROOT:g") >\
+    $D${sysconfdir}/pango/${MLPREFIX}pango.modules \
+    2>$D${sysconfdir}/pango/${MLPREFIX}pango.err
+
+# pango-querymodules always returns 0, so we need to check if pango.err has
+# anything in it
+if [ -s $D${sysconfdir}/pango/${MLPREFIX}pango.err ]; then
+    rm $D${sysconfdir}/pango/${MLPREFIX}pango.err
+    exit 1
 fi
 
-if ! [ -e $D${sysconfdir}/pango ] ; then
-	mkdir -p $D${sysconfdir}/pango
+sed -i -e "s:$NATIVE_ROOT::g" $D${sysconfdir}/pango/${MLPREFIX}pango.modules
+
+# remove the empty pango.err
+rm $D${sysconfdir}/pango/${MLPREFIX}pango.err
+
+exit 0
 fi
+
 }
 
 do_install_append () {
-- 
1.7.9.5



