Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 29FCA7846A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 09:53:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2017 02:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,425,1496127600"; d="scan'208";a="292649314"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 28 Jul 2017 02:53:10 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 2B9975809E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 02:53:09 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 12:29:28 +0300
Message-Id: <14984eee205538cbccebbb9cbf44aa3636ce7ef6.1501233796.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1501233796.git.ed.bartosh@linux.intel.com>
References: <cover.1501233796.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v5 7/7] oe-selftest: wic: fix test_quemu
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
X-List-Received-Date: Fri, 28 Jul 2017 09:53:09 -0000

This test case boots the image in qemu and checks for mounted
partitions. As /boot is mounted automatically the test case fails.
Fixed this by adding /boot to the list of mounted partitions.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 7c2c877..aaefd4f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -637,7 +637,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-            self.assertEqual(output, '/dev/root /\r\n/dev/sda3 /mnt')
+            self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt')
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
     @OETestID(1852)
-- 
2.1.4


