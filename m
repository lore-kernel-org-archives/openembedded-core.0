Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1E62A6B1C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 14:42:19 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2013 07:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="331579528"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2013 07:42:13 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id DE02F6A4091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 07:42:11 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 17:42:26 +0300
Message-Id: <a96ad55046facd9cdadc578e1078317aee87c7c6.1373899189.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1373899189.git.stefanx.stanacar@intel.com>
References: <cover.1373899189.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373899189.git.stefanx.stanacar@intel.com>
References: <cover.1373899189.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 5/9] lib/oeqa/oetest.py: provide a ps command for all tests
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
X-List-Received-Date: Mon, 15 Jul 2013 14:42:19 -0000

Many tests will use 'ps' but we need to know if it's busybox
or standard ps.
Drop the existing check from the connman test.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/oetest.py          | 5 ++---
 meta/lib/oeqa/runtime/connman.py | 5 -----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 24548e9..5777ff8 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -9,7 +9,8 @@ def runTests(tc):
 
     # set the context object passed from the test class
     setattr(oeRuntimeTest, "tc", tc)
-
+    # set ps command to use
+    setattr(oeRuntimeTest, "pscmd", "ps -ef" if oeRuntimeTest.hasPackage("procps") else "ps")
     # prepare test suite, loader and runner
     suite = unittest.TestSuite()
     testloader = unittest.TestLoader()
@@ -30,7 +31,6 @@ class oeRuntimeTest(unittest.TestCase):
     testFailures = []
     testSkipped = []
     testErrors = []
-    pscmd = "ps"
 
     def __init__(self, methodName='runTest'):
         self.target = oeRuntimeTest.tc.target
@@ -74,7 +74,6 @@ class oeRuntimeTest(unittest.TestCase):
 
 
 
-
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
     # First element of the list the is current frame, caller is 1
diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
index 835e135..5ef96f6 100644
--- a/meta/lib/oeqa/runtime/connman.py
+++ b/meta/lib/oeqa/runtime/connman.py
@@ -17,11 +17,6 @@ class ConnmanTest(oeRuntimeTest):
 
     @skipUnlessPassed('test_connmand_help')
     def test_connmand_running(self):
-        status = self.target.run('ls -l `which ps` | grep busybox')[0]
-        if status == 0:
-            oeRuntimeTest.pscmd = 'ps'
-        else:
-            oeRuntimeTest.pscmd = 'ps -ef'
         (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
         self.assertEqual(status, 0, msg="no connmand process, ps output: %s" % self.target.run(oeRuntimeTest.pscmd)[1])
 
-- 
1.8.3.1


