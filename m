Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B909F73187
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:05:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:05:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979292"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:05:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:13 +1300
Message-Id: <674a465ed49138b36de321a248922540ae7d3973.1450756556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 20/26] devtool: status: list recipe file within workspace if one exists
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
X-List-Received-Date: Tue, 22 Dec 2015 04:05:08 -0000

If a recipe in the workspace actually exists as a file within the
workspace (e.g. after doing "devtool add" or "devtool upgrade") then
show the path to the recipe file on the status line for the recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c710c16..ed9e793 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -26,6 +26,7 @@ import argparse
 import argparse_oe
 import scriptutils
 import errno
+import glob
 from collections import OrderedDict
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, DevtoolError
 from devtool import parse_recipe
@@ -1168,7 +1169,16 @@ def status(args, config, basepath, workspace):
     """Entry point for the devtool 'status' subcommand"""
     if workspace:
         for recipe, value in workspace.iteritems():
-            print("%s: %s" % (recipe, value['srctree']))
+            bbfile = os.path.basename(value['bbappend']).replace('.bbappend', '.bb').replace('%', '*')
+            recipefile = glob.glob(os.path.join(config.workspace_path,
+                                                'recipes',
+                                                recipe,
+                                                bbfile))
+            if recipefile:
+                recipestr = ' (%s)' % recipefile[0]
+            else:
+                recipestr = ''
+            print("%s: %s%s" % (recipe, value['srctree'], recipestr))
     else:
         logger.info('No recipes currently in your workspace - you can use "devtool modify" to work on an existing recipe or "devtool add" to add a new one')
     return 0
-- 
2.5.0


