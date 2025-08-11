Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FA5C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 04:06:53 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.40656.1754885206186167327
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 21:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=F6VPjvrd;
 spf=pass (domain: underview.tech, ip: 209.85.160.179, mailfrom: vince@underview.tech)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4af156685e2so62829571cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 21:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754885205; x=1755490005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGLy1iMR67fvn+6SuMga8KLU1s1FK38i/nCe0V5V9Y8=;
        b=F6VPjvrd7n0SrzkRHWWyN2eOzRNdtQfpshI8DXSPMJfepc68wmukoQDr9jR1D7OrfP
         Ua8gLIFfVV+nCfIDuPVPiHA1mfl+aTgEEd/PlrYXKNz3J6hVblZK/ejR4y/NuIYaVnVG
         maQzxQILYbSFqkvtZFtm8Ljnv4z4ZIhe6C9FPARDS7l9t6RrsXsml+SyjyqXbQVxCPvF
         Dh+dFqbNN82SCr8DQZ32993DO4bprdPl5mP7BX8lWrJYbbIVRFuIvkc+RmMNRssQq/vF
         f9AS9x2UuGKsBam2dkcYtlGOIO0r/QJDiIZr5lOUieiWSRWtDSpRXSiBorBu2HaTs9F9
         5arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754885205; x=1755490005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGLy1iMR67fvn+6SuMga8KLU1s1FK38i/nCe0V5V9Y8=;
        b=LdtogLOUcGQCkzBT5yDkunWzA1ra5iMCa1e7hBC7cGGMAGV9ZhO2yZGaDfdE/Wsxsp
         ZZyY9UR9ghKmpxnaNtE8nkfjvZoiCmo4lGih6K7O9EpuDjYiq+oozmVJUtyj+7VRLFYG
         2jRc48kglPVr0+1Y80UsdH+dD28eaQr2RfYU+MRBT/I9fv7cK/N6yMmY75iILXr3EHs6
         msCvxJwYn6arSIitYxO4K3NVDPEMjE60d0rENddgVvEljNUFsCWwAoQOtKPQeEdUG0NK
         NVThGUkmq0aJ83g0jdKwblTZhoGdx1cu0xHvhqBBZXVl2aL/1mDNoDMiqUGhGJLXt5UE
         WBqA==
X-Gm-Message-State: AOJu0YzfVn4rHGnHwZ1cVVAfvmCB1cswHmkhg7BjwXjYI8/vSnttZ3My
	AgYfM32JnoNcITrKlLO4XZrWtpNIDySpuhm9Ya4qvGYZHu4zLpzjmdagcPJKQ5qrspib4LMC+ua
	C4pGu
X-Gm-Gg: ASbGncs4kWvoFJ8gNss1K+mtk8RSRA1sP1Eg8sN5cCD1Mq4hRQDpI0uIa4FikqHK6Hk
	4mZ1Ca23wXQw/8Yu8eG7QJGml0Wr5X/yAqzhb6PaWi3y9HQWKEQaFtGa7IhrpbAF7SVHjCRdpuS
	y7qH31MVuesea6SE8mmKyaavYUSzc9Eo1CneUQ3MVuGZdjFOcS6qgy33DnhxJQweS3GpRLXzbl1
	XPgL4hyjfhLZ0VvNg45LsmB0VJOGuOtWNt4N1Q8KzLdqag5xpq9+Qe37P8/x6mUa31xdPHKzlDk
	ejKxNHdQhra/HFI8nIqGby41XYuzlGGs+frAKTtWygwWmrmgUxbpcy35wrDZt8jsHm/a2ParYLJ
	V5+lTn5NWU3A=
X-Google-Smtp-Source: AGHT+IE9yVdxrraFCgJFh5E+fyb57DovTyWXdXorAcvRT6llc3CCUx8yAwnoAbVF6dqrTm6izHyYvg==
X-Received: by 2002:a05:620a:2994:b0:7e7:fba9:4a79 with SMTP id af79cd13be357-7e81ffd7e54mr1978557085a.29.1754885204618;
        Sun, 10 Aug 2025 21:06:44 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::6d26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e823fddc10sm597842685a.16.2025.08.10.21.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:06:44 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v7 9/9] oe-selftest: add wic.Wic.test_grub_install_pcbios
Date: Mon, 11 Aug 2025 00:03:48 -0400
Message-ID: <20250811040339.857858-18-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811040339.857858-2-vince@underview.tech>
References: <20250811040339.857858-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221716

wic.Wic.test_grub_install_pcbios test

Test updates to the bootimg_pcbios plugin that
enables support for installing grub directly
to the resulting wic image.

The test checks to see if the wics plugin
generates a wic image. Then see's if normal.mod
and grub.cfg are located in the boot partition.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/lib/oeqa/selftest/cases/wic.py | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 680f99d381..44442e402d 100644
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
-- 
2.43.0


