Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 24IW43fEHbM8k0SoEICeqhUOd0qaHmjRFHRtQsr8rwSkm443I67PwKnGlsq9WC799U/pL/i2+J
 SQUvnVT0n88g==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818139"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818139"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:27 -0700
IronPort-SDR: 3/a1fJFFetNbhr34D39K3lk4LlVfQ6gf4yRA87ZlFYNOh2fhYssii0XEpmo2a9VOrU1jaQErHL
 yiLiHWgvA3Fg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067371"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:26 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 24/64] python3: Improve logging, syntax and update deprecated modules to create_manifest
Date: Mon, 26 Apr 2021 08:52:55 +0800
Message-Id: <003d73d74791e5d7dcdeb4f29fc7b05e35b345ea.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>

The imp module has een deprecated by upstream python, drop its usage
  (imp.get_tag) in favor of sys.implementation.cache_tag.

Avoid incorrectly getting dependencies for running script and
multiprocessing module.

Improve logging behavior of the create_manifest task:
- Use indentation.
- Logs on temp directory.
- Use a proper debug flag.
- Standarize syntax.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a3ac339f5b8549a050308ba94c4ef9093f10e303)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/python3/create_manifest3.py        | 47 +++++++-----
 .../python/python3/get_module_deps3.py        | 72 +++++++++++--------
 2 files changed, 71 insertions(+), 48 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 4da02a2991..045240ea0b 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -36,7 +36,7 @@
 # Tha method to handle cached files does not work when a module includes a folder which
 # itself contains the pycache folder, gladly this is almost never the case.
 #
-# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29 at gmail dot com>
+# Author: Alejandro Enedino Hernandez Samaniego <alejandro at enedino dot org>
 
 
 import sys
@@ -45,6 +45,11 @@ import json
 import os
 import collections
 
+if '-d' in sys.argv:
+    debugFlag = '-d'
+else:
+    debugFlag = ''
+
 # Get python version from ${PYTHON_MAJMIN}
 pyversion = str(sys.argv[1])
 
@@ -84,6 +89,12 @@ def prepend_comments(comments, json_manifest):
         manifest.seek(0, 0)
         manifest.write(comments + json_contents)
 
+def print_indent(msg, offset):
+    for l in msg.splitlines():
+        msg = ' ' * offset + l
+        print(msg)
+
+
 # Read existing JSON manifest
 with open('python3-manifest.json') as manifest:
     # The JSON format doesn't allow comments so we hack the call to keep the comments using a marker
@@ -99,7 +110,7 @@ with open('python3-manifest.json') as manifest:
 # Not exactly the same so it should not be a function
 #
 
-print ('Getting dependencies for package: core')
+print_indent('Getting dependencies for package: core', 0)
 
 
 # This special call gets the core dependencies and
@@ -109,7 +120,7 @@ print ('Getting dependencies for package: core')
 # on the new core package, they will still find them
 # even when checking the old_manifest
 
-output = subprocess.check_output([sys.executable, 'get_module_deps3.py', 'python-core-package']).decode('utf8')
+output = subprocess.check_output([sys.executable, 'get_module_deps3.py', 'python-core-package', '%s' % debugFlag]).decode('utf8')
 for coredep in output.split():
     coredep = coredep.replace(pyversion,'${PYTHON_MAJMIN}')
     if isCached(coredep):
@@ -149,17 +160,16 @@ for filedep in old_manifest['core']['files']:
     # Get actual module name , shouldnt be affected by libdir/bindir, etc.
     pymodule = os.path.splitext(os.path.basename(os.path.normpath(filedep)))[0]
 
-
     # We now know that were dealing with a python module, so we can import it
     # and check what its dependencies are.
     # We launch a separate task for each module for deterministic behavior.
     # Each module will only import what is necessary for it to work in specific.
     # The output of each task will contain each module's dependencies
 
-    print ('Getting dependencies for module: %s' % pymodule)
-    output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule]).decode('utf8')
-    print ('The following dependencies were found for module %s:\n' % pymodule)
-    print (output)
+    print_indent('Getting dependencies for module: %s' % pymodule, 2)
+    output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule, '%s' % debugFlag]).decode('utf8')
+    print_indent('The following dependencies were found for module %s:\n' % pymodule, 4)
+    print_indent(output, 6)
 
 
     for pymodule_dep in output.split():
@@ -178,12 +188,13 @@ for filedep in old_manifest['core']['files']:
 # all others will use this a base.
 
 
+print('\n\nChecking for directories...\n')
 # To improve the script speed, we check which packages contain directories
 # since we will be looping through (only) those later.
 for pypkg in old_manifest:
     for filedep in old_manifest[pypkg]['files']:
         if isFolder(filedep):
-            print ('%s is a folder' % filedep)
+            print_indent('%s is a directory' % filedep, 2)
             if pypkg not in hasfolders:
                 hasfolders.append(pypkg)
             if filedep not in allfolders:
@@ -221,14 +232,14 @@ for pypkg in old_manifest:
 
     print('\n')
     print('--------------------------')
-    print ('Handling package %s' % pypkg)
+    print('Handling package %s' % pypkg)
     print('--------------------------')
 
     # Handle special cases, we assume that when they were manually added 
     # to the manifest we knew what we were doing.
     special_packages = ['misc', 'modules', 'dev', 'tests']
     if pypkg in special_packages or 'staticdev' in pypkg:
-        print('Passing %s package directly' % pypkg)
+        print_indent('Passing %s package directly' % pypkg, 2)
         new_manifest[pypkg] = old_manifest[pypkg]
         continue
 
@@ -259,7 +270,7 @@ for pypkg in old_manifest:
 
         # Get actual module name , shouldnt be affected by libdir/bindir, etc.
         # We need to check if the imported module comes from another (e.g. sqlite3.dump)
-        path,pymodule = os.path.split(filedep)
+        path, pymodule = os.path.split(filedep)
         path = os.path.basename(path)
         pymodule = os.path.splitext(os.path.basename(pymodule))[0]
 
@@ -279,10 +290,10 @@ for pypkg in old_manifest:
         # Each module will only import what is necessary for it to work in specific.
         # The output of each task will contain each module's dependencies
 
-        print ('\nGetting dependencies for module: %s' % pymodule)
-        output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule]).decode('utf8')
-        print ('The following dependencies were found for module %s:\n' % pymodule)
-        print (output)
+        print_indent('\nGetting dependencies for module: %s' % pymodule, 2)
+        output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule, '%s' % debugFlag]).decode('utf8')
+        print_indent('The following dependencies were found for module %s:\n' % pymodule, 4)
+        print_indent(output, 6)
 
         reportFILES = []
         reportRDEPS = []
@@ -325,7 +336,7 @@ for pypkg in old_manifest:
                             # print('Checking folder %s on package %s' % (pymodule_dep,pypkg_with_folder))
                             for folder_dep in old_manifest[pypkg_with_folder]['files'] or folder_dep in old_manifest[pypkg_with_folder]['cached']:
                                 if folder_dep == folder:
-                                    print ('%s folder found in %s' % (folder, pypkg_with_folder))
+                                    print ('%s directory found in %s' % (folder, pypkg_with_folder))
                                     folderFound = True
                                     if pypkg_with_folder not in new_manifest[pypkg]['rdepends'] and pypkg_with_folder != pypkg:
                                         new_manifest[pypkg]['rdepends'].append(pypkg_with_folder)
@@ -424,7 +435,7 @@ prepend_comments(comments,'python3-manifest.json.new')
 
 if (repeated):
     error_msg = '\n\nERROR:\n'
-    error_msg += 'The following files are repeated (contained in more than one package),\n'
+    error_msg += 'The following files were found in more than one package),\n'
     error_msg += 'this is likely to happen when new files are introduced after an upgrade,\n'
     error_msg += 'please check which package should get it,\n modify the manifest accordingly and re-run the create_manifest task:\n'
     error_msg += '\n'.join(repeated)
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index 6806f23172..1f4c982aed 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -3,14 +3,18 @@
 # them out, the output of this execution will have all dependencies
 # for a specific module, which will be parsed an dealt on create_manifest.py
 #
-# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29@gmail.com>
+# Author: Alejandro Enedino Hernandez Samaniego <alejandro at enedino dot org>
 
-# We can get a log per module, for all the dependencies that were found, but its messy.
-debug=False
 
 import sys
 import os
 
+# We can get a log per module, for all the dependencies that were found, but its messy.
+if '-d' in sys.argv:
+    debug = True
+else:
+    debug = False
+
 # We can get a list of the modules which are currently required to run python
 # so we run python-core and get its modules, we then import what we need
 # and check what modules are currently running, if we substract them from the
@@ -19,13 +23,13 @@ import os
 # We use importlib to achieve this, so we also need to know what modules importlib needs
 import importlib
 
-core_deps=set(sys.modules)
+core_deps = set(sys.modules)
 
 def fix_path(dep_path):
     import os
     # We DONT want the path on our HOST system
-    pivot='recipe-sysroot-native'
-    dep_path=dep_path[dep_path.find(pivot)+len(pivot):]
+    pivot = 'recipe-sysroot-native'
+    dep_path = dep_path[dep_path.find(pivot)+len(pivot):]
 
     if '/usr/bin' in dep_path:
         dep_path = dep_path.replace('/usr/bin''${bindir}')
@@ -46,8 +50,8 @@ def fix_path(dep_path):
 
 # Module to import was passed as an argument
 current_module =  str(sys.argv[1]).rstrip()
-if(debug==True):
-    log = open('log_%s' % current_module,'w')
+if debug == True:
+    log = open('temp/log_%s' % current_module.strip('.*'),'w')
     log.write('Module %s generated the following dependencies:\n' % current_module)
 try:
     m = importlib.import_module(current_module)
@@ -63,13 +67,13 @@ try:
             except:
                 pass # ignore all import or other exceptions raised during import
 except ImportError as e:
-    if (debug==True):
-        log.write('Module was not found')
+    if debug == True:
+        log.write('Module was not found\n')
     pass
 
 
 # Get current module dependencies, dif will contain a list of specific deps for this module
-module_deps=set(sys.modules)
+module_deps = set(sys.modules)
 
 # We handle the core package (1st pass on create_manifest.py) as a special case
 if current_module == 'python-core-package':
@@ -81,14 +85,18 @@ else:
 
 # Check where each dependency came from
 for item in dif:
-    dep_path=''
+    # Main module returns script filename, __main matches mp_main__ as well
+    if 'main__' in item:
+        continue
+
+    dep_path = ''
     try:
-        if (debug==True):
-            log.write('Calling: sys.modules[' + '%s' % item + '].__file__\n')
+        if debug == True:
+            log.write('\nCalling: sys.modules[' + '%s' % item + '].__file__\n')
         dep_path = sys.modules['%s' % item].__file__
     except AttributeError as e:
         # Deals with thread (builtin module) not having __file__ attribute
-        if debug==True:
+        if debug == True:
             log.write(item + ' ')
             log.write(str(e))
             log.write('\n')
@@ -96,11 +104,16 @@ for item in dif:
     except NameError as e:
         # Deals with NameError: name 'dep_path' is not defined
         # because module is not found (wasn't compiled?), e.g. bddsm
-        if (debug==True):
+        if debug == True:
             log.write(item+' ') 
             log.write(str(e))                                              
         pass
 
+    if dep_path == '':
+        continue
+    if debug == True:
+        log.write('Dependency path found:\n%s\n' % dep_path)
+
     # Site-customize is a special case since we (OpenEmbedded) put it there manually
     if 'sitecustomize' in dep_path:
         dep_path = '${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py'
@@ -111,52 +124,51 @@ for item in dif:
     dep_path = fix_path(dep_path)
 
     import sysconfig
-    soabi=sysconfig.get_config_var('SOABI')
+    soabi = sysconfig.get_config_var('SOABI')
     # Check if its a shared library and deconstruct it
     if soabi in dep_path:
-        if (debug==True):
-            log.write('Shared library found in %s' % dep_path)
+        if debug == True:
+            log.write('Shared library found in %s\n' % dep_path)
         dep_path = dep_path.replace(soabi,'*')
         print (dep_path)
         continue
     if "_sysconfigdata" in dep_path:
         dep_path = dep_path.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
 
-    if (debug==True):
+    if debug == True:
         log.write(dep_path+'\n')
     # Prints out result, which is what will be used by create_manifest
     print (dep_path)
 
 
-    import imp
-    cpython_tag = imp.get_tag() 
-    cached=''
+    cpython_tag = sys.implementation.cache_tag
+    cached = ''
     # Theres no naive way to find *.pyc files on python3
     try:
-        if (debug==True):
-            log.write('Calling: sys.modules[' + '%s' % item + '].__cached__\n')
+        if debug == True:
+            log.write('\nCalling: sys.modules[' + '%s' % item + '].__cached__\n')
         cached = sys.modules['%s' % item].__cached__
     except AttributeError as e:
         # Deals with thread (builtin module) not having __cached__ attribute
-        if debug==True:
+        if debug == True:
             log.write(item + ' ')
             log.write(str(e))
             log.write('\n')
         pass
     except NameError as e:
         # Deals with NameError: name 'cached' is not defined
-        if (debug==True):
+        if debug == True:
             log.write(item+' ') 
             log.write(str(e))                                              
         pass
     if cached is not None:
-        if (debug==True):
-            log.write(cached)
+        if debug == True:
+            log.write(cached + '\n')
         cached = fix_path(cached)
         cached = cached.replace(cpython_tag,'*')
         if "_sysconfigdata" in cached:
             cached = cached.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
         print (cached)
 
-if debug==True:
+if debug == True:
     log.close()
-- 
2.30.2

