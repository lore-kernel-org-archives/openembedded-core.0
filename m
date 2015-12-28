Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1D46FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7FBtT024248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:11 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:10 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:40 -0800
Message-ID: <105a7c90dac6f43b7c3d1de92827db2db8419112.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 32/40] devtool: upgrade: fix updating PV and SRCREV
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:10 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This code was clearly never tested. Fix the following issues:
* Actually set SRCREV if it's been specified
* Enable history tracking and reparse so that we handle if variables are
  set in an inc file next to the recipe
* Use a more accurate check for PV being in the recipe which will work
  if it's in an inc file next to the recipe

(From OE-Core master rev: 8b8f04226ebf464fa61c05ca7af7c6cbda392339)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/upgrade.py |   34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index d387623..ace0b76 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -91,15 +91,13 @@ def _remove_patch_dirs(recipefolder):
         for d in dirs:
             shutil.rmtree(os.path.join(root,d))
 
-def _recipe_contains(rf, var):
-    import re
-    found = False
-    with open(rf) as f:
-        for line in f:
-            if re.match("^%s.*=.*" % var, line):
-                found = True
-                break
-    return found
+def _recipe_contains(rd, var):
+    rf = rd.getVar('FILE', True)
+    varfiles = oe.recipeutils.get_var_files(rf, [var], rd)
+    for var, fn in varfiles.iteritems():
+        if fn and fn.startswith(os.path.dirname(rf) + os.sep):
+            return True
+    return False
 
 def _rename_recipe_dirs(oldpv, newpv, path):
     for root, dirs, files in os.walk(path):
@@ -257,7 +255,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
 
     return (rev, md5, sha256)
 
-def _create_new_recipe(newpv, md5, sha256, workspace, rd):
+def _create_new_recipe(newpv, md5, sha256, srcrev, workspace, tinfoil, rd):
     """Creates the new recipe under workspace"""
     crd = rd.createCopy()
 
@@ -271,8 +269,16 @@ def _create_new_recipe(newpv, md5, sha256, workspace, rd):
         newpv = oldpv
     fullpath = _rename_recipe_files(bpn, oldpv, newpv, path)
 
-    if _recipe_contains(fullpath, 'PV') and newpv != oldpv:
-        oe.recipeutils.patch_recipe(d, fullpath, {'PV':newpv})
+    newvalues = {}
+    if _recipe_contains(rd, 'PV') and newpv != oldpv:
+        newvalues['PV'] = newpv
+
+    if srcrev:
+        newvalues['SRCREV'] = srcrev
+
+    if newvalues:
+        rd = oe.recipeutils.parse_recipe(fullpath, None, tinfoil.config_data)
+        oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
 
     if md5 and sha256:
         # Unfortunately, oe.recipeutils.patch_recipe cannot update flags.
@@ -294,7 +300,7 @@ def upgrade(args, config, basepath, workspace):
     if reason:
         raise DevtoolError(reason)
 
-    tinfoil = setup_tinfoil(basepath=basepath)
+    tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
@@ -316,7 +322,7 @@ def upgrade(args, config, basepath, workspace):
         rev2, md5, sha256 = _extract_new_source(args.version, args.srctree, args.no_patch,
                                                 args.srcrev, args.branch, args.keep_temp,
                                                 tinfoil, rd)
-        rf = _create_new_recipe(args.version, md5, sha256, config.workspace_path, rd)
+        rf = _create_new_recipe(args.version, md5, sha256, args.srcrev, config.workspace_path, tinfoil, rd)
     except bb.process.CmdError as e:
         _upgrade_error(e, rf, args.srctree)
     except DevtoolError as e:
-- 
1.7.9.5


