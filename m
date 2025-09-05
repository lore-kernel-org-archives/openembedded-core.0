Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7517FCA1016
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:42:24 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.134.1757090540365918705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Tghw7NMo;
 spf=pass (domain: underview.tech, ip: 209.85.219.45, mailfrom: vince@underview.tech)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-726549f8161so21108146d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1757090539; x=1757695339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvG99qTrAmjSaLoPwqOTPkdhf+GS6D//ePb0cA3Nblk=;
        b=Tghw7NMoPSc8fH6mTLLNUNb9fUK935GoQfQ+MoRrL8r7wIHbQapmoZeiY8OqLIttgQ
         1nvcLGwayLYrleq6Gc8eimCIQh5taFrQy6/PBcyeBA6MtWQiaVUy/+62TVqwzxAyCD/+
         I8qAvmjnSfdiR2WP7pkuH9zcRi+OuNOFtrxPGYzrpbZi3Dk3JImEspfAjxPGTJ3iAcVy
         X72j42yB/U/t7XLXDsPvQIggF7l5y8jxO+RqE/lqS4R4NUah7uTfEyyoRiw8mlxw+SdY
         FKJABViuQJewR8hZd0aqqWlpw5G70QkUfoOKU02DdPRWNDZVhG0OQAqQNDskIrrLkM/a
         P8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090539; x=1757695339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvG99qTrAmjSaLoPwqOTPkdhf+GS6D//ePb0cA3Nblk=;
        b=aAnjxC0E7Wbf+CTmAxr8nXT96x0LJTs1cZcrhJnc6y5hfpBL3esDijuvoev8zRLIjI
         eNSIC7IXwIobIFu3YtMLtOo2yVuldRuxlhaEFpMHsktYuILo2L7+GUWG0UuXSgymfbFe
         SKJqFU6rX+ivgIc+swaQuXetuK/hPAulaP0pvJaTuvuk/rKhdR60kTNB5fJlDzmZqyPL
         6Pf1q8sXDH9ZJ1/XvKlVUI/ht9pnY53sDHzMF/qeUklGpflS3+6A1Ns45pzKXXFoOfjJ
         i3wyRmi24ur96XHXLlgfeHFiVmA3Bc9XIdc7OWQsY6I8U+/qOBuG0KH5WY1R7tfecdoL
         aOYQ==
X-Gm-Message-State: AOJu0YyE70Dn47f5rwxx+P/0bPpPL54lPTcvqe4/yRLNcxtuQyMnfDMS
	vc0uL+m4genewU3f7c2NDuNbAmdid77k6KSxWqL0CuG2N6Mr/GSxZgebkEMbxeoqX1cm9dDShQm
	SVJOH
X-Gm-Gg: ASbGncswYOf+TUBI4NtcVv+qpPFMkS5kdt2axkMIFdGKeFlvgI91G8rZEKWepTaouM6
	PpnWOaRqEV/S3fb/XjbvtYiVKv6wDXbK05UQsmi8UklaNGF/b0ws7gkENZTEkNVLXS+PxOpsGcQ
	kx/8xpJqcvT9JfsUlZqpFg3i53V6Fll8pZ+wtjg3YgvjZPXDz2rDAqZeOk8zo5KkAcWbQiRPGNh
	TSYIhohFUTeHjZfwJE0nat4gk21COV8Q1Zg0Q5NQOSfobRM6I8qdM3NelQZV549M1o5iTYIxM3N
	sOs3azf37kFR69/7d+WHOZYK2vTGd7N9YoncI2KoT8Lzf2WgDzDeiaUI8IqsU/JdJP9p3o1WfDn
	l2jOQpNe5DnBxR8pIdPQ7uDNCyL/nqlVc
X-Google-Smtp-Source: AGHT+IF5sAkdhkVI8L67oUAWVhZPmLgw7j6bm2XoLnFq0e/G7MdVwQmA/bbm8m1L8JxhgOVjWUF9NA==
X-Received: by 2002:a05:6214:1c82:b0:709:b92d:e84 with SMTP id 6a1803df08f44-70fac75c92amr272095676d6.16.1757090538690;
        Fri, 05 Sep 2025 09:42:18 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::d1ea])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-727b2c047dcsm39595046d6.59.2025.09.05.09.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:18 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v3 7/8] oe-selftest[wic]: add test_grub_install_biosplusefi
Date: Fri,  5 Sep 2025 12:41:35 -0400
Message-ID: <20250905164136.2896809-7-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250905164136.2896809-1-vince@underview.tech>
References: <20250905164136.2896809-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223023

Commit adds test to check if required files
are found in the EFI directory and that
grub modules for both EFI and BIOS are found
on the same partition as the grub config.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/lib/oeqa/selftest/cases/wic.py | 54 +++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 44442e402d..10c3497519 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1456,6 +1456,60 @@ run_wic_cmd() {
             out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
             self.assertEqual(1, len(out))
 
+    @skipIfNotArch(['x86_64'])
+    def test_grub_install_biosplusefi(self):
+        """
+        Test the installation of the grub in hybrid boot mode.
+        """
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
+                'bootloader --ptable gpt --source bootimg_biosplusefi\n'
+            )
+            wks.flush()
+
+            img = "core-image-minimal"
+            config = 'DEPENDS:pn-%s += "grub-native grub grub-efi"' % (img)
+
+            self.append_config(config)
+            bitbake(img)
+            self.remove_config(config)
+
+            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            runCmd(cmd)
+
+            wksname = os.path.splitext(os.path.basename(wks.name))[0]
+            out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
+            self.assertEqual(1, len(out))
+
+            sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+
+            # Check if grub UEFI application (core.img) installed
+            result = runCmd("wic ls %s:2/EFI/BOOT -n %s" % (out[0], sysroot))
+            self.assertIn('bootx64', result.output)
+
+            # Check if grub.cfg is installed
+            result = runCmd("wic ls %s:3/boot/grub -n %s" % (out[0], sysroot))
+            self.assertIn('grub', result.output)
+
+            # Check if normal.mod is installed
+            result = runCmd("wic ls %s:3/boot/grub/i386-pc -n %s" % (out[0], sysroot))
+            self.assertIn('normal', result.output)
+
+            # Check if normal.mod is installed
+            result = runCmd("wic ls %s:3/boot/grub/x86_64-efi -n %s" % (out[0], sysroot))
+            self.assertIn('normal', result.output)
+
     @skipIfNotArch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_uefi_kernel(self):
         """ Test uefi-kernel in wic """
-- 
2.43.0


