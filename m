Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8986F771D7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 16:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491324350; x=1522860350;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=bt/fjptA6CbWhsUnRmjWxELOGdPlPtCnuPiSYxMGhMM=;
	b=jMsnP+jIRYbnETr9q6xzDLT9sF9sVzbMf+vphVWsPd/HcUoefrjSGvjM
	21nTUyg7snx9vtVYjbNpuIImJaw54g==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 09:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,275,1486454400"; d="scan'208";a="951683718"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2017 09:45:50 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 09:45:47 -0700
Message-Id: <20170404164547.39436-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170404164547.39436-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170404164547.39436-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] selftest/devtool: use kernel provider instead of recipe allowing other kernel providers
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
X-List-Received-Date: Tue, 04 Apr 2017 16:45:48 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

To generalize the unit test for other kernel providers, use virtual/kernel instead
of linux-yocto, allowing to run the selftest on non-poky distros, i.e. poky-tiny.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 7e65e52..762c7ba 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1636,18 +1636,19 @@ class DevtoolTests(DevtoolBase):
         #verify the modification.
         features = 'MACHINE = "qemux86"\n'
         self.write_config(features)
+        kernel_provider = get_bb_var('PREFERRED_PROVIDER_virtual/kernel')
         # Clean up the enviroment
-        bitbake('linux-yocto -c cleansstate')
+        bitbake('%s -c cleansstate' % kernel_provider)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        self.add_command_to_tearDown('bitbake -c clean linux-yocto')
+        self.add_command_to_tearDown('bitbake -c clean %s' % kernel_provider)
         #Step 1
         #Here is just generated the config file instead of all the kernel to optimize the
         #time of executing this test case.
-        bitbake('linux-yocto -c configure')
-        bbconfig = os.path.join(get_bb_var('B',"linux-yocto"),'.config')
+        bitbake('%s -c configure' % kernel_provider)
+        bbconfig = os.path.join(get_bb_var('B', kernel_provider),'.config')
         buildir= get_bb_var('TOPDIR')
         #Step 2
         runCmd('cp %s %s' % (bbconfig, buildir))
@@ -1656,7 +1657,7 @@ class DevtoolTests(DevtoolBase):
 
         tmpconfig = os.path.join(buildir, '.config')
         #Step 3
-        bitbake('linux-yocto -c clean')
+        bitbake('%s -c clean' % kernel_provider)
         #Step 4.1
         runCmd('devtool modify virtual/kernel -x %s' % tempdir)
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')),
@@ -1666,10 +1667,10 @@ class DevtoolTests(DevtoolBase):
         diff = runCmd('diff %s %s' % (tmpconfig, configfile))
         self.assertEqual(0,diff.status,'Kernel .config file is not the same using bitbake and devtool')
         #Step 4.3
-        #NOTE: virtual/kernel is mapped to linux-yocto
-        result = runCmd('devtool build linux-yocto')
+        #NOTE: virtual/kernel is mapped to kernel_provider
+        result = runCmd('devtool build %s' % kernel_provider)
         self.assertEqual(0,result.status,'Cannot build kernel using `devtool build`')
-        kernelfile = os.path.join(get_bb_var('KBUILD_OUTPUT',"linux-yocto"), 'vmlinux')
+        kernelfile = os.path.join(get_bb_var('KBUILD_OUTPUT', kernel_provider), 'vmlinux')
         self.assertTrue(os.path.exists(kernelfile),'Kernel was not build correctly')
 
         #Modify the kernel source, this is specific for qemux86
@@ -1683,11 +1684,11 @@ class DevtoolTests(DevtoolBase):
         modconf = runCmd("sed -i 's/CONFIG_SG_POOL=y/%s/' %s" % (modconfopt, codeconfigfile))
         self.assertEqual(0,modconf.status,'Modification to %s failed' % codeconfigfile)
         #Build again kernel with devtool
-        rebuild = runCmd('devtool build linux-yocto')
+        rebuild = runCmd('devtool build %s' % kernel_provider)
         self.assertEqual(0,rebuild.status,'Fail to build kernel after modification of source and config')
         #Step 4.4
-        bzimagename = 'bzImage-' + get_bb_var('KERNEL_VERSION_NAME',"linux-yocto")
-        bzimagefile = os.path.join(get_bb_var('D',"linux-yocto"),'boot', bzimagename)
+        bzimagename = 'bzImage-' + get_bb_var('KERNEL_VERSION_NAME', kernel_provider)
+        bzimagefile = os.path.join(get_bb_var('D', kernel_provider),'boot', bzimagename)
         checkmodcode = runCmd("grep '%s' %s" % (modstring, bzimagefile))
         self.assertEqual(0,checkmodcode.status,'Modification on kernel source failed')
         #Step 4.5
-- 
2.10.2


