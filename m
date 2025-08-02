Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC873C87FD2
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 22:05:22 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.6932.1754172312722346491
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 15:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Uq4a0M+/;
 spf=pass (domain: underview.tech, ip: 209.85.222.176, mailfrom: vince@underview.tech)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e34493ecb4so236474785a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 15:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754172311; x=1754777111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGLy1iMR67fvn+6SuMga8KLU1s1FK38i/nCe0V5V9Y8=;
        b=Uq4a0M+/Xrd3CoKkLVVipzTWR4NBa4x6MSG5OuFaYEJdOT2q3FuM8dPLy7uTaIDwWf
         MkxIRYQJYMbaOJJb/sSL3AINzspe50cyzykr2dW/45cla0xWgtrAxYA567FnKJFJtath
         rwI0b3M+cwVWjWA5rHV94A7k8gpM8q66eR1ETBPb0lKMbeercyvWvHrc6Ss+RACsm/xG
         LYXIJziH6YdObkDD/wLTCHIkvr4633pZ0J4isYTW9wywj2eSc2JEzG2dQNqt9w80bF4t
         IbJ2gdN0n/Yf25FEcotrpFzccPQtobeNlS9B+se9slecWCk12RHp6IR1EXebaLM+GddP
         /Xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754172311; x=1754777111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGLy1iMR67fvn+6SuMga8KLU1s1FK38i/nCe0V5V9Y8=;
        b=Q5/6xP7DjLaxPt6qqF79YZ6VhnehXNdSohdSMKiTNJNRvuNYz64QHeU9hprI8f/ELq
         Pcm+G/9uqk4DL/gJEZMco7KOhiGQupzdfB6nrP31l/UfjlV8+kve1wWQ1M7lXZndiDbu
         kQ8ne6NQ1EC+YVOPKQ1oWc2VsB5Jyn7doHxPPDaW3ARRJ7XKXGCFJ8SOTJni0kfST6x2
         6mbgBAwzTcebfvdLpTR5UNYv+9UXO+PHDIM2b754cig7tfAF+oGQY5V1RRyjGbcYCzhT
         XnwTW2Zrt90xNfHngMyjSXvcCBFY83IuU5KF/lRchvStT3h/etRdK0sUuShAo5SXfjaC
         M4pw==
X-Gm-Message-State: AOJu0Yw8Sr49EdO+upAQzBF5h+b0iGXlANH4OSPcnc+IBoHAInC+14+2
	iXEJNwE+LtNfuDWGYDfpcl/LT8FgqQdXSR1gDcYbpInvyapwvp9lExAO9jQnXWwoF1ivMw+kk3k
	e0ntF
X-Gm-Gg: ASbGnctbObRiA1L2IWAMroDrj73BCtO+49zfnVhNGMMh+0yqGAqo3jEl7/hlFp6Wcq9
	aIgknQ7jRozvl10IsMVSyVIZSCDr7DvKuixIEc9ZGjeMADxgVmOuIMjwgoplS5jBKy4zRzU31qv
	atzouOheNE9YFOYwPx8KtfZxkIBVbI1Nab+KhVGqMDjFR8L5wqRdVYTR2tgqgvNZFzvsIaesgtM
	qri2LiCW+kum2hVCZggqLAzPY8aBJQ9si1Y9bEnbcdh/0IULNlqIojC6fe1qCQVdBRgdf7jBrN3
	ueovu9Ll1QB2OauC2MTtgjgsVdLJzHsB0CMvR3HLKvE2zZQyPyGan4KGOxOA5oLz40+XTdkO7I7
	9iacAO44lMGk=
X-Google-Smtp-Source: AGHT+IEowuWfpeKvgWx7okJd+IfBPK4rJMDHgcuvqsd+KSibpgV3wmRT867xRE8dZdtbPs4rHNnF6w==
X-Received: by 2002:a05:620a:7005:b0:7e7:f84c:9d6a with SMTP id af79cd13be357-7e7f84ca068mr21074185a.32.1754172311164;
        Sat, 02 Aug 2025 15:05:11 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::71f9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f706406sm373028385a.49.2025.08.02.15.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 15:05:10 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v6 3/3] oe-selftest: add wic.Wic.test_grub_install_pcbios
Date: Sat,  2 Aug 2025 18:02:32 -0400
Message-ID: <20250802220229.2826203-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802220229.2826203-2-vince@underview.tech>
References: <20250802220229.2826203-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 22:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221394

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


