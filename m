Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UanmX-0004g9-TF
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 15:55:03 +0200
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id B7BBA952B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 14:36:41 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 14:36:39 +0100
Message-Id: <1368192999-30014-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] librsvg: update gdk-pixbuf loader cache when staging native package
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
X-List-Received-Date: Fri, 10 May 2013 13:55:18 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

librsvg installs an svg loader for gdk-pixbuf; in order for the native version
of the loader to be usable by gdk-pixbuf-native we have to update the loader
cache.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index ff17cf7..dcacce4 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -55,3 +55,14 @@ FILES_librsvg-gtk-dbg += "${libdir}/gdk-pixbuf-2.0/.debug \
 
 PIXBUF_PACKAGES = "librsvg-gtk"
 PARALLEL_MAKE = ""
+
+# ensure that the native gdk-pixbuf loaders cache is updated when we stage
+# our svg loader
+SSTATEPOSTINSTFUNCS_class_native += "librsvg_sstate_postinst"
+
+librsvg_sstate_postinst() {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+	then
+		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache gdk-pixbuf-query-loaders --update-cache
+	fi
+}
-- 
1.7.10.4



