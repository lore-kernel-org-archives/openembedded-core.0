Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9E71273183
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:19:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 03:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635440031"
Received: from stan94-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.176])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 03:19:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 00:18:31 +1300
Message-Id: <ddb77c57393deaed95e5cefcbfa784097872199f.1453115842.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/10] recipetool: create: move dependency mapping code to RecipeHandler
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
X-List-Received-Date: Mon, 18 Jan 2016 11:19:19 -0000

Some refactoring to allow access to the library/header/pkg-config
mappings and the DEPENDS / unmapped dependency output code from other
classes than AutotoolsRecipeHandler.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py          | 137 +++++++++++++++++++++++++++++-
 scripts/lib/recipetool/create_buildsys.py | 121 ++------------------------
 2 files changed, 144 insertions(+), 114 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1218a7d..dab917f 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -21,6 +21,7 @@ import argparse
 import glob
 import fnmatch
 import re
+import json
 import logging
 import scriptutils
 import urlparse
@@ -39,7 +40,73 @@ def tinfoil_init(instance):
     global tinfoil
     tinfoil = instance
 
-class RecipeHandler():
+class RecipeHandler(object):
+    recipelibmap = {}
+    recipeheadermap = {}
+
+    @staticmethod
+    def load_libmap(d):
+        '''Load library->recipe mapping'''
+        import oe.package
+
+        if RecipeHandler.recipelibmap:
+            return
+        # First build up library->package mapping
+        shlib_providers = oe.package.read_shlib_providers(d)
+        libdir = d.getVar('libdir', True)
+        base_libdir = d.getVar('base_libdir', True)
+        libpaths = list(set([base_libdir, libdir]))
+        libname_re = re.compile('^lib(.+)\.so.*$')
+        pkglibmap = {}
+        for lib, item in shlib_providers.iteritems():
+            for path, pkg in item.iteritems():
+                if path in libpaths:
+                    res = libname_re.match(lib)
+                    if res:
+                        libname = res.group(1)
+                        if not libname in pkglibmap:
+                            pkglibmap[libname] = pkg[0]
+                    else:
+                        logger.debug('unable to extract library name from %s' % lib)
+
+        # Now turn it into a library->recipe mapping
+        pkgdata_dir = d.getVar('PKGDATA_DIR', True)
+        for libname, pkg in pkglibmap.iteritems():
+            try:
+                with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
+                    for line in f:
+                        if line.startswith('PN:'):
+                            RecipeHandler.recipelibmap[libname] = line.split(':', 1)[-1].strip()
+                            break
+            except IOError as ioe:
+                if ioe.errno == 2:
+                    logger.warn('unable to find a pkgdata file for package %s' % pkg)
+                else:
+                    raise
+
+    @staticmethod
+    def load_headermap(d):
+        '''Build up lib headerfile->recipe mapping'''
+        if RecipeHandler.recipeheadermap:
+            return
+        includedir = d.getVar('includedir', True)
+        for pkg in glob.glob(os.path.join(pkgdata_dir, 'runtime', '*-dev')):
+            with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
+                pn = None
+                headers = []
+                for line in f:
+                    if line.startswith('PN:'):
+                        pn = line.split(':', 1)[-1].strip()
+                    elif line.startswith('FILES_INFO:'):
+                        val = line.split(':', 1)[1].strip()
+                        dictval = json.loads(val)
+                        for fullpth in sorted(dictval):
+                            if fullpth.startswith(includedir) and fullpth.endswith('.h'):
+                                headers.append(os.path.relpath(fullpth, includedir))
+                if pn and headers:
+                    for header in headers:
+                        RecipeHandler.recipeheadermap[header] = pn
+
     @staticmethod
     def checkfiles(path, speclist, recursive=False):
         results = []
@@ -54,6 +121,74 @@ class RecipeHandler():
                 results.extend(glob.glob(os.path.join(path, spec)))
         return results
 
+    @staticmethod
+    def handle_depends(libdeps, pcdeps, deps, outlines, values, d):
+        if pcdeps:
+            recipemap = read_pkgconfig_provides(d)
+        if libdeps:
+            RecipeHandler.load_libmap(d)
+
+        ignorelibs = ['socket']
+        ignoredeps = ['gcc-runtime', 'glibc', 'uclibc', 'musl', 'tar-native', 'binutils-native']
+
+        unmappedpc = []
+        pcdeps = list(set(pcdeps))
+        for pcdep in pcdeps:
+            if isinstance(pcdep, basestring):
+                recipe = recipemap.get(pcdep, None)
+                if recipe:
+                    deps.append(recipe)
+                else:
+                    if not pcdep.startswith('$'):
+                        unmappedpc.append(pcdep)
+            else:
+                for item in pcdep:
+                    recipe = recipemap.get(pcdep, None)
+                    if recipe:
+                        deps.append(recipe)
+                        break
+                else:
+                    unmappedpc.append('(%s)' % ' or '.join(pcdep))
+
+        unmappedlibs = []
+        for libdep in libdeps:
+            if isinstance(libdep, tuple):
+                lib, header = libdep
+            else:
+                lib = libdep
+                header = None
+
+            if lib in ignorelibs:
+                logger.debug('Ignoring library dependency %s' % lib)
+                continue
+
+            recipe = RecipeHandler.recipelibmap.get(lib, None)
+            if recipe:
+                deps.append(recipe)
+            elif recipe is None:
+                if header:
+                    RecipeHandler.load_headermap(d)
+                    recipe = RecipeHandler.recipeheadermap.get(header, None)
+                    if recipe:
+                        deps.append(recipe)
+                    elif recipe is None:
+                        unmappedlibs.append(lib)
+                else:
+                    unmappedlibs.append(lib)
+
+        deps = set(deps).difference(set(ignoredeps))
+
+        if unmappedpc:
+            outlines.append('# NOTE: unable to map the following pkg-config dependencies: %s' % ' '.join(unmappedpc))
+            outlines.append('#       (this is based on recipes that have previously been built and packaged)')
+
+        if unmappedlibs:
+            outlines.append('# NOTE: the following library dependencies are unknown, ignoring: %s' % ' '.join(list(set(unmappedlibs))))
+            outlines.append('#       (this is based on recipes that have previously been built and packaged)')
+
+        if deps:
+            values['DEPENDS'] = ' '.join(deps)
+
     def genfunction(self, outlines, funcname, content, python=False, forcespace=False):
         if python:
             prefix = 'python '
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 127e133..40659d1 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -17,7 +17,7 @@
 
 import re
 import logging
-from recipetool.create import RecipeHandler, read_pkgconfig_provides, validate_pv
+from recipetool.create import RecipeHandler, validate_pv
 
 logger = logging.getLogger('recipetool')
 
@@ -143,9 +143,6 @@ class AutotoolsRecipeHandler(RecipeHandler):
     @staticmethod
     def extract_autotools_deps(outlines, srctree, extravalues=None, acfile=None):
         import shlex
-        import oe.package
-        import json
-        import glob
 
         values = {}
         inherits = []
@@ -159,9 +156,6 @@ class AutotoolsRecipeHandler(RecipeHandler):
         progclassmap = {'gconftool-2': 'gconf',
                 'pkg-config': 'pkgconfig'}
 
-        ignoredeps = ['gcc-runtime', 'glibc', 'uclibc', 'musl', 'tar-native', 'binutils-native']
-        ignorelibs = ['socket']
-
         pkg_re = re.compile('PKG_CHECK_MODULES\(\[?[a-zA-Z0-9_]*\]?, *\[?([^,\]]*)\]?[),].*')
         pkgce_re = re.compile('PKG_CHECK_EXISTS\(\[?([^,\]]*)\]?[),].*')
         lib_re = re.compile('AC_CHECK_LIB\(\[?([^,\]]*)\]?,.*')
@@ -172,62 +166,6 @@ class AutotoolsRecipeHandler(RecipeHandler):
         am_init_re = re.compile('AM_INIT_AUTOMAKE\(([^,]+), *([^,]+)[,)].*')
         define_re = re.compile(' *(m4_)?define\(([^,]+), *([^,]+)\)')
 
-        # Build up lib library->package mapping
-        shlib_providers = oe.package.read_shlib_providers(tinfoil.config_data)
-        libdir = tinfoil.config_data.getVar('libdir', True)
-        base_libdir = tinfoil.config_data.getVar('base_libdir', True)
-        libpaths = list(set([base_libdir, libdir]))
-        libname_re = re.compile('^lib(.+)\.so.*$')
-        pkglibmap = {}
-        for lib, item in shlib_providers.iteritems():
-            for path, pkg in item.iteritems():
-                if path in libpaths:
-                    res = libname_re.match(lib)
-                    if res:
-                        libname = res.group(1)
-                        if not libname in pkglibmap:
-                            pkglibmap[libname] = pkg[0]
-                    else:
-                        logger.debug('unable to extract library name from %s' % lib)
-
-        # Now turn it into a library->recipe mapping
-        recipelibmap = {}
-        recipeheadermap = {}
-        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
-        for libname, pkg in pkglibmap.iteritems():
-            try:
-                with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
-                    for line in f:
-                        if line.startswith('PN:'):
-                            recipelibmap[libname] = line.split(':', 1)[-1].strip()
-                            break
-            except IOError as ioe:
-                if ioe.errno == 2:
-                    logger.warn('unable to find a pkgdata file for package %s' % pkg)
-                else:
-                    raise
-
-        def load_headermap():
-            if recipeheadermap:
-                return
-            includedir = tinfoil.config_data.getVar('includedir', True)
-            for pkg in glob.glob(os.path.join(pkgdata_dir, 'runtime', '*-dev')):
-                with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
-                    pn = None
-                    headers = []
-                    for line in f:
-                        if line.startswith('PN:'):
-                            pn = line.split(':', 1)[-1].strip()
-                        elif line.startswith('FILES_INFO:'):
-                            val = line.split(':', 1)[1].strip()
-                            dictval = json.loads(val)
-                            for fullpth in sorted(dictval):
-                                if fullpth.startswith(includedir) and fullpth.endswith('.h'):
-                                    headers.append(os.path.relpath(fullpth, includedir))
-                    if pn and headers:
-                        for header in headers:
-                            recipeheadermap[header] = pn
-
         defines = {}
         def subst_defines(value):
             newvalue = value
@@ -263,9 +201,9 @@ class AutotoolsRecipeHandler(RecipeHandler):
             srcfiles = RecipeHandler.checkfiles(srctree, ['acinclude.m4', 'configure.ac', 'configure.in'])
 
         pcdeps = []
+        libdeps = []
         deps = []
         unmapped = []
-        unmappedlibs = []
 
         def process_macro(keyword, value):
             if keyword == 'PKG_CHECK_MODULES':
@@ -307,36 +245,15 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 res = lib_re.search(value)
                 if res:
                     lib = res.group(1)
-                    if lib in ignorelibs:
-                        logger.debug('Ignoring library dependency %s' % lib)
-                    else:
-                        libdep = recipelibmap.get(lib, None)
-                        if libdep:
-                            deps.append(libdep)
-                        else:
-                            if libdep is None:
-                                if not lib.startswith('$'):
-                                    unmappedlibs.append(lib)
+                    if not lib.startswith('$'):
+                        libdeps.append(lib)
             elif keyword == 'AX_CHECK_LIBRARY':
                 res = libx_re.search(value)
                 if res:
                     lib = res.group(2)
-                    if lib in ignorelibs:
-                        logger.debug('Ignoring library dependency %s' % lib)
-                    else:
-                        libdep = recipelibmap.get(lib, None)
-                        if libdep:
-                            deps.append(libdep)
-                        else:
-                            if libdep is None:
-                                if not lib.startswith('$'):
-                                    header = res.group(1)
-                                    load_headermap()
-                                    libdep = recipeheadermap.get(header, None)
-                                    if libdep:
-                                        deps.append(libdep)
-                                    else:
-                                        unmappedlibs.append(lib)
+                    if not lib.startswith('$'):
+                        header = res.group(1)
+                        libdeps.add((lib, header))
             elif keyword == 'AC_PATH_X':
                 deps.append('libx11')
             elif keyword in ('AX_BOOST', 'BOOST_REQUIRE'):
@@ -484,29 +401,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
         if unmapped:
             outlines.append('# NOTE: the following prog dependencies are unknown, ignoring: %s' % ' '.join(list(set(unmapped))))
 
-        if unmappedlibs:
-            outlines.append('# NOTE: the following library dependencies are unknown, ignoring: %s' % ' '.join(list(set(unmappedlibs))))
-            outlines.append('#       (this is based on recipes that have previously been built and packaged)')
-
-        recipemap = read_pkgconfig_provides(tinfoil.config_data)
-        unmapped = []
-        pcdeps = list(set(pcdeps))
-        for pcdep in pcdeps:
-            recipe = recipemap.get(pcdep, None)
-            if recipe:
-                deps.append(recipe)
-            else:
-                if not pcdep.startswith('$'):
-                    unmapped.append(pcdep)
-
-        deps = set(deps).difference(set(ignoredeps))
-
-        if unmapped:
-            outlines.append('# NOTE: unable to map the following pkg-config dependencies: %s' % ' '.join(unmapped))
-            outlines.append('#       (this is based on recipes that have previously been built and packaged)')
-
-        if deps:
-            values['DEPENDS'] = ' '.join(deps)
+        RecipeHandler.handle_depends(libdeps, pcdeps, deps, outlines, values, tinfoil.config_data)
 
         if inherits:
             values['inherit'] = ' '.join(list(set(inherits)))
-- 
2.5.0


