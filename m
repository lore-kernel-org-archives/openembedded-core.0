Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BAECF78371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:08 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494452"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:08 +1200
Message-Id: <3802cb118d22915c5592550349a4e8af5d116223.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/13] devtool: upgrade: workaround for recipes which apply patches conditional upon class
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
X-List-Received-Date: Wed, 30 Aug 2017 23:55:08 -0000

If we're upgrading a recipe that appends additional patches for, say,
class-native, and we're just upgrading the target variant, then when we
copied the recipe into the workspace we skipped copying the additional patches
for the native variant. This caused warnings because the workspace
recipe is preferred. Look at SRC_URI for all variants when copying files
to work around this.

More work is needed to make it easier to work with recipes that use
BBCLASSEXTEND where you need to build more than one variant at once, but
this at least fixes the immediate ugliness.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py     | 35 ++++++++++++++++++++++++++++-------
 scripts/lib/devtool/upgrade.py |  2 +-
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index b946128..c8570ac 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -2,7 +2,7 @@
 #
 # Some code borrowed from the OE layer index
 #
-# Copyright (C) 2013-2016 Intel Corporation
+# Copyright (C) 2013-2017 Intel Corporation
 #
 
 import sys
@@ -320,7 +320,7 @@ def patch_recipe(d, fn, varvalues, patch=False, relpath=''):
 
 
 
-def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
+def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=False):
     """Copy (local) recipe files, including both files included via include/require,
     and files referred to in the SRC_URI variable."""
     import bb.fetch2
@@ -328,10 +328,31 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
 
     # FIXME need a warning if the unexpanded SRC_URI value contains variable references
 
-    uris = (d.getVar('SRC_URI') or "").split()
-    fetch = bb.fetch2.Fetch(uris, d)
-    if download:
-        fetch.download()
+    uri_values = []
+    localpaths = []
+    def fetch_urls(rdata):
+        # Collect the local paths from SRC_URI
+        srcuri = rdata.getVar('SRC_URI') or ""
+        if srcuri not in uri_values:
+            fetch = bb.fetch2.Fetch(srcuri.split(), rdata)
+            if download:
+                fetch.download()
+            for pth in fetch.localpaths():
+                if pth not in localpaths:
+                    localpaths.append(pth)
+            uri_values.append(srcuri)
+
+    fetch_urls(d)
+    if all_variants:
+        # Get files for other variants e.g. in the case of a SRC_URI_append
+        localdata = bb.data.createCopy(d)
+        variants = (localdata.getVar('BBCLASSEXTEND') or '').split()
+        if variants:
+            # Ensure we handle class-target if we're dealing with one of the variants
+            variants.append('target')
+            for variant in variants:
+                localdata.setVar('CLASSOVERRIDE', 'class-%s' % variant)
+                fetch_urls(localdata)
 
     # Copy local files to target directory and gather any remote files
     bb_dir = os.path.abspath(os.path.dirname(d.getVar('FILE'))) + os.sep
@@ -341,7 +362,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
     includes = [os.path.abspath(path) for path in d.getVar('BBINCLUDED').split() if os.path.exists(path)]
     # We also check this below, but we don't want any items in this list being considered remotes
     includes = [path for path in includes if path.startswith(bb_dir)]
-    for path in fetch.localpaths() + includes:
+    for path in localpaths + includes:
         # Only import files that are under the meta directory
         if path.startswith(bb_dir):
             if not whole_dir:
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index e334d2b..41bd34e 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -300,7 +300,7 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
     bpn = rd.getVar('BPN')
     path = os.path.join(workspace, 'recipes', bpn)
     bb.utils.mkdirhier(path)
-    copied, _ = oe.recipeutils.copy_recipe_files(rd, path)
+    copied, _ = oe.recipeutils.copy_recipe_files(rd, path, all_variants=True)
     if not copied:
         raise DevtoolError('Internal error - no files were copied for recipe %s' % bpn)
     logger.debug('Copied %s to %s' % (copied, path))
-- 
2.9.5


