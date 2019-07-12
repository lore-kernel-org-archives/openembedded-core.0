Return-Path: <wbourque@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id D40757F14E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 14:00:41 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k10so8189370qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nsGekoMkaaKMTxsJsdg8iRwMc5vVin8rKy8Fsb0GhMU=;
	b=dWLVzePyL/3RmLFnUn92Ef7JFNEmtedPkpd7LuJOGpH5ivzZsL/HjiVdTrWahJM+ku
	GOb5kqMOoV+a9B/EPxIMdpuQn6QhtXUaKBYf9FZth2R4wz3LM4zz50PhQDAx8Dlkme9c
	wq9EHzH0ovQgJ4Mn67kNY28UFgSHcLaw5Wd9ypTYiqFsLYUIAa0iUb/4B8Hj8VYEMDT1
	3+jdEVOGNtufKhNoXqqh+sTjpKYSz3i6MiaSc5y6sQZa9pPYUQcEpSnVce42RTNtt+yv
	ofJ/fQUnvMnfsW1u+nH7DFKTJHmvLKnaj1FEkbdf4Mw2vzVCwPH6B4m/Mnxm5mPvVBhX
	QBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nsGekoMkaaKMTxsJsdg8iRwMc5vVin8rKy8Fsb0GhMU=;
	b=SmgLSXu/4IjdYC0/ueVpH1TaliZrISsepm3JnPX60eg6mi3h4PA5gfhSESNVpdfmyC
	2hVgW2AFbfz16zKfC/vmAfgt72HdHjoX3lm2ywpzglBRVZqHxP70UpHxF6y5bAkmHSLc
	kKKPBn7Ssyn4yfrd6UGqFg6JaGXpT+MocnxiG1OKkxo4m5Spp5MV2dWhlmmczem49zLc
	jKeA9xKXvX7c3jkqHOy+46wbmtMmLetQodFEjQgOE4YIR/XPUljdf+VhWbKmrrCS6Abc
	H4zz0r1eHLYbEK5MTGcxLSJDxhi7d3tG5SxMKXeF2InUODSMJS36KZuMX4WvW9ADyRIU
	DuWA==
X-Gm-Message-State: APjAAAX9nOKfj728WPHIVAhiySDQoupMCp0DLB3c8mhWdUgEoOUBJxPU
	/m7N3I8XSAPvjTNo6egtDiDtvhfU
X-Google-Smtp-Source: APXvYqwA1ME7syynAP9+d+6rTmG+y4ncDjTexrJ+DtPhDRhbcYmL7afsp+rW5HmcwMb3hXaUGFfiXw==
X-Received: by 2002:a0c:c3c7:: with SMTP id p7mr6692269qvi.125.1562940042606; 
	Fri, 12 Jul 2019 07:00:42 -0700 (PDT)
Received: from dingo.touchtunes.com (vcmtl.touchtunes.com. [207.96.182.162])
	by smtp.gmail.com with ESMTPSA id
	u16sm4201733qte.32.2019.07.12.07.00.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 07:00:42 -0700 (PDT)
From: William Bourque <wbourque@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 10:00:20 -0400
Message-Id: <20190712140020.28280-2-wbourque@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190712140020.28280-1-wbourque@gmail.com>
References: <20190712140020.28280-1-wbourque@gmail.com>
Subject: [PATCH v2 2/2] meta/lib/oeqa: Test for bootimg-biosplusefi Source
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
X-List-Received-Date: Fri, 12 Jul 2019 14:00:42 -0000

Add unittests for bootimg-biosplusefi SourcePlugin in wic module.
First test check wic creation works correctly.
Second test uses qemu to boot image and checks that it has both
EFI and BIOS files in a single partition.

Signed-off-by: William Bourque <wbourque@gmail.com>
---
 meta-selftest/wic/test_biosplusefi_plugin.wks |  6 +++
 meta/lib/oeqa/selftest/cases/wic.py           | 47 +++++++++++++++++++
 2 files changed, 53 insertions(+)
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
index f1c6f390c5..149edee43d 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -680,6 +680,53 @@ class Wic2(WicTestCase):
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
+            cmd = "fdisk -l /dev/sda | grep /dev/sda1 | awk {print'$2'}"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertEqual(output, '*')
+
+    @only_for_arch(['i586', 'i686', 'x86_64'])
+    def test_biosplusefi_plugin(self):
+        """Test biosplusefi plugin"""
+        img = 'core-image-minimal'
+        machine = get_bb_var('MACHINE', img)
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


