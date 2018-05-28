Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8046003C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 10:05:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2018 03:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,451,1520924400"; d="scan'208";a="232488532"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 28 May 2018 03:05:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2018 13:05:32 +0300
Message-Id: <20180528100537.3827-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528100537.3827-1-alexander.kanavin@linux.intel.com>
References: <20180528100537.3827-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/7] gtk-immodules-cache.bbclass: convert cache creation to postinst_intercept mechanism
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
X-List-Received-Date: Mon, 28 May 2018 10:05:29 -0000

This has the following benefits:
- consistent with how the other caches are created into target rootfs
- only runs once per package manager transaction, instead of once per every immodule package
- correctly postpones to first boot if qemu is not working; from postinst itself
this would've required special arrangements to avoid what is now a do_rootfs failure.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gtk-immodules-cache.bbclass      | 70 ++++++++-----------
 .../update_gtk_immodules_cache                | 18 +++++
 2 files changed, 46 insertions(+), 42 deletions(-)
 create mode 100644 scripts/postinst-intercepts/update_gtk_immodules_cache

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 3d82dbe9e34..9bb0af8b26a 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -10,53 +10,39 @@ GTKIMMODULES_PACKAGES ?= "${PN}"
 
 gtk_immodule_cache_postinst() {
 if [ "x$D" != "x" ]; then
-        if [ -x $D${bindir}/gtk-query-immodules-2.0 ]; then
-            IMFILES=$(ls $D${libdir}/gtk-2.0/*/immodules/*.so)
-            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-2.0')} \
-                $IMFILES > $D${libdir}/gtk-2.0/2.10.0/immodules.cache 2>/dev/null &&
-                sed -i -e "s:$D::" $D${libdir}/gtk-2.0/2.10.0/immodules.cache
-        fi
-        if [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
-            IMFILES=$(ls $D${libdir}/gtk-3.0/*/immodules/*.so)
-            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-3.0')} \
-                $IMFILES > $D${libdir}/gtk-3.0/3.0.0/immodules.cache 2>/dev/null &&
-                sed -i -e "s:$D::" $D${libdir}/gtk-3.0/3.0.0/immodules.cache
-        fi
-
-    [ $? -ne 0 ] && exit 1
-    exit 0
-fi
-if [ ! -z `which gtk-query-immodules-2.0` ]; then
-    gtk-query-immodules-2.0 > ${libdir}/gtk-2.0/2.10.0/immodules.cache
-fi
-if [ ! -z `which gtk-query-immodules-3.0` ]; then
-    gtk-query-immodules-3.0 > ${libdir}/gtk-3.0/3.0.0/immodules.cache
+    $INTERCEPT_DIR/postinst_intercept update_gtk_immodules_cache ${PKG} \
+            mlprefix=${MLPREFIX} \
+            binprefix=${MLPREFIX} \
+            libdir=${libdir} \
+            libexecdir=${libexecdir} \
+            base_libdir=${base_libdir} \
+            bindir=${bindir}
+else
+    if [ ! -z `which gtk-query-immodules-2.0` ]; then
+        gtk-query-immodules-2.0 > ${libdir}/gtk-2.0/2.10.0/immodules.cache
+    fi
+    if [ ! -z `which gtk-query-immodules-3.0` ]; then
+        gtk-query-immodules-3.0 > ${libdir}/gtk-3.0/3.0.0/immodules.cache
+    fi
 fi
 }
 
 gtk_immodule_cache_postrm() {
 if [ "x$D" != "x" ]; then
-        if [ -x $D${bindir}/gtk-query-immodules-2.0 ]; then
-            IMFILES=$(ls $D${libdir}/gtk-2.0/*/immodules/*.so)
-            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-2.0')} \
-                $IMFILES > $D${libdir}/gtk-2.0/2.10.0/immodules.cache 2>/dev/null &&
-                sed -i -e "s:$D::" $D${libdir}/gtk-2.0/2.10.0/immodules.cache
-        fi
-        if [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
-            IMFILES=$(ls $D${libdir}/gtk-3.0/*/immodules/*.so)
-            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-3.0')} \
-                $IMFILES > $D${libdir}/gtk-3.0/3.0.0/immodules.cache 2>/dev/null &&
-                sed -i -e "s:$D::" $D${libdir}/gtk-3.0/3.0.0/immodules.cache
-        fi
-
-    [ $? -ne 0 ] && exit 1
-    exit 0
-fi
-if [ ! -z `which gtk-query-immodules-2.0` ]; then
-    gtk-query-immodules-2.0 > ${libdir}/gtk-2.0/2.10.0/immodules.cache
-fi
-if [ ! -z `which gtk-query-immodules-3.0` ]; then
-    gtk-query-immodules-3.0 > ${libdir}/gtk-3.0/3.0.0/immodules.cache
+    $INTERCEPT_DIR/postinst_intercept update_gtk_immodules_cache ${PKG} \
+            mlprefix=${MLPREFIX} \
+            binprefix=${MLPREFIX} \
+            libdir=${libdir} \
+            libexecdir=${libexecdir} \
+            base_libdir=${base_libdir} \
+            bindir=${bindir}
+else
+    if [ ! -z `which gtk-query-immodules-2.0` ]; then
+        gtk-query-immodules-2.0 > ${libdir}/gtk-2.0/2.10.0/immodules.cache
+    fi
+    if [ ! -z `which gtk-query-immodules-3.0` ]; then
+        gtk-query-immodules-3.0 > ${libdir}/gtk-3.0/3.0.0/immodules.cache
+    fi
 fi
 }
 
diff --git a/scripts/postinst-intercepts/update_gtk_immodules_cache b/scripts/postinst-intercepts/update_gtk_immodules_cache
new file mode 100644
index 00000000000..e2b9ff74382
--- /dev/null
+++ b/scripts/postinst-intercepts/update_gtk_immodules_cache
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+set -e
+
+if [ -x $D${bindir}/gtk-query-immodules-2.0 ]; then
+    PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
+        $D/${bindir}/gtk-query-immodules-2.0 \
+        > $D${libdir}/gtk-2.0/2.10.0/immodules.cache &&
+        sed -i -e "s:$D::" $D${libdir}/gtk-2.0/2.10.0/immodules.cache
+        chown root:root $D${libdir}/gtk-2.0/2.10.0/immodules.cache
+fi
+if [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
+    PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
+        $D/${bindir}/gtk-query-immodules-3.0 \
+        > $D${libdir}/gtk-3.0/3.0.0/immodules.cache &&
+        sed -i -e "s:$D::" $D${libdir}/gtk-3.0/3.0.0/immodules.cache
+        chown root:root $D${libdir}/gtk-3.0/3.0.0/immodules.cache
+fi
-- 
2.17.0


