Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BC04177552
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:24:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 06 Mar 2017 07:24:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,254,1484035200"; d="scan'208";a="1138560941"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2017 07:24:29 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id B6B046A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:24:26 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 17:10:11 +0200
Message-Id: <433a201fa2456f518c3aaa2a3e876ea81f009eb2.1488812619.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488812619.git.ed.bartosh@linux.intel.com>
References: <cover.1488812619.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/5] selftest: test wic efi image in qemu
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
X-List-Received-Date: Mon, 06 Mar 2017 15:24:28 -0000

Added test_qemu_efi test case to wic test suite.

It uses ovmf qemu extention to test mkefidisk image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index b7fe52f..dcb88ba 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -547,3 +547,17 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
+
+    def test_qemu_efi(self):
+        """Test core-image-minimal efi image under qemu"""
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "mkefidisk.wks"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal ovmf').status)
+        self.remove_config(config)
+
+        with runqemu('core-image-minimal', ssh=False,
+                     runqemuparams='ovmf', image_fstype='wic') as qemu:
+            cmd = "grep vda. /proc/partitions  |wc -l"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertEqual(output, '3')
-- 
2.1.4


