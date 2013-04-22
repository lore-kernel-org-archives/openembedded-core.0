Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UUBxy-0005eS-BR
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 10:19:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2013 00:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,525,1363158000"; d="scan'208";a="322150575"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2013 01:01:32 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2013 11:01:24 +0300
Message-Id: <7acadd6ee79215d01ec746ac48f98fab71a89b33.1366615922.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366615922.git.laurentiu.palcu@intel.com>
References: <cover.1366615922.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1366615922.git.laurentiu.palcu@intel.com>
References: <cover.1366615922.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/4] pixbufcache.bbclass: do not exit 1 after installing intercept hook
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
X-List-Received-Date: Mon, 22 Apr 2013 08:19:23 -0000

This will allow to register, in a single postinstall, multiple hooks.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/pixbufcache.bbclass |   29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 3c34557..4e0f577 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -8,27 +8,22 @@ inherit qemu
 
 PIXBUF_PACKAGES ??= "${PN}"
 
-#
-# On host, the postinstall MUST return 1 because we do not know if the intercept
-# hook will succeed. If it does succeed, than the packages will be marked as
-# installed.
-#
 pixbufcache_common() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} libdir=${libdir} \
 		bindir=${bindir} base_libdir=${base_libdir}
-	exit 1
-fi
-
-# Update the pixbuf loaders in case they haven't been registered yet
-GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
-
-if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
-    for icondir in /usr/share/icons/*; do
-        if [ -d ${icondir} ]; then
-            gtk-update-icon-cache -t -q ${icondir}
-        fi
-    done
+else
+
+	# Update the pixbuf loaders in case they haven't been registered yet
+	GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
+
+	if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
+		for icondir in /usr/share/icons/*; do
+			if [ -d ${icondir} ]; then
+				gtk-update-icon-cache -t -q ${icondir}
+			fi
+		done
+	fi
 fi
 }
 
-- 
1.7.9.5



