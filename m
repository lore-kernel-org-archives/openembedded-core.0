Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id EC27578BBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 13:37:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2018 06:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,502,1520924400"; d="scan'208";a="46241309"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga007.fm.intel.com with ESMTP; 11 Jun 2018 06:38:00 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 16:38:20 +0300
Message-Id: <20180611133822.32004-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180611133822.32004-1-alexander.kanavin@linux.intel.com>
References: <20180611133822.32004-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/6] qemuwrapper-cross: enable multilib and nativesdk variants of the script
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
X-List-Received-Date: Mon, 11 Jun 2018 13:38:00 -0000

Previously only one global variant of the script was created,
which caused numerous issues:

1) multilib was not properly supported due to multilib variants each
needing their own version of the qemu binary and library paths to be set
2) nativesdk was not properly supported for the same reason

This patch also moves setting LD_LIBRARY_PATH directly into the
recipe, as passing it down from other recipes did not work when
said recipes were allarch, and adjusts calls to qemuwrapper from
postinst-intercepts, so that its correct variant is selected.

Also, the various qemu fallbacks in qemuwrapper script are all removed,
as they are no longer necessary.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/fontcache.bbclass                |  2 +-
 meta/classes/pixbufcache.bbclass              |  2 +-
 .../qemu/qemuwrapper-cross_1.0.bb             | 37 +++++--------------
 scripts/postinst-intercepts/update_font_cache |  3 +-
 .../update_gio_module_cache                   |  3 +-
 .../update_gtk_immodules_cache                |  6 +--
 .../postinst-intercepts/update_pixbuf_cache   |  3 +-
 7 files changed, 17 insertions(+), 39 deletions(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index e76331131ee..f71a754a4dd 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -17,7 +17,7 @@ FONTCONFIG_CACHE_PARAMS ?= "-v"
 FONTCONFIG_CACHE_ENV ?= "FC_DEBUG=1"
 fontcache_common() {
 if [ -n "$D" ] ; then
-	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} \
+	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} \
 		'bindir="${bindir}"' \
 		'libdir="${libdir}"' \
 		'base_libdir="${base_libdir}"' \
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index b3e507f61b6..3378ff2c806 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -12,7 +12,7 @@ PACKAGE_WRITE_DEPS += "qemu-native gdk-pixbuf-native"
 
 pixbufcache_common() {
 if [ "x$D" != "x" ]; then
-	$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} mlprefix=${MLPREFIX} libdir=${libdir} \
+	$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} libdir=${libdir} \
 		bindir=${bindir} base_libdir=${base_libdir}
 else
 
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index c983fbae667..4b1b46d0bb3 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -13,38 +13,21 @@ do_populate_sysroot[depends] = ""
 do_install () {
 	install -d ${D}${bindir_crossscripts}/
 
-	echo "#!/bin/sh" > ${D}${bindir_crossscripts}/qemuwrapper
 	qemu_binary=${@qemu_target_binary(d)}
-	qemu_options='${QEMU_OPTIONS}'
-	echo "$qemu_binary $qemu_options \"\$@\"" >> ${D}${bindir_crossscripts}/qemuwrapper
-	fallback_qemu_bin=
-	case $qemu_binary in
-		"qemu-i386")
-			fallback_qemu_bin=qemu-x86_64
-			;;
-		"qemu-x86_64")
-			fallback_qemu_bin=qemu-i386
-			;;
-		*)
-			;;
-	esac
-
-	if [ -n "$fallback_qemu_bin" ]; then
-
-		cat >> ${D}${bindir_crossscripts}/qemuwrapper << EOF
-rc=\$?
-if [ \$rc = 255 ]; then
-	$fallback_qemu_bin "\$@"
-	rc=\$?
-fi
-exit \$rc
-EOF
+	qemu_options='${QEMU_OPTIONS} -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir}'
+
+	cat >> ${D}${bindir_crossscripts}/${MLPREFIX}qemuwrapper << EOF
+#!/bin/sh
+set -x
 
-	fi
+$qemu_binary $qemu_options "\$@"
+EOF
 
-	chmod +x ${D}${bindir_crossscripts}/qemuwrapper
+	chmod +x ${D}${bindir_crossscripts}/${MLPREFIX}qemuwrapper
 }
 
 SYSROOT_DIRS += "${bindir_crossscripts}"
 
 INHIBIT_DEFAULT_DEPS = "1"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index bf65e19a41d..20e9048adfc 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -2,6 +2,5 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} \
-					-E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
+PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
 chown -R root:root $D${fontconfigcachedir}
diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
index fc3f9d0d6ce..d1f0140947e 100644
--- a/scripts/postinst-intercepts/update_gio_module_cache
+++ b/scripts/postinst-intercepts/update_gio_module_cache
@@ -2,8 +2,7 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
-	$D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
+PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
 
 [ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
 	chown root:root $D${libdir}/gio/modules/giomodule.cache
diff --git a/scripts/postinst-intercepts/update_gtk_immodules_cache b/scripts/postinst-intercepts/update_gtk_immodules_cache
index e2b9ff74382..d85d3622c21 100644
--- a/scripts/postinst-intercepts/update_gtk_immodules_cache
+++ b/scripts/postinst-intercepts/update_gtk_immodules_cache
@@ -3,15 +3,13 @@
 set -e
 
 if [ -x $D${bindir}/gtk-query-immodules-2.0 ]; then
-    PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
-        $D/${bindir}/gtk-query-immodules-2.0 \
+    PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D/${bindir}/gtk-query-immodules-2.0 \
         > $D${libdir}/gtk-2.0/2.10.0/immodules.cache &&
         sed -i -e "s:$D::" $D${libdir}/gtk-2.0/2.10.0/immodules.cache
         chown root:root $D${libdir}/gtk-2.0/2.10.0/immodules.cache
 fi
 if [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
-    PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
-        $D/${bindir}/gtk-query-immodules-3.0 \
+    PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D/${bindir}/gtk-query-immodules-3.0 \
         > $D${libdir}/gtk-3.0/3.0.0/immodules.cache &&
         sed -i -e "s:$D::" $D${libdir}/gtk-3.0/3.0.0/immodules.cache
         chown root:root $D${libdir}/gtk-3.0/3.0.0/immodules.cache
diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
index 5d44075fb4c..ebea07c356a 100644
--- a/scripts/postinst-intercepts/update_pixbuf_cache
+++ b/scripts/postinst-intercepts/update_pixbuf_cache
@@ -5,7 +5,6 @@ set -e
 export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
 export GDK_PIXBUF_FATAL_LOADER=1
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
-    $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
+PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
     >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
     sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
-- 
2.17.0


