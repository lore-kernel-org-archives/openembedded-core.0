Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582F5C83F22
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 01:52:29 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.30694.1753062746726762087
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 18:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=LNdEgz/k;
 spf=pass (domain: underview.tech, ip: 209.85.160.171, mailfrom: vince@underview.tech)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ab3802455eso51594681cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 18:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1753062745; x=1753667545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2lkqBC85P3/aUk6JATkdQzwcDuCajsC3XHAuaHUIM4=;
        b=LNdEgz/kptvlIe4pUiDybfjbk2KCbBQJZBX+GDHtFO2fsnwHYQPSwyQuYMRykDyVh/
         5+IZ36hmvkk9Ve2rrxO7wc646tSsljQbdrp6gLgrBXB9pBI+DI5r+NQo13R7FX6aROAa
         J8CAV+n9xu2GCGDh2CjVbkIvg6HfMsVWwcD6BRPfMSzRTI5NYjmvKniOc9iXr+RtW726
         Dq8M9nOJfmJdYnF4m1U5A0+ym8RdRz4hgnjAaD47PB9ZCa2X82u1xszZx/DOxt7oXHVs
         E/kCvnVhR92M1lDlyD5Vr1wRCFeMzmHcVu8znOiQUhbeLy/pBeu2wet5qJ5TRpewdFZM
         k3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753062745; x=1753667545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2lkqBC85P3/aUk6JATkdQzwcDuCajsC3XHAuaHUIM4=;
        b=MGAOYpS779Nlzz/9UpEZ84/oI+tx0yBXY6b9/0OCi1cQW3DR3SpqJp45friLhPcv0P
         Q8pT7/M3iJHcY2HUqEf692KZbb2j/S1ijZoKFHtbYvSRCetm1mzxPvhHBq+2Uc+xSAj/
         Tf7x9b/HiLGP39WQ7owU1BxxMRYhB4Yo/fmt2Na8iOiay5X69ro+0CUg+iU/y1wM11uY
         FVVB/2jO8FkUxp3pekcYByJCqwGmtxiaki3q+AdlZlWlaPSYRm+tLfJ3lXrdHWHLgXjQ
         0WCDt+ZxgD5E8t3ZK4/J6m7iU5yK+5Jwau7qKDNPYimBpK2oZN4DHYYLopjUTXOnjCV0
         cNSQ==
X-Gm-Message-State: AOJu0YzyEOJnilTC1u+LPKDLW/akL4MtcwAkEuOkWBwr15jQd3Wze2go
	m8zbfqOSjosw8aciM0c3uBWfZ64UlyyIMpFRtwf8VDK4ygkldLv5lKi86aUDCDu4lsMo1PlCelw
	blo1J
X-Gm-Gg: ASbGnctQODBlbBdLq98Myzt5MmsCnWoeN97xEdzLbF0k6fbzxm0NAdTx80WTk2/JGwt
	OY4nfgvuN+s7OEH2gU0Ful3V75+fXLLVKe5GxXBRMjgcnipV1Sjmx8PBLZjOQ89SpDy9JTxdToO
	BywhdXsNlaQLQI61qGlm3dc4H8dCx8DQpWk+BVKhkRhbDFm2j9OBK7VEDNx31uxJSCS2n7GhzXR
	YZuIQiF1OBwljIHHC6uVAXF2NG6SA0O78nw1qcqhIl2Ka2lBx72bFB+5AQaCVEdPmvWuat5H1eQ
	DZbJbtTrDiBtgL44w9pGiQaTjvTBVlbSYzTK4oqKSZB5ktOB3wQm3VYMcZSRmt42WOgELsbwxjt
	RjjatdeDY+2Y=
X-Google-Smtp-Source: AGHT+IFE5kDy8wzjgoNuIhxjK7NUoGPMG1wEwp/vEd8ydLFXnyJjjo8UhQUSH74EuvpeunuoTjBhWA==
X-Received: by 2002:a05:622a:2588:b0:4ab:8ca8:5d72 with SMTP id d75a77b69052e-4aba39df4femr238278971cf.0.1753062745330;
        Sun, 20 Jul 2025 18:52:25 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::b05c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb49d0513sm36039741cf.33.2025.07.20.18.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:52:24 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 3/3] oe-selftest: add wic.Wic.test_grub_install_pcbios
Date: Sun, 20 Jul 2025 21:51:44 -0400
Message-ID: <20250721015141.3599063-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721015141.3599063-2-vince@underview.tech>
References: <20250721015141.3599063-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220652

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


