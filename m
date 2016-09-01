Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 14DF37422C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 16:26:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 01 Sep 2016 09:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,268,1470726000"; d="scan'208";a="1023783549"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.25.136])
	by orsmga001.jf.intel.com with ESMTP; 01 Sep 2016 09:26:50 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 17:26:42 +0100
Message-Id: <81053ce9378c3018ff88eb7fd6fd7fb8e83ecb63.1472747098.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1472747098.git.joshua.g.lock@intel.com>
References: <cover.1472747098.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1472747098.git.joshua.g.lock@intel.com>
References: <cover.1472747098.git.joshua.g.lock@intel.com>
Subject: [PATCH v3 3/3] oeqa.selftest.liboe: add test for xattr in copytree
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
X-List-Received-Date: Thu, 01 Sep 2016 16:26:51 -0000

Add a test to ensure that oe.path.copytree() preserves extended
attributes on files.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/selftest/liboe.py | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/liboe.py b/meta/lib/oeqa/selftest/liboe.py
index 454b92a..5c93069 100644
--- a/meta/lib/oeqa/selftest/liboe.py
+++ b/meta/lib/oeqa/selftest/liboe.py
@@ -1,5 +1,5 @@
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import get_bb_var
+from oeqa.utils.commands import get_bb_var, bitbake, runCmd
 import oe.path
 import glob
 import os
@@ -31,3 +31,34 @@ class LibOE(oeSelfTest):
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
+        bindir = get_bb_var('STAGING_BINDIR_NATIVE')
+
+        # create a file with xattr and copy it
+        open(oe.path.join(src, testfilename), 'w+b').close()
+        runCmd('%s/setfattr -n user.oetest -v "testing liboe" %s' % (bindir, oe.path.join(src, testfilename)))
+        oe.path.copytree(src, dst)
+
+        # ensure file in dest has user.oetest xattr
+        result = runCmd('%s/getfattr -n user.oetest %s' % (bindir, oe.path.join(dst, testfilename)))
+        self.assertIn('user.oetest="testing liboe"', result.output, 'Extended attribute not sert in dst')
+
+        oe.path.remove(testloc)
-- 
2.7.4


