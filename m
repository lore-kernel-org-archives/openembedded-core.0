Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5424C6EAB6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Mar 2014 01:26:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s291QNYV009533
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Mar 2014 17:26:23 -0800 (PST)
Received: from localhost.localdomain (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sat, 8 Mar 2014 17:26:23 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Mar 2014 09:26:16 +0800
Message-ID: <1394328376-8296-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.21]
Subject: [PATCH V2] package: let dependency on a package name to be architecture specific
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
X-List-Received-Date: Sun, 09 Mar 2014 01:26:27 -0000
Content-Type: text/plain

For multilib builds that rpm is the first package backend, it would be
often desireable to express that a package of compatible architecture
is needed to satisfy a dependency. In most of the cases this is already
handled by the automatically extracted soname dependencies, but this is
not always the case: sometimes it's necessary to disable the automatic
dependency generation, and then there are cases where the information
cannot be automatically generated, such as: -dev package dependencies
on other -dev packages or plugins are dynamically loaded via dlopen,
leading to obscure build failure that a 32bit package would incorrectly
satisfy the dependency for a 64bit package and similarly vice versa.

The patch mainly aims to resolve this problem, the basic idea is adding
a ARCH_SPECIFIC variable for packages satisfying following scenarios:
  * it's not a allarch package
  * it only provides libs without bins meanwhile

Every satisfied package would be set with
"ARCH_SPECIFIC_pkgname = 1:${TARGET_ARCH}" by package_check_arch function
added in PACKAGEFUNCS and the variable is gonna be written into pkgdata
if it exists, to mark the package as architecture specific, and it will
be checked during runtime_mapping_rename is executed when generating rpm
packages, all architecture specific dependencies would be expanded with
a ${PACKAGE_ARCH} suffix, that declares a dependency on a package name
architecture specific and permits differentiating between 32-bit and
64-bit versions.

The end user could set "ARCH_SPECIFIC_pkgname = 0" in recipes to disable
this feature.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/image.bbclass             |    6 +-
 meta/classes/package.bbclass           |   76 +++++++++++++++++++++++++------
 meta/classes/package_deb.bbclass       |    2 +-
 meta/classes/package_ipk.bbclass       |    2 +-
 meta/classes/package_rpm.bbclass       |    2 +-
 meta/classes/populate_sdk_base.bbclass |    2 +-
 6 files changed, 68 insertions(+), 22 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 51d16d7..36528fd 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -230,9 +230,9 @@ do_rootfs[prefuncs] += "rootfs_process_ignore"
 # may have occurred.
 python rootfs_runtime_mapping() {
     pn = d.getVar('PN', True)
-    runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
-    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
-    runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
+    runtime_mapping_rename("PACKAGE_INSTALL", pn, False, d)
+    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, False, d)
+    runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, False, d)
 }
 do_rootfs[prefuncs] += "rootfs_runtime_mapping"
 
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0018a62..1fda2f7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -346,19 +346,29 @@ def copydebugsources(debugsrcdir, d):
 # Package data handling routines
 #
 
-def get_package_mapping (pkg, basepkg, d):
+def get_package_mapping (pkg, basepkg, check_arch, d):
     import oe.packagedata
 
+    ret = pkg
     data = oe.packagedata.read_subpkgdata(pkg, d)
-    key = "PKG_%s" % pkg
+    pkg_key = "PKG_%s" % pkg
+    arch_key = "ARCH_SPECIFIC_%s" % pkg
+    arch_specific = '0'
 
-    if key in data:
+    if pkg_key in data:
         # Have to avoid undoing the write_extra_pkgs(global_variants...)
-        if bb.data.inherits_class('allarch', d) and data[key] == basepkg:
+        if bb.data.inherits_class('allarch', d) and data[pkg_key] == basepkg:
             return pkg
-        return data[key]
+        ret = data[pkg_key]
 
-    return pkg
+    if arch_key in data:
+        arch_specific = data[arch_key]
+
+    items = arch_specific.split(':')
+    if len(items) > 1 and items[0] == '1' and check_arch == True:
+        ret += '(' + items[1] + ')'
+
+    return ret
 
 def get_package_additional_metadata (pkg_type, d):
     base_key = "PACKAGE_ADD_METADATA"
@@ -371,13 +381,13 @@ def get_package_additional_metadata (pkg_type, d):
         metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
         return "\n".join(metadata_fields).strip()
 
-def runtime_mapping_rename (varname, pkg, d):
+def runtime_mapping_rename (varname, pkg, check_arch, d):
     #bb.note("%s before: %s" % (varname, d.getVar(varname, True)))
 
     new_depends = {}
     deps = bb.utils.explode_dep_versions2(d.getVar(varname, True) or "")
     for depend in deps:
-        new_depend = get_package_mapping(depend, pkg, d)
+        new_depend = get_package_mapping(depend, pkg, check_arch, d)
         new_depends[new_depend] = deps[depend]
 
     d.setVar(varname, bb.utils.join_deps(new_depends, commasep=False))
@@ -1119,6 +1129,30 @@ python package_fixsymlinks () {
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 }
 
+# Check architecture specific packages
+python package_check_arch () {
+    import glob, re
+    def check_arch_specific(pkg):
+        bin_re = re.compile(".*/s?" + os.path.basename(d.getVar("bindir", True)) + "$")
+        lib_re = re.compile(".*/" + os.path.basename(d.getVar("libdir", True)) + "($|/.*$)")
+        has_bins = 0
+        has_libs = 0
+
+        for file in pkgfiles[pkg]:
+            root = os.path.dirname(file)
+            if bin_re.match(root):
+                has_bins = 1
+            if lib_re.match(root):
+                has_libs = 1
+
+        if not bb.data.inherits_class('allarch', d) and not has_bins and has_libs:
+            if not d.getVar('ARCH_SPECIFIC_' + pkg):
+                d.setVar('ARCH_SPECIFIC_' + pkg, "%s:%s" % ('1', d.getVar('PACKAGE_ARCH', True)))
+
+    for pkg in sorted((d.getVar('PACKAGES', True) or "").split()):
+        check_arch_specific(pkg)
+}
+
 PKGDESTWORK = "${WORKDIR}/pkgdata"
 
 python emit_pkgdata() {
@@ -1184,6 +1218,16 @@ python emit_pkgdata() {
             pkgval = pkg
             d.setVar('PKG_%s' % pkg, pkg)
 
+        arch_specific = d.getVar('ARCH_SPECIFIC_%s' % pkg, True) or ""
+        items = arch_specific.split(':')
+        if len(items) > 1 and items[0] == '1':
+            rprovides = d.getVar('RPROVIDES_%s' % pkg, True)
+            if rprovides == None:
+                rprovides = pkg + ' (=' + d.getVar('EXTENDPKGV', True) + ')'
+            else:
+                rprovides += ' ' + pkg + ' (=' + d.getVar('EXTENDPKGV', True) + ')'
+            d.setVar('RPROVIDES_%s' % pkg, rprovides)
+
         pkgdestpkg = os.path.join(pkgdest, pkg)
         files = {}
         total_size = 0
@@ -1215,6 +1259,7 @@ python emit_pkgdata() {
         write_if_exists(sf, pkg, 'SECTION')
         write_if_exists(sf, pkg, 'PKG')
         write_if_exists(sf, pkg, 'ALLOW_EMPTY')
+        write_if_exists(sf, pkg, 'ARCH_SPECIFIC')
         write_if_exists(sf, pkg, 'FILES')
         write_if_exists(sf, pkg, 'pkg_postinst')
         write_if_exists(sf, pkg, 'pkg_postrm')
@@ -1878,6 +1923,7 @@ PACKAGESPLITFUNCS ?= " \
 PACKAGEFUNCS += " \
                 package_fixsymlinks \
                 package_name_hook \
+                package_check_arch \
                 package_do_filedeps \
                 package_do_shlibs \
                 package_do_pkgconfig \
@@ -2004,16 +2050,16 @@ addtask do_packagedata_setscene
 # Helper functions for the package writing classes
 #
 
-def mapping_rename_hook(d):
+def mapping_rename_hook(check_arch, d):
     """
     Rewrite variables to account for package renaming in things
     like debian.bbclass or manual PKG variable name changes
     """
     pkg = d.getVar("PKG", True)
-    runtime_mapping_rename("RDEPENDS", pkg, d)
-    runtime_mapping_rename("RRECOMMENDS", pkg, d)
-    runtime_mapping_rename("RSUGGESTS", pkg, d)
-    runtime_mapping_rename("RPROVIDES", pkg, d)
-    runtime_mapping_rename("RREPLACES", pkg, d)
-    runtime_mapping_rename("RCONFLICTS", pkg, d)
+    runtime_mapping_rename("RDEPENDS", pkg, check_arch, d)
+    runtime_mapping_rename("RRECOMMENDS", pkg, check_arch, d)
+    runtime_mapping_rename("RSUGGESTS", pkg, check_arch, d)
+    runtime_mapping_rename("RPROVIDES", pkg, check_arch, d)
+    runtime_mapping_rename("RREPLACES", pkg, check_arch, d)
+    runtime_mapping_rename("RCONFLICTS", pkg, check_arch, d)
 
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index a16d57e..846f13e 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -178,7 +178,7 @@ python do_package_deb () {
             ctrlfile.write(unicode(custom_fields_chunk))
             ctrlfile.write("\n")
 
-        mapping_rename_hook(localdata)
+        mapping_rename_hook(False, localdata)
 
         def debian_cmp_remap(var):
             # dpkg does not allow for '(' or ')' in a dependency name
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index aab31e5..1c88d07 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -142,7 +142,7 @@ python do_package_ipk () {
             ctrlfile.write(custom_fields_chunk)
             ctrlfile.write("\n")
 
-        mapping_rename_hook(localdata)
+        mapping_rename_hook(False, localdata)
 
         def debian_cmp_remap(var):
             # In debian '>' and '<' do not mean what it appears they mean
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index bce5648..7c13d61 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -329,7 +329,7 @@ python write_specfile () {
         translate_vers('RCONFLICTS', localdata)
 
         # Map the dependencies into their final form
-        mapping_rename_hook(localdata)
+        mapping_rename_hook(True, localdata)
 
         splitrdepends    = strip_multilib_deps(localdata.getVar('RDEPENDS', True), d)
         splitrrecommends = strip_multilib_deps(localdata.getVar('RRECOMMENDS', True), d)
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 235d672..3a7927a 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -54,7 +54,7 @@ fakeroot python do_populate_sdk() {
     from oe.manifest import create_manifest, Manifest
 
     pn = d.getVar('PN', True)
-    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
+    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, False, d)
 
     # create target/host SDK manifests
     create_manifest(d, manifest_dir=d.getVar('SDK_DIR', True),
-- 
1.7.1


