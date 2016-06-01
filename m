Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A32CD7735D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZslP006905; Wed, 1 Jun 2016 13:35:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T3aHZQHGWhD9; Wed,  1 Jun 2016 13:35:55 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpAC006879
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000kp-Be; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:29 +0100
Message-Id: <1464784540-2786-11-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/22] scripts: Fix deprecated dict methods for python3
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
X-List-Received-Date: Wed, 01 Jun 2016 12:36:01 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Replaced iteritems -> items, itervalues -> values,
iterkeys -> keys or 'in'

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/recipeutils.py                       |  4 ++--
 scripts/buildhistory-collect-srcrevs             |  2 +-
 scripts/combo-layer                              |  2 +-
 scripts/contrib/bbvars.py                        | 10 +++++-----
 scripts/contrib/list-packageconfig-flags.py      |  4 ++--
 scripts/contrib/python/generate-manifest-2.7.py  |  4 ++--
 scripts/contrib/python/generate-manifest-3.5.py  |  4 ++--
 scripts/lib/devtool/__init__.py                  |  2 +-
 scripts/lib/devtool/standard.py                  | 14 +++++++-------
 scripts/lib/devtool/upgrade.py                   |  2 +-
 scripts/lib/recipetool/append.py                 |  8 ++++----
 scripts/lib/recipetool/create.py                 | 12 ++++++------
 scripts/lib/recipetool/create_buildsys.py        | 10 +++++-----
 scripts/lib/recipetool/create_buildsys_python.py | 18 +++++++++---------
 scripts/lib/recipetool/create_npm.py             |  4 ++--
 scripts/pythondeps                               |  2 +-
 16 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 632184f..1b85387 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -194,7 +194,7 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
     remainingnames = {}
     for k in values.keys():
         remainingnames[k] = get_recipe_pos(k)
-    remainingnames = OrderedDict(sorted(remainingnames.iteritems(), key=lambda x: x[1]))
+    remainingnames = OrderedDict(sorted(remainingnames.items(), key=lambda x: x[1]))
 
     modifying = False
 
@@ -234,7 +234,7 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
         if modifying:
             # Insert anything that should come before this variable
             pos = get_recipe_pos(varname)
-            for k in remainingnames.keys()[:]:
+            for k in list(remainingnames):
                 if remainingnames[k] > -1 and pos >= remainingnames[k] and not k in existingnames:
                     outputvalue(k, newlines, rewindcomments=True)
                     del remainingnames[k]
diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index f3eb76b..79d2657 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -103,7 +103,7 @@ def main():
                     if options.reportall or value != orig:
                         all_srcrevs[curdir].append((pn, name, srcrev))
 
-    for curdir, srcrevs in sorted(all_srcrevs.iteritems()):
+    for curdir, srcrevs in sorted(all_srcrevs.items()):
         if srcrevs:
             print('# %s' % curdir)
             for pn, name, srcrev in srcrevs:
diff --git a/scripts/combo-layer b/scripts/combo-layer
index e470592..52367f0 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -1178,7 +1178,7 @@ def update_with_history(conf, components, revisions, repos):
     # components imported head revision.
     if additional_heads:
         runcmd("git reset --hard", **wargs)
-        for rev, base in additional_heads.iteritems():
+        for rev, base in additional_heads.items():
             apply_commit(base, rev, wargs, wargs, None)
 
         # Commit with all component branches as parents as well as the previous head.
diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index 04f5023..6f47935 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -59,8 +59,8 @@ def collect_bbvars(metadir):
     for root,dirs,files in os.walk(metadir):
         for name in files:
             if name.find(".bb") >= 0:
-                for key in recipe_bbvars(os.path.join(root,name)).iterkeys():
-                    if bbvars.has_key(key):
+                for key in recipe_bbvars(os.path.join(root,name)).keys():
+                    if key in bbvars:
                         bbvars[key] = bbvars[key] + 1
                     else:
                         bbvars[key] = 1
@@ -155,15 +155,15 @@ def main():
 
     # Collect all the variable names from the recipes in the metadirs
     for m in metadirs:
-        for key,cnt in collect_bbvars(m).iteritems():
-            if bbvars.has_key(key):
+        for key,cnt in collect_bbvars(m).items():
+            if key in bbvars:
                 bbvars[key] = bbvars[key] + cnt
             else:
                 bbvars[key] = cnt
 
     # Check each var for documentation
     varlen = 0
-    for v in bbvars.iterkeys():
+    for v in bbvars.keys():
         if len(v) > varlen:
             varlen = len(v)
         if not bbvar_is_documented(v, docfiles):
diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 5dfe796..22d0c49 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -86,7 +86,7 @@ def collect_flags(pkg_dict):
     ''' Collect available PACKAGECONFIG flags and all affected pkgs '''
     # flag_dict = {'flag': ['pkg1', 'pkg2',...]}
     flag_dict = {}
-    for pkgname, flaglist in pkg_dict.iteritems():
+    for pkgname, flaglist in pkg_dict.items():
         for flag in flaglist:
             if flag in flag_dict:
                 flag_dict[flag].append(pkgname)
@@ -132,7 +132,7 @@ def display_all(data_dict):
             packageconfig = 'None'
         print('PACKAGECONFIG %s' % packageconfig)
 
-        for flag,flag_val in data_dict[fn].getVarFlags("PACKAGECONFIG").iteritems():
+        for flag,flag_val in data_dict[fn].getVarFlags("PACKAGECONFIG").items():
             if flag == "doc":
                 continue
             print('PACKAGECONFIG[%s] %s' % (flag, flag_val))
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 48be3a6..f2ecf8d 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -97,7 +97,7 @@ class MakefileMaker:
         # generate package variables
         #
 
-        for name, data in sorted(self.packages.iteritems()):
+        for name, data in sorted(self.packages.items()):
             desc, deps, files = data
 
             #
@@ -130,7 +130,7 @@ class MakefileMaker:
         self.out( 'SUMMARY_${PN}-modules="All Python modules"' )
         line = 'RDEPENDS_${PN}-modules="'
 
-        for name, data in sorted(self.packages.iteritems()):
+        for name, data in sorted(self.packages.items()):
             if name not in ['${PN}-dev', '${PN}-distutils-staticdev']:
                 line += "%s " % name
 
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index a7b38d2..41f209b 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -100,7 +100,7 @@ class MakefileMaker:
         # generate package variables
         #
 
-        for name, data in sorted(self.packages.iteritems()):
+        for name, data in sorted(self.packages.items()):
             desc, deps, files = data
 
             #
@@ -133,7 +133,7 @@ class MakefileMaker:
         self.out( 'SUMMARY_${PN}-modules="All Python modules"' )
         line = 'RDEPENDS_${PN}-modules="'
 
-        for name, data in sorted(self.packages.iteritems()):
+        for name, data in sorted(self.packages.items()):
             if name not in ['${PN}-dev', '${PN}-distutils-staticdev']:
                 line += "%s " % name
 
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index ff97dfc..506d95b 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -155,7 +155,7 @@ def check_workspace_recipe(workspace, pn, checksrc=True, bbclassextend=False):
 
     workspacepn = pn
 
-    for recipe, value in workspace.iteritems():
+    for recipe, value in workspace.items():
         if recipe == pn:
             break
         if bbclassextend:
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d6186b9..08153c6 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1091,11 +1091,11 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
         else:
             files_dir = os.path.join(os.path.dirname(recipefile),
                                      rd.getVar('BPN', True))
-            for basepath, path in upd_f.iteritems():
+            for basepath, path in upd_f.items():
                 logger.info('Updating file %s' % basepath)
                 _move_file(os.path.join(local_files_dir, basepath), path)
                 update_srcuri= True
-            for basepath, path in new_f.iteritems():
+            for basepath, path in new_f.items():
                 logger.info('Adding new file %s' % basepath)
                 _move_file(os.path.join(local_files_dir, basepath),
                            os.path.join(files_dir, basepath))
@@ -1173,11 +1173,11 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
                 logger.info('No patches or local source files needed updating')
         else:
             # Update existing files
-            for basepath, path in upd_f.iteritems():
+            for basepath, path in upd_f.items():
                 logger.info('Updating file %s' % basepath)
                 _move_file(os.path.join(local_files_dir, basepath), path)
                 updatefiles = True
-            for basepath, path in upd_p.iteritems():
+            for basepath, path in upd_p.items():
                 patchfn = os.path.join(patches_dir, basepath)
                 if changed_revs is not None:
                     # Avoid updating patches that have not actually changed
@@ -1192,13 +1192,13 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
             # Add any new files
             files_dir = os.path.join(os.path.dirname(recipefile),
                                      rd.getVar('BPN', True))
-            for basepath, path in new_f.iteritems():
+            for basepath, path in new_f.items():
                 logger.info('Adding new file %s' % basepath)
                 _move_file(os.path.join(local_files_dir, basepath),
                            os.path.join(files_dir, basepath))
                 srcuri.append('file://%s' % basepath)
                 updaterecipe = True
-            for basepath, path in new_p.iteritems():
+            for basepath, path in new_p.items():
                 logger.info('Adding new patch %s' % basepath)
                 _move_file(os.path.join(patches_dir, basepath),
                            os.path.join(files_dir, basepath))
@@ -1285,7 +1285,7 @@ def update_recipe(args, config, basepath, workspace):
 def status(args, config, basepath, workspace):
     """Entry point for the devtool 'status' subcommand"""
     if workspace:
-        for recipe, value in workspace.iteritems():
+        for recipe, value in workspace.items():
             recipefile = value['recipefile']
             if recipefile:
                 recipestr = ' (%s)' % recipefile
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 07a9018..66e5f59 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -70,7 +70,7 @@ def _remove_patch_dirs(recipefolder):
 def _recipe_contains(rd, var):
     rf = rd.getVar('FILE', True)
     varfiles = oe.recipeutils.get_var_files(rf, [var], rd)
-    for var, fn in varfiles.iteritems():
+    for var, fn in varfiles.items():
         if fn and fn.startswith(os.path.dirname(rf) + os.sep):
             return True
     return False
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 558fd25..35756b08 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -61,7 +61,7 @@ def find_target_file(targetpath, d, pkglist=None):
                       '/etc/gshadow': '/etc/gshadow should be managed through the useradd and extrausers classes',
                       '${sysconfdir}/hostname': '${sysconfdir}/hostname contents should be set by setting hostname_pn-base-files = "value" in configuration',}
 
-    for pthspec, message in invalidtargets.iteritems():
+    for pthspec, message in invalidtargets.items():
         if fnmatch.fnmatchcase(targetpath, d.expand(pthspec)):
             raise InvalidTargetFileError(d.expand(message))
 
@@ -152,7 +152,7 @@ def determine_file_source(targetpath, rd):
         # Check patches
         srcpatches = []
         patchedfiles = oe.recipeutils.get_recipe_patched_files(rd)
-        for patch, filelist in patchedfiles.iteritems():
+        for patch, filelist in patchedfiles.items():
             for fileitem in filelist:
                 if fileitem[0] == srcpath:
                     srcpatches.append((patch, fileitem[1]))
@@ -270,7 +270,7 @@ def appendfile(args):
     postinst_pns = []
 
     selectpn = None
-    for targetpath, pnlist in recipes.iteritems():
+    for targetpath, pnlist in recipes.items():
         for pn in pnlist:
             if pn.startswith('?'):
                 alternative_pns.append(pn[1:])
@@ -351,7 +351,7 @@ def appendsrc(args, files, rd, extralines=None):
 
     copyfiles = {}
     extralines = extralines or []
-    for newfile, srcfile in files.iteritems():
+    for newfile, srcfile in files.items():
         src_destdir = os.path.dirname(srcfile)
         if not args.use_workdir:
             if rd.getVar('S', True) == rd.getVar('STAGING_KERNEL_DIR', True):
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 4a59363..5a37d18 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -61,8 +61,8 @@ class RecipeHandler(object):
         libpaths = list(set([base_libdir, libdir]))
         libname_re = re.compile('^lib(.+)\.so.*$')
         pkglibmap = {}
-        for lib, item in shlib_providers.iteritems():
-            for path, pkg in item.iteritems():
+        for lib, item in shlib_providers.items():
+            for path, pkg in item.items():
                 if path in libpaths:
                     res = libname_re.match(lib)
                     if res:
@@ -74,7 +74,7 @@ class RecipeHandler(object):
 
         # Now turn it into a library->recipe mapping
         pkgdata_dir = d.getVar('PKGDATA_DIR', True)
-        for libname, pkg in pkglibmap.iteritems():
+        for libname, pkg in pkglibmap.items():
             try:
                 with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
                     for line in f:
@@ -663,7 +663,7 @@ def create_recipe(args):
         else:
             extraoutdir = os.path.join(os.path.dirname(outfile), pn)
         bb.utils.mkdirhier(extraoutdir)
-        for destfn, extrafile in extrafiles.iteritems():
+        for destfn, extrafile in extrafiles.items():
             shutil.move(extrafile, os.path.join(extraoutdir, destfn))
 
     lines = lines_before
@@ -901,7 +901,7 @@ def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=None, pn
     """
     pkglicenses = {pn: []}
     for license, licpath, _ in licvalues:
-        for pkgname, pkgpath in packages.iteritems():
+        for pkgname, pkgpath in packages.items():
             if licpath.startswith(pkgpath + '/'):
                 if pkgname in pkglicenses:
                     pkglicenses[pkgname].append(license)
@@ -928,7 +928,7 @@ def read_pkgconfig_provides(d):
             for line in f:
                 pkgmap[os.path.basename(line.rstrip())] = os.path.splitext(os.path.basename(fn))[0]
     recipemap = {}
-    for pc, pkg in pkgmap.iteritems():
+    for pc, pkg in pkgmap.items():
         pkgdatafile = os.path.join(pkgdatadir, 'runtime', pkg)
         if os.path.exists(pkgdatafile):
             with open(pkgdatafile, 'r') as f:
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 37d161e..8fc33e7 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -44,7 +44,7 @@ class CmakeRecipeHandler(RecipeHandler):
             classes.append('cmake')
             values = CmakeRecipeHandler.extract_cmake_deps(lines_before, srctree, extravalues)
             classes.extend(values.pop('inherit', '').split())
-            for var, value in values.iteritems():
+            for var, value in values.items():
                 lines_before.append('%s = "%s"' % (var, value))
             lines_after.append('# Specify any options you want to pass to cmake using EXTRA_OECMAKE:')
             lines_after.append('EXTRA_OECMAKE = ""')
@@ -159,7 +159,7 @@ class CmakeRecipeHandler(RecipeHandler):
 
         def find_cmake_package(pkg):
             RecipeHandler.load_devel_filemap(tinfoil.config_data)
-            for fn, pn in RecipeHandler.recipecmakefilemap.iteritems():
+            for fn, pn in RecipeHandler.recipecmakefilemap.items():
                 splitname = fn.split('/')
                 if len(splitname) > 1:
                     if splitname[0].lower().startswith(pkg.lower()):
@@ -348,7 +348,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
             autoconf = True
             values = AutotoolsRecipeHandler.extract_autotools_deps(lines_before, srctree, extravalues)
             classes.extend(values.pop('inherit', '').split())
-            for var, value in values.iteritems():
+            for var, value in values.items():
                 lines_before.append('%s = "%s"' % (var, value))
         else:
             conffile = RecipeHandler.checkfiles(srctree, ['configure'])
@@ -446,7 +446,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
         defines = {}
         def subst_defines(value):
             newvalue = value
-            for define, defval in defines.iteritems():
+            for define, defval in defines.items():
                 newvalue = newvalue.replace(define, defval)
             if newvalue != value:
                 return subst_defines(newvalue)
@@ -753,7 +753,7 @@ class MakefileRecipeHandler(RecipeHandler):
             if scanfile and os.path.exists(scanfile):
                 values = AutotoolsRecipeHandler.extract_autotools_deps(lines_before, srctree, acfile=scanfile)
                 classes.extend(values.pop('inherit', '').split())
-                for var, value in values.iteritems():
+                for var, value in values.items():
                     if var == 'DEPENDS':
                         lines_before.append('# NOTE: some of these dependencies may be optional, check the Makefile and/or upstream documentation')
                     lines_before.append('%s = "%s"' % (var, value))
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index c382330..cc3b5a4 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -238,7 +238,7 @@ class PythonRecipeHandler(RecipeHandler):
 
         # Map PKG-INFO & setup.py fields to bitbake variables
         bbinfo = {}
-        for field, values in info.iteritems():
+        for field, values in info.items():
             if field in self.excluded_fields:
                 continue
 
@@ -294,8 +294,8 @@ class PythonRecipeHandler(RecipeHandler):
                 lines_after.append('# The upstream names may not correspond exactly to bitbake package names.')
                 lines_after.append('#')
                 lines_after.append('# Uncomment this line to enable all the optional features.')
-                lines_after.append('#PACKAGECONFIG ?= "{}"'.format(' '.join(k.lower() for k in extras_req.iterkeys())))
-                for feature, feature_reqs in extras_req.iteritems():
+                lines_after.append('#PACKAGECONFIG ?= "{}"'.format(' '.join(k.lower() for k in extras_req)))
+                for feature, feature_reqs in extras_req.items():
                     unmapped_deps.difference_update(feature_reqs)
 
                     feature_req_deps = ('python-' + r.replace('.', '-').lower() for r in sorted(feature_reqs))
@@ -442,8 +442,8 @@ class PythonRecipeHandler(RecipeHandler):
                     del info[variable]
                 elif new_value != value:
                     info[variable] = new_value
-            elif hasattr(value, 'iteritems'):
-                for dkey, dvalue in value.iteritems():
+            elif hasattr(value, 'items'):
+                for dkey, dvalue in value.items():
                     new_list = []
                     for pos, a_value in enumerate(dvalue):
                         new_value = replace_value(search, replace, a_value)
@@ -558,7 +558,7 @@ class PythonRecipeHandler(RecipeHandler):
                 else:
                     continue
 
-            for fn in files_info.iterkeys():
+            for fn in files_info:
                 for suffix in suffixes:
                     if fn.endswith(suffix):
                         break
@@ -640,7 +640,7 @@ class SetupScriptVisitor(ast.NodeVisitor):
     def visit_setup(self, node):
         call = LiteralAstTransform().visit(node)
         self.keywords = call.keywords
-        for k, v in self.keywords.iteritems():
+        for k, v in self.keywords.items():
             if has_non_literals(v):
                self.non_literals.append(k)
 
@@ -708,8 +708,8 @@ def has_non_literals(value):
         return True
     elif isinstance(value, basestring):
         return False
-    elif hasattr(value, 'itervalues'):
-        return any(has_non_literals(v) for v in value.itervalues())
+    elif hasattr(value, 'values'):
+        return any(has_non_literals(v) for v in value.values())
     elif hasattr(value, '__iter__'):
         return any(has_non_literals(v) for v in value)
 
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index ffbcb49..fcc0172 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -128,7 +128,7 @@ class NpmRecipeHandler(RecipeHandler):
                     license = self._handle_license(data)
                     if license:
                         licenses['${PN}'] = license
-                    for pkgname, pkgitem in npmpackages.iteritems():
+                    for pkgname, pkgitem in npmpackages.items():
                         _, pdata = pkgitem
                         license = self._handle_license(pdata)
                         if license:
@@ -136,7 +136,7 @@ class NpmRecipeHandler(RecipeHandler):
                     # Now write out the package-specific license values
                     # We need to strip out the json data dicts for this since split_pkg_licenses
                     # isn't expecting it
-                    packages = OrderedDict((x,y[0]) for x,y in npmpackages.iteritems())
+                    packages = OrderedDict((x,y[0]) for x,y in npmpackages.items())
                     packages['${PN}'] = ''
                     pkglicenses = split_pkg_licenses(licvalues, packages, lines_after, licenses)
                     all_licenses = list(set([item for pkglicense in pkglicenses.values() for item in pkglicense]))
diff --git a/scripts/pythondeps b/scripts/pythondeps
index ff92e74..f1e6452 100755
--- a/scripts/pythondeps
+++ b/scripts/pythondeps
@@ -187,7 +187,7 @@ def get_depends_recursive(directory):
     directory = os.path.realpath(directory)
 
     provides = dict((v, k) for k, v in get_provides(directory))
-    for filename, provide in provides.iteritems():
+    for filename, provide in provides.items():
         if os.path.isdir(filename):
             filename = os.path.join(filename, '__init__.py')
             ispkg = True
-- 
2.5.0


