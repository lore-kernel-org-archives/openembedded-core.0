Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4ABD873991
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 20:04:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 09 Mar 2015 13:01:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,369,1422950400"; d="scan'208";a="696121826"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga002.jf.intel.com with ESMTP; 09 Mar 2015 13:04:17 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 13:04:14 -0700
Message-Id: <1425931454-38009-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] lib/oeqa/runtime/systemd: Add a basic runtime test for the journal
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
X-List-Received-Date: Mon, 09 Mar 2015 20:04:18 -0000

The test_systemd_journal() test will fail if journalctl exits with a
non-zero exit status. The exit status is non-zero even if there are no
journal files, which is what drove the creation of this test.

[Yocto #7388]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oeqa/runtime/systemd.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 1451698..5935edd 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -86,3 +86,9 @@ class SystemdServiceTests(SystemdTest):
         self.systemctl('is-enabled', 'avahi-daemon.service', expected=1)
         self.systemctl('enable', 'avahi-daemon.service')
         self.systemctl('is-enabled', 'avahi-daemon.service')
+
+class SystemdJournalTests(SystemdTest):
+    @skipUnlessPassed('test_ssh')
+    def test_systemd_journal(self):
+        (status, output) = self.target.run('journalctl')
+        self.assertEqual(status, 0, output)
-- 
1.9.3


