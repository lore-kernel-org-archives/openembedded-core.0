Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 88E427707A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 13:41:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 01 Oct 2015 06:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,617,1437462000"; d="scan'208";a="817174014"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga002.jf.intel.com with ESMTP; 01 Oct 2015 06:41:30 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 16:42:09 +0300
Message-Id: <1443706929-11810-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Revert "oeqa/runtime: Added one runtime testcase in connman."
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
X-List-Received-Date: Thu, 01 Oct 2015 13:41:33 -0000

connman daemon forks during normal usage,
so this test is no longer valid and generates
sometimes false positives.

This reverts commit 7d01c595c96eb3d67b90caf71050c4e9345257de.
---
 meta/lib/oeqa/runtime/connman.py | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
index ee69e5d..bd9dba3 100644
--- a/meta/lib/oeqa/runtime/connman.py
+++ b/meta/lib/oeqa/runtime/connman.py
@@ -29,26 +29,3 @@ class ConnmanTest(oeRuntimeTest):
         if status != 0:
             print self.service_status("connman")
             self.fail("No connmand process running")
-
-    @testcase(223)
-    def test_only_one_connmand_in_background(self):
-        """
-        Summary:     Only one connmand in background
-        Expected:    There will be only one connmand instance in background.
-        Product:     BSPs
-        Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
-        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
-        """
-
-        # Make sure that 'connmand' is running in background
-        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
-        self.assertEqual(0, status, 'Failed to find "connmand" process running in background.')
-
-        # Start a new instance of 'connmand'
-        (status, output) = self.target.run('connmand')
-        self.assertEqual(0, status, 'Failed to start a new "connmand" process.')
-
-        # Make sure that only one 'connmand' is running in background
-        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand | wc -l')
-        self.assertEqual(0, status, 'Failed to find "connmand" process running in background.')
-        self.assertEqual(1, int(output), 'Found {} connmand processes running, expected 1.'.format(output))
-- 
2.1.4


