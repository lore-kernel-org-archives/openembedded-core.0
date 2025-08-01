Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59D2C87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 02:18:34 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.78542.1754014705199068458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 19:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=InpzvN8e;
 spf=pass (domain: underview.tech, ip: 209.85.222.174, mailfrom: vince@underview.tech)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e6817653d0so43198785a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 19:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754014704; x=1754619504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGLy1iMR67fvn+6SuMga8KLU1s1FK38i/nCe0V5V9Y8=;
        b=InpzvN8e0/vQuxEzUGfVkyIBXoml3mQ9WhTFU6cY6UUNrFJeg9iKt5bxhFMTU9PDSf
         Muod32cvI3CyxtFjcn16f5eThD76kEv2Mc81g8VSG8XEX8a4tGW/2sJW5XN6zEdc5VJT
         c0utC2okNdmGD8A2SRPayCLaxJsRjin+wwGsdyK0sAoZwwdsHw0SaB9cNzTKL/9lYYbB
         oXav8hYliVNAfJpBUYbXauDK/6jFxNmUyVcGnVIDsQolBPQ5iI6TdDyBZGdVlmjfbFVW
         sda1mnF0iwxy9kjiX5tbTjpp7tFsTUW0JdXg15uKD9n3VLyqbj/2HEn3QeFYpYDQrqf2
         uLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754014704; x=1754619504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGLy1iMR67fvn+6SuMga8KLU1s1FK38i/nCe0V5V9Y8=;
        b=Xav83dLWkYh6341B4n1EiePXXbuUfK9qWPiUv28LDKWTqEpJaCdljTPJI5jKgUUwPR
         Qcl+OtccxihEVrYfmv8gzZe9pIKFvagnVh94k9u+h0ZMV1V2df+TThGY6YJ+kD55PxK8
         7+vGTm01k4LqXe+bXKISV8h8nR7AHBYIoUVmCwVFXuq7GK9NN2RAj2MOH0b5q4EUM61T
         ehQ6z+CKwO8nD5PwxHmxBm139fEfo8FXjIJxYlwhux2Iclw/qbq+nYndYz0Txdikj18m
         Cfu8+SE/CSNaFDXvxmfFopwS797zhhSf+/KJOdIDF05P6naBdlWYsGBvBJlKJZ0d7bAL
         YnPg==
X-Gm-Message-State: AOJu0YzR5XSctikMYdKosZjC/8AEmS4LZs+DC1IDUm5DCsX8eisr0BXj
	CTsyRofsxJRGfZd/HKH+sjfo08p7PweR7ElM0vzkd+ssjifQo5IJmsm5ZgaLbb9+Aw3rDFFKb76
	ssB6M
X-Gm-Gg: ASbGncsAs80W9JoMgK9GL/ViN1/7N9k//PwgWqJdq8/PUrN6RsBB1xKRIDkhqm9OjCj
	TKefgJNQREv9WNerjiFZGOd8AGSt8mK9QvD0SirY2PigpLQIQ8JmiyWZjUnWOUVw9duEKUiigge
	/vgVOJxRsh1x5YgA4NdyMVzg2hWD3hnKhh4oUE2+RlHWq+KwHSl+izakGZsppBnTlKOOlFAEgHe
	XHEng033vGNbmTXMATls4Ew4OSBeABiFcOTmFV3zJyqKe4i4XoqQWfq2t3R561HpAI42JD9XO/4
	cmBudKqfchN8n6GFptieS0WVEQYnrjnpJzD+b13DycSZckhNIeRcdQjpXnTMKqd9e94CqBW7U8q
	qrBk6BV91y20WbWMzvDCzyQ==
X-Google-Smtp-Source: AGHT+IGR1CAp53Dn/QBiSsp9j4X1LAEfMyDm9n6lhiKKRhcKVT3QBk2cdNgCzQ2JlujlK7bJm5IDYA==
X-Received: by 2002:a05:620a:2a01:b0:7e6:2929:6b88 with SMTP id af79cd13be357-7e66f3581b3mr1379985785a.41.1754014703877;
        Thu, 31 Jul 2025 19:18:23 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::71f9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6877517dcsm101220585a.67.2025.07.31.19.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 19:18:23 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v5 3/3] oe-selftest: add wic.Wic.test_grub_install_pcbios
Date: Thu, 31 Jul 2025 22:16:10 -0400
Message-ID: <20250801021607.511597-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801021607.511597-2-vince@underview.tech>
References: <20250801021607.511597-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 02:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221212

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


