Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6E76AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 08:28:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 01:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="855088249"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 10 May 2017 01:28:22 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AE6266A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 01:28:07 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 11:05:11 +0300
Message-Id: <c27e7a98cebabca8819be9cbf808217e826a41fe.1494402710.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494402710.git.ed.bartosh@linux.intel.com>
References: <cover.1494402710.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/4] oe-selftest: add wic tests for generic EFI
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
X-List-Received-Date: Wed, 10 May 2017 08:28:21 -0000

Added test_generic_efi_grub_qemu and test_generic_efi_systemd_qemu
test cases and wks template to build and boot generic EFI images in qemu.

[YOCTO #10073]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/wic/test_generic_efi.wks.in |  9 ++++++++
 meta/lib/oeqa/selftest/wic.py             | 36 +++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-selftest/wic/test_generic_efi.wks.in

diff --git a/meta-selftest/wic/test_generic_efi.wks.in b/meta-selftest/wic/test_generic_efi.wks.in
new file mode 100644
index 0000000..fecf3fd
--- /dev/null
+++ b/meta-selftest/wic/test_generic_efi.wks.in
@@ -0,0 +1,9 @@
+# short-description: Create an EFI disk image
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media.
+
+part /boot --source rootfs --rootfs-dir=${WORKDIR}/bootfs --fstype=vfat --label boot --active --align 1024
+
+part / --source rootfs --fstype=ext4 --label root --align 1024 --uuid ${ROOTFS_PARTUUID}
+
+bootloader --ptable gpt
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index cdec80c..9cb9507 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -789,3 +789,39 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                 # 8 blocks is 4K (physical sector size)
                 self.assertEqual(dest_stat.st_blocks, 8)
             os.unlink(dest)
+
+    @only_for_arch(['i586', 'i686', 'x86_64'])
+    def test_generic_efi_grub_qemu(self):
+        """Test generic efi (grub-efi) image in qemu"""
+        config = 'IMAGE_FSTYPES = "wic"\nMACHINE_FEATURES_append = " efi"\n'\
+                 'EFI_PROVIDER = "grub-efi"\n'\
+                 'WKS_FILE = "test_generic_efi.wks.in"\n'
+
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal ovmf').status)
+        self.remove_config(config)
+
+        with runqemu('core-image-minimal', ssh=False,
+                     runqemuparams='ovmf', image_fstype='wic') as qemu:
+            cmd = "grep sda. /proc/partitions  |wc -l"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertEqual(output, '2')
+
+    @only_for_arch(['i586', 'i686', 'x86_64'])
+    def test_generic_efi_systemd_qemu(self):
+        """Test generic efi (systemd-boot) image in qemu"""
+        config = 'IMAGE_FSTYPES = "wic"\nMACHINE_FEATURES_append = " efi"\n'\
+                 'EFI_PROVIDER = "systemd-boot"\n'\
+                 'WKS_FILE = "test_generic_efi.wks.in"\n'
+
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal ovmf').status)
+        self.remove_config(config)
+
+        with runqemu('core-image-minimal', ssh=False,
+                     runqemuparams='ovmf', image_fstype='wic') as qemu:
+            cmd = "grep sda. /proc/partitions  |wc -l"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertEqual(output, '2')
-- 
2.1.4


