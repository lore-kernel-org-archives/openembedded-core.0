Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1A56E7700B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520477"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:35 +0100
Message-Id: <8fb8bc56ca1eb7aea090262eb6c964d83e5ff9b8.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 21/27] devtool: build-image: fix recipe/package terminology
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

We build recipes and include packages into the image, adjust the
terminology used in code and messages accordingly. Also fix a few typos.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 45 ++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index 2c01428..fa6f0d7 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -25,8 +25,8 @@ from devtool import exec_build_env_command, setup_tinfoil, parse_recipe
 
 logger = logging.getLogger('devtool')
 
-def _get_recipes(workspace, config):
-    """Get list of target recipes from the workspace."""
+def _get_packages(workspace, config):
+    """Get list of packages from recipes in the workspace."""
     result = []
     tinfoil = setup_tinfoil()
     for recipe in workspace:
@@ -35,7 +35,7 @@ def _get_recipes(workspace, config):
             if recipe in data.getVar('PACKAGES', True):
                 result.append(recipe)
             else:
-                logger.warning("Skipping recipe %s as it doesn't produce "
+                logger.warning("Skipping recipe %s as it doesn't produce a "
                                "package with the same name", recipe)
     tinfoil.shutdown()
     return result
@@ -46,29 +46,32 @@ def build_image(args, config, basepath, workspace):
     appendfile = os.path.join(config.workspace_path, 'appends',
                               '%s.bbappend' % image)
 
-    # remove <image>.bbapend to make sure setup_tinfoil doesn't
-    # breake because of it
+    # remove <image>.bbappend to make sure setup_tinfoil doesn't
+    # break because of it
     if os.path.isfile(appendfile):
         os.unlink(appendfile)
 
-    recipes = _get_recipes(workspace, config)
-    if recipes:
-        with open(appendfile, 'w') as afile:
-            # include selected recipes into the image
-            afile.write('IMAGE_INSTALL_append = " %s"\n' % ' '.join(recipes))
+    if workspace:
+        packages = _get_packages(workspace, config)
+        if packages:
+            with open(appendfile, 'w') as afile:
+                # include packages from workspace recipes into the image
+                afile.write('IMAGE_INSTALL_append = " %s"\n' % ' '.join(packages))
 
-            # Generate notification callback devtool_warn_image_extended
-            afile.write('do_rootfs[prefuncs] += "devtool_warn_image_extended"\n\n')
-            afile.write("python devtool_warn_image_extended() {\n")
-            afile.write("    bb.plain('NOTE: %%s: building with additional '\n"
-                        "             'packages due to \"devtool build-image\"'"
-                        "              %% d.getVar('PN', True))\n"
-                        "    bb.plain('NOTE: delete %%s to clear this' %% \\\n"
-                        "             '%s')\n" % os.path.relpath(appendfile, basepath))
-            afile.write("}\n")
+                # Generate notification callback devtool_warn_image_extended
+                afile.write('do_rootfs[prefuncs] += "devtool_warn_image_extended"\n\n')
+                afile.write("python devtool_warn_image_extended() {\n")
+                afile.write("    bb.plain('NOTE: %%s: building with additional '\n"
+                            "             'packages due to \"devtool build-image\"'"
+                            "              %% d.getVar('PN', True))\n"
+                            "    bb.plain('NOTE: delete %%s to clear this' %% \\\n"
+                            "             '%s')\n" % os.path.relpath(appendfile, basepath))
+                afile.write("}\n")
 
-            logger.info('Building image %s with the following '
-                        'additional packages: %s', image, ' '.join(recipes))
+                logger.info('Building image %s with the following '
+                            'additional packages: %s', image, ' '.join(packages))
+        else:
+            logger.warning('No packages to add, building image %s unmodified', image)
     else:
         logger.warning('No recipes in workspace, building image %s unmodified', image)
 
-- 
2.1.0


