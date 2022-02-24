X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH] gtk-icon-cache: Allow using gtk4
Date: Thu, 24 Feb 2022 08:23:43 +0100
Message-Id: <20220224072343.1262534-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

meta-openembedded has gtk4 which has its own version of
gtk-update-icon-cache. Allow programs that want to use gtk4
use the proper version of the gtk-update-icon-cache utility
and the proper build and runtime dependencies.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/gtk-icon-cache.bbclass | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 0248ba285e..ec97467e15 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,17 +1,22 @@
 FILES:${PN} += "${datadir}/icons/hicolor"
 
-#gtk+3 reqiure GTK3DISTROFEATURES, DEPENDS on it make all the
+GTKIC_VERSION ??= '3'
+
+GTKPN = "${@ 'gtk4' if d.getVar('GTKIC_VERSION') == '4' else 'gtk+3' }"
+GTKIC_CMD = "${@ 'gtk-update-icon-cache-3.0.0' if d.getVar('GTKIC_VERSION') == '4' else 'gtk4-update-icon-cache' }"
+
+#gtk+3/gtk4 require GTK3DISTROFEATURES, DEPENDS on it make all the
 #recipes inherit this class require GTK3DISTROFEATURES
 inherit features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} \
             ${@['gdk-pixbuf', '']['${BPN}' == 'gdk-pixbuf']} \
-            ${@['gtk+3', '']['${BPN}' == 'gtk+3']} \
-            gtk+3-native \
+            ${@['${GTKPN}', '']['${BPN}' == '${GTKPN}']} \
+            ${GTKPN}-native \
 "
 
-PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
+PACKAGE_WRITE_DEPS += "${GTKPN}-native gdk-pixbuf-native"
 
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
@@ -25,7 +30,7 @@ else
 
 	for icondir in /usr/share/icons/* ; do
 		if [ -d $icondir ] ; then
-			gtk-update-icon-cache -fqt  $icondir
+			${GTKIC_CMD} -fqt  $icondir
 		fi
 	done
 fi
@@ -39,7 +44,7 @@ if [ "x$D" != "x" ]; then
 else
 	for icondir in /usr/share/icons/* ; do
 		if [ -d $icondir ] ; then
-			gtk-update-icon-cache -qt  $icondir
+			${GTKIC_CMD} -qt  $icondir
 		fi
 	done
 fi
@@ -58,13 +63,13 @@ python populate_packages:append () {
         rdepends = ' ' + d.getVar('MLPREFIX', False) + "hicolor-icon-theme"
         d.appendVar('RDEPENDS:%s' % pkg, rdepends)
 
-        #gtk_icon_cache_postinst depend on gdk-pixbuf and gtk+3
+        #gtk_icon_cache_postinst depend on gdk-pixbuf and gtk+3/gtk4
         bb.note("adding gdk-pixbuf dependency to %s" % pkg)
         rdepends = ' ' + d.getVar('MLPREFIX', False) + "gdk-pixbuf"
         d.appendVar('RDEPENDS:%s' % pkg, rdepends)
 
-        bb.note("adding gtk+3 dependency to %s" % pkg)
-        rdepends = ' ' + d.getVar('MLPREFIX', False) + "gtk+3"
+        bb.note("adding %s dependency to %s" % (d.getVar('GTKPN'), pkg))
+        rdepends = ' ' + d.getVar('MLPREFIX', False) + d.getVar('GTKPN')
         d.appendVar('RDEPENDS:%s' % pkg, rdepends)
 
         bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
-- 
2.35.1

