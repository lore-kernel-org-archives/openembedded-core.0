Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 613B27838B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:02 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494420"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:06 +1200
Message-Id: <2b2a271a3fb1f07b048c2a76fb065ecd69bb31d1.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/13] devtool: upgrade: fix handling of non-absolute paths
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
X-List-Received-Date: Wed, 30 Aug 2017 23:55:03 -0000

If your BBLAYERS has non-absolute paths in it (e.g.
"${COREBASE}/../something") then none of the paths matched in
copy_recipe_files() with the result that no files got copied and you
ended up with an error later on because the recipe file couldn't be
found at the destination. Fix this as well as adding an explicit check
to see if no files got copied - error out earlier if so.

Fixes [YOCTO #10981].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py     | 8 +++++---
 scripts/lib/devtool/upgrade.py | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index a7fdd36..b946128 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -334,11 +334,13 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
         fetch.download()
 
     # Copy local files to target directory and gather any remote files
-    bb_dir = os.path.dirname(d.getVar('FILE')) + os.sep
+    bb_dir = os.path.abspath(os.path.dirname(d.getVar('FILE'))) + os.sep
     remotes = []
     copied = []
-    includes = [path for path in d.getVar('BBINCLUDED').split() if
-                path.startswith(bb_dir) and os.path.exists(path)]
+    # Need to do this in two steps since we want to check against the absolute path
+    includes = [os.path.abspath(path) for path in d.getVar('BBINCLUDED').split() if os.path.exists(path)]
+    # We also check this below, but we don't want any items in this list being considered remotes
+    includes = [path for path in includes if path.startswith(bb_dir)]
     for path in fetch.localpaths() + includes:
         # Only import files that are under the meta directory
         if path.startswith(bb_dir):
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 1f11d47..24937dc 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -301,6 +301,9 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
     path = os.path.join(workspace, 'recipes', bpn)
     bb.utils.mkdirhier(path)
     copied, _ = oe.recipeutils.copy_recipe_files(rd, path)
+    if not copied:
+        raise DevtoolError('Internal error - no files were copied for recipe %s' % bpn)
+    logger.debug('Copied %s to %s' % (copied, path))
 
     oldpv = rd.getVar('PV')
     if not newpv:
-- 
2.9.5


