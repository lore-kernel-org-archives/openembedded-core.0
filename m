Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941E3C87FCE
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 01:47:39 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.33808.1753494456093634311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 18:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=AvepEo+n;
 spf=pass (domain: underview.tech, ip: 209.85.160.180, mailfrom: vince@underview.tech)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab81d0169cso34422211cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1753494455; x=1754099255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2lkqBC85P3/aUk6JATkdQzwcDuCajsC3XHAuaHUIM4=;
        b=AvepEo+nmiPrgO3mlv26pBbJTwFNzZBB3l20L7kfBV+Yj85PR0PDOZxd7PRMtk1cva
         8mkRxTdApB5pCcB9V3PiRLSjcQ+s608289Z4oLRVV+W0Ht9CjxkSeuvJ9qmOcRfG8EO0
         tiAkam2yGUGPqsBoPYT5VRKHlXDou2WuMz4yPE6uL8gj1zBvG8OFF3fkWVyefRRxpiYl
         krocJ/QdILxVHxleWHK7XjRF/G43pcwpkq23NIn4PJfwyTBSr4HQNRsaEDwtlAIjghpC
         p2VQFN6zCG/y6qR8VGH5R27bUgXcRLRIn7LUdYE6TqGHDVsXVEcVk0zGWx8LuKgqIMNY
         swRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753494455; x=1754099255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2lkqBC85P3/aUk6JATkdQzwcDuCajsC3XHAuaHUIM4=;
        b=DaaydMy+Hwb3qENXdqo2Hi1h8YILVZgpW3iEoU7hKYiQine0+/UI3KtX6HhxTPC1dJ
         NwifUWUIi0EcyLgdyhJGL65Ksv9PSV8GBLZhti+73PRP9ajaY8PGYwO5NpaSuY4RUED1
         rPjNJdPfB7zfVPcvkRivWTzhMnQlMmXW1wOWoIQc5CLNZGtZ2wfOh02QZaiVhI7nWRqn
         cHd60hWckzeonsTZ8kO4EAcYPjCgfBmWe7Y7lh9HnMcZcUTeWKLIfMnIiPvdmxG6FluU
         u7b0+C0/xCPm28eLTOr+Y7Fr4gVs6ukkWAzyvnCj9OPueuGrlO1o4J6MHUPdW6Fo/zPY
         EoWw==
X-Gm-Message-State: AOJu0YyD8DON52du/7ZT4XUWRekD2H23c41p3m40QVI4r/9vy6R2OKWs
	4u7lNiFCNjimL2f0Nvh2JJpfr2NDeKeqLqGwfdujo5TPRs9qlnCynEs3hW4oALHsqyg3vdYmS0o
	eB3ZL
X-Gm-Gg: ASbGncuuIokW9Ur3oSlSxsuWbqYPaMjzZmCncJIG6LEkqpZF9vZuIWzYyjBL4rEkyHv
	rsrs2Q/NiLE7EU5992nFVzEOjDvLGzLHaLP82ZRBh8bwTW3VzZbTsiNFpFFYs6wHUmRxvfOlE0o
	EIx8iy0Mlst11zGQ4cC8kMqCIwe7sthZEHUE9Jz+7EBrgNKnCatyQpJPKvG6yFZcHhmGkMxI9Rm
	bJ0BtcoJ1L6kETBKWbaWvMEuKbvZql3hjLP8O0oR65fUFv3qjOybm0v9E4ZmM62kJ6UkO8KCzFR
	b62jUNMOYDGUXJDcHkNcYz/2pOE15NdmGLa81gt4vKab5Gv3S/grHtBKIgjUmxJL6aAI5G+CkjF
	7mbbDEEK4BiA=
X-Google-Smtp-Source: AGHT+IGd7Z23K8EKtRtNBqCrOHMV1E0Xsdk0unv5308CKK8Y9XXMzL6Pk3FjsGQ3yPMPqTUvnfct5g==
X-Received: by 2002:ac8:5854:0:b0:4ab:70bc:90fb with SMTP id d75a77b69052e-4ae8edcdcc1mr45313401cf.5.1753494454625;
        Fri, 25 Jul 2025 18:47:34 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::71f9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae9969dea7sm6538661cf.66.2025.07.25.18.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 18:47:34 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 3/3] oe-selftest: add wic.Wic.test_grub_install_pcbios
Date: Fri, 25 Jul 2025 21:46:58 -0400
Message-ID: <20250726014655.3377745-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250726014655.3377745-2-vince@underview.tech>
References: <20250726014655.3377745-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Jul 2025 01:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220936

wic.Wic.test_grub_install_pcbios test

Test updates to the bootimg_pcbios plugin that
enables support for installing grub directly
to the resulting wic image.

The test checks to see if the wics plugin
generates a wic image. Then see's if normal.mod
and grub.cfg are located in the boot partition.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/lib/oeqa/selftest/cases/wic.py | 43 ++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 680f99d381..9e502ff5c7 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -215,6 +215,47 @@ class Wic(WicTestCase):
                     found, "The kernel image '{}' was not found in the boot partition".format(kimgtype)
                 )
 
+    @skipIfNotArch(['x86_64'])
+    def test_grub_install_pcbios(self):
+        """
+        Test the installation of the grub modules + config
+        into the boot directory in the resulting wic image.
+        """
+
+        # create a temporary file for the WKS content
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.write(
+                'part --source bootimg_pcbios --sourceparams="loader-bios=grub" '
+                '--offset 1024 --fixed-size 78M --label boot --active\n'
+                'bootloader --ptable msdos --source bootimg_pcbios\n'
+            )
+            wks.flush()
+            # create a temporary directory to extract the disk image to
+            with TemporaryDirectory() as tmpdir:
+                img = "core-image-minimal"
+                config = 'DEPENDS:pn-%s += "grub-native grub"' % (img)
+
+                self.append_config(config)
+                bitbake(img)
+                self.remove_config(config)
+
+                cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+                runCmd(cmd)
+
+                wksname = os.path.splitext(os.path.basename(wks.name))[0]
+                out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
+                self.assertEqual(1, len(out))
+
+                sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+
+                # Check if grub.cfg is installed
+                result = runCmd("wic ls %s:1/boot/grub -n %s" % (out[0], sysroot))
+                self.assertIn('grub', result.output)
+
+                # Check if normal.mod is installed
+                result = runCmd("wic ls %s:1/boot/grub/i386-pc -n %s" % (out[0], sysroot))
+                self.assertIn('normal', result.output)
+
     def test_build_image_name(self):
         """Test wic create wictestdisk --image-name=core-image-minimal"""
         cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir
@@ -1405,7 +1446,7 @@ run_wic_cmd() {
 
         img = 'core-image-minimal'
         with NamedTemporaryFile("w", suffix=".wks") as wks:
-            wks.writelines(['part /boot --active --source bootimg_biosplusefi --sourceparams="loader=grub-efi"\n',
+            wks.writelines(['part /boot --active --source bootimg_biosplusefi --sourceparams="loader=grub-efi,loader-bios=syslinux"\n',
                             'part / --source rootfs --fstype=ext4 --align 1024 --use-uuid\n'\
                             'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
             wks.flush()
-- 
2.43.0


