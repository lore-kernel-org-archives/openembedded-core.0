Return-Path: <wbourque@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4ACDE7ED36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 20:14:03 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id h28so27197829vsl.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Q/vQ02TQy5mpVAjkUqD/xz/IRo0ABYlsi3b1E9LVZDA=;
	b=R5/VK6NKVROuJFJTUEB0mAgCD5qNLlhbUkJ17rgExrKdq9ug/b9zm30Ic9txjqn3ST
	Qc9pd878kVJf85pUQdMUeBXUz0AMAJt/afmXl5SKPUVzq78DX89f+zsgNI/dYwtv9dNi
	BscmaAdNayY3pJqNVpFF4vsfRsEkqjSHaPi9P/6+1KY54I46TTgZgi/bTtae50C8NC8w
	I6ULx7yZYOalC7vyPpPLMNOh5eGYYucbcEC5WOLCeGu/dsdq+nPmogq3t4z0Cr9I/7m8
	mnetNF6rTO7DE0uuYau1nqQVhQ//LudvAJKi26UBz0XI2Db6lSI62XpUA/rIY1FAWVqj
	h3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Q/vQ02TQy5mpVAjkUqD/xz/IRo0ABYlsi3b1E9LVZDA=;
	b=fOtRW/KxcneYRZKDpM6Psc2Ew0BUTFX5GUtngqQiJ54zISIrO3JQYkk/SDb8V3xQzx
	k5HVDEaWK5ogl2yanSGruZgQ5ZNxRxiBt/xIqGaz95Bi5FVMFaZ3VvH4oElb7xRDTD7W
	QCu+LBEYhcoDzLAp6g8/Jnx9DKm3U9Tbvkr9MVc1qzzm+8N/vqUx+f13pJ29QZuCGmRT
	LRuNx5xsKI/CceiWYGNp3d0orV6z4SZ3ZBQzQJq4JtzrV6cEbdr00mUiiz2nUWvBsMyE
	0V4zqVRJV7jwvdCQiXaBUPSh7tdANDSN3VdPiNDQy4JM0iOEMvZ0bR6iQi0x1z20mLEr
	B1yg==
X-Gm-Message-State: APjAAAWVH2AqBJ2Pgqdkn7bjN8e+9+I5mLhmv3dC6PfeIdUExK08a7EB
	BNgPe9zAHF8xZkqLbWcIk2habp/f
X-Google-Smtp-Source: APXvYqwMUBYvCg2Bx2aE+6ipe1hYY+1uuUC1/Dzb1q51STfukthIY2LYmBqHZSDe2H90Im14yaVsMA==
X-Received: by 2002:a67:e90c:: with SMTP id c12mr745269vso.97.1563826444023;
	Mon, 22 Jul 2019 13:14:04 -0700 (PDT)
Received: from dingo.touchtunes.com (vcmtl.touchtunes.com. [207.96.182.162])
	by smtp.gmail.com with ESMTPSA id
	w187sm11409440vkb.4.2019.07.22.13.14.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 13:14:03 -0700 (PDT)
From: William Bourque <wbourque@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 16:13:54 -0400
Message-Id: <20190722201354.13803-2-wbourque@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [[PATCH V3 2/2] meta/lib/oeqa: Test for bootimg-biosplusefi Source
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
X-List-Received-Date: Mon, 22 Jul 2019 20:14:03 -0000

Add unittests for bootimg-biosplusefi SourcePlugin in wic module.
First test check wic creation works correctly.
Second test uses qemu to boot image and checks that it has both
EFI and BIOS files in a single partition.

Signed-off-by: William Bourque <wbourque@gmail.com>
---
 meta-selftest/wic/test_biosplusefi_plugin.wks |  6 ++
 meta/lib/oeqa/selftest/cases/wic.py           | 59 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-selftest/wic/test_biosplusefi_plugin.wks

diff --git a/meta-selftest/wic/test_biosplusefi_plugin.wks b/meta-selftest/wic/test_biosplusefi_plugin.wks
new file mode 100644
index 0000000000..5a56c84518
--- /dev/null
+++ b/meta-selftest/wic/test_biosplusefi_plugin.wks
@@ -0,0 +1,6 @@
+# short-description: This file is used in oe-selftest wic module to test biosplusefi plugin
+
+part /boot --source bootimg-biosplusefi --sourceparams="loader=grub-efi" --active --align 1024 --use-uuid
+part / --source rootfs --fstype=ext4 --align 1024 --use-uuid
+
+bootloader  --timeout=0 --append="console=ttyS0,115200n8"
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index c390749401..928c476ebc 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -681,6 +681,65 @@ class Wic2(WicTestCase):
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
 
+    @only_for_arch(['i586', 'i686', 'x86_64'])
+    def test_biosplusefi_plugin_qemu(self):
+        """Test biosplusefi plugin in qemu"""
+        for fstype in ("ext4", "wic"):
+            config = 'IMAGE_FSTYPES = "%s"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES_append = " efi"\n' % fstype
+            self.append_config(config)
+            self.assertEqual(0, bitbake('core-image-minimal').status)
+            self.remove_config(config)
+
+        with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
+            # Check that we have ONLY two /dev/sda* partitions (/boot and /)
+            cmd = "grep sda. /proc/partitions | wc -l"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertEqual(output, '2')
+            # Check that /dev/sda1 is /boot and that either /dev/root OR /dev/sda2 is /
+            cmd = "mount | grep '^/dev/' | cut -f1,3 -d ' ' | egrep -c -e '/dev/sda1 /boot' -e '/dev/root /|/dev/sda2 /'"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertEqual(output, '2')
+            # Check that /boot has EFI bootx64.efi (required for EFI)
+            cmd = "ls /boot/EFI/BOOT/bootx64.efi | wc -l"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertEqual(output, '1')
+            # Check that "BOOTABLE" flag is set on boot partition (required for PC-Bios)
+            # Trailing "cat" seems to be required; otherwise run_serial() sends back echo of the input command
+            cmd = "fdisk -l /dev/sda | grep /dev/sda1 | awk {print'$2'} | cat"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertEqual(output, '*')
+
+    @only_for_arch(['i586', 'i686', 'x86_64'])
+    def test_biosplusefi_plugin(self):
+        """Test biosplusefi plugin"""
+        # Wic generation below may fail depending on the order of the unittests
+        # This is because bootimg-pcbios (that bootimg-biosplusefi uses) generate its MBR inside STAGING_DATADIR directory
+        #    which may or may not exists depending on what was built already
+        # If an image hasn't been built yet, directory ${STAGING_DATADIR}/syslinux won't exists and _get_bootimg_dir()
+        #   will raise with "Couldn't find correct bootimg_dir"
+        # The easiest way to work-around this issue is to make sure we already built an image here, hence the bitbake call
+        for fstype in ("ext4", "wic"):
+            config = 'IMAGE_FSTYPES = "%s"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES_append = " efi"\n' % fstype
+            self.append_config(config)
+            self.assertEqual(0, bitbake('core-image-minimal').status)
+            self.remove_config(config)
+
+        img = 'core-image-minimal'
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(['part /boot --active --source bootimg-biosplusefi --sourceparams="loader=grub-efi"\n',
+                            'part / --source rootfs --fstype=ext4 --align 1024 --use-uuid\n'\
+                            'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
+            wks.flush()
+            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            runCmd(cmd)
+            wksname = os.path.splitext(os.path.basename(wks.name))[0]
+            out = glob(self.resultdir + "%s-*.direct" % wksname)
+            self.assertEqual(1, len(out))
+
     def test_fs_types(self):
         """Test filesystem types for empty and not empty partitions"""
         img = 'core-image-minimal'
-- 
2.17.1


