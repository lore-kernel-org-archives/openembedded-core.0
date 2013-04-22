Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UUBxx-0005eK-2q
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 10:19:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2013 00:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,525,1363158000"; d="scan'208";a="322150561"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2013 01:01:31 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2013 11:01:23 +0300
Message-Id: <81931d03c2e5b9e33ea62c6bb5581f941904fd54.1366615922.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366615922.git.laurentiu.palcu@intel.com>
References: <cover.1366615922.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1366615922.git.laurentiu.palcu@intel.com>
References: <cover.1366615922.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/4] gtk-icon-cache.bbclass: do not exit 1 after installing intercept hook
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
X-List-Received-Date: Mon, 22 Apr 2013 08:19:16 -0000

This will allow to register, in a single postinstall, multiple hooks.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass |   47 +++++++++++++++--------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index b53c0bc..7f24d49 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -2,41 +2,34 @@ FILES_${PN} += "${datadir}/icons/hicolor"
 
 DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk-update-icon-cache-native"
 
-#
-# On host, the postinstall MUST return 1 because we do not know if the intercept
-# hook will succeed. If it does succeed, than the packages will be marked as
-# installed.
-#
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
-    $INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} libdir=${libdir} \
-        base_libdir=${base_libdir}
-    exit 1
+	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} libdir=${libdir} \
+		base_libdir=${base_libdir}
+else
+
+	# Update the pixbuf loaders in case they haven't been registered yet
+	GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
+
+	for icondir in /usr/share/icons/* ; do
+		if [ -d $icondir ] ; then
+			gtk-update-icon-cache -fqt  $icondir
+		fi
+	done
 fi
-
-# Update the pixbuf loaders in case they haven't been registered yet
-GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
-
-for icondir in /usr/share/icons/* ; do
-    if [ -d $icondir ] ; then
-        gtk-update-icon-cache -fqt  $icondir
-    fi
-done
 }
 
 gtk_icon_cache_postrm() {
 if [ "x$D" != "x" ]; then
-    $INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} libdir=${libdir} \
-        base_libdir=${base_libdir}
-
-    exit 1
+	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} libdir=${libdir} \
+		base_libdir=${base_libdir}
+else
+	for icondir in /usr/share/icons/* ; do
+		if [ -d $icondir ] ; then
+			gtk-update-icon-cache -qt  $icondir
+		fi
+	done
 fi
-
-for icondir in /usr/share/icons/* ; do
-    if [ -d $icondir ] ; then
-        gtk-update-icon-cache -qt  $icondir
-    fi
-done
 }
 
 python populate_packages_append () {
-- 
1.7.9.5



