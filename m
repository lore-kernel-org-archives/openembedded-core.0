Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SxOWy-00071a-9B
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 22:31:32 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2012 13:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193014133"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2012 13:19:51 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2012 23:19:40 +0300
Message-Id: <8f7455f577f075409a2f2fb423669dfe6a50de73.1344022584.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344022584.git.laurentiu.palcu@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1344022584.git.laurentiu.palcu@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/5] gdk-pixbuf: allow postinst scriplet to be called at do_rootfs time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 20:31:32 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index 8e13115..60d6161 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -56,12 +56,14 @@ FILES_${PN}-dbg += " \
 
 postinst_pixbufloader () {
 if [ "x$D" != "x" ]; then
-    exit 1
+    gtk_update_icon_cache_path=$NATIVE_DIR/${bindir_native}
+else
+    gtk_update_icon_cache_path=${bindir}
 fi
 
 GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixbuf-query-loaders --update-cache
 
-test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q ${datadir}/icons/hicolor
+test -x $gtk_update_icon_cache_path/gtk-update-icon-cache && gtk-update-icon-cache  -q $D/${datadir}/icons/hicolor
 }
 
 PACKAGES_DYNAMIC += "gdk-pixbuf-loader-*"
-- 
1.7.9.5



