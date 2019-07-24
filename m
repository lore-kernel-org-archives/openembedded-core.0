Return-Path: <wbourque@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id D63FF7F160
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 13:32:32 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 201so33704290qkm.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 06:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=alsUkOCG+JQr30l7moBbSk7MEQJs2VyT0Jm+484M9wo=;
	b=G62WmVkGowRJqFlOqHM7BZkLoPcDdw6d+j6xNavFnq9FuyIT09ca1QJz9PDIQVH/CA
	eP+XF9wfe9UFyVmu4f38/hFJIuEdcqGhR1GYcK3zm1byTyWLE07Mn4914X+wlYa4QTGN
	P4tpmZZ/4QCzyeIDUJV3CG8Rcm4ilcirP7ROR5eb1OjGnYz0IPyp8Ss0D7mJcW4APWGI
	SR2ln+LfAGMsha3zsjgi4icWCVoKmyDNkW+/RIX/FqINCVt44mqDjGcq150CKw93asCK
	d3AkPz1lHSXuU7w8t6wmczQXwIFal3WS3oIgXEbQrO7b08K8O9D+iSorroocqtComR43
	tAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=alsUkOCG+JQr30l7moBbSk7MEQJs2VyT0Jm+484M9wo=;
	b=Ahg2nFpHapHwHa8YuVBZ5j2o0DGZHyxlisEHAJuinjKL3I3EZgTRIrxAyef7bdVWs5
	KUix7jE6L8nZO501aWCcVsfy8xj1Y4RQ3fP5XD/N+6RcL45ycxEYUA6HIrd+aOa0sySO
	ebvKz6gqc3HuCTXA4TtH0/HAwBte8L8mVOn+8SvX8QQDpermRhZ1ZQ+MRivND/tX8e2J
	gfuyv+0Oeviwmdqc3JlhD/kpvvr9t/7DAi9hYRiT3sfiX6Ow7QT+LUT1a6ZgN61Eq5Bg
	GFMTHiEBo89I6AVoy56KoxalJX3Cd/enVNpMl66U0nySrQMRCGbrt1uKw6abf1Q2+3Z3
	u+FA==
X-Gm-Message-State: APjAAAVBGBkcODsoaqW5uBHnr7QeThtaMHOQZrs0Rs1fvf1abFWS4CBf
	ZKThc247Qi6my0RkwD2AfTuRWsvwKHI=
X-Google-Smtp-Source: APXvYqy6t2oFgrW9OBLT4UahwXiy3rFYXY63R/2qO6xIT4WkJ2785mp6feNIE14+BocnKFwIckXnpg==
X-Received: by 2002:a37:2d86:: with SMTP id
	t128mr55089965qkh.429.1563975153473; 
	Wed, 24 Jul 2019 06:32:33 -0700 (PDT)
Received: from dingo.touchtunes.com (vcmtl.touchtunes.com. [207.96.182.162])
	by smtp.gmail.com with ESMTPSA id
	z50sm24637232qtz.36.2019.07.24.06.32.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 06:32:33 -0700 (PDT)
From: William Bourque <wbourque@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2019 09:32:05 -0400
Message-Id: <20190724133205.31296-2-wbourque@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190724133205.31296-1-wbourque@gmail.com>
References: <20190724133205.31296-1-wbourque@gmail.com>
Subject: [PATCH V4 2/2] meta/lib/oeqa: Test for bootimg-biosplusefi Source
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
X-List-Received-Date: Wed, 24 Jul 2019 13:32:33 -0000

Add unittests for bootimg-biosplusefi SourcePlugin in wic module.
First test check wic creation works correctly.
Second test uses qemu to boot image and checks that it has both
EFI and BIOS files in a single partition.

Signed-off-by: William Bourque <wbourque@gmail.com>
---
 meta-selftest/wic/test_biosplusefi_plugin.wks |  6 ++
 meta/lib/oeqa/selftest/cases/wic.py           | 57 +++++++++++++++++++
 2 files changed, 63 insertions(+)
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
index c390749401..fcdd55059d 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -681,6 +681,63 @@ class Wic2(WicTestCase):
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
 
+    @only_for_arch(['i586', 'i686', 'x86_64'])
+    def test_biosplusefi_plugin_qemu(self):
+        """Test biosplusefi plugin in qemu"""
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES_append = " efi"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
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
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES_append = " efi"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
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


