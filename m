Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B120A7482C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 09:36:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 02:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,436,1520924400"; d="scan'208";a="42455587"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 24 May 2018 02:36:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 12:36:48 +0300
Message-Id: <20180524093649.6911-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180524093649.6911-1-alexander.kanavin@linux.intel.com>
References: <20180524093649.6911-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/6] qemuwrapper-cross: set LD_LIBRARY_PATH directly
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
X-List-Received-Date: Thu, 24 May 2018 09:36:55 -0000

Previously the library paths were passed down from recipes, and if
said recipes were allarch, and library paths were something else
than /lib and /usr/lib (multilib, x32, etc.), things broke down.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb    | 2 +-
 scripts/postinst-intercepts/update_font_cache          | 3 +--
 scripts/postinst-intercepts/update_gio_module_cache    | 3 +--
 scripts/postinst-intercepts/update_gtk_immodules_cache | 6 ++----
 scripts/postinst-intercepts/update_pixbuf_cache        | 3 +--
 5 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index d90ce36ba90..6102db33588 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -15,7 +15,7 @@ do_install () {
 
 	echo "#!/bin/sh" > ${D}${bindir_crossscripts}/qemuwrapper
 	qemu_binary=${@qemu_target_binary(d)}
-	qemu_options='${QEMU_OPTIONS}'
+	qemu_options='${QEMU_OPTIONS} -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir}'
 	echo "set -x" >> ${D}${bindir_crossscripts}/qemuwrapper
 	echo "$qemu_binary $qemu_options \"\$@\"" >> ${D}${bindir_crossscripts}/qemuwrapper
 
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index bf65e19a41d..e797c65f2fc 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -2,6 +2,5 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} \
-					-E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
+PSEUDO_UNLOAD=1 qemuwrapper -L $D -E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
 chown -R root:root $D${fontconfigcachedir}
diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
index fc3f9d0d6ce..7ad9c5a7d09 100644
--- a/scripts/postinst-intercepts/update_gio_module_cache
+++ b/scripts/postinst-intercepts/update_gio_module_cache
@@ -2,8 +2,7 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
-	$D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
+PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
 
 [ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
 	chown root:root $D${libdir}/gio/modules/giomodule.cache
diff --git a/scripts/postinst-intercepts/update_gtk_immodules_cache b/scripts/postinst-intercepts/update_gtk_immodules_cache
index e2b9ff74382..8a69a26bb17 100644
--- a/scripts/postinst-intercepts/update_gtk_immodules_cache
+++ b/scripts/postinst-intercepts/update_gtk_immodules_cache
@@ -3,15 +3,13 @@
 set -e
 
 if [ -x $D${bindir}/gtk-query-immodules-2.0 ]; then
-    PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
-        $D/${bindir}/gtk-query-immodules-2.0 \
+    PSEUDO_UNLOAD=1 qemuwrapper -L $D $D/${bindir}/gtk-query-immodules-2.0 \
         > $D${libdir}/gtk-2.0/2.10.0/immodules.cache &&
         sed -i -e "s:$D::" $D${libdir}/gtk-2.0/2.10.0/immodules.cache
         chown root:root $D${libdir}/gtk-2.0/2.10.0/immodules.cache
 fi
 if [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
-    PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
-        $D/${bindir}/gtk-query-immodules-3.0 \
+    PSEUDO_UNLOAD=1 qemuwrapper -L $D $D/${bindir}/gtk-query-immodules-3.0 \
         > $D${libdir}/gtk-3.0/3.0.0/immodules.cache &&
         sed -i -e "s:$D::" $D${libdir}/gtk-3.0/3.0.0/immodules.cache
         chown root:root $D${libdir}/gtk-3.0/3.0.0/immodules.cache
diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
index 5d44075fb4c..efb56facc93 100644
--- a/scripts/postinst-intercepts/update_pixbuf_cache
+++ b/scripts/postinst-intercepts/update_pixbuf_cache
@@ -5,7 +5,6 @@ set -e
 export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
 export GDK_PIXBUF_FATAL_LOADER=1
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
-    $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
+PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
     >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
     sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
-- 
2.17.0


