Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0A473303
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 15:00:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Feb 2015 06:55:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,559,1418112000"; d="scan'208";a="664875867"
Received: from jjurski-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.24.180])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2015 07:00:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 14:59:54 +0000
Message-Id: <48f3187d3bec0116b8bd8520f05811eee3d01a1a.1423666576.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/7] oe-pkgdata-util: improve command-line usage
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
X-List-Received-Date: Wed, 11 Feb 2015 15:00:16 -0000

* Use argparse instead of optparse for standardised help output, options
  and a much cleaner code structure
* Look up pkgdata directory automatically so the user doesn't have to
  specify it
* Use standard logging

NOTE: this does mean a slight change in syntax - if you do want to
specify the pkgdata directory (usually only necessary if you're calling
it from within the build process) you need to use the parameter -p (or
 --pkgdata-dir) and specify this before the command, not after it.

Examples:

oe-pkgdata-util find-path /sbin/mke2fs
oe-pkgdata-util lookup-recipe libelf1
oe-pkgdata-util read-value PKGSIZE libc6
oe-pkgdata-util -p /home/user/oe/build/tmp/sysroots/qemux86-64/pkgdata read-value PKGSIZE libc6

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   2 +-
 meta/classes/license.bbclass      |   2 +-
 meta/lib/oe/package_manager.py    |   2 +-
 meta/lib/oeqa/runtime/_ptest.py   |   2 +-
 scripts/oe-pkgdata-util           | 264 ++++++++++++++++++--------------------
 5 files changed, 132 insertions(+), 140 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 90cfe4f..211dcf1 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -374,7 +374,7 @@ buildhistory_get_installed() {
 	printf "" > $1/installed-package-sizes.tmp
 	cat $pkgcache | while read pkg pkgfile pkgarch
 	do
-		size=`oe-pkgdata-util read-value ${PKGDATA_DIR} "PKGSIZE" ${pkg}_${pkgarch}`
+		size=`oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PKGSIZE" ${pkg}_${pkgarch}`
 		if [ "$size" != "" ] ; then
 			echo "$size $pkg" >> $1/installed-package-sizes.tmp
 		fi
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 21465d8..13c1a0f 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -80,7 +80,7 @@ license_create_manifest() {
 		if [ "${COPY_LIC_DIRS}" = "1" ]; then
 			for pkg in ${INSTALLED_PKGS}; do
 				mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
-				pkged_pn="$(oe-pkgdata-util lookup-recipe ${PKGDATA_DIR} ${pkg})"
+				pkged_pn="$(oe-pkgdata-util -p ${PKGDATA_DIR} lookup-recipe ${pkg})"
 				for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
 					# Really don't need to copy the generics as they're 
 					# represented in the manifest and in the actual pkg licenses
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6f49c69..fcf05dc 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -529,7 +529,7 @@ class PackageManager(object):
             return
 
         cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
-               "glob", self.d.getVar('PKGDATA_DIR', True), installed_pkgs_file,
+               "-p", self.d.getVar('PKGDATA_DIR', True), "glob", installed_pkgs_file,
                globs]
         try:
             bb.note("Installing complementary packages ...")
diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
index 4c58dc1..53b0807 100644
--- a/meta/lib/oeqa/runtime/_ptest.py
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -86,7 +86,7 @@ class PtestRunnerTest(oeRuntimeTest):
             installed_pkgs.write(self.pkgs_list.list("arch"))
 
         cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
-               "glob", oeRuntimeTest.tc.d.getVar('PKGDATA_DIR', True), installed_pkgs_file,
+               "-p", oeRuntimeTest.tc.d.getVar('PKGDATA_DIR', True), "glob", installed_pkgs_file,
                globs]
         try:
             bb.note("Installing complementary packages ...")
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index bf87547..f70f85e 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -4,7 +4,7 @@
 #
 # Written by: Paul Eggleton <paul.eggleton@linux.intel.com>
 #
-# Copyright 2012-2013 Intel Corporation
+# Copyright 2012-2015 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -25,30 +25,40 @@ import os
 import os.path
 import fnmatch
 import re
-import optparse
+import argparse
+import logging
 from collections import defaultdict
 
-def glob(args, usage, debug=False):
-    if len(args) < 3:
-        usage()
-        sys.exit(1)
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+import scriptutils
+logger = scriptutils.logger_create('pkgdatautil')
 
-    pkgdata_dir = args[0]
-    pkglist_file = args[1]
-    globs = args[2].split()
+def tinfoil_init():
+    import bb.tinfoil
+    import logging
+    tinfoil = bb.tinfoil.Tinfoil()
+    tinfoil.prepare(True)
+
+    tinfoil.logger.setLevel(logging.WARNING)
+    return tinfoil
 
-    if not os.path.exists(pkgdata_dir):
-        print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
-        sys.exit(1)
 
-    if not os.path.exists(pkglist_file):
-        print('ERROR: Unable to find package list file %s' % pkglist_file)
+def glob(args):
+    # Handle both multiple arguments and multiple values within an arg (old syntax)
+    globs = []
+    for globitem in args.glob:
+        globs.extend(globitem.split())
+
+    if not os.path.exists(args.pkglistfile):
+        logger.error('Unable to find package list file %s' % args.pkglistfile)
         sys.exit(1)
 
     skipregex = re.compile("-locale-|^locale-base-|-dev$|-doc$|-dbg$|-staticdev$|^kernel-module-")
 
     mappedpkgs = set()
-    with open(pkglist_file, 'r') as f:
+    with open(args.pkglistfile, 'r') as f:
         for line in f:
             fields = line.rstrip().split()
             if not fields:
@@ -59,8 +69,7 @@ def glob(args, usage, debug=False):
 
             # Skip packages for which there is no point applying globs
             if skipregex.search(pkg):
-                if debug:
-                    print("%s -> !!" % pkg)
+                logger.debug("%s -> !!" % pkg)
                 continue
 
             # Skip packages that already match the globs, so if e.g. a dev package
@@ -72,15 +81,14 @@ def glob(args, usage, debug=False):
                     already = True
                     break
             if already:
-                if debug:
-                    print("%s -> !" % pkg)
+                logger.debug("%s -> !" % pkg)
                 continue
 
             # Define some functions
             def revpkgdata(pkgn):
-                return os.path.join(pkgdata_dir, "runtime-reverse", pkgn)
+                return os.path.join(args.pkgdata_dir, "runtime-reverse", pkgn)
             def fwdpkgdata(pkgn):
-                return os.path.join(pkgdata_dir, "runtime", pkgn)
+                return os.path.join(args.pkgdata_dir, "runtime", pkgn)
             def readpn(pkgdata_file):
                 pn = ""
                 with open(pkgdata_file, 'r') as f:
@@ -130,81 +138,61 @@ def glob(args, usage, debug=False):
                             mappedpkg = ""
                     else:
                         # Package doesn't even exist...
-                        if debug:
-                            print "%s is not a valid package!" % (pkg)
+                        logger.debug("%s is not a valid package!" % (pkg))
                         break
 
                 if mappedpkg:
-                    if debug:
-                        print "%s (%s) -> %s" % (pkg, g, mappedpkg)
+                    logger.debug("%s (%s) -> %s" % (pkg, g, mappedpkg))
                     mappedpkgs.add(mappedpkg)
                 else:
-                    if debug:
-                        print "%s (%s) -> ?" % (pkg, g)
+                    logger.debug("%s (%s) -> ?" % (pkg, g))
 
-    if debug:
-        print "------"
+    logger.debug("------")
 
     print("\n".join(mappedpkgs))
 
-def read_value(args, usage, debug=False):
-    if len(args) < 3:
-        usage()
-        sys.exit(1)
-
-    pkgdata_dir = args[0]
-    var = args[1]
-    packages = args[2].split()
+def read_value(args):
+    # Handle both multiple arguments and multiple values within an arg (old syntax)
+    packages = []
+    for pkgitem in args.pkg:
+        packages.extend(pkgitem.split())
 
-    if not os.path.exists(pkgdata_dir):
-        print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
-        sys.exit(1)
-
-    def readvar(pkgdata_file, var):
+    def readvar(pkgdata_file, valuename):
         val = ""
         with open(pkgdata_file, 'r') as f:
             for line in f:
-                if line.startswith(var + ":"):
+                if line.startswith(valuename + ":"):
                     val = line.split(': ')[1].rstrip()
         return val
 
-    if debug:
-        print "read-value('%s', '%s' '%s'" % (pkgdata_dir, var, packages)
+    logger.debug("read-value('%s', '%s' '%s'" % (args.pkgdata_dir, args.valuename, packages))
     for package in packages:
         pkg_split = package.split('_')
         pkg_name = pkg_split[0]
-        if debug:
-            print "package: '%s'" % pkg_name
-        revlink = os.path.join(pkgdata_dir, "runtime-reverse", pkg_name)
-        if debug:
-            print(revlink)
+        logger.debug("package: '%s'" % pkg_name)
+        revlink = os.path.join(args.pkgdata_dir, "runtime-reverse", pkg_name)
+        logger.debug(revlink)
         if os.path.exists(revlink):
             mappedpkg = os.path.basename(os.readlink(revlink))
-            qvar = var
+            qvar = args.valuename
             if qvar == "PKGSIZE":
                 # append packagename
-                qvar = "%s_%s" % (var, mappedpkg)
+                qvar = "%s_%s" % (args.valuename, mappedpkg)
                 # PKGSIZE is now in bytes, but we we want it in KB
                 pkgsize = (int(readvar(revlink, qvar)) + 1024 // 2) // 1024
                 print("%d" % pkgsize)
             else:
                 print(readvar(revlink, qvar))
 
-def lookup_pkg(args, usage, debug=False):
-    if len(args) < 2:
-        usage()
-        sys.exit(1)
-
-    pkgdata_dir = args[0]
-    pkgs = args[1].split()
-
-    if not os.path.exists(pkgdata_dir):
-        print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
-        sys.exit(1)
+def lookup_pkg(args):
+    # Handle both multiple arguments and multiple values within an arg (old syntax)
+    pkgs = []
+    for pkgitem in args.recipepkg:
+        pkgs.extend(pkgitem.split())
 
     mappings = defaultdict(list)
     for pkg in pkgs:
-        pkgfile = os.path.join(pkgdata_dir, 'runtime', pkg)
+        pkgfile = os.path.join(args.pkgdata_dir, 'runtime', pkg)
         if os.path.exists(pkgfile):
             with open(pkgfile, 'r') as f:
                 for line in f:
@@ -214,29 +202,23 @@ def lookup_pkg(args, usage, debug=False):
                         break
     if len(mappings) < len(pkgs):
         missing = list(set(pkgs) - set(mappings.keys()))
-        sys.stderr.write("ERROR: the following packages could not be found: %s\n" % ', '.join(missing))
+        logger.error("The following packages could not be found: %s" % ', '.join(missing))
         sys.exit(1)
 
     items = []
     for pkg in pkgs:
         items.extend(mappings.get(pkg, []))
-    print '\n'.join(items)
+    print('\n'.join(items))
 
-def lookup_recipe(args, usage, debug=False):
-    if len(args) < 2:
-        usage()
-        sys.exit(1)
-
-    pkgdata_dir = args[0]
-    pkgs = args[1].split()
-
-    if not os.path.exists(pkgdata_dir):
-        print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
-        sys.exit(1)
+def lookup_recipe(args):
+    # Handle both multiple arguments and multiple values within an arg (old syntax)
+    pkgs = []
+    for pkgitem in args.pkg:
+        pkgs.extend(pkgitem.split())
 
     mappings = defaultdict(list)
     for pkg in pkgs:
-        pkgfile = os.path.join(pkgdata_dir, 'runtime-reverse', pkg)
+        pkgfile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
         if os.path.exists(pkgfile):
             with open(pkgfile, 'r') as f:
                 for line in f:
@@ -246,30 +228,18 @@ def lookup_recipe(args, usage, debug=False):
                         break
     if len(mappings) < len(pkgs):
         missing = list(set(pkgs) - set(mappings.keys()))
-        sys.stderr.write("ERROR: the following packages could not be found: %s\n" % ', '.join(missing))
+        logger.error("The following packages could not be found: %s" % ', '.join(missing))
         sys.exit(1)
 
     items = []
     for pkg in pkgs:
         items.extend(mappings.get(pkg, []))
-    print '\n'.join(items)
-
-def find_path(args, usage, debug=False):
-    if len(args) < 2:
-        usage()
-        sys.exit(1)
-
-    pkgdata_dir = args[0]
-    targetpath = args[1]
-
-    if not os.path.exists(pkgdata_dir):
-        print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
-        sys.exit(1)
+    print('\n'.join(items))
 
+def find_path(args):
     import json
-    import fnmatch
 
-    for root, dirs, files in os.walk(os.path.join(pkgdata_dir, 'runtime')):
+    for root, dirs, files in os.walk(os.path.join(args.pkgdata_dir, 'runtime')):
         for fn in files:
             with open(os.path.join(root,fn)) as f:
                 for line in f:
@@ -277,55 +247,77 @@ def find_path(args, usage, debug=False):
                         val = line.split(':', 1)[1].strip()
                         dictval = json.loads(val)
                         for fullpth in dictval.keys():
-                            if fnmatch.fnmatchcase(fullpth, targetpath):
+                            if fnmatch.fnmatchcase(fullpth, args.targetpath):
                                 print("%s: %s" % (fn, fullpth))
                         break
 
 
 def main():
-    parser = optparse.OptionParser(
-        usage = '''%prog [options] <command> <arguments>
-
-Available commands:
-    glob <pkgdatadir> <pkglistfile> "<globs>"
-        expand one or more glob expressions over the packages listed in
-        pkglistfile (one package per line)
-    lookup-pkg <pkgdatadir> "<recipe-pkgs>"
-        look up the specified recipe-space package name(s) to see what the
-        final runtime package name is (e.g. eglibc becomes libc6)
-    lookup-recipe <pkgdatadir> "<pkgs>"
-        look up the specified package(s) to see which recipe they were
-        produced by
-    find-path <pkgdatadir> <path>
-        find the package providing the specified path (wildcards * ? allowed)
-    read-value <pkgdatadir> <value-name> "<pkgs>"
-        read the named value from the pkgdata files for the specified
-        packages''')
-
-    parser.add_option("-d", "--debug",
-            help = "Enable debug output",
-            action="store_true", dest="debug", default=False)
-
-    options, args = parser.parse_args(sys.argv)
-    args = args[1:]
-
-    if len(args) < 1:
-        parser.print_help()
+    parser = argparse.ArgumentParser(description="OpenEmbedded pkgdata tool - queries the pkgdata files written out during do_package",
+                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+    parser.add_argument('-p', '--pkgdata-dir', help='Path to pkgdata directory (determined automatically if not specified)')
+    subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
+
+    parser_lookup_pkg = subparsers.add_parser('lookup-pkg',
+                                          help='Translate recipe-space package names to runtime package names',
+                                          description='Looks up the specified recipe-space package name(s) to see what the final runtime package name is (e.g. glibc becomes libc6)')
+    parser_lookup_pkg.add_argument('recipepkg', nargs='+', help='Recipe-space package name to look up')
+    parser_lookup_pkg.set_defaults(func=lookup_pkg)
+
+    parser_lookup_recipe = subparsers.add_parser('lookup-recipe',
+                                          help='Find recipe producing one or more packages',
+                                          description='Looks up the specified runtime package(s) to see which recipe they were produced by')
+    parser_lookup_recipe.add_argument('pkg', nargs='+', help='Runtime package name to look up')
+    parser_lookup_recipe.set_defaults(func=lookup_recipe)
+
+    parser_find_path = subparsers.add_parser('find-path',
+                                          help='Find package providing a target path',
+                                          description='Finds the recipe-space package providing the specified target path')
+    parser_find_path.add_argument('targetpath', help='Path to find (wildcards * ? allowed, use quotes to avoid shell expansion)')
+    parser_find_path.set_defaults(func=find_path)
+
+    parser_read_value = subparsers.add_parser('read-value',
+                                          help='Read any pkgdata value for one or more packages',
+                                          description='Reads the named value from the pkgdata files for the specified packages')
+    parser_read_value.add_argument('valuename', help='Name of the value to look up')
+    parser_read_value.add_argument('pkg', nargs='+', help='Runtime package name to look up')
+    parser_read_value.set_defaults(func=read_value)
+
+    parser_glob = subparsers.add_parser('glob',
+                                          help='Expand package name glob expression',
+                                          description='Expands one or more glob expressions over the packages listed in pkglistfile')
+    parser_glob.add_argument('pkglistfile', help='File listing packages (one package name per line)')
+    parser_glob.add_argument('glob', nargs="+", help='Glob expression for package names, e.g. *-dev')
+    parser_glob.set_defaults(func=glob)
+
+
+    args = parser.parse_args()
+
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+
+    if not args.pkgdata_dir:
+        import scriptpath
+        bitbakepath = scriptpath.add_bitbake_lib_path()
+        if not bitbakepath:
+            logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
+            sys.exit(1)
+        logger.debug('Found bitbake path: %s' % bitbakepath)
+        tinfoil = tinfoil_init()
+        args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+        logger.debug('Value of PKGDATA_DIR is "%s"' % args.pkgdata_dir)
+        if not args.pkgdata_dir:
+            logger.error('Unable to determine pkgdata directory from PKGDATA_DIR')
+            sys.exit(1)
+
+    if not os.path.exists(args.pkgdata_dir):
+        logger.error('Unable to find pkgdata directory %s' % pkgdata_dir)
         sys.exit(1)
 
-    if args[0] == "glob":
-        glob(args[1:], parser.print_help, options.debug)
-    elif args[0] == "lookup-pkg":
-        lookup_pkg(args[1:], parser.print_help, options.debug)
-    elif args[0] == "lookup-recipe":
-        lookup_recipe(args[1:], parser.print_help, options.debug)
-    elif args[0] == "find-path":
-        find_path(args[1:], parser.print_help, options.debug)
-    elif args[0] == "read-value":
-        read_value(args[1:], parser.print_help, options.debug)
-    else:
-        parser.print_help()
-        sys.exit(1)
+    ret = args.func(args)
+
+    return ret
 
 
 if __name__ == "__main__":
-- 
1.9.3


