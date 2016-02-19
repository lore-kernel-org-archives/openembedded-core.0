Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A901771CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:40:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50774131"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:40:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:39:01 +1300
Message-Id: <e08a9d7c6bdc331f56e64ab594b47367b3519520.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/14] recipetool: create: add additional extension mechanisms
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
X-List-Received-Date: Fri, 19 Feb 2016 09:40:06 -0000

Add a means of extending the dependency extraction for autotools and
cmake.

Note: in order to have this work, you need to have an __init__.py in the
lib/recipetool directory within your layer along with the module
implementing the handlers, and the __init__.py needs to contain:

  # Enable other layers to have modules in the same named directory
  from pkgutil import extend_path
  __path__ = extend_path(__path__, __name__)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py        | 119 +++++++++++++++++++++--
 scripts/lib/recipetool/create_buildsys_python.py |   2 +-
 2 files changed, 113 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 4d11e04..1a06cac 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -22,6 +22,12 @@ from recipetool.create import RecipeHandler, validate_pv
 logger = logging.getLogger('recipetool')
 
 tinfoil = None
+plugins = None
+
+def plugin_init(pluginlist):
+    # Take a reference to the list so we can use it later
+    global plugins
+    plugins = pluginlist
 
 def tinfoil_init(instance):
     global tinfoil
@@ -48,6 +54,13 @@ class CmakeRecipeHandler(RecipeHandler):
 
     @staticmethod
     def extract_cmake_deps(outlines, srctree, extravalues, cmakelistsfile=None):
+        # Find all plugins that want to register handlers
+        logger.debug('Loading cmake handlers')
+        handlers = []
+        for plugin in plugins:
+            if hasattr(plugin, 'register_cmake_handlers'):
+                plugin.register_cmake_handlers(handlers)
+
         values = {}
         inherits = []
 
@@ -152,6 +165,9 @@ class CmakeRecipeHandler(RecipeHandler):
             with open(fn, 'r') as f:
                 for line in f:
                     line = line.strip()
+                    for handler in handlers:
+                        if handler.process_line(srctree, fn, line, libdeps, pcdeps, deps, outlines, inherits, values):
+                            continue
                     res = include_re.match(line)
                     if res:
                         includefn = bb.utils.which(':'.join(searchpaths), res.group(1))
@@ -194,7 +210,15 @@ class CmakeRecipeHandler(RecipeHandler):
                     if res:
                         origpkg = res.group(1)
                         pkg = interpret_value(origpkg.lower())
-                        if pkg == 'gettext':
+                        found = False
+                        for handler in handlers:
+                            if handler.process_findpackage(srctree, fn, pkg, deps, outlines, inherits, values):
+                                logger.debug('Mapped CMake package %s via handler %s' % (pkg, handler.__class__.__name__))
+                                found = True
+                                break
+                        if found:
+                            continue
+                        elif pkg == 'gettext':
                             inherits.append('gettext')
                         elif pkg == 'perl':
                             inherits.append('perlnative')
@@ -207,6 +231,7 @@ class CmakeRecipeHandler(RecipeHandler):
                         else:
                             dep = cmake_pkgmap.get(pkg, None)
                             if dep:
+                                logger.debug('Mapped CMake package %s to recipe %s via internal list' % (pkg, dep))
                                 deps.append(dep)
                             elif dep is None:
                                 unmappedpkgs.append(origpkg)
@@ -236,11 +261,39 @@ class CmakeRecipeHandler(RecipeHandler):
 
         RecipeHandler.handle_depends(libdeps, pcdeps, deps, outlines, values, tinfoil.config_data)
 
+        for handler in handlers:
+            handler.post_process(srctree, libdeps, pcdeps, deps, outlines, inherits, values)
+
         if inherits:
             values['inherit'] = ' '.join(list(set(inherits)))
 
         return values
 
+
+class CmakeExtensionHandler(object):
+    '''Base class for CMake extension handlers'''
+    def process_line(self, srctree, fn, line, libdeps, pcdeps, deps, outlines, inherits, values):
+        '''
+        Handle a line parsed out of an CMake file.
+        Return True if you've completely handled the passed in line, otherwise return False.
+        '''
+        return False
+
+    def process_findpackage(self, srctree, fn, pkg, deps, outlines, inherits, values):
+        '''
+        Handle a find_package package parsed out of a CMake file.
+        Return True if you've completely handled the passed in package, otherwise return False.
+        '''
+        return False
+
+    def post_process(self, srctree, fn, pkg, deps, outlines, inherits, values):
+        '''
+        Apply any desired post-processing on the output
+        '''
+        return
+
+
+
 class SconsRecipeHandler(RecipeHandler):
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
@@ -255,6 +308,7 @@ class SconsRecipeHandler(RecipeHandler):
             return True
         return False
 
+
 class QmakeRecipeHandler(RecipeHandler):
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
@@ -266,6 +320,7 @@ class QmakeRecipeHandler(RecipeHandler):
             return True
         return False
 
+
 class AutotoolsRecipeHandler(RecipeHandler):
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
@@ -322,6 +377,13 @@ class AutotoolsRecipeHandler(RecipeHandler):
     def extract_autotools_deps(outlines, srctree, extravalues=None, acfile=None):
         import shlex
 
+        # Find all plugins that want to register handlers
+        logger.debug('Loading autotools handlers')
+        handlers = []
+        for plugin in plugins:
+            if hasattr(plugin, 'register_autotools_handlers'):
+                plugin.register_autotools_handlers(handlers)
+
         values = {}
         inherits = []
 
@@ -384,6 +446,9 @@ class AutotoolsRecipeHandler(RecipeHandler):
         unmapped = []
 
         def process_macro(keyword, value):
+            for handler in handlers:
+                if handler.process_macro(srctree, keyword, value, process_value, libdeps, pcdeps, deps, outlines, inherits, values):
+                    return
             if keyword == 'PKG_CHECK_MODULES':
                 res = pkg_re.search(value)
                 if res:
@@ -409,6 +474,9 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 if res:
                     for prog in shlex.split(res.group(1)):
                         prog = prog.split()[0]
+                        for handler in handlers:
+                            if handler.process_prog(srctree, keyword, value, prog, deps, outlines, inherits, values):
+                                return
                         progclass = progclassmap.get(prog, None)
                         if progclass:
                             inherits.append(progclass)
@@ -537,6 +605,10 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     'AM_INIT_AUTOMAKE',
                     'define(',
                     ]
+
+        for handler in handlers:
+            handler.extend_keywords(keywords)
+
         for srcfile in srcfiles:
             nesting = 0
             in_keyword = ''
@@ -581,12 +653,44 @@ class AutotoolsRecipeHandler(RecipeHandler):
 
         RecipeHandler.handle_depends(libdeps, pcdeps, deps, outlines, values, tinfoil.config_data)
 
+        for handler in handlers:
+            handler.post_process(srctree, libdeps, pcdeps, deps, outlines, inherits, values)
+
         if inherits:
             values['inherit'] = ' '.join(list(set(inherits)))
 
         return values
 
 
+class AutotoolsExtensionHandler(object):
+    '''Base class for Autotools extension handlers'''
+    def process_macro(self, srctree, keyword, value, process_value, libdeps, pcdeps, deps, outlines, inherits, values):
+        '''
+        Handle a macro parsed out of an autotools file. Note that if you want this to be called
+        for any macro other than the ones AutotoolsRecipeHandler already looks for, you'll need
+        to add it to the keywords list in extend_keywords().
+        Return True if you've completely handled the passed in macro, otherwise return False.
+        '''
+        return False
+
+    def extend_keywords(self, keywords):
+        '''Adds keywords to be recognised by the parser (so that you get a call to process_macro)'''
+        return
+
+    def process_prog(self, srctree, keyword, value, prog, deps, outlines, inherits, values):
+        '''
+        Handle an AC_PATH_PROG, AC_CHECK_PROG etc. line
+        Return True if you've completely handled the passed in macro, otherwise return False.
+        '''
+        return False
+
+    def post_process(self, srctree, fn, pkg, deps, outlines, inherits, values):
+        '''
+        Apply any desired post-processing on the output
+        '''
+        return
+
+
 class MakefileRecipeHandler(RecipeHandler):
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
@@ -703,11 +807,12 @@ class SpecFileRecipeHandler(RecipeHandler):
                 break
 
 def register_recipe_handlers(handlers):
-    # These are in a specific order so that the right one is detected first
-    handlers.append(CmakeRecipeHandler())
-    handlers.append(AutotoolsRecipeHandler())
-    handlers.append(SconsRecipeHandler())
-    handlers.append(QmakeRecipeHandler())
-    handlers.append(MakefileRecipeHandler())
+    # Set priorities with some gaps so that other plugins can insert
+    # their own handlers (so avoid changing these numbers)
+    handlers.append((CmakeRecipeHandler(), 50))
+    handlers.append((AutotoolsRecipeHandler(), 40))
+    handlers.append((SconsRecipeHandler(), 30))
+    handlers.append((QmakeRecipeHandler(), 20))
+    handlers.append((MakefileRecipeHandler(), 10))
     handlers.append((VersionFileRecipeHandler(), -1))
     handlers.append((SpecFileRecipeHandler(), -1))
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 4d65c96..c382330 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -716,4 +716,4 @@ def has_non_literals(value):
 
 def register_recipe_handlers(handlers):
     # We need to make sure this is ahead of the makefile fallback handler
-    handlers.insert(0, PythonRecipeHandler())
+    handlers.append((PythonRecipeHandler(), 70))
-- 
2.5.0


