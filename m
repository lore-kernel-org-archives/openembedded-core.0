Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABA217FE08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 02:31:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8K2VvGl015995
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 19:31:57 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 19 Sep 2019 19:31:56 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Sep 2019 10:31:54 +0800
Message-ID: <1568946715-47955-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] devtool.py: change to do clean before remove-layer
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
X-List-Received-Date: Fri, 20 Sep 2019 02:31:56 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

if do clean after remove-layer, it will make stamp file not cleaned
since variable STAMP has changed, this will cause error like:

if testcase buildclean failed, when run next testcase modify, since
do_prepare_recipe_sysroot's stamp file exists, sysroot not populated,
then do_compile will fail with error:
/bin/sh: x86_64-poky-linux-gcc: command not found

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 6fe145c..a7c6005 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -518,8 +518,8 @@ class DevtoolModifyTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean mdadm')
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool modify mdadm -x %s' % tempdir)
         self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
@@ -587,8 +587,8 @@ class DevtoolModifyTests(DevtoolBase):
         self.track_for_cleanup(tempdir_m4)
         self.track_for_cleanup(builddir_m4)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean mdadm m4')
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.write_recipeinc('m4', 'EXTERNALSRC_BUILD = "%s"\ndo_clean() {\n\t:\n}\n' % builddir_m4)
         try:
             runCmd('devtool modify mdadm -x %s' % tempdir_mdadm)
@@ -683,8 +683,8 @@ class DevtoolModifyTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. devtool output: %s' % result.output)
@@ -715,8 +715,8 @@ class DevtoolModifyTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         self.assertExists(os.path.join(tempdir, 'configure.ac'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
@@ -1246,8 +1246,8 @@ class DevtoolExtractTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         # Test that deploy-target at this point fails (properly)
         result = runCmd('devtool deploy-target -n %s root@localhost' % testrecipe, ignore_status=True)
@@ -1297,8 +1297,8 @@ class DevtoolExtractTests(DevtoolBase):
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         image = 'core-image-minimal'
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % image)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         bitbake('%s -c clean' % image)
         # Add target and native recipes to workspace
         recipes = ['mdadm', 'parted-native']
@@ -1707,8 +1707,8 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(tempdir_cfg)
         self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % kernel_provider)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         #Step 1
         #Here is just generated the config file instead of all the kernel to optimize the
         #time of executing this test case.
-- 
2.7.4


