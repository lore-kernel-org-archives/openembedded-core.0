Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE16C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 01:11:09 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.29983.1753060260556396954
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 18:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=LF7mya0h;
 spf=pass (domain: underview.tech, ip: 209.85.222.178, mailfrom: vince@underview.tech)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e1f3b95449so474899885a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 18:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1753060259; x=1753665059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpd+nWif2RdQ7M3Cc1jU8ZfzXx4xJSEINEXvyV0nXOg=;
        b=LF7mya0hhDJWo5hPxehvf+5UlfsmBJZdwO83LB2ZMbW/FQjz4cKqtQnpVUcrNaChbx
         GX9+d5MVbfEQA7u5bn3jXD4TFwjXfUGKAJsFUjA3tuDT9jQp6f2NUK3ys2g9A1kqzCrZ
         RCqWPz1/WhCm47tO+QoiNgfin/pQ1KY7Ro8dRsFN+UmJ1HMxsQHzdo3p0nDiBwNng2PG
         n7KZlHyWTxxXHN+0/TVqhqMRhdOYI4MC5SRVDVQBqpq+HfOiZFSwy6c8E0VME16ibP25
         hRCfqj9pY93usbK3VGnYNLe2jESnq9amvH+T5MpBsHmZmNgkBp4iA5g8s7pXlboXvJvj
         t82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753060259; x=1753665059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpd+nWif2RdQ7M3Cc1jU8ZfzXx4xJSEINEXvyV0nXOg=;
        b=aLpoXTHschJ67NBpchiC2hpXHbZbRTR7DGD/XxPeMM80SRMM6V4TQtgMhmoLrpV98g
         gwwhZkWJhXmSoxVffr/MOketvu412UWfox6EuRmdr5td97jti192FgDzZLGo7ubVzaon
         8v/DIDVCLVzyQRTEMKjM1asPA92RiagQh7P2Ehrr0r5gzc1PzihdGdpIpQsdSYhmuTBy
         pLBnWmHk27ZLAsydodamDNFVyNQ9amrA16J2FnCCpV+JHxMROJJyjhUJrGj0ValCsvUl
         ZvqJNMXRI0kc1dyad/lbUMcvWM7XefIdbl7bl+UCb/e/Czlr7Gl1zq+YC+GCUDeubrX9
         Gr7w==
X-Gm-Message-State: AOJu0YypAu6dfW2Dhz/pESv7mQW8LtjWZEta2WlV5clyQx2kzms66U+O
	z0TXr9892bk1OY5VKQfFkISMdAT21yp2ZvG8mJWvOKh+31UHytqJgG2l9aG2ShT1FrJEydSzA+k
	GyXMS
X-Gm-Gg: ASbGnctC2Kt7Q72tmUE/c2t4ROzpqNzjCLuaE+SDkmOMZ/kDgPnl+JwOmdsziQbEnCW
	QevmKxTm2NvKNSeW8zJnNvv3qox+ab/DUW2AhlaMbGZXMF0zF1KN5cwV9GeyDJPKx0umbe00kbR
	Fn7gEDhz01OFDwQYn0AP79ceCNMvdSf5T+nKw/xS1oHRab97gFWWQjQ3yP0ZK5k8h2FcGzc+fs6
	EBnAQaIjxxcA4z4jLpCTBV4nr6x58xPzlRGHzaApX5jFCs6U5/DMJqfQqXwnkDktUEe8V/1zS0F
	klYnIe6NBeeJ2Yu/YM2xzeLiSe4f49kdpmxc34SQWNwPHNnL1v74je598+iIur5q3DC0E8HZV0P
	7WY7vNVnjU0o=
X-Google-Smtp-Source: AGHT+IFyb+jWLCwMXjNN4h43/ppb7tJdA2FzFut4EIiquNqCBNBQpGz09OPFIVZ/ju5ixWJAnUOfRw==
X-Received: by 2002:a05:620a:390d:b0:7d9:bde3:79a1 with SMTP id af79cd13be357-7e355548f01mr1604518585a.4.1753060259003;
        Sun, 20 Jul 2025 18:10:59 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::b05c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba9270csm33855256d6.86.2025.07.20.18.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:10:58 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 3/3] oe-selftest: add test_bootimg_pcbios_grub_install
Date: Sun, 20 Jul 2025 21:09:39 -0400
Message-ID: <20250721010939.3561904-3-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721010939.3561904-1-vince@underview.tech>
References: <20250721010939.3561904-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220644

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/lib/oeqa/selftest/cases/wic.py           | 43 ++++++++++++++++++-
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 30 ++++++-------
 2 files changed, 54 insertions(+), 19 deletions(-)

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
diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 97687edc71..2582ce1164 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -113,7 +113,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         hdddir = "%s/hdd" % cr_workdir
         bootloader = creator.ks.bootloader
 
-        grub_cfg = cls._get_bootloader_config(creator, 'grub')
+        grub_conf = cls._get_bootloader_config(creator, 'grub')
 
         grub_prefix_path = get_bitbake_var('GRUB_PREFIX_PATH')
         if not grub_prefix_path:
@@ -123,7 +123,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         install_cmd = "install -d %s" % grub_path
         exec_cmd(install_cmd)
 
-        if not grub_cfg:
+        if not grub_conf:
             grub_conf = 'serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n'
             grub_conf += 'set gfxmode=auto\n'
             grub_conf += 'set gfxpayload=keep\n\n'
@@ -138,25 +138,22 @@ class BootimgPcbiosPlugin(SourcePlugin):
             grub_conf += '\tlinux %s root=PARTUUID=$partuuid %s\n}\n' % \
                     (kernel, bootloader.append if bootloader.append else '')
 
-            logger.debug("Writing grub config %s/grub.cfg", grub_path)
-            cfg = open("%s/grub.cfg" % grub_path, "w")
-            cfg.write(grub_conf)
-            cfg.close()
-        else:
-            logger.debug("Copying grub config to %s/grub.cfg", grub_path)
-            shutil.copy2(grub_cfg, "%s/grub.cfg" % grub_path)
+        logger.debug("Writing grub config %s/grub.cfg", grub_path)
+        cfg = open("%s/grub.cfg" % grub_path, "w")
+        cfg.write(grub_conf)
+        cfg.close()
 
     @classmethod
     def _do_configure_syslinux_cfg(cls, creator, cr_workdir, bootimg_dir):
         hdddir = "%s/hdd/boot" % cr_workdir
         bootloader = creator.ks.bootloader
 
-        syslinux_cfg = cls._get_bootloader_config(creator, 'syslinux')
+        syslinux_conf = cls._get_bootloader_config(creator, 'syslinux')
 
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
 
-        if not syslinux_cfg:
+        if not syslinux_conf:
             # Create syslinux configuration using parameters from wks file
             splash = os.path.join(hdddir, "/splash.jpg")
             if os.path.exists(splash):
@@ -182,13 +179,10 @@ class BootimgPcbiosPlugin(SourcePlugin):
             syslinux_conf += "APPEND label=boot root=%s %s\n" % \
                              (creator.rootdev, bootloader.append)
 
-            logger.debug("Writing syslinux config %s/syslinux.cfg", hdddir)
-            cfg = open("%s/syslinux.cfg" % hdddir, "w")
-            cfg.write(syslinux_conf)
-            cfg.close()
-        else:
-            logger.debug("Copying syslinux config to %s/syslinux.cfg", hdddir)
-            shutil.copy2(syslinux_cfg, "%s/syslinux.cfg" % hdddir)
+        logger.debug("Writing syslinux config %s/syslinux.cfg", hdddir)
+        cfg = open("%s/syslinux.cfg" % hdddir, "w")
+        cfg.write(syslinux_conf)
+        cfg.close()
 
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
-- 
2.43.0


