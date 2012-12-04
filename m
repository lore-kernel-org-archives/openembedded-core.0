Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TftFz-0000Sm-1P
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 15:13:55 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2012 05:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="226378577"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 04 Dec 2012 05:59:31 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Tue,  4 Dec 2012 15:59:10 +0200
Message-Id: <87e5e6b5b89c4dc8c81b388bdce126076b4b11cc.1354626535.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/5] gtk-icon-cache: run the icon generation at rootfs time
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
X-List-Received-Date: Tue, 04 Dec 2012 14:13:55 -0000

This change will allow for the icon cache generation at rootfs time and
only once, at the end. So, even though there will be many packages
depending on gtk+, the icon cache generation will be done once.
Hopefully, this will lower the target's first boot time significantly
by using the power of the host machine to generate the cache.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass |   18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 01fb2f3..f87a30f 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,12 +1,22 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
-DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']}"
+DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+-native"
 
-# This could run on the host as icon cache files are architecture independent,
-# but there is no gtk-update-icon-cache built natively.
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
-        exit 1
+    if [ ! -f $INTERCEPT_DIR/update_icon_cache ]; then
+        cat << "EOF" > $INTERCEPT_DIR/update_icon_cache
+#!/bin/sh
+
+# update native pixbuf loaders
+gdk-pixbuf-query-loaders --update-cache
+
+for icondir in $D/usr/share/icons/*/ ; do
+	gtk-update-icon-cache -fqt  $icondir
+done
+EOF
+    fi
+    exit 0
 fi
 
 # Update the pixbuf loaders in case they haven't been registered yet
-- 
1.7.9.5



