Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E6252731CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:35:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2016 05:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,329,1459839600"; d="scan'208";a="969555661"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2016 05:35:34 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 0DBF86A4007;
	Wed, 18 May 2016 06:23:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 15:34:19 +0300
Message-Id: <1463574859-5073-4-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1463574859-5073-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1463159633.9746.121.camel@linuxfoundation.org>
	<1463574859-5073-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 4/4] oe-selftest: wic: add test_bmap test case
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
X-List-Received-Date: Wed, 18 May 2016 12:35:34 -0000

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


