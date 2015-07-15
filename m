Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 05685607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 14:35:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2015 07:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,480,1432623600"; d="scan'208";a="606721115"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 15 Jul 2015 07:35:12 -0700
Received: from localhost.localdomain (unknown [10.237.112.249])
	by linux.intel.com (Postfix) with ESMTP id A15506A4083;
	Wed, 15 Jul 2015 07:34:29 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 17:35:34 +0300
Message-Id: <1436970934-4635-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runtime: Added one runtime testcase in connman.
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
X-List-Received-Date: Wed, 15 Jul 2015 14:35:23 -0000

(testcase 223) Check that only one connmand runs in background.

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/runtime/connman.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
index cc537f7..b040400 100644
--- a/meta/lib/oeqa/runtime/connman.py
+++ b/meta/lib/oeqa/runtime/connman.py
@@ -28,3 +28,26 @@ class ConnmanTest(oeRuntimeTest):
         if status != 0:
             print self.service_status("connman")
             self.fail("No connmand process running")
+
+    @testcase(223)
+    def test_only_one_connmand_in_background(self):
+        """
+        Summary:     Only one connmand in background
+        Expected:    There will be only one connmand instance in background.
+        Product:     BSPs
+        Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        # Make sure that 'connmand' is running in background
+        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
+        self.assertEqual(0, status, 'Failed to find "connmand" process running in background.')
+
+        # Start a new instance of 'connmand'
+        (status, output) = self.target.run('connmand')
+        self.assertEqual(0, status, 'Failed to start a new "connmand" process.')
+
+        # Make sure that only one 'connmand' is running in background
+        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand | wc -l')
+        self.assertEqual(0, status, 'Failed to find "connmand" process running in background.')
+        self.assertEqual(1, int(output), 'Found {} connmand processes running, expected 1.'.format(output))
-- 
2.1.4


