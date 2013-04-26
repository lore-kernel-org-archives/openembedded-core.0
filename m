Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UVdv4-0005Bq-I9
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 10:22:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Apr 2013 01:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,556,1363158000"; d="scan'208";a="293336412"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 26 Apr 2013 01:04:10 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2013 11:04:02 +0300
Message-Id: <270631380596e59a5a521d7594c97fe7eab3a5af.1366962026.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366962026.git.laurentiu.palcu@intel.com>
References: <cover.1366962026.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1366962026.git.laurentiu.palcu@intel.com>
References: <cover.1366962026.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 5/5] Pass the mlprefix to postinst_intercept script
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
X-List-Received-Date: Fri, 26 Apr 2013 08:22:35 -0000

This is needed in order to have separate multilib intercept hooks.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/fontcache.bbclass      |    2 +-
 meta/classes/gtk-icon-cache.bbclass |    4 ++--
 meta/classes/pixbufcache.bbclass    |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 9136c5a..325bcae 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -10,7 +10,7 @@ FONT_PACKAGES ??= "${PN}"
 
 fontcache_common() {
 if [ "x$D" != "x" ] ; then
-	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} bindir=${bindir} \
+	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} bindir=${bindir} \
 		libdir=${libdir} base_libdir=${base_libdir}
 else
 	fc-cache
diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 7f24d49..789fa38 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -4,7 +4,7 @@ DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk
 
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
-	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} libdir=${libdir} \
+	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} mlprefix=${MLPREFIX} libdir=${libdir} \
 		base_libdir=${base_libdir}
 else
 
@@ -21,7 +21,7 @@ fi
 
 gtk_icon_cache_postrm() {
 if [ "x$D" != "x" ]; then
-	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} libdir=${libdir} \
+	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} mlprefix=${MLPREFIX} libdir=${libdir} \
 		base_libdir=${base_libdir}
 else
 	for icondir in /usr/share/icons/* ; do
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 4e0f577..37bf812 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -10,7 +10,7 @@ PIXBUF_PACKAGES ??= "${PN}"
 
 pixbufcache_common() {
 if [ "x$D" != "x" ]; then
-	$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} libdir=${libdir} \
+	$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} mlprefix=${MLPREFIX} libdir=${libdir} \
 		bindir=${bindir} base_libdir=${base_libdir}
 else
 
-- 
1.7.9.5



