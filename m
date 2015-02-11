Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1994F73313
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 15:00:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 Feb 2015 06:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,559,1418112000"; d="scan'208";a="664876011"
Received: from jjurski-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.24.180])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2015 07:00:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 14:59:59 +0000
Message-Id: <d2f336ca109d03a4d63765191736e9a57fae49a5.1423666576.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 6/7] oe-pkgdata-util: add list-pkg-files subcommand
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
X-List-Received-Date: Wed, 11 Feb 2015 15:00:18 -0000

Adds a subcommand to list the files in a package, or list the files in
all packages for a recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 2830f48..f3868d4 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -338,6 +338,57 @@ def list_pkgs(args):
             logger.error("No packages found")
         sys.exit(1)
 
+def list_pkg_files(args):
+    import json
+
+    if args.recipe:
+        if args.pkg:
+            logger.error("list-pkg-files: If -p/--recipe is specified then a package name cannot be specified")
+            sys.exit(1)
+        recipepkglist = get_recipe_pkgs(args.pkgdata_dir, args.recipe, args.unpackaged)
+        if args.runtime:
+            pkglist = []
+            runtime_pkgs = lookup_pkglist(recipepkglist, args.pkgdata_dir, False)
+            for rtpkgs in runtime_pkgs.values():
+                pkglist.extend(rtpkgs)
+        else:
+            pkglist = recipepkglist
+    else:
+        if not args.pkg:
+            logger.error("list-pkg-files: If -p/--recipe is not specified then at least one package name must be specified")
+            sys.exit(1)
+        pkglist = args.pkg
+
+    for pkg in pkglist:
+        print("%s:" % pkg)
+        if args.runtime:
+            pkgdatafile = os.path.join(args.pkgdata_dir, "runtime-reverse", pkg)
+            if not os.path.exists(pkgdatafile):
+                if args.recipe:
+                    # This package was empty and thus never packaged, ignore
+                    continue
+                logger.error("Unable to find any built runtime package named %s" % pkg)
+                sys.exit(1)
+        else:
+            pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", pkg)
+            if not os.path.exists(pkgdatafile):
+                logger.error("Unable to find any built recipe-space package named %s" % pkg)
+                sys.exit(1)
+
+        with open(pkgdatafile, 'r') as f:
+            found = False
+            for line in f:
+                if line.startswith('FILES_INFO:'):
+                    found = True
+                    val = line.split(':', 1)[1].strip()
+                    dictval = json.loads(val)
+                    for fullpth in dictval.keys():
+                        print("\t%s" % fullpth)
+                    break
+            if not found:
+                logger.error("Unable to find FILES_INFO entry in %s" % pkgdatafile)
+                sys.exit(1)
+
 def find_path(args):
     import json
 
@@ -382,6 +433,15 @@ def main():
     parser_list_pkgs.add_argument('-u', '--unpackaged', help='Include unpackaged (i.e. empty) packages', action='store_true')
     parser_list_pkgs.set_defaults(func=list_pkgs)
 
+    parser_list_pkg_files = subparsers.add_parser('list-pkg-files',
+                                          help='List files within a package',
+                                          description='Lists files included in one or more packages')
+    parser_list_pkg_files.add_argument('pkg', nargs='*', help='Package name to report on (if -p/--recipe is not specified)')
+    parser_list_pkg_files.add_argument('-r', '--runtime', help='Specified package(s) are runtime package names instead of recipe-space package names', action='store_true')
+    parser_list_pkg_files.add_argument('-p', '--recipe', help='Report on all packages produced by the specified recipe')
+    parser_list_pkg_files.add_argument('-u', '--unpackaged', help='Include unpackaged (i.e. empty) packages (only useful with -p/--recipe)', action='store_true')
+    parser_list_pkg_files.set_defaults(func=list_pkg_files)
+
     parser_lookup_recipe = subparsers.add_parser('lookup-recipe',
                                           help='Find recipe producing one or more packages',
                                           description='Looks up the specified runtime package(s) to see which recipe they were produced by')
-- 
1.9.3


