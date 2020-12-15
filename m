Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.936.1608060223757400199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4E6E838C149D
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:44 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.9.1 FAILED
Message-ID: <MADEUP.1650FA4155320AE0.1152@lists.openembedded.org>
X-Groupsio-MsgNum: 145703
Content-Type: multipart/mixed; boundary="===============7698601909052676842=="

--===============7698601909052676842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3* to *3.9.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.9.0-3.9.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============7698601909052676842==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.9.0-3.9.1.patch"

From 083b549662efbd1a44214cf3fd7f3023684320cd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 07:22:07 +0000
Subject: [PATCH] python3: upgrade 3.9.0 -> 3.9.1

---
 ...-search-system-for-headers-libraries.patch |    6 +-
 ...fig-append-STAGING_LIBDIR-python-sys.patch |   10 +-
 ...tutils-prefix-is-inside-staging-area.patch |    8 +-
 .../python/python3/CVE-2020-27619.patch       |   51 +-
 .../python3/check_build_completeness.py       |   17 -
 .../python/python3/create_manifest3.py        |  433 ------
 .../python/python3/get_module_deps3.py        |  162 ---
 .../python/python3/python3-manifest.json      | 1236 -----------------
 .../python/python3/reformat_sysconfig.py      |   21 -
 .../recipes-devtools/python/python3/run-ptest |    3 -
 .../{python3_3.9.0.bb => python3_3.9.1.bb}    |   11 +-
 11 files changed, 19 insertions(+), 1939 deletions(-)
 delete mode 100755 meta/recipes-devtools/python/python3/check_build_completeness.py
 delete mode 100644 meta/recipes-devtools/python/python3/create_manifest3.py
 delete mode 100644 meta/recipes-devtools/python/python3/get_module_deps3.py
 delete mode 100644 meta/recipes-devtools/python/python3/python3-manifest.json
 delete mode 100644 meta/recipes-devtools/python/python3/reformat_sysconfig.py
 delete mode 100644 meta/recipes-devtools/python/python3/run-ptest
 rename meta/recipes-devtools/python/{python3_3.9.0.bb => python3_3.9.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index a94fa0a5a9..d6f2408157 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 9da913bf5f39c6fe737219af7419170574d6fbfb Mon Sep 17 00:00:00 2001
+From 251cdecde6e7e48c233f1c22c3e2a77cd610548d Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index a0bf9ea..da099bf 100644
+index 7767744..cd3bd36 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -674,8 +674,8 @@ class PyBuildExt(build_ext):
+@@ -769,8 +769,8 @@ class PyBuildExt(build_ext):
              add_dir_to_list(self.compiler.include_dirs,
                              sysconfig.get_config_var("INCLUDEDIR"))
  
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index b982691b36..9e7a179f06 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From e65bfe22c858872b08366aff49119d4145a77f40 Mon Sep 17 00:00:00 2001
+From cdfa30a62dceb7cfbde06d57eee26a5f0095a5f2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 4 insertions(+)
 
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index b51629e..2df348c 100644
+index 37feae5..4774e12 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -438,6 +438,8 @@ def _init_posix():
+@@ -444,6 +444,8 @@ def _init_posix():
          platform=sys.platform,
          multiarch=getattr(sys.implementation, '_multiarch', ''),
      ))
@@ -28,10 +28,10 @@ index b51629e..2df348c 100644
      build_time_vars = _temp.build_time_vars
      global _config_vars
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index b2d790b..405273c 100644
+index ed0462b..17ce642 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -419,6 +419,8 @@ def _init_posix(vars):
+@@ -417,6 +417,8 @@ def _init_posix(vars):
      """Initialize the module as appropriate for POSIX systems."""
      # _sysconfigdata is generated at build time, see _generate_posix_vars()
      name = _get_sysconfigdata_name()
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 5a39cf8933..e5aa3055bb 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,7 +1,7 @@
-From c52fa7948ef109db1132fdc1aee0b68f8d767b4e Mon Sep 17 00:00:00 2001
+From ffae950c7b5849a3e8340b03e35b44f8b5f153a9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
-Subject: [PATCH 1/2] python3: Add target and native recipes
+Subject: [PATCH] python3: Add target and native recipes
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -12,6 +12,7 @@ Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
 Signed-off-by: Phil Blundell <philb@gnu.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+
 ---
  Lib/distutils/sysconfig.py | 14 +++++++++++---
  1 file changed, 11 insertions(+), 3 deletions(-)
@@ -55,6 +56,3 @@ index 4774e12..ccf7d58 100644
                                   "python" + get_python_version())
          if standard_lib:
              return libpython
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
index b2053e7a47..3d5ba8db5d 100644
--- a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
+++ b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
@@ -1,4 +1,4 @@
-From b664a1df4ee71d3760ab937653b10997081b1794 Mon Sep 17 00:00:00 2001
+From ed649e88a564af4ec05aa81e9f2a783f9f983d52 Mon Sep 17 00:00:00 2001
 From: "Miss Skeleton (bot)" <31488909+miss-islington@users.noreply.github.com>
 Date: Tue, 6 Oct 2020 05:37:36 -0700
 Subject: [PATCH] bpo-41944: No longer call eval() on content received via HTTP
@@ -13,56 +13,13 @@ CVE: CVE-2020-27619
 Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
 
 ---
- Lib/test/multibytecodec_support.py            | 22 +++++++------------
- .../2020-10-05-17-43-46.bpo-41944.rf1dYb.rst  |  1 +
- 2 files changed, 9 insertions(+), 14 deletions(-)
+ Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst | 1 +
+ 1 file changed, 1 insertion(+)
  create mode 100644 Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
 
-diff --git a/Lib/test/multibytecodec_support.py b/Lib/test/multibytecodec_support.py
-index cca8af67d6d1d..f76c0153f5ecf 100644
---- a/Lib/test/multibytecodec_support.py
-+++ b/Lib/test/multibytecodec_support.py
-@@ -305,29 +305,23 @@ def test_mapping_file(self):
-             self._test_mapping_file_plain()
- 
-     def _test_mapping_file_plain(self):
--        unichrs = lambda s: ''.join(map(chr, map(eval, s.split('+'))))
-+        def unichrs(s):
-+            return ''.join(chr(int(x, 16)) for x in s.split('+'))
-+
-         urt_wa = {}
- 
-         with self.open_mapping_file() as f:
-             for line in f:
-                 if not line:
-                     break
--                data = line.split('#')[0].strip().split()
-+                data = line.split('#')[0].split()
-                 if len(data) != 2:
-                     continue
- 
--                csetval = eval(data[0])
--                if csetval <= 0x7F:
--                    csetch = bytes([csetval & 0xff])
--                elif csetval >= 0x1000000:
--                    csetch = bytes([(csetval >> 24), ((csetval >> 16) & 0xff),
--                                    ((csetval >> 8) & 0xff), (csetval & 0xff)])
--                elif csetval >= 0x10000:
--                    csetch = bytes([(csetval >> 16), ((csetval >> 8) & 0xff),
--                                    (csetval & 0xff)])
--                elif csetval >= 0x100:
--                    csetch = bytes([(csetval >> 8), (csetval & 0xff)])
--                else:
-+                if data[0][:2] != '0x':
-+                    self.fail(f"Invalid line: {line!r}")
-+                csetch = bytes.fromhex(data[0][2:])
-+                if len(csetch) == 1 and 0x80 <= csetch[0]:
-                     continue
- 
-                 unich = unichrs(data[1])
 diff --git a/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
 new file mode 100644
-index 0000000000000..4f9782f1c85af
+index 0000000..4f9782f
 --- /dev/null
 +++ b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
 @@ -0,0 +1 @@
diff --git a/meta/recipes-devtools/python/python3/check_build_completeness.py b/meta/recipes-devtools/python/python3/check_build_completeness.py
deleted file mode 100755
index a1eace3f57..0000000000
--- a/meta/recipes-devtools/python/python3/check_build_completeness.py
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/usr/bin/env python3
-import sys
-logfile = open(sys.argv[1]).read()
-
-necessary_bits = logfile.find("The necessary bits to build these optional modules were not found")
-to_find_bits = logfile.find("To find the necessary bits, look in setup.py in detect_modules() for the module's name.")
-if necessary_bits != -1:
-    print("%s" %(logfile[necessary_bits:to_find_bits]))
-
-failed_to_build = logfile.find("Failed to build these modules:")
-if failed_to_build != -1:
-    failed_to_build_end = logfile.find("\n\n", failed_to_build)
-    print("%s" %(logfile[failed_to_build:failed_to_build_end]))
-
-if necessary_bits != -1 or failed_to_build != -1:
-    sys.exit(1)
-
diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
deleted file mode 100644
index 4da02a2991..0000000000
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ /dev/null
@@ -1,433 +0,0 @@
-# This script is used as a bitbake task to create a new python manifest
-# $ bitbake python -c create_manifest
-#
-# Our goal is to keep python-core as small as posible and add other python
-# packages only when the user needs them, hence why we split upstream python
-# into several packages.
-#
-# In a very simplistic way what this does is: 
-# Launch python and see specifically what is required for it to run at a minimum
-#
-# Go through the python-manifest file and launch a separate task for every single
-# one of the files on each package, this task will check what was required for that
-# specific module to run, these modules will be called dependencies.
-# The output of such task will be a list of the modules or dependencies that were
-# found for that file.
-#
-# Such output will be parsed by this script, we will look for each dependency on the
-# manifest and if we find that another package already includes it, then we will add
-# that package as an RDEPENDS to the package we are currently checking; in case we dont
-# find the current dependency on any other package we will add it to the current package
-# as part of FILES.
-#
-#
-# This way we will create a new manifest from the data structure that was built during
-# this process, on this new manifest each package will contain specifically only
-# what it needs to run.
-#
-# There are some caveats which we try to deal with, such as repeated files on different
-# packages, packages that include folders, wildcards, and special packages.
-# Its also important to note that this method only works for python files, and shared
-# libraries. Static libraries, header files and binaries need to be dealt with manually.
-#
-# This script differs from its python2 version mostly on how shared libraries are handled
-# The manifest file for python3 has an extra field which contains the cached files for
-# each package.
-# Tha method to handle cached files does not work when a module includes a folder which
-# itself contains the pycache folder, gladly this is almost never the case.
-#
-# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29 at gmail dot com>
-
-
-import sys
-import subprocess
-import json
-import os
-import collections
-
-# Get python version from ${PYTHON_MAJMIN}
-pyversion = str(sys.argv[1])
-
-# Hack to get native python search path (for folders), not fond of it but it works for now
-pivot = 'recipe-sysroot-native'
-for p in sys.path:
-    if pivot in p:
-        nativelibfolder = p[:p.find(pivot)+len(pivot)]
-
-# Empty dict to hold the whole manifest
-new_manifest = collections.OrderedDict()
-
-# Check for repeated files, folders and wildcards
-allfiles = []
-repeated = []
-wildcards = []
-
-hasfolders = []
-allfolders = []
-
-def isFolder(value):
-    value = value.replace('${PYTHON_MAJMIN}',pyversion)
-    if os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
-        return True
-    else:
-        return False
-
-def isCached(item):
-    if '__pycache__' in item:
-        return True
-    else:
-        return False
-
-def prepend_comments(comments, json_manifest):
-    with open(json_manifest, 'r+') as manifest:
-        json_contents = manifest.read()
-        manifest.seek(0, 0)
-        manifest.write(comments + json_contents)
-
-# Read existing JSON manifest
-with open('python3-manifest.json') as manifest:
-    # The JSON format doesn't allow comments so we hack the call to keep the comments using a marker
-    manifest_str =  manifest.read()
-    json_start = manifest_str.find('# EOC') + 6 # EOC + \n
-    manifest.seek(0)
-    comments = manifest.read(json_start)
-    manifest_str = manifest.read()
-    old_manifest = json.loads(manifest_str, object_pairs_hook=collections.OrderedDict)
-
-#
-# First pass to get core-package functionality, because we base everything on the fact that core is actually working
-# Not exactly the same so it should not be a function
-#
-
-print ('Getting dependencies for package: core')
-
-
-# This special call gets the core dependencies and
-# appends to the old manifest so it doesnt hurt what it
-# currently holds.
-# This way when other packages check for dependencies
-# on the new core package, they will still find them
-# even when checking the old_manifest
-
-output = subprocess.check_output([sys.executable, 'get_module_deps3.py', 'python-core-package']).decode('utf8')
-for coredep in output.split():
-    coredep = coredep.replace(pyversion,'${PYTHON_MAJMIN}')
-    if isCached(coredep):
-        if coredep not in old_manifest['core']['cached']:
-            old_manifest['core']['cached'].append(coredep)
-    else:
-        if coredep not in old_manifest['core']['files']:
-            old_manifest['core']['files'].append(coredep)
-
-
-# The second step is to loop through the existing files contained in the core package
-# according to the old manifest, identify if they are  modules, or some other type 
-# of file that we cant import (directories, binaries, configs) in which case we
-# can only assume they were added correctly (manually) so we ignore those and 
-# pass them to the manifest directly.
-
-for filedep in old_manifest['core']['files']:
-    if isFolder(filedep):
-        if isCached(filedep):
-            if filedep not in old_manifest['core']['cached']:
-                old_manifest['core']['cached'].append(filedep)
-        else:
-            if filedep not in old_manifest['core']['files']:
-                old_manifest['core']['files'].append(filedep)
-        continue
-    if '${bindir}' in filedep:
-        if filedep not in old_manifest['core']['files']:
-            old_manifest['core']['files'].append(filedep)
-        continue
-    if filedep == '':
-        continue
-    if '${includedir}' in filedep:
-        if filedep not in old_manifest['core']['files']:
-            old_manifest['core']['files'].append(filedep)
-        continue
-
-    # Get actual module name , shouldnt be affected by libdir/bindir, etc.
-    pymodule = os.path.splitext(os.path.basename(os.path.normpath(filedep)))[0]
-
-
-    # We now know that were dealing with a python module, so we can import it
-    # and check what its dependencies are.
-    # We launch a separate task for each module for deterministic behavior.
-    # Each module will only import what is necessary for it to work in specific.
-    # The output of each task will contain each module's dependencies
-
-    print ('Getting dependencies for module: %s' % pymodule)
-    output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule]).decode('utf8')
-    print ('The following dependencies were found for module %s:\n' % pymodule)
-    print (output)
-
-
-    for pymodule_dep in output.split():
-        pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
-
-        if isCached(pymodule_dep):
-            if pymodule_dep not in old_manifest['core']['cached']:
-                old_manifest['core']['cached'].append(pymodule_dep)
-        else:
-            if pymodule_dep not in old_manifest['core']['files']:
-                old_manifest['core']['files'].append(pymodule_dep)
-
-
-# At this point we are done with the core package.
-# The old_manifest dictionary is updated only for the core package because
-# all others will use this a base.
-
-
-# To improve the script speed, we check which packages contain directories
-# since we will be looping through (only) those later.
-for pypkg in old_manifest:
-    for filedep in old_manifest[pypkg]['files']:
-        if isFolder(filedep):
-            print ('%s is a folder' % filedep)
-            if pypkg not in hasfolders:
-                hasfolders.append(pypkg)
-            if filedep not in allfolders:
-                allfolders.append(filedep)
-
-
-
-# This is the main loop that will handle each package.
-# It works in a similar fashion than the step before, but
-# we will now be updating a new dictionary that will eventually
-# become the new manifest.
-#
-# The following loops though all packages in the manifest,
-# through all files on each of them, and checks whether or not
-# they are modules and can be imported.
-# If they can be imported, then it checks for dependencies for
-# each of them by launching a separate task.
-# The output of that task is then parsed and the manifest is updated
-# accordingly, wether it should add the module on FILES for the current package
-# or if that module already belongs to another package then the current one 
-# will RDEPEND on it
-
-for pypkg in old_manifest:
-    # Use an empty dict as data structure to hold data for each package and fill it up
-    new_manifest[pypkg] = collections.OrderedDict()
-    new_manifest[pypkg]['summary'] = old_manifest[pypkg]['summary']
-    new_manifest[pypkg]['rdepends'] = []
-    new_manifest[pypkg]['files'] = []
-    new_manifest[pypkg]['cached'] = old_manifest[pypkg]['cached']
-
-    # All packages should depend on core
-    if pypkg != 'core':
-        new_manifest[pypkg]['rdepends'].append('core')
-        new_manifest[pypkg]['cached'] = []
-
-    print('\n')
-    print('--------------------------')
-    print ('Handling package %s' % pypkg)
-    print('--------------------------')
-
-    # Handle special cases, we assume that when they were manually added 
-    # to the manifest we knew what we were doing.
-    special_packages = ['misc', 'modules', 'dev', 'tests']
-    if pypkg in special_packages or 'staticdev' in pypkg:
-        print('Passing %s package directly' % pypkg)
-        new_manifest[pypkg] = old_manifest[pypkg]
-        continue
-
-    for filedep in old_manifest[pypkg]['files']:
-        # We already handled core on the first pass, we can ignore it now
-        if pypkg == 'core':
-            if filedep not in new_manifest[pypkg]['files']:
-                new_manifest[pypkg]['files'].append(filedep)
-            continue
-
-        # Handle/ignore what we cant import
-        if isFolder(filedep):
-            new_manifest[pypkg]['files'].append(filedep)
-            # Asyncio (and others) are both the package and the folder name, we should not skip those...
-            path,mod = os.path.split(filedep)
-            if mod != pypkg:
-                continue
-        if '${bindir}' in filedep:
-            if filedep not in new_manifest[pypkg]['files']:
-                new_manifest[pypkg]['files'].append(filedep)
-            continue
-        if filedep == '':
-            continue
-        if '${includedir}' in filedep:
-            if filedep not in new_manifest[pypkg]['files']:
-                new_manifest[pypkg]['files'].append(filedep)
-            continue
-
-        # Get actual module name , shouldnt be affected by libdir/bindir, etc.
-        # We need to check if the imported module comes from another (e.g. sqlite3.dump)
-        path,pymodule = os.path.split(filedep)
-        path = os.path.basename(path)
-        pymodule = os.path.splitext(os.path.basename(pymodule))[0]
-
-        # If this condition is met, it means we need to import it from another module
-        # or its the folder itself (e.g. unittest)
-        if path == pypkg:
-            if pymodule:
-                pymodule = path + '.' + pymodule
-            else:
-                pymodule = path
-
-
-
-        # We now know that were dealing with a python module, so we can import it
-        # and check what its dependencies are.
-        # We launch a separate task for each module for deterministic behavior.
-        # Each module will only import what is necessary for it to work in specific.
-        # The output of each task will contain each module's dependencies
-
-        print ('\nGetting dependencies for module: %s' % pymodule)
-        output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule]).decode('utf8')
-        print ('The following dependencies were found for module %s:\n' % pymodule)
-        print (output)
-
-        reportFILES = []
-        reportRDEPS = []
-
-        for pymodule_dep in output.split():
-
-            # Warning: This first part is ugly
-            # One of the dependencies that was found, could be inside of one of the folders included by another package
-            # We need to check if this happens so we can add the package containing the folder as an rdependency
-            # e.g. Folder encodings contained in codecs
-            # This would be solved if no packages included any folders
-
-            # This can be done in two ways:
-            # 1 - We assume that if we take out the filename from the path we would get
-            #   the folder string, then we would check if folder string is in the list of folders
-            #   This would not work if a package contains a folder which contains another folder
-            #   e.g. path/folder1/folder2/filename  folder_string= path/folder1/folder2
-            #   folder_string would not match any value contained in the list of folders
-            #
-            # 2 - We do it the other way around, checking if the folder is contained in the path
-            #   e.g. path/folder1/folder2/filename  folder_string= path/folder1/folder2
-            #   is folder_string inside path/folder1/folder2/filename?, 
-            #   Yes, it works, but we waste a couple of milliseconds.
-
-            pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
-            inFolders = False
-            for folder in allfolders:
-                # The module could have a directory named after it, e.g. xml, if we take out the filename from the path
-                # we'll end up with ${libdir}, and we want ${libdir}/xml
-                if isFolder(pymodule_dep):
-                    check_path = pymodule_dep
-                else:
-                    check_path = os.path.dirname(pymodule_dep)
-                if folder in check_path :
-                    inFolders = True # Did we find a folder?
-                    folderFound = False # Second flag to break inner for
-                    # Loop only through packages which contain folders
-                    for pypkg_with_folder in hasfolders:
-                        if (folderFound == False):
-                            # print('Checking folder %s on package %s' % (pymodule_dep,pypkg_with_folder))
-                            for folder_dep in old_manifest[pypkg_with_folder]['files'] or folder_dep in old_manifest[pypkg_with_folder]['cached']:
-                                if folder_dep == folder:
-                                    print ('%s folder found in %s' % (folder, pypkg_with_folder))
-                                    folderFound = True
-                                    if pypkg_with_folder not in new_manifest[pypkg]['rdepends'] and pypkg_with_folder != pypkg:
-                                        new_manifest[pypkg]['rdepends'].append(pypkg_with_folder)
-                        else:
-                            break
-
-            # A folder was found so we're done with this item, we can go on
-            if inFolders:
-                continue
-
-
-
-            # No directories beyond this point
-            # We might already have this module on the dictionary since it could depend on a (previously checked) module
-            if pymodule_dep not in new_manifest[pypkg]['files'] and pymodule_dep not in new_manifest[pypkg]['cached']:
-                # Handle core as a special package, we already did it so we pass it to NEW data structure directly
-                if pypkg == 'core':
-                    print('Adding %s to %s FILES' % (pymodule_dep, pypkg))
-                    if pymodule_dep.endswith('*'):
-                        wildcards.append(pymodule_dep)
-                    if isCached(pymodule_dep):
-                        new_manifest[pypkg]['cached'].append(pymodule_dep)
-                    else:
-                        new_manifest[pypkg]['files'].append(pymodule_dep)
-
-                    # Check for repeated files
-                    if pymodule_dep not in allfiles:
-                        allfiles.append(pymodule_dep)
-                    else:
-                        if pymodule_dep not in repeated:
-                            repeated.append(pymodule_dep)
-                else:
-
-
-                    # Last step: Figure out if we this belongs to FILES or RDEPENDS
-                    # We check if this module is already contained on another package, so we add that one
-                    # as an RDEPENDS, or if its not, it means it should be contained on the current
-                    # package, and we should add it to FILES
-                    for possible_rdep in old_manifest:
-                        # Debug
-                        # print('Checking %s ' % pymodule_dep + ' in %s' % possible_rdep)
-                        if pymodule_dep in old_manifest[possible_rdep]['files'] or pymodule_dep in old_manifest[possible_rdep]['cached']:
-                            # Since were nesting, we need to check its not the same pypkg
-                            if(possible_rdep != pypkg):
-                                if possible_rdep not in new_manifest[pypkg]['rdepends']:
-                                    # Add it to the new manifest data struct as RDEPENDS since it contains something this module needs
-                                    reportRDEPS.append('Adding %s to %s RDEPENDS, because it contains %s\n' % (possible_rdep, pypkg, pymodule_dep))
-                                    new_manifest[pypkg]['rdepends'].append(possible_rdep)
-                                break
-                    else:
-
-                      # Since this module wasnt found on another package, it is not an RDEP,
-                      # so we add it to FILES for this package.
-                      # A module shouldn't contain itself (${libdir}/python3/sqlite3 shouldnt be on sqlite3 files)
-                      if os.path.basename(pymodule_dep) != pypkg:
-                        reportFILES.append(('Adding %s to %s FILES\n' % (pymodule_dep, pypkg)))
-                        if isCached(pymodule_dep):
-                            new_manifest[pypkg]['cached'].append(pymodule_dep)
-                        else:
-                            new_manifest[pypkg]['files'].append(pymodule_dep)
-                        if pymodule_dep.endswith('*'):
-                            wildcards.append(pymodule_dep)
-                        if pymodule_dep not in allfiles:
-                            allfiles.append(pymodule_dep)
-                        else:
-                            if pymodule_dep not in repeated:
-                                repeated.append(pymodule_dep)
-
-        print('\n')
-        print('#################################')
-        print('Summary for module %s' % pymodule)
-        print('FILES found for module %s:' % pymodule)
-        print(''.join(reportFILES))
-        print('RDEPENDS found for module %s:' % pymodule)
-        print(''.join(reportRDEPS))
-        print('#################################')
-
-print('The following FILES contain wildcards, please check if they are necessary')
-print(wildcards)
-print('The following FILES contain folders, please check if they are necessary')
-print(hasfolders)
-
-
-# Sort it just so it looks nicer
-for pypkg in new_manifest:
-    new_manifest[pypkg]['files'].sort()
-    new_manifest[pypkg]['cached'].sort()
-    new_manifest[pypkg]['rdepends'].sort()
-
-# Create the manifest from the data structure that was built
-with open('python3-manifest.json.new','w') as outfile:
-    json.dump(new_manifest,outfile, indent=4)
-    outfile.write('\n')
-
-prepend_comments(comments,'python3-manifest.json.new')
-
-if (repeated):
-    error_msg = '\n\nERROR:\n'
-    error_msg += 'The following files are repeated (contained in more than one package),\n'
-    error_msg += 'this is likely to happen when new files are introduced after an upgrade,\n'
-    error_msg += 'please check which package should get it,\n modify the manifest accordingly and re-run the create_manifest task:\n'
-    error_msg += '\n'.join(repeated)
-    error_msg += '\n'
-    sys.exit(error_msg)
-
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
deleted file mode 100644
index 6806f23172..0000000000
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ /dev/null
@@ -1,162 +0,0 @@
-# This script is launched on separate task for each python module
-# It checks for dependencies for that specific module and prints 
-# them out, the output of this execution will have all dependencies
-# for a specific module, which will be parsed an dealt on create_manifest.py
-#
-# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29@gmail.com>
-
-# We can get a log per module, for all the dependencies that were found, but its messy.
-debug=False
-
-import sys
-import os
-
-# We can get a list of the modules which are currently required to run python
-# so we run python-core and get its modules, we then import what we need
-# and check what modules are currently running, if we substract them from the
-# modules we had initially, we get the dependencies for the module we imported.
-
-# We use importlib to achieve this, so we also need to know what modules importlib needs
-import importlib
-
-core_deps=set(sys.modules)
-
-def fix_path(dep_path):
-    import os
-    # We DONT want the path on our HOST system
-    pivot='recipe-sysroot-native'
-    dep_path=dep_path[dep_path.find(pivot)+len(pivot):]
-
-    if '/usr/bin' in dep_path:
-        dep_path = dep_path.replace('/usr/bin''${bindir}')
-
-    # Handle multilib, is there a better way?
-    if '/usr/lib32' in dep_path:
-        dep_path = dep_path.replace('/usr/lib32','${libdir}')
-    if '/usr/lib64' in dep_path:
-        dep_path = dep_path.replace('/usr/lib64','${libdir}')
-    if '/usr/lib' in dep_path:
-        dep_path = dep_path.replace('/usr/lib','${libdir}')
-    if '/usr/include' in dep_path:
-        dep_path = dep_path.replace('/usr/include','${includedir}')
-    if '__init__.' in dep_path:
-        dep_path =  os.path.split(dep_path)[0]
-    return dep_path
-
-
-# Module to import was passed as an argument
-current_module =  str(sys.argv[1]).rstrip()
-if(debug==True):
-    log = open('log_%s' % current_module,'w')
-    log.write('Module %s generated the following dependencies:\n' % current_module)
-try:
-    m = importlib.import_module(current_module)
-    # handle python packages which may not include all modules in the __init__
-    if os.path.basename(m.__file__) == "__init__.py":
-        modulepath = os.path.dirname(m.__file__)
-        for i in os.listdir(modulepath):
-            if i.startswith("_") or not(i.endswith(".py")):
-                continue
-            submodule = "{}.{}".format(current_module, i[:-3])
-            try:
-                importlib.import_module(submodule)
-            except:
-                pass # ignore all import or other exceptions raised during import
-except ImportError as e:
-    if (debug==True):
-        log.write('Module was not found')
-    pass
-
-
-# Get current module dependencies, dif will contain a list of specific deps for this module
-module_deps=set(sys.modules)
-
-# We handle the core package (1st pass on create_manifest.py) as a special case
-if current_module == 'python-core-package':
-    dif = core_deps
-else:
-    # We know this is not the core package, so there must be a difference.
-    dif = module_deps-core_deps
-
-
-# Check where each dependency came from
-for item in dif:
-    dep_path=''
-    try:
-        if (debug==True):
-            log.write('Calling: sys.modules[' + '%s' % item + '].__file__\n')
-        dep_path = sys.modules['%s' % item].__file__
-    except AttributeError as e:
-        # Deals with thread (builtin module) not having __file__ attribute
-        if debug==True:
-            log.write(item + ' ')
-            log.write(str(e))
-            log.write('\n')
-        pass
-    except NameError as e:
-        # Deals with NameError: name 'dep_path' is not defined
-        # because module is not found (wasn't compiled?), e.g. bddsm
-        if (debug==True):
-            log.write(item+' ') 
-            log.write(str(e))                                              
-        pass
-
-    # Site-customize is a special case since we (OpenEmbedded) put it there manually
-    if 'sitecustomize' in dep_path:
-        dep_path = '${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py'
-        # Prints out result, which is what will be used by create_manifest
-        print (dep_path)
-        continue
-
-    dep_path = fix_path(dep_path)
-
-    import sysconfig
-    soabi=sysconfig.get_config_var('SOABI')
-    # Check if its a shared library and deconstruct it
-    if soabi in dep_path:
-        if (debug==True):
-            log.write('Shared library found in %s' % dep_path)
-        dep_path = dep_path.replace(soabi,'*')
-        print (dep_path)
-        continue
-    if "_sysconfigdata" in dep_path:
-        dep_path = dep_path.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
-
-    if (debug==True):
-        log.write(dep_path+'\n')
-    # Prints out result, which is what will be used by create_manifest
-    print (dep_path)
-
-
-    import imp
-    cpython_tag = imp.get_tag() 
-    cached=''
-    # Theres no naive way to find *.pyc files on python3
-    try:
-        if (debug==True):
-            log.write('Calling: sys.modules[' + '%s' % item + '].__cached__\n')
-        cached = sys.modules['%s' % item].__cached__
-    except AttributeError as e:
-        # Deals with thread (builtin module) not having __cached__ attribute
-        if debug==True:
-            log.write(item + ' ')
-            log.write(str(e))
-            log.write('\n')
-        pass
-    except NameError as e:
-        # Deals with NameError: name 'cached' is not defined
-        if (debug==True):
-            log.write(item+' ') 
-            log.write(str(e))                                              
-        pass
-    if cached is not None:
-        if (debug==True):
-            log.write(cached)
-        cached = fix_path(cached)
-        cached = cached.replace(cpython_tag,'*')
-        if "_sysconfigdata" in cached:
-            cached = cached.replace(sysconfig._get_sysconfigdata_name(), "_sysconfigdata*")
-        print (cached)
-
-if debug==True:
-    log.close()
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
deleted file mode 100644
index 615dc3a5e5..0000000000
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ /dev/null
@@ -1,1236 +0,0 @@
-# DO NOT (entirely) modify this file manually, please read.
-#
-# IMPORTANT NOTE:
-# Please keep in mind that the create_manifest task relies on the fact the the
-# target and native Python packages are the same, and it also needs to be executed
-# with a fully working native package (with all the PACKAGECONFIGs enabled and all
-# and all the modules should be working, check log.do_compile), otherwise the script
-# will fail to find dependencies correctly, this note is valid either if you are
-# upgrading to a new Python version or adding a new package.
-#
-#
-# If you are adding a new package please follow the next steps:
-#     How to add a new package:
-#     - If a user wants to add a new package all that has to be done is:
-#     Modify the python3-manifest.json file, and add the required file(s) to the FILES list,
-#     fill up the SUMMARY section as well, the script should handle all the rest.
-#
-#     Real example:
-#     We want to add a web browser package, including the file webbrowser.py
-#     which at the moment is on python3-misc.
-#     "webbrowser": {
-#         "files": ["${libdir}/python${PYTHON_MAJMIN}/lib-dynload/webbrowser.py"],
-#         "rdepends": [],
-#         "summary": "Python Web Browser support"}
-#
-#     * Note that the rdepends field was left empty
-#
-#     We run $ bitbake python3 -c create_manifest and the resulting manifest
-#     should be completed after a few seconds, showing something like:
-#     "webbrowser": {
-#         "files": ["${libdir}/python${PYTHON_MAJMIN}/webbrowser.py"],
-#         "rdepends": ["core","fcntl","io","pickle","shell","subprocess"],
-#         "summary": "Python Web Browser support"}
-#
-#
-# If you are upgrading Python to a new version please follow the next steps:
-#     After each Python upgrade, the create_manifest task should be executed, because we
-#     don't control what changes on upstream Python, so, some module dependency
-#     might have changed without us realizing it, a certain module can either have
-#     more or less dependencies, or could be depending on a new file that was just
-#     created on the new release and for obvious reasons we wouldn't have it on our
-#     old manifest, all of these issues would cause runtime errors on our system.
-#
-#     - Upgrade both the native and target Python packages to a new version
-#     - Run the create_manifest task for the target Python package as its shown below:
-#
-#     $ bitbake python3 -c create_manifest
-#
-#     This will automatically replace your manifest file located under the Python directory
-#     with an new one, which contains the new dependencies (if any).
-#
-#     Several things could have gone wrong here, I will try to explain a few:
-#
-#     a) A new file was introduced on this release, e.g. sha3*.so:
-#        The task will check what its needed to import every module, more than one module would
-#        would probably depend on sha3*.so, although only one module should contain it.
-#
-#        After running the task, the new manifest will have the sha3*.so file on more than one
-#        module, you need to manually decide which one of them should get it and delete it from
-#        the others, for example sha3*.so should likely be on ${PN}-crypt.
-#        Once you have deleted from the others you need to run the create_manifest task again,
-#        this will populate the other module's rdepends fields, with ${PN}-crypt and you should be
-#        good to go.
-#
-#     b) The native package wasn't built correctly and its missing a certain module:
-#        As mentioned before, you need to make sure the native package was built with all the modules
-#        because it is used as base to build the manifest file, you need to manually check log.do_compile
-#        since it won't error out the compile function if its only missing a couple of modules.
-#
-#        e.g. missing the _uuid module, log.do_compile would show the following:
-#        Python build finished successfully!
-#        The necessary bits to build these optional modules were not found:
-#        _uuid
-#
-#        What will happen here is that the new manifest would not be aware that the _uuid module exists, so
-#        not only we won't know of any dependencies to it, but also, the _uuid* files will be packaged on
-#        the misc package (which is where any file that doesn't belong anywhere else ends up).
-#
-#        This will eventually cause runtime errors on our system if we don't include the misc package on
-#        on our image, because the _uuid files will be missing.
-#        If we build the _uuid module correctly and run the create_manifest task the _uuid files will be
-#        detected correctly along with its dependencies, and we will get a working manifest.
-#
-#        This is the reason why it is important to make sure we have a fully working native build,
-#        so we can avoid these errors.
-#
-#
-#
-# DO NOT MODIFY THE NEXT LINE!, IT IS USED AS A MARKER FOR THE ACTUAL JSON MANIFEST
-# EOC
-{
-    "tests": {
-        "summary": "Python test suite",
-        "rdepends": [
-            "core",
-            "modules"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/*/test",
-            "${libdir}/python${PYTHON_MAJMIN}/*/tests",
-            "${libdir}/python${PYTHON_MAJMIN}/idlelib/idle_test/",
-            "${libdir}/python${PYTHON_MAJMIN}/test"
-        ],
-        "cached": []
-    },
-    "2to3": {
-        "summary": "Python automated Python 2 to 3 code translator",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${bindir}/2to3*",
-            "${libdir}/python${PYTHON_MAJMIN}/lib2to3"
-        ],
-        "cached": []
-    },
-    "asyncio": {
-        "summary": "Python Asynchronous I/O",
-        "rdepends": [
-            "core",
-            "io",
-            "logging",
-            "netclient",
-            "numbers",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/asyncio",
-            "${libdir}/python${PYTHON_MAJMIN}/concurrent",
-            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"
-        ],
-        "cached": []
-    },
-    "audio": {
-        "summary": "Python Audio Handling",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/chunk.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/audioop.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/ossaudiodev.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/sndhdr.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sunau.py",
-            "${libdir}/python${PYTHON_MAJMIN}/wave.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/chunk.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sndhdr.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sunau.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
-        ]
-    },
-    "codecs": {
-        "summary": "Python codec",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multibytecodec.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/xdrlib.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/xdrlib.*.pyc"
-        ]
-    },
-    "compile": {
-        "summary": "Python bytecode compilation support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
-            "${libdir}/python${PYTHON_MAJMIN}/filecmp.py",
-            "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
-        ]
-    },
-    "compression": {
-        "summary": "Python high-level compression support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
-            "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/zipfile.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipfile.*.pyc"
-        ]
-    },
-    "core": {
-        "summary": "Python interpreter and core modules",
-        "rdepends": [],
-        "files": [
-            "${bindir}/python${PYTHON_MAJMIN}",
-            "${bindir}/python${PYTHON_MAJMIN}.real",
-            "${bindir}/python3",
-            "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
-            "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
-            "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
-            "${libdir}/python${PYTHON_MAJMIN}/UserString.py",
-            "${libdir}/python${PYTHON_MAJMIN}/__future__.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_abcoll.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_bootlocale.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
-            "${libdir}/python${PYTHON_MAJMIN}/abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ast.py",
-            "${libdir}/python${PYTHON_MAJMIN}/bisect.py",
-            "${libdir}/python${PYTHON_MAJMIN}/bz2.py",
-            "${libdir}/python${PYTHON_MAJMIN}/code.py",
-            "${libdir}/python${PYTHON_MAJMIN}/codecs.py",
-            "${libdir}/python${PYTHON_MAJMIN}/codeop.py",
-            "${libdir}/python${PYTHON_MAJMIN}/collections",
-            "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
-            "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/copy.py",
-            "${libdir}/python${PYTHON_MAJMIN}/copyreg.py",
-            "${libdir}/python${PYTHON_MAJMIN}/csv.py",
-            "${libdir}/python${PYTHON_MAJMIN}/dis.py",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/aliases.py",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/latin_1.py",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/utf_8.py",
-            "${libdir}/python${PYTHON_MAJMIN}/enum.py",
-            "${libdir}/python${PYTHON_MAJMIN}/fnmatch.py",
-            "${libdir}/python${PYTHON_MAJMIN}/functools.py",
-            "${libdir}/python${PYTHON_MAJMIN}/genericpath.py",
-            "${libdir}/python${PYTHON_MAJMIN}/getopt.py",
-            "${libdir}/python${PYTHON_MAJMIN}/gettext.py",
-            "${libdir}/python${PYTHON_MAJMIN}/heapq.py",
-            "${libdir}/python${PYTHON_MAJMIN}/imp.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap_external.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/machinery.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/util.py",
-            "${libdir}/python${PYTHON_MAJMIN}/inspect.py",
-            "${libdir}/python${PYTHON_MAJMIN}/io.py",
-            "${libdir}/python${PYTHON_MAJMIN}/keyword.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/_struct.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/binascii.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/time.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/xreadlines.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lzma.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubprocess.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/math.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/parser.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/readline.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/select.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/time.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/unicodedata.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/xreadlines.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/zlib.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/linecache.py",
-            "${libdir}/python${PYTHON_MAJMIN}/locale.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lzma.py",
-            "${libdir}/python${PYTHON_MAJMIN}/new.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ntpath.py",
-            "${libdir}/python${PYTHON_MAJMIN}/opcode.py",
-            "${libdir}/python${PYTHON_MAJMIN}/operator.py",
-            "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
-            "${libdir}/python${PYTHON_MAJMIN}/os.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
-            "${libdir}/python${PYTHON_MAJMIN}/platform.py",
-            "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
-            "${libdir}/python${PYTHON_MAJMIN}/re.py",
-            "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
-            "${libdir}/python${PYTHON_MAJMIN}/runpy.py",
-            "${libdir}/python${PYTHON_MAJMIN}/selectors.py",
-            "${libdir}/python${PYTHON_MAJMIN}/shutil.py",
-            "${libdir}/python${PYTHON_MAJMIN}/signal.py",
-            "${libdir}/python${PYTHON_MAJMIN}/site.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sre_compile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sre_constants.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sre_parse.py",
-            "${libdir}/python${PYTHON_MAJMIN}/stat.py",
-            "${libdir}/python${PYTHON_MAJMIN}/stringprep.py",
-            "${libdir}/python${PYTHON_MAJMIN}/struct.py",
-            "${libdir}/python${PYTHON_MAJMIN}/subprocess.py",
-            "${libdir}/python${PYTHON_MAJMIN}/symbol.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sysconfig.py",
-            "${libdir}/python${PYTHON_MAJMIN}/textwrap.py",
-            "${libdir}/python${PYTHON_MAJMIN}/threading.py",
-            "${libdir}/python${PYTHON_MAJMIN}/token.py",
-            "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
-            "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
-            "${libdir}/python${PYTHON_MAJMIN}/types.py",
-            "${libdir}/python${PYTHON_MAJMIN}/typing.py",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
-            "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
-            "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
-            "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dis.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/enum.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fnmatch.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/functools.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/genericpath.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ntpath.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/opcode.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pathlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/selectors.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shutil.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/signal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/site.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_compile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_constants.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_parse.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stat.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/aliases.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/utf_8.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*.pyc"
-        ]
-    },
-    "crypt": {
-        "summary": "Python basic cryptographic and hashing support",
-        "rdepends": [
-            "core",
-            "math",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/crypt.py",
-            "${libdir}/python${PYTHON_MAJMIN}/hashlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_crypt.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_md5.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha256.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha512.*.so"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/crypt.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
-        ]
-    },
-    "ctypes": {
-        "summary": "Python C types support",
-        "rdepends": [
-            "core",
-            "crypt",
-            "io",
-            "math"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/ctypes",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes_test.*.so"
-        ],
-        "cached": []
-    },
-    "curses": {
-        "summary": "Python curses support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/curses",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses_panel.*.so"
-        ],
-        "cached": []
-    },
-    "datetime": {
-        "summary": "Python calendar and time support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
-            "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
-            "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc"
-        ]
-    },
-    "db": {
-        "summary": "Python file-based database support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/dbm",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_dbm.*.so"
-        ],
-        "cached": []
-    },
-    "debugger": {
-        "summary": "Python debugger",
-        "rdepends": [
-            "core",
-            "pprint",
-            "shell",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
-        ]
-    },
-    "dev": {
-        "cached": [],
-        "files": [
-            "${base_libdir}/*.a",
-            "${base_libdir}/*.o",
-            "${bindir}/python*-config*",
-            "${datadir}/aclocal",
-            "${datadir}/pkgconfig",
-            "${includedir}",
-            "${libdir}/*.a",
-            "${libdir}/*.la",
-            "${libdir}/*.o",
-            "${libdir}/lib*${SOLIBSDEV}",
-            "${libdir}/pkgconfig"
-        ],
-        "rdepends": [
-            "core",
-            "distutils"
-        ],
-        "summary": "Python development package"
-    },
-    "difflib": {
-        "summary": "Python helpers for computing deltas between objects",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
-        ]
-    },
-    "distutils-windows": {
-        "summary": "Python distribution utilities (Windows installer stubs)",
-        "rdepends": [
-            "core"
-        ],
-        "files": [],
-        "cached": []
-    },
-    "distutils": {
-        "summary": "Python Distribution Utilities",
-        "rdepends": [
-            "compression",
-            "core",
-            "email",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/distutils"
-        ],
-        "cached": []
-    },
-    "doctest": {
-        "summary": "Python framework for running examples in docstrings",
-        "rdepends": [
-            "core",
-            "debugger",
-            "difflib",
-            "pprint",
-            "shell",
-            "stringold",
-            "unittest"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
-        ]
-    },
-    "email": {
-        "summary": "Python email support",
-        "rdepends": [
-            "core",
-            "crypt",
-            "datetime",
-            "io",
-            "math",
-            "mime",
-            "netclient",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/email",
-            "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
-        ]
-    },
-    "fcntl": {
-        "summary": "Python's fcntl interface",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
-        ],
-        "cached": []
-    },
-    "gdbm": {
-        "summary": "Python GNU database support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_gdbm.*.so"
-        ],
-        "cached": []
-    },
-    "html": {
-        "summary": "Python HTML processing support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/formatter.py",
-            "${libdir}/python${PYTHON_MAJMIN}/html"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/formatter.*.pyc"
-        ]
-    },
-    "idle": {
-        "summary": "Python Integrated Development Environment",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${bindir}/idle*",
-            "${libdir}/python${PYTHON_MAJMIN}/idlelib"
-        ],
-        "cached": []
-    },
-    "image": {
-        "summary": "Python graphical image handling",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/colorsys.py",
-            "${libdir}/python${PYTHON_MAJMIN}/imghdr.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imghdr.*.pyc"
-        ]
-    },
-    "io": {
-        "summary": "Python low-level I/O",
-        "rdepends": [
-            "core",
-            "crypt",
-            "math",
-            "netclient",
-            "shell"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ipaddress.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_socket.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ssl.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/termios.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/pipes.py",
-            "${libdir}/python${PYTHON_MAJMIN}/socket.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
-            "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pipes.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
-        ]
-    },
-    "json": {
-        "summary": "Python JSON support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/json",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_json.*.so"
-        ],
-        "cached": []
-    },
-    "logging": {
-        "summary": "Python logging support",
-        "rdepends": [
-            "core",
-            "io",
-            "netserver",
-            "pickle",
-            "stringold",
-            "threading"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/logging"
-        ],
-        "cached": []
-    },
-    "mailbox": {
-        "summary": "Python mailbox format support",
-        "rdepends": [
-            "core",
-            "crypt",
-            "datetime",
-            "email",
-            "fcntl",
-            "io",
-            "math",
-            "mime",
-            "netclient",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
-        ]
-    },
-    "math": {
-        "summary": "Python math support",
-        "rdepends": [
-            "core",
-            "crypt"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/random.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
-        ]
-    },
-    "mime": {
-        "summary": "Python MIME handling APIs",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/quopri.py",
-            "${libdir}/python${PYTHON_MAJMIN}/uu.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uu.*.pyc"
-        ]
-    },
-    "mmap": {
-        "summary": "Python memory-mapped file support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/mmap.*.so"
-        ],
-        "cached": []
-    },
-    "modules": {
-        "cached": [],
-        "files": [],
-        "rdepends": [
-            "2to3",
-            "asyncio",
-            "audio",
-            "codecs",
-            "compile",
-            "compression",
-            "core",
-            "crypt",
-            "ctypes",
-            "curses",
-            "datetime",
-            "db",
-            "debugger",
-            "difflib",
-            "distutils",
-            "doctest",
-            "email",
-            "fcntl",
-            "html",
-            "idle",
-            "image",
-            "io",
-            "json",
-            "logging",
-            "mailbox",
-            "math",
-            "mime",
-            "mmap",
-            "multiprocessing",
-            "netclient",
-            "netserver",
-            "numbers",
-            "pickle",
-            "pkgutil",
-            "plistlib",
-            "pprint",
-            "profile",
-            "pydoc",
-            "resource",
-            "shell",
-            "smtpd",
-            "sqlite3",
-            "stringold",
-            "syslog",
-            "terminal",
-            "threading",
-            "tkinter",
-            "unittest",
-            "unixadmin",
-            "venv",
-            "xml",
-            "xmlrpc"
-        ],
-        "rrecommends": [
-            "distutils-windows"
-        ],
-        "summary": "All Python modules"
-    },
-    "multiprocessing": {
-        "summary": "Python multiprocessing support",
-        "rdepends": [
-            "core",
-            "crypt",
-            "ctypes",
-            "io",
-            "math",
-            "mmap",
-            "netclient",
-            "pickle",
-            "threading"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessing.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixshmem.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/multiprocessing"
-        ],
-        "cached": []
-    },
-    "netclient": {
-        "summary": "Python Internet Protocol clients",
-        "rdepends": [
-            "core",
-            "crypt",
-            "datetime",
-            "email",
-            "io",
-            "math",
-            "mime",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/base64.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
-            "${libdir}/python${PYTHON_MAJMIN}/http",
-            "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
-            "${libdir}/python${PYTHON_MAJMIN}/nntplib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/secrets.py",
-            "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/nntplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
-        ]
-    },
-    "netserver": {
-        "summary": "Python Internet Protocol servers",
-        "rdepends": [
-            "core",
-            "crypt",
-            "datetime",
-            "email",
-            "html",
-            "io",
-            "math",
-            "mime",
-            "netclient",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/cgi.py",
-            "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cgi.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.pyc"
-        ]
-    },
-    "numbers": {
-        "summary": "Python number APIs",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_pydecimal.py",
-            "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
-            "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
-            "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
-        ]
-    },
-    "pickle": {
-        "summary": "Python serialisation/persistence support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_compat_pickle.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_pickle.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/pickle.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pickletools.py",
-            "${libdir}/python${PYTHON_MAJMIN}/shelve.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
-        ]
-    },
-    "pkgutil": {
-        "summary": "Python package extension utility support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [],
-        "cached": []
-    },
-    "plistlib": {
-        "summary": "Generate and parse Mac OS X .plist files",
-        "rdepends": [
-            "core",
-            "datetime",
-            "xml"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc"
-        ]
-    },
-    "pprint": {
-        "summary": "Python pretty-print support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
-        ]
-    },
-    "profile": {
-        "summary": "Python basic performance profiling support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/dataclasses.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/profile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dataclasses.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
-        ]
-    },
-    "pydoc": {
-        "summary": "Python interactive help support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${bindir}/pydoc*",
-            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
-        ]
-    },
-    "resource": {
-        "summary": "Python resource control interface",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/resource.*.so"
-        ],
-        "cached": []
-    },
-    "shell": {
-        "summary": "Python shell-like functionality",
-        "rdepends": [
-            "core",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
-            "${libdir}/python${PYTHON_MAJMIN}/glob.py",
-            "${libdir}/python${PYTHON_MAJMIN}/shlex.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc"
-        ]
-    },
-    "smtpd": {
-        "summary": "Python Simple Mail Transport Daemon",
-        "rdepends": [
-            "core",
-            "crypt",
-            "datetime",
-            "email",
-            "io",
-            "math",
-            "mime",
-            "netclient",
-            "stringold"
-        ],
-        "files": [
-            "${bindir}/smtpd.py",
-            "${libdir}/python${PYTHON_MAJMIN}/asynchat.py",
-            "${libdir}/python${PYTHON_MAJMIN}/asyncore.py",
-            "${libdir}/python${PYTHON_MAJMIN}/smtpd.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asynchat.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asyncore.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtpd.*.pyc"
-        ]
-    },
-    "sqlite3": {
-        "summary": "Python Sqlite3 database support",
-        "rdepends": [
-            "core",
-            "datetime"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sqlite3.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3"
-        ],
-        "cached": []
-    },
-    "stringold": {
-        "summary": "Python string APIs [deprecated]",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/string.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
-        ]
-    },
-    "syslog": {
-        "summary": "Python syslog interface",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/syslog.*.so"
-        ],
-        "cached": []
-    },
-    "terminal": {
-        "summary": "Python terminal controlling support",
-        "rdepends": [
-            "core",
-            "io"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/pty.py",
-            "${libdir}/python${PYTHON_MAJMIN}/tty.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
-        ]
-    },
-    "threading": {
-        "summary": "Python threading & synchronization support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/queue.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
-        ]
-    },
-    "tkinter": {
-        "summary": "Python Tcl/Tk bindings",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-	    "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
-        ],
-        "cached": []
-    },
-    "unittest": {
-        "summary": "Python unit testing framework",
-        "rdepends": [
-            "asyncio",
-            "core",
-            "difflib",
-            "io",
-            "logging",
-            "netclient",
-            "numbers",
-            "pprint",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/unittest",
-            "${libdir}/python${PYTHON_MAJMIN}/unittest/",
-            "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
-        ],
-        "cached": []
-    },
-    "unixadmin": {
-        "summary": "Python Unix administration support",
-        "rdepends": [
-            "core",
-            "io"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/getpass.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/nis.*.so"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
-        ]
-    },
-    "venv": {
-        "summary": "Provides support for creating lightweight virtual environments with their own site directories, optionally isolated from system site directories.",
-        "rdepends": [
-            "core",
-            "logging",
-            "stringold"
-        ],
-        "files": [
-            "${bindir}/pyvenv*",
-            "${libdir}/python${PYTHON_MAJMIN}/venv"
-        ],
-        "cached": []
-    },
-    "xml": {
-        "summary": "Python basic XML support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_elementtree.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/pyexpat.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/xml"
-        ],
-        "cached": []
-    },
-    "xmlrpc": {
-        "summary": "Python XML-RPC support",
-        "rdepends": [
-            "compression",
-            "core",
-            "crypt",
-            "datetime",
-            "email",
-            "fcntl",
-            "html",
-            "io",
-            "math",
-            "mime",
-            "netclient",
-            "netserver",
-            "numbers",
-            "pydoc",
-            "stringold",
-            "xml"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc",
-            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
-        ],
-        "cached": []
-    }
-}
diff --git a/meta/recipes-devtools/python/python3/reformat_sysconfig.py b/meta/recipes-devtools/python/python3/reformat_sysconfig.py
deleted file mode 100644
index c4164313e8..0000000000
--- a/meta/recipes-devtools/python/python3/reformat_sysconfig.py
+++ /dev/null
@@ -1,21 +0,0 @@
-#! /usr/bin/env python3
-#
-# SPDX-License-Identifier: MIT
-#
-# Copyright 2019 by Garmin Ltd. or its subsidiaries
-#
-# A script to reformat python sysconfig
-
-import sys
-import pprint
-l = {}
-g = {}
-with open(sys.argv[1], 'r') as f:
-    exec(f.read(), g, l)
-
-with open(sys.argv[1], 'w') as f:
-    for k in sorted(l.keys()):
-        f.write('%s = ' % k)
-        pprint.pprint(l[k], stream=f, width=sys.maxsize)
-        f.write('\n')
-
diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
deleted file mode 100644
index 405b07f495..0000000000
--- a/meta/recipes-devtools/python/python3/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-python3 -m test -v | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes-devtools/python/python3_3.9.1.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3_3.9.0.bb
rename to meta/recipes-devtools/python/python3_3.9.1.bb
index 19a8950f15..c98c84fec7 100644
--- a/meta/recipes-devtools/python/python3_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3_3.9.1.bb
@@ -6,12 +6,6 @@ SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33223c9ef60c31e3f0e866cb09b65e83"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
-           file://run-ptest \
-           file://create_manifest3.py \
-           file://get_module_deps3.py \
-           file://python3-manifest.json \
-           file://check_build_completeness.py \
-           file://reformat_sysconfig.py \
            file://cgi_py.patch \
            file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
@@ -30,6 +24,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
            file://CVE-2020-27619.patch \
+           file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
+           file://12-distutils-prefix-is-inside-staging-area.patch \
+           file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -38,7 +35,7 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[sha256sum] = "9c73e63c99855709b9be0b3cc9e5b072cb60f37311e8c4e50f15576a0bf82854"
+SRC_URI[sha256sum] = "991c3f8ac97992f3d308fefeb03a64db462574eadbff34ce8bc5bb583d9903ff"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


--===============7698601909052676842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1439 entries from dependency cache.
Parsing recipes...ERROR: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 15, function: <module>
     0011:__anon_20__home_pokybuild_yocto_worker_auh_build_build_poky_meta_classes_blacklist_bbclass(d)
     0012:__anon_177__home_pokybuild_yocto_worker_auh_build_build_poky_meta_classes_siteinfo_bbclass(d)
     0013:__anon_119__home_pokybuild_yocto_worker_auh_build_build_poky_meta_classes_ptest_bbclass(d)
     0014:__anon_114__home_pokybuild_yocto_worker_auh_build_build_poky_meta_classes_update_alternatives_bbclass(d)
 *** 0015:__anon_297__home_pokybuild_yocto_worker_auh_build_build_poky_meta_recipes_devtools_python_python3_3_9_1_bb(d)
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb', lineno: 232, function: __anon_297__home_pokybuild_yocto_worker_auh_build_build_poky_meta_recipes_devtools_python_python3_3_9_1_bb
     0228:    # This python changes the datastore based on the contents of a file, so mark
     0229:    # that dependency.
     0230:    bb.parse.mark_dependency(d, filename)
     0231:
 *** 0232:    with open(filename) as manifest_file:
     0233:        manifest_str =  manifest_file.read()
     0234:        json_start = manifest_str.find('# EOC') + 6
     0235:        manifest_file.seek(json_start)
     0236:        manifest_str = manifest_file.read()
Exception: FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3/python3-manifest.json'

ERROR: Failed to parse recipe: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============7698601909052676842==--
