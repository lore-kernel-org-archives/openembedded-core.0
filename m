Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6570876E8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:08:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2015 09:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="758326782"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2015 09:08:57 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 0D4376A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:08:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:39 +0300
Message-Id: <93cf189032057efa5d96d94550b2c9d001cfdf92.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/11] devtool: build-image: filter out recipes
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
X-List-Received-Date: Sun, 30 Aug 2015 16:08:57 -0000

Filtered out non-target recipes and recipes with
recipe name != package name in build-image plugin.

Isolated all logic of getting recipes in _get_recipes
function.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index 708120a..341ab28 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -21,7 +21,7 @@ import os
 import logging
 
 from bb.process import ExecutionError
-from devtool import exec_build_env_command
+from devtool import exec_build_env_command, setup_tinfoil, parse_recipe
 
 logger = logging.getLogger('devtool')
 
@@ -29,14 +29,31 @@ def plugin_init(pluginlist):
     """Plugin initialization"""
     pass
 
+def _get_recipes(workspace, config):
+    """Get list of target recipes from the workspace."""
+    result = []
+    tinfoil = setup_tinfoil()
+    for recipe in workspace:
+        data = parse_recipe(config, tinfoil, recipe, True)
+        if 'class-target' in data.getVar('OVERRIDES', True).split(':'):
+            if recipe in data.getVar('PACKAGES', True):
+                result.append(recipe)
+            else:
+                logger.warning("Skipping recipe %s as it doesn't produce "
+                               "package with the same name", recipe)
+    tinfoil.shutdown()
+    return result
+
 def build_image(args, config, basepath, workspace):
     """Entry point for the devtool 'build-image' subcommand."""
     image = args.recipe
     appendfile = os.path.join(config.workspace_path, 'appends',
                               '%s.bbappend' % image)
-    with open(appendfile, 'w') as afile:
-        afile.write('IMAGE_INSTALL_append = " %s"\n' % \
-                    ' '.join(workspace.keys()))
+
+    recipes = _get_recipes(workspace, config)
+    if recipes:
+        with open(appendfile, 'w') as afile:
+            afile.write('IMAGE_INSTALL_append = " %s"\n' % ' '.join(recipes))
 
     try:
         exec_build_env_command(config.init_path, basepath,
-- 
2.1.4


