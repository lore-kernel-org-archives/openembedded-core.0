Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 00F2B6B115
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Aug 2013 08:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="390996663"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2013 08:32:27 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 36F972C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:25 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:30:41 +0300
Message-Id: <47def7753037e9c7d1af211d4fd7901207246edc.1377269484.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 01/21] lib/oeqa/runtime: add basic test for x32 images
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
X-List-Received-Date: Fri, 23 Aug 2013 15:32:31 -0000

From: Alexandru Georgescu <alexandru.c.georgescu@intel.com>

Checks that an x86-64-x32 image has the right binaries.

Signed-off-by: Alexandru Georgescu <alexandru.c.georgescu@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/x32lib.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/x32lib.py

diff --git a/meta/lib/oeqa/runtime/x32lib.py b/meta/lib/oeqa/runtime/x32lib.py
new file mode 100644
index 0000000..6bad201
--- /dev/null
+++ b/meta/lib/oeqa/runtime/x32lib.py
@@ -0,0 +1,17 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+        #check if DEFAULTTUNE is set and it's value is: x86-64-x32
+        defaulttune = oeRuntimeTest.tc.d.getVar("DEFAULTTUNE", True)
+        if "x86-64-x32" not in defaulttune:
+            skipModule("DEFAULTTUNE is not set to x86-64-x32")
+
+class X32libTest(oeRuntimeTest):
+
+    @skipUnlessPassed("test_ssh")
+    def test_x32_file(self):
+        status1 = self.target.run("readelf -h /bin/ls | grep Class | grep ELF32")[0]
+        status2 = self.target.run("readelf -h /bin/ls | grep Machine | grep X86-64")[0]
+        self.assertTrue(status1 == 0 and status2 == 0, msg="/bin/ls isn't an X86-64 ELF32 binary. readelf says: %s" % self.target.run("readelf -h /bin/ls")[1])
-- 
1.8.3.1


