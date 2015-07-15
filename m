Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8916AC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 14:42:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2015 07:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,480,1432623600"; d="scan'208";a="763073369"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2015 07:42:30 -0700
Received: from localhost.localdomain (unknown [10.237.112.249])
	by linux.intel.com (Postfix) with ESMTP id 8FD366A4083;
	Wed, 15 Jul 2015 07:41:48 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 17:42:54 +0300
Message-Id: <1436971374-4975-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runtime: Added one automated runtime testcase.
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
X-List-Received-Date: Wed, 15 Jul 2015 14:42:34 -0000

testcase 240: Checks that bash is installed in image.

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/runtime/bash.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/bash.py

diff --git a/meta/lib/oeqa/runtime/bash.py b/meta/lib/oeqa/runtime/bash.py
new file mode 100644
index 0000000..2a261a3
--- /dev/null
+++ b/meta/lib/oeqa/runtime/bash.py
@@ -0,0 +1,23 @@
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+
+
+class BashTest(oeRuntimeTest):
+
+    @testcase(240)
+    @skipUnlessPassed("test_ssh")
+    def test_check_bash_in_image(self):
+        """
+        Summary:     check bash in image
+        Expected:    bash command should exist in image
+        Product:     BSPs
+        Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        cmd = 'which bash'
+        expected_ret = '/bin/bash'
+
+        (status, output) = self.target.run(cmd)
+        self.assertEqual(0, status, 'Failed to send cmd "{}"'.format(cmd))
+        self.assertEqual(str(output), expected_ret, 'Found "{}", instead of "{}"'.format(output, expected_ret))
-- 
2.1.4


