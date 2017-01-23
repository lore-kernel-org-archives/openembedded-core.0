Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4E3F3605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 22:13:50 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 23 Jan 2017 14:13:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,275,1477983600"; d="scan'208";a="216745438"
Received: from jgperezc.zpn.intel.com ([10.219.5.150])
	by fmsmga004.fm.intel.com with ESMTP; 23 Jan 2017 14:13:50 -0800
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 16:13:31 -0600
Message-Id: <1485209611-23858-1-git-send-email-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Jose Perez Carranza <jose.perez.carranza@linux-ntel.com>,
	paul.eggleton@intel.com
Subject: [PATCH] selftest/devtool: Add test to verify "modify virtual/kernel"
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
X-List-Received-Date: Mon, 23 Jan 2017 22:13:51 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux-ntel.com>

The purpose of this test case is to verify that
devtool modify works correctly when building
the kernel.

[YOCTO #10817]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux-ntel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 85 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 79a4b1f..1ba8e00 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1579,3 +1579,88 @@ class DevtoolTests(DevtoolBase):
         checkvars['S'] = '${WORKDIR}/${BPN}-%s' % recipever
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(newrecipefile, checkvars, [])
+
+    @testcase(1577)
+    def test_devtool_virtual_kernel_modify(self):
+        """
+        Summary:        The purpose of this test case is to verify that
+                        devtool modify works correctly when building
+                        the kernel.
+        Dependencies:   NA
+        Steps:          1. Build kernel with bitbake.
+                        2. Save the config file generated.
+                        3. Clean the environment.
+                        4. Use `devtool modify virtual/kernel` to validate following:
+                           4.1 The source is checked out correctly.
+                           4.2 The resulting configuration is the same as
+                               what was get on step 2.
+                           4.3 The Kernel can be build correctly.
+                           4.4 Changes made on the source are reflected on the
+                               subsequent builds.
+                           4.5 Changes on the configuration are reflected on the
+                               subsequent builds
+         Expected:       devtool modify is able to checkout the source of the kernel
+                         and modification to the source and configurations are reflected
+                         when building the kernel.
+         """
+        #Set machine to qemxu86 to be able to modify the kernel and
+        #verify the modification.
+        features = 'MACHINE = "qemux86"\n'
+        self.write_config(features)
+        # Clean up the enviroment
+        bitbake('linux-yocto -c cleansstate')
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake -c clean linux-yocto')
+        #Step 1
+        #Here is just generated the config file instead of all the kernel to optimize the
+        #time of executing this test case.
+        bitbake('linux-yocto -c configure')
+        bbconfig = os.path.join(get_bb_var('B',"linux-yocto"),'.config')
+        buildir= get_bb_var('TOPDIR')
+        #Step 2
+        runCmd('cp %s %s' % (bbconfig, buildir))
+        self.assertTrue(os.path.exists(os.path.join(buildir, '.config')),
+                        'Could not copy .config file from kernel')
+
+        tmpconfig = os.path.join(buildir, '.config')
+        #Step 3
+        bitbake('linux-yocto -c cleanall')
+        #Step 4.1
+        runCmd('devtool modify virtual/kernel -x %s' % tempdir)
+        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')),
+                        'Extracted source could not be found')
+        #Step 4.2
+        configfile = os.path.join(tempdir,'.config')
+        diff = runCmd('diff %s %s' % (tmpconfig, configfile))
+        self.assertEqual(0,diff.status,'Kernel .config file is not the same using bitbake and devtool')
+        #Step 4.3
+        #NOTE: virtual/kernel is mapped to linux-yocto
+        result = runCmd('devtool build linux-yocto')
+        self.assertEqual(0,result.status,'Cannot build kernel using `devtool build`')
+        kernelfile = os.path.join(get_bb_var('KBUILD_OUTPUT',"linux-yocto"), 'vmlinux')
+        self.assertTrue(os.path.exists(kernelfile),'Kernel was not build correctly')
+
+        #Modify the kernel source, this is specific for qemux86
+        modfile = os.path.join(tempdir,'arch/x86/boot/header.S')
+        modstring = "use a boot loader - Devtool kernel testing"
+        modapplied = runCmd("sed -i 's/boot loader/%s/' %s" % (modstring, modfile))
+        self.assertEqual(0,modapplied.status,'Modification to %s on kernel source failed' % modfile)
+        #Modify the configuration
+        codeconfigfile = os.path.join(tempdir,'.config.new')
+        modconfopt = "CONFIG_SG_POOL=n"
+        modconf = runCmd("sed -i 's/CONFIG_SG_POOL=y/%s/' %s" % (modconfopt, codeconfigfile))
+        self.assertEqual(0,modconf.status,'Modification to %s failed' % codeconfigfile)
+        #Build again kernel with devtool
+        rebuild = runCmd('devtool build linux-yocto')
+        self.assertEqual(0,rebuild.status,'Fail to build kernel after modification of source and config')
+        #Step 4.4
+        bzimagename = 'bzImage-' + get_bb_var('KERNEL_VERSION_NAME',"linux-yocto")
+        bzimagefile = os.path.join(get_bb_var('D',"linux-yocto"),'boot', bzimagename)
+        checkmodcode = runCmd("strings %s | head -n 10 | grep '%s'" % (bzimagefile, modstring))
+        self.assertEqual(0,checkmodcode.status,'Modification on kernel source failed')
+        #Step 4.5
+        checkmodconfg = runCmd("grep %s %s" % (modconfopt, codeconfigfile))
+        self.assertEqual(0,checkmodconfg.status,'Modification to configuration file failed')
-- 
2.1.4


