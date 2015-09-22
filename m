Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 02B8F77037
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520490"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:36 +0100
Message-Id: <ac97ab78a0b3d130d552492c9998781dab24a87c.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 22/27] devtool: build-image: tell user where to find output files
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:19 -0000

If the user is running "devtool build-image" within the extensible SDK
then they probably won't know where to find the resulting output files,
so we should tell them explicitly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index fa6f0d7..5759bec 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -25,10 +25,9 @@ from devtool import exec_build_env_command, setup_tinfoil, parse_recipe
 
 logger = logging.getLogger('devtool')
 
-def _get_packages(workspace, config):
+def _get_packages(tinfoil, workspace, config):
     """Get list of packages from recipes in the workspace."""
     result = []
-    tinfoil = setup_tinfoil()
     for recipe in workspace:
         data = parse_recipe(config, tinfoil, recipe, True)
         if 'class-target' in data.getVar('OVERRIDES', True).split(':'):
@@ -37,7 +36,6 @@ def _get_packages(workspace, config):
             else:
                 logger.warning("Skipping recipe %s as it doesn't produce a "
                                "package with the same name", recipe)
-    tinfoil.shutdown()
     return result
 
 def build_image(args, config, basepath, workspace):
@@ -51,8 +49,9 @@ def build_image(args, config, basepath, workspace):
     if os.path.isfile(appendfile):
         os.unlink(appendfile)
 
+    tinfoil = setup_tinfoil()
     if workspace:
-        packages = _get_packages(workspace, config)
+        packages = _get_packages(tinfoil, workspace, config)
         if packages:
             with open(appendfile, 'w') as afile:
                 # include packages from workspace recipes into the image
@@ -75,6 +74,10 @@ def build_image(args, config, basepath, workspace):
     else:
         logger.warning('No recipes in workspace, building image %s unmodified', image)
 
+    deploy_dir_image = tinfoil.config_data.getVar('DEPLOY_DIR_IMAGE', True)
+
+    tinfoil.shutdown()
+
     # run bitbake to build image
     try:
         exec_build_env_command(config.init_path, basepath,
@@ -82,7 +85,8 @@ def build_image(args, config, basepath, workspace):
     except ExecutionError as err:
         return err.exitcode
 
-    logger.info('Successfully built %s', image)
+    logger.info('Successfully built %s. You can find output files in %s'
+                % (image, deploy_dir_image))
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from the build-image plugin"""
-- 
2.1.0


