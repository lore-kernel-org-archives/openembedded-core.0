Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEIyz-00015d-NC
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 14:02:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2012 04:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194489250"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 04:49:39 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 14:49:22 +0300
Message-Id: <e12955c6d49bceb6c271574551b5feb76c51fa3b.1348052899.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
Subject: [RFC 4/7] gtk-icon-cache: run the icon generation at rootfs time
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
X-List-Received-Date: Wed, 19 Sep 2012 12:02:22 -0000

This change will allow for the icon cache generation at rootfs time and
only once, at the end. So, even though there will be many packages
depending on gtk+, the icon cache generation will be done once.
Hopefully, this will lower the target's first boot time significantly
by using the power of the host machine to generate the cache.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass |   21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 01fb2f3..f65b11c 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,12 +1,24 @@
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
+#!/bin/bash -x
+
+# Update the native pixbuf loader's cache
+gdk-pixbuf-query-loaders --update-cache
+
+for icondir in $D/usr/share/icons/* ; do
+    if [ -d $icondir ] ; then
+        gtk-update-icon-cache -fqt  $icondir
+    fi
+done
+EOF
+    fi
+    exit 0
 fi
 
 # Update the pixbuf loaders in case they haven't been registered yet
@@ -17,6 +29,7 @@ for icondir in /usr/share/icons/* ; do
         gtk-update-icon-cache -fqt  $icondir
     fi
 done
+
 }
 
 gtk_icon_cache_postrm() {
-- 
1.7.9.5



