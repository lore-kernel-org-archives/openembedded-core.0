Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB45F73D37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 16:37:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 16 Apr 2015 09:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,589,1422950400"; d="scan'208";a="696380580"
Received: from mlehtone-mac01.fi.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.237.66.38])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2015 09:37:58 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Apr 2015 19:37:57 +0300
Message-Id: <1429202277-7215-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH] devtool: call parse_recipe with correct arguments
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
X-List-Received-Date: Thu, 16 Apr 2015 16:37:59 -0000

Give the correct data object ("config data" instead of "recipe data") as
an argument to oe.recipeutils.patch_recipe()

Fixes [YOCTO #7595]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 54920b2..d5ded2f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -482,7 +482,7 @@ def update_recipe(args, config, basepath, workspace):
                 if remove_patches(srcuri, removepatches):
                     patchfields['SRC_URI'] = ' '.join(srcuri)
 
-        oe.recipeutils.patch_recipe(rd, recipefile, patchfields)
+        oe.recipeutils.patch_recipe(tinfoil.config_data, recipefile, patchfields)
 
         if not 'git://' in orig_src_uri:
             logger.info('You will need to update SRC_URI within the recipe to point to a git repository where you have pushed your changes')
@@ -564,7 +564,8 @@ def update_recipe(args, config, basepath, workspace):
                     updaterecipe = True
             if updaterecipe:
                 logger.info('Updating recipe %s' % os.path.basename(recipefile))
-                oe.recipeutils.patch_recipe(rd, recipefile, {'SRC_URI': ' '.join(srcuri)})
+                oe.recipeutils.patch_recipe(tinfoil.config_data,
+                        recipefile, {'SRC_URI': ' '.join(srcuri)})
             elif not updatepatches:
                 # Neither patches nor recipe were updated
                 logger.info('No patches need updating')
-- 
2.1.4


