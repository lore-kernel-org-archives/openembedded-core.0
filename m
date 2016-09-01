Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F41BC731DF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 16:26:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 01 Sep 2016 09:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,268,1470726000"; d="scan'208";a="1023783537"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.25.136])
	by orsmga001.jf.intel.com with ESMTP; 01 Sep 2016 09:26:47 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 17:26:40 +0100
Message-Id: <a84389110546445be1bd190706cf54cc318207aa.1472747098.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1472747098.git.joshua.g.lock@intel.com>
References: <cover.1472747098.git.joshua.g.lock@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1472747098.git.joshua.g.lock@intel.com>
References: <cover.1472747098.git.joshua.g.lock@intel.com>
Subject: [PATCH v3 1/3] oeqa.selftest: add a test for oe.path.copytree()
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
X-List-Received-Date: Thu, 01 Sep 2016 16:26:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

One motivation for the use of cpio in oe.path.copytree() was to
ensure that files with spaces in their names were copied. Add a new
unittest module to test the OE module with a test case for copytree
with a spaces in a filename.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/selftest/liboe.py | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/liboe.py

diff --git a/meta/lib/oeqa/selftest/liboe.py b/meta/lib/oeqa/selftest/liboe.py
new file mode 100644
index 0000000..454b92a
--- /dev/null
+++ b/meta/lib/oeqa/selftest/liboe.py
@@ -0,0 +1,33 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import get_bb_var
+import oe.path
+import glob
+import os
+import os.path
+
+class LibOE(oeSelfTest):
+    def test_copy_tree_special(self):
+        """
+        Summary:    oe.path.copytree() should copy files with special character
+        Expected:   'test file with sp£c!al @nd spaces' should exist in
+                    copy destination
+        Product:    OE-Core
+        Author:     Joshua Lock <joshua.g.lock@intel.com>
+        """
+        tmp_dir = get_bb_var('TMPDIR')
+        testloc = oe.path.join(tmp_dir, 'liboetests')
+        src = oe.path.join(testloc, 'src')
+        dst = oe.path.join(testloc, 'dst')
+        bb.utils.mkdirhier(testloc)
+        bb.utils.mkdirhier(src)
+        testfilename = 'test file with sp£c!al @nd spaces'
+
+        # create the test file and copy it
+        open(oe.path.join(src, testfilename), 'w+b').close()
+        oe.path.copytree(src, dst)
+
+        # ensure path exists in dest
+        fileindst = os.path.isfile(oe.path.join(dst, testfilename))
+        self.assertTrue(fileindst, "File with spaces doesn't exist in dst")
+
+        oe.path.remove(testloc)
-- 
2.7.4


