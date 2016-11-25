Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6BEFC62134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 15:28:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Nov 2016 07:28:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,547,1473145200"; d="scan'208";a="1064113657"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.26.83])
	by orsmga001.jf.intel.com with ESMTP; 25 Nov 2016 07:27:56 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Nov 2016 15:27:29 +0000
Message-Id: <1480087649-26543-2-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480087649-26543-1-git-send-email-joshua.g.lock@intel.com>
References: <1480087649-26543-1-git-send-email-joshua.g.lock@intel.com>
Subject: [PATCH 2/2] meta: remove True option to getVarFlag calls
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
X-List-Received-Date: Fri, 25 Nov 2016 15:28:00 -0000

getVarFlag() now defaults to expanding by default, thus remove the
True option from getVarFlag() calls with a regex search and
replace.

Search made with the following regex:
getVarFlag ?\(( ?[^,()]*, ?[^,()]*), True\)

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/archiver.bbclass              | 28 ++++++++++++++--------------
 meta/classes/blacklist.bbclass             |  2 +-
 meta/classes/compress_doc.bbclass          | 14 +++++++-------
 meta/classes/devshell.bbclass              |  4 ++--
 meta/classes/externalsrc.bbclass           |  2 +-
 meta/classes/image-buildinfo.bbclass       |  2 +-
 meta/classes/image.bbclass                 |  4 ++--
 meta/classes/license.bbclass               | 16 ++++++++--------
 meta/classes/package.bbclass               |  4 ++--
 meta/classes/package_rpm.bbclass           |  6 +++---
 meta/classes/package_tar.bbclass           |  2 +-
 meta/classes/packagefeed-stability.bbclass |  2 +-
 meta/classes/populate_sdk_ext.bbclass      |  4 ++--
 meta/classes/rootfs_ipk.bbclass            |  2 +-
 meta/classes/rootfs_rpm.bbclass            |  2 +-
 meta/classes/sstate.bbclass                | 14 +++++++-------
 meta/classes/testexport.bbclass            |  2 +-
 meta/classes/typecheck.bbclass             |  2 +-
 meta/classes/update-alternatives.bbclass   | 14 +++++++-------
 meta/classes/utility-tasks.bbclass         |  6 +++---
 meta/lib/oe/data.py                        |  2 +-
 meta/lib/oe/packagegroup.py                |  4 ++--
 meta/lib/oe/sstatesig.py                   |  2 +-
 scripts/lib/recipetool/append.py           |  6 +++---
 scripts/verify-bashisms                    |  2 +-
 25 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 30215ae..3e3c382 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -73,9 +73,9 @@ python () {
         bb.debug(1, 'archiver: %s is excluded, covered by gcc-source' % pn)
         return
 
-    ar_src = d.getVarFlag('ARCHIVER_MODE', 'src', True)
-    ar_dumpdata = d.getVarFlag('ARCHIVER_MODE', 'dumpdata', True)
-    ar_recipe = d.getVarFlag('ARCHIVER_MODE', 'recipe', True)
+    ar_src = d.getVarFlag('ARCHIVER_MODE', 'src')
+    ar_dumpdata = d.getVarFlag('ARCHIVER_MODE', 'dumpdata')
+    ar_recipe = d.getVarFlag('ARCHIVER_MODE', 'recipe')
 
     if ar_src == "original":
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_original' % pn)
@@ -104,7 +104,7 @@ python () {
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_recipe' % pn)
 
     # Output the srpm package
-    ar_srpm = d.getVarFlag('ARCHIVER_MODE', 'srpm', True)
+    ar_srpm = d.getVarFlag('ARCHIVER_MODE', 'srpm')
     if ar_srpm == "1":
         if d.getVar('PACKAGES') != '' and d.getVar('IMAGE_PKGTYPE') == 'rpm':
             d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_package_write_rpm' % pn)
@@ -127,7 +127,7 @@ python do_ar_original() {
 
     import shutil, tarfile, tempfile
 
-    if d.getVarFlag('ARCHIVER_MODE', 'src', True) != "original":
+    if d.getVarFlag('ARCHIVER_MODE', 'src') != "original":
         return
 
     ar_outdir = d.getVar('ARCHIVER_OUTDIR')
@@ -191,7 +191,7 @@ python do_ar_original() {
 
 python do_ar_patched() {
 
-    if d.getVarFlag('ARCHIVER_MODE', 'src', True) != 'patched':
+    if d.getVarFlag('ARCHIVER_MODE', 'src') != 'patched':
         return
 
     # Get the ARCHIVER_OUTDIR before we reset the WORKDIR
@@ -206,7 +206,7 @@ python do_ar_configured() {
     import shutil
 
     ar_outdir = d.getVar('ARCHIVER_OUTDIR')
-    if d.getVarFlag('ARCHIVER_MODE', 'src', True) == 'configured':
+    if d.getVarFlag('ARCHIVER_MODE', 'src') == 'configured':
         bb.note('Archiving the configured source...')
         pn = d.getVar('PN')
         # "gcc-source-${PV}" recipes don't have "do_configure"
@@ -226,12 +226,12 @@ python do_ar_configured() {
                 bb.build.exec_func('do_kernel_configme', d)
             if bb.data.inherits_class('cmake', d):
                 bb.build.exec_func('do_generate_toolchain_file', d)
-            prefuncs = d.getVarFlag('do_configure', 'prefuncs', True)
+            prefuncs = d.getVarFlag('do_configure', 'prefuncs')
             for func in (prefuncs or '').split():
                 if func != "sysroot_cleansstate":
                     bb.build.exec_func(func, d)
             bb.build.exec_func('do_configure', d)
-            postfuncs = d.getVarFlag('do_configure', 'postfuncs', True)
+            postfuncs = d.getVarFlag('do_configure', 'postfuncs')
             for func in (postfuncs or '').split():
                 if func != "do_qa_configure":
                     bb.build.exec_func(func, d)
@@ -283,7 +283,7 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
     # exclude.
     src_patched = src + '.patched'
     oe.path.copyhardlinktree(src, src_patched)
-    for i in d.getVarFlag('ARCHIVER_MODE', 'diff-exclude', True).split():
+    for i in d.getVarFlag('ARCHIVER_MODE', 'diff-exclude').split():
         bb.utils.remove(os.path.join(src_orig, i), recurse=True)
         bb.utils.remove(os.path.join(src_patched, i), recurse=True)
 
@@ -297,9 +297,9 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
 
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
-    if d.getVarFlag('ARCHIVER_MODE', 'src', True) not in \
+    if d.getVarFlag('ARCHIVER_MODE', 'src') not in \
             [ 'patched', 'configured'] and \
-            d.getVarFlag('ARCHIVER_MODE', 'diff', True) != '1':
+            d.getVarFlag('ARCHIVER_MODE', 'diff') != '1':
         return
     ar_outdir = d.getVar('ARCHIVER_OUTDIR')
     ar_workdir = d.getVar('ARCHIVER_WORKDIR')
@@ -318,7 +318,7 @@ python do_unpack_and_patch() {
         bb.build.exec_func('do_unpack', d)
 
     # Save the original source for creating the patches
-    if d.getVarFlag('ARCHIVER_MODE', 'diff', True) == '1':
+    if d.getVarFlag('ARCHIVER_MODE', 'diff') == '1':
         src = d.getVar('S').rstrip('/')
         src_orig = '%s.orig' % src
         oe.path.copytree(src, src_orig)
@@ -328,7 +328,7 @@ python do_unpack_and_patch() {
         bb.build.exec_func('do_patch', d)
 
     # Create the patches
-    if d.getVarFlag('ARCHIVER_MODE', 'diff', True) == '1':
+    if d.getVarFlag('ARCHIVER_MODE', 'diff') == '1':
         bb.note('Creating diff gz...')
         create_diff_gz(d, src_orig, src, ar_outdir)
         bb.utils.remove(src_orig, recurse=True)
diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index c6f4223..6513819 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -33,7 +33,7 @@ python blacklist_multilib_eventhandler() {
             continue
         for p in prefixes:
             newpkg = p + "-" + pkg
-            if not e.data.getVarFlag('PNBLACKLIST', newpkg, True):
+            if not e.data.getVarFlag('PNBLACKLIST', newpkg):
                 e.data.setVarFlag('PNBLACKLIST', newpkg, reason)
 }
 
diff --git a/meta/classes/compress_doc.bbclass b/meta/classes/compress_doc.bbclass
index 069db19..ba97721 100644
--- a/meta/classes/compress_doc.bbclass
+++ b/meta/classes/compress_doc.bbclass
@@ -40,8 +40,8 @@ python package_do_compress_doc() {
     compress_cmds = {}
     decompress_cmds = {}
     for mode in compress_list:
-        compress_cmds[mode] = d.getVarFlag('DOC_COMPRESS_CMD', mode, True)
-        decompress_cmds[mode] = d.getVarFlag('DOC_DECOMPRESS_CMD', mode, True)
+        compress_cmds[mode] = d.getVarFlag('DOC_COMPRESS_CMD', mode)
+        decompress_cmds[mode] = d.getVarFlag('DOC_DECOMPRESS_CMD', mode)
 
     mandir = os.path.abspath(dvar + os.sep + d.getVar("mandir"))
     if os.path.exists(mandir):
@@ -225,9 +225,9 @@ python compress_doc_updatealternatives () {
         old_names = (d.getVar('ALTERNATIVE_%s' % pkg) or "").split()
         new_names = []
         for old_name in old_names:
-            old_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', old_name, True)
-            old_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, old_name, True) or \
-                d.getVarFlag('ALTERNATIVE_TARGET', old_name, True) or \
+            old_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', old_name)
+            old_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, old_name) or \
+                d.getVarFlag('ALTERNATIVE_TARGET', old_name) or \
                 d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or \
                 d.getVar('ALTERNATIVE_TARGET') or \
                 old_link
@@ -241,10 +241,10 @@ python compress_doc_updatealternatives () {
                 new_target = old_target + '.' + compress_mode
                 d.delVarFlag('ALTERNATIVE_LINK_NAME', old_name)
                 d.setVarFlag('ALTERNATIVE_LINK_NAME', new_name, new_link)
-                if d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, old_name, True):
+                if d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, old_name):
                     d.delVarFlag('ALTERNATIVE_TARGET_%s' % pkg, old_name)
                     d.setVarFlag('ALTERNATIVE_TARGET_%s' % pkg, new_name, new_target)
-                elif d.getVarFlag('ALTERNATIVE_TARGET', old_name, True):
+                elif d.getVarFlag('ALTERNATIVE_TARGET', old_name):
                     d.delVarFlag('ALTERNATIVE_TARGET', old_name)
                     d.setVarFlag('ALTERNATIVE_TARGET', new_name, new_target)
                 elif d.getVar('ALTERNATIVE_TARGET_%s' % pkg):
diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 864ace4..4de7ea6 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -3,7 +3,7 @@ inherit terminal
 DEVSHELL = "${SHELL}"
 
 python do_devshell () {
-    if d.getVarFlag("do_devshell", "manualfakeroot", True):
+    if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")
        fakeenv = d.getVar("FAKEROOTENV").split()
        for f in fakeenv:
@@ -27,7 +27,7 @@ do_devshell[nostamp] = "1"
 # be done as the normal user. We therfore carefully construct the envionment
 # manually
 python () {
-    if d.getVarFlag("do_devshell", "fakeroot", True):
+    if d.getVarFlag("do_devshell", "fakeroot"):
        # We need to signal our code that we want fakeroot however we
        # can't manipulate the environment and variables here yet (see YOCTO #4795)
        d.setVarFlag("do_devshell", "manualfakeroot", "1")
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 5ba6c34..e115a47 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -69,7 +69,7 @@ python () {
             # Dummy value because the default function can't be called with blank SRC_URI
             d.setVar('SRCPV', '999')
 
-        tasks = filter(lambda k: d.getVarFlag(k, "task", True), d.keys())
+        tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
 
         for task in tasks:
             if task.endswith("_setscene"):
diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 3b79de5..85626f0 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -19,7 +19,7 @@ def image_buildinfo_outputvars(vars, listvars, d):
     ret = ""
     for var in vars:
         value = d.getVar(var) or ""
-        if (d.getVarFlag(var, 'type', True) == "list"):
+        if (d.getVarFlag(var, 'type') == "list"):
             value = oe.utils.squashspaces(value)
         ret += "%s = %s\n" % (var, value)
     return ret.rstrip('\n')
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 13c7bf9..d14e5a1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -51,7 +51,7 @@ FEATURE_PACKAGES_splash = "${SPLASH}"
 IMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("IMAGE_FEATURES", d)}'
 
 def check_image_features(d):
-    valid_features = (d.getVarFlag('IMAGE_FEATURES', 'validitems', True) or "").split()
+    valid_features = (d.getVarFlag('IMAGE_FEATURES', 'validitems') or "").split()
     valid_features += d.getVarFlags('COMPLEMENTARY_GLOB').keys()
     for var in d:
        if var.startswith("PACKAGE_GROUP_"):
@@ -578,7 +578,7 @@ python create_symlinks() {
     manifest_name = d.getVar('IMAGE_MANIFEST')
     taskname = d.getVar("BB_CURRENTTASK")
     subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
-    imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix', True) or d.expand("${IMAGE_NAME_SUFFIX}.")
+    imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix') or d.expand("${IMAGE_NAME_SUFFIX}.")
 
     if not link_name:
         return
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c5d1204..009ee4a 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -249,7 +249,7 @@ def get_boot_dependencies(d):
 
     for task in boot_tasks:
         boot_depends_string = "%s %s" % (boot_depends_string,
-                d.getVarFlag(task, "depends", True) or "")
+                d.getVarFlag(task, "depends") or "")
     boot_depends = [dep.split(":")[0] for dep
                 in boot_depends_string.split()
                 if not dep.split(":")[0].endswith("-native")]
@@ -431,10 +431,10 @@ def find_license_files(d):
         # unless NO_GENERIC_LICENSE is set.
         for lic_dir in license_source_dirs:
             if not os.path.isfile(os.path.join(lic_dir, license_type)):
-                if d.getVarFlag('SPDXLICENSEMAP', license_type, True) != None:
+                if d.getVarFlag('SPDXLICENSEMAP', license_type) != None:
                     # Great, there is an SPDXLICENSEMAP. We can copy!
                     bb.debug(1, "We need to use a SPDXLICENSEMAP for %s" % (license_type))
-                    spdx_generic = d.getVarFlag('SPDXLICENSEMAP', license_type, True)
+                    spdx_generic = d.getVarFlag('SPDXLICENSEMAP', license_type)
                     license_source = lic_dir
                     break
             elif os.path.isfile(os.path.join(lic_dir, license_type)):
@@ -442,7 +442,7 @@ def find_license_files(d):
                 license_source = lic_dir
                 break
 
-        non_generic_lic = d.getVarFlag('NO_GENERIC_LICENSE', license_type, True)
+        non_generic_lic = d.getVarFlag('NO_GENERIC_LICENSE', license_type)
         if spdx_generic and license_source:
             # we really should copy to generic_ + spdx_generic, however, that ends up messing the manifest
             # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)
@@ -451,7 +451,7 @@ def find_license_files(d):
 
             # The user may attempt to use NO_GENERIC_LICENSE for a generic license which doesn't make sense
             # and should not be allowed, warn the user in this case.
-            if d.getVarFlag('NO_GENERIC_LICENSE', license_type, True):
+            if d.getVarFlag('NO_GENERIC_LICENSE', license_type):
                 bb.warn("%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type))
 
         elif non_generic_lic and non_generic_lic in lic_chksums:
@@ -505,7 +505,7 @@ def return_spdx(d, license):
     """
     This function returns the spdx mapping of a license if it exists.
      """
-    return d.getVarFlag('SPDXLICENSEMAP', license, True)
+    return d.getVarFlag('SPDXLICENSEMAP', license)
 
 def canonical_license(d, license):
     """
@@ -514,7 +514,7 @@ def canonical_license(d, license):
     'X' if availabel and the tailing '+' (so GPLv3+ becomes GPL-3.0+), 
     or the passed license if there is no canonical form.
     """
-    lic = d.getVarFlag('SPDXLICENSEMAP', license, True) or ""
+    lic = d.getVarFlag('SPDXLICENSEMAP', license) or ""
     if not lic and license.endswith('+'):
         lic = d.getVarFlag('SPDXLICENSEMAP', license.rstrip('+'), True)
         if lic:
@@ -531,7 +531,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
     spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
     for wld_lic in wildcard_licenses:
         spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
-        licenses += [d.getVarFlag('SPDXLICENSEMAP', flag, True) for flag in spdxflags]
+        licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
 
     spdx_lics = (d.getVar('SRC_DISTRIBUTE_LICENSES', False) or '').split()
     for wld_lic in wildcard_licenses:
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2703465..1f79188 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -462,7 +462,7 @@ def get_package_additional_metadata (pkg_type, d):
         if d.getVar(key, False) is None:
             continue
         d.setVarFlag(key, "type", "list")
-        if d.getVarFlag(key, "separator", True) is None:
+        if d.getVarFlag(key, "separator") is None:
             d.setVarFlag(key, "separator", "\\n")
         metadata_fields = [field.strip() for field in oe.data.typed_value(key, d)]
         return "\n".join(metadata_fields).strip()
@@ -1963,7 +1963,7 @@ python package_depchains() {
 
     for suffix in pkgs:
         for pkg in pkgs[suffix]:
-            if d.getVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', True):
+            if d.getVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs'):
                 continue
             (base, func) = pkgs[suffix][pkg]
             if suffix == "-dev":
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 722c628..638cc1b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -86,14 +86,14 @@ python write_specfile () {
 
     # append information for logs and patches to %prep
     def add_prep(d,spec_files_bottom):
-        if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) == '1' and bb.data.inherits_class('archiver', d):
+        if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
             spec_files_bottom.append('%%prep -n %s' % d.getVar('PN') )
             spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
             spec_files_bottom.append('')
 
     # append the name of tarball to key word 'SOURCE' in xxx.spec.
     def tail_source(d):
-        if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) == '1' and bb.data.inherits_class('archiver', d):
+        if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
             ar_outdir = d.getVar('ARCHIVER_OUTDIR')
             if not os.path.exists(ar_outdir):
                 return
@@ -720,7 +720,7 @@ python do_package_rpm () {
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
-    if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) == '1' and bb.data.inherits_class('archiver', d):
+    if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
         cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
         cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_OUTDIR') + "'"
         cmdsrpm = cmdsrpm + " -bs " + outspecfile
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 3ff8b8f..1ffc416 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -58,7 +58,7 @@ python do_package_tar () {
 
 python () {
     if d.getVar('PACKAGES') != '':
-        deps = (d.getVarFlag('do_package_write_tar', 'depends', True) or "").split()
+        deps = (d.getVarFlag('do_package_write_tar', 'depends') or "").split()
         deps.append('tar-native:do_populate_sysroot')
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_package_write_tar', 'depends', " ".join(deps))
diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
index 3a12807..f30dc70 100644
--- a/meta/classes/packagefeed-stability.bbclass
+++ b/meta/classes/packagefeed-stability.bbclass
@@ -51,7 +51,7 @@ python() {
 
             d.appendVarFlag('do_build', 'recrdeptask', ' ' + pkgcomparefunc)
 
-            if d.getVarFlag(pkgwritefunc, 'noexec', True) or not d.getVarFlag(pkgwritefunc, 'task', True):
+            if d.getVarFlag(pkgwritefunc, 'noexec') or not d.getVarFlag(pkgwritefunc, 'task'):
                 # Packaging is disabled for this recipe, we shouldn't do anything
                 continue
 
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index d3c3c49..d533543 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -627,7 +627,7 @@ def get_ext_sdk_depends(d):
     pn = d.getVar('PN')
     deplist = ['%s:%s' % (pn, dep) for dep in deps]
     for task in ['do_image_complete', 'do_rootfs', 'do_build']:
-        deplist.extend((d.getVarFlag(task, 'depends', True) or '').split())
+        deplist.extend((d.getVarFlag(task, 'depends') or '').split())
     return ' '.join(deplist)
 
 python do_sdk_depends() {
@@ -650,7 +650,7 @@ def get_sdk_ext_rdepends(d):
     localdata = d.createCopy()
     localdata.appendVar('OVERRIDES', ':task-populate-sdk-ext')
     bb.data.update_data(localdata)
-    return localdata.getVarFlag('do_populate_sdk', 'rdepends', True)
+    return localdata.getVarFlag('do_populate_sdk', 'rdepends')
 
 do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 8c60398..6b60c46 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -28,7 +28,7 @@ MULTILIBRE_ALLOW_REP = "${OPKGLIBDIR}/opkg|/usr/lib/opkg"
 python () {
 
     if d.getVar('BUILD_IMAGES_FROM_FEEDS'):
-        flags = d.getVarFlag('do_rootfs', 'recrdeptask', True)
+        flags = d.getVarFlag('do_rootfs', 'recrdeptask')
         flags = flags.replace("do_package_write_ipk", "")
         flags = flags.replace("do_deploy", "")
         flags = flags.replace("do_populate_sysroot", "")
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 20beb7c..b8ff4cb 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -26,7 +26,7 @@ do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
 python () {
     if d.getVar('BUILD_IMAGES_FROM_FEEDS'):
-        flags = d.getVarFlag('do_rootfs', 'recrdeptask', True)
+        flags = d.getVarFlag('do_rootfs', 'recrdeptask')
         flags = flags.replace("do_package_write_rpm", "")
         flags = flags.replace("do_deploy", "")
         flags = flags.replace("do_populate_sysroot", "")
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 546e276..a7cd9ec 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -125,12 +125,12 @@ def sstate_state_fromvars(d, task = None):
 
     if task.startswith("do_"):
         task = task[3:]
-    inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs', True) or "").split()
-    outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs', True) or "").split()
-    plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs', True) or "").split()
-    lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile', True) or "").split()
-    lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared', True) or "").split()
-    interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs', True) or "").split()
+    inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs') or "").split()
+    outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs') or "").split()
+    plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs') or "").split()
+    lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile') or "").split()
+    lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared') or "").split()
+    interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs') or "").split()
     if not task or len(inputs) != len(outputs):
         bb.fatal("sstate variables not setup correctly?!")
 
@@ -425,7 +425,7 @@ def sstate_clean(ss, d):
 
     d2 = d.createCopy()
     stamp_clean = d.getVar("STAMPCLEAN")
-    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
+    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info')
     if extrainf:
         d2.setVar("SSTATE_MANMACH", extrainf)
         wildcard_stfile = "%s.do_%s*.%s" % (stamp_clean, ss['task'], extrainf)
diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 3f7b2de..e287f5a 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -58,7 +58,7 @@ def exportTests(d,tc):
     savedata["target"]["server_ip"] = tc.target.server_ip or d.getVar("TEST_SERVER_IP")
 
     keys = [ key for key in d.keys() if not key.startswith("_") and not key.startswith("BB") \
-            and not key.startswith("B_pn") and not key.startswith("do_") and not d.getVarFlag(key, "func", True)]
+            and not key.startswith("B_pn") and not key.startswith("do_") and not d.getVarFlag(key, "func")]
     for key in keys:
         try:
             savedata["d"][key] = d.getVar(key)
diff --git a/meta/classes/typecheck.bbclass b/meta/classes/typecheck.bbclass
index 6bff7c7..72da932 100644
--- a/meta/classes/typecheck.bbclass
+++ b/meta/classes/typecheck.bbclass
@@ -5,7 +5,7 @@
 python check_types() {
     import oe.types
     for key in e.data.keys():
-        if e.data.getVarFlag(key, "type", True):
+        if e.data.getVarFlag(key, "type"):
             oe.data.typed_value(key, e.data)
 }
 addhandler check_types
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 65da9da..0460bf0 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -133,12 +133,12 @@ python perform_packagecopy_append () {
         # If the src == dest, we know we need to rename the dest by appending ${BPN}
         link_rename = {}
         for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
-            alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name, True)
+            alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
             if not alt_link:
                 alt_link = "%s/%s" % (d.getVar('bindir'), alt_name)
                 d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link)
 
-            alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
+            alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name)
             alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
             # Sometimes alt_target is specified as relative to the link name.
             alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
@@ -198,13 +198,13 @@ python populate_packages_updatealternatives () {
         alt_setup_links = ""
         alt_remove_links = ""
         for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
-            alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name, True)
-            alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
+            alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
+            alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name)
             alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
             # Sometimes alt_target is specified as relative to the link name.
             alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
 
-            alt_priority = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg,  alt_name, True) or d.getVarFlag('ALTERNATIVE_PRIORITY',  alt_name, True)
+            alt_priority = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg,  alt_name) or d.getVarFlag('ALTERNATIVE_PRIORITY',  alt_name)
             alt_priority = alt_priority or d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg) or d.getVar('ALTERNATIVE_PRIORITY')
 
             # This shouldn't trigger, as it should have been resolved earlier!
@@ -247,8 +247,8 @@ python package_do_filedeps_append () {
 
     for pkg in packages.split():
         for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
-            alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name, True)
-            alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name, True) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name, True)
+            alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
+            alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name)
             alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
 
             if alt_link == alt_target:
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index 68e8217..da69c3a 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -4,12 +4,12 @@ python do_listtasks() {
     taskdescs = {}
     maxlen = 0
     for e in d.keys():
-        if d.getVarFlag(e, 'task', True):
+        if d.getVarFlag(e, 'task'):
             maxlen = max(maxlen, len(e))
             if e.endswith('_setscene'):
-                desc = "%s (setscene version)" % (d.getVarFlag(e[:-9], 'doc', True) or '')
+                desc = "%s (setscene version)" % (d.getVarFlag(e[:-9], 'doc') or '')
             else:
-                desc = d.getVarFlag(e, 'doc', True) or ''
+                desc = d.getVarFlag(e, 'doc') or ''
             taskdescs[e] = desc
 
     tasks = sorted(taskdescs.keys())
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 032f68a..4a67c45 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -3,7 +3,7 @@ import oe.maketype
 def typed_value(key, d):
     """Construct a value for the specified metadata variable, using its flags
     to determine the type and parameters for construction."""
-    var_type = d.getVarFlag(key, 'type', True)
+    var_type = d.getVarFlag(key, 'type')
     flags = d.getVarFlags(key)
     if flags is not None:
         flags = dict((flag, d.expand(value))
diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
index d68e5d3..4bc5d3e 100644
--- a/meta/lib/oe/packagegroup.py
+++ b/meta/lib/oe/packagegroup.py
@@ -3,9 +3,9 @@ import itertools
 def is_optional(feature, d):
     packages = d.getVar("FEATURE_PACKAGES_%s" % feature)
     if packages:
-        return bool(d.getVarFlag("FEATURE_PACKAGES_%s" % feature, "optional", True))
+        return bool(d.getVarFlag("FEATURE_PACKAGES_%s" % feature, "optional"))
     else:
-        return bool(d.getVarFlag("PACKAGE_GROUP_%s" % feature, "optional", True))
+        return bool(d.getVarFlag("PACKAGE_GROUP_%s" % feature, "optional"))
 
 def packages(features, d):
     for feature in features:
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index e053c37..bd11e2f 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -348,7 +348,7 @@ def sstate_get_manifest_filename(task, d):
     Also returns the datastore that can be used to query related variables.
     """
     d2 = d.createCopy()
-    extrainf = d.getVarFlag("do_" + task, 'stamp-extra-info', True)
+    extrainf = d.getVarFlag("do_" + task, 'stamp-extra-info')
     if extrainf:
         d2.setVar("SSTATE_MANMACH", extrainf)
     return (d2.expand("${SSTATE_MANFILEPREFIX}.%s" % task), d2)
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 575c5dc..1f85606 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -134,7 +134,7 @@ def determine_file_source(targetpath, rd):
         logger.debug('source path: %s' % srcpath)
         if not srcpath.startswith('/'):
             # Handle non-absolute path
-            srcpath = os.path.abspath(os.path.join(rd.getVarFlag('do_install', 'dirs', True).split()[-1], srcpath))
+            srcpath = os.path.abspath(os.path.join(rd.getVarFlag('do_install', 'dirs').split()[-1], srcpath))
         if srcpath.startswith(workdir):
             # OK, now we have the source file name, look for it in SRC_URI
             workdirfile = os.path.relpath(srcpath, workdir)
@@ -204,10 +204,10 @@ def get_source_path(cmdelements):
 def get_func_deps(func, d):
     """Find the function dependencies of a shell function"""
     deps = bb.codeparser.ShellParser(func, logger).parse_shell(d.getVar(func))
-    deps |= set((d.getVarFlag(func, "vardeps", True) or "").split())
+    deps |= set((d.getVarFlag(func, "vardeps") or "").split())
     funcdeps = []
     for dep in deps:
-        if d.getVarFlag(dep, 'func', True):
+        if d.getVarFlag(dep, 'func'):
             funcdeps.append(dep)
     return funcdeps
 
diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index 0741e18..a8f761d 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -97,7 +97,7 @@ if __name__=='__main__':
         result = []
         data = tinfoil.parse_recipe_file(fn)
         for key in data.keys():
-            if data.getVarFlag(key, "func", True) and not data.getVarFlag(key, "python", True):
+            if data.getVarFlag(key, "func") and not data.getVarFlag(key, "python"):
                 script = data.getVar(key, False)
                 if not script: continue
                 #print ("%s:%s" % (fn, key))
-- 
2.7.4


