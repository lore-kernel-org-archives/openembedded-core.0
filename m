Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DB448731C8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 14:43:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 02 May 2016 07:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,567,1455004800"; d="scan'208";a="796936818"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 02 May 2016 07:43:39 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id E8F476A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 08:31:13 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 15:22:37 +0300
Message-Id: <d398d8df283912bb277b82746b84d74c3a97fb8b.1462191317.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462191317.git.ed.bartosh@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462191317.git.ed.bartosh@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 6/6] oe-selftest: wic: add test_bmap test case
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
X-List-Received-Date: Mon, 02 May 2016 14:43:39 -0000

Tested generation of .bmap file using wic --bmap command
line option.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index a569fbf..895c6d6 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -276,3 +276,11 @@ class Wic(oeSelfTest):
             status, output = qemu.run_serial(command)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (command, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
+
+    def test_bmap(self):
+        """Test generation of .bmap file"""
+        image = "directdisk"
+        status = runCmd("wic create %s -e core-image-minimal --bmap" % image).status
+        self.assertEqual(0, status)
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap" % image)))
-- 
2.1.4


