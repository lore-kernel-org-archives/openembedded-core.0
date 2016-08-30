Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2CC7327F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 13:05:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2016 06:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,256,1470726000"; d="scan'208";a="1022257703"
Received: from jlock-mobl1.ld.intel.com ([10.103.239.28])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2016 06:05:18 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 14:05:11 +0100
Message-Id: <0480976f373d2ba6ed895b0e1e8c74b95390efb7.1472562256.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1472562256.git.joshua.g.lock@intel.com>
References: <cover.1472562256.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1472562256.git.joshua.g.lock@intel.com>
References: <cover.1472562256.git.joshua.g.lock@intel.com>
Subject: [PATCH v2 3/3] oeqa.selftest.liboe: add test for xattr in copytree
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
X-List-Received-Date: Tue, 30 Aug 2016 13:05:18 -0000

Add a test to ensure that oe.path.copytree() preserves extended
attributes on files.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/selftest/liboe.py | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/liboe.py b/meta/lib/oeqa/selftest/liboe.py
index 454b92a..2aeab61 100644
--- a/meta/lib/oeqa/selftest/liboe.py
+++ b/meta/lib/oeqa/selftest/liboe.py
@@ -1,5 +1,5 @@
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import get_bb_var
+from oeqa.utils.commands import get_bb_var, bitbake, runCmd
 import oe.path
 import glob
 import os
@@ -31,3 +31,33 @@ class LibOE(oeSelfTest):
         self.assertTrue(fileindst, "File with spaces doesn't exist in dst")
 
         oe.path.remove(testloc)
+
+    def test_copy_tree_xattr(self):
+        """
+        Summary:    oe.path.copytree() should preserve xattr on copied files
+        Expected:   testxattr file in destination should have user.oetest
+                    extended attribute
+        Product:    OE-Core
+        Author:     Joshua Lock <joshua.g.lock@intel.com>
+        """
+        tmp_dir = get_bb_var('TMPDIR')
+        testloc = oe.path.join(tmp_dir, 'liboetests')
+        src = oe.path.join(testloc, 'src')
+        dst = oe.path.join(testloc, 'dst')
+        bb.utils.mkdirhier(testloc)
+        bb.utils.mkdirhier(src)
+        testfilename = 'testxattr'
+
+        # ensure we have setfattr available
+        bitbake("attr-native")
+        
+        # create a file with xattr and copy it
+        open(oe.path.join(src, testfilename), 'w+b').close()
+        runCmd('setfattr -n user.oetest -v "testing liboe" %s' % oe.path.join(src, testfilename))
+        oe.path.copytree(src, dst)
+        
+        # ensure file in dest has user.oetest xattr
+        result = runCmd('getfattr -n user.oetest %s' % oe.path.join(dst, testfilename))
+        self.assertIn('user.oetest="testing liboe"', result.output, 'Extended attribute not sert in dst')
+
+        oe.path.remove(testloc)
-- 
2.7.4


