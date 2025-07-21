Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E441C83F22
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 01:10:49 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.29978.1753060244536285953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 18:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=UtfbWBzT;
 spf=pass (domain: underview.tech, ip: 209.85.160.170, mailfrom: vince@underview.tech)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ab60e97cf8so52115801cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 18:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1753060243; x=1753665043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wePrwbWpDe/3VHFKUy9ZVcNKoCPFegsrOKZJh1k1xgI=;
        b=UtfbWBzTN0IPif/bElHHIsFBjumMmtXzU4MPAk9GQUz7vp6FgPT380wApMKBkiwgai
         z0qmZGDPc7qIi92vnSgC/YuxcC7pbDQ377hEsjj3gWKnn9HEbXk6BfqBZstAdFU+84uC
         DNZ96unICy6aPXEXH4fqQ+XVeTdcBuXdARVHCzddL8gdmDzwfbiPtuPyrQJBenchDpzj
         UfqppI2fi/GIspLx083NqTvODjlvhKmARbURJwz1hMc6+xXiV1zc0aNyjAzz/n12ytYm
         uUQpv7VO1Jrze+RNMsHP3bWCPwDis18Vm3PcXEY0KzV2n5wsJ1GAodB2U54r4NN1swYR
         PwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753060243; x=1753665043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wePrwbWpDe/3VHFKUy9ZVcNKoCPFegsrOKZJh1k1xgI=;
        b=i1a+Yo3ZYTmHVIpiGLEJUy0Mp87R6ilEZzEKO6ZqK0dGzTRSMmYsd0EGmsBFTZD+Qa
         JwSN6/WNbAChFi+bYWInU/rYH0u5eghGkQVv+Ej2LjzqpEzx42Hljo5fDkzyujVJ3Yrf
         FQC3leTwSH8IOAMMseMBRTC8iTVjAAbGuuTeFjm3D2aYi3ESW7IFenQZDAgVSuG//hUF
         nKOiptIlW91TT8jXqW2m+EOC5Yf9zGA8htB3526pRt87tj3jiyfHwo2fXOjbf+i03Hg4
         r+gXcW9unL6BxCnSLknkVJK02gXGQDQsU8eCMiAo3AEnOmRUP0PHvgGQtmg/b9CNrYpb
         gB1A==
X-Gm-Message-State: AOJu0YxuaY31KWkFEJyDRi4osdDbkHpUTBGAFw2CBZDRxJsH6PPOT62F
	jz1EZJGK63HeUiG2WDZ4rCDS+YbiTWvUPoUNyjJ37pzVCiHGldC4BQYIO47boh/utfxbv73XFoe
	K46/T
X-Gm-Gg: ASbGnctwNnAQMk/nQR5D2/AWws9kES/VsSzte+do7+G03xdMXxfrzeWk43CQt4cp4X9
	ZBVKVmJCQetAyr8eioUpFx4FQKtYx285DR/Bhf4QoIQQI4Dgc00PUPQ77fCy86PPDbsxPAbu8x/
	zHOcjOm2NxZQ2E616x3ZmZwDsVbPEO5smz4fO9ZQ6YBYYzf65MRqIq8AWnjCSZgez//gH1Oop37
	GEZBxSwED3zAkuavjM97k4/UYsYS+YCWLZRRQIlue8lJirhm3j2u8vlEO5rdAums55dxg97ubV0
	xF9kvv2E1D2hWWm5oyYQ115+D3UzwWFVIyzRXpGlhCiaj74D8drwYsXVq1bNhMGsXAcc1nD+oBh
	tJiP0dTFXTtw=
X-Google-Smtp-Source: AGHT+IFeeRHCIBsEhIphBTLwdVcQZoHxm8C9/nYDDm6TLwwDk7bP7JIgDTqTFEtucNefzd1LSJIiLA==
X-Received: by 2002:a05:6214:2124:b0:6fa:fea5:4da0 with SMTP id 6a1803df08f44-704f6a4768dmr338611066d6.10.1753060242699;
        Sun, 20 Jul 2025 18:10:42 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::b05c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba9270csm33855256d6.86.2025.07.20.18.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:10:42 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 1/3] bootimg_pcbios: support grub legacy bios boot
Date: Sun, 20 Jul 2025 21:09:37 -0400
Message-ID: <20250721010939.3561904-1-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220642

Due to the bootimg_biosplusefi source_params['loader']
had to be named source_params['loader-bios'] so not
to create conflict in the wics plugin.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 355 +++++++++++++++---
 1 file changed, 296 insertions(+), 59 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 21f41e00bb..97687edc71 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -1,5 +1,5 @@
 #
-# Copyright (c) 2014, Intel Corporation.
+# Copyright (c) 2014-2025, Intel Corporation.
 #
 # SPDX-License-Identifier: GPL-2.0-only
 #
@@ -8,12 +8,15 @@
 #
 # AUTHORS
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
+# Vincent Davis <vince (at] underview.tech>
 #
 
 import logging
 import os
 import re
+import shutil
 
+from glob import glob
 from wic import WicError
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
@@ -24,11 +27,52 @@ logger = logging.getLogger('wic')
 
 class BootimgPcbiosPlugin(SourcePlugin):
     """
-    Create MBR boot partition and install syslinux on it.
+    Creates boot partition bootable off of legacy BIOS firmare with
+    MBR/MSDOS as partition table format. Plugin will install caller
+    selected bootloader directly to resulting wic image.
+
+    Supported Bootloaders:
+        * syslinux
+        * grub
+
+    ****************** Wic Plugin Depends/Vars ******************
+    WKS_FILE_DEPENDS = "grub-native grub"
+    WKS_FILE_DEPENDS = "syslinux-native syslinux"
+
+    # Optional variables
+    GRUB_PREFIX_PATH = '/boot/grub2'    # Default: /boot/grub
+    GRUB_MKIMAGE_FORMAT_PC = 'i386-pc'  # Default: i386-pc
+
+    WICVARS:append = "\
+        GRUB_PREFIX_PATH \
+        GRUB_MKIMAGE_FORMAT_PC \
+        "
+    ****************** Wic Plugin Depends/Vars ******************
+
+
+    **************** Example kickstart Legacy Bios Grub Boot ****************
+    part boot --label bios_boot --fstype ext4 --offset 1024 --fixed-size 78M
+              --source bootimg_pcbios --sourceparams="loader-bios=grub" --active
+
+    part roots --label rootfs --fstype ext4 --source rootfs --use-uuid
+    bootloader --ptable msdos --source bootimg_pcbios
+    **************** Example kickstart Legacy Bios Grub Boot ****************
+
+
+    *************** Example kickstart Legacy Bios Syslinux Boot ****************
+    part /boot --source bootimg_pcbios --sourceparams="loader-bios=syslinux"
+               --ondisk sda --label boot --active --align 1024
+
+    part roots --label rootfs --fstype ext4 --source rootfs --use-uuid
+    bootloader --ptable msdos --source bootimg_pcbios
+    *************** Example kickstart Legacy Bios Syslinux Boot ****************
     """
 
     name = 'bootimg_pcbios'
 
+    # Variable required for do_install_disk
+    loader = ''
+
     @classmethod
     def _get_bootimg_dir(cls, bootimg_dir, dirname):
         """
@@ -48,63 +92,73 @@ class BootimgPcbiosPlugin(SourcePlugin):
         raise WicError("Couldn't find correct bootimg_dir, exiting")
 
     @classmethod
-    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
-                        bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Called after all partitions have been prepared and assembled into a
-        disk image.  In this case, we install the MBR.
-        """
-        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
-        mbrfile = "%s/syslinux/" % bootimg_dir
-        if creator.ptable_format == 'msdos':
-            mbrfile += "mbr.bin"
-        elif creator.ptable_format == 'gpt':
-            mbrfile += "gptmbr.bin"
-        else:
-            raise WicError("Unsupported partition table: %s" %
-                           creator.ptable_format)
-
-        if not os.path.exists(mbrfile):
-            raise WicError("Couldn't find %s.  If using the -e option, do you "
-                           "have the right MACHINE set in local.conf?  If not, "
-                           "is the bootimg_dir path correct?" % mbrfile)
-
-        full_path = creator._full_path(workdir, disk_name, "direct")
-        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
-                     disk_name, full_path, disk.min_size)
-
-        dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
-        exec_cmd(dd_cmd, native_sysroot)
-
-    @classmethod
-    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
-                               oe_builddir, bootimg_dir, kernel_dir,
-                               native_sysroot):
-        """
-        Called before do_prepare_partition(), creates syslinux config
-        """
-        hdddir = "%s/hdd/boot" % cr_workdir
-
-        install_cmd = "install -d %s" % hdddir
-        exec_cmd(install_cmd)
-
+    def _get_bootloader_config(cls, creator, loader):
+        custom_cfg = None
         bootloader = creator.ks.bootloader
 
-        custom_cfg = None
         if bootloader.configfile:
             custom_cfg = get_custom_config(bootloader.configfile)
             if custom_cfg:
-                # Use a custom configuration for grub
-                syslinux_conf = custom_cfg
                 logger.debug("Using custom configuration file %s "
-                             "for syslinux.cfg", bootloader.configfile)
+                             "for %s.cfg", bootloader.configfile,
+                             loader)
+                return custom_cfg
             else:
                 raise WicError("configfile is specified but failed to "
                                "get it from %s." % bootloader.configfile)
+        return custom_cfg
+
+    @classmethod
+    def _do_configure_grub_cfg(cls, creator, cr_workdir):
+        hdddir = "%s/hdd" % cr_workdir
+        bootloader = creator.ks.bootloader
+
+        grub_cfg = cls._get_bootloader_config(creator, 'grub')
+
+        grub_prefix_path = get_bitbake_var('GRUB_PREFIX_PATH')
+        if not grub_prefix_path:
+            grub_prefix_path = '/boot/grub'
+
+        grub_path = "%s/%s" %(hdddir, grub_prefix_path)
+        install_cmd = "install -d %s" % grub_path
+        exec_cmd(install_cmd)
+
+        if not grub_cfg:
+            grub_conf = 'serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n'
+            grub_conf += 'set gfxmode=auto\n'
+            grub_conf += 'set gfxpayload=keep\n\n'
+            grub_conf += 'set default=0\n\n'
+            grub_conf += '# Boot automatically after 500 secs.\n'
+            grub_conf += 'set timeout=500\n\n'
+            grub_conf += 'menuentry \'rootfs\' {\n'
+            grub_conf += '\tsearch --no-floppy --set=root --label rootfs\n'
+            grub_conf += '\tprobe --set partuuid --part-uuid ($root)\n'
+
+            kernel = "/boot/" + get_bitbake_var("KERNEL_IMAGETYPE")
+            grub_conf += '\tlinux %s root=PARTUUID=$partuuid %s\n}\n' % \
+                    (kernel, bootloader.append if bootloader.append else '')
+
+            logger.debug("Writing grub config %s/grub.cfg", grub_path)
+            cfg = open("%s/grub.cfg" % grub_path, "w")
+            cfg.write(grub_conf)
+            cfg.close()
+        else:
+            logger.debug("Copying grub config to %s/grub.cfg", grub_path)
+            shutil.copy2(grub_cfg, "%s/grub.cfg" % grub_path)
+
+    @classmethod
+    def _do_configure_syslinux_cfg(cls, creator, cr_workdir, bootimg_dir):
+        hdddir = "%s/hdd/boot" % cr_workdir
+        bootloader = creator.ks.bootloader
 
-        if not custom_cfg:
+        syslinux_cfg = cls._get_bootloader_config(creator, 'syslinux')
+
+        install_cmd = "install -d %s" % hdddir
+        exec_cmd(install_cmd)
+
+        if not syslinux_cfg:
             # Create syslinux configuration using parameters from wks file
-            splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
+            splash = os.path.join(hdddir, "/splash.jpg")
             if os.path.exists(splash):
                 splashline = "menu background splash.jpg"
             else:
@@ -128,21 +182,103 @@ class BootimgPcbiosPlugin(SourcePlugin):
             syslinux_conf += "APPEND label=boot root=%s %s\n" % \
                              (creator.rootdev, bootloader.append)
 
-        logger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg",
-                     cr_workdir)
-        cfg = open("%s/hdd/boot/syslinux.cfg" % cr_workdir, "w")
-        cfg.write(syslinux_conf)
-        cfg.close()
+            logger.debug("Writing syslinux config %s/syslinux.cfg", hdddir)
+            cfg = open("%s/syslinux.cfg" % hdddir, "w")
+            cfg.write(syslinux_conf)
+            cfg.close()
+        else:
+            logger.debug("Copying syslinux config to %s/syslinux.cfg", hdddir)
+            shutil.copy2(syslinux_cfg, "%s/syslinux.cfg" % hdddir)
 
     @classmethod
-    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
         """
-        Called to do the actual content population for a partition i.e. it
-        'prepares' the partition to be incorporated into the image.
-        In this case, prepare content for legacy bios boot partition.
+        Called before do_prepare_partition(), creates syslinux config
+        """
+
+        try:
+            if source_params['loader-bios'] == 'grub':
+                cls._do_configure_grub_cfg(creator, cr_workdir)
+            elif source_params['loader-bios'] == 'syslinux':
+                cls._do_configure_syslinux_cfg(creator, cr_workdir, bootimg_dir)
+            else:
+                raise WicError("unrecognized bootimg_pcbios loader: %s" % source_params['loader-bios'])
+        except KeyError:
+            raise WicError("bootimg_pcbios requires a loader, none specified")
+
+    @classmethod
+    def _do_prepare_grub(cls, part, cr_workdir, oe_builddir,
+                         kernel_dir, rootfs_dir, native_sysroot):
         """
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
+        staging_libdir = get_bitbake_var('STAGING_LIBDIR')
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
+    def _do_prepare_syslinux(cls, part, cr_workdir, oe_builddir,
+                             bootimg_dir, kernel_dir, native_sysroot):
+
         bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
 
         staging_kernel_dir = kernel_dir
@@ -207,3 +343,104 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         part.size = int(bootimg_size)
         part.source_file = bootimg
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, prepare content for legacy bios boot partition.
+        """
+
+        loader = ''
+
+        try:
+            if source_params['loader-bios'] == 'grub':
+                cls._do_prepare_grub(part, cr_workdir, oe_builddir,
+                        kernel_dir, rootfs_dir, native_sysroot)
+            elif source_params['loader-bios'] == 'syslinux':
+                cls._do_prepare_syslinux(part, cr_workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot)
+            else:
+                raise WicError("unrecognized bootimg_pcbios loader: %s" % source_params['loader-bios'])
+
+            loader = source_params['loader-bios']
+        except KeyError:
+            raise WicError("bootimg_pcbios requires a loader, none specified")
+
+        # Required by do_install_disk
+        cls.loader = loader
+
+    @classmethod
+    def _do_install_grub(cls, creator, kernel_dir,
+                         native_sysroot, full_path):
+        core_img = '%s/grub-bios-core.img' % (kernel_dir)
+
+        staging_libdir = get_bitbake_var('STAGING_LIBDIR')
+
+        grub_format = get_bitbake_var('GRUB_MKIMAGE_FORMAT_PC')
+        if not grub_format:
+            grub_format = 'i386-pc'
+
+        boot_img = '%s/grub/%s/boot.img' %(staging_libdir, grub_format)
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
+        elif creator.ptable_format == 'gpt':
+            logger.debug('Update core.img stored on bios boot partition')
+        else:
+            raise WicError("Unsupported partition table: %s" %
+                           creator.ptable_format)
+
+    @classmethod
+    def _do_install_syslinux(cls, creator, bootimg_dir,
+                             native_sysroot, full_path):
+
+        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
+
+        mbrfile = "%s/syslinux/" % bootimg_dir
+        if creator.ptable_format == 'msdos':
+            mbrfile += "mbr.bin"
+        elif creator.ptable_format == 'gpt':
+            mbrfile += "gptmbr.bin"
+        else:
+            raise WicError("Unsupported partition table: %s" %
+                           creator.ptable_format)
+
+        if not os.path.exists(mbrfile):
+            raise WicError("Couldn't find %s.  If using the -e option, do you "
+                           "have the right MACHINE set in local.conf?  If not, "
+                           "is the bootimg_dir path correct?" % mbrfile)
+
+        dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
+        exec_cmd(dd_cmd, native_sysroot)
+
+    @classmethod
+    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.  In this case, we install the MBR.
+        """
+        full_path = creator._full_path(workdir, disk_name, "direct")
+        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
+                     disk_name, full_path, disk.min_size)
+
+        if cls.loader == 'grub':
+            cls._do_install_grub(creator, kernel_dir,
+                        native_sysroot, full_path)
+        elif cls.loader == 'syslinux':
+            cls._do_install_syslinux(creator, bootimg_dir,
+                             native_sysroot, full_path)
-- 
2.43.0


