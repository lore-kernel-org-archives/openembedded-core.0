Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0F79B6B9F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2013 11:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="385580131"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 11:04:35 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id D92542C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:33 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:19 +0300
Message-Id: <f8d0b38340e1af682323ef90dccfed59691249a5.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 09/19] lib/oeqa/runtime: add vncserver for target test
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:35 -0000

From: Mihai Prica <mihai.prica@intel.com>

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/vnc.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/vnc.py

diff --git a/meta/lib/oeqa/runtime/vnc.py b/meta/lib/oeqa/runtime/vnc.py
new file mode 100644
index 0000000..9476184
--- /dev/null
+++ b/meta/lib/oeqa/runtime/vnc.py
@@ -0,0 +1,22 @@
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+import re
+
+def setUpModule():
+    skipModuleUnless(oeRuntimeTest.tc.target.run('which x11vnc')[0] == 0, "No x11vnc in image")
+
+class VNCTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_ssh')
+    def test_vnc(self):
+        (status, output) = self.target.run('x11vnc -display :0.0 -bg -q')
+        self.assertEqual(status, 0, msg="x11vnc server failed to start: %s" % output)
+        port = re.search('PORT=[0-9]*', output)
+        self.assertTrue(port, msg="Listening port not specified in command output: %s" %output)
+
+        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep -i [x]11vnc')
+        self.assertEqual(status, 0, msg="x11vnc process not running")
+
+        vncport = port.group(0).split('=')[1]
+        (status, output) = self.target.run('netstat -atun | grep :%s | grep LISTEN' % vncport)
+        self.assertEqual(status, 0, msg="x11vnc server not running on port %s" % vncport)
-- 
1.8.3.1


