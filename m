Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AF79F72E3E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:44:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 Feb 2015 07:44:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,529,1418112000"; d="scan'208";a="682025900"
Received: from kamaher-mobl6.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.37])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2015 07:44:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Feb 2015 15:44:32 +0000
Message-Id: <328175236808e8b50a51785a3c602573c1ebcc9e.1423237365.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423237365.git.paul.eggleton@linux.intel.com>
References: <cover.1423237365.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423237365.git.paul.eggleton@linux.intel.com>
References: <cover.1423237365.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] oe-pkgdata-util: allow reverse package name lookups
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
X-List-Received-Date: Fri, 06 Feb 2015 15:44:46 -0000

Add a -r/--reverse option to the lookup-pkg subcommand to enable looking
up the recipe-space package name for one or more runtime package names.

Also make this subcommand into a function that can be reused elsewhere.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 54 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index d414158..fb7734b 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -27,7 +27,7 @@ import fnmatch
 import re
 import argparse
 import logging
-from collections import defaultdict
+from collections import defaultdict, OrderedDict
 
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
@@ -184,30 +184,47 @@ def read_value(args):
             else:
                 print(readvar(revlink, qvar))
 
+def lookup_pkglist(pkgs, pkgdata_dir, reverse):
+    if reverse:
+        mappings = OrderedDict()
+        for pkg in pkgs:
+            revlink = os.path.join(pkgdata_dir, "runtime-reverse", pkg)
+            logger.debug(revlink)
+            if os.path.exists(revlink):
+                mappings[pkg] = os.path.basename(os.readlink(revlink))
+    else:
+        mappings = defaultdict(list)
+        for pkg in pkgs:
+            pkgfile = os.path.join(pkgdata_dir, 'runtime', pkg)
+            if os.path.exists(pkgfile):
+                with open(pkgfile, 'r') as f:
+                    for line in f:
+                        fields = line.rstrip().split(': ')
+                        if fields[0] == 'PKG_%s' % pkg:
+                            mappings[pkg].append(fields[1])
+                            break
+    return mappings
+
 def lookup_pkg(args):
     # Handle both multiple arguments and multiple values within an arg (old syntax)
     pkgs = []
-    for pkgitem in args.recipepkg:
+    for pkgitem in args.pkg:
         pkgs.extend(pkgitem.split())
 
-    mappings = defaultdict(list)
-    for pkg in pkgs:
-        pkgfile = os.path.join(args.pkgdata_dir, 'runtime', pkg)
-        if os.path.exists(pkgfile):
-            with open(pkgfile, 'r') as f:
-                for line in f:
-                    fields = line.rstrip().split(': ')
-                    if fields[0] == 'PKG_%s' % pkg:
-                        mappings[pkg].append(fields[1])
-                        break
+    mappings = lookup_pkglist(pkgs, args.pkgdata_dir, args.reverse)
+
     if len(mappings) < len(pkgs):
         missing = list(set(pkgs) - set(mappings.keys()))
         logger.error("The following packages could not be found: %s" % ', '.join(missing))
         sys.exit(1)
 
-    items = []
-    for pkg in pkgs:
-        items.extend(mappings.get(pkg, []))
+    if args.reverse:
+        items = mappings.values()
+    else:
+        items = []
+        for pkg in pkgs:
+            items.extend(mappings.get(pkg, []))
+
     print('\n'.join(items))
 
 def lookup_recipe(args):
@@ -260,9 +277,10 @@ def main():
     subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
 
     parser_lookup_pkg = subparsers.add_parser('lookup-pkg',
-                                          help='Translate recipe-space package names to runtime package names',
-                                          description='Looks up the specified recipe-space package name(s) to see what the final runtime package name is (e.g. glibc becomes libc6)')
-    parser_lookup_pkg.add_argument('recipepkg', nargs='+', help='Recipe-space package name to look up')
+                                          help='Translate between recipe-space package names and runtime package names',
+                                          description='Looks up the specified recipe-space package name(s) to see what the final runtime package name is (e.g. glibc becomes libc6), or with -r/--reverse looks up the other way.')
+    parser_lookup_pkg.add_argument('pkg', nargs='+', help='Package name to look up')
+    parser_lookup_pkg.add_argument('-r', '--reverse', help='Switch to looking up recipe-space package names from runtime package names', action='store_true')
     parser_lookup_pkg.set_defaults(func=lookup_pkg)
 
     parser_lookup_recipe = subparsers.add_parser('lookup-recipe',
-- 
1.9.3


