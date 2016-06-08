Return-Path: <kad@kad.name>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E04A96FFC8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 15:07:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 08 Jun 2016 08:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,439,1459839600"; d="scan'208";a="715929791"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2016 08:07:48 -0700
Received: from nwhinnet-mobl.ger.corp.intel.com (unknown [10.252.15.21])
	by linux.intel.com (Postfix) with ESMTP id 021FA6A4006;
	Wed,  8 Jun 2016 08:55:12 -0700 (PDT)
From: Alexander Kanevskiy <kad@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 18:07:43 +0300
Message-Id: <20160608150743.46486-1-kad@linux.intel.com>
X-Mailer: git-send-email 2.8.4
Subject: [PATCH v2] oe-pkgdata-util: new option to provide full info for binary package(s)
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
X-List-Received-Date: Wed, 08 Jun 2016 15:07:59 -0000

From: "Alexander D. Kanevskiy" <kad@kad.name>

New option can be used for displaying full information about binary
package(s), including name, full version, recipe name, recipe full
version and package size.

This information can be useful inside custom buildhistory class
to produce detailed image manifest for further analysis.

List of packages can be specified as command line arguments or can
be read from file (e.g. from existing image manifest).

Warning: In case of image manifest is used as input outside of build
process, be aware that pkgdata might change since the time image
was built.

Output format:
{PKG} [PKGE:]{PKGV}[-{PKGR}] {PN} [PE:]{PV}[-{PR}] {PKGSIZE}

Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
---
 scripts/oe-pkgdata-util | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index b16ecc9..d60f084 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -274,6 +274,61 @@ def lookup_recipe(args):
         items.extend(mappings.get(pkg, []))
     print('\n'.join(items))
 
+def package_info(args):
+    # Handle both multiple arguments and multiple values within an arg (old syntax)
+    packages = []
+    if args.file:
+        with open(args.file, 'r') as f:
+            for line in f:
+                splitline = line.split()
+                if splitline:
+                    packages.append(splitline[0])
+    else:
+        for pkgitem in args.pkg:
+            packages.extend(pkgitem.split())
+        if not packages:
+            logger.error("No packages specified")
+            sys.exit(1)
+
+    mappings = defaultdict(lambda: defaultdict(str))
+    for pkg in packages:
+        pkgfile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
+        if os.path.exists(pkgfile):
+            with open(pkgfile, 'r') as f:
+                for line in f:
+                    fields = line.rstrip().split(': ')
+                    if fields[0].endswith("_" + pkg):
+                        k = fields[0][:len(fields[0]) - len(pkg) - 1]
+                    else:
+                        k = fields[0]
+                    v = fields[1] if len(fields) == 2 else ""
+                    mappings[pkg][k] = v
+
+    if len(mappings) < len(packages):
+        missing = list(set(packages) - set(mappings.keys()))
+        logger.error("The following packages could not be found: %s" %
+                     ', '.join(missing))
+        sys.exit(1)
+
+    items = []
+    for pkg in packages:
+        pkg_version = mappings[pkg]['PKGV']
+        if mappings[pkg]['PKGE']:
+            pkg_version = mappings[pkg]['PKGE'] + ":" + pkg_version
+        if mappings[pkg]['PKGR']:
+            pkg_version = pkg_version + "-" + mappings[pkg]['PKGR']
+        recipe = mappings[pkg]['PN']
+        recipe_version = mappings[pkg]['PV']
+        if mappings[pkg]['PE']:
+            recipe_version = mappings[pkg]['PE'] + ":" + recipe_version
+        if mappings[pkg]['PR']:
+            recipe_version = recipe_version + "-" + mappings[pkg]['PR']
+        pkg_size = mappings[pkg]['PKGSIZE']
+
+        items.append("%s %s %s %s %s" %
+                     (pkg, pkg_version, recipe, recipe_version, pkg_size))
+    print('\n'.join(items))
+
 def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
     recipedatafile = os.path.join(pkgdata_dir, recipe)
     if not os.path.exists(recipedatafile):
@@ -469,6 +524,13 @@ def main():
     parser_lookup_recipe.add_argument('pkg', nargs='+', help='Runtime package name to look up')
     parser_lookup_recipe.set_defaults(func=lookup_recipe)
 
+    parser_package_info = subparsers.add_parser('package-info',
+                                          help='Shows version, recipe and size information for one or more packages',
+                                          description='Looks up the specified runtime package(s) and display information')
+    parser_package_info.add_argument('pkg', nargs='*', help='Runtime package name to look up')
+    parser_package_info.add_argument('-f', '--file', help='Read package names from the specified file (one per line, first field only)')
+    parser_package_info.set_defaults(func=package_info)
+
     parser_find_path = subparsers.add_parser('find-path',
                                           help='Find package providing a target path',
                                           description='Finds the recipe-space package providing the specified target path')
-- 
2.8.4


