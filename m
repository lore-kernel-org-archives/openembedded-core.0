Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.1509.1618620529250905987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 17:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=fTRpaOEt;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1D70620B8003;
	Fri, 16 Apr 2021 17:48:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1D70620B8003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618620528;
	bh=qKBPiHOoqo9qFr8delNByHBh9V4DDfJ4Zt03wBSWOWI=;
	h=From:To:Cc:Subject:Date:From;
	b=fTRpaOEtDgxcKROtt9Nz2G6CEYBTyI0t790fmJ56kfcUPvkin74OulEydN+vE9A/B
	 nn7QxdXfAvWJcpz3OnSKlBzpJDvSqskPk4fv/dUF2BetKqRv6fGbbcr5SlZ7QHeVn0
	 P3eehQEt6DJjvwRiW05wAsENxMFsntkc/07Zmqtg=
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 1/2] python3: Improve logging, syntax and update deprecated modules to create_manifest
Date: Fri, 16 Apr 2021 18:48:34 -0600
Message-Id: <20210417004835.2958450-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../python/python3/create_manifest3.py        | 47 +++++++-----
 .../python/python3/get_module_deps3.py        | 72 +++++++++++--------
 2 files changed, 71 insertions(+), 48 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/m=
eta/recipes-devtools/python/python3/create_manifest3.py
index 4da02a2991..045240ea0b 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -36,7 +36,7 @@
 # Tha method to handle cached files does not work when a module includes=
 a folder which
 # itself contains the pycache folder, gladly this is almost never the ca=
se.
 #
-# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29 at gmai=
l dot com>
+# Author: Alejandro Enedino Hernandez Samaniego <alejandro at enedino do=
t org>
=20
=20
 import sys
@@ -45,6 +45,11 @@ import json
 import os
 import collections
=20
+if '-d' in sys.argv:
+    debugFlag =3D '-d'
+else:
+    debugFlag =3D ''
+
 # Get python version from ${PYTHON_MAJMIN}
 pyversion =3D str(sys.argv[1])
=20
@@ -84,6 +89,12 @@ def prepend_comments(comments, json_manifest):
         manifest.seek(0, 0)
         manifest.write(comments + json_contents)
=20
+def print_indent(msg, offset):
+    for l in msg.splitlines():
+        msg =3D ' ' * offset + l
+        print(msg)
+
+
 # Read existing JSON manifest
 with open('python3-manifest.json') as manifest:
     # The JSON format doesn't allow comments so we hack the call to keep=
 the comments using a marker
@@ -99,7 +110,7 @@ with open('python3-manifest.json') as manifest:
 # Not exactly the same so it should not be a function
 #
=20
-print ('Getting dependencies for package: core')
+print_indent('Getting dependencies for package: core', 0)
=20
=20
 # This special call gets the core dependencies and
@@ -109,7 +120,7 @@ print ('Getting dependencies for package: core')
 # on the new core package, they will still find them
 # even when checking the old_manifest
=20
-output =3D subprocess.check_output([sys.executable, 'get_module_deps3.py=
', 'python-core-package']).decode('utf8')
+output =3D subprocess.check_output([sys.executable, 'get_module_deps3.py=
', 'python-core-package', '%s' % debugFlag]).decode('utf8')
 for coredep in output.split():
     coredep =3D coredep.replace(pyversion,'${PYTHON_MAJMIN}')
     if isCached(coredep):
@@ -149,17 +160,16 @@ for filedep in old_manifest['core']['files']:
     # Get actual module name , shouldnt be affected by libdir/bindir, et=
c.
     pymodule =3D os.path.splitext(os.path.basename(os.path.normpath(file=
dep)))[0]
=20
-
     # We now know that were dealing with a python module, so we can impo=
rt it
     # and check what its dependencies are.
     # We launch a separate task for each module for deterministic behavi=
or.
     # Each module will only import what is necessary for it to work in s=
pecific.
     # The output of each task will contain each module's dependencies
=20
-    print ('Getting dependencies for module: %s' % pymodule)
-    output =3D subprocess.check_output([sys.executable, 'get_module_deps=
3.py', '%s' % pymodule]).decode('utf8')
-    print ('The following dependencies were found for module %s:\n' % py=
module)
-    print (output)
+    print_indent('Getting dependencies for module: %s' % pymodule, 2)
+    output =3D subprocess.check_output([sys.executable, 'get_module_deps=
3.py', '%s' % pymodule, '%s' % debugFlag]).decode('utf8')
+    print_indent('The following dependencies were found for module %s:\n=
' % pymodule, 4)
+    print_indent(output, 6)
=20
=20
     for pymodule_dep in output.split():
@@ -178,12 +188,13 @@ for filedep in old_manifest['core']['files']:
 # all others will use this a base.
=20
=20
+print('\n\nChecking for directories...\n')
 # To improve the script speed, we check which packages contain directori=
es
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
=20
     print('\n')
     print('--------------------------')
-    print ('Handling package %s' % pypkg)
+    print('Handling package %s' % pypkg)
     print('--------------------------')
=20
     # Handle special cases, we assume that when they were manually added=
=20
     # to the manifest we knew what we were doing.
     special_packages =3D ['misc', 'modules', 'dev', 'tests']
     if pypkg in special_packages or 'staticdev' in pypkg:
-        print('Passing %s package directly' % pypkg)
+        print_indent('Passing %s package directly' % pypkg, 2)
         new_manifest[pypkg] =3D old_manifest[pypkg]
         continue
=20
@@ -259,7 +270,7 @@ for pypkg in old_manifest:
=20
         # Get actual module name , shouldnt be affected by libdir/bindir=
, etc.
         # We need to check if the imported module comes from another (e.=
g. sqlite3.dump)
-        path,pymodule =3D os.path.split(filedep)
+        path, pymodule =3D os.path.split(filedep)
         path =3D os.path.basename(path)
         pymodule =3D os.path.splitext(os.path.basename(pymodule))[0]
=20
@@ -279,10 +290,10 @@ for pypkg in old_manifest:
         # Each module will only import what is necessary for it to work =
in specific.
         # The output of each task will contain each module's dependencie=
s
=20
-        print ('\nGetting dependencies for module: %s' % pymodule)
-        output =3D subprocess.check_output([sys.executable, 'get_module_=
deps3.py', '%s' % pymodule]).decode('utf8')
-        print ('The following dependencies were found for module %s:\n' =
% pymodule)
-        print (output)
+        print_indent('\nGetting dependencies for module: %s' % pymodule,=
 2)
+        output =3D subprocess.check_output([sys.executable, 'get_module_=
deps3.py', '%s' % pymodule, '%s' % debugFlag]).decode('utf8')
+        print_indent('The following dependencies were found for module %=
s:\n' % pymodule, 4)
+        print_indent(output, 6)
=20
         reportFILES =3D []
         reportRDEPS =3D []
@@ -325,7 +336,7 @@ for pypkg in old_manifest:
                             # print('Checking folder %s on package %s' %=
 (pymodule_dep,pypkg_with_folder))
                             for folder_dep in old_manifest[pypkg_with_fo=
lder]['files'] or folder_dep in old_manifest[pypkg_with_folder]['cached']=
:
                                 if folder_dep =3D=3D folder:
-                                    print ('%s folder found in %s' % (fo=
lder, pypkg_with_folder))
+                                    print ('%s directory found in %s' % =
(folder, pypkg_with_folder))
                                     folderFound =3D True
                                     if pypkg_with_folder not in new_mani=
fest[pypkg]['rdepends'] and pypkg_with_folder !=3D pypkg:
                                         new_manifest[pypkg]['rdepends'].=
append(pypkg_with_folder)
@@ -424,7 +435,7 @@ prepend_comments(comments,'python3-manifest.json.new'=
)
=20
 if (repeated):
     error_msg =3D '\n\nERROR:\n'
-    error_msg +=3D 'The following files are repeated (contained in more =
than one package),\n'
+    error_msg +=3D 'The following files were found in more than one pack=
age),\n'
     error_msg +=3D 'this is likely to happen when new files are introduc=
ed after an upgrade,\n'
     error_msg +=3D 'please check which package should get it,\n modify t=
he manifest accordingly and re-run the create_manifest task:\n'
     error_msg +=3D '\n'.join(repeated)
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/m=
eta/recipes-devtools/python/python3/get_module_deps3.py
index 6806f23172..1f4c982aed 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -3,14 +3,18 @@
 # them out, the output of this execution will have all dependencies
 # for a specific module, which will be parsed an dealt on create_manifes=
t.py
 #
-# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29@gmail.c=
om>
+# Author: Alejandro Enedino Hernandez Samaniego <alejandro at enedino do=
t org>
=20
-# We can get a log per module, for all the dependencies that were found,=
 but its messy.
-debug=3DFalse
=20
 import sys
 import os
=20
+# We can get a log per module, for all the dependencies that were found,=
 but its messy.
+if '-d' in sys.argv:
+    debug =3D True
+else:
+    debug =3D False
+
 # We can get a list of the modules which are currently required to run p=
ython
 # so we run python-core and get its modules, we then import what we need
 # and check what modules are currently running, if we substract them fro=
m the
@@ -19,13 +23,13 @@ import os
 # We use importlib to achieve this, so we also need to know what modules=
 importlib needs
 import importlib
=20
-core_deps=3Dset(sys.modules)
+core_deps =3D set(sys.modules)
=20
 def fix_path(dep_path):
     import os
     # We DONT want the path on our HOST system
-    pivot=3D'recipe-sysroot-native'
-    dep_path=3Ddep_path[dep_path.find(pivot)+len(pivot):]
+    pivot =3D 'recipe-sysroot-native'
+    dep_path =3D dep_path[dep_path.find(pivot)+len(pivot):]
=20
     if '/usr/bin' in dep_path:
         dep_path =3D dep_path.replace('/usr/bin''${bindir}')
@@ -46,8 +50,8 @@ def fix_path(dep_path):
=20
 # Module to import was passed as an argument
 current_module =3D  str(sys.argv[1]).rstrip()
-if(debug=3D=3DTrue):
-    log =3D open('log_%s' % current_module,'w')
+if debug =3D=3D True:
+    log =3D open('temp/log_%s' % current_module.strip('.*'),'w')
     log.write('Module %s generated the following dependencies:\n' % curr=
ent_module)
 try:
     m =3D importlib.import_module(current_module)
@@ -63,13 +67,13 @@ try:
             except:
                 pass # ignore all import or other exceptions raised duri=
ng import
 except ImportError as e:
-    if (debug=3D=3DTrue):
-        log.write('Module was not found')
+    if debug =3D=3D True:
+        log.write('Module was not found\n')
     pass
=20
=20
 # Get current module dependencies, dif will contain a list of specific d=
eps for this module
-module_deps=3Dset(sys.modules)
+module_deps =3D set(sys.modules)
=20
 # We handle the core package (1st pass on create_manifest.py) as a speci=
al case
 if current_module =3D=3D 'python-core-package':
@@ -81,14 +85,18 @@ else:
=20
 # Check where each dependency came from
 for item in dif:
-    dep_path=3D''
+    # Main module returns script filename, __main matches mp_main__ as w=
ell
+    if 'main__' in item:
+        continue
+
+    dep_path =3D ''
     try:
-        if (debug=3D=3DTrue):
-            log.write('Calling: sys.modules[' + '%s' % item + '].__file_=
_\n')
+        if debug =3D=3D True:
+            log.write('\nCalling: sys.modules[' + '%s' % item + '].__fil=
e__\n')
         dep_path =3D sys.modules['%s' % item].__file__
     except AttributeError as e:
         # Deals with thread (builtin module) not having __file__ attribu=
te
-        if debug=3D=3DTrue:
+        if debug =3D=3D True:
             log.write(item + ' ')
             log.write(str(e))
             log.write('\n')
@@ -96,11 +104,16 @@ for item in dif:
     except NameError as e:
         # Deals with NameError: name 'dep_path' is not defined
         # because module is not found (wasn't compiled?), e.g. bddsm
-        if (debug=3D=3DTrue):
+        if debug =3D=3D True:
             log.write(item+' ')=20
             log.write(str(e))                                           =
  =20
         pass
=20
+    if dep_path =3D=3D '':
+        continue
+    if debug =3D=3D True:
+        log.write('Dependency path found:\n%s\n' % dep_path)
+
     # Site-customize is a special case since we (OpenEmbedded) put it th=
ere manually
     if 'sitecustomize' in dep_path:
         dep_path =3D '${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py'
@@ -111,52 +124,51 @@ for item in dif:
     dep_path =3D fix_path(dep_path)
=20
     import sysconfig
-    soabi=3Dsysconfig.get_config_var('SOABI')
+    soabi =3D sysconfig.get_config_var('SOABI')
     # Check if its a shared library and deconstruct it
     if soabi in dep_path:
-        if (debug=3D=3DTrue):
-            log.write('Shared library found in %s' % dep_path)
+        if debug =3D=3D True:
+            log.write('Shared library found in %s\n' % dep_path)
         dep_path =3D dep_path.replace(soabi,'*')
         print (dep_path)
         continue
     if "_sysconfigdata" in dep_path:
         dep_path =3D dep_path.replace(sysconfig._get_sysconfigdata_name(=
), "_sysconfigdata*")
=20
-    if (debug=3D=3DTrue):
+    if debug =3D=3D True:
         log.write(dep_path+'\n')
     # Prints out result, which is what will be used by create_manifest
     print (dep_path)
=20
=20
-    import imp
-    cpython_tag =3D imp.get_tag()=20
-    cached=3D''
+    cpython_tag =3D sys.implementation.cache_tag
+    cached =3D ''
     # Theres no naive way to find *.pyc files on python3
     try:
-        if (debug=3D=3DTrue):
-            log.write('Calling: sys.modules[' + '%s' % item + '].__cache=
d__\n')
+        if debug =3D=3D True:
+            log.write('\nCalling: sys.modules[' + '%s' % item + '].__cac=
hed__\n')
         cached =3D sys.modules['%s' % item].__cached__
     except AttributeError as e:
         # Deals with thread (builtin module) not having __cached__ attri=
bute
-        if debug=3D=3DTrue:
+        if debug =3D=3D True:
             log.write(item + ' ')
             log.write(str(e))
             log.write('\n')
         pass
     except NameError as e:
         # Deals with NameError: name 'cached' is not defined
-        if (debug=3D=3DTrue):
+        if debug =3D=3D True:
             log.write(item+' ')=20
             log.write(str(e))                                           =
  =20
         pass
     if cached is not None:
-        if (debug=3D=3DTrue):
-            log.write(cached)
+        if debug =3D=3D True:
+            log.write(cached + '\n')
         cached =3D fix_path(cached)
         cached =3D cached.replace(cpython_tag,'*')
         if "_sysconfigdata" in cached:
             cached =3D cached.replace(sysconfig._get_sysconfigdata_name(=
), "_sysconfigdata*")
         print (cached)
=20
-if debug=3D=3DTrue:
+if debug =3D=3D True:
     log.close()
--=20
2.25.1

