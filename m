Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C2A0B76DFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520509"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:38 +0100
Message-Id: <3e281406153c9218644d4e558486c98bfd5e1bce.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 24/27] devtool: build-image: delete bbappend at end of build
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:21 -0000

Upon further reflection, it seems to me that this bbappend ought to just
be deleted at the end of the build. This keeps things simple; you never
have to remember to delete any files to get back to where you were
before with the image. This means we can also drop the slightly awkward
message reminding the user how to do that. I've also updated the test to
look at the image manifest to determine if the command has worked
instead of looking for the (now deleted) bbappend.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py  | 22 +++++++++++-----
 scripts/lib/devtool/build-image.py | 53 +++++++++++++++++---------------------
 2 files changed, 38 insertions(+), 37 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 6e731d6..3a8168c 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -919,7 +919,8 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c clean %s' % image)
         bitbake('%s -c clean' % image)
         # Add target and native recipes to workspace
-        for recipe in ('mdadm', 'parted-native'):
+        recipes = ['mdadm', 'parted-native']
+        for recipe in recipes:
             tempdir = tempfile.mkdtemp(prefix='devtoolqa')
             self.track_for_cleanup(tempdir)
             self.add_command_to_tearDown('bitbake -c clean %s' % recipe)
@@ -927,12 +928,19 @@ class DevtoolTests(DevtoolBase):
         # Try to build image
         result = runCmd('devtool build-image %s' % image)
         self.assertNotEqual(result, 0, 'devtool build-image failed')
-        # Check if image.bbappend has required content
-        bbappend = os.path.join(workspacedir, 'appends', image+'.bbappend')
-        self.assertTrue(os.path.isfile(bbappend), 'bbappend not created %s' % result.output)
-        # NOTE: native recipe parted-native should not be in IMAGE_INSTALL_append
-        self.assertTrue('IMAGE_INSTALL_append = " mdadm"\n' in open(bbappend).readlines(),
-                        'IMAGE_INSTALL_append = " mdadm" not found in %s' % bbappend)
+        # Check if image contains expected packages
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        image_link_name = get_bb_var('IMAGE_LINK_NAME', image)
+        reqpkgs = [item for item in recipes if not item.endswith('-native')]
+        with open(os.path.join(deploy_dir_image, image_link_name + '.manifest'), 'r') as f:
+            for line in f:
+                splitval = line.split()
+                if splitval:
+                    pkg = splitval[0]
+                    if pkg in reqpkgs:
+                        reqpkgs.remove(pkg)
+        if reqpkgs:
+            self.fail('The following packages were not present in the image as expected: %s' % ', '.join(reqpkgs))
 
     def test_devtool_upgrade(self):
         # Check preconditions
diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index a6c7d81..05c1d75 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -70,40 +70,33 @@ def build_image(args, config, basepath, workspace):
         else:
             raise DevtoolError('Specified recipe %s is not an image recipe' % image)
 
-    if workspace:
-        packages = _get_packages(tinfoil, workspace, config)
-        if packages:
-            with open(appendfile, 'w') as afile:
-                # include packages from workspace recipes into the image
-                afile.write('IMAGE_INSTALL_append = " %s"\n' % ' '.join(packages))
-
-                # Generate notification callback devtool_warn_image_extended
-                afile.write('do_rootfs[prefuncs] += "devtool_warn_image_extended"\n\n')
-                afile.write("python devtool_warn_image_extended() {\n")
-                afile.write("    bb.plain('NOTE: %%s: building with additional '\n"
-                            "             'packages due to \"devtool build-image\"'"
-                            "              %% d.getVar('PN', True))\n"
-                            "    bb.plain('NOTE: delete %%s to clear this' %% \\\n"
-                            "             '%s')\n" % os.path.relpath(appendfile, basepath))
-                afile.write("}\n")
-
-                logger.info('Building image %s with the following '
-                            'additional packages: %s', image, ' '.join(packages))
+    try:
+        if workspace:
+            packages = _get_packages(tinfoil, workspace, config)
+            if packages:
+                with open(appendfile, 'w') as afile:
+                    # include packages from workspace recipes into the image
+                    afile.write('IMAGE_INSTALL_append = " %s"\n' % ' '.join(packages))
+                    logger.info('Building image %s with the following '
+                                'additional packages: %s', image, ' '.join(packages))
+            else:
+                logger.warning('No packages to add, building image %s unmodified', image)
         else:
-            logger.warning('No packages to add, building image %s unmodified', image)
-    else:
-        logger.warning('No recipes in workspace, building image %s unmodified', image)
+            logger.warning('No recipes in workspace, building image %s unmodified', image)
 
-    deploy_dir_image = tinfoil.config_data.getVar('DEPLOY_DIR_IMAGE', True)
+        deploy_dir_image = tinfoil.config_data.getVar('DEPLOY_DIR_IMAGE', True)
 
-    tinfoil.shutdown()
+        tinfoil.shutdown()
 
-    # run bitbake to build image
-    try:
-        exec_build_env_command(config.init_path, basepath,
-                               'bitbake %s' % image, watch=True)
-    except ExecutionError as err:
-        return err.exitcode
+        # run bitbake to build image
+        try:
+            exec_build_env_command(config.init_path, basepath,
+                                'bitbake %s' % image, watch=True)
+        except ExecutionError as err:
+            return err.exitcode
+    finally:
+        if os.path.isfile(appendfile):
+            os.unlink(appendfile)
 
     logger.info('Successfully built %s. You can find output files in %s'
                 % (image, deploy_dir_image))
-- 
2.1.0


