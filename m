Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8565B7730D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZeIS006852; Wed, 1 Jun 2016 13:35:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id m2mk02e4tkjX; Wed,  1 Jun 2016 13:35:55 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpGM006873
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000kL-89; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:23 +0100
Message-Id: <1464784540-2786-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/22] classes/lib: Update to explictly create lists where needed
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
X-List-Received-Date: Wed, 01 Jun 2016 12:35:58 -0000

Iterators now return views, not lists in python3. Where we need
lists, handle this explicitly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass |  2 +-
 meta/classes/license.bbclass      |  2 +-
 meta/classes/package.bbclass      |  4 +--
 meta/lib/oe/classutils.py         |  2 +-
 meta/lib/oe/copy_buildsystem.py   |  2 +-
 meta/lib/oe/distro_check.py       |  4 +--
 meta/lib/oe/license.py            | 10 +++----
 meta/lib/oe/manifest.py           |  4 +--
 meta/lib/oe/package_manager.py    |  6 ++---
 meta/lib/oe/packagedata.py        |  2 +-
 meta/lib/oe/packagegroup.py       |  4 +--
 meta/lib/oe/prservice.py          |  4 +--
 meta/lib/oe/recipeutils.py        |  6 ++---
 meta/lib/oe/rootfs.py             |  4 +--
 meta/lib/oe/sstatesig.py          |  2 +-
 meta/lib/oe/utils.py              |  6 ++---
 meta/lib/oeqa/selftest/pkgdata.py | 56 +++++++++++++++++++--------------------
 meta/lib/oeqa/utils/qemurunner.py |  2 +-
 scripts/lib/devtool/standard.py   | 12 ++++-----
 scripts/oe-selftest               |  2 +-
 20 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index cc233b5..1ccd9ee 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -274,7 +274,7 @@ python buildhistory_emit_pkghistory() {
         # Gather information about packaged files
         val = pkgdata.get('FILES_INFO', '')
         dictval = json.loads(val)
-        filelist = dictval.keys()
+        filelist = list(dictval.keys())
         filelist.sort()
         pkginfo.filelist = " ".join(filelist)
 
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 538ab19..10d6ed8 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -635,7 +635,7 @@ def check_license_format(d):
     licenses = d.getVar('LICENSE', True)
     from oe.license import license_operator, license_operator_chars, license_pattern
 
-    elements = filter(lambda x: x.strip(), license_operator.split(licenses))
+    elements = list(filter(lambda x: x.strip(), license_operator.split(licenses)))
     for pos, element in enumerate(elements):
         if license_pattern.match(element):
             if pos > 0 and license_pattern.match(elements[pos - 1]):
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 501004e..c9e2aa8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1504,7 +1504,7 @@ python package_do_shlibs() {
             m = re.match("\s+RPATH\s+([^\s]*)", l)
             if m:
                 rpaths = m.group(1).replace("$ORIGIN", ldir).split(":")
-                rpath = map(os.path.normpath, rpaths)
+                rpath = list(map(os.path.normpath, rpaths))
         for l in lines:
             m = re.match("\s+NEEDED\s+([^\s]*)", l)
             if m:
@@ -1674,7 +1674,7 @@ python package_do_shlibs() {
                 bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n[0]))
                 continue
             if n[0] in shlib_provider.keys():
-                shlib_provider_path = list()
+                shlib_provider_path = []
                 for k in shlib_provider[n[0]].keys():
                     shlib_provider_path.append(k)
                 match = None
diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
index 58188fd..98bb059 100644
--- a/meta/lib/oe/classutils.py
+++ b/meta/lib/oe/classutils.py
@@ -34,7 +34,7 @@ abstract base classes out of the registry)."""
 
     @classmethod
     def prioritized(tcls):
-        return sorted(tcls.registry.values(),
+        return sorted(list(tcls.registry.values()),
                       key=lambda v: v.priority, reverse=True)
 
     def unregister(cls):
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 0589b7f..eddf5bb 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -195,7 +195,7 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
                     fulltypes.append(typename)
             f.write('SIGGEN_LOCKEDSIGS_TYPES = "%s"\n' % ' '.join(fulltypes))
 
-    write_sigs_file(copy_output, tocopy.keys(), tocopy)
+    write_sigs_file(copy_output, list(tocopy.keys()), tocopy)
     if merged_output:
         write_sigs_file(merged_output, arch_order, merged)
 
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 8655a6f..ba1bba6 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -104,8 +104,8 @@ def get_source_package_list_from_url(url, section, d):
 
     bb.note("Reading %s: %s" % (url, section))
     links = get_links_from_url(url, d)
-    srpms = filter(is_src_rpm, links)
-    names_list = map(package_name_from_srpm, srpms)
+    srpms = list(filter(is_src_rpm, links))
+    names_list = list(map(package_name_from_srpm, srpms))
 
     new_pkgs = []
     for pkgs in names_list:
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index f0f661c..39ef965 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -47,7 +47,7 @@ class LicenseVisitor(ast.NodeVisitor):
     """Get elements based on OpenEmbedded license strings"""
     def get_elements(self, licensestr):
         new_elements = []
-        elements = filter(lambda x: x.strip(), license_operator.split(licensestr))
+        elements = list([x for x in license_operator.split(licensestr) if x.strip()])
         for pos, element in enumerate(elements):
             if license_pattern.match(element):
                 if pos > 0 and license_pattern.match(elements[pos-1]):
@@ -118,8 +118,8 @@ def is_included(licensestr, whitelist=None, blacklist=None):
     def choose_licenses(alpha, beta):
         """Select the option in an OR which is the 'best' (has the most
         included licenses)."""
-        alpha_weight = len(filter(include_license, alpha))
-        beta_weight = len(filter(include_license, beta))
+        alpha_weight = len(list(filter(include_license, alpha)))
+        beta_weight = len(list(filter(include_license, beta)))
         if alpha_weight > beta_weight:
             return alpha
         else:
@@ -132,8 +132,8 @@ def is_included(licensestr, whitelist=None, blacklist=None):
         blacklist = []
 
     licenses = flattened_licenses(licensestr, choose_licenses)
-    excluded = filter(lambda lic: exclude_license(lic), licenses)
-    included = filter(lambda lic: include_license(lic), licenses)
+    excluded = [lic for lic in licenses if exclude_license(lic)]
+    included = [lic for lic in licenses if include_license(lic)]
     if excluded:
         return False, excluded
     else:
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 42832f1..ec2ef50 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -219,7 +219,7 @@ class RpmManifest(Manifest):
                 if var in self.vars_to_split:
                     split_pkgs = self._split_multilib(self.d.getVar(var, True))
                     if split_pkgs is not None:
-                        pkgs = dict(pkgs.items() + split_pkgs.items())
+                        pkgs = dict(list(pkgs.items()) + list(split_pkgs.items()))
                 else:
                     pkg_list = self.d.getVar(var, True)
                     if pkg_list is not None:
@@ -269,7 +269,7 @@ class OpkgManifest(Manifest):
                 if var in self.vars_to_split:
                     split_pkgs = self._split_multilib(self.d.getVar(var, True))
                     if split_pkgs is not None:
-                        pkgs = dict(pkgs.items() + split_pkgs.items())
+                        pkgs = dict(list(pkgs.items()) + list(split_pkgs.items()))
                 else:
                     pkg_list = self.d.getVar(var, True)
                     if pkg_list is not None:
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index abe9f68..54e6970 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -643,8 +643,8 @@ class PackageManager(object):
     def construct_uris(self, uris, base_paths):
         def _append(arr1, arr2, sep='/'):
             res = []
-            narr1 = map(lambda a: string.rstrip(a, sep), arr1)
-            narr2 = map(lambda a: string.lstrip(string.rstrip(a, sep), sep), arr2)
+            narr1 = [string.rstrip(a, sep) for a in arr1]
+            narr2 = [string.lstrip(string.rstrip(a, sep), sep) for a in arr2]
             for a1 in narr1:
                 if arr2:
                     for a2 in narr2:
@@ -1111,7 +1111,7 @@ class RpmPM(PackageManager):
             sub_rdep = sub_data.get("RDEPENDS_" + pkg)
             if not sub_rdep:
                 continue
-            done = bb.utils.explode_dep_versions2(sub_rdep).keys()
+            done = list(bb.utils.explode_dep_versions2(sub_rdep).keys())
             next = done
             # Find all the rdepends on dependency chain
             while next:
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index df1b4c5..21d4de9 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -66,7 +66,7 @@ def _pkgmap(d):
         bb.warn("No files in %s?" % pkgdatadir)
         files = []
 
-    for pn in filter(lambda f: not os.path.isdir(os.path.join(pkgdatadir, f)), files):
+    for pn in [f for f in files if not os.path.isdir(os.path.join(pkgdatadir, f))]:
         try:
             pkgdata = read_pkgdatafile(os.path.join(pkgdatadir, pn))
         except OSError:
diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
index a6fee5f..9781927 100644
--- a/meta/lib/oe/packagegroup.py
+++ b/meta/lib/oe/packagegroup.py
@@ -16,11 +16,11 @@ def packages(features, d):
             yield pkg
 
 def required_packages(features, d):
-    req = filter(lambda feature: not is_optional(feature, d), features)
+    req = [feature for feature in features if not is_optional(feature, d)]
     return packages(req, d)
 
 def optional_packages(features, d):
-    opt = filter(lambda feature: is_optional(feature, d), features)
+    opt = [feature for feature in features if is_optional(feature, d)]
     return packages(opt, d)
 
 def active_packages(features, d):
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 9e5a0c9..0054f95 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -1,7 +1,7 @@
 
 def prserv_make_conn(d, check = False):
     import prserv.serv
-    host_params = filter(None, (d.getVar("PRSERV_HOST", True) or '').split(':'))
+    host_params = list([_f for _f in (d.getVar("PRSERV_HOST", True) or '').split(':') if _f])
     try:
         conn = None
         conn = prserv.serv.PRServerConnection(host_params[0], int(host_params[1]))
@@ -114,7 +114,7 @@ def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
     bb.utils.unlockfile(lf)
 
 def prserv_check_avail(d):
-    host_params = filter(None, (d.getVar("PRSERV_HOST", True) or '').split(':'))
+    host_params = list([_f for _f in (d.getVar("PRSERV_HOST", True) or '').split(':') if _f])
     try:
         if len(host_params) != 2:
             raise TypeError
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index b437720..146fe83 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -692,7 +692,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
 
         varnames = [item[0] for item in bbappendlines]
         if removevalues:
-            varnames.extend(removevalues.keys())
+            varnames.extend(list(removevalues.keys()))
 
         with open(appendpath, 'r') as f:
             (updated, newlines) = bb.utils.edit_metadata(f, varnames, appendfile_varfunc)
@@ -743,12 +743,12 @@ def replace_dir_vars(path, d):
     """Replace common directory paths with appropriate variable references (e.g. /etc becomes ${sysconfdir})"""
     dirvars = {}
     # Sort by length so we get the variables we're interested in first
-    for var in sorted(d.keys(), key=len):
+    for var in sorted(list(d.keys()), key=len):
         if var.endswith('dir') and var.lower() == var:
             value = d.getVar(var, True)
             if value.startswith('/') and not '\n' in value and value not in dirvars:
                 dirvars[value] = var
-    for dirpath in sorted(dirvars.keys(), reverse=True):
+    for dirpath in sorted(list(dirvars.keys()), reverse=True):
         path = path.replace(dirpath, '${%s}' % dirvars[dirpath])
     return path
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 7087b12..d934858 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -536,7 +536,7 @@ class DpkgOpkgRootfs(Rootfs):
                     pkg_depends = m_depends.group(1)
 
         # remove package dependencies not in postinsts
-        pkg_names = pkgs.keys()
+        pkg_names = list(pkgs.keys())
         for pkg_name in pkg_names:
             deps = pkgs[pkg_name][:]
 
@@ -569,7 +569,7 @@ class DpkgOpkgRootfs(Rootfs):
             pkgs = self._get_pkgs_postinsts(status_file)
         if pkgs:
             root = "__packagegroup_postinst__"
-            pkgs[root] = pkgs.keys()
+            pkgs[root] = list(pkgs.keys())
             _dep_resolve(pkgs, root, pkg_list, [])
             pkg_list.remove(root)
 
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 500122d..a58f03a 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -210,7 +210,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
                         continue
                     f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
                 f.write('    "\n')
-            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
+            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(list(types.keys()))))
 
     def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
         warn_msgs = []
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 32d6179..1bbdbb4 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -85,11 +85,11 @@ def prune_suffix(var, suffixes, d):
 
 def str_filter(f, str, d):
     from re import match
-    return " ".join(filter(lambda x: match(f, x, 0), str.split()))
+    return " ".join([x for x in str.split() if match(f, x, 0)])
 
 def str_filter_out(f, str, d):
     from re import match
-    return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
+    return " ".join([x for x in str.split() if not match(f, x, 0)])
 
 def param_bool(cfg, field, dflt = None):
     """Lookup <field> in <cfg> map and convert it to a boolean; take
@@ -134,7 +134,7 @@ def packages_filter_out_system(d):
     PN-dbg PN-doc PN-locale-eb-gb removed.
     """
     pn = d.getVar('PN', True)
-    blacklist = map(lambda suffix: pn + suffix, ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev'))
+    blacklist = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev')]
     localepkg = pn + "-locale-"
     pkgs = []
 
diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
index 138b03a..5a63f89 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -131,15 +131,15 @@ class OePkgdataUtilTests(oeSelfTest):
         # Test recipe-space package name
         result = runCmd('oe-pkgdata-util list-pkg-files zlib-dev zlib-doc')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dev', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         # Test runtime package name
         result = runCmd('oe-pkgdata-util list-pkg-files -r libz1 libz-dev')
         files = splitoutput(result.output)
-        self.assertIn('libz1', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
         self.assertGreater(len(files['libz1']), 1)
         libspec = os.path.join(base_libdir, 'libz.so.1.*')
         found = False
@@ -152,12 +152,12 @@ class OePkgdataUtilTests(oeSelfTest):
         # Test recipe
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dbg', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-dev', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-staticdev', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertNotIn('zlib-locale', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertNotIn('zlib-locale', list(files.keys()), "listed pkgs. files: %s" %result.output)
         # (ignore ptest, might not be there depending on config)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
@@ -165,36 +165,36 @@ class OePkgdataUtilTests(oeSelfTest):
         # Test recipe, runtime
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r')
         files = splitoutput(result.output)
-        self.assertIn('libz-dbg', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-doc', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-staticdev', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz1', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertNotIn('libz-locale', files.keys(), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertNotIn('libz-locale', list(files.keys()), "listed pkgs. files: %s" %result.output)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
         # Test recipe, unpackaged
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -u')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dbg', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-dev', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-staticdev', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-locale', files.keys(), "listed pkgs. files: %s" %result.output) # this is the key one
+        self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-locale', list(files.keys()), "listed pkgs. files: %s" %result.output) # this is the key one
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['zlib-staticdev'])
         # Test recipe, runtime, unpackaged
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r -u')
         files = splitoutput(result.output)
-        self.assertIn('libz-dbg', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-doc', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-staticdev', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz1', files.keys(), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-locale', files.keys(), "listed pkgs. files: %s" %result.output) # this is the key one
+        self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-locale', list(files.keys()), "listed pkgs. files: %s" %result.output) # this is the key one
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index f51de99..c1d07d9 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -22,7 +22,7 @@ import logging
 logger = logging.getLogger("BitBake.QemuRunner")
 
 # Get Unicode non printable control chars
-control_range = range(0,32)+range(127,160)
+control_range = list(range(0,32))+list(range(127,160))
 control_chars = [unichr(x) for x in control_range
                 if unichr(x) not in string.printable]
 re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 3be3214..18847cf 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -321,7 +321,7 @@ def _git_exclude_path(srctree, path):
     # becomes greater than that.
     path = os.path.normpath(path)
     recurse = True if len(path.split(os.path.sep)) > 1 else False
-    git_files = _git_ls_tree(srctree, 'HEAD', recurse).keys()
+    git_files = list(_git_ls_tree(srctree, 'HEAD', recurse).keys())
     if path in git_files:
         git_files.remove(path)
         return git_files
@@ -1073,14 +1073,14 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
                                                   patches_dir)
 
             # Remove deleted local files and "overlapping" patches
-            remove_files = del_f.values() + upd_p.values()
+            remove_files = list(del_f.values()) + list(upd_p.values())
             if remove_files:
                 removedentries = _remove_file_entries(srcuri, remove_files)[0]
                 update_srcuri = True
 
         if args.append:
             files = dict((os.path.join(local_files_dir, key), val) for
-                          key, val in upd_f.items() + new_f.items())
+                          key, val in list(upd_f.items()) + list(new_f.items()))
             removevalues = {}
             if update_srcuri:
                 removevalues  = {'SRC_URI': removedentries}
@@ -1142,7 +1142,7 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
             upd_p, new_p, del_p = _export_patches(srctree, rd, initial_rev,
                                                   all_patches_dir)
             # Remove deleted local files and  patches
-            remove_files = del_f.values() + del_p.values()
+            remove_files = list(del_f.values()) + list(del_p.values())
 
         # Get updated patches from source tree
         patches_dir = tempfile.mkdtemp(dir=tempdir)
@@ -1154,9 +1154,9 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
         srcuri = (rd.getVar('SRC_URI', False) or '').split()
         if args.append:
             files = dict((os.path.join(local_files_dir, key), val) for
-                         key, val in upd_f.items() + new_f.items())
+                         key, val in list(upd_f.items()) + list(new_f.items()))
             files.update(dict((os.path.join(patches_dir, key), val) for
-                              key, val in upd_p.items() + new_p.items()))
+                              key, val in list(upd_p.items()) + list(new_p.items())))
             if files or remove_files:
                 removevalues = None
                 if remove_files:
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 00ef51f..db132fd 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -211,7 +211,7 @@ def get_tests_from_module(tmod):
     try:
         import importlib
         modlib = importlib.import_module(tmod)
-        for mod in vars(modlib).values():
+        for mod in list(vars(modlib).values()):
             if isinstance(mod, type(oeSelfTest)) and issubclass(mod, oeSelfTest) and mod is not oeSelfTest:
                 for test in dir(mod):
                     if test.startswith('test_') and hasattr(vars(mod)[test], '__call__'):
-- 
2.5.0


