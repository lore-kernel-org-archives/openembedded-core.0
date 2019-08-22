Return-Path: <mazliana.mohamad@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 21A547E265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 08:15:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2019 01:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="178759532"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2019 01:15:41 -0700
From: mazliana.mohamad@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2019 16:15:38 +0800
Message-Id: <1566461738-29240-1-git-send-email-mazliana.mohamad@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] oeqa/kerneldevelopment: Able to apply a single patch to the Linux kernel source
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
X-List-Received-Date: Thu, 22 Aug 2019 08:15:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mazliana <mazliana.mohamad@intel.com>

Purpose of kernel development is basically to customize our
own recipes kernel by reused existing recipes.
 
This is an initiative of automating manual kernel development
test cases. Applying a single patch to the Linux kernel source
is one of the manual test cases of kernel development.

Objective of this test is as a developer we can make changes of
a file in kernel source and able to apply a single patch to
the kernel source.
 
ref:https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases

Signed-off-by: Mazliana <mazliana.mohamad@intel.com
---
 meta/lib/oeqa/selftest/cases/kerneldevelopment.py | 65 +++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/kerneldevelopment.py

diff --git a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
new file mode 100644
index 0000000..15cef40
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
@@ -0,0 +1,65 @@
+import os
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, runCmd, get_bb_var
+from oeqa.utils.git import GitRepo, GitError
+
+class KernelDev(OESelftestTestCase):
+
+    @classmethod 
+    def setUpClass(cls):
+        super(KernelDev, cls).setUpClass()
+        # Create the recipe directory structure inside the created layer
+        cls.layername = 'meta-kerneltest'
+        runCmd('bitbake-layers create-layer %s' %cls.layername)
+        runCmd('mkdir -p %s/recipes-kernel/linux/linux-yocto' %cls.layername)
+        cls.recipes_linuxyocto_dir=os.path.join(cls.builddir, cls.layername, 'recipes-kernel', 'linux', 'linux-yocto')
+        cls.recipeskernel_dir=os.path.dirname(cls.recipes_linuxyocto_dir)
+        runCmd('bitbake-layers add-layer %s' %cls.layername)
+        
+    @classmethod
+    def tearDownClass(cls):
+        runCmd('bitbake-layers remove-layer %s' %cls.layername, ignore_status=True)
+        runCmd('rm -rf %s' %cls.layername)
+        super(KernelDev, cls).tearDownClass()
+        
+    def setUp(self):
+        super(KernelDev, self).setUp()
+        self.set_machine_config('MACHINE = "%s"\n' %'qemux86-64')
+        
+    def test_apply_patches(self):
+        """
+        Summary:     Able to apply a single patch to the Linux kernel source
+        Expected:    The README file should exist and the patch changes should be 
+                     displayed at the end of the file. 
+        Product:     Kernel Development
+        Author:      Yeoh Ee Peng <ee.peng.yeoh@intel.com>
+        AutomatedBy: Mazliana Mohamad <mazliana.mohamad@intel.com>
+        """
+        runCmd('bitbake virtual/kernel -c patch')
+        kernel_source = get_bb_var('STAGING_KERNEL_DIR')
+        readme = os.path.join(kernel_source,'README')
+        
+        # This test step adds modified file 'README' to git and creates a 
+        # patch file '0001-KERNEL_DEV_TEST_CASE.patch' at the same location as file
+        patch_content = 'This is a test to apply a patch to the kernel'
+        runCmd('echo %s >> %s' %(patch_content,readme))
+        repo=GitRepo('%s' %kernel_source,is_topdir=True)
+        repo.run_cmd('add %s'%readme)
+        repo.run_cmd(['commit', '-m', 'KERNEL_DEV_TEST_CASE'])
+        repo.run_cmd(['format-patch', '-1'])
+        patch_name = '0001-KERNEL_DEV_TEST_CASE.patch'
+        patchpath = os.path.join(kernel_source, patch_name)
+        runCmd('mv %s %s' %(patchpath, self.recipes_linuxyocto_dir))
+        runCmd('rm %s ' %readme)
+        self.assertFalse(os.path.exists(readme))
+        
+        recipe_append = os.path.join(self.recipeskernel_dir,'linux-yocto_%.bbappend')
+        with open(recipe_append, 'w+') as fh:
+            fh.write('SRC_URI += "file://%s"\n' %patch_name)
+            fh.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"')
+        
+        runCmd('bitbake virtual/kernel -c cleansstate')  
+        runCmd('bitbake virtual/kernel -c patch')
+        self.assertTrue(os.path.exists(readme))  
+        result = runCmd('tail -n 1 %s' %readme)
+        self.assertEqual(result.output, patch_content)
\ No newline at end of file
-- 
2.7.4


