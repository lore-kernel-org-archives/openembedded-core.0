Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFD1CA1009
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 02:15:54 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.68039.1756779346903421781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 19:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=hMB4XA5d;
 spf=pass (domain: underview.tech, ip: 209.85.160.176, mailfrom: vince@underview.tech)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b30f73cb05so31092681cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 19:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756779345; x=1757384145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SonSS2ppfzgvWFpciZIOW9nhTW/Rqyk0ZKkN0GkrIys=;
        b=hMB4XA5dWNA5Fb9foZQsd+wotIeUB2pJy9FsLOi2fkddLMszoxMAi+qT5mTwcfwMaq
         w5THJP0jtarEVHhRebx5WmRG63uR8luOq6w+sF/IWM/CV+yMJQZpE6koht7bLv8P8Vkl
         OuomkGEIgaACo4jiAjLXXJeSgjQ0G4EQ9H44u4Xq2RqMHaEaL/VnTdTMYUfWrKGi/8z8
         MX1nheGow6UbCVLUyc+SmXF/0sRkzuM0g44Zz9CNu47YWMI2NdA2Y5At2MCWvxbDf0DO
         +0Wo0OnNdwbjzUjkaDWQg26DKzGdsb0Q5bvvRflgChXdRlsvgztlLSKBCQ15q0hz1+6T
         zkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779345; x=1757384145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SonSS2ppfzgvWFpciZIOW9nhTW/Rqyk0ZKkN0GkrIys=;
        b=UifLDAMqUt7reBUeUht751/EqqUY0Wvn1ZpfTuBYvg+clJ5Kk5RYzmZC+41UidpMP5
         Ma9NFXuG2WrMQrIKE7YElFTvRUz9eq3T5REGMtWj4Zp8ORX62K6dycNc9ejddj6K3Nfl
         yVfnunRE+2wd88L2SniGRHCEa+InwHFZhK+x+6qr+9v6d2Se4mJJQhJEu0ZByxZk8KTN
         hmwk0bzn2uA3Oy30ljx+Hy4okXSJBwlHaP6KI4cMjd8fmv2q9ao8a9zE5D02DVuryROw
         G6U0oIFt+64fhGWYqh9IGYN+OVXrK4NkTryMmjA2WW5894ByaCLQfgJRYMxj8Vj9ZYV9
         FWWg==
X-Gm-Message-State: AOJu0YwOy7/UO3Xiu/DG0Ahi3ldsU4+325fCQzSv5L9H+lY3C6roJBu9
	HBj8vUqjJpx/JczMxlpYKX6hlYkr2tvmu4IfTew9b0+WdpXiv62dQIkYd1TRxo/v/8w5miSre5a
	uUiT7RxU=
X-Gm-Gg: ASbGncvc2+uwidsjCtlcX1li78v5XKe7EHT1RaW9kWVcf3WxROPfp8aME4fC8xHCrrW
	xr4QMlXB4orepMSYxwjXhCb1BgfZFOPyzL4ncDgLxg1onok8Auums/buQK471caDnlKVl6Yy06W
	aqO/tjiSQXiv8i6Y4QcV27TAazrNXkynmbxNhYbOjUohBiQNXlfYyBbgFMQG9Ao8PIJGtmWS2oL
	UY8w5NKx1nCLXPqGnmbSFXljEFTf0sCjAPrIm9RGQa35UCC6CQZELj237U2S1X226mKwtGaTo5r
	OEb7Evq/oZvldZiV+lz2oFsGinxlQ7OYEHVGrmXC95/1bmciflGFMJU2yNFmTjuEBWnszK0sqDp
	BMnCtaLaAul7vvoYJ9zPG41syx8idC7f6rbK03ex+YoNKiKiLg9PKFTij
X-Google-Smtp-Source: AGHT+IFDBbct7iYVRRjuyXKbHcZk/VFRw3QHDjY1o2xApzMSLin8NbZyfWKDKD5BuEhNUQMd13b7vA==
X-Received: by 2002:a05:6214:1c82:b0:70d:f74a:8f5b with SMTP id 6a1803df08f44-70fac75fdb0mr95307106d6.20.1756779345439;
        Mon, 01 Sep 2025 19:15:45 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:90ff:fb15:d573:4b27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b55cf6c9sm4194436d6.49.2025.09.01.19.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:15:45 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v2 6/7] oe-selftest[wic]: add test_grub_install_biosplusefi
Date: Mon,  1 Sep 2025 22:15:22 -0400
Message-Id: <20250902021523.25780-6-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902021523.25780-1-vince@underview.tech>
References: <20250902021523.25780-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222697

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
2.34.1


