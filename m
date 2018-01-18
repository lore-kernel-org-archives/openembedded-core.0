Return-Path: <amanda.r.brindle@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 55B7178477
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 23:20:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jan 2018 15:20:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,378,1511856000"; d="scan'208";a="10875847"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga007.jf.intel.com with ESMTP; 18 Jan 2018 15:20:42 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 15:18:27 -0800
Message-Id: <a286dcb3d1969d0baf2c620dab2a4d7904ed9d56.1516313803.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1516313803.git.amanda.r.brindle@intel.com>
References: <cover.1516313803.git.amanda.r.brindle@intel.com>
Cc: paul.eggleton@linux.intel.com, Amanda Brindle <amanda.r.brindle@intel.com>
Subject: [PATCH V2 1/2] oe-pkgdata-util: Refactor functions for consistency
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
X-List-Received-Date: Thu, 18 Jan 2018 23:20:41 -0000

Refactor functions lookup_recipe and package_info to be consistent with
list_pkg_files. Print the appropriate information as soon as it's found,
rather than storing it in a mappings variable and wait to print after
searching all packages.

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
---
 scripts/oe-pkgdata-util | 107 ++++++++++++++++++++++--------------------------
 1 file changed, 48 insertions(+), 59 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index c6fba56..e4ccf30 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -257,25 +257,22 @@ def lookup_recipe(args):
     for pkgitem in args.pkg:
         pkgs.extend(pkgitem.split())
 
-    mappings = defaultdict(list)
     for pkg in pkgs:
-        pkgfile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
-        if os.path.exists(pkgfile):
-            with open(pkgfile, 'r') as f:
+        pkgdatafile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
+        if os.path.exists(pkgdatafile):
+            with open(pkgdatafile, 'r') as f:
+                found = False
                 for line in f:
-                    fields = line.rstrip().split(': ')
-                    if fields[0] == 'PN':
-                        mappings[pkg].append(fields[1])
+                    if line.startswith('PN'):
+                        print("\t%s" % line.split(':', 1)[1].strip())
+                        found = True
                         break
-    if len(mappings) < len(pkgs):
-        missing = list(set(pkgs) - set(mappings.keys()))
-        logger.error("The following packages could not be found: %s" % ', '.join(missing))
-        sys.exit(1)
-
-    items = []
-    for pkg in pkgs:
-        items.extend(mappings.get(pkg, []))
-    print('\n'.join(items))
+                if not found:
+                    logger.error("Unable to find PN entry in %s" % pkgdatafile)
+                    sys.exit(1)
+        else:
+            logger.error("Unable to find any built runtime package named %s" % pkg)
+            sys.exit(1)
 
 def package_info(args):
     # Handle both multiple arguments and multiple values within an arg (old syntax)
@@ -293,51 +290,43 @@ def package_info(args):
             logger.error("No packages specified")
             sys.exit(1)
 
-    mappings = defaultdict(lambda: defaultdict(str))
     for pkg in packages:
-        pkgfile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
-        if os.path.exists(pkgfile):
-            with open(pkgfile, 'r') as f:
+        pkgdatafile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
+        if os.path.exists(pkgdatafile):
+            with open(pkgdatafile, 'r') as f:
+                pkge = ''
+                pkgr = ''
+                pe = ''
+                pr = ''
                 for line in f:
-                    fields = line.rstrip().split(': ')
-                    if fields[0].endswith("_" + pkg):
-                        k = fields[0][:len(fields[0]) - len(pkg) - 1]
-                    else:
-                        k = fields[0]
-                    v = fields[1] if len(fields) == 2 else ""
-                    mappings[pkg][k] = v
-
-    if len(mappings) < len(packages):
-        missing = list(set(packages) - set(mappings.keys()))
-        logger.error("The following packages could not be found: %s" %
-                     ', '.join(missing))
-        sys.exit(1)
-
-    items = []
-    for pkg in packages:
-        pkg_version = mappings[pkg]['PKGV']
-        if mappings[pkg]['PKGE']:
-            pkg_version = mappings[pkg]['PKGE'] + ":" + pkg_version
-        if mappings[pkg]['PKGR']:
-            pkg_version = pkg_version + "-" + mappings[pkg]['PKGR']
-        recipe = mappings[pkg]['PN']
-        recipe_version = mappings[pkg]['PV']
-        if mappings[pkg]['PE']:
-            recipe_version = mappings[pkg]['PE'] + ":" + recipe_version
-        if mappings[pkg]['PR']:
-            recipe_version = recipe_version + "-" + mappings[pkg]['PR']
-        pkg_size = mappings[pkg]['PKGSIZE']
-
-        line = "%s %s %s %s %s" % (pkg, pkg_version, recipe, recipe_version, pkg_size)
-
-        if args.extra:
-            for var in args.extra:
-                val = mappings[pkg][var].strip()
-                val = re.sub(r'\s+', ' ', val)
-                line += ' "%s"' % val
-
-        items.append(line)
-    print('\n'.join(items))
+                    if line.startswith('PKGV'):
+                        pkg_version = line.split(':', 1)[1].strip()
+                    elif line.startswith('PKGE'):
+                        pkge = line.split(':', 1)[1].strip()
+                    elif line.startswith('PKGR'):
+                        pkgr = line.split(':', 1)[1].strip()
+                    elif line.startswith('PN'):
+                        recipe = line.split(':', 1)[1].strip()
+                    elif line.startswith('PV'):
+                        recipe_version = line.split(':', 1)[1].strip()
+                    elif line.startswith('PE'):
+                        pe = line.split(':', 1)[1].strip()
+                    elif line.startswith('PR'):
+                        pr = line.split(':', 1)[1].strip()
+                    elif line.startswith('PKGSIZE'):
+                        pkg_size = line.split(':', 1)[1].strip()
+                if pkge:
+                    pkg_version = pkge + ":" + pkg_version
+                if pkgr:
+                    pkg_version = pkg_version + "-" + pkgr
+                if pe:
+                    recipe_version = pe + ":" + recipe_version
+                if pr:
+                    recipe_version = recipe_version + "-" + pr
+                print("%s %s %s %s %s" % (pkg, pkg_version, recipe, recipe_version, pkg_size))
+        else:
+            logger.error("Unable to find any built runtime package named %s" % pkg)
+            sys.exit(1)
 
 def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
     recipedatafile = os.path.join(pkgdata_dir, recipe)
-- 
2.7.4


