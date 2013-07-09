Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F2CE66A8E4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 16:47:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2013 09:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1029,1363158000"; d="scan'208";a="367245534"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2013 09:47:53 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id F3D946A4091;
	Tue,  9 Jul 2013 09:47:51 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 19:48:35 +0300
Message-Id: <1373388515-21851-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] lib/oeqa/runtime/dmesg.py: whitelist dmesg message for systemd net interface name
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
X-List-Received-Date: Tue, 09 Jul 2013 16:47:54 -0000

Messages such as:
"systemd-udevd[79]: error changing net interface name eth0 to enp0s3: Device or resource busy"
are harmless as systemd can't rename interfaces in qemu (the interface is already active).
Alternatively, passing net.ifnames=0 to the kernel will stop systemd renaming the interfaces.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/dmesg.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/dmesg.py b/meta/lib/oeqa/runtime/dmesg.py
index b0e2175..48370fb 100644
--- a/meta/lib/oeqa/runtime/dmesg.py
+++ b/meta/lib/oeqa/runtime/dmesg.py
@@ -9,5 +9,5 @@ class DmesgTest(oeRuntimeTest):
 
     @skipUnlessPassed('test_ssh')
     def test_dmesg(self):
-        (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -i error')
+        (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -v "error changing net interface name" | grep -i error')
         self.assertEqual(status, 1, msg = "Error messages in dmesg log: %s" % output)
-- 
1.8.1.4


