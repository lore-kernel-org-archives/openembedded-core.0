Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 40DEF77FA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:00:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 27 Jun 2017 03:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="872112183"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2017 03:00:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 89EA158058D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:00:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 12:57:41 +0300
Message-Id: <5f321d7b8ad192a27f43560519d3ae125a6916de.1498557396.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1498557396.git.ed.bartosh@linux.intel.com>
References: <cover.1498557396.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 7/7] oe-selftest: wic: fix test_quemu
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
X-List-Received-Date: Tue, 27 Jun 2017 10:00:31 -0000

This test case boots the image in qemu and checks for mounted
partitions. As /boot is mounted automatically the test case fails.
Fixed this by adding /boot to the list of mounted partitions.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 02c7d0f..46d626d 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -622,7 +622,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-            self.assertEqual(output, '/dev/root /\r\n/dev/sda3 /mnt')
+            self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt')
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
     @OETestID(1852)
-- 
2.1.4


