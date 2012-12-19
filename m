Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TlPJb-0002Iw-Kb
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 20:28:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2012 11:13:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,318,1355126400"; d="scan'208";a="267213834"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2012 11:13:40 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2012 21:13:38 +0200
Message-Id: <1355944418-30809-1-git-send-email-laurentiu.palcu@intel.com>
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
X-List-Received-Date: Wed, 19 Dec 2012 19:28:58 -0000

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



