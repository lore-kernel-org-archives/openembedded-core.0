Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEBFCA0EE7
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 04:26:19 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.15409.1755145578425894356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 21:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=gHQJV/4D;
 spf=pass (domain: underview.tech, ip: 209.85.219.47, mailfrom: vince@underview.tech)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70a88dcb665so7477006d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1755145577; x=1755750377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUgW/Dohl1eu3VTBxdIh947IqoJcytGLntlsQO7Jxzo=;
        b=gHQJV/4D7KdbsJOaJNMYsz1zy1/2Mw5cjuxk9emhMZOMXqzPWvHCCTbU1mFpV0pj+1
         yz7sQBXi/9hDjELRjpXsR6h9TyNzgHAyQjBsetmXFPGgRBZV/4gbvB/XfqdjZtmEuyOR
         EaPJo5uQYPRMl3SnV9IvX8ktVxJ/MeFbW0/a/YDZklkGQnD8fDQtMt5Cti5FGPjRbm+7
         GBAKFRjoFg8sVbC+PWjzfvL2W2UstqMXrLT5jQPS81cqDXUJDp6qejkENvctz4vRhd10
         sFEJ3AJSJYgJueC1BcZdlTZtGIoC0LQ5St/c9jx5IbdoFRf8Q7IcecJWmyZrR3WrhnLr
         XO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755145577; x=1755750377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUgW/Dohl1eu3VTBxdIh947IqoJcytGLntlsQO7Jxzo=;
        b=tIhds8C/FL2CyoXr9dLWZe/scyydSBedKZXN3cE1XfBb/LorqBfB12ftWmd6i+6BwP
         WOIbZ/IpYuoy8C6xIL24KsIfeYGE5WoFiM0DAkW8oPvN28mBf883dsmJ3sSIbNRwYcfv
         hZwa5NCTcwNn9fN5U0aALBciOs/t8S0MNw238hHjdGAmLadHfrv8N3BIaHtU5WEFhGzA
         +0rYFKzENE9DbLyYmkcPOGHSJLWf4sae6M8rwUEURpT7/7Lbi8nQ44cypxi0111GLZ6l
         AKyr9VQcsH/qL1fqq3FmDbUtgLuMH/uWP/M1AG4btjzzulzgtCRh4HSQe00vo/+dcMuC
         adkA==
X-Gm-Message-State: AOJu0YypbreL7rwnHcFcZECpFcVw9QpGyDo92u0vHO7F/W9/AIe5+vKZ
	jAN/9ymejRKQzHspkyPALldVc4+tRfEWxD2a59utYtxAnRsleN+QEc3sXdMrGbueJ+YVQOER9Bf
	EBZsVBpg=
X-Gm-Gg: ASbGnctIGXWrmyJJU7HxGffEArzILzucTEPULhfDBcBtPP3pozPFDaMmVdoXmkkxkuv
	IhEa2LSI75wRWRvdIR+NsWsZwCfl2gqJC2QaF2HJDDDPc7x/Z/je0OsDnecT4a4TCWfFyjasG90
	RPNECNmPMeKa18ejCuV0Hzp4eeZapp6lgOfdSTRFKr20WLihG7NDvjcImoA5SsGPQPBdGOrKCSY
	dpWcFAT84QIF5CWPW+EyZ8McGNb+1kAwGIOV+WtI+bjuPT5QV702b0YMPtLgv+02SU5UPKAXvWX
	OFWp+K+Fx7rA2B7j/40fbXWXREygmbNRcEq1uSW0CkCXvkff8OGOT9x6HW3xxnTvfgUAdp3G+VQ
	oCBIrYMwzSYdqQPKmcLKQw2qNgMYozNT29S5ZvpLFdsvJww==
X-Google-Smtp-Source: AGHT+IFbe5jsEsO9iZd09B4YyjGvK5v8D6Fk9IKt7rFvlRVnZKNwY93D0TtOF1fGCdrXFfZMXK0KPQ==
X-Received: by 2002:ad4:5946:0:b0:702:c4d8:ec02 with SMTP id 6a1803df08f44-70af5f57928mr24126186d6.40.1755145576942;
        Wed, 13 Aug 2025 21:26:16 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:e358:dd1a:4ea0:986c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6cb6cc2sm8322816d6.22.2025.08.13.21.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:26:16 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v8 9/9] oe-selftest: add wic.Wic.test_grub_install_pcbios
Date: Thu, 14 Aug 2025 00:25:52 -0400
Message-Id: <20250814042552.21887-9-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814042552.21887-1-vince@underview.tech>
References: <20250814042552.21887-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221849

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
2.34.1


