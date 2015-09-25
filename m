Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id CC39877003
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 22:32:22 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so36494844wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 15:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ECO7GtL7ErtTU4jG+ZSd8HObEV3HUF13q1Zjbn24JVo=;
	b=VBP/O8g5uDugH+bppw9StR9AAsO/SrcxAzvRBVpyx5jkRwUSdO17nD90H7+11HF5Im
	K8cCcRKRtfZ4KNTCkBledte/RGx1OoNcv29AW3SCB0nECaOkh8GH8fT1IZrbZzD3AvrH
	l2Uzj0q3JfJY4RD9Hb2pFXIggUlxGyj/N5ChCU4LoObHta7K0gLJqCwCpWlsx/cgjIyv
	jl5ay+6FC+0p75iKwufqZcDfBx4fSBudjE8WRDyZhftwNndQrmdWpyTstaWGKZtymh/s
	0Peu8Wv0458dRhV59tyDzD/7K+UkAhqbSPEE3wyrs0391t1tEZ6Q2qFGLjf6sUokr0jo
	NK1Q==
X-Gm-Message-State: ALoCoQmWRhIk6XyCJ3WY58B5/GlmqxxHm9qWfC/NLyXELk4T3e3f/sg4zsnaa1SYvWoqMgAYbXOv
X-Received: by 10.194.5.135 with SMTP id s7mr9934498wjs.153.1443220342196;
	Fri, 25 Sep 2015 15:32:22 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	ki7sm5408816wjc.28.2015.09.25.15.32.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 15:32:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 23:25:12 +0100
Message-Id: <1443219913-18502-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443219913-18502-1-git-send-email-ross.burton@intel.com>
References: <1443219913-18502-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] gdk-pixbuf: move gdk-pixbuf-query-loaders to $libdir for multilib safety
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Sep 2015 22:32:23 -0000

If for example gdk-pixbuf and lib32-gdk-pixbuf are in an image then only one
${bindir}/gdk-pixbuf-query-loaders will be installed, so only one variant will
actually be usable.

Solve this by moving gdk-pixbuf-query-loaders into ${libdir} as it's intimately
tied to the library and rarely directly invoked by the user, and update the
callers to use the right path.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass                | 14 +++++++++-----
 meta/classes/pixbufcache.bbclass                   |  4 ++--
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb | 11 +++++++++--
 scripts/postinst-intercepts/update_icon_cache      |  3 ++-
 scripts/postinst-intercepts/update_pixbuf_cache    |  4 +---
 5 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 12358e3..b005ab2 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -4,12 +4,14 @@ DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk
 
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
-	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} mlprefix=${MLPREFIX} libdir=${libdir} \
-		base_libdir=${base_libdir}
+	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
+		mlprefix=${MLPREFIX} \
+		libdir=${libdir} \
+		STAGING_LIBDIR_NATIVE=${STAGING_LIBDIR_NATIVE}
 else
 
 	# Update the pixbuf loaders in case they haven't been registered yet
-	GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
+	GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders ${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
 
 	for icondir in /usr/share/icons/* ; do
 		if [ -d $icondir ] ; then
@@ -21,8 +23,10 @@ fi
 
 gtk_icon_cache_postrm() {
 if [ "x$D" != "x" ]; then
-	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} mlprefix=${MLPREFIX} libdir=${libdir} \
-		base_libdir=${base_libdir}
+	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
+		mlprefix=${MLPREFIX} \
+		libdir=${libdir} \
+		STAGING_LIBDIR_NATIVE=${STAGING_LIBDIR_NATIVE}
 else
 	for icondir in /usr/share/icons/* ; do
 		if [ -d $icondir ] ; then
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 349967d..18fd9fa 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -15,7 +15,7 @@ if [ "x$D" != "x" ]; then
 else
 
 	# Update the pixbuf loaders in case they haven't been registered yet
-	GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
+	GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders ${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
 
 	if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
 		for icondir in /usr/share/icons/*; do
@@ -46,7 +46,7 @@ python populate_packages_append() {
 }
 
 gdkpixbuf_complete() {
-	GDK_PIXBUF_FATAL_LOADER=1 ${STAGING_BINDIR_NATIVE}/gdk-pixbuf-query-loaders --update-cache || exit 1
+	GDK_PIXBUF_FATAL_LOADER=1 ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache || exit 1
 }
 
 #
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
index 1985ac4..12f9805 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
@@ -49,7 +49,7 @@ PACKAGES =+ "${PN}-xlib"
 FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
 ALLOW_EMPTY_${PN}-xlib = "1"
 
-FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
+FILES_${PN} = "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
 	${libdir}/lib*.so.*"
 
 FILES_${PN}-dev += " \
@@ -61,6 +61,7 @@ FILES_${PN}-dev += " \
 
 FILES_${PN}-dbg += " \
 	${libdir}/.debug/* \
+	${libdir}/gdk-pixbuf-2.0/.debug/* \
 	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
 "
 
@@ -80,6 +81,12 @@ python populate_packages_prepend () {
     d.appendVar("RDEPENDS_gdk-pixbuf-ptest", " " + packages)
 }
 
+do_install_append() {
+	# Move gdk-pixbuf-query-loaders into libdir so it is always available
+	# in multilib builds.
+	mv ${D}/${bindir}/gdk-pixbuf-query-loaders ${D}/${libdir}/gdk-pixbuf-2.0/
+}
+
 do_install_append_class-native() {
 	find ${D}${libdir} -name "libpixbufloader-*.la" -exec rm \{\} \;
 
@@ -89,7 +96,7 @@ do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-pixdata \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 
-	create_wrapper ${D}/${bindir}/gdk-pixbuf-query-loaders \
+	create_wrapper ${D}/${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
 		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
 }
diff --git a/scripts/postinst-intercepts/update_icon_cache b/scripts/postinst-intercepts/update_icon_cache
index 8e17a6a..c02273d 100644
--- a/scripts/postinst-intercepts/update_icon_cache
+++ b/scripts/postinst-intercepts/update_icon_cache
@@ -1,8 +1,9 @@
 #!/bin/sh
 
 set -e
+
 # update native pixbuf loaders
-gdk-pixbuf-query-loaders --update-cache
+${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
 
 for icondir in $D/usr/share/icons/*/ ; do
     if [ -d $icondir ] ; then
diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
index 95bf4f9..a8b4001 100644
--- a/scripts/postinst-intercepts/update_pixbuf_cache
+++ b/scripts/postinst-intercepts/update_pixbuf_cache
@@ -4,8 +4,6 @@ export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
 export GDK_PIXBUF_FATAL_LOADER=1
 
 PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
-    $D${bindir}/gdk-pixbuf-query-loaders \
+    $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
     >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
     sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
-
-
-- 
2.1.4


