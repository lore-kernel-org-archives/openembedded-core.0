Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6522BCA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 02:15:54 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.68040.1756779348424562196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 19:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=DBNr2kL2;
 spf=pass (domain: underview.tech, ip: 209.85.219.41, mailfrom: vince@underview.tech)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70dfcc589a6so47438636d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 19:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756779347; x=1757384147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7CPHW3JXcdF9dRYPIqs2+3tTx4vMiG7jO4JsaD66AQ=;
        b=DBNr2kL2Ufl5W4AbM7DwybWDdfBBo6WtH01Ch2Dkl+7nxHdYo301ZBBwWlJJFfFdtv
         2V/BAt3zsmjao3tvmzcEiUa1E/I1p/XYkSTeNtCz4jQGg/Ncjum05lHgiRxtoksDzORo
         HFZq4fel+y2Tf+aZ8KMEB8N7ZHlZ4xO3deuF/Zp9O68Aqw3Kx+U9AtGLw1xQ34WdUmWb
         gY9ttRJylp7clfB+FkYma8TqjvZpl/IppdAgzkln+Nl3WZmPnuOEsvXwOn9pVVVL64lZ
         TULeWYkcGZ2/bHzwnSucnealqma4zd0jCJxeF3gb7NFC+bXs70o2JZUnIazrrpaX85cW
         hF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779347; x=1757384147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7CPHW3JXcdF9dRYPIqs2+3tTx4vMiG7jO4JsaD66AQ=;
        b=culEYzWnc0Bj+CWrgW25mVsySO4tbWFS9F6M7LRmVgfQyVKqDfPWZfjRlZFXcXcBqs
         AXkwWCmmD4BO8QmLhrW0QcyuNC2Pks9O2B0sn4ZKXMTZI8nuTm+S3EKOCxCmCO7+UAvE
         693loz1oqPYNzjJBjxY+s6g8S3WGzOlpW/ueM3qlHPjuFQhgT4CM4nK/amL0Hjix3W9q
         RvFS1kPkO0eXexB1ViA6APvbPf05ulTqK70SBFxmBV4SK2Y9nE1NPl9Jma/7YOXcT2JS
         R4TZQ6OuwQmEHNC+gs4CxzQPi1SARtStHGwt9UhDNUDgIQbtvMlf0QXy8onnFDJxmrwB
         IZ8A==
X-Gm-Message-State: AOJu0YwnRAEYdD7/WwhFCiryiFUoH+5iR79bEtwiMCyv7L+pnu6nt21E
	VNRNRWgkx0rNyS85dZ5Z2zPJcqlXclLHeljlCVOcdgb7RGhBfgIuZjWtIeD2GJUTj06WnnHgDlp
	ymcOJvMo=
X-Gm-Gg: ASbGnctMTC7FkYjvANSSt1yG5XhqygIR3rcUPrtu6rKw4adRMuxMKo1zDNS1aBAF9Hb
	Nj+twy9KuJgSYEToOHN8fYc95xtTwFT9i5+3cfMxhKKRMTKzfsQToBufRuANCXta+iwNge2WjON
	wHoOFF7QG2OmvYtsIWS5pXGNaGGjH0N210UNN61gNNVJfSECbPGwM1IRGwH7urT8BFH6/jpKyVu
	3+Iy+W5MxLj9+b5A4rPMV5CtR416FODGg/RjIXJpjrTBz0zeUZ8unbdZ5Or7kUGF8Uhc+StINrC
	RDU98Wi5bL+75Xj0vJaL/SXOKKXRUf9KvtUFWQO9qK0XU9RZ0sRI9Lln58ocWmm+PLCUHmvW37P
	YKCp7e4GxLS6h5aM3vEUOhv+EuFOCcFfmghCKetwSClEblw==
X-Google-Smtp-Source: AGHT+IEYzNSFU/3DjW285wSat8DbfGzVFtMN0bUBeA+d/VmrOUpa9wh14Hv1M3M48kKWLMekN/1TGQ==
X-Received: by 2002:a05:6214:e4c:b0:71f:238c:1494 with SMTP id 6a1803df08f44-71f238c1737mr24872116d6.20.1756779346728;
        Mon, 01 Sep 2025 19:15:46 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:90ff:fb15:d573:4b27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b55cf6c9sm4194436d6.49.2025.09.01.19.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:15:46 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v2 7/7] oe-selftest[wic]: add test_grub_install_biosplusefi_qemu
Date: Mon,  1 Sep 2025 22:15:23 -0400
Message-Id: <20250902021523.25780-7-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902021523.25780-1-vince@underview.tech>
References: <20250902021523.25780-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222698

Test runs qemu given wic file and checks to
see if the resulting wic image boots with either
legacy bios or newer UEFI frimware whilst grub
is the primary bootloader.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/lib/oeqa/selftest/cases/wic.py | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 10c3497519..efd1f5e6f0 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1510,6 +1510,67 @@ run_wic_cmd() {
             result = runCmd("wic ls %s:3/boot/grub/x86_64-efi -n %s" % (out[0], sysroot))
             self.assertIn('normal', result.output)
 
+    @skipIfNotArch(['x86_64'])
+    @OETestTag("runqemu")
+    def test_grub_install_biosplusefi_qemu(self):
+        """Test biosplusefi plugin grub only in qemu"""
+
+        img = "core-image-minimal"
+
+        # create a temporary file for the WKS content
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.write(
+                'part bios_boot --label bios_boot --fstype none --offset 1024 --fixed-size 1M ' \
+                '--part-type 21686148-6449-6E6F-744E-656564454649 --source bootimg_biosplusefi ' \
+                '--sourceparams="loader=grub-efi,loader-bios=grub,install-kernel-into-boot-dir=false"\n' \
+                'part efi_system --label efi_system --fstype vfat --fixed-size 48M ' \
+                '--part-type C12A7328-F81F-11D2-BA4B-00A0C93EC93B --source bootimg_biosplusefi ' \
+                '--sourceparams="loader=grub-efi,loader-bios=grub,install-kernel-into-boot-dir=false"\n' \
+                'part grub_data --label grub_data --fstype ext4 --fixed-size 78M ' \
+                '--part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4 --source bootimg_biosplusefi ' \
+                '--sourceparams="loader=grub-efi,loader-bios=grub,install-kernel-into-boot-dir=false"\n' \
+                'part roots --label rootfs --fstype ext4 --source rootfs ' \
+                '--part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4\n' \
+                'bootloader --timeout=1 --ptable gpt --source bootimg_biosplusefi\n'
+            )
+            wks.flush()
+
+            config = 'DEPENDS:pn-%s += "grub-native grub grub-efi ovmf"\n' % (img)
+            config += 'IMAGE_FSTYPES:pn-%s += "wic"\n' % (img)
+            #config += 'MACHINE_FEATURES:append = " efi"\n'
+            config += 'IMAGE_CLASSES += "qemuboot"\n'
+            config += 'WKS_FILE = "%s"\n' % (os.path.basename(wks.name))
+            config += 'WKS_SEARCH_PATH = "%s"\n' % (os.path.dirname(wks.name))
+
+            self.append_config(config)
+            bitbake(img)
+            self.remove_config(config)
+
+            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            runCmd(cmd)
+
+            # Test legacy bios boot
+            runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', img) or ""
+            with runqemu(img, ssh=False, runqemuparams='%s nographic' % (runqemu_params),
+                         image_fstype='wic') as qemu:
+                # Check that we have all four /dev/sda* partitions (/boot and /)
+                cmd = "grep sda. /proc/partitions | wc -l"
+                status, output = qemu.run_serial(cmd)
+                self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+                self.assertEqual(output, '4')
+
+            # Test UEFI boot
+            # Can't test as it requires swapping the grub-efi*.bb
+            # embedded grub config. With one that works in the
+            # hybrid boot case.
+            #with runqemu(img, ssh=False, runqemuparams='%s ovmf nographic' % (runqemu_params),
+            #             image_fstype='wic') as qemu:
+            # Check that we have all four /dev/sda* partitions (/boot and /)
+            #    cmd = "grep sda. /proc/partitions | wc -l"
+            #    status, output = qemu.run_serial(cmd)
+            #    self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            #    self.assertEqual(output, '4')
+
     @skipIfNotArch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_uefi_kernel(self):
         """ Test uefi-kernel in wic """
-- 
2.34.1


