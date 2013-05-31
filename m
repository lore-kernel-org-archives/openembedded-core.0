Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 10D326A49D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 19:15:52 +0000 (UTC)
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 0CA5E21401
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 21:15:52 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 21:15:56 +0200
Message-Id: <1370027758-22849-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <1370027758-22849-1-git-send-email-dv@pseudoterminal.org>
References: <1370027758-22849-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 1/3] gstreamer: fixed -meta package rdepends
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
X-List-Received-Date: Fri, 31 May 2013 19:15:52 -0000

The -meta packages were depending on non-existing packages,
like -glib and -apps. The fix checks if packages in the PACKAGES list
are empty. If so, they are omitted from the rdepends list.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gst-plugins-package.inc              | 27 ++++++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 7ae3ef6..5962e4b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -1,6 +1,8 @@
+PACKAGESPLITFUNCS_prepend = " split_gstreamer10_packages "
+PACKAGESPLITFUNCS_append = " set_metapkg_rdepends "
 LIBV = "0.10"
 
-python populate_packages_prepend () {
+python split_gstreamer10_packages () {
     gst_libdir = d.expand('${libdir}/gstreamer-${LIBV}')
     postinst = d.getVar('plugin_postinst', True)
     glibdir = d.getVar('libdir', True)
@@ -9,23 +11,38 @@ python populate_packages_prepend () {
     do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
     do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
     do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
-    
+}
+
+python set_metapkg_rdepends () {
+    import os
+
     pn = d.getVar('PN', True)
     metapkg =  pn + '-meta'
     d.setVar('ALLOW_EMPTY_' + metapkg, "1")
     d.setVar('FILES_' + metapkg, "")
-    blacklist = [ pn + '-locale', pn + '-dev', pn + '-dbg', pn + '-doc' ]
+    blacklist = [ pn, pn + '-locale', pn + '-dev', pn + '-dbg', pn + '-doc', pn + '-meta' ]
     metapkg_rdepends = []
     packages = d.getVar('PACKAGES', True).split()
+    pkgdest = d.getVar('PKGDEST', True)
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-staticdev'):
-            metapkg_rdepends.append(pkg)
+            # See if the package is empty by looking at the contents of its PKGDEST subdirectory. 
+            # If this subdirectory is empty, then the package is.
+            # Empty packages do not get added to the meta package's RDEPENDS
+            pkgdir = os.path.join(pkgdest, pkg)
+            if os.path.exists(pkgdir):
+                dir_contents = os.listdir(pkgdir) or []
+            else:
+                dir_contents = []
+            is_empty = len(dir_contents) == 0
+            if not is_empty:
+                metapkg_rdepends.append(pkg)
     d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
     d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
 }
 
 # metapkg has runtime dependency on PN
-# each plugin depends on PN, plugin-dev on PN-dev and plugin-staticdev on PN-staticdev
+# each plugin depends on PN, plugin-dev on PN-dev, plugin-staticdev on PN-staticdev
 # so we need them even when empty (like in gst-plugins-good case)
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dev = "1"
-- 
1.8.3


