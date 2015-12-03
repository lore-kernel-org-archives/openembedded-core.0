Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8B84E6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 22:02:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 03 Dec 2015 14:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="699800798"
Received: from besquive-mobl2.amr.corp.intel.com (HELO
	besquive-mobl2.zpn.intel.com) ([10.219.128.114])
	by orsmga003.jf.intel.com with ESMTP; 03 Dec 2015 14:02:44 -0800
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 16:02:26 -0600
Message-Id: <1449180147-17523-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH 1/2] oeqa/systemd: journalctl helper function
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
X-List-Received-Date: Thu, 03 Dec 2015 22:02:52 -0000

a function to request for the journalctl output to the current target
system with l_match_units support

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/lib/oeqa/runtime/systemd.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index c74394c..d0b9b2f 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -21,6 +21,34 @@ class SystemdTest(oeRuntimeTest):
         self.assertEqual(status, expected, message)
         return output
 
+    #TODO: use pyjournalctl instead
+    def journalctl(self, args='',l_match_units=[]):
+        """
+        Request for the journalctl output to the current target system
+
+        Arguments:
+        -args, an optional argument pass through argument
+        -l_match_units, an optional list of units to filter the output
+        Returns:
+        -string output of the journalctl command
+        Raises:
+        -AssertionError, on remote commands that fail
+        -ValueError, on a journalctl call with filtering by l_match_units that
+        returned no entries
+        """
+        query_units=""
+        if len(l_match_units):
+            query_units = ['_SYSTEMD_UNIT='+unit for unit in l_match_units]
+            query_units = " ".join(query_units)
+        command = 'journalctl %s %s' %(args, query_units)
+        status, output = self.target.run(command)
+        if status:
+            raise AssertionError("Command '%s' returned non-zero exit \
+                    code %d:\n%s" % (command, status, output))
+        if len(output) == 1 and "-- No entries --" in output:
+            raise ValueError("List of units to match: %s, returned no entries"
+                    % l_match_units)
+        return output
 
 class SystemdBasicTests(SystemdTest):
 
-- 
2.4.3


