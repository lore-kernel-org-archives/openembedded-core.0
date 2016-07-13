Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9D70B73199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 21:05:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 13 Jul 2016 14:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,359,1464678000"; d="scan'208";a="733801551"
Received: from apbalanx-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.177.79])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2016 14:05:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 09:04:24 +1200
Message-Id: <12c51b58cb273e5104aca84996ef0474465efc6d.1468443702.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] devtool: upgrade: record original recipe files
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
X-List-Received-Date: Wed, 13 Jul 2016 21:05:11 -0000

This provides us with the information we need to remove the original
version recipe and associated files when running "devtool finish" after
"devtool upgrade".

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py     |  4 +++-
 scripts/lib/devtool/upgrade.py | 16 ++++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index cb4ed53..b8d481a 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -365,6 +365,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
     # Copy local files to target directory and gather any remote files
     bb_dir = os.path.dirname(d.getVar('FILE', True)) + os.sep
     remotes = []
+    copied = []
     includes = [path for path in d.getVar('BBINCLUDED', True).split() if
                 path.startswith(bb_dir) and os.path.exists(path)]
     for path in fetch.localpaths() + includes:
@@ -376,13 +377,14 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
                 if not os.path.exists(subdir):
                     os.makedirs(subdir)
                 shutil.copy2(path, os.path.join(tgt_dir, relpath))
+                copied.append(relpath)
         else:
             remotes.append(path)
     # Simply copy whole meta dir, if requested
     if whole_dir:
         shutil.copytree(bb_dir, tgt_dir)
 
-    return remotes
+    return copied, remotes
 
 
 def get_recipe_local_files(d, patches=False):
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 66e5f59..8ea72ef 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -105,7 +105,7 @@ def _rename_recipe_files(oldrecipe, bpn, oldpv, newpv, path):
     _rename_recipe_dirs(oldpv, newpv, path)
     return _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path)
 
-def _write_append(rc, srctree, same_dir, no_same_dir, rev, workspace, d):
+def _write_append(rc, srctree, same_dir, no_same_dir, rev, copied, workspace, d):
     """Writes an append file"""
     if not os.path.exists(rc):
         raise DevtoolError("bbappend not created because %s does not exist" % rc)
@@ -128,8 +128,12 @@ def _write_append(rc, srctree, same_dir, no_same_dir, rev, workspace, d):
         b_is_s = use_external_build(same_dir, no_same_dir, d)
         if b_is_s:
             f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (pn, srctree))
+        f.write('\n')
         if rev:
-            f.write('\n# initial_rev: %s\n' % rev)
+            f.write('# initial_rev: %s\n' % rev)
+        if copied:
+            f.write('# original_path: %s\n' % os.path.dirname(d.getVar('FILE', True)))
+            f.write('# original_files: %s\n' % ' '.join(copied))
     return af
 
 def _cleanup_on_error(rf, srctree):
@@ -267,7 +271,7 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
     bpn = rd.getVar('BPN', True)
     path = os.path.join(workspace, 'recipes', bpn)
     bb.utils.mkdirhier(path)
-    oe.recipeutils.copy_recipe_files(rd, path)
+    copied, _ = oe.recipeutils.copy_recipe_files(rd, path)
 
     oldpv = rd.getVar('PV', True)
     if not newpv:
@@ -317,7 +321,7 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
     rd = oe.recipeutils.parse_recipe(fullpath, None, tinfoil.config_data)
     oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
 
-    return fullpath
+    return fullpath, copied
 
 def upgrade(args, config, basepath, workspace):
     """Entry point for the devtool 'upgrade' subcommand"""
@@ -360,7 +364,7 @@ def upgrade(args, config, basepath, workspace):
         rev2, md5, sha256 = _extract_new_source(args.version, srctree, args.no_patch,
                                                 args.srcrev, args.branch, args.keep_temp,
                                                 tinfoil, rd)
-        rf = _create_new_recipe(args.version, md5, sha256, args.srcrev, args.srcbranch, config.workspace_path, tinfoil, rd)
+        rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, args.srcbranch, config.workspace_path, tinfoil, rd)
     except bb.process.CmdError as e:
         _upgrade_error(e, rf, srctree)
     except DevtoolError as e:
@@ -368,7 +372,7 @@ def upgrade(args, config, basepath, workspace):
     standard._add_md5(config, pn, os.path.dirname(rf))
 
     af = _write_append(rf, srctree, args.same_dir, args.no_same_dir, rev2,
-                       config.workspace_path, rd)
+                       copied, config.workspace_path, rd)
     standard._add_md5(config, pn, af)
     logger.info('Upgraded source extracted to %s' % srctree)
     logger.info('New recipe is %s' % rf)
-- 
2.5.5


