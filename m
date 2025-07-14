Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F51C83F1D
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 02:09:17 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.69397.1752458950111049919
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jul 2025 19:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=aMUk5ZbL;
 spf=pass (domain: underview.tech, ip: 209.85.160.176, mailfrom: vince@underview.tech)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ab554fd8fbso14550841cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 19:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1752458949; x=1753063749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=85+l5ZFyAcYRtNyzSn+ZrPiHvnl3oT0mlimeu7lGLjs=;
        b=aMUk5ZbLkIXjpGTnlSV7CDvNgEZvU+pjyFaO4HVUDL4LYFzZ8LNDPKFyrN0bTruR8I
         x5DhvEgPVOkGcuE26SDGIlHw7eGwVq3i5zQ/PkICEI6p7Yi2LqsbkUHlwN2IPcd6BVez
         jJbwrWkwJOfM9D83urkK239pueTWqAvhZtFfrglAHqS5lSAPGaG2f7IjinP15h64GOpV
         ngnNg2MJJfCFVtMqcLfQ7HmvCLTxZhAsB0Ux6leTwYwB+wXt6db09dK0l5NuBudq4vDV
         4e1NlUmgBe0fDbOHmhHuDGhG0CoWalLHwgm8mHK5oUroNcdJAlMzO7maGantBjkvNr3g
         M9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752458949; x=1753063749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85+l5ZFyAcYRtNyzSn+ZrPiHvnl3oT0mlimeu7lGLjs=;
        b=nyb2hyTOYwGSXy2IzhyfyQzVfZNoCGgWmOmuOcFl0RubFqboRdBoNUvMyOZAOnngd1
         6Ppx43TyKOQotPOL27v0vB8KZ+0MEgR9aeVFs5wJ74Znra6IUaMg/y8tKRkeTTUNCzlJ
         pV5FBqP/VZRZYt/283zKdfzL0IED83DgLbgoBvjO5AM9gZjTDNpsBQD/Ms9vHXh9MItO
         U749wre5976LX9jrKrSPR63U4MXIu+LEcbnqVCSqhjZY6UlvAhMo9OFMZyQNp0HSao0r
         TwjfHnWRNjCA0VPoUgMWMv/PHcSUMrXra2FYjzqbc7yoWvJLKHZPQAfBTIeDocXZnaGT
         f1HQ==
X-Gm-Message-State: AOJu0YxIlIp3QhJ107jUKG2yCJK3doym9UxV56c0EmbRkwVnLLF18D7U
	d+QaQdKRteQdCMAf0JgtxhwEZhQhn1nYCFc/coxA8Ev3R1TcyCtu1mJoajKpSjM1FJTkX0O6o3b
	94mNY
X-Gm-Gg: ASbGnctq4WsMDLsMt6ADrz9A+4QlIIyyzYR75whpG6l0ZzTBfcaFomJ5YgiLWBPq1io
	sZAGO3LXmgmvdEroDwAbraXzbYPD3xVQUQ0VP8wthPiaA2DULTkzAGmOah+KvWxRRFKOkbT55jC
	2VrTF0k9dWz34qTWONYhTuKzijZZFxaQP6603Ec7jQCGZI3QI0ncT1RxTBnkBoDidxsreUEaC2E
	OiV6ei/gc0Z7GLkCILgJBLMVN8F089UgSkzSc2D1dHuxIuYkFA81oo52msxH9IaF539zh670dqA
	IILEbFeN71aoZJccdexmoBxJaKHLnT9kGW4gBFX3wsIKEqSKrORWKKvxdXhSiF2868ExMTvA7af
	+nq3klondCU4=
X-Google-Smtp-Source: AGHT+IEoRDVQrtxYgMaimqfipO2o2+bCqApcqdnizMSMambQe26EuD/AeC4m0QnMA9Ci4x+dMEZKfA==
X-Received: by 2002:a05:622a:4a88:b0:4ab:6011:fbc4 with SMTP id d75a77b69052e-4ab60120e64mr79242591cf.22.1752458948457;
        Sun, 13 Jul 2025 19:09:08 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::b05c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9ede76d33sm44919091cf.51.2025.07.13.19.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 19:09:08 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] grub_install: add new wics plugin
Date: Sun, 13 Jul 2025 22:09:00 -0400
Message-ID: <20250714020900.1240597-1-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 02:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220209

Plugin supports installing grub for both
GPT and MBR based partition table formats.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/grub_install.py    | 388 ++++++++++++++++++
 1 file changed, 388 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/grub_install.py

diff --git a/scripts/lib/wic/plugins/source/grub_install.py b/scripts/lib/wic/plugins/source/grub_install.py
new file mode 100644
index 0000000000..85233217f0
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/grub_install.py
@@ -0,0 +1,388 @@
+#
+# Copyright 2025, Underview
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# DESCRIPTION
+# This implements the 'grub_install' source plugin class for 'wic'
+# Searches for most files in deploy directory of a given MACHINE.
+#
+# AUTHORS
+# Vincent Davis Jr <vince (at] underview.tech>
+
+import glob
+import logging
+import sys
+import os
+import re
+import shutil
+
+from wic import WicError
+from wic.engine import get_custom_config
+from wic.partition import Partition
+from wic.pluginbase import SourcePlugin
+from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
+
+logger = logging.getLogger('wic')
+handler = logging.StreamHandler(stream=sys.stdout)
+logger.addHandler(handler)
+logger.setLevel(logging.DEBUG)
+
+class GrubInstall(SourcePlugin):
+
+    """
+    Create a bootable wic image with grub as the bootloader.
+
+    This plugin populates the output wic image with necessary grub boot
+    files, installs boot.img and core.img. Enables caller to boot off
+    of either legacy bios or UEFI firmware or both with the disk partition
+    table format being either GPT or MBR based.
+
+    ****************** Wic Plugin Depends/Vars ******************
+    do_image_wic[depends] += "\
+        grub-native:do_populate_sysroot \
+        grub:do_populate_sysroot \
+        grub-efi:do_populate_sysroot \
+        "
+
+    # Optional variables
+    GRUB_PREFIX_PATH = '/boot/grub2'
+    GRUB_MKIMAGE_FORMAT_PC = 'i386-pc'
+    GRUB_MKIMAGE_FORMAT_EFI = 'x86_64-efi'
+    GRUB_CONFIG_PATH = "${DEPLOY_DIR_IMAGE}/grub.cfg"
+    GRUB_MODULES_EFI = "all"
+
+    WICVARS:append = "\
+        GRUB_CONFIG_PATH \
+        GRUB_PREFIX_PATH \
+        GRUB_MODULES_EFI \
+        GRUB_MKIMAGE_FORMAT_PC \
+        GRUB_MKIMAGE_FORMAT_EFI \
+        "
+    ****************** Wic Plugin Depends/Vars ******************
+
+
+    ********************** Example kickstart Legacy Bios Boot **********************
+    part bios_boot  --label bios_boot  --fstype ext4 --offset 1024 --fixed-size 78M
+                    --source grub_install --sourceparams="boot_type=bios"
+
+    part roots --label rootfs --fstype ext4 --source rootfs
+    bootloader --ptable msdos --source grub_install
+    ********************** Example kickstart Legacy Bios Boot **********************
+
+
+    ************************* Example kickstart UEFI Boot *************************
+    part uefi_boot --label uefi_boot --fstype vfat --offset 1024 --fixed-size 78M
+                   --part-type C12A7328-F81F-11D2-BA4B-00A0C93EC93B
+                   --source grub_install --sourceparams="boot_type=uefi"
+
+    part roots --label rootfs --fstype ext4 --source rootfs
+    bootloader --ptable gpt --source grub_install
+    ************************* Example kickstart UEFI Boot *************************
+
+
+    *********** Example kickstart Hybrid Legacy Bios Or Newer UEFI Boot ***********
+    part bios_boot  --label bios_boot --fstype none --offset 1024 --fixed-size 1M
+                    --part-type 21686148-6449-6E6F-744E-656564454649
+                    --source grub_install --sourceparams="boot_type=hybrid-bios"
+
+    part efi_system --label efi_system --fstype vfat --fixed-size 48M
+                    --part-type C12A7328-F81F-11D2-BA4B-00A0C93EC93B
+                    --source grub_install --sourceparams="boot_type=hybrid-uefi"
+
+    part grub_data  --label grub_data --fstype ext4 --fixed-size 78M
+                    --part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+                    --source grub_install --sourceparams="boot_type=modules"
+
+    part roots      --label rootfs --fstype ext4 --source rootfs
+                    --part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+
+    bootloader --ptable gpt --source grub_install
+    *********** Example kickstart Hybrid Legacy Bios Or Newer UEFI Boot ***********
+    """
+
+    name = 'grub_install'
+
+    grub_cfg = ''
+    boot_type = ''
+    grub_formats = []
+    grub_format_pc = ''
+    grub_format_efi = ''
+    staging_libdir = ''
+    grub_prefix_path = ''
+
+    @staticmethod
+    def gen_embed_grub_cfg(kernel_dir, grub_prefix_path):
+        """
+        Create grub config that'll later be embedded
+        into core.img. So, that core.img knows where
+        to search for grub.cfg.
+        """
+
+        embed_cfg_str = 'search.file %s/grub.cfg root\n' % (grub_prefix_path)
+        embed_cfg_str += 'set prefix=($root)%s\n' % (grub_prefix_path)
+        embed_cfg_str += 'configfile ($root)%s/grub.cfg\n' % (grub_prefix_path)
+        with open('%s/embed.cfg' % (kernel_dir), 'w+') as f:
+            f.write(embed_cfg_str)
+
+    @classmethod
+    def gen_core_img_pc(cls, kernel_dir, native_sysroot,
+                        mkimage_format, grub_prefix_path):
+        """
+        Generate core.img or grub stage 1.5
+        """
+
+        builtin_modules = 'boot linux ext2 fat serial part_msdos part_gpt \
+        normal multiboot probe biosdisk msdospart configfile search loadenv test'
+
+        if not mkimage_format:
+            mkimage_format = 'i386-pc'
+
+        core_img = '%s/grub-bios-core.img' % (kernel_dir)
+        grub_mods_path = '%s/grub/%s' % (cls.staging_libdir, mkimage_format)
+
+        grub_mkimage = 'grub-mkimage \
+        --prefix=%s \
+        --format=%s \
+        --config=%s/embed.cfg \
+        --directory=%s \
+        --output=%s %s' % \
+        (grub_prefix_path, mkimage_format, kernel_dir,
+         grub_mods_path, core_img, builtin_modules)
+
+        exec_native_cmd(grub_mkimage, native_sysroot)
+
+        cls.grub_format_pc = mkimage_format
+        Partition.core_img = core_img
+        cls.grub_formats.append(mkimage_format)
+
+    @classmethod
+    def gen_core_img_efi(cls, kernel_dir, native_sysroot, mkimage_format,
+                         grub_prefix_path, grub_modules_efi):
+        """
+        Generate core.img or grub UEFI application
+        that contains the embedded grub config.
+
+        This is subject to change as OE-core grub-efi
+        recipes generates core.img. May be able to
+        leverage that work in the future.
+        """
+
+        builtin_modules = 'boot linux ext2 fat serial part_msdos part_gpt \
+        normal multiboot probe efi_gop iso9660 configfile search loadenv test'
+
+        if not mkimage_format:
+            mkimage_format = 'x86_64-efi'
+
+        core_img = '%s/grub-efi-boot.efi' % (kernel_dir)
+        grub_mods_path = '%s/grub/%s' % (cls.staging_libdir, mkimage_format)
+
+        if grub_modules_efi:
+            if grub_modules_efi == 'all':
+                builtin_modules = ''
+                files = glob.glob('%s/*.mod' % (grub_mods_path))
+                for file in files:
+                    builtin_modules += '%s ' % os.path.basename(file).removesuffix('.mod')
+            else:
+                builtin_modules = grub_modules_efi
+
+        logger.debug('builtin_modules = %s' % (builtin_modules))
+
+        grub_mkimage = 'grub-mkimage \
+        --prefix=%s \
+        --format=%s \
+        --config=%s/embed.cfg \
+        --directory=%s \
+        --output=%s %s' % \
+        (grub_prefix_path, mkimage_format, kernel_dir,
+         grub_mods_path, core_img, builtin_modules)
+
+        exec_native_cmd(grub_mkimage, native_sysroot)
+
+        cls.grub_format_efi = mkimage_format
+        cls.grub_formats.append(mkimage_format)
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition(), creates loader-specific config
+        """
+
+        boot_types = ['bios', 'uefi', 'hybrid-bios', 'hybrid-uefi', 'modules']
+
+        boot_type = source_params['boot_type']
+
+        cls.staging_libdir = get_bitbake_var('STAGING_LIBDIR')
+
+        # Optional variables
+        grub_cfg = get_bitbake_var('GRUB_CONFIG_PATH')
+        grub_modules_efi = get_bitbake_var('GRUB_MODULES_EFI')
+        grub_prefix_path = get_bitbake_var('GRUB_PREFIX_PATH')
+        mkimage_format_pc = get_bitbake_var('GRUB_MKIMAGE_FORMAT_PC')
+        mkimage_format_efi = get_bitbake_var('GRUB_MKIMAGE_FORMAT_EFI')
+
+        if not grub_cfg:
+            grub_cfg = creator.ks.bootloader.configfile
+        if not grub_prefix_path:
+            grub_prefix_path = '/boot/grub'
+
+        if not source_params['boot_type'] in boot_types:
+            raise WicError("grub_install requires a boot_type per partition.\n" \
+                           "Examples: %s" % (boot_types))
+
+        # Grub config copied in do_prepare_partition()
+        if not os.path.isfile(grub_cfg):
+            raise WicError("grub_install requires a grub config\n" \
+                           "Examples:\nset GRUB_CONFIG_PATH\n" \
+                           "bootloader --configfile in wks file")
+
+        cls.boot_type = boot_type
+        cls.grub_cfg = grub_cfg
+        cls.grub_prefix_path = grub_prefix_path
+
+        cls.gen_embed_grub_cfg(kernel_dir, grub_prefix_path)
+        cls.gen_core_img_pc(kernel_dir, native_sysroot,
+                            mkimage_format_pc, grub_prefix_path)
+        cls.gen_core_img_efi(kernel_dir, native_sysroot,
+                             mkimage_format_pc, grub_prefix_path,
+                             grub_modules_efi)
+
+    @classmethod
+    def install_grub_cfg(cls, wdir):
+        boot_types = ['uefi', 'bios', 'modules']
+
+        if cls.boot_type in boot_types:
+            install_dir = '%s/%s' % (wdir, cls.grub_prefix_path)
+            os.makedirs(install_dir, exist_ok=True)
+            shutil.copy2(cls.grub_cfg, install_dir, follow_symlinks=True)
+
+    @classmethod
+    def handle_install_grub_mods(cls, wdir, grub_format):
+        copy_types = [ '*.mod', '*.o', '*.lst' ]
+
+        install_dir = '%s/%s/%s' % (wdir, cls.grub_prefix_path, grub_format)
+        os.makedirs(install_dir, exist_ok=True)
+
+        for ctype in copy_types:
+            files = glob.glob('%s/grub/%s/%s' % \
+                (cls.staging_libdir, grub_format, ctype))
+            for file in files:
+                shutil.copy2(file, install_dir, follow_symlinks=True)
+
+    @classmethod
+    def install_grub_modules(cls, wdir):
+        boot_types = ['bios', 'uefi']
+
+        if cls.boot_type == 'modules':
+            for grub_format in cls.grub_formats:
+                cls.handle_install_grub_mods(wdir, grub_format)
+        elif cls.boot_type == 'bios':
+            cls.handle_install_grub_mods(wdir, cls.grub_format_pc)
+        elif cls.boot_type == 'uefi':
+            cls.handle_install_grub_mods(wdir, cls.grub_format_efi)
+
+    @classmethod
+    def install_core_img_efi(cls, kernel_dir, wdir):
+        boot_types = ['uefi', 'hybrid-uefi']
+
+        format_types = {
+            'x86_64-efi' : 'BOOTX64.EFI',
+            'ia64-efi'   : 'BOOTIA64.EFI',
+            'arm-efi'    : 'BOOTARM.EFI',
+            'arm64-efi'  : 'BOOTAA64.EFI',
+        }
+
+        if not cls.grub_format_efi in format_types:
+            raise WicError('Unsupported GRUB_MKIMAGE_FORMAT_EFI selected.')
+
+        if cls.boot_type in boot_types:
+            install_dir = '%s/EFI/BOOT' % (wdir)
+            grub_efi_app = '%s/grub-efi-boot.efi' % (kernel_dir)
+            install_file = '%s/%s' % (install_dir, format_types[cls.grub_format_efi])
+
+            os.makedirs(install_dir, exist_ok=True)
+            shutil.copy2(grub_efi_app, install_file, follow_symlinks=True)
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        """
+
+        wdir = "%s/wdir" % cr_workdir
+        if os.path.exists(wdir):
+            shutil.rmtree(wdir)
+
+        cls.install_grub_cfg(wdir)
+        cls.install_grub_modules(wdir)
+        cls.install_core_img_efi(kernel_dir, wdir)
+
+        logger.debug('Prepare partition using rootfs in %s', wdir)
+        part.prepare_rootfs(cr_workdir, oe_builddir, wdir,
+                            native_sysroot, False)
+
+    @classmethod
+    def do_install_boot_img(cls, native_sysroot, wic_image):
+        hybrid_boot_types = ['hybrid-bios', 'modules']
+        boot_types = ['bios', 'hybrid-bios', 'modules']
+        grub_path = '%s/grub/%s' % (cls.staging_libdir, cls.grub_format_pc)
+        boot_img = '%s/boot.img' % (grub_path)
+
+        if cls.boot_type in boot_types:
+            dd_cmd = 'dd if=%s of=%s conv=notrunc bs=1 seek=0 count=440' % (boot_img, wic_image)
+            exec_native_cmd(dd_cmd, native_sysroot)
+
+        # Replicates what grub-install does to core.img
+        # when GPT based partition table format is leveraged.
+        if cls.boot_type in hybrid_boot_types:
+            dd_cmd = "echo -ne '\\x00\\x08' | dd of=%s conv=notrunc bs=1 count=2 seek=92" % (wic_image)
+            exec_native_cmd(dd_cmd, native_sysroot)
+
+            dd_cmd = "echo -ne '\\x90\\x90' | dd of=%s conv=notrunc bs=1 count=2 seek=102" % (wic_image)
+            exec_native_cmd(dd_cmd, native_sysroot)
+
+    @classmethod
+    def do_install_core_img(cls, kernel_dir, native_sysroot, wic_image):
+        core_img = '%s/grub-bios-core.img' % (kernel_dir)
+
+        if cls.boot_type == 'bios':
+            dd_cmd = 'dd if=%s of=%s conv=notrunc bs=1 seek=512' % (core_img, wic_image)
+            exec_native_cmd(dd_cmd, native_sysroot)
+
+    @classmethod
+    def do_install_disk(cls, disk, disk_name, creator, cr_workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.  In this case, we insert/modify the MBR using isohybrid
+        utility for booting via BIOS from disk storage devices.
+        """
+
+        wic_image = creator._full_path(cr_workdir, disk_name, "direct")
+        cls.do_install_boot_img(native_sysroot, wic_image)
+        cls.do_install_core_img(kernel_dir, native_sysroot, wic_image)
+
+# As this change is specific to the 'grub_install'
+# wics plugin no need to modify partition.py
+def install_core_img_pc(self, rootfs, cr_workdir, oe_builddir,
+                        rootfs_dir, native_sysroot, pseudo):
+    if not os.path.isfile(self.core_img):
+        raise WicError("core.img not built %s" % (self.core_img))
+
+    shutil.copy2(self.core_img, rootfs, follow_symlinks=True)
+
+    # Replicates what grub-install does to core.img
+    # when GPT based partition table format is leveraged.
+    dd_cmd = "echo -ne '\\x01\\x08' | dd of=%s conv=notrunc bs=1 count=2 seek=500" % (rootfs)
+    exec_native_cmd(dd_cmd, native_sysroot)
+
+    dd_cmd = "echo -ne '\\x2f\\x02' | dd of=%s conv=notrunc bs=1 count=2 seek=508" % (rootfs)
+    exec_native_cmd(dd_cmd, native_sysroot)
+
+Partition.core_img = ''
+Partition.prepare_rootfs_none = install_core_img_pc
-- 
2.43.0


