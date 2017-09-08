Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 99F0C77DB6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 19:08:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 08 Sep 2017 12:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,363,1500966000"; d="scan'208";a="133320601"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by orsmga002.jf.intel.com with ESMTP; 08 Sep 2017 12:08:44 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 12:08:43 -0700
Message-Id: <20170908190843.142387-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Cc: paul.eggleton@intel.com
Subject: [PATCH] selftest/devtool: Avoid writing on TOPDIR on kernel test case
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
X-List-Received-Date: Fri, 08 Sep 2017 19:08:43 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Use a tempdir to copy the .config file from the kernel instead of being
copied to build directory.

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c17131a56d..d5d09186f7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1654,7 +1654,9 @@ class DevtoolTests(DevtoolBase):
         # Clean up the enviroment
         bitbake('%s -c clean' % kernel_provider)
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        tempdir_cfg = tempfile.mkdtemp(prefix='config_qa')
         self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(tempdir_cfg)
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % kernel_provider)
@@ -1663,12 +1665,11 @@ class DevtoolTests(DevtoolBase):
         #time of executing this test case.
         bitbake('%s -c configure' % kernel_provider)
         bbconfig = os.path.join(get_bb_var('B', kernel_provider),'.config')
-        buildir= get_bb_var('TOPDIR')
         #Step 2
-        runCmd('cp %s %s' % (bbconfig, buildir))
-        self.assertExists(os.path.join(buildir, '.config'), 'Could not copy .config file from kernel')
+        runCmd('cp %s %s' % (bbconfig, tempdir_cfg))
+        self.assertExists(os.path.join(tempdir_cfg, '.config'), 'Could not copy .config file from kernel')
 
-        tmpconfig = os.path.join(buildir, '.config')
+        tmpconfig = os.path.join(tempdir_cfg, '.config')
         #Step 3
         bitbake('%s -c clean' % kernel_provider)
         #Step 4.1
-- 
2.12.3


