Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA0A72E1A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:44:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 Feb 2015 07:44:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,529,1418112000"; d="scan'208";a="682025965"
Received: from kamaher-mobl6.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.37])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2015 07:44:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Feb 2015 15:44:34 +0000
Message-Id: <339e7b0e360ee85f1cacf68d2ff47c3817b2bd10.1423237365.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423237365.git.paul.eggleton@linux.intel.com>
References: <cover.1423237365.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423237365.git.paul.eggleton@linux.intel.com>
References: <cover.1423237365.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] oe-pkgdata-util: add list-pkgs subcommand
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

Add a subcommand to list packages, with options to list packages
matching a specification, and packages produced by a particular recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 82 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index e1ec610..bec64ff 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -253,6 +253,79 @@ def lookup_recipe(args):
         items.extend(mappings.get(pkg, []))
     print('\n'.join(items))
 
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
+        recipedatafile = os.path.join(args.pkgdata_dir, args.recipe)
+        if not os.path.exists(recipedatafile):
+            logger.error("Unable to find packaged recipe with name %s" % args.recipe)
+            sys.exit(1)
+        packages = []
+        with open(recipedatafile, 'r') as f:
+            for line in f:
+                fields = line.rstrip().split(': ')
+                if fields[0] == 'PACKAGES':
+                    packages = fields[1].split()
+                    break
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
 
@@ -288,6 +361,15 @@ def main():
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


