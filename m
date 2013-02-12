Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5IjH-0000zO-Pz
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:29:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284742042"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:12:53 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:39 +0200
Message-Id: <e86c3c2ca251e30ad8508bfdfef379a2f5e8c253.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
Subject: [PATCH 04/11] gtk-icon-cache.bbclass: use postinst_intercept script
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
X-List-Received-Date: Tue, 12 Feb 2013 16:29:53 -0000

Since the hook has been made a standalone script, use postinst_intercept
script in order to "link" the package to the hook.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass |   39 ++++++++---------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index cf33efd..2ca99ac 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -2,23 +2,15 @@ FILES_${PN} += "${datadir}/icons/hicolor"
 
 DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+-native"
 
+#
+# On host, the postinstall MUST return 1 because we do not know if the intercept
+# hook will succeed. If it does succeed, than the packages will be marked as
+# installed.
+#
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
-    if [ ! -f $INTERCEPT_DIR/update_icon_cache ]; then
-        cat << "EOF" > $INTERCEPT_DIR/update_icon_cache
-#!/bin/sh
-
-# update native pixbuf loaders
-gdk-pixbuf-query-loaders --update-cache
-
-for icondir in $D/usr/share/icons/*/ ; do
-    if [ -d $icondir ] ; then
-        gtk-update-icon-cache -fqt  $icondir
-    fi
-done
-EOF
-    fi
-    exit 0
+    $INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG}
+    exit 1
 fi
 
 # Update the pixbuf loaders in case they haven't been registered yet
@@ -33,21 +25,8 @@ done
 
 gtk_icon_cache_postrm() {
 if [ "x$D" != "x" ]; then
-    if [ ! -f $INTERCEPT_DIR/update_icon_cache ]; then
-        cat << "EOF" > $INTERCEPT_DIR/update_icon_cache
-#!/bin/sh
-
-# update native pixbuf loaders
-gdk-pixbuf-query-loaders --update-cache
-
-for icondir in $D/usr/share/icons/*/ ; do
-    if [ -d $icondir ] ; then
-        gtk-update-icon-cache -fqt  $icondir
-    fi
-done
-EOF
-    fi
-    exit 0
+    $INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG}
+    exit 1
 fi
 
 for icondir in /usr/share/icons/* ; do
-- 
1.7.9.5



