Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id AD5D071B12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 23:50:19 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 399C6B8A512; Thu,  1 Dec 2016 00:50:18 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 00:50:17 +0100
Message-Id: <1480549817-16636-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libc-package.bbclass: split binary localedata even more if asked to
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
X-List-Received-Date: Wed, 30 Nov 2016 23:50:20 -0000

If GLIBC_SPLIT_LC_PACKAGES is set to a non-zero value, convert
glibc-binary-localedata-XX-YY to be a meta package depending on
glibc-binary-localedata-XX-YY-lc-address and so on. This enables
saving quite some space if someone doesn't need LC_COLLATE for
example.

Some regex code was removed from output_locale_binary_rdepends,
because legitimize_package_name already converts to lowercase.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/libc-package.bbclass | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 2dc90c4..071978b 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -9,6 +9,8 @@
 
 GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "ondevice"
 
+GLIBC_SPLIT_LC_PACKAGES ?= "0"
+
 python __anonymous () {
     enabled = d.getVar("ENABLE_BINARY_LOCALE_GENERATION", True)
 
@@ -219,13 +221,12 @@ python package_do_split_gconvs () {
         (locale, encoding, locale))
 
     def output_locale_binary_rdepends(name, pkgname, locale, encoding):
-        m = re.match("(.*)\.(.*)", name)
-        if m:
-            libc_name = "%s.%s" % (m.group(1), m.group(2).lower())
-        else:
-            libc_name = name
-        d.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
-            % (mlprefix+bpn, libc_name)))
+        dep = legitimize_package_name('%s-binary-localedata-%s' % (bpn, name))
+        lcsplit = d.getVar('GLIBC_SPLIT_LC_PACKAGES', True)
+        if lcsplit and int(lcsplit):
+            d.appendVar('PACKAGES', ' ' + dep)
+            d.setVar('ALLOW_EMPTY_%s' % dep, '1')
+        d.setVar('RDEPENDS_%s' % pkgname, mlprefix + dep)
 
     commands = {}
 
@@ -337,6 +338,11 @@ python package_do_split_gconvs () {
             else:
                 output_locale('%s.%s' % (base, charset), base, charset)
 
+    def metapkg_hook(file, pkg, pattern, format, basename):
+        name = basename.split('/', 1)[0]
+        metapkg = legitimize_package_name('%s-binary-localedata-%s' % (mlprefix+bpn, name))
+        d.appendVar('RDEPENDS_%s' % metapkg, ' ' + pkg)
+
     if use_bin == "compile":
         makefile = base_path_join(d.getVar("WORKDIR", True), "locale-tree", "Makefile")
         m = open(makefile, "w")
@@ -350,13 +356,18 @@ python package_do_split_gconvs () {
         bb.build.exec_func("oe_runmake", d)
         bb.note("collecting binary locales from locale tree")
         bb.build.exec_func("do_collect_bins_from_locale_tree", d)
-        do_split_packages(d, binary_locales_dir, file_regex='(.*)', \
-            output_pattern=bpn+'-binary-localedata-%s', \
-            description='binary locale definition for %s', extra_depends='', allow_dirs=True)
-    elif use_bin == "precompiled":
-        do_split_packages(d, binary_locales_dir, file_regex='(.*)', \
-            output_pattern=bpn+'-binary-localedata-%s', \
-            description='binary locale definition for %s', extra_depends='', allow_dirs=True)
+
+    if use_bin in ('compile', 'precompiled'):
+        lcsplit = d.getVar('GLIBC_SPLIT_LC_PACKAGES', True)
+        if lcsplit and int(lcsplit):
+            do_split_packages(d, binary_locales_dir, file_regex='^(.*/LC_\w+)', \
+                output_pattern=bpn+'-binary-localedata-%s', \
+                description='binary locale definition for %s', recursive=True,
+                hook=metapkg_hook, extra_depends='', allow_dirs=True, match_path=True)
+        else:
+            do_split_packages(d, binary_locales_dir, file_regex='(.*)', \
+                output_pattern=bpn+'-binary-localedata-%s', \
+                description='binary locale definition for %s', extra_depends='', allow_dirs=True)
     else:
         bb.note("generation of binary locales disabled. this may break i18n!")
 
-- 
2.7.4


