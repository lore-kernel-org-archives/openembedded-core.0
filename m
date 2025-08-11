Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90BEC87FDA
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 04:06:03 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.40390.1754885160252986576
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 21:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=e3lwSr3l;
 spf=pass (domain: underview.tech, ip: 209.85.222.173, mailfrom: vince@underview.tech)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e1d89fcc31so406831985a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 21:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754885159; x=1755489959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaR++pCrHxHOm8GgvryecDb3FZ8EbmnakdMWNZBYT4w=;
        b=e3lwSr3leJ9W0DE+7rlKLR6a5UFYcmuGQ/ozISpSKitwNm/woAthlsD53SwlI1PXru
         DMW8onK6aW9uwR4tqpqK7sM1eVLn4OiHdt1Wiqh2YCAoJ9EUzg/TIw9oPAr+y6651ux2
         BQkmjNj0nPCHXSaBMHYn+T/8G9h1xzDEykSpeQ+dG1zRGzEv+loI9godqGCnJSKFgVsp
         WXmVU7iiaYATOG1tmNOUesfREutJBQAZNkcRHSO9cbEIKd9ARauX8GzbChctC8gswyxN
         /addMGsO6nh3BaQFmyCfBzzYCslGSVxyL8Njb+IzCpFDJrVmo2eg114l47wcjsC1tTtu
         /M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754885159; x=1755489959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaR++pCrHxHOm8GgvryecDb3FZ8EbmnakdMWNZBYT4w=;
        b=SbEcIOMKctHgxexmNkdtbdqS0dsQ1EQx/a7Fnl5mZusiR9Y2p2UMRtA7yVoanpHx2J
         iqsYWVj2zXdD1t3MHqRGsrgreb/gYCZdirzozqdgjS2neFL7xCkZMMoYHdmodhG98Yv/
         XbXeRpFRMqdEYkWce6/uYdFHKDJsmK4jqm1vvzPHaZ836xBG0KKgBTXyQRXtNbVXmsqi
         nMCOETKwgfDOTVtyTBrLSddoWV1PuV3TYky13IHHJPVCPOLPMfSF0lPqTHojbjowHI5k
         SVu5B7vS1pL3yN2sKp2OlqDSN2a8QWB7GH2SpPcBgJ1E0ChU6GsBaSlQJUBOewBUIznY
         lExw==
X-Gm-Message-State: AOJu0YzujvD4gYViD3AFQ7c9zmJBBWqFzLb46aRTYIwPiPaxBwt8QkTN
	UKVIYSiwozac6Q8fMEuMNvp1Lj3Z7U0aNBnrBfhkRbx6jhBHh6dvCGhtQb+PYuIsHYh+WhCd0/x
	KZj20
X-Gm-Gg: ASbGncth66XTTbQzEP+DTqZz9QcyPQpx5gcgSa418HF9EX35TBt9UQawj2PU/Yjd53r
	WaRvOBbOkHJ6yfexqOEDn5pIItgkDh8dMx0nOs0b2rUk0FTJXLOdHyZJ4hZuKaAz9CntIZibCEe
	SIqi+VxaVTHW8JN71kwQyGfKlalCjq1ZPsVx2l08qyc/YV41XC3xOki5P/QYrpjzshUbiXtX9y4
	ArjDGHoXLZgU3SLMfZ7cvArzEj9+CoSV9hf0kL3+y2YicXY2YOst80qbKuuIX7DEzb+VThzNnhX
	TJxw5kNTmIgD+WUj6bJaYkVdvqbYjm5+BOueo5Iy1ZolinqjP1TfEDFGr9PqFB721XDu/+OZFKx
	X65GMuAyJYUI=
X-Google-Smtp-Source: AGHT+IH+o2vdv5pem0TBzR0BmjfPNFFtTMr/Wk9wYGV0ZQzvTNE7K95j/X7ic1ELjUBaNQXzb9hjXw==
X-Received: by 2002:a05:620a:4515:b0:7e8:32a3:8c4b with SMTP id af79cd13be357-7e832a3cad0mr1270455385a.13.1754885158738;
        Sun, 10 Aug 2025 21:05:58 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::6d26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e823fddc10sm597842685a.16.2025.08.10.21.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:05:58 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v7 6/9] bootimg_pcbios: add funcs to configure booting with grub
Date: Mon, 11 Aug 2025 00:03:42 -0400
Message-ID: <20250811040339.857858-12-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811040339.857858-2-vince@underview.tech>
References: <20250811040339.857858-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221713

Functions added, but not included into
SourcePlugin overridable functions.

_get_staging_libdir
	* Finds target lib directory if for some
	  reason STAGING_LIBDIR isn't set.

do_configure_grub
	* Will search for a grub configuration passed via
	  bootloader --configfile. If not found build a
	  default one which searches for partition that
	  contains the given the kernel name via grub
	  search module.

do_prepare_grub
	1. Sets default values for GRUB_MKIMAGE_FORMAT_PC
	   and GRUB_PREFIX_PATH. Both variables are required
	   by grub-mkimage.
	   * GRUB_MKIMAGE_FORMAT_PC used to define target platform.
	   * GRUB_PREFIX_PATH used to define which directory
	     grub config and modules are going to reside in.
	2. Generates grub config to embed into core.img.
	   This config is used to search for partition
	   containing grub config.
	3. Creates a custom core.img or grub stage 1.5
	   with an embedded grub config.
	4. Copies all the target built grub modules into
	   GRUB_PREFIX_PATH directory.
	5. Creates boot partition

do_install_grub
	1. dd target platform specific boot.img to the first
	   0-440 sectors of the resulting wic image. dd grub
	   stage 1 to wic image.
	2. dd custom core.img (grub stage 1.5) with embedded
	   configuration to the resulting wic image starting
	   at sector 512 up to sizeof(core.img).
	3. Both boot.img and core.img are required for legacy
	   bios boot. See grub Wiki for more details on
	   boot.img and core.img.

	   https://en.wikipedia.org/wiki/GNU_GRUB

Commit also imports python modules required by the
above implemented functions.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index a4fabec0ae..f50a5ae0e2 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -13,7 +13,9 @@
 import logging
 import os
 import re
+import shutil
 
+from glob import glob
 from wic import WicError
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
@@ -72,6 +74,27 @@ class BootimgPcbiosPlugin(SourcePlugin):
         cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
                                  kernel_dir, native_sysroot)
 
+    @classmethod
+    def _get_staging_libdir(cls):
+        """
+        For unknown reasons when running test with poky
+        STAGING_LIBDIR gets unset when wic create is executed.
+        Bellow is a hack to determine what STAGING_LIBDIR should
+        be if not specified.
+        """
+
+        staging_libdir = get_bitbake_var('STAGING_LIBDIR')
+        staging_dir_target = get_bitbake_var('STAGING_DIR_TARGET')
+
+        if not staging_libdir:
+            staging_libdir = '%s/usr/lib64' % staging_dir_target
+            if not os.path.isdir(staging_libdir):
+                staging_libdir = '%s/usr/lib32' % staging_dir_target
+                if not os.path.isdir(staging_libdir):
+                    staging_libdir = '%s/usr/lib' % staging_dir_target
+
+        return staging_libdir
+
     @classmethod
     def _get_bootloader_config(cls, bootloader, loader):
         custom_cfg = None
@@ -243,3 +266,147 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
         exec_cmd(dd_cmd, native_sysroot)
+
+    @classmethod
+    def _do_configure_grub(cls, part, creator, cr_workdir):
+        hdddir = "%s/hdd" % cr_workdir
+        bootloader = creator.ks.bootloader
+
+        grub_conf = cls._get_bootloader_config(bootloader, 'grub')
+
+        grub_prefix_path = get_bitbake_var('GRUB_PREFIX_PATH')
+        if not grub_prefix_path:
+            grub_prefix_path = '/boot/grub'
+
+        grub_path = "%s/%s" %(hdddir, grub_prefix_path)
+        install_cmd = "install -d %s" % grub_path
+        exec_cmd(install_cmd)
+
+        if not grub_conf:
+            # Set a default timeout if none specified to avoid
+            # 'None' being the value placed within the configuration
+            # file.
+            if not bootloader.timeout:
+                bootloader.timeout = 500
+
+            # Set a default kernel params string if none specified
+            # to avoid 'None' being the value placed within the
+            # configuration file.
+            if not bootloader.append:
+                bootloader.append = "rootwait rootfstype=%s " % (part.fstype)
+                bootloader.append += "console=ttyS0,115200 console=tty0"
+
+            kernel = "/boot/" + get_bitbake_var("KERNEL_IMAGETYPE")
+
+            grub_conf = 'serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n'
+            grub_conf += 'set gfxmode=auto\n'
+            grub_conf += 'set gfxpayload=keep\n\n'
+            grub_conf += 'set default=0\n\n'
+            grub_conf += '# Boot automatically after %d secs.\n' % (bootloader.timeout)
+            grub_conf += 'set timeout=%d\n\n' % (bootloader.timeout)
+            grub_conf += 'menuentry \'default\' {\n'
+            grub_conf += '\tsearch --no-floppy --set=root --file %s\n' % (kernel)
+            grub_conf += '\tprobe --set partuuid --part-uuid ($root)\n'
+            grub_conf += '\tlinux %s root=PARTUUID=$partuuid %s\n}\n' % \
+                            (kernel, bootloader.append)
+
+        logger.debug("Writing grub config %s/grub.cfg", grub_path)
+        cfg = open("%s/grub.cfg" % grub_path, "w")
+        cfg.write(grub_conf)
+        cfg.close()
+
+    @classmethod
+    def _do_prepare_grub(cls, part, cr_workdir, oe_builddir,
+                         kernel_dir, rootfs_dir, native_sysroot):
+        """
+        1. Generate embed.cfg that'll later be embedded into core.img.
+           So, that core.img knows where to search for grub.cfg.
+        2. Generate core.img or grub stage 1.5.
+        3. Copy modules into partition.
+        4. Create partition rootfs file.
+        """
+
+        hdddir = "%s/hdd" % cr_workdir
+
+        copy_types = [ '*.mod', '*.o', '*.lst' ]
+
+        builtin_modules = 'boot linux ext2 fat serial part_msdos part_gpt \
+        normal multiboot probe biosdisk msdospart configfile search loadenv test'
+
+        staging_libdir = cls._get_staging_libdir()
+
+        grub_format = get_bitbake_var('GRUB_MKIMAGE_FORMAT_PC')
+        if not grub_format:
+            grub_format = 'i386-pc'
+
+        grub_prefix_path = get_bitbake_var('GRUB_PREFIX_PATH')
+        if not grub_prefix_path:
+            grub_prefix_path = '/boot/grub'
+
+        grub_path = "%s/%s" %(hdddir, grub_prefix_path)
+        core_img = '%s/grub-bios-core.img' % (kernel_dir)
+        grub_mods_path = '%s/grub/%s' % (staging_libdir, grub_format)
+
+        # Generate embedded grub config
+        embed_cfg_str = 'search.file %s/grub.cfg root\n' % (grub_prefix_path)
+        embed_cfg_str += 'set prefix=($root)%s\n' % (grub_prefix_path)
+        embed_cfg_str += 'configfile ($root)%s/grub.cfg\n' % (grub_prefix_path)
+        cfg = open('%s/embed.cfg' % (kernel_dir), 'w+')
+        cfg.write(embed_cfg_str)
+        cfg.close()
+
+        # core.img doesn't get included into boot partition
+        # it's later dd onto the resulting wic image.
+        grub_mkimage = 'grub-mkimage \
+        --prefix=%s \
+        --format=%s \
+        --config=%s/embed.cfg \
+        --directory=%s \
+        --output=%s %s' % \
+        (grub_prefix_path, grub_format, kernel_dir,
+         grub_mods_path, core_img, builtin_modules)
+        exec_native_cmd(grub_mkimage, native_sysroot)
+
+        # Copy grub modules
+        install_dir = '%s/%s/%s' % (hdddir, grub_prefix_path, grub_format)
+        os.makedirs(install_dir, exist_ok=True)
+
+        for ctype in copy_types:
+            files = glob('%s/grub/%s/%s' % \
+                (staging_libdir, grub_format, ctype))
+            for file in files:
+                shutil.copy2(file, install_dir, follow_symlinks=True)
+
+        # Create boot partition
+        logger.debug('Prepare partition using rootfs in %s', hdddir)
+        part.prepare_rootfs(cr_workdir, oe_builddir, hdddir,
+                            native_sysroot, False)
+
+    @classmethod
+    def _do_install_grub(cls, creator, kernel_dir,
+                         native_sysroot, full_path):
+        core_img = '%s/grub-bios-core.img' % (kernel_dir)
+
+        staging_libdir = cls._get_staging_libdir()
+
+        grub_format = get_bitbake_var('GRUB_MKIMAGE_FORMAT_PC')
+        if not grub_format:
+            grub_format = 'i386-pc'
+
+        boot_img = '%s/grub/%s/boot.img' % (staging_libdir, grub_format)
+        if not os.path.exists(boot_img):
+            raise WicError("Couldn't find %s. Did you include "
+                           "do_image_wic[depends] += \"grub:do_populate_sysroot\" "
+                           "in your image recipe" % boot_img)
+
+        # Install boot.img or grub stage 1
+        dd_cmd = "dd if=%s of=%s conv=notrunc bs=1 seek=0 count=440" % (boot_img, full_path)
+        exec_cmd(dd_cmd, native_sysroot)
+
+        if creator.ptable_format == 'msdos':
+            # Install core.img or grub stage 1.5
+            dd_cmd = "dd if=%s of=%s conv=notrunc bs=1 seek=512" % (core_img, full_path)
+            exec_cmd(dd_cmd, native_sysroot)
+        else:
+            raise WicError("Unsupported partition table: %s" %
+                           creator.ptable_format)
-- 
2.43.0


