Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECA2C83F22
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 01:17:19 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.30079.1753060631305098039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 18:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=JKWX66L7;
 spf=pass (domain: underview.tech, ip: 209.85.219.51, mailfrom: vince@underview.tech)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-702cbfe860cso31852206d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 18:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1753060630; x=1753665430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiKOxel66Nejq4tE8zoKblWfssQFptbmU/p8gbnZ2gg=;
        b=JKWX66L7DOZ8zWBr/ffC3ohDIF9ML6H7tCyNHxoJZjVbrjfYfxETZ8b/dglpo3DH7u
         Hq7+Ltv8IdDB7uno9QQjZyE8DpuS/XS7DDcdapuJnZtA1B2KU8Hi/CU3bkqA5AKTuF9O
         WW62cC3cVVr/oDcxfObwctWiw5/llEIckVDabJ2cHsYcyOG142Yx2hlndqx2g7jxP1Dw
         XIhgfuqAqGPfbGxb5SOII+k6Fg+kJeotQFXNDE7C5fZmev6bB4BCYGpW5cV6lRieCM+S
         beqZAykAs91rv6E4vIfuy4/7TvjLRajwznL0XeLiGVCOfQY0ocbyNYUx6PfaGQwMDicO
         kdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753060630; x=1753665430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiKOxel66Nejq4tE8zoKblWfssQFptbmU/p8gbnZ2gg=;
        b=FEs17+3PT57Oc+lnWX3gk58kmfq/ng2LBaeMwphgbCLOpo+TeWf95+XnO5ABURI4Uk
         E2SakHVBQ4+e474CLnLdsDN0ZqKALgYJNr0I+cU5Nvt0TjykndxrhxPN8Fb9elVDyy0b
         M9MRT3GryrZkJVDji8yZZjUosx2+zx41RUElNM3kf+Z1QQ1Ybc4Xtr3ukrmju2zQlmij
         9xETX5Boi0RNYFx+YlFC7c4jpbAe8jtiMp9m4woBkR0VcnzVORqmShPpwq4isWa6k8MD
         tTWMuvrues3Kr0g+Y5MLPqFLDPHoqV5JeEgvajvzEvLlRvBDBOSyJRwV8xrN1/BwAI74
         12QA==
X-Gm-Message-State: AOJu0Yyd8vNZ4SmiO3oGiStRa6x869B0sqaVfdtCPOhoB3YnMxpem1St
	ChL8xVDz07Ajzei4cqihsDgL1gL5AKc+EM3QZxyIh6f0v4EGIeGLkSVfe8WlYkAYX3cHP892uh+
	ITi5D
X-Gm-Gg: ASbGnctrugH+yU9e7XacXP96eCoLeJrE2X7TfRkTN8BkxevYRQO8By/tFZXUuTtvk5v
	yV+1EhBvd2cNqOLSHQXNwlILVrWp9PE3PodqDlMw9T9WBgpFNsjrNky43bsjr2ekDtLpjDv155c
	g+EvE30BRM2U3yCx+qSfmM2f7ImfbK8DnwmLTMF0na8ZhJSggTPx0KY5t1niaQc6tlz8OTAnRkC
	Lx5+QdGnDTrhmNug8WrMy1WuOkBDfTONitx06azg4X9DNCJTkHbyH9Jgmjg9aIHajh7tZ79U1t3
	gq5xA375E+G3HkpYL76oYv2Rei501fRMR0VIc3P00/WKysYd8oL7qrqyhFnyIhcFh1dREXrz8Wz
	tEd3jnUFaJRM=
X-Google-Smtp-Source: AGHT+IGsKs2TdmRE2s67WBpJOA/SUlVrWHL6vDsFIyl/7Deh8qY0bw1jaE9UPy4JbVcxGL06sB5Alg==
X-Received: by 2002:a05:6214:1248:b0:704:8e3c:7b4d with SMTP id 6a1803df08f44-704f47fa528mr249534596d6.4.1753060629906;
        Sun, 20 Jul 2025 18:17:09 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::b05c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051b8df533sm33318396d6.26.2025.07.20.18.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:17:09 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 3/3] oe-selftest: add test_bootimg_pcbios_grub_install
Date: Sun, 20 Jul 2025 21:14:52 -0400
Message-ID: <20250721011448.3565296-7-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721011448.3565296-3-vince@underview.tech>
References: <20250721011448.3565296-3-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220647

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/lib/oeqa/selftest/cases/wic.py | 43 ++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 680f99d381..91d9d31da1 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -215,6 +215,47 @@ class Wic(WicTestCase):
                     found, "The kernel image '{}' was not found in the boot partition".format(kimgtype)
                 )
 
+    @skipIfNotArch(['x86_64'])
+    def test_bootimg_pcbios_grub_install(self):
+        """
+        Test the installation of the grub modules + config
+        into the boot directory in the wic plugin.
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


