Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1E3731C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 11:01:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2016 03:01:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,384,1449561600"; d="scan'208";a="903755911"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 03:01:23 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 1A37B6A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 03:49:14 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 13:04:10 +0200
Message-Id: <1454411051-15095-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1454411051-15095-1-git-send-email-maxin.john@intel.com>
References: <1454411051-15095-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] gtk-immodules-cache.bbclass: fix immodules-cache path
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
X-List-Received-Date: Tue, 02 Feb 2016 11:01:22 -0000

This commit in gtk+ moved the cache files below <libdir>
"
commit c8849046860a9b17fa943247d85ddadb29262b48
Author: Matthias Clasen <mclasen@redhat.com>
Date: Thu Jul 4 09:27:17 2013 -0400
Move the module cache files below libdir

These files contain architecture-dependent paths, and thus placing them
into sysconfdir causes unnecessary hassle. Now the immodule cache file is
looked for in libdir/gtk-2.0/2.10.0/immodules.cache. Belated backport of a
change that was done in the run-up to 3.0.". Update gtk-immodules-cache.bbclass
to use that path.

The environment variable "GTK_IM_MODULE_FILE" can also be set to point GTK+
at the file to fix this problem. However, it causes problems for gtk3 apps.

[YOCTO #6774]
[YOCTO #8957]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/gtk-immodules-cache.bbclass | 48 +++++++++++++++++---------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 0a6316d..c099cd3 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -10,47 +10,51 @@ GTKIMMODULES_PACKAGES ?= "${PN}"
 
 gtk_immodule_cache_postinst() {
 if [ "x$D" != "x" ]; then
-    for maj_ver in 2 3; do
-        if [ -x $D${bindir}/gtk-query-immodules-$maj_ver.0 ]; then
-            IMFILES=$(ls $D${libdir}/gtk-$maj_ver.0/*/immodules/*.so)
-            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-$maj_ver.0')} \
-                $IMFILES > $D/etc/gtk-$maj_ver.0/gtk.immodules 2>/dev/null &&
-                sed -i -e "s:$D::" $D/etc/gtk-$maj_ver.0/gtk.immodules
-
-            [ $? -ne 0 ] && exit 1
+        if [ -x $D${bindir}/gtk-query-immodules-2.0 ]; then
+            IMFILES=$(ls $D${libdir}/gtk-2.0/*/immodules/*.so)
+            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-2.0')} \
+                $IMFILES > $D${libdir}/gtk-2.0/2.10.0/immodules.cache 2>/dev/null &&
+                sed -i -e "s:$D::" $D${libdir}/gtk-2.0/2.10.0/immodules.cache
+        elif [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
+            IMFILES=$(ls $D${libdir}/gtk-3.0/*/immodules/*.so)
+            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-3.0')} \
+                $IMFILES > $D${libdir}/gtk-3.0/3.0.0/immodules.cache 2>/dev/null &&
+                sed -i -e "s:$D::" $D${libdir}/gtk-3.0/3.0.0/immodules.cache
         fi
-    done
 
+    [ $? -ne 0 ] && exit 1
     exit 0
 fi
 if [ ! -z `which gtk-query-immodules-2.0` ]; then
-    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
+    gtk-query-immodules-2.0 > ${libdir}/gtk-2.0/2.10.0/immodules.cache
 fi
 if [ ! -z `which gtk-query-immodules-3.0` ]; then
-    gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules
+    gtk-query-immodules-3.0 > ${libdir}/gtk-3.0/3.0.0/immodules.cache
 fi
 }
 
 gtk_immodule_cache_postrm() {
 if [ "x$D" != "x" ]; then
-    for maj_ver in 2 3; do
-        if [ -x $D${bindir}/gtk-query-immodules-$maj_ver.0 ]; then
-            IMFILES=$(ls $D${libdir}/gtk-$maj_ver.0/*/immodules/*.so)
-            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-$maj_ver.0')} \
-                $IMFILES > $D/etc/gtk-$maj_ver.0/gtk.immodules 2>/dev/null &&
-                sed -i -e "s:$D::" $D/etc/gtk-$maj_ver.0/gtk.immodules
-
-            [ $? -ne 0 ] && exit 1
+        if [ -x $D${bindir}/gtk-query-immodules-2.0 ]; then
+            IMFILES=$(ls $D${libdir}/gtk-2.0/*/immodules/*.so)
+            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-2.0')} \
+                $IMFILES > $D${libdir}/gtk-2.0/2.10.0/immodules.cache 2>/dev/null &&
+                sed -i -e "s:$D::" $D${libdir}/gtk-2.0/2.10.0/immodules.cache
+        elif [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
+            IMFILES=$(ls $D${libdir}/gtk-3.0/*/immodules/*.so)
+            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-3.0')} \
+                $IMFILES > $D${libdir}/gtk-3.0/3.0.0/immodules.cache 2>/dev/null &&
+                sed -i -e "s:$D::" $D${libdir}/gtk-3.0/3.0.0/immodules.cache
         fi
-    done
 
+    [ $? -ne 0 ] && exit 1
     exit 0
 fi
 if [ ! -z `which gtk-query-immodules-2.0` ]; then
-    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
+    gtk-query-immodules-2.0 > ${libdir}/gtk-2.0/2.10.0/immodules.cache
 fi
 if [ ! -z `which gtk-query-immodules-3.0` ]; then
-    gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules
+    gtk-query-immodules-3.0 > ${libdir}/gtk-3.0/3.0.0/immodules.cache
 fi
 }
 
-- 
2.4.0


