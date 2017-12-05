Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5C9787AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:42:08 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:42:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181356261"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:42:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:19 +1300
Message-Id: <a5f6739f23dda738c7b1862c672b9d9cdec8190e.1512438001.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/12] oe-selftest: devtool: fix kernel test for multisrc changes
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
X-List-Received-Date: Tue, 05 Dec 2017 01:42:08 -0000

Fix the oe-selftest test to understand that the source will be
found in a "source" subdirectory if the kernel inherits linux-yocto
since there are multiple trees extracted.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b3063de..96072be 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1676,9 +1676,14 @@ class DevtoolTests(DevtoolBase):
         bitbake('%s -c clean' % kernel_provider)
         #Step 4.1
         runCmd('devtool modify virtual/kernel -x %s' % tempdir)
-        self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
+        # If it's linux-yocto, we'll have two "source" trees (one the actual source,
+        # the other the kernel metadata)
+        tempsrc = os.path.join(tempdir, 'source')
+        if not os.path.isdir(tempsrc):
+            tempsrc = tempdir
+        self.assertExists(os.path.join(tempsrc, 'Makefile'), 'Extracted source could not be found')
         #Step 4.2
-        configfile = os.path.join(tempdir,'.config')
+        configfile = os.path.join(tempsrc, '.config')
         diff = runCmd('diff %s %s' % (tmpconfig, configfile))
         self.assertEqual(0,diff.status,'Kernel .config file is not the same using bitbake and devtool')
         #Step 4.3
@@ -1689,12 +1694,12 @@ class DevtoolTests(DevtoolBase):
         self.assertExists(kernelfile, 'Kernel was not build correctly')
 
         #Modify the kernel source
-        modfile = os.path.join(tempdir,'arch/x86/boot/header.S')
+        modfile = os.path.join(tempsrc, 'arch/x86/boot/header.S')
         modstring = "Use a boot loader. Devtool testing."
         modapplied = runCmd("sed -i 's/Use a boot loader./%s/' %s" % (modstring, modfile))
         self.assertEqual(0,modapplied.status,'Modification to %s on kernel source failed' % modfile)
         #Modify the configuration
-        codeconfigfile = os.path.join(tempdir,'.config.new')
+        codeconfigfile = os.path.join(tempsrc, '.config.new')
         modconfopt = "CONFIG_SG_POOL=n"
         modconf = runCmd("sed -i 's/CONFIG_SG_POOL=y/%s/' %s" % (modconfopt, codeconfigfile))
         self.assertEqual(0,modconf.status,'Modification to %s failed' % codeconfigfile)
-- 
2.9.5


