Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6A18B7385A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 18:55:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Mar 2015 10:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,676,1418112000"; d="scan'208";a="692853705"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga002.jf.intel.com with ESMTP; 02 Mar 2015 10:55:41 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 10:55:38 -0800
Message-Id: <1425322538-40169-3-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1425322538-40169-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1425322538-40169-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH 2/2] lib/oeqa/selftest/lic-checksum: Verify failure when checksum changes.
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
X-List-Received-Date: Mon, 02 Mar 2015 18:55:43 -0000

The test added verifies that when a file with an absolute path in
LIC_FILES_CHKSUM changes without a corresponding change to the md5sum,
it triggers the license qa test again with a failure.

[Yocto #6450]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta-selftest/recipes-test/emptytest/emptytest.bb |  5 ++++
 meta/lib/oeqa/selftest/lic-checksum.py            | 28 +++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-selftest/recipes-test/emptytest/emptytest.bb
 create mode 100644 meta/lib/oeqa/selftest/lic-checksum.py

diff --git a/meta-selftest/recipes-test/emptytest/emptytest.bb b/meta-selftest/recipes-test/emptytest/emptytest.bb
new file mode 100644
index 0000000..e87f4d7
--- /dev/null
+++ b/meta-selftest/recipes-test/emptytest/emptytest.bb
@@ -0,0 +1,5 @@
+include test_recipe.inc
+
+# Set LICENSE to something so that bitbake -p that is ran at the beginning
+# is successful since test_recipe.inc has not yet been modified.
+LICENSE = ""
diff --git a/meta/lib/oeqa/selftest/lic-checksum.py b/meta/lib/oeqa/selftest/lic-checksum.py
new file mode 100644
index 0000000..0c1afa6
--- /dev/null
+++ b/meta/lib/oeqa/selftest/lic-checksum.py
@@ -0,0 +1,28 @@
+import os
+import tempfile
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import bitbake
+from oeqa.utils import CommandError
+
+class LicenseTests(oeSelfTest):
+    
+    # Verify that changing a license file that has an absolute path causes
+    # the license qa to fail due to a mismatched md5sum.
+    def test_foo(self):
+        bitbake_cmd = '-c configure emptytest'
+        error_msg = 'ERROR: emptytest: The new md5 checksum is 8d777f385d3dfec8815d20f7496026dc'
+
+        lic_file, lic_path = tempfile.mkstemp()
+        os.close(lic_file)
+        self.track_for_cleanup(lic_path)
+
+        self.write_recipeinc('emptytest', 'LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"' % lic_path)
+        result = bitbake(bitbake_cmd)
+
+        with open(lic_path, "w") as f:
+            f.write("data")
+
+        result = bitbake(bitbake_cmd, ignore_status=True)
+        if error_msg not in result.output:
+            raise AssertionError(result.output)
-- 
1.9.3


