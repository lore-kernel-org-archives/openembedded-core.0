Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9987672A85
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 13:52:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2015 06:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,384,1427785200"; d="scan'208";a="725330255"
Received: from jlbuthle-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.24.56])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2015 06:52:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 May 2015 14:52:25 +0100
Message-Id: <55baa46039ab28d47ab39f4ecfa080c755535a98.1431006684.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431006684.git.paul.eggleton@linux.intel.com>
References: <cover.1431006684.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431006684.git.paul.eggleton@linux.intel.com>
References: <cover.1431006684.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] oe-selftest: devtool: add a proper test to see if tap devices exist
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
X-List-Received-Date: Thu, 07 May 2015 13:52:42 -0000

Check up front in test_devtool_deploy_target whether the tap devices
exist and skip if not. If we don't do this we get a significantly less
comprehensible error via pexpect.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 2344fac..1d16113 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -587,6 +587,16 @@ class DevtoolTests(oeSelfTest):
             self.skipTest('This test only works with qemu machines')
         if not os.path.exists('/etc/runqemu-nosudo'):
             self.skipTest('You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
+        result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
+        if result.status != 0:
+            result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=True)
+            if result.status != 0:
+                self.skipTest('Failed to determine if tap devices exist with ifconfig or ip: %s' % result.output)
+        for line in result.output.splitlines():
+            if line.startswith('tap'):
+                break
+        else:
+            self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
         workspacedir = os.path.join(self.builddir, 'workspace')
         self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         import pexpect
-- 
2.1.0


