Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D5BC26BA09
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2013 11:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="385580109"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 11:04:32 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 8F9652C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:30 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:16 +0300
Message-Id: <e6c3250754b14b8fa57db53f2fd8ec581f073917.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 06/19] lib/oeqa/runtime: add new PAM support test
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:32 -0000

From: Alexandru Palalau <alexandrux.palalau@intel.com>

New test which verifies some usual commands functionality with PAM support

Signed-off-by: Alexandru Palalau <alexandrux.palalau@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/pam.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/pam.py

diff --git a/meta/lib/oeqa/runtime/pam.py b/meta/lib/oeqa/runtime/pam.py
new file mode 100644
index 0000000..52e1eb8
--- /dev/null
+++ b/meta/lib/oeqa/runtime/pam.py
@@ -0,0 +1,24 @@
+# This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=287 testcase
+# Note that the image under test must have "pam" in DISTRO_FEATURES
+
+import unittest
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasFeature("pam"):
+        skipModule("target doesn't have 'pam' in DISTRO_FEATURES")
+
+
+class PamBasicTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_ssh')
+    def test_pam(self):
+        (status, output) = self.target.run('login --help')
+        self.assertEqual(status, 1, msg = "login command does not work as expected. Status and output:%s and %s" %(status, output))
+        (status, output) = self.target.run('passwd --help')
+        self.assertEqual(status, 6, msg = "passwd command does not work as expected. Status and output:%s and %s" %(status, output))
+        (status, output) = self.target.run('su --help')
+        self.assertEqual(status, 2, msg = "su command does not work as expected. Status and output:%s and %s" %(status, output))
+        (status, output) = self.target.run('useradd --help')
+        self.assertEqual(status, 2, msg = "useradd command does not work as expected. Status and output:%s and %s" %(status, output))
-- 
1.8.3.1


