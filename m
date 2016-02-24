Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 58F0977397
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:09:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 21:09:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,492,1449561600"; d="scan'208";a="658305650"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.175])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 21:09:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:07:27 +1300
Message-Id: <a63d8c16da4dfe5128c20dc38a83851ce311df61.1456290353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/14] devtool: upgrade: fix renaming of recipe if PV is not in name
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
X-List-Received-Date: Wed, 24 Feb 2016 05:09:16 -0000

If the actual value of PV isn't in the name of the recipe (for example,
a git or svn recipe) there's no point trying to rename it. Additionally,
we already have the original filename, there's no need to guess it -
just pass it in.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index f2a93b7..9a308b1 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -83,21 +83,19 @@ def _rename_recipe_dirs(oldpv, newpv, path):
                 if olddir != newdir:
                     shutil.move(os.path.join(path, olddir), os.path.join(path, newdir))
 
-def _rename_recipe_file(bpn, oldpv, newpv, path):
-    oldrecipe = "%s_%s.bb" % (bpn, oldpv)
-    newrecipe = "%s_%s.bb" % (bpn, newpv)
-    if os.path.isfile(os.path.join(path, oldrecipe)):
+def _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path):
+    oldrecipe = os.path.basename(oldrecipe)
+    if oldrecipe.endswith('_%s.bb' % oldpv):
+        newrecipe = '%s_%s.bb' % (bpn, newpv)
         if oldrecipe != newrecipe:
-            _run('mv %s %s' % (oldrecipe, newrecipe), cwd=path)
+            shutil.move(os.path.join(path, oldrecipe), os.path.join(path, newrecipe))
     else:
-        recipe = "%s_git.bb" % bpn
-        if os.path.isfile(os.path.join(path, recipe)):
-            newrecipe = recipe
+        newrecipe = oldrecipe
     return os.path.join(path, newrecipe)
 
-def _rename_recipe_files(bpn, oldpv, newpv, path):
+def _rename_recipe_files(oldrecipe, bpn, oldpv, newpv, path):
     _rename_recipe_dirs(oldpv, newpv, path)
-    return _rename_recipe_file(bpn, oldpv, newpv, path)
+    return _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path)
 
 def _write_append(rc, srctree, same_dir, no_same_dir, rev, workspace, d):
     """Writes an append file"""
@@ -243,7 +241,9 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
     oldpv = crd.getVar('PV', True)
     if not newpv:
         newpv = oldpv
-    fullpath = _rename_recipe_files(bpn, oldpv, newpv, path)
+    origpath = rd.getVar('FILE', True)
+    fullpath = _rename_recipe_files(origpath, bpn, oldpv, newpv, path)
+    logger.debug('Upgraded %s => %s' % (origpath, fullpath))
 
     newvalues = {}
     if _recipe_contains(rd, 'PV') and newpv != oldpv:
-- 
2.5.0


