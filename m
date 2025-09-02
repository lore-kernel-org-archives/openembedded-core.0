Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4856CCA1002
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 01:58:54 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.68017.1756778326055898404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 18:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=KwcIE3kR;
 spf=pass (domain: underview.tech, ip: 209.85.219.41, mailfrom: vince@underview.tech)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7193fc78bc3so13448626d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756778325; x=1757383125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAr2jUuf31unGa7pEo72YuJRETTe006dI512TTExHKs=;
        b=KwcIE3kRNIeNSZo839OK2LWUCoWRQGeSXSjjvHSzGsxAeCz9doMvKbuy7XR46WqEjS
         PGze5kgon0I6XUO0ZTEbrtMn6P92KDWuAVf66wVpICZ+aEZX4Yfj+33Kb4sUkQ20cSgB
         2Fl7GnyvdRThlxKYOCrU+SYIRJsAzdfU+1E0gRG0LMZ8hXDhY81P/LUSnfJ0PtAMEwlR
         t5/OLksQyr07sI7M3xp4d3fzKWRI13eghcjzIZCvawY+Ut9YuZIiolHlZqOi6mXiFH44
         BUnJq3xar1fCNqkpBrBhIsEbCNTfgh2ZqsGnZDAhyoR3vjAFtrJstrUIMDhtQQ0loCDq
         PwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756778325; x=1757383125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAr2jUuf31unGa7pEo72YuJRETTe006dI512TTExHKs=;
        b=YWie3n0WMd6ySK0EbJpzLsYL+vz5w8Z/+MsI3qrajL0NXgCu5TSEYRtOMVF/aWEqfo
         oAgRoN+U+n4CCobmU16WcUBmr+XJ7lP/c/2qbiEMltWmw39js1N6dxB8LX9pxswhggmM
         zyZmEZwog5tJbUw0fFAurExYKL9fvh7ZEYWuh50cAkMA4+vPJ5TWfmjcQK0SM0Dhs+vb
         LDUcpNKR7wlKcxIQuPDAqtbQu+IGsEhu/OxAqp8OUyy5CqmaQIjd3afJH9/xiXQzFryG
         PZcwpEtG5Gh+VaR0MkrFq2HgkxsvthBzcjrsnHdBPgjZPKH85+EHixXwcxMDJ+2vqfYg
         2mkg==
X-Gm-Message-State: AOJu0YxmScKGTjvHGGKJD2ro3xTccrm/uMZ3aTEDNJMa6MgkyGNZ77mn
	s39Y1+XvW6ox7sUD8MKd/pumbJZDbe1RE9JkXGmBj6+B2mkAIemV3bQ6cW89HLxLW/rrUzuGJJL
	QSFknZc0=
X-Gm-Gg: ASbGnctsdZ7Lu0e8ZiaEMZDoyRTLNS92Xx9wSD2QX1SyRW63pvDeX9UEmBZFwHHMj1N
	goBHtnsFbq+e2iq0zMJGuQeA/j93Nh1kwstuWB8wTf8i7PuMpOxUsoz2whI1kZLdv2Sbd/PFO3T
	1jd3rYgKt8uKiXZZ5rgQLMmaFGtZXQ+W4lZarahnXfyQPQ8NbP7pYRSFMRxOl/E1jgVhbzR6y2p
	/5sCO2EawRHklvCuajrlf5G/sBqSVUy+DlY6edo/ces9QMQCWvBM/k40bXPeGwA2uKiDVauqg8s
	hqtouGlp1YsZMr4ZKSoFNPQ3OKvSysuv/othg/4iHgvu8VOuCLRIHYcjtLpvjid43mnFjGRgVDK
	q/hdkMvrpXsiB97uJONG9sg==
X-Google-Smtp-Source: AGHT+IE7i7DhfJfmgrRTmjeXSphr/7E6WrCmbPHgF4N6mpkwZFOZKdl/uwAwzXBXu3bn60lQjZ18vA==
X-Received: by 2002:a05:6214:76b:b0:70f:a874:9838 with SMTP id 6a1803df08f44-70fac544bc6mr100819686d6.0.1756778324532;
        Mon, 01 Sep 2025 18:58:44 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::7efe])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720a30b79aesm4284666d6.0.2025.09.01.18.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 18:58:44 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 7/7] oe-selftest[wic]: add test_grub_install_biosplusefi_qemu
Date: Mon,  1 Sep 2025 21:58:25 -0400
Message-ID: <20250902015825.2785789-7-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902015825.2785789-1-vince@underview.tech>
References: <20250902015825.2785789-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222689

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


