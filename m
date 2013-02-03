Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29gh-0002jG-Lw
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:13:32 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401L9x020544; Mon, 4 Feb 2013 00:01:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tzV4qT5FqPJR; Mon,  4 Feb 2013 00:01:24 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401EC0020466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:16 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pm-0000Yf-SJ; Sun, 03 Feb 2013 23:56:02 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:52 +0000
Message-Id: <17de304797dee2ecdc09bce49d44b71d798a0e76.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 22/22] classes: Drop none package specific packaging variable accesses
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
X-List-Received-Date: Mon, 04 Feb 2013 00:13:33 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/gconf.bbclass               |    9 +++------
 meta/classes/gtk-icon-cache.bbclass      |    4 ++--
 meta/classes/gtk-immodules-cache.bbclass |    4 ++--
 meta/classes/mime.bbclass                |    8 +++-----
 meta/classes/package.bbclass             |   19 ++++++++-----------
 meta/classes/update-alternatives.bbclass |    4 ++--
 meta/classes/update-rc.d_real.bbclass    |    6 +++---
 7 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index cc01bca..e9076b2 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -56,18 +56,15 @@ python populate_packages_append () {
         if schemas != []:
             bb.note("adding gconf postinst and prerm scripts to %s" % pkg)
             d.setVar('SCHEMA_FILES', " ".join(schemas))
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
             if not postinst:
                 postinst = '#!/bin/sh\n'
             postinst += d.getVar('gconf_postinst', True)
             d.setVar('pkg_postinst_%s' % pkg, postinst)
-            prerm = d.getVar('pkg_prerm_%s' % pkg, True) or d.getVar('pkg_prerm', True)
+            prerm = d.getVar('pkg_prerm_%s' % pkg, True)
             if not prerm:
                 prerm = '#!/bin/sh\n'
             prerm += d.getVar('gconf_prerm', True)
             d.setVar('pkg_prerm_%s' % pkg, prerm)
-            rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
-            rdepends += ' ' + d.getVar('MLPREFIX') + 'gconf'
-            d.setVar("RDEPENDS_%s" % pkg, rdepends)
-
+            d.appendVar("RDEPENDS_%s" % pkg, ' ' + d.getVar('MLPREFIX') + 'gconf')
 }
diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index cf33efd..4868081 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -72,13 +72,13 @@ python populate_packages_append () {
     
         bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
         
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+        postinst = d.getVar('pkg_postinst_%s' % pkg, True)
         if not postinst:
             postinst = '#!/bin/sh\n'
         postinst += d.getVar('gtk_icon_cache_postinst', True)
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-        postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+        postrm = d.getVar('pkg_postrm_%s' % pkg, True)
         if not postrm:
             postrm = '#!/bin/sh\n'
         postrm += d.getVar('gtk_icon_cache_postrm', True)
diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index a8855af..d8d9aa5 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -58,13 +58,13 @@ python populate_packages_append () {
     for pkg in gtkimmodules_pkgs:
             bb.note("adding gtk-immodule-cache postinst and postrm scripts to %s" % pkg)
 
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
             if not postinst:
                 postinst = '#!/bin/sh\n'
             postinst += d.getVar('gtk_immodule_cache_postinst', True)
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-            postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+            postrm = d.getVar('pkg_postrm_%s' % pkg, True)
             if not postrm:
                 postrm = '#!/bin/sh\n'
             postrm += d.getVar('gtk_immodule_cache_postrm', True)
diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index b669418..690610e 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -43,18 +43,16 @@ python populate_packages_append () {
                     mimes.append(f)
         if mimes:
             bb.note("adding mime postinst and postrm scripts to %s" % pkg)
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
             if not postinst:
                 postinst = '#!/bin/sh\n'
             postinst += d.getVar('mime_postinst', True)
             d.setVar('pkg_postinst_%s' % pkg, postinst)
-            postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+            postrm = d.getVar('pkg_postrm_%s' % pkg, True)
             if not postrm:
                 postrm = '#!/bin/sh\n'
             postrm += d.getVar('mime_postrm', True)
             d.setVar('pkg_postrm_%s' % pkg, postrm)
             bb.note("adding shared-mime-info-data dependency to %s" % pkg)
-            rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "" ) 
-            rdepends.append("shared-mime-info-data")
-            d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
+            d.appendVar('RDEPENDS_' + pkg, " shared-mime-info-data")
 }
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2bae65b..cb7cceb 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -415,7 +415,7 @@ python package_do_split_locales() {
     # glibc-localedata-translit* won't install as a dependency
     # for some other package which breaks meta-toolchain
     # Probably breaks since virtual-locale- isn't provided anywhere
-    #rdep = (d.getVar('RDEPENDS_%s' % pn, True) or d.getVar('RDEPENDS', True) or "").split()
+    #rdep = (d.getVar('RDEPENDS_%s' % pn, True) or "").split()
     #rdep.append('%s-locale*' % pn)
     #d.setVar('RDEPENDS_%s' % pn, ' '.join(rdep))
 }
@@ -899,7 +899,7 @@ python populate_packages () {
         root = os.path.join(pkgdest, pkg)
         bb.utils.mkdirhier(root)
 
-        filesvar = d.getVar('FILES_%s' % pkg, True) or d.getVar('FILES', True) or ""
+        filesvar = d.getVar('FILES_%s' % pkg, True) or ""
         if "//" in filesvar:
             bb.warn("FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg)
             filesvar.replace("//", "/")
@@ -1027,7 +1027,7 @@ python package_fixsymlinks () {
                 bb.note("%s contains dangling symlink to %s" % (pkg, l))
 
     for pkg in newrdepends:
-        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or d.getVar('RDEPENDS', True) or "")
+        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or "")
         for p in newrdepends[pkg]:
             if p not in rdepends:
                 rdepends[p] = []
@@ -1410,7 +1410,7 @@ python package_do_shlibs() {
             fd.close()
         if needs_ldconfig and use_ldconfig:
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
             if not postinst:
                 postinst = '#!/bin/sh\n'
             postinst += d.getVar('ldconfig_postinst_fragment', True)
@@ -1597,7 +1597,7 @@ python read_shlibdeps () {
 
     packages = d.getVar('PACKAGES', True).split()
     for pkg in packages:
-        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or d.getVar('RDEPENDS', True) or "")
+        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or "")
         for dep in pkglibdeps[pkg]:
             # Add the dep if it's not already there, or if no comparison is set
             if dep not in rdepends:
@@ -1629,7 +1629,7 @@ python package_depchains() {
     def pkg_adddeprrecs(pkg, base, suffix, getname, depends, d):
 
         #bb.note('depends for %s is %s' % (base, depends))
-        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg, True) or d.getVar('RRECOMMENDS', True) or "")
+        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg, True) or "")
 
         for depend in depends:
             if depend.find('-native') != -1 or depend.find('-cross') != -1 or depend.startswith('virtual/'):
@@ -1650,7 +1650,7 @@ python package_depchains() {
     def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):
 
         #bb.note('rdepends for %s is %s' % (base, rdepends))
-        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg, True) or d.getVar('RRECOMMENDS', True) or "")
+        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg, True) or "")
 
         for depend in rdepends:
             if depend.find('virtual-locale-') != -1:
@@ -1677,9 +1677,6 @@ python package_depchains() {
         add_dep(depends, dep)
 
     rdepends = []
-    for dep in bb.utils.explode_deps(d.getVar('RDEPENDS', True) or ""):
-        add_dep(rdepends, dep)
-
     for pkg in packages.split():
         for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + pkg, True) or ""):
             add_dep(rdepends, dep)
@@ -1729,7 +1726,7 @@ python package_depchains() {
                 pkg_addrrecs(pkg, base, suffix, func, rdepends, d)
             else:
                 rdeps = []
-                for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + base, True) or d.getVar('RDEPENDS', True) or ""):
+                for dep in bb.utils.explode_deps(d.getVar('RDEPENDS_' + base, True) or ""):
                     add_dep(rdeps, dep)
                 pkg_addrrecs(pkg, base, suffix, func, rdeps, d)
 }
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 147d236..8f4410b 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -327,12 +327,12 @@ python populate_packages_updatealternatives () {
 
             bb.note('adding update-alternatives calls to postinst/postrm for %s' % pkg)
             bb.note('%s' % alt_setup_links)
-            postinst = (d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)) or '#!/bin/sh\n'
+            postinst = d.getVar('pkg_postinst_%s' % pkg, True) or '#!/bin/sh\n'
             postinst += alt_setup_links
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
             bb.note('%s' % alt_remove_links)
-            postrm = (d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)) or '#!/bin/sh\n'
+            postrm = d.getVar('pkg_postrm_%s' % pkg, True) or '#!/bin/sh\n'
             postrm += alt_remove_links
             d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
diff --git a/meta/classes/update-rc.d_real.bbclass b/meta/classes/update-rc.d_real.bbclass
index f9d55fb..30ae8e3 100644
--- a/meta/classes/update-rc.d_real.bbclass
+++ b/meta/classes/update-rc.d_real.bbclass
@@ -57,19 +57,19 @@ python populate_packages_updatercd () {
         execute on the target. Not doing so may cause update_rc.d postinst invoked
         twice to cause unwanted warnings.
         """ 
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+        postinst = d.getVar('pkg_postinst_%s' % pkg, True)
         if not postinst:
             postinst = '#!/bin/sh\n'
         postinst += d.getVar('updatercd_postinst', True)
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-        prerm = d.getVar('pkg_prerm_%s' % pkg, True) or d.getVar('pkg_prerm', True)
+        prerm = d.getVar('pkg_prerm_%s' % pkg, True)
         if not prerm:
             prerm = '#!/bin/sh\n'
         prerm += d.getVar('updatercd_prerm', True)
         d.setVar('pkg_prerm_%s' % pkg, prerm)
 
-        postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+        postrm = d.getVar('pkg_postrm_%s' % pkg, True)
         if not postrm:
                 postrm = '#!/bin/sh\n'
         postrm += d.getVar('updatercd_postrm', True)
-- 
1.7.10.4



