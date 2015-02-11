Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 98824732FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 15:00:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 Feb 2015 06:56:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,559,1418112000"; d="scan'208";a="664875983"
Received: from jjurski-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.24.180])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2015 07:00:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 14:59:58 +0000
Message-Id: <3a0c76757ebf9daa785905eaff9abdaccedab051.1423666576.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 5/7] oe-pkgdata-util: add list-pkgs subcommand
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

Add a subcommand to list packages, with options to list packages
matching a specification, and packages produced by a particular recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 94 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 91a1234..2830f48 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -253,6 +253,91 @@ def lookup_recipe(args):
         items.extend(mappings.get(pkg, []))
     print('\n'.join(items))
 
+def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
+    recipedatafile = os.path.join(pkgdata_dir, recipe)
+    if not os.path.exists(recipedatafile):
+        logger.error("Unable to find packaged recipe with name %s" % recipe)
+        sys.exit(1)
+    packages = []
+    with open(recipedatafile, 'r') as f:
+        for line in f:
+            fields = line.rstrip().split(': ')
+            if fields[0] == 'PACKAGES':
+                packages = fields[1].split()
+                break
+
+    if not unpackaged:
+        pkglist = []
+        for pkg in packages:
+            if os.path.exists(os.path.join(pkgdata_dir, 'runtime', '%s.packaged' % pkg)):
+                pkglist.append(pkg)
+        return pkglist
+    else:
+        return packages
+
+def list_pkgs(args):
+    found = False
+
+    def matchpkg(pkg):
+        if args.pkgspec:
+            matched = False
+            for pkgspec in args.pkgspec:
+                if fnmatch.fnmatchcase(pkg, pkgspec):
+                    matched = True
+                    break
+            if not matched:
+                return False
+        if not args.unpackaged:
+            if args.runtime:
+                revlink = os.path.join(args.pkgdata_dir, "runtime-reverse", pkg)
+                if os.path.exists(revlink):
+                    # We're unlikely to get here if the package was not packaged, but just in case
+                    # we add the symlinks for unpackaged files in the future
+                    mappedpkg = os.path.basename(os.readlink(revlink))
+                    if not os.path.exists(os.path.join(args.pkgdata_dir, 'runtime', '%s.packaged' % mappedpkg)):
+                        return False
+                else:
+                    return False
+            else:
+                if not os.path.exists(os.path.join(args.pkgdata_dir, 'runtime', '%s.packaged' % pkg)):
+                    return False
+        return True
+
+    if args.recipe:
+        packages = get_recipe_pkgs(args.pkgdata_dir, args.recipe, args.unpackaged)
+
+        if args.runtime:
+            pkglist = []
+            runtime_pkgs = lookup_pkglist(packages, args.pkgdata_dir, False)
+            for rtpkgs in runtime_pkgs.values():
+                pkglist.extend(rtpkgs)
+        else:
+            pkglist = packages
+
+        for pkg in pkglist:
+            if matchpkg(pkg):
+                found = True
+                print("%s" % pkg)
+    else:
+        if args.runtime:
+            searchdir = 'runtime-reverse'
+        else:
+            searchdir = 'runtime'
+
+        for root, dirs, files in os.walk(os.path.join(args.pkgdata_dir, searchdir)):
+            for fn in files:
+                if fn.endswith('.packaged'):
+                    continue
+                if matchpkg(fn):
+                    found = True
+                    print("%s" % fn)
+    if not found:
+        if args.pkgspec:
+            logger.error("Unable to find any package matching %s" % args.pkgspec)
+        else:
+            logger.error("No packages found")
+        sys.exit(1)
+
 def find_path(args):
     import json
 
@@ -288,6 +373,15 @@ def main():
     parser_lookup_pkg.add_argument('-r', '--reverse', help='Switch to looking up recipe-space package names from runtime package names', action='store_true')
     parser_lookup_pkg.set_defaults(func=lookup_pkg)
 
+    parser_list_pkgs = subparsers.add_parser('list-pkgs',
+                                          help='List packages',
+                                          description='Lists packages that have been built')
+    parser_list_pkgs.add_argument('pkgspec', nargs='*', help='Package name to search for (wildcards * ? allowed, use quotes to avoid shell expansion)')
+    parser_list_pkgs.add_argument('-r', '--runtime', help='Show runtime package names instead of recipe-space package names', action='store_true')
+    parser_list_pkgs.add_argument('-p', '--recipe', help='Limit to packages produced by the specified recipe')
+    parser_list_pkgs.add_argument('-u', '--unpackaged', help='Include unpackaged (i.e. empty) packages', action='store_true')
+    parser_list_pkgs.set_defaults(func=list_pkgs)
+
     parser_lookup_recipe = subparsers.add_parser('lookup-recipe',
                                           help='Find recipe producing one or more packages',
                                           description='Looks up the specified runtime package(s) to see which recipe they were produced by')
-- 
1.9.3


