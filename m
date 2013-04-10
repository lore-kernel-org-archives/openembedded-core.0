Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UPtQf-0001le-8J
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 13:43:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2013 04:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,446,1363158000"; d="scan'208";a="225480585"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Apr 2013 04:25:41 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 14:25:39 +0300
Message-Id: <1365593139-23644-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1365522831-17183-1-git-send-email-laurentiu.palcu@intel.com>
References: <1365522831-17183-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH v2] postinst-intercepts, qemu.bbclass: fix segfaults in postinstalls
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
X-List-Received-Date: Wed, 10 Apr 2013 11:43:21 -0000

Postinstalls that use qemu are throwing a segmentation fault when
building for qemux86-64 on a 64bit host (it might also happen for
qemux86 if building on a 32bit host but I didn't test). It looks like
qemu looks for ld.so.cache which is not found because it is generated
after rootfs_(rpm|ipk|deb)_do_rootfs is called and then it tries to load
libraries from the default paths (which are the host's). In order to
avoid this, pass the LD_LIBRARY_PATH explicitly to the target's dynamic
loader.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
Changes in v2:
 * Addressed Richard's comment about multilib;

 Thanks,
 Laurentiu

 meta/classes/fontcache.bbclass                  |    3 ++-
 meta/classes/gtk-icon-cache.bbclass             |    7 +++++--
 meta/classes/pixbufcache.bbclass                |    3 ++-
 meta/classes/qemu.bbclass                       |    7 ++++++-
 scripts/postinst-intercepts/update_font_cache   |    3 ++-
 scripts/postinst-intercepts/update_pixbuf_cache |    3 ++-
 6 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index d3c1562..0bc309a 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -15,7 +15,8 @@ FONT_PACKAGES ??= "${PN}"
 #
 fontcache_common() {
 if [ "x$D" != "x" ] ; then
-	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} bindir=${bindir}
+	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} bindir=${bindir} \
+		libdir=${libdir} base_libdir=${base_libdir}
 	exit 1
 fi
 
diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 6d205a1..b53c0bc 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -9,7 +9,8 @@ DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk
 #
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
-    $INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG}
+    $INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} libdir=${libdir} \
+        base_libdir=${base_libdir}
     exit 1
 fi
 
@@ -25,7 +26,9 @@ done
 
 gtk_icon_cache_postrm() {
 if [ "x$D" != "x" ]; then
-    $INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG}
+    $INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} libdir=${libdir} \
+        base_libdir=${base_libdir}
+
     exit 1
 fi
 
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index fc749de..3c34557 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -15,7 +15,8 @@ PIXBUF_PACKAGES ??= "${PN}"
 #
 pixbufcache_common() {
 if [ "x$D" != "x" ]; then
-	$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} libdir=${libdir} bindir=${bindir}
+	$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} libdir=${libdir} \
+		bindir=${bindir} base_libdir=${base_libdir}
 	exit 1
 fi
 
diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 0e71d6a..930c6b0 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -29,4 +29,9 @@ def qemu_run_binary(data, rootfs_path, binary):
     if qemu_binary == "qemu-allarch":
         qemu_binary = "qemuwrapper"
 
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -L " + rootfs_path + " " + rootfs_path + binary
+    libdir = rootfs_path + data.getVar("libdir", False)
+    base_libdir = rootfs_path + data.getVar("base_libdir", False)
+
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -L " + rootfs_path\
+            + " -E LD_LIBRARY_PATH=" + libdir + ":" + base_libdir + " "\
+            + rootfs_path + binary
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index ad1bab3..afc93d8 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -1,5 +1,6 @@
 #!/bin/sh
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${bindir}/fc-cache --sysroot=$D >/dev/null 2>&1
+PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
+					$D${bindir}/fc-cache --sysroot=$D >/dev/null 2>&1
 
 
diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
index 9134529..bd94fe8 100644
--- a/scripts/postinst-intercepts/update_pixbuf_cache
+++ b/scripts/postinst-intercepts/update_pixbuf_cache
@@ -2,7 +2,8 @@
 
 export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${bindir}/gdk-pixbuf-query-loaders \
+PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
+    $D${bindir}/gdk-pixbuf-query-loaders \
     >$GDK_PIXBUF_MODULEDIR/../loaders.cache 2>/dev/null && \
     sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
 
-- 
1.7.9.5



