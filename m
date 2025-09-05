Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82303CAC580
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:42:24 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.135.1757090541298289336
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=ABi7nITJ;
 spf=pass (domain: underview.tech, ip: 209.85.219.43, mailfrom: vince@underview.tech)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-72816012c5cso19711806d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1757090540; x=1757695340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAr2jUuf31unGa7pEo72YuJRETTe006dI512TTExHKs=;
        b=ABi7nITJR4PowQaZo7fX5DyWimOHehcZT7XopRMr+whnqcSO9Lvn1eo2J1J1OcoA9i
         Mtz5iD1TkAQUViWEpNKqcE2q6tpiOI3yqcelUzH7Tjc5I6HUCyEILA08OYjMaRgXfT3n
         ZKp9UNz4B5744cGu++8FQNTtTD4Bt9lQXPF5vWwybxDIADSWNGbXTBXFTJ14vv4UqWzv
         4srGNafGUaZdYpGhBflX3tRtwGh07VgSqtTHzXmnd0tR7tXOHwT/he/7FQuIGu7DJril
         LZGMyr032bCvr5jlYiROE3BpxG0Kk3/x+DBTdGTGKUZeFb0gQx7Zy8yP8nna0UrgNaGS
         vsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090540; x=1757695340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAr2jUuf31unGa7pEo72YuJRETTe006dI512TTExHKs=;
        b=FhQDiOapp2N7YmKCDCMt8j/M7QXRkIMQnLReKoUjaPyaGO6NyBEwoPAzaKZ944JrFH
         dXmIDQ9i7vJYaTJnhaoVt68Mgfmg6mGcKfPXofAU5KxnPhXl2YTebWah2Op8vDDIpEvh
         Ub/9F4aJYDLD9lpzmoa71q7Rvv0yz5tHjSU5uuxTxjrVrST425QDC+TH3b2EEr586Anu
         qw06yKDK1lsFC8cXr2FnGYDS4wcI+VvfYWS2g4hK8Oo6gm2KbarYC5H9HMbu+tN4obS2
         XbrM701YoaobB8YallF0TTTtUF/EjpxuY3zDrxUx1MxyOG5uWHvqUSh5PnpZZ5wZSyGU
         FEdQ==
X-Gm-Message-State: AOJu0YxQwg014VevUUzsY346tbZb1ld6ZoxSgkmhlvG1JDqcpV3ScTd1
	+may6K4KX/URxz6Bx8j5/7DNxZ4iiZ+wvQhoBhHVz7qlomNAYch+1iqL7q60oeOl3FkMWaIfi1h
	lrd0+
X-Gm-Gg: ASbGncvxISwF06NvN1qIjXYhmQusU8q/BFlmPibiTygbgRg+qk3zMRA7WvNstsmsBoq
	BEyaU8QfL6+kDtl96wt2UbCJadYhJuwMHwTOxRU4X3R69YpEeDbi0KtjuXQxVPVQEebd8LoLC0N
	LolMtVdPnlBJa7vPCO0dKOzJxYBN8ncB538SHAv22ZWLiJ/c+HaQl8vxiOQLlBMvNs3mlZl1XgR
	tmtnT1CznbkF7R52KXh5KAO8FlJkMu7k6aU1iyDOEwgLT9vqO1/rIzs7dOA6mbWp052awF4Ihie
	JLLdYQ+7G/D4eyVpR0SccyHJgudo0INYWLalxgozhKM/hkMOqj177v1vTBZp4/+AIS3kJC+ZalF
	4jU6SEczSuoQFy1DBtGsKjxn+4VaKUOhV
X-Google-Smtp-Source: AGHT+IEO5U47UZ9zJhBnGyK1R7dY8XczRhoxEcIH/QYHZy0eqHSCNsdVgcm/JYp7zOxW0TJa7YaXfQ==
X-Received: by 2002:a05:6214:f6b:b0:728:7d77:63ba with SMTP id 6a1803df08f44-7287d7769b8mr68698326d6.33.1757090539585;
        Fri, 05 Sep 2025 09:42:19 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::d1ea])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-727b2c047dcsm39595046d6.59.2025.09.05.09.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:19 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v3 8/8] oe-selftest[wic]: add test_grub_install_biosplusefi_qemu
Date: Fri,  5 Sep 2025 12:41:36 -0400
Message-ID: <20250905164136.2896809-8-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250905164136.2896809-1-vince@underview.tech>
References: <20250905164136.2896809-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223024

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
2.43.0


