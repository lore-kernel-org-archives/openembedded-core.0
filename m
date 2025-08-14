Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B355CCA0EE6
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 04:26:19 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.15477.1755145573672869345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 21:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=FqR3NSW3;
 spf=pass (domain: underview.tech, ip: 209.85.219.49, mailfrom: vince@underview.tech)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70a88db0bd8so6104096d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1755145572; x=1755750372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E53GO5l3Hd8eM4ap4AumPBduB+XTyY1FxcPASVl0VY4=;
        b=FqR3NSW3z9ppcDEKpRX3WtIO6ANrcU/fdLZ3XLRmT8D78WUW0T8VXEPx3ASXh/up2d
         gwsRvZ9Ahj7OAQy0mtHqf3gTu1iCvDlyXHIKLnDwDxQJZy2yPZcDIJ2joVVRBW6yeH7V
         oZ5uAFohtKtuIdg/DXuvJeN3EJrjE6Q/lghvb1GYPD/XxPjrMYb6gcOdWwsv8SYCszLB
         TeGxX6+mseqkhRNsxkJNHOOS1dMO2kAdYlrwXOfVVgvtYEJKCovd4VA0bczwtjk87z1j
         DhmQe4EV0Dro1Yk0o4u5cwPpIV4+7+sJPkxANjYh9nGnnEFtSZm+CpKmMcE3h4mZtsqi
         Trjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755145572; x=1755750372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E53GO5l3Hd8eM4ap4AumPBduB+XTyY1FxcPASVl0VY4=;
        b=Fd69fSIgNR02tWJ9igZF0tCCOtqhGaY2OPmnvsAiQBdcWcz+CI/RGJKvSkERHv5g79
         Qz5ZVf7pmlRu1PdtWhsrxWSp6Zi7SRqfNlgUVRHOrWs2CcRTAhxnzmmZxabH3J5b38Ar
         wOSZoWNeWx74KIdHBLq5mHeaFfmeRSA8Dbl6mplp//Kesm7UadyEI5HsTFNP71WGkubb
         xNpyy2rNl/Uroj4aU2U5o/QqptIBd05ABgGAsWVvjDucDxDiUVAyZDQ82/20xMdhsOZk
         iFY8Reo9pjPu1bLzLuHtTlEVwIrCmG9SBvHCGVJHlx31SPon11ZnMYIcHqRfiF5+Mv+M
         U4yw==
X-Gm-Message-State: AOJu0YxXR/sVrDUcy/R5H0OPkDzO04n1gAaaD52dQIMI+BzFhZRfz5bT
	eNJ4lI0UxkVOi7FYx6XtcS79VlHsg/a1ci3oDChQ7MYng9JCgVnLzuevOY/xn4i2n9gVupoQ2+A
	F/1d8l9E=
X-Gm-Gg: ASbGnctRzsmHlDWVWOtAaibOB3Y2hc+djeTj8LBVYQN+QiUiszO19kClM5XYuG4cLkt
	ORQNvXHsXfYLFoamb50o9N2m61f2TjvfRIHeCQnUT0fPZPMBg6RbAA6KCqy2FLve5EMdMQIx+AT
	2fXefnUaNdSRuwM+JpLJFrLMh+quPUl0aNINZ/KJeVtttFtRqXXmcjt5XbWn7M2XwgC8ouErfKo
	Z2crZ4J3z8QeaWUk8wPHtDim4uk1MUFad3W4JyiLznONYUuLesK9NfKRNZijxnhk4Q7aadppjUS
	q8VPjD87GXWc+mqaPfb7Bs+xrcI+3eY2FBZNaXQUAn8I1PGoEUeLmwaMl16X0jsxoYhHQ5OGG+a
	/XDB85gUAdmrs0P45jEAoU9fFHi6WrRIgk98Stim6+4CeHw==
X-Google-Smtp-Source: AGHT+IH5sYIJC2zXcg7kWdjdkwwmDo5LRxzkItT3X4bcGccUoZxMDcpvvqC+ZkSniSb9xdZpglQdpw==
X-Received: by 2002:ad4:5d41:0:b0:6fa:d956:243b with SMTP id 6a1803df08f44-70af5e95f6emr24878386d6.37.1755145572127;
        Wed, 13 Aug 2025 21:26:12 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:e358:dd1a:4ea0:986c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6cb6cc2sm8322816d6.22.2025.08.13.21.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:26:11 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v8 6/9] bootimg_pcbios: add funcs to configure booting with grub
Date: Thu, 14 Aug 2025 00:25:49 -0400
Message-Id: <20250814042552.21887-6-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814042552.21887-1-vince@underview.tech>
References: <20250814042552.21887-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221846

Functions added, but not executed during
wic image creation include:

_get_staging_libdir
	* Finds target lib directory if for some
	  reason STAGING_LIBDIR isn't set.

_do_configure_grub
	* Will search for a grub configuration passed via
	  bootloader --configfile. If not found build a
	  default one which searches for partition that
	  contains the given the kernel name via grub
	  search module.

_do_prepare_grub
	1. Sets default values for GRUB_MKIMAGE_FORMAT_PC
	   and GRUB_PREFIX_PATH if none specified. Both
	   variables are required by grub-mkimage.
	   * GRUB_MKIMAGE_FORMAT_PC is used to define
	     target platform.
	   * GRUB_PREFIX_PATH is used to define which
	     directory grub config and modules are going
	     to reside in.
	2. Generates grub config to embed into core.img.
	   This config is used to search for partition
	   containing grub config.
	3. Creates a custom core.img or grub stage 1.5
	   with an embedded grub config.
	4. Copies all the target built grub modules into
	   GRUB_PREFIX_PATH directory.
	5. Creates boot partition

_do_install_grub
	1. dd target platform specific boot.img to the first
	   0-440 bytes of the resulting wic image. dd grub
	   stage 1 to wic image. If this wics plugin is used
	   with GPT as partition table format and grub selected
	   as bootloader it's more than likely for grub hybrid
	   booting because bootimg_efi plugin should and more
	   than likely will be used in that case. So, boot.img
	   may be dd regardless if partition table format is
	   GPT or MBR.
	2. dd custom core.img (grub stage 1.5) with embedded
	   configuration to the resulting wic image starting
	   at byte 512 up to sizeof(core.img).
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
2.34.1


