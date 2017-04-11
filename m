Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 224B177CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:21:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3B9LaeC011959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 02:21:36 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Apr 2017 02:21:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Apr 2017 02:21:29 -0700
Message-ID: <e0b5baf4f7b30d669853ca281f80648d96bc4f70.1491902179.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491902179.git.liezhi.yang@windriver.com>
References: <cover.1491902179.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] selftest/wic.py: vda -> sda
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
X-List-Received-Date: Tue, 11 Apr 2017 09:21:36 -0000
Content-Type: text/plain

Previously, runqemu grep root=/dev/sd or root=/dev/hd on the image, and
would use vda if no grep result, now we have set QB_DRIVE_TYPE to
"/dev/sd" by default, and the device will be /dev/sda, so use sda to
replace vda in the test case.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/wic.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 8030c35117..34de6808c4 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -613,7 +613,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-            self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
+            self.assertEqual(output, '/dev/root /\r\n/dev/sda3 /mnt')
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemu_efi(self):
@@ -625,7 +625,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 
         with runqemu('core-image-minimal', ssh=False,
                      runqemuparams='ovmf', image_fstype='wic') as qemu:
-            cmd = "grep vda. /proc/partitions  |wc -l"
+            cmd = "grep sda. /proc/partitions  |wc -l"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '3')
@@ -700,7 +700,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.remove_config(config)
 
         with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
-            cmd = "grep vda. /proc/partitions  |wc -l"
+            cmd = "grep sda. /proc/partitions  |wc -l"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '2')
-- 
2.11.0.rc2.dirty


