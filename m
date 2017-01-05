Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1D871B48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 23:15:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2017 15:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,322,1477983600"; d="scan'208";a="1079696746"
Received: from bitbang.jf.intel.com ([10.7.199.68])
	by orsmga001.jf.intel.com with ESMTP; 05 Jan 2017 15:15:48 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 15:15:43 -0800
Message-Id: <65157013adbdef81ba06ad57187e598a0af1287e.1483658030.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1483658030.git.randy.e.witt@linux.intel.com>
References: <cover.1483658030.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/2] image_typedep.py: Add a test that ensures conversion type deps get added
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
X-List-Received-Date: Thu, 05 Jan 2017 23:15:54 -0000

Add a test that ensures if IMAGE_TYPEDEP_* contains a conversion type,
that the corresponding CONVERSION_DEPENDS_ for that type gets added to
the dependency tree for do_rootfs.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oeqa/selftest/image_typedep.py | 51 +++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/image_typedep.py

diff --git a/meta/lib/oeqa/selftest/image_typedep.py b/meta/lib/oeqa/selftest/image_typedep.py
new file mode 100644
index 0000000..256142d25
--- /dev/null
+++ b/meta/lib/oeqa/selftest/image_typedep.py
@@ -0,0 +1,51 @@
+import os
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import bitbake
+
+class ImageTypeDepTests(oeSelfTest):
+
+    # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
+    # the conversion type bar gets added as a dep as well
+    def test_conversion_typedep_added(self):
+
+        self.write_recipeinc('emptytest', """
+# Try to empty out the default dependency list
+PACKAGE_INSTALL = ""
+DISTRO_EXTRA_RDEPENDS=""
+
+LICENSE = "MIT"
+IMAGE_FSTYPES = "testfstype"
+
+IMAGE_TYPES_MASKED += "testfstype"
+IMAGE_TYPEDEP_testfstype = "tar.bz2"
+
+inherit image
+
+""")
+        # First get the dependency that should exist for bz2, it will look
+        # like CONVERSION_DEPENDS_bz2="somedep"
+        result = bitbake('-e emptytest')
+
+        for line in result.output.split('\n'):
+            if line.startswith('CONVERSION_DEPENDS_bz2'):
+                dep = line.split('=')[1].strip('"')
+                break
+
+        # Now get the dependency task list and check for the expected task
+        # dependency
+        bitbake('-g emptytest')
+
+        taskdependsfile = os.path.join(self.builddir, 'task-depends.dot')
+        dep =  dep + ".do_populate_sysroot"
+        depfound = False
+        expectedline = '"emptytest.do_rootfs" -> "{}"'.format(dep)
+
+        with open(taskdependsfile, "r") as f:
+            for line in f:
+                if line.strip() == expectedline:
+                    depfound = True
+                    break
+
+        if not depfound:
+            raise AssertionError("\"{}\" not found".format(expectedline))
-- 
2.7.4


