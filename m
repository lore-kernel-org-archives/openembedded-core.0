Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tka6W-00087F-HF
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 13:47:33 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Dec 2012 04:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="235056386"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 17 Dec 2012 04:32:47 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 14:32:43 +0200
Message-Id: <1355747563-17504-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355747563-17504-1-git-send-email-laurentiu.palcu@intel.com>
References: <1355747563-17504-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] gtk+-native: add gtk-update-icon-cache wrapper
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
X-List-Received-Date: Mon, 17 Dec 2012 12:47:33 -0000

This is needed in order to point where the pixbuf loaders.cache is
located and avoid warnings like the one below that appear when the
sstate is fetched from a remote machine:

(gtk-update-icon-cache:8913): GdkPixbuf-WARNING **: Cannot open pixbuf
loader module file '/REMOTE/MACHINE/PATH/loaders.cache': No such file or directory

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+_2.24.13.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
index bc88284..3b3d3c0 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
@@ -42,6 +42,11 @@ BBCLASSEXTEND = "native"
 RRECOMMENDS_${PN}_class-native = ""
 DEPENDS_class-native = "glib-2.0-native atk-native pango-native cairo-native gdk-pixbuf-native"
 
+do_install_append_class-native () {
+	create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
+		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
+}
+
 python populate_packages_prepend () {
     prologue = d.getVar("postinst_prologue", True)
 
-- 
1.7.9.5



