Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC05606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 21:04:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2016 14:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,359,1464678000"; d="scan'208";a="733801374"
Received: from apbalanx-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.177.79])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2016 14:04:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 09:04:19 +1200
Message-Id: <15e24cc4ff690754aca354ee7583ea6f3e931d8a.1468443702.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] devtool: update-recipe: find and use existing files directories
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
X-List-Received-Date: Wed, 13 Jul 2016 21:04:51 -0000

devtool update-recipe was defaulting to the ${BPN} named directory when
adding patches next to a recipe, but that meant if you already had files
in a ${BP} named directory (i.e. name and version) or "files" then you'd
end up with two directories next to the recipe, which is usually not
what you want. To avoid this, look through FILESPATH and take the first
one that's the same level or one level down from the recipe and already
exists, if any.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f2ba699..1ec31bc 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1039,6 +1039,18 @@ def _export_local_files(srctree, rd, destdir):
     return (updated, added, removed)
 
 
+def _determine_files_dir(rd):
+    """Determine the appropriate files directory for a recipe"""
+    recipedir = rd.getVar('FILE_DIRNAME', True)
+    for entry in rd.getVar('FILESPATH', True).split(':'):
+        relpth = os.path.relpath(entry, recipedir)
+        if not os.sep in relpth:
+            # One (or zero) levels below only, so we don't put anything in machine-specific directories
+            if os.path.isdir(entry):
+                return entry
+    return os.path.join(recipedir, rd.getVar('BPN', True))
+
+
 def _update_recipe_srcrev(args, srctree, rd, config_data):
     """Implement the 'srcrev' mode of update-recipe"""
     import bb
@@ -1092,8 +1104,7 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
                     rd, args.append, files, wildcardver=args.wildcard_version,
                     extralines=patchfields, removevalues=removevalues)
         else:
-            files_dir = os.path.join(os.path.dirname(recipefile),
-                                     rd.getVar('BPN', True))
+            files_dir = _determine_files_dir(rd)
             for basepath, path in upd_f.items():
                 logger.info('Updating file %s' % basepath)
                 _move_file(os.path.join(local_files_dir, basepath), path)
@@ -1193,8 +1204,7 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
                 _move_file(patchfn, path)
                 updatefiles = True
             # Add any new files
-            files_dir = os.path.join(os.path.dirname(recipefile),
-                                     rd.getVar('BPN', True))
+            files_dir = _determine_files_dir(rd)
             for basepath, path in new_f.items():
                 logger.info('Adding new file %s' % basepath)
                 _move_file(os.path.join(local_files_dir, basepath),
-- 
2.5.5


