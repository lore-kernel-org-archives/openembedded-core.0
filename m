Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 76A6173216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 17:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7GH0Gk5032035; Tue, 16 Aug 2016 18:00:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C8vrhLBjlJ3m; Tue, 16 Aug 2016 18:00:16 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7GH0DQI032032
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Aug 2016 18:00:14 +0100
Message-ID: <1471366813.20391.121.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2016 18:00:13 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: [PATCH] devtool/recipetool/meta: Adapt to bitbake API changes for multi-configuration builds
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
X-List-Received-Date: Tue, 16 Aug 2016 17:00:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Unfortunately to implenent multiconfig support in bitbake some APIs 
had to change. This updates code in OE to match the changes in bitbake.
Its mostly periperhal changes around devtool/recipetool

[Will need a bitbake version requirement bump which I'll make when merging]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index c77664f..e7dd8af 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -27,16 +27,16 @@ list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
 meta_vars = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION']
 
 
-def pn_to_recipe(cooker, pn):
+def pn_to_recipe(cooker, pn, mc=''):
     """Convert a recipe name (PN) to the path to the recipe file"""
     import bb.providers
 
-    if pn in cooker.recipecache.pkg_pn:
-        best = bb.providers.findBestProvider(pn, cooker.data, cooker.recipecache, cooker.recipecache.pkg_pn)
+    if pn in cooker.recipecaches[mc].pkg_pn:
+        best = bb.providers.findBestProvider(pn, cooker.data, cooker.recipecaches[mc], cooker.recipecaches[mc].pkg_pn)
         return best[3]
-    elif pn in cooker.recipecache.providers:
-        filenames = cooker.recipecache.providers[pn]
-        eligible, foundUnique = bb.providers.filterProviders(filenames, pn, cooker.expanded_data, cooker.recipecache)
+    elif pn in cooker.recipecaches[mc].providers:
+        filenames = cooker.recipecaches[mc].providers[pn]
+        eligible, foundUnique = bb.providers.filterProviders(filenames, pn, cooker.expanded_data, cooker.recipecaches[mc])
         filename = eligible[0]
         return filename
     else:
@@ -50,13 +50,14 @@ def get_unavailable_reasons(cooker, pn):
     return taskdata.get_reasons(pn)
 
 
-def parse_recipe(fn, appendfiles, d):
+def parse_recipe(cooker, fn, appendfiles):
     """
     Parse an individual recipe file, optionally with a list of
     bbappend files.
     """
     import bb.cache
-    envdata = bb.cache.Cache.loadDataFull(fn, appendfiles, d)
+    parser = bb.cache.NoCache(cooker.databuilder)
+    envdata = parser.loadDataFull(fn, appendfiles)
     return envdata
 
 
@@ -79,7 +80,7 @@ def parse_recipe_simple(cooker, pn, d, appends=True):
         appendfiles = cooker.collection.get_file_appends(recipefile)
     else:
         appendfiles = None
-    return parse_recipe(recipefile, appendfiles, d)
+    return parse_recipe(cooker, recipefile, appendfiles)
 
 
 def get_var_files(fn, varlist, d):
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index a8e184d..5cd0f74 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -223,7 +223,7 @@ def runqemu(pn, ssh=True):
         tinfoil.config_data.setVar("TEST_QEMUBOOT_TIMEOUT", "1000")
         import oe.recipeutils
         recipefile = oe.recipeutils.pn_to_recipe(tinfoil.cooker, pn)
-        recipedata = oe.recipeutils.parse_recipe(recipefile, [], tinfoil.config_data)
+        recipedata = oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, [])
 
         # The QemuRunner log is saved out, but we need to ensure it is at the right
         # log level (and then ensure that since it's a child of the BitBake logger,
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 65eb452..216b7c3 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -146,8 +146,7 @@ def parse_recipe(config, tinfoil, pn, appends, filter_workspace=True):
                             not path.startswith(config.workspace_path)]
     else:
         append_files = None
-    return oe.recipeutils.parse_recipe(recipefile, append_files,
-                                       tinfoil.config_data)
+    return oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, append_files)
 
 def check_workspace_recipe(workspace, pn, checksrc=True, bbclassextend=False):
     """
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9c09533..3de2401 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -221,7 +221,7 @@ def add(args, config, basepath, workspace):
         initial_rev = stdout.rstrip()
 
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
-    rd = oe.recipeutils.parse_recipe(recipefile, None, tinfoil.config_data)
+    rd = oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, None)
     if not rd:
         return 1
 
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 8ea72ef..fc2f919 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -318,7 +318,7 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
         newvalues['SRC_URI[md5sum]'] = md5
         newvalues['SRC_URI[sha256sum]'] = sha256
 
-    rd = oe.recipeutils.parse_recipe(fullpath, None, tinfoil.config_data)
+    rd = oe.recipeutils.parse_recipe(tinfoil.cooker, fullpath, None)
     oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
 
     return fullpath, copied
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 5d73d30..1e0fc1e 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -115,8 +115,7 @@ def _parse_recipe(pn, tinfoil):
         # Error already logged
         return None
     append_files = tinfoil.cooker.collection.get_file_appends(recipefile)
-    rd = oe.recipeutils.parse_recipe(recipefile, append_files,
-                                    tinfoil.config_data)
+    rd = oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, append_files)
     return rd
 
 def determine_file_source(targetpath, rd):
diff --git a/scripts/lib/recipetool/setvar.py b/scripts/lib/recipetool/setvar.py
index 657d2b6..85701c0 100644
--- a/scripts/lib/recipetool/setvar.py
+++ b/scripts/lib/recipetool/setvar.py
@@ -51,7 +51,7 @@ def setvar(args):
     if args.recipe_only:
         patches = [oe.recipeutils.patch_recipe_file(args.recipefile, varvalues, patch=args.patch)]
     else:
-        rd = oe.recipeutils.parse_recipe(args.recipefile, None, tinfoil.config_data)
+        rd = oe.recipeutils.parse_recipe(tinfoil.cooker, args.recipefile, None)
         if not rd:
             return 1
         patches = oe.recipeutils.patch_recipe(rd, args.recipefile, varvalues, patch=args.patch)
diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index 8aab86a..d06efe4 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -40,13 +40,13 @@ def translate_virtualfns(tasks):
     try:
         tinfoil.prepare(False)
 
-        pkg_fn = tinfoil.cooker.recipecache.pkg_fn
+        recipecaches = tinfoil.cooker.recipecaches
         outtasks = []
         for task in tasks:
-            fn, taskname = task.rsplit(':', 1)
+            (mc, fn, taskname) = bb.runqueue.split_tid(task)
             if taskname.endswith('_setscene'):
                 taskname = taskname[:-9]
-            outtasks.append('%s:%s' % (pkg_fn[fn], taskname))
+            outtasks.append('%s:%s' % (recipecaches[mc].pkg_fn[fn], taskname))
     finally:
         tinfoil.shutdown()
     return outtasks



