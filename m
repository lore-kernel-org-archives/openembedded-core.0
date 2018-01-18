Return-Path: <amanda.r.brindle@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9B03378477
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 23:20:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jan 2018 15:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,378,1511856000"; d="scan'208";a="10875851"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga007.jf.intel.com with ESMTP; 18 Jan 2018 15:20:44 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 15:18:28 -0800
Message-Id: <511d0f7d4b100596c93225add67ae76bbbfdda88.1516313803.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1516313803.git.amanda.r.brindle@intel.com>
References: <cover.1516313803.git.amanda.r.brindle@intel.com>
Cc: paul.eggleton@linux.intel.com, Amanda Brindle <amanda.r.brindle@intel.com>
Subject: [PATCH V2 2/2] oe-pkgdata-util: Add support for RPROVIDES
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
X-List-Received-Date: Thu, 18 Jan 2018 23:20:42 -0000

In lookup_recipe, package_info, and list_pkg_files, check if the package
name exists in runtime-rprovides. If so, and the provider package has a
different name than the inputted package, print a note that says the
specified package is in another package's RPROVIDES. If the provider
package has the same name as the inputted package, continue as before.

Fixes [YOCTO 11943]

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
---
 scripts/oe-pkgdata-util | 154 +++++++++++++++++++++++++++++-------------------
 1 file changed, 93 insertions(+), 61 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index e4ccf30..040854f 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -252,29 +252,72 @@ def lookup_pkg(args):
     print('\n'.join(items))
 
 def lookup_recipe(args):
+    def parse_pkgdatafile(pkgdatafile):
+        with open(pkgdatafile, 'r') as f:
+            found = False
+            for line in f:
+                if line.startswith('PN'):
+                    print("%s" % line.split(':', 1)[1].strip())
+                    found = True
+                    break
+            if not found:
+                logger.error("Unable to find PN entry in %s" % pkgdatafile)
+                sys.exit(1)
+
     # Handle both multiple arguments and multiple values within an arg (old syntax)
     pkgs = []
     for pkgitem in args.pkg:
         pkgs.extend(pkgitem.split())
 
     for pkg in pkgs:
+        providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
+        if os.path.exists(providepkgpath):
+            for f in os.listdir(providepkgpath):
+                if f != pkg:
+                    print("%s is in the RPROVIDES of %s:" % (pkg, f))
+                pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
+                parse_pkgdatafile(pkgdatafile)
+            break
         pkgdatafile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
-        if os.path.exists(pkgdatafile):
-            with open(pkgdatafile, 'r') as f:
-                found = False
-                for line in f:
-                    if line.startswith('PN'):
-                        print("\t%s" % line.split(':', 1)[1].strip())
-                        found = True
-                        break
-                if not found:
-                    logger.error("Unable to find PN entry in %s" % pkgdatafile)
-                    sys.exit(1)
-        else:
-            logger.error("Unable to find any built runtime package named %s" % pkg)
+        if not os.path.exists(pkgdatafile):
+            logger.error("The following packages could not be found: %s" % pkg)
             sys.exit(1)
+        parse_pkgdatafile(pkgdatafile)
 
 def package_info(args):
+    def parse_pkgdatafile(pkgdatafile):
+        with open(pkgdatafile, 'r') as f:
+            pkge = ''
+            pkgr = ''
+            pe = ''
+            pr = ''
+            for line in f:
+                if line.startswith('PKGV'):
+                    pkg_version = line.split(':', 1)[1].strip()
+                elif line.startswith('PKGE'):
+                    pkge = line.split(':', 1)[1].strip()
+                elif line.startswith('PKGR'):
+                    pkgr = line.split(':', 1)[1].strip()
+                elif line.startswith('PN'):
+                    recipe = line.split(':', 1)[1].strip()
+                elif line.startswith('PV'):
+                    recipe_version = line.split(':', 1)[1].strip()
+                elif line.startswith('PE'):
+                    pe = line.split(':', 1)[1].strip()
+                elif line.startswith('PR'):
+                    pr = line.split(':', 1)[1].strip()
+                elif line.startswith('PKGSIZE'):
+                    pkg_size = line.split(':', 1)[1].strip()
+            if pkge:
+                pkg_version = pkge + ":" + pkg_version
+            if pkgr:
+                pkg_version = pkg_version + "-" + pkgr
+            if pe:
+                recipe_version = pe + ":" + recipe_version
+            if pr:
+                recipe_version = recipe_version + "-" + pr
+            print("%s %s %s %s %s" % (pkg, pkg_version, recipe, recipe_version, pkg_size))
+
     # Handle both multiple arguments and multiple values within an arg (old syntax)
     packages = []
     if args.file:
@@ -291,42 +334,19 @@ def package_info(args):
             sys.exit(1)
 
     for pkg in packages:
-        pkgdatafile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
-        if os.path.exists(pkgdatafile):
-            with open(pkgdatafile, 'r') as f:
-                pkge = ''
-                pkgr = ''
-                pe = ''
-                pr = ''
-                for line in f:
-                    if line.startswith('PKGV'):
-                        pkg_version = line.split(':', 1)[1].strip()
-                    elif line.startswith('PKGE'):
-                        pkge = line.split(':', 1)[1].strip()
-                    elif line.startswith('PKGR'):
-                        pkgr = line.split(':', 1)[1].strip()
-                    elif line.startswith('PN'):
-                        recipe = line.split(':', 1)[1].strip()
-                    elif line.startswith('PV'):
-                        recipe_version = line.split(':', 1)[1].strip()
-                    elif line.startswith('PE'):
-                        pe = line.split(':', 1)[1].strip()
-                    elif line.startswith('PR'):
-                        pr = line.split(':', 1)[1].strip()
-                    elif line.startswith('PKGSIZE'):
-                        pkg_size = line.split(':', 1)[1].strip()
-                if pkge:
-                    pkg_version = pkge + ":" + pkg_version
-                if pkgr:
-                    pkg_version = pkg_version + "-" + pkgr
-                if pe:
-                    recipe_version = pe + ":" + recipe_version
-                if pr:
-                    recipe_version = recipe_version + "-" + pr
-                print("%s %s %s %s %s" % (pkg, pkg_version, recipe, recipe_version, pkg_size))
-        else:
+        providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
+        if os.path.exists(providepkgpath):
+            for f in os.listdir(providepkgpath):
+                if f != pkg:
+                    print("%s is in the RPROVIDES of %s:" % (pkg, f))
+                pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
+                parse_pkgdatafile(pkgdatafile)
+            break
+        pkgdatafile = os.path.join(args.pkgdata_dir, "runtime-reverse", pkg)
+        if not os.path.exists(pkgdatafile):
             logger.error("Unable to find any built runtime package named %s" % pkg)
             sys.exit(1)
+        parse_pkgdatafile(pkgdatafile)
 
 def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
     recipedatafile = os.path.join(pkgdata_dir, recipe)
@@ -415,6 +435,21 @@ def list_pkgs(args):
 
 def list_pkg_files(args):
     import json
+    def parse_pkgdatafile(pkgdatafile):
+        with open(pkgdatafile, 'r') as f:
+            found = False
+            for line in f:
+                if line.startswith('FILES_INFO:'):
+                    found = True
+                    val = line.split(':', 1)[1].strip()
+                    dictval = json.loads(val)
+                    for fullpth in sorted(dictval):
+                        print("\t%s" % fullpth)
+                    break
+            if not found:
+                logger.error("Unable to find FILES_INFO entry in %s" % pkgdatafile)
+                sys.exit(1)
+
 
     if args.recipe:
         if args.pkg:
@@ -444,25 +479,22 @@ def list_pkg_files(args):
                     continue
                 logger.error("Unable to find any built runtime package named %s" % pkg)
                 sys.exit(1)
+            parse_pkgdatafile(pkgdatafile)
+
         else:
+            providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
+            if os.path.exists(providepkgpath):
+                for f in os.listdir(providepkgpath):
+                    if f != pkg:
+                        print("%s is in the RPROVIDES of %s:" % (pkg, f))
+                    pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
+                    parse_pkgdatafile(pkgdatafile)
+                continue
             pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", pkg)
             if not os.path.exists(pkgdatafile):
                 logger.error("Unable to find any built recipe-space package named %s" % pkg)
                 sys.exit(1)
-
-        with open(pkgdatafile, 'r') as f:
-            found = False
-            for line in f:
-                if line.startswith('FILES_INFO:'):
-                    found = True
-                    val = line.split(':', 1)[1].strip()
-                    dictval = json.loads(val)
-                    for fullpth in sorted(dictval):
-                        print("\t%s" % fullpth)
-                    break
-            if not found:
-                logger.error("Unable to find FILES_INFO entry in %s" % pkgdatafile)
-                sys.exit(1)
+            parse_pkgdatafile(pkgdatafile)
 
 def find_path(args):
     import json
-- 
2.7.4


