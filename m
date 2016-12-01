Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id C948762136
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 12:37:37 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id CC067B81C73; Thu,  1 Dec 2016 13:37:32 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 13:37:32 +0100
Message-Id: <1480595852-17745-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <2b3dfd87-29e5-f50a-a0a1-bedd604b2bd3@opendreambox.org>
References: <2b3dfd87-29e5-f50a-a0a1-bedd604b2bd3@opendreambox.org>
Subject: [PATCH v2] libc-package.bbclass: split binary localedata even more if asked to
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
X-List-Received-Date: Thu, 01 Dec 2016 12:37:39 -0000

If GLIBC_SPLIT_LC_PACKAGES is set to a non-zero value, convert
glibc-binary-localedata-XX-YY to be a meta package depending on
glibc-binary-localedata-XX-YY-lc-address and so on. This enables
saving quite some space if someone doesn't need LC_COLLATE for
example.

Some regex code was removed from output_locale_binary_rdepends,
because legitimize_package_name already converts to lowercase.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
v2: Added description to local.conf.sample.extended.

 meta/classes/libc-package.bbclass    | 39 +++++++++++++++++++++++-------------
 meta/conf/local.conf.sample.extended |  7 +++++++
 2 files changed, 32 insertions(+), 14 deletions(-)

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
 
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 57f656a..f7cabf0 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -47,6 +47,13 @@
 # less than 128MB RAM.
 #ENABLE_BINARY_LOCALE_GENERATION = "1"
 
+# If GLIBC_SPLIT_LC_PACKAGES is set to a non-zero value, convert
+# glibc-binary-localedata-XX-YY to be a meta package depending on
+# glibc-binary-localedata-XX-YY-lc-address and so on. This enables
+# saving quite some space if someone doesn't need LC_COLLATE for
+# example.
+#GLIBC_SPLIT_LC_PACKAGES = "1"
+
 # Set GLIBC_GENERATE_LOCALES to the locales you wish to generate should you not
 # wish to perform the time-consuming step of generating all LIBC locales.
 # NOTE: If removing en_US.UTF-8 you will also need to uncomment, and set
-- 
2.7.4


