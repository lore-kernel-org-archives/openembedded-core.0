Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EF3C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 13:34:02 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.78232.1752500034840257249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 06:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G+3F9pJT;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-701046cfeefso64799146d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752500034; x=1753104834; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h3lB7kSHP9uIyv5BOHCPhiVEpQo8VFEH+3laxXiWJHo=;
        b=G+3F9pJTSziwjaI6kPB+lsHuiaNvKL6LcYlVzuKu/j/6ez7c4TPeVt1KBVMITGa2Sx
         hW+ppX5z1K+7KQGkTlTRBT/xC4smmjEIczYHh4dQzKzNteLpkx5Ag71mC2CEdZ2uFGue
         4V7fAbqux92Xo42/CoXtmRDy1Jz7Eix1c11CR+zowx0GFtyE16MwOinW7XpXx4bLzKlq
         VogIZR3ve74uZ5mDTuU1fsGh4ArHqLsTa+9FClM8FTAHpTg6YQ/hJQJoqlsuFNPoVUFF
         kHVuStf0bs+eBiG0LG/Jnp2KyImDreyC13s1u0aZfuRVQyoJH+M0vqh7K0n8hnMXWvRK
         cITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500034; x=1753104834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3lB7kSHP9uIyv5BOHCPhiVEpQo8VFEH+3laxXiWJHo=;
        b=QI09c0H+EJPs5XCamT4UOclpVMyAbkO1uJUM+1A0PPAhmuXVuh9qba6LUrdFas5XB3
         CsrhK858ohfaqhoF5CI+85GeoT01OgOlY/i3TBu5mcq32neNRorteSUx8ry7TXd2sy8J
         3Niq8NJ+pfIFSeLyT3yB5hGq9UlbE8OO7vaGBZzUWEhZY7H4ZtzOf8zogcdIAoXjcqhM
         Jope5Plb3w3jsTqwft2LZi5C71AvYEPq5QMXV7FtUTSgrBkAlsSh/wnaU3hQ8YKy2chv
         eaencOCi/NgyDFbmCHxNqi/I2odYGDnooPu6t2SNewAsnamo4v3QzdgRhHxY28u2hJxK
         C0sQ==
X-Gm-Message-State: AOJu0YyCvRv2Zn8jQLViRjpHNwCB0woEiMk4K0xmq+Kn7eikFa7lLKwt
	Ux0/1ToQ74bzCl9XAEYECNAuiQpHngfmDJgM7s3W6LRQRRlA6b4NpgT8jOtPfECqeWGJoV7BYxn
	9gDiUGLGBvlINnpAkpQzccKreWz6EZrk=
X-Gm-Gg: ASbGncsZQB47QLirxiujYjCdRR9xMXsGpZyDdikQoKp5HwuqfgoBr++nf2ip5a/fJOJ
	XLI9NGxuoVRk2zUTII099xKvq5PldmIEQuc9wsSu/p4/kq1sMMxFnawRQZkV3s68OeMvUwKsdq0
	i1CPscYGqW3f42fCnZofrtGcKJPRey+mGoSojQagkI2QwvuIA7xRE0qzHbvSu21Pnp7hwVddoSR
	F4xojINhKtKQ4Ob6w1phQk2PG0M5NW88wFEJ8VET9dI7sFviP4=
X-Google-Smtp-Source: AGHT+IGAQeeTFrpsamJaXqEasxCcGTCgfGyRce5bWKs1zcvQp0GgArTW0Gxq078/SwuttrRJaETd1s4x6EN2mc2YcnQ=
X-Received: by 2002:ad4:5b82:0:b0:6fd:3a4d:363a with SMTP id
 6a1803df08f44-704a359027fmr236635866d6.25.1752500033481; Mon, 14 Jul 2025
 06:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250714020900.1240597-1-vince@underview.tech>
In-Reply-To: <20250714020900.1240597-1-vince@underview.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Jul 2025 15:33:40 +0200
X-Gm-Features: Ac12FXxlgRSUBr0bJUqLGwgRvCAbEZkD3oMd7ExtyQMzZJjge9TzrxUcJ_mHeKw
Message-ID: <CANNYZj_xp7_QMttJ3cjRnfErXoKvuQ-SR4kErQMu_XvAGPdHoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub_install: add new wics plugin
To: vince@underview.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 13:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220232

This is a lot of code, but there is no detailed explanation of what
the plugin is for, how it works, and there are no examples or tests
either.

In particular, how is it different from existing bootimg plugins which
are also using grub?

Alex


On Mon, 14 Jul 2025 at 04:09, Vincent Davis Jr via
lists.openembedded.org <vince=underview.tech@lists.openembedded.org>
wrote:
>
> Plugin supports installing grub for both
> GPT and MBR based partition table formats.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  .../lib/wic/plugins/source/grub_install.py    | 388 ++++++++++++++++++
>  1 file changed, 388 insertions(+)
>  create mode 100644 scripts/lib/wic/plugins/source/grub_install.py
>
> diff --git a/scripts/lib/wic/plugins/source/grub_install.py b/scripts/lib/wic/plugins/source/grub_install.py
> new file mode 100644
> index 0000000000..85233217f0
> --- /dev/null
> +++ b/scripts/lib/wic/plugins/source/grub_install.py
> @@ -0,0 +1,388 @@
> +#
> +# Copyright 2025, Underview
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# DESCRIPTION
> +# This implements the 'grub_install' source plugin class for 'wic'
> +# Searches for most files in deploy directory of a given MACHINE.
> +#
> +# AUTHORS
> +# Vincent Davis Jr <vince (at] underview.tech>
> +
> +import glob
> +import logging
> +import sys
> +import os
> +import re
> +import shutil
> +
> +from wic import WicError
> +from wic.engine import get_custom_config
> +from wic.partition import Partition
> +from wic.pluginbase import SourcePlugin
> +from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
> +
> +logger = logging.getLogger('wic')
> +handler = logging.StreamHandler(stream=sys.stdout)
> +logger.addHandler(handler)
> +logger.setLevel(logging.DEBUG)
> +
> +class GrubInstall(SourcePlugin):
> +
> +    """
> +    Create a bootable wic image with grub as the bootloader.
> +
> +    This plugin populates the output wic image with necessary grub boot
> +    files, installs boot.img and core.img. Enables caller to boot off
> +    of either legacy bios or UEFI firmware or both with the disk partition
> +    table format being either GPT or MBR based.
> +
> +    ****************** Wic Plugin Depends/Vars ******************
> +    do_image_wic[depends] += "\
> +        grub-native:do_populate_sysroot \
> +        grub:do_populate_sysroot \
> +        grub-efi:do_populate_sysroot \
> +        "
> +
> +    # Optional variables
> +    GRUB_PREFIX_PATH = '/boot/grub2'
> +    GRUB_MKIMAGE_FORMAT_PC = 'i386-pc'
> +    GRUB_MKIMAGE_FORMAT_EFI = 'x86_64-efi'
> +    GRUB_CONFIG_PATH = "${DEPLOY_DIR_IMAGE}/grub.cfg"
> +    GRUB_MODULES_EFI = "all"
> +
> +    WICVARS:append = "\
> +        GRUB_CONFIG_PATH \
> +        GRUB_PREFIX_PATH \
> +        GRUB_MODULES_EFI \
> +        GRUB_MKIMAGE_FORMAT_PC \
> +        GRUB_MKIMAGE_FORMAT_EFI \
> +        "
> +    ****************** Wic Plugin Depends/Vars ******************
> +
> +
> +    ********************** Example kickstart Legacy Bios Boot **********************
> +    part bios_boot  --label bios_boot  --fstype ext4 --offset 1024 --fixed-size 78M
> +                    --source grub_install --sourceparams="boot_type=bios"
> +
> +    part roots --label rootfs --fstype ext4 --source rootfs
> +    bootloader --ptable msdos --source grub_install
> +    ********************** Example kickstart Legacy Bios Boot **********************
> +
> +
> +    ************************* Example kickstart UEFI Boot *************************
> +    part uefi_boot --label uefi_boot --fstype vfat --offset 1024 --fixed-size 78M
> +                   --part-type C12A7328-F81F-11D2-BA4B-00A0C93EC93B
> +                   --source grub_install --sourceparams="boot_type=uefi"
> +
> +    part roots --label rootfs --fstype ext4 --source rootfs
> +    bootloader --ptable gpt --source grub_install
> +    ************************* Example kickstart UEFI Boot *************************
> +
> +
> +    *********** Example kickstart Hybrid Legacy Bios Or Newer UEFI Boot ***********
> +    part bios_boot  --label bios_boot --fstype none --offset 1024 --fixed-size 1M
> +                    --part-type 21686148-6449-6E6F-744E-656564454649
> +                    --source grub_install --sourceparams="boot_type=hybrid-bios"
> +
> +    part efi_system --label efi_system --fstype vfat --fixed-size 48M
> +                    --part-type C12A7328-F81F-11D2-BA4B-00A0C93EC93B
> +                    --source grub_install --sourceparams="boot_type=hybrid-uefi"
> +
> +    part grub_data  --label grub_data --fstype ext4 --fixed-size 78M
> +                    --part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4
> +                    --source grub_install --sourceparams="boot_type=modules"
> +
> +    part roots      --label rootfs --fstype ext4 --source rootfs
> +                    --part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4
> +
> +    bootloader --ptable gpt --source grub_install
> +    *********** Example kickstart Hybrid Legacy Bios Or Newer UEFI Boot ***********
> +    """
> +
> +    name = 'grub_install'
> +
> +    grub_cfg = ''
> +    boot_type = ''
> +    grub_formats = []
> +    grub_format_pc = ''
> +    grub_format_efi = ''
> +    staging_libdir = ''
> +    grub_prefix_path = ''
> +
> +    @staticmethod
> +    def gen_embed_grub_cfg(kernel_dir, grub_prefix_path):
> +        """
> +        Create grub config that'll later be embedded
> +        into core.img. So, that core.img knows where
> +        to search for grub.cfg.
> +        """
> +
> +        embed_cfg_str = 'search.file %s/grub.cfg root\n' % (grub_prefix_path)
> +        embed_cfg_str += 'set prefix=($root)%s\n' % (grub_prefix_path)
> +        embed_cfg_str += 'configfile ($root)%s/grub.cfg\n' % (grub_prefix_path)
> +        with open('%s/embed.cfg' % (kernel_dir), 'w+') as f:
> +            f.write(embed_cfg_str)
> +
> +    @classmethod
> +    def gen_core_img_pc(cls, kernel_dir, native_sysroot,
> +                        mkimage_format, grub_prefix_path):
> +        """
> +        Generate core.img or grub stage 1.5
> +        """
> +
> +        builtin_modules = 'boot linux ext2 fat serial part_msdos part_gpt \
> +        normal multiboot probe biosdisk msdospart configfile search loadenv test'
> +
> +        if not mkimage_format:
> +            mkimage_format = 'i386-pc'
> +
> +        core_img = '%s/grub-bios-core.img' % (kernel_dir)
> +        grub_mods_path = '%s/grub/%s' % (cls.staging_libdir, mkimage_format)
> +
> +        grub_mkimage = 'grub-mkimage \
> +        --prefix=%s \
> +        --format=%s \
> +        --config=%s/embed.cfg \
> +        --directory=%s \
> +        --output=%s %s' % \
> +        (grub_prefix_path, mkimage_format, kernel_dir,
> +         grub_mods_path, core_img, builtin_modules)
> +
> +        exec_native_cmd(grub_mkimage, native_sysroot)
> +
> +        cls.grub_format_pc = mkimage_format
> +        Partition.core_img = core_img
> +        cls.grub_formats.append(mkimage_format)
> +
> +    @classmethod
> +    def gen_core_img_efi(cls, kernel_dir, native_sysroot, mkimage_format,
> +                         grub_prefix_path, grub_modules_efi):
> +        """
> +        Generate core.img or grub UEFI application
> +        that contains the embedded grub config.
> +
> +        This is subject to change as OE-core grub-efi
> +        recipes generates core.img. May be able to
> +        leverage that work in the future.
> +        """
> +
> +        builtin_modules = 'boot linux ext2 fat serial part_msdos part_gpt \
> +        normal multiboot probe efi_gop iso9660 configfile search loadenv test'
> +
> +        if not mkimage_format:
> +            mkimage_format = 'x86_64-efi'
> +
> +        core_img = '%s/grub-efi-boot.efi' % (kernel_dir)
> +        grub_mods_path = '%s/grub/%s' % (cls.staging_libdir, mkimage_format)
> +
> +        if grub_modules_efi:
> +            if grub_modules_efi == 'all':
> +                builtin_modules = ''
> +                files = glob.glob('%s/*.mod' % (grub_mods_path))
> +                for file in files:
> +                    builtin_modules += '%s ' % os.path.basename(file).removesuffix('.mod')
> +            else:
> +                builtin_modules = grub_modules_efi
> +
> +        logger.debug('builtin_modules = %s' % (builtin_modules))
> +
> +        grub_mkimage = 'grub-mkimage \
> +        --prefix=%s \
> +        --format=%s \
> +        --config=%s/embed.cfg \
> +        --directory=%s \
> +        --output=%s %s' % \
> +        (grub_prefix_path, mkimage_format, kernel_dir,
> +         grub_mods_path, core_img, builtin_modules)
> +
> +        exec_native_cmd(grub_mkimage, native_sysroot)
> +
> +        cls.grub_format_efi = mkimage_format
> +        cls.grub_formats.append(mkimage_format)
> +
> +    @classmethod
> +    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
> +                               oe_builddir, bootimg_dir, kernel_dir,
> +                               native_sysroot):
> +        """
> +        Called before do_prepare_partition(), creates loader-specific config
> +        """
> +
> +        boot_types = ['bios', 'uefi', 'hybrid-bios', 'hybrid-uefi', 'modules']
> +
> +        boot_type = source_params['boot_type']
> +
> +        cls.staging_libdir = get_bitbake_var('STAGING_LIBDIR')
> +
> +        # Optional variables
> +        grub_cfg = get_bitbake_var('GRUB_CONFIG_PATH')
> +        grub_modules_efi = get_bitbake_var('GRUB_MODULES_EFI')
> +        grub_prefix_path = get_bitbake_var('GRUB_PREFIX_PATH')
> +        mkimage_format_pc = get_bitbake_var('GRUB_MKIMAGE_FORMAT_PC')
> +        mkimage_format_efi = get_bitbake_var('GRUB_MKIMAGE_FORMAT_EFI')
> +
> +        if not grub_cfg:
> +            grub_cfg = creator.ks.bootloader.configfile
> +        if not grub_prefix_path:
> +            grub_prefix_path = '/boot/grub'
> +
> +        if not source_params['boot_type'] in boot_types:
> +            raise WicError("grub_install requires a boot_type per partition.\n" \
> +                           "Examples: %s" % (boot_types))
> +
> +        # Grub config copied in do_prepare_partition()
> +        if not os.path.isfile(grub_cfg):
> +            raise WicError("grub_install requires a grub config\n" \
> +                           "Examples:\nset GRUB_CONFIG_PATH\n" \
> +                           "bootloader --configfile in wks file")
> +
> +        cls.boot_type = boot_type
> +        cls.grub_cfg = grub_cfg
> +        cls.grub_prefix_path = grub_prefix_path
> +
> +        cls.gen_embed_grub_cfg(kernel_dir, grub_prefix_path)
> +        cls.gen_core_img_pc(kernel_dir, native_sysroot,
> +                            mkimage_format_pc, grub_prefix_path)
> +        cls.gen_core_img_efi(kernel_dir, native_sysroot,
> +                             mkimage_format_pc, grub_prefix_path,
> +                             grub_modules_efi)
> +
> +    @classmethod
> +    def install_grub_cfg(cls, wdir):
> +        boot_types = ['uefi', 'bios', 'modules']
> +
> +        if cls.boot_type in boot_types:
> +            install_dir = '%s/%s' % (wdir, cls.grub_prefix_path)
> +            os.makedirs(install_dir, exist_ok=True)
> +            shutil.copy2(cls.grub_cfg, install_dir, follow_symlinks=True)
> +
> +    @classmethod
> +    def handle_install_grub_mods(cls, wdir, grub_format):
> +        copy_types = [ '*.mod', '*.o', '*.lst' ]
> +
> +        install_dir = '%s/%s/%s' % (wdir, cls.grub_prefix_path, grub_format)
> +        os.makedirs(install_dir, exist_ok=True)
> +
> +        for ctype in copy_types:
> +            files = glob.glob('%s/grub/%s/%s' % \
> +                (cls.staging_libdir, grub_format, ctype))
> +            for file in files:
> +                shutil.copy2(file, install_dir, follow_symlinks=True)
> +
> +    @classmethod
> +    def install_grub_modules(cls, wdir):
> +        boot_types = ['bios', 'uefi']
> +
> +        if cls.boot_type == 'modules':
> +            for grub_format in cls.grub_formats:
> +                cls.handle_install_grub_mods(wdir, grub_format)
> +        elif cls.boot_type == 'bios':
> +            cls.handle_install_grub_mods(wdir, cls.grub_format_pc)
> +        elif cls.boot_type == 'uefi':
> +            cls.handle_install_grub_mods(wdir, cls.grub_format_efi)
> +
> +    @classmethod
> +    def install_core_img_efi(cls, kernel_dir, wdir):
> +        boot_types = ['uefi', 'hybrid-uefi']
> +
> +        format_types = {
> +            'x86_64-efi' : 'BOOTX64.EFI',
> +            'ia64-efi'   : 'BOOTIA64.EFI',
> +            'arm-efi'    : 'BOOTARM.EFI',
> +            'arm64-efi'  : 'BOOTAA64.EFI',
> +        }
> +
> +        if not cls.grub_format_efi in format_types:
> +            raise WicError('Unsupported GRUB_MKIMAGE_FORMAT_EFI selected.')
> +
> +        if cls.boot_type in boot_types:
> +            install_dir = '%s/EFI/BOOT' % (wdir)
> +            grub_efi_app = '%s/grub-efi-boot.efi' % (kernel_dir)
> +            install_file = '%s/%s' % (install_dir, format_types[cls.grub_format_efi])
> +
> +            os.makedirs(install_dir, exist_ok=True)
> +            shutil.copy2(grub_efi_app, install_file, follow_symlinks=True)
> +
> +    @classmethod
> +    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
> +                             oe_builddir, bootimg_dir, kernel_dir,
> +                             rootfs_dir, native_sysroot):
> +        """
> +        Called to do the actual content population for a partition i.e. it
> +        'prepares' the partition to be incorporated into the image.
> +        """
> +
> +        wdir = "%s/wdir" % cr_workdir
> +        if os.path.exists(wdir):
> +            shutil.rmtree(wdir)
> +
> +        cls.install_grub_cfg(wdir)
> +        cls.install_grub_modules(wdir)
> +        cls.install_core_img_efi(kernel_dir, wdir)
> +
> +        logger.debug('Prepare partition using rootfs in %s', wdir)
> +        part.prepare_rootfs(cr_workdir, oe_builddir, wdir,
> +                            native_sysroot, False)
> +
> +    @classmethod
> +    def do_install_boot_img(cls, native_sysroot, wic_image):
> +        hybrid_boot_types = ['hybrid-bios', 'modules']
> +        boot_types = ['bios', 'hybrid-bios', 'modules']
> +        grub_path = '%s/grub/%s' % (cls.staging_libdir, cls.grub_format_pc)
> +        boot_img = '%s/boot.img' % (grub_path)
> +
> +        if cls.boot_type in boot_types:
> +            dd_cmd = 'dd if=%s of=%s conv=notrunc bs=1 seek=0 count=440' % (boot_img, wic_image)
> +            exec_native_cmd(dd_cmd, native_sysroot)
> +
> +        # Replicates what grub-install does to core.img
> +        # when GPT based partition table format is leveraged.
> +        if cls.boot_type in hybrid_boot_types:
> +            dd_cmd = "echo -ne '\\x00\\x08' | dd of=%s conv=notrunc bs=1 count=2 seek=92" % (wic_image)
> +            exec_native_cmd(dd_cmd, native_sysroot)
> +
> +            dd_cmd = "echo -ne '\\x90\\x90' | dd of=%s conv=notrunc bs=1 count=2 seek=102" % (wic_image)
> +            exec_native_cmd(dd_cmd, native_sysroot)
> +
> +    @classmethod
> +    def do_install_core_img(cls, kernel_dir, native_sysroot, wic_image):
> +        core_img = '%s/grub-bios-core.img' % (kernel_dir)
> +
> +        if cls.boot_type == 'bios':
> +            dd_cmd = 'dd if=%s of=%s conv=notrunc bs=1 seek=512' % (core_img, wic_image)
> +            exec_native_cmd(dd_cmd, native_sysroot)
> +
> +    @classmethod
> +    def do_install_disk(cls, disk, disk_name, creator, cr_workdir, oe_builddir,
> +                        bootimg_dir, kernel_dir, native_sysroot):
> +        """
> +        Called after all partitions have been prepared and assembled into a
> +        disk image.  In this case, we insert/modify the MBR using isohybrid
> +        utility for booting via BIOS from disk storage devices.
> +        """
> +
> +        wic_image = creator._full_path(cr_workdir, disk_name, "direct")
> +        cls.do_install_boot_img(native_sysroot, wic_image)
> +        cls.do_install_core_img(kernel_dir, native_sysroot, wic_image)
> +
> +# As this change is specific to the 'grub_install'
> +# wics plugin no need to modify partition.py
> +def install_core_img_pc(self, rootfs, cr_workdir, oe_builddir,
> +                        rootfs_dir, native_sysroot, pseudo):
> +    if not os.path.isfile(self.core_img):
> +        raise WicError("core.img not built %s" % (self.core_img))
> +
> +    shutil.copy2(self.core_img, rootfs, follow_symlinks=True)
> +
> +    # Replicates what grub-install does to core.img
> +    # when GPT based partition table format is leveraged.
> +    dd_cmd = "echo -ne '\\x01\\x08' | dd of=%s conv=notrunc bs=1 count=2 seek=500" % (rootfs)
> +    exec_native_cmd(dd_cmd, native_sysroot)
> +
> +    dd_cmd = "echo -ne '\\x2f\\x02' | dd of=%s conv=notrunc bs=1 count=2 seek=508" % (rootfs)
> +    exec_native_cmd(dd_cmd, native_sysroot)
> +
> +Partition.core_img = ''
> +Partition.prepare_rootfs_none = install_core_img_pc
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220209): https://lists.openembedded.org/g/openembedded-core/message/220209
> Mute This Topic: https://lists.openembedded.org/mt/114141196/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

