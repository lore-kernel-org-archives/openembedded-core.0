Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B545373DA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 17:45:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 10:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694963952"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 10:45:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 18:45:11 +0100
Message-Id: <32557d45e705a03c37af97461111d878ac8ca289.1431625238.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/9] devtool: deploy-target: use tinfoil instead of bitbake -e
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
X-List-Received-Date: Thu, 14 May 2015 17:45:57 -0000

Using tinfoil here is quicker and tidier than shelling out to
bitbake -e and interpreting its output.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 078c74b..92a3cb4 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -19,7 +19,7 @@
 import os
 import subprocess
 import logging
-from devtool import exec_build_env_command
+from devtool import exec_build_env_command, setup_tinfoil
 
 logger = logging.getLogger('devtool')
 
@@ -31,6 +31,7 @@ def plugin_init(pluginlist):
 def deploy(args, config, basepath, workspace):
     """Entry point for the devtool 'deploy' subcommand"""
     import re
+    import oe.recipeutils
 
     if not args.recipename in workspace:
         logger.error("no recipe named %s in your workspace" % args.recipename)
@@ -45,8 +46,13 @@ def deploy(args, config, basepath, workspace):
     deploy_dir = os.path.join(basepath, 'target_deploy', args.target)
     deploy_file = os.path.join(deploy_dir, args.recipename + '.list')
 
-    stdout, _ = exec_build_env_command(config.init_path, basepath, 'bitbake -e %s' % args.recipename, shell=True)
-    recipe_outdir = re.search(r'^D="(.*)"', stdout, re.MULTILINE).group(1)
+    tinfoil = setup_tinfoil()
+    try:
+        rd = oe.recipeutils.parse_recipe_simple(tinfoil.cooker, args.recipename, tinfoil.config_data)
+    except Exception as e:
+        logger.error('Exception parsing recipe %s: %s' % (args.recipename, e))
+        return 2
+    recipe_outdir = rd.getVar('D', True)
     if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
         logger.error('No files to deploy - have you built the %s recipe? If so, the install step has not installed any files.' % args.recipename)
         return -1
-- 
2.1.0


