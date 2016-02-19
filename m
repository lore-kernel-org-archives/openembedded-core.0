Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA66731A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:40:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50774187"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:40:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:39:02 +1300
Message-Id: <d42736ba21cec8274f7a9df586602f5584ee32ed.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/14] recipetool: create: improve CMake package mapping
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
X-List-Received-Date: Fri, 19 Feb 2016 09:40:08 -0000

* Package names are actually case sensitive near as I can tell, so we
  shouldn't be lowercasing them everywhere.
* Look for CMake packages in pkgdata and map those back to recipes,
  so we aren't dependent on the hardcoded mappings (though those are
  still preserved).
* Avoid duplicates in the unmapped package list

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py          | 15 +++++++++---
 scripts/lib/recipetool/create_buildsys.py | 39 ++++++++++++++++++++++---------
 2 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 3e4bab8..7560cdf 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -43,6 +43,7 @@ def tinfoil_init(instance):
 class RecipeHandler(object):
     recipelibmap = {}
     recipeheadermap = {}
+    recipecmakefilemap = {}
 
     @staticmethod
     def load_libmap(d):
@@ -90,15 +91,18 @@ class RecipeHandler(object):
         RecipeHandler.recipelibmap['GLESv2'] = 'virtual/libgles2'
 
     @staticmethod
-    def load_headermap(d):
-        '''Build up lib headerfile->recipe mapping'''
+    def load_devel_filemap(d):
+        '''Build up development file->recipe mapping'''
         if RecipeHandler.recipeheadermap:
             return
+        pkgdata_dir = d.getVar('PKGDATA_DIR', True)
         includedir = d.getVar('includedir', True)
+        cmakedir = os.path.join(d.getVar('libdir', True), 'cmake')
         for pkg in glob.glob(os.path.join(pkgdata_dir, 'runtime', '*-dev')):
             with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
                 pn = None
                 headers = []
+                cmakefiles = []
                 for line in f:
                     if line.startswith('PN:'):
                         pn = line.split(':', 1)[-1].strip()
@@ -108,9 +112,14 @@ class RecipeHandler(object):
                         for fullpth in sorted(dictval):
                             if fullpth.startswith(includedir) and fullpth.endswith('.h'):
                                 headers.append(os.path.relpath(fullpth, includedir))
+                            elif fullpth.startswith(cmakedir) and fullpth.endswith('.cmake'):
+                                cmakefiles.append(os.path.relpath(fullpth, cmakedir))
                 if pn and headers:
                     for header in headers:
                         RecipeHandler.recipeheadermap[header] = pn
+                if pn and cmakefiles:
+                    for fn in cmakefiles:
+                        RecipeHandler.recipecmakefilemap[fn] = pn
 
     @staticmethod
     def checkfiles(path, speclist, recursive=False):
@@ -172,7 +181,7 @@ class RecipeHandler(object):
                 deps.append(recipe)
             elif recipe is None:
                 if header:
-                    RecipeHandler.load_headermap(d)
+                    RecipeHandler.load_devel_filemap(d)
                     recipe = RecipeHandler.recipeheadermap.get(header, None)
                     if recipe:
                         deps.append(recipe)
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 1a06cac..43dcca3 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -17,6 +17,7 @@
 
 import re
 import logging
+import glob
 from recipetool.create import RecipeHandler, validate_pv
 
 logger = logging.getLogger('recipetool')
@@ -156,6 +157,16 @@ class CmakeRecipeHandler(RecipeHandler):
         subdir_re = re.compile('add_subdirectory\s*\(\s*([^)\s]*)\s*([^)\s]*)\s*\)', re.IGNORECASE)
         dep_re = re.compile('([^ ><=]+)( *[<>=]+ *[^ ><=]+)?')
 
+        def find_cmake_package(pkg):
+            RecipeHandler.load_devel_filemap(tinfoil.config_data)
+            for fn, pn in RecipeHandler.recipecmakefilemap.iteritems():
+                splitname = fn.split('/')
+                if len(splitname) > 1:
+                    if splitname[0].lower().startswith(pkg.lower()):
+                        if splitname[1] == '%s-config.cmake' % pkg.lower() or splitname[1] == '%sConfig.cmake' % pkg or splitname[1] == 'Find%s.cmake' % pkg:
+                            return pn
+            return None
+
         def interpret_value(value):
             return value.strip('"')
 
@@ -209,7 +220,7 @@ class CmakeRecipeHandler(RecipeHandler):
                     res = findpackage_re.match(line)
                     if res:
                         origpkg = res.group(1)
-                        pkg = interpret_value(origpkg.lower())
+                        pkg = interpret_value(origpkg)
                         found = False
                         for handler in handlers:
                             if handler.process_findpackage(srctree, fn, pkg, deps, outlines, inherits, values):
@@ -218,23 +229,29 @@ class CmakeRecipeHandler(RecipeHandler):
                                 break
                         if found:
                             continue
-                        elif pkg == 'gettext':
+                        elif pkg == 'Gettext':
                             inherits.append('gettext')
-                        elif pkg == 'perl':
+                        elif pkg == 'Perl':
                             inherits.append('perlnative')
-                        elif pkg == 'pkgconfig':
+                        elif pkg == 'PkgConfig':
                             inherits.append('pkgconfig')
-                        elif pkg == 'pythoninterp':
+                        elif pkg == 'PythonInterp':
                             inherits.append('pythonnative')
-                        elif pkg == 'pythonlibs':
+                        elif pkg == 'PythonLibs':
                             inherits.append('python-dir')
                         else:
-                            dep = cmake_pkgmap.get(pkg, None)
+                            # Try to map via looking at installed CMake packages in pkgdata
+                            dep = find_cmake_package(pkg)
                             if dep:
-                                logger.debug('Mapped CMake package %s to recipe %s via internal list' % (pkg, dep))
+                                logger.debug('Mapped CMake package %s to recipe %s via pkgdata' % (pkg, dep))
                                 deps.append(dep)
-                            elif dep is None:
-                                unmappedpkgs.append(origpkg)
+                            else:
+                                dep = cmake_pkgmap.get(pkg.lower(), None)
+                                if dep:
+                                    logger.debug('Mapped CMake package %s to recipe %s via internal list' % (pkg, dep))
+                                    deps.append(dep)
+                                elif dep is None:
+                                    unmappedpkgs.append(origpkg)
                         continue
                     res = checklib_re.match(line)
                     if res:
@@ -257,7 +274,7 @@ class CmakeRecipeHandler(RecipeHandler):
         parse_cmake_file(srcfiles[0])
 
         if unmappedpkgs:
-            outlines.append('# NOTE: unable to map the following CMake package dependencies: %s' % ' '.join(unmappedpkgs))
+            outlines.append('# NOTE: unable to map the following CMake package dependencies: %s' % ' '.join(list(set(unmappedpkgs))))
 
         RecipeHandler.handle_depends(libdeps, pcdeps, deps, outlines, values, tinfoil.config_data)
 
-- 
2.5.0


