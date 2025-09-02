Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B24CA1009
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 01:58:54 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.68016.1756778324319256744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 18:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=F/e0XbI1;
 spf=pass (domain: underview.tech, ip: 209.85.219.44, mailfrom: vince@underview.tech)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70fa947a7acso6720716d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756778323; x=1757383123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvG99qTrAmjSaLoPwqOTPkdhf+GS6D//ePb0cA3Nblk=;
        b=F/e0XbI1H76pfRRPwpA2B2EfSbqAGZK4W1tRx+oUF57AB0+BMEFJ//6sCkL4ZE9GwY
         B9RfIhOBF4zcuKWpGG/4C3+r6Cz5B2zcLP6BRjjt1o/P5pN4fKgB/QaD3Ol7ge/qotSl
         1VVuRRcvAdC+Er7SjWbnHYuLh0nYd7lPzB8DT1X8540S9J2Krf2Qbds1ZCdVVTIzxHwY
         lA+LTyPdtl9RVCW/HsBb2HaM/hVm53LLzn8Wl6dH7fykSDpahUium7Umn06w0bpsY24I
         0pm8G6N14nDPfHi5sDimhg0/zSd+Xzk5Uth4yBGxTSY1XBbLOIA27BwgP44NhrTSee0Z
         xmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756778323; x=1757383123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvG99qTrAmjSaLoPwqOTPkdhf+GS6D//ePb0cA3Nblk=;
        b=ewC8FEePBVk4uKq98kWTwyfI9+R8Pzsh9TqnpJYSraXm5Jqu79CjSq38G86g3xXfb6
         DTdwYUuaMD2hApJ5gFkw9E/YJoPsgz+zylC1+IIj5u6nXOK1eC1eTYQJLnMlF+ZVekYP
         5OZ6I+ClLVC/TYVJlLexrq3oF5tr6aghcyDr8gmXkHm4qTR3pjE23dOPCi69ptSGN/b0
         NGERajLyIQ0noS7afWMbcMgYAAMRIw+xp54gV+J9WdgHTyyg3/PR0aaZ0MikD9CHnbwL
         58KPWY4cD7lwS9l1o4/4QYlBNuldDO3KgayobNDMQcN6kYUg3zV9qyjSl+oqO4duhP8n
         CAsQ==
X-Gm-Message-State: AOJu0YwmFqoKtCmBcMOQpNA7lNu5igUG8lmtGGEMgAbzVjfrGSjvzlqK
	2B2+W4ERjIzHbrvs+UBiBfIu9AqyCBvoFabsAFdHc14X+gZH75+X9JJZDSdFGX9h11j7ommFN7J
	pGy6T1rQ=
X-Gm-Gg: ASbGnctXwnR/pE1BiQWo9OHhqWkG2T08F6qtf+KMeJWBRjnUMnmN0LVGNa81gSfI8/1
	XlJPunG6TNZPn3VyIGvnD3L1lrRCg28xIzGjypbkQfVY1xF54uv166Ypvi8pb+UUp1xRivgEHlj
	LkashM7PExL66fBQ1LM3R7QmjX5va62YOTKoxeM0EIhiAxZwrhSDZFcP6UOz2keD2cvs/YmgU5m
	1QN/Ox+rSrPbHcDcD9WhdRK/fWFVEaAtzv9Awlfyi24JjWyMCF11T4cPmU4iwWUydbFK1duuIBJ
	hIqHFZ0q0mBPdYVhlGr4B298Hs19r8CGRFbSUM8tFEve0/3NYFyoZGU+x5sA1dOVT1k00iYfJ/s
	LtTbUE5q5csMTwVFN22tNWA==
X-Google-Smtp-Source: AGHT+IH2JfzhFllqCDkMw5tk1POIsvre0j+2mX9cMUUq5amjFeInFLnptLxScNsHmx4Fx+yMKZl8dQ==
X-Received: by 2002:a05:6214:d89:b0:71d:9d4c:192a with SMTP id 6a1803df08f44-71d9d4c3056mr46480166d6.36.1756778322922;
        Mon, 01 Sep 2025 18:58:42 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::7efe])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720a30b79aesm4284666d6.0.2025.09.01.18.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 18:58:42 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 6/7] oe-selftest[wic]: add test_grub_install_biosplusefi
Date: Mon,  1 Sep 2025 21:58:24 -0400
Message-ID: <20250902015825.2785789-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902015825.2785789-1-vince@underview.tech>
References: <20250902015825.2785789-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222688

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


