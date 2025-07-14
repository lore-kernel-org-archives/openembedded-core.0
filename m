Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CED7C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 15:05:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.80400.1752505536884941865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 08:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Qc9mYYLX;
 spf=pass (domain: underview.tech, ip: 209.85.128.42, mailfrom: vince@underview.tech)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-455b002833bso9510225e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1752505535; x=1753110335; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WtbcA1pU3KyyJjTymP6SRVI7b56nlyI4XXWCkg/S/aY=;
        b=Qc9mYYLXV3VGcwKBURtJ453GyKXpSR2wqD7NTJ/TSLz0JRKMTFk3eEOLBaQviwqgkR
         GWCR7y0G5HtWCj2swphh+DbE+2QBlZa60XfV+f4UzOcTJcOsJWqZyN0G/gcZ/uKipxug
         WsMUBg8Y3LkOHeZ6NXzgj1iR0zjHPa5vkXS6NjoKRGVDQAYVULxwVcjFGfNnbAK/6m2u
         mcCeXGORcNnQ7lSvJLrOYqMqD5oPMCTDuLBDiqM4+G4kKqfRsVGop1LxWVFjQigm5ok5
         ERIGb07q4iW0tSnP7HmXKsNbFOl/I+rgQFg51JI+30Pc7gN0Ji98sGm22TXX8Gpo13KN
         9kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505535; x=1753110335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtbcA1pU3KyyJjTymP6SRVI7b56nlyI4XXWCkg/S/aY=;
        b=hAeSsZXv82DAqvDwpPU0Uimgpil8NGkf6SnhnpVXbnrwqQ0PaBUTlAWI/+aQblzQwW
         NEJezr1wxtn+3/Y+qjsXbn4WTQp+ZeTW5GgpzgP0/RDo0ygpcwdQI29Lwa/ITX1W386m
         rRHtOvf6Z19yoyLtyBI6ia2W0X4P/Z9brUZ5EGweL9pj6viKBpYX6Un9QFpQtOwOv1hI
         6PuesFPcninwzJyi9yvpGadbERtp9bW219GV6gtS9caaaBO8bqAaSJp93NuKUCLVqkLK
         Vzb+m9F2YZDRtqjjJsJjngAHZ97GYtzalIOn2TfAdVbmpdTaZPoCyChJ/0tZs+R07LXO
         qJAQ==
X-Gm-Message-State: AOJu0YwXKDGHnAiSsId7C0m01v/H7JtXlEPzpIkLvN41rY4np+YIgIvd
	FCw3lh0i4LJfcgu+10rZDiZ5Isg4h5ffn6M9TfIGHLNS4rXqUS/Mso8uVCvxc2zs4up42u8dgyY
	2x5PRuY1su9+lFverFcwxZtdsA+HVrJPrFVA5HUK+Cc05H4bu9Hbf
X-Gm-Gg: ASbGnctiJDc+bKfpdBCV2U2kT4ZdnyFaOevBlh0oOeCWNB0UaDnBexR/o2heK2mBO78
	GjsHAQNQnRT/iYfXq/3Y+xsesqUOMpxQ04JDUGgOkBqqmztKQgXK73EEWrGrw4m2iA48UToucwr
	H85Gon9YawCzCxwdeNRpilaEWEwWiTdaxoxYSWRy9y+FvFHiGWJdB4JHJfN//HF30rzf+RsOu9k
	dQb1NxHtKIXX10=
X-Google-Smtp-Source: AGHT+IFH5ZOjSl91VLo/M0e2vVyhEsGQe7qU2ddm6XSpICIT2PXlIx3dxRLjB+l8kQJhqFOM0eEtcYgXDjF/amP501Q=
X-Received: by 2002:a05:600c:4586:b0:456:1efa:8fe9 with SMTP id
 5b1f17b1804b1-4561efa930cmr28535695e9.2.1752505534541; Mon, 14 Jul 2025
 08:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250714020900.1240597-1-vince@underview.tech> <CANNYZj_xp7_QMttJ3cjRnfErXoKvuQ-SR4kErQMu_XvAGPdHoQ@mail.gmail.com>
In-Reply-To: <CANNYZj_xp7_QMttJ3cjRnfErXoKvuQ-SR4kErQMu_XvAGPdHoQ@mail.gmail.com>
From: Vincent Davis <vince@underview.tech>
Date: Mon, 14 Jul 2025 11:05:22 -0400
X-Gm-Features: Ac12FXyLYf25CS6H5zmHegc0tfBXxX6d6SVv0LplJ6b0NoogzSaiJi2xSiqrqgo
Message-ID: <CAPQx_gNG3kum-xKnbAazGxC8U7-2-M6mh+g6BbeRkDWVqK2nZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub_install: add new wics plugin
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000da86380639e4fd75"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 15:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220236

--000000000000da86380639e4fd75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Examples and usage may be found in comments under class declaration. Are
they sufficient?

Will add more comments and move example comments to top of file.

Per what I understand from GPT partition table format. If you want to
hybrid boot you have to create a separate bios_boot partition to store
core.img.

I haven't tested this, but it appears bootimg_biosplusefi.py only accounts
for MBR partition table format. grub_install accounts for both GPT and MBR.
Hybrid or non-hybrid boot.

On Mon, Jul 14, 2025, 9:33=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmail=
.com>
wrote:

> This is a lot of code, but there is no detailed explanation of what
> the plugin is for, how it works, and there are no examples or tests
> either.
>
> In particular, how is it different from existing bootimg plugins which
> are also using grub?
>
> Alex
>
>
> On Mon, 14 Jul 2025 at 04:09, Vincent Davis Jr via
> lists.openembedded.org <vince=3Dunderview.tech@lists.openembedded.org>
> wrote:
> >
> > Plugin supports installing grub for both
> > GPT and MBR based partition table formats.
> >
> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> > ---
> >  .../lib/wic/plugins/source/grub_install.py    | 388 ++++++++++++++++++
> >  1 file changed, 388 insertions(+)
> >  create mode 100644 scripts/lib/wic/plugins/source/grub_install.py
> >
> > diff --git a/scripts/lib/wic/plugins/source/grub_install.py
> b/scripts/lib/wic/plugins/source/grub_install.py
> > new file mode 100644
> > index 0000000000..85233217f0
> > --- /dev/null
> > +++ b/scripts/lib/wic/plugins/source/grub_install.py
> > @@ -0,0 +1,388 @@
> > +#
> > +# Copyright 2025, Underview
> > +#
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# DESCRIPTION
> > +# This implements the 'grub_install' source plugin class for 'wic'
> > +# Searches for most files in deploy directory of a given MACHINE.
> > +#
> > +# AUTHORS
> > +# Vincent Davis Jr <vince (at] underview.tech>
> > +
> > +import glob
> > +import logging
> > +import sys
> > +import os
> > +import re
> > +import shutil
> > +
> > +from wic import WicError
> > +from wic.engine import get_custom_config
> > +from wic.partition import Partition
> > +from wic.pluginbase import SourcePlugin
> > +from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
> > +
> > +logger =3D logging.getLogger('wic')
> > +handler =3D logging.StreamHandler(stream=3Dsys.stdout)
> > +logger.addHandler(handler)
> > +logger.setLevel(logging.DEBUG)
> > +
> > +class GrubInstall(SourcePlugin):
> > +
> > +    """
> > +    Create a bootable wic image with grub as the bootloader.
> > +
> > +    This plugin populates the output wic image with necessary grub boo=
t
> > +    files, installs boot.img and core.img. Enables caller to boot off
> > +    of either legacy bios or UEFI firmware or both with the disk
> partition
> > +    table format being either GPT or MBR based.
> > +
> > +    ****************** Wic Plugin Depends/Vars ******************
> > +    do_image_wic[depends] +=3D "\
> > +        grub-native:do_populate_sysroot \
> > +        grub:do_populate_sysroot \
> > +        grub-efi:do_populate_sysroot \
> > +        "
> > +
> > +    # Optional variables
> > +    GRUB_PREFIX_PATH =3D '/boot/grub2'
> > +    GRUB_MKIMAGE_FORMAT_PC =3D 'i386-pc'
> > +    GRUB_MKIMAGE_FORMAT_EFI =3D 'x86_64-efi'
> > +    GRUB_CONFIG_PATH =3D "${DEPLOY_DIR_IMAGE}/grub.cfg"
> > +    GRUB_MODULES_EFI =3D "all"
> > +
> > +    WICVARS:append =3D "\
> > +        GRUB_CONFIG_PATH \
> > +        GRUB_PREFIX_PATH \
> > +        GRUB_MODULES_EFI \
> > +        GRUB_MKIMAGE_FORMAT_PC \
> > +        GRUB_MKIMAGE_FORMAT_EFI \
> > +        "
> > +    ****************** Wic Plugin Depends/Vars ******************
> > +
> > +
> > +    ********************** Example kickstart Legacy Bios Boot
> **********************
> > +    part bios_boot  --label bios_boot  --fstype ext4 --offset 1024
> --fixed-size 78M
> > +                    --source grub_install
> --sourceparams=3D"boot_type=3Dbios"
> > +
> > +    part roots --label rootfs --fstype ext4 --source rootfs
> > +    bootloader --ptable msdos --source grub_install
> > +    ********************** Example kickstart Legacy Bios Boot
> **********************
> > +
> > +
> > +    ************************* Example kickstart UEFI Boot
> *************************
> > +    part uefi_boot --label uefi_boot --fstype vfat --offset 1024
> --fixed-size 78M
> > +                   --part-type C12A7328-F81F-11D2-BA4B-00A0C93EC93B
> > +                   --source grub_install --sourceparams=3D"boot_type=
=3Duefi"
> > +
> > +    part roots --label rootfs --fstype ext4 --source rootfs
> > +    bootloader --ptable gpt --source grub_install
> > +    ************************* Example kickstart UEFI Boot
> *************************
> > +
> > +
> > +    *********** Example kickstart Hybrid Legacy Bios Or Newer UEFI Boo=
t
> ***********
> > +    part bios_boot  --label bios_boot --fstype none --offset 1024
> --fixed-size 1M
> > +                    --part-type 21686148-6449-6E6F-744E-656564454649
> > +                    --source grub_install
> --sourceparams=3D"boot_type=3Dhybrid-bios"
> > +
> > +    part efi_system --label efi_system --fstype vfat --fixed-size 48M
> > +                    --part-type C12A7328-F81F-11D2-BA4B-00A0C93EC93B
> > +                    --source grub_install
> --sourceparams=3D"boot_type=3Dhybrid-uefi"
> > +
> > +    part grub_data  --label grub_data --fstype ext4 --fixed-size 78M
> > +                    --part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4
> > +                    --source grub_install
> --sourceparams=3D"boot_type=3Dmodules"
> > +
> > +    part roots      --label rootfs --fstype ext4 --source rootfs
> > +                    --part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4
> > +
> > +    bootloader --ptable gpt --source grub_install
> > +    *********** Example kickstart Hybrid Legacy Bios Or Newer UEFI Boo=
t
> ***********
> > +    """
> > +
> > +    name =3D 'grub_install'
> > +
> > +    grub_cfg =3D ''
> > +    boot_type =3D ''
> > +    grub_formats =3D []
> > +    grub_format_pc =3D ''
> > +    grub_format_efi =3D ''
> > +    staging_libdir =3D ''
> > +    grub_prefix_path =3D ''
> > +
> > +    @staticmethod
> > +    def gen_embed_grub_cfg(kernel_dir, grub_prefix_path):
> > +        """
> > +        Create grub config that'll later be embedded
> > +        into core.img. So, that core.img knows where
> > +        to search for grub.cfg.
> > +        """
> > +
> > +        embed_cfg_str =3D 'search.file %s/grub.cfg root\n' %
> (grub_prefix_path)
> > +        embed_cfg_str +=3D 'set prefix=3D($root)%s\n' % (grub_prefix_p=
ath)
> > +        embed_cfg_str +=3D 'configfile ($root)%s/grub.cfg\n' %
> (grub_prefix_path)
> > +        with open('%s/embed.cfg' % (kernel_dir), 'w+') as f:
> > +            f.write(embed_cfg_str)
> > +
> > +    @classmethod
> > +    def gen_core_img_pc(cls, kernel_dir, native_sysroot,
> > +                        mkimage_format, grub_prefix_path):
> > +        """
> > +        Generate core.img or grub stage 1.5
> > +        """
> > +
> > +        builtin_modules =3D 'boot linux ext2 fat serial part_msdos
> part_gpt \
> > +        normal multiboot probe biosdisk msdospart configfile search
> loadenv test'
> > +
> > +        if not mkimage_format:
> > +            mkimage_format =3D 'i386-pc'
> > +
> > +        core_img =3D '%s/grub-bios-core.img' % (kernel_dir)
> > +        grub_mods_path =3D '%s/grub/%s' % (cls.staging_libdir,
> mkimage_format)
> > +
> > +        grub_mkimage =3D 'grub-mkimage \
> > +        --prefix=3D%s \
> > +        --format=3D%s \
> > +        --config=3D%s/embed.cfg \
> > +        --directory=3D%s \
> > +        --output=3D%s %s' % \
> > +        (grub_prefix_path, mkimage_format, kernel_dir,
> > +         grub_mods_path, core_img, builtin_modules)
> > +
> > +        exec_native_cmd(grub_mkimage, native_sysroot)
> > +
> > +        cls.grub_format_pc =3D mkimage_format
> > +        Partition.core_img =3D core_img
> > +        cls.grub_formats.append(mkimage_format)
> > +
> > +    @classmethod
> > +    def gen_core_img_efi(cls, kernel_dir, native_sysroot,
> mkimage_format,
> > +                         grub_prefix_path, grub_modules_efi):
> > +        """
> > +        Generate core.img or grub UEFI application
> > +        that contains the embedded grub config.
> > +
> > +        This is subject to change as OE-core grub-efi
> > +        recipes generates core.img. May be able to
> > +        leverage that work in the future.
> > +        """
> > +
> > +        builtin_modules =3D 'boot linux ext2 fat serial part_msdos
> part_gpt \
> > +        normal multiboot probe efi_gop iso9660 configfile search
> loadenv test'
> > +
> > +        if not mkimage_format:
> > +            mkimage_format =3D 'x86_64-efi'
> > +
> > +        core_img =3D '%s/grub-efi-boot.efi' % (kernel_dir)
> > +        grub_mods_path =3D '%s/grub/%s' % (cls.staging_libdir,
> mkimage_format)
> > +
> > +        if grub_modules_efi:
> > +            if grub_modules_efi =3D=3D 'all':
> > +                builtin_modules =3D ''
> > +                files =3D glob.glob('%s/*.mod' % (grub_mods_path))
> > +                for file in files:
> > +                    builtin_modules +=3D '%s ' %
> os.path.basename(file).removesuffix('.mod')
> > +            else:
> > +                builtin_modules =3D grub_modules_efi
> > +
> > +        logger.debug('builtin_modules =3D %s' % (builtin_modules))
> > +
> > +        grub_mkimage =3D 'grub-mkimage \
> > +        --prefix=3D%s \
> > +        --format=3D%s \
> > +        --config=3D%s/embed.cfg \
> > +        --directory=3D%s \
> > +        --output=3D%s %s' % \
> > +        (grub_prefix_path, mkimage_format, kernel_dir,
> > +         grub_mods_path, core_img, builtin_modules)
> > +
> > +        exec_native_cmd(grub_mkimage, native_sysroot)
> > +
> > +        cls.grub_format_efi =3D mkimage_format
> > +        cls.grub_formats.append(mkimage_format)
> > +
> > +    @classmethod
> > +    def do_configure_partition(cls, part, source_params, creator,
> cr_workdir,
> > +                               oe_builddir, bootimg_dir, kernel_dir,
> > +                               native_sysroot):
> > +        """
> > +        Called before do_prepare_partition(), creates loader-specific
> config
> > +        """
> > +
> > +        boot_types =3D ['bios', 'uefi', 'hybrid-bios', 'hybrid-uefi',
> 'modules']
> > +
> > +        boot_type =3D source_params['boot_type']
> > +
> > +        cls.staging_libdir =3D get_bitbake_var('STAGING_LIBDIR')
> > +
> > +        # Optional variables
> > +        grub_cfg =3D get_bitbake_var('GRUB_CONFIG_PATH')
> > +        grub_modules_efi =3D get_bitbake_var('GRUB_MODULES_EFI')
> > +        grub_prefix_path =3D get_bitbake_var('GRUB_PREFIX_PATH')
> > +        mkimage_format_pc =3D get_bitbake_var('GRUB_MKIMAGE_FORMAT_PC'=
)
> > +        mkimage_format_efi =3D get_bitbake_var('GRUB_MKIMAGE_FORMAT_EF=
I')
> > +
> > +        if not grub_cfg:
> > +            grub_cfg =3D creator.ks.bootloader.configfile
> > +        if not grub_prefix_path:
> > +            grub_prefix_path =3D '/boot/grub'
> > +
> > +        if not source_params['boot_type'] in boot_types:
> > +            raise WicError("grub_install requires a boot_type per
> partition.\n" \
> > +                           "Examples: %s" % (boot_types))
> > +
> > +        # Grub config copied in do_prepare_partition()
> > +        if not os.path.isfile(grub_cfg):
> > +            raise WicError("grub_install requires a grub config\n" \
> > +                           "Examples:\nset GRUB_CONFIG_PATH\n" \
> > +                           "bootloader --configfile in wks file")
> > +
> > +        cls.boot_type =3D boot_type
> > +        cls.grub_cfg =3D grub_cfg
> > +        cls.grub_prefix_path =3D grub_prefix_path
> > +
> > +        cls.gen_embed_grub_cfg(kernel_dir, grub_prefix_path)
> > +        cls.gen_core_img_pc(kernel_dir, native_sysroot,
> > +                            mkimage_format_pc, grub_prefix_path)
> > +        cls.gen_core_img_efi(kernel_dir, native_sysroot,
> > +                             mkimage_format_pc, grub_prefix_path,
> > +                             grub_modules_efi)
> > +
> > +    @classmethod
> > +    def install_grub_cfg(cls, wdir):
> > +        boot_types =3D ['uefi', 'bios', 'modules']
> > +
> > +        if cls.boot_type in boot_types:
> > +            install_dir =3D '%s/%s' % (wdir, cls.grub_prefix_path)
> > +            os.makedirs(install_dir, exist_ok=3DTrue)
> > +            shutil.copy2(cls.grub_cfg, install_dir,
> follow_symlinks=3DTrue)
> > +
> > +    @classmethod
> > +    def handle_install_grub_mods(cls, wdir, grub_format):
> > +        copy_types =3D [ '*.mod', '*.o', '*.lst' ]
> > +
> > +        install_dir =3D '%s/%s/%s' % (wdir, cls.grub_prefix_path,
> grub_format)
> > +        os.makedirs(install_dir, exist_ok=3DTrue)
> > +
> > +        for ctype in copy_types:
> > +            files =3D glob.glob('%s/grub/%s/%s' % \
> > +                (cls.staging_libdir, grub_format, ctype))
> > +            for file in files:
> > +                shutil.copy2(file, install_dir, follow_symlinks=3DTrue=
)
> > +
> > +    @classmethod
> > +    def install_grub_modules(cls, wdir):
> > +        boot_types =3D ['bios', 'uefi']
> > +
> > +        if cls.boot_type =3D=3D 'modules':
> > +            for grub_format in cls.grub_formats:
> > +                cls.handle_install_grub_mods(wdir, grub_format)
> > +        elif cls.boot_type =3D=3D 'bios':
> > +            cls.handle_install_grub_mods(wdir, cls.grub_format_pc)
> > +        elif cls.boot_type =3D=3D 'uefi':
> > +            cls.handle_install_grub_mods(wdir, cls.grub_format_efi)
> > +
> > +    @classmethod
> > +    def install_core_img_efi(cls, kernel_dir, wdir):
> > +        boot_types =3D ['uefi', 'hybrid-uefi']
> > +
> > +        format_types =3D {
> > +            'x86_64-efi' : 'BOOTX64.EFI',
> > +            'ia64-efi'   : 'BOOTIA64.EFI',
> > +            'arm-efi'    : 'BOOTARM.EFI',
> > +            'arm64-efi'  : 'BOOTAA64.EFI',
> > +        }
> > +
> > +        if not cls.grub_format_efi in format_types:
> > +            raise WicError('Unsupported GRUB_MKIMAGE_FORMAT_EFI
> selected.')
> > +
> > +        if cls.boot_type in boot_types:
> > +            install_dir =3D '%s/EFI/BOOT' % (wdir)
> > +            grub_efi_app =3D '%s/grub-efi-boot.efi' % (kernel_dir)
> > +            install_file =3D '%s/%s' % (install_dir,
> format_types[cls.grub_format_efi])
> > +
> > +            os.makedirs(install_dir, exist_ok=3DTrue)
> > +            shutil.copy2(grub_efi_app, install_file,
> follow_symlinks=3DTrue)
> > +
> > +    @classmethod
> > +    def do_prepare_partition(cls, part, source_params, creator,
> cr_workdir,
> > +                             oe_builddir, bootimg_dir, kernel_dir,
> > +                             rootfs_dir, native_sysroot):
> > +        """
> > +        Called to do the actual content population for a partition i.e=
.
> it
> > +        'prepares' the partition to be incorporated into the image.
> > +        """
> > +
> > +        wdir =3D "%s/wdir" % cr_workdir
> > +        if os.path.exists(wdir):
> > +            shutil.rmtree(wdir)
> > +
> > +        cls.install_grub_cfg(wdir)
> > +        cls.install_grub_modules(wdir)
> > +        cls.install_core_img_efi(kernel_dir, wdir)
> > +
> > +        logger.debug('Prepare partition using rootfs in %s', wdir)
> > +        part.prepare_rootfs(cr_workdir, oe_builddir, wdir,
> > +                            native_sysroot, False)
> > +
> > +    @classmethod
> > +    def do_install_boot_img(cls, native_sysroot, wic_image):
> > +        hybrid_boot_types =3D ['hybrid-bios', 'modules']
> > +        boot_types =3D ['bios', 'hybrid-bios', 'modules']
> > +        grub_path =3D '%s/grub/%s' % (cls.staging_libdir,
> cls.grub_format_pc)
> > +        boot_img =3D '%s/boot.img' % (grub_path)
> > +
> > +        if cls.boot_type in boot_types:
> > +            dd_cmd =3D 'dd if=3D%s of=3D%s conv=3Dnotrunc bs=3D1 seek=
=3D0
> count=3D440' % (boot_img, wic_image)
> > +            exec_native_cmd(dd_cmd, native_sysroot)
> > +
> > +        # Replicates what grub-install does to core.img
> > +        # when GPT based partition table format is leveraged.
> > +        if cls.boot_type in hybrid_boot_types:
> > +            dd_cmd =3D "echo -ne '\\x00\\x08' | dd of=3D%s conv=3Dnotr=
unc
> bs=3D1 count=3D2 seek=3D92" % (wic_image)
> > +            exec_native_cmd(dd_cmd, native_sysroot)
> > +
> > +            dd_cmd =3D "echo -ne '\\x90\\x90' | dd of=3D%s conv=3Dnotr=
unc
> bs=3D1 count=3D2 seek=3D102" % (wic_image)
> > +            exec_native_cmd(dd_cmd, native_sysroot)
> > +
> > +    @classmethod
> > +    def do_install_core_img(cls, kernel_dir, native_sysroot, wic_image=
):
> > +        core_img =3D '%s/grub-bios-core.img' % (kernel_dir)
> > +
> > +        if cls.boot_type =3D=3D 'bios':
> > +            dd_cmd =3D 'dd if=3D%s of=3D%s conv=3Dnotrunc bs=3D1 seek=
=3D512' %
> (core_img, wic_image)
> > +            exec_native_cmd(dd_cmd, native_sysroot)
> > +
> > +    @classmethod
> > +    def do_install_disk(cls, disk, disk_name, creator, cr_workdir,
> oe_builddir,
> > +                        bootimg_dir, kernel_dir, native_sysroot):
> > +        """
> > +        Called after all partitions have been prepared and assembled
> into a
> > +        disk image.  In this case, we insert/modify the MBR using
> isohybrid
> > +        utility for booting via BIOS from disk storage devices.
> > +        """
> > +
> > +        wic_image =3D creator._full_path(cr_workdir, disk_name, "direc=
t")
> > +        cls.do_install_boot_img(native_sysroot, wic_image)
> > +        cls.do_install_core_img(kernel_dir, native_sysroot, wic_image)
> > +
> > +# As this change is specific to the 'grub_install'
> > +# wics plugin no need to modify partition.py
> > +def install_core_img_pc(self, rootfs, cr_workdir, oe_builddir,
> > +                        rootfs_dir, native_sysroot, pseudo):
> > +    if not os.path.isfile(self.core_img):
> > +        raise WicError("core.img not built %s" % (self.core_img))
> > +
> > +    shutil.copy2(self.core_img, rootfs, follow_symlinks=3DTrue)
> > +
> > +    # Replicates what grub-install does to core.img
> > +    # when GPT based partition table format is leveraged.
> > +    dd_cmd =3D "echo -ne '\\x01\\x08' | dd of=3D%s conv=3Dnotrunc bs=
=3D1
> count=3D2 seek=3D500" % (rootfs)
> > +    exec_native_cmd(dd_cmd, native_sysroot)
> > +
> > +    dd_cmd =3D "echo -ne '\\x2f\\x02' | dd of=3D%s conv=3Dnotrunc bs=
=3D1
> count=3D2 seek=3D508" % (rootfs)
> > +    exec_native_cmd(dd_cmd, native_sysroot)
> > +
> > +Partition.core_img =3D ''
> > +Partition.prepare_rootfs_none =3D install_core_img_pc
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#220209):
> https://lists.openembedded.org/g/openembedded-core/message/220209
> > Mute This Topic: https://lists.openembedded.org/mt/114141196/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000da86380639e4fd75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Examples and usage may be found in comments under class d=
eclaration. Are they sufficient?<div dir=3D"auto"><br></div><div dir=3D"aut=
o">Will add more comments and move example comments to top of file.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Per what I understand from GPT =
partition table format. If you want to hybrid boot you have to create a sep=
arate bios_boot partition to store core.img.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">I haven&#39;t tested this, but it appears bootimg_bios=
plusefi.py only accounts for MBR partition table format. grub_install accou=
nts for both GPT and MBR. Hybrid or non-hybrid boot.</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 14, 2=
025, 9:33=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">This is a lot of code, bu=
t there is no detailed explanation of what<br>
the plugin is for, how it works, and there are no examples or tests<br>
either.<br>
<br>
In particular, how is it different from existing bootimg plugins which<br>
are also using grub?<br>
<br>
Alex<br>
<br>
<br>
On Mon, 14 Jul 2025 at 04:09, Vincent Davis Jr via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer nore=
ferrer" target=3D"_blank">lists.openembedded.org</a> &lt;vince=3D<a href=3D=
"mailto:underview.tech@lists.openembedded.org" rel=3D"noreferrer noreferrer=
" target=3D"_blank">underview.tech@lists.openembedded.org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Plugin supports installing grub for both<br>
&gt; GPT and MBR based partition table formats.<br>
&gt;<br>
&gt; Signed-off-by: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../lib/wic/plugins/source/grub_install.py=C2=A0 =C2=A0 | 388 ++=
++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 388 insertions(+)<br>
&gt;=C2=A0 create mode 100644 scripts/lib/wic/plugins/source/grub_install.p=
y<br>
&gt;<br>
&gt; diff --git a/scripts/lib/wic/plugins/source/grub_install.py b/scripts/=
lib/wic/plugins/source/grub_install.py<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..85233217f0<br>
&gt; --- /dev/null<br>
&gt; +++ b/scripts/lib/wic/plugins/source/grub_install.py<br>
&gt; @@ -0,0 +1,388 @@<br>
&gt; +#<br>
&gt; +# Copyright 2025, Underview<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: GPL-2.0-only<br>
&gt; +#<br>
&gt; +# DESCRIPTION<br>
&gt; +# This implements the &#39;grub_install&#39; source plugin class for =
&#39;wic&#39;<br>
&gt; +# Searches for most files in deploy directory of a given MACHINE.<br>
&gt; +#<br>
&gt; +# AUTHORS<br>
&gt; +# Vincent Davis Jr &lt;vince (at] underview.tech&gt;<br>
&gt; +<br>
&gt; +import glob<br>
&gt; +import logging<br>
&gt; +import sys<br>
&gt; +import os<br>
&gt; +import re<br>
&gt; +import shutil<br>
&gt; +<br>
&gt; +from wic import WicError<br>
&gt; +from wic.engine import get_custom_config<br>
&gt; +from wic.partition import Partition<br>
&gt; +from wic.pluginbase import SourcePlugin<br>
&gt; +from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var<br>
&gt; +<br>
&gt; +logger =3D logging.getLogger(&#39;wic&#39;)<br>
&gt; +handler =3D logging.StreamHandler(stream=3Dsys.stdout)<br>
&gt; +logger.addHandler(handler)<br>
&gt; +logger.setLevel(logging.DEBUG)<br>
&gt; +<br>
&gt; +class GrubInstall(SourcePlugin):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 Create a bootable wic image with grub as the bootloader=
.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 This plugin populates the output wic image with necessa=
ry grub boot<br>
&gt; +=C2=A0 =C2=A0 files, installs boot.img and core.img. Enables caller t=
o boot off<br>
&gt; +=C2=A0 =C2=A0 of either legacy bios or UEFI firmware or both with the=
 disk partition<br>
&gt; +=C2=A0 =C2=A0 table format being either GPT or MBR based.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ****************** Wic Plugin Depends/Vars ************=
******<br>
&gt; +=C2=A0 =C2=A0 do_image_wic[depends] +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub-native:do_populate_sysroot \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub:do_populate_sysroot \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub-efi:do_populate_sysroot \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Optional variables<br>
&gt; +=C2=A0 =C2=A0 GRUB_PREFIX_PATH =3D &#39;/boot/grub2&#39;<br>
&gt; +=C2=A0 =C2=A0 GRUB_MKIMAGE_FORMAT_PC =3D &#39;i386-pc&#39;<br>
&gt; +=C2=A0 =C2=A0 GRUB_MKIMAGE_FORMAT_EFI =3D &#39;x86_64-efi&#39;<br>
&gt; +=C2=A0 =C2=A0 GRUB_CONFIG_PATH =3D &quot;${DEPLOY_DIR_IMAGE}/grub.cfg=
&quot;<br>
&gt; +=C2=A0 =C2=A0 GRUB_MODULES_EFI =3D &quot;all&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 WICVARS:append =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 GRUB_CONFIG_PATH \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 GRUB_PREFIX_PATH \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 GRUB_MODULES_EFI \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 GRUB_MKIMAGE_FORMAT_PC \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 GRUB_MKIMAGE_FORMAT_EFI \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +=C2=A0 =C2=A0 ****************** Wic Plugin Depends/Vars ************=
******<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ********************** Example kickstart Legacy Bios Bo=
ot **********************<br>
&gt; +=C2=A0 =C2=A0 part bios_boot=C2=A0 --label bios_boot=C2=A0 --fstype e=
xt4 --offset 1024 --fixed-size 78M<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 --source grub_install --sourceparams=3D&quot;boot_type=3Dbios&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 part roots --label rootfs --fstype ext4 --source rootfs=
<br>
&gt; +=C2=A0 =C2=A0 bootloader --ptable msdos --source grub_install<br>
&gt; +=C2=A0 =C2=A0 ********************** Example kickstart Legacy Bios Bo=
ot **********************<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ************************* Example kickstart UEFI Boot *=
************************<br>
&gt; +=C2=A0 =C2=A0 part uefi_boot --label uefi_boot --fstype vfat --offset=
 1024 --fixed-size 78M<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
--part-type C12A7328-F81F-11D2-BA4B-00A0C93EC93B<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
--source grub_install --sourceparams=3D&quot;boot_type=3Duefi&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 part roots --label rootfs --fstype ext4 --source rootfs=
<br>
&gt; +=C2=A0 =C2=A0 bootloader --ptable gpt --source grub_install<br>
&gt; +=C2=A0 =C2=A0 ************************* Example kickstart UEFI Boot *=
************************<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 *********** Example kickstart Hybrid Legacy Bios Or New=
er UEFI Boot ***********<br>
&gt; +=C2=A0 =C2=A0 part bios_boot=C2=A0 --label bios_boot --fstype none --=
offset 1024 --fixed-size 1M<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 --part-type 21686148-6449-6E6F-744E-656564454649<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 --source grub_install --sourceparams=3D&quot;boot_type=3Dhybrid-bios&quot;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 part efi_system --label efi_system --fstype vfat --fixe=
d-size 48M<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 --part-type C12A7328-F81F-11D2-BA4B-00A0C93EC93B<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 --source grub_install --sourceparams=3D&quot;boot_type=3Dhybrid-uefi&quot;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 part grub_data=C2=A0 --label grub_data --fstype ext4 --=
fixed-size 78M<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 --part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 --source grub_install --sourceparams=3D&quot;boot_type=3Dmodules&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 part roots=C2=A0 =C2=A0 =C2=A0 --label rootfs --fstype =
ext4 --source rootfs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 --part-type 0FC63DAF-8483-4772-8E79-3D69D8477DE4<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 bootloader --ptable gpt --source grub_install<br>
&gt; +=C2=A0 =C2=A0 *********** Example kickstart Hybrid Legacy Bios Or New=
er UEFI Boot ***********<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 name =3D &#39;grub_install&#39;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 grub_cfg =3D &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 boot_type =3D &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 grub_formats =3D []<br>
&gt; +=C2=A0 =C2=A0 grub_format_pc =3D &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 grub_format_efi =3D &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 staging_libdir =3D &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 grub_prefix_path =3D &#39;&#39;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @staticmethod<br>
&gt; +=C2=A0 =C2=A0 def gen_embed_grub_cfg(kernel_dir, grub_prefix_path):<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Create grub config that&#39;ll later be e=
mbedded<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 into core.img. So, that core.img knows wh=
ere<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 to search for grub.cfg.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 embed_cfg_str =3D &#39;search.file %s/gru=
b.cfg root\n&#39; % (grub_prefix_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 embed_cfg_str +=3D &#39;set prefix=3D($ro=
ot)%s\n&#39; % (grub_prefix_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 embed_cfg_str +=3D &#39;configfile ($root=
)%s/grub.cfg\n&#39; % (grub_prefix_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(&#39;%s/embed.cfg&#39; % (kerne=
l_dir), &#39;w+&#39;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(embed_cfg_str)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def gen_core_img_pc(cls, kernel_dir, native_sysroot,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 mkimage_format, grub_prefix_path):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generate core.img or grub stage 1.5<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 builtin_modules =3D &#39;boot linux ext2 =
fat serial part_msdos part_gpt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 normal multiboot probe biosdisk msdospart=
 configfile search loadenv test&#39;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not mkimage_format:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkimage_format =3D &#39;i38=
6-pc&#39;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 core_img =3D &#39;%s/grub-bios-core.img&#=
39; % (kernel_dir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mods_path =3D &#39;%s/grub/%s&#39; %=
 (cls.staging_libdir, mkimage_format)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mkimage =3D &#39;grub-mkimage \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --prefix=3D%s \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --format=3D%s \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --config=3D%s/embed.cfg \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --directory=3D%s \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --output=3D%s %s&#39; % \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (grub_prefix_path, mkimage_format, kernel=
_dir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_mods_path, core_img, builtin_m=
odules)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(grub_mkimage, native_sysr=
oot)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.grub_format_pc =3D mkimage_format<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Partition.core_img =3D core_img<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.grub_formats.append(mkimage_format)<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def gen_core_img_efi(cls, kernel_dir, native_sysroot, m=
kimage_format,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0grub_prefix_path, grub_modules_efi):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generate core.img or grub UEFI applicatio=
n<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 that contains the embedded grub config.<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 This is subject to change as OE-core grub=
-efi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipes generates core.img. May be able t=
o<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 leverage that work in the future.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 builtin_modules =3D &#39;boot linux ext2 =
fat serial part_msdos part_gpt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 normal multiboot probe efi_gop iso9660 co=
nfigfile search loadenv test&#39;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not mkimage_format:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkimage_format =3D &#39;x86=
_64-efi&#39;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 core_img =3D &#39;%s/grub-efi-boot.efi&#3=
9; % (kernel_dir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mods_path =3D &#39;%s/grub/%s&#39; %=
 (cls.staging_libdir, mkimage_format)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if grub_modules_efi:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if grub_modules_efi =3D=3D =
&#39;all&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 builtin_modul=
es =3D &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files =3D glo=
b.glob(&#39;%s/*.mod&#39; % (grub_mods_path))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for file in f=
iles:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 builtin_modules +=3D &#39;%s &#39; % os.path.basename(file).removesuffix(&=
#39;.mod&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 builtin_modul=
es =3D grub_modules_efi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;builtin_modules =3D %s&=
#39; % (builtin_modules))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_mkimage =3D &#39;grub-mkimage \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --prefix=3D%s \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --format=3D%s \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --config=3D%s/embed.cfg \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --directory=3D%s \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --output=3D%s %s&#39; % \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (grub_prefix_path, mkimage_format, kernel=
_dir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_mods_path, core_img, builtin_m=
odules)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(grub_mkimage, native_sysr=
oot)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.grub_format_efi =3D mkimage_format<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.grub_formats.append(mkimage_format)<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def do_configure_partition(cls, part, source_params, cr=
eator, cr_workdir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_builddir, bootimg_dir, kernel_=
dir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0native_sysroot):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Called before do_prepare_partition(), cre=
ates loader-specific config<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_types =3D [&#39;bios&#39;, &#39;uefi=
&#39;, &#39;hybrid-bios&#39;, &#39;hybrid-uefi&#39;, &#39;modules&#39;]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_type =3D source_params[&#39;boot_typ=
e&#39;]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.staging_libdir =3D get_bitbake_var(&#=
39;STAGING_LIBDIR&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Optional variables<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_cfg =3D get_bitbake_var(&#39;GRUB_CO=
NFIG_PATH&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_modules_efi =3D get_bitbake_var(&#39=
;GRUB_MODULES_EFI&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_prefix_path =3D get_bitbake_var(&#39=
;GRUB_PREFIX_PATH&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkimage_format_pc =3D get_bitbake_var(&#3=
9;GRUB_MKIMAGE_FORMAT_PC&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkimage_format_efi =3D get_bitbake_var(&#=
39;GRUB_MKIMAGE_FORMAT_EFI&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not grub_cfg:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_cfg =3D creator.ks.boo=
tloader.configfile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not grub_prefix_path:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_prefix_path =3D &#39;/=
boot/grub&#39;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not source_params[&#39;boot_type&#39;]=
 in boot_types:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&quot;grub_i=
nstall requires a boot_type per partition.\n&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Examples: %s&quot; % (boot_types))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Grub config copied in do_prepare_partit=
ion()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isfile(grub_cfg):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&quot;grub_i=
nstall requires a grub config\n&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Examples:\nset GRUB_CONFIG_PATH\n&quot; \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bootloader --configfile in wks file&quot;=
)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.boot_type =3D boot_type<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.grub_cfg =3D grub_cfg<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.grub_prefix_path =3D grub_prefix_path=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.gen_embed_grub_cfg(kernel_dir, grub_p=
refix_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.gen_core_img_pc(kernel_dir, native_sy=
sroot,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkimage_format_pc, grub_prefix_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.gen_core_img_efi(kernel_dir, native_s=
ysroot,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkimage_format_pc, grub_prefix_path,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grub_modules_efi)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def install_grub_cfg(cls, wdir):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_types =3D [&#39;uefi&#39;, &#39;bios=
&#39;, &#39;modules&#39;]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cls.boot_type in boot_types:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir =3D &#39;%s/%s&=
#39; % (wdir, cls.grub_prefix_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(install_dir, ex=
ist_ok=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(cls.grub_cfg, =
install_dir, follow_symlinks=3DTrue)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def handle_install_grub_mods(cls, wdir, grub_format):<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_types =3D [ &#39;*.mod&#39;, &#39;*.=
o&#39;, &#39;*.lst&#39; ]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir =3D &#39;%s/%s/%s&#39; % (wdi=
r, cls.grub_prefix_path, grub_format)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(install_dir, exist_ok=3DTrue)=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for ctype in copy_types:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files =3D glob.glob(&#39;%s=
/grub/%s/%s&#39; % \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cls.staging_=
libdir, grub_format, ctype))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for file in files:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(=
file, install_dir, follow_symlinks=3DTrue)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def install_grub_modules(cls, wdir):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_types =3D [&#39;bios&#39;, &#39;uefi=
&#39;]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cls.boot_type =3D=3D &#39;modules&#39;=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for grub_format in cls.grub=
_formats:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.handle_in=
stall_grub_mods(wdir, grub_format)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif cls.boot_type =3D=3D &#39;bios&#39;:=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.handle_install_grub_mod=
s(wdir, cls.grub_format_pc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif cls.boot_type =3D=3D &#39;uefi&#39;:=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.handle_install_grub_mod=
s(wdir, cls.grub_format_efi)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def install_core_img_efi(cls, kernel_dir, wdir):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_types =3D [&#39;uefi&#39;, &#39;hybr=
id-uefi&#39;]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 format_types =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;x86_64-efi&#39; : &#39=
;BOOTX64.EFI&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ia64-efi&#39;=C2=A0 =
=C2=A0: &#39;BOOTIA64.EFI&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;arm-efi&#39;=C2=A0 =C2=
=A0 : &#39;BOOTARM.EFI&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;arm64-efi&#39;=C2=A0 :=
 &#39;BOOTAA64.EFI&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cls.grub_format_efi in format_type=
s:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&#39;Unsuppo=
rted GRUB_MKIMAGE_FORMAT_EFI selected.&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cls.boot_type in boot_types:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir =3D &#39;%s/EFI=
/BOOT&#39; % (wdir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_efi_app =3D &#39;%s/gr=
ub-efi-boot.efi&#39; % (kernel_dir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_file =3D &#39;%s/%s=
&#39; % (install_dir, format_types[cls.grub_format_efi])<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(install_dir, ex=
ist_ok=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(grub_efi_app, =
install_file, follow_symlinks=3DTrue)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def do_prepare_partition(cls, part, source_params, crea=
tor, cr_workdir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_builddir, bootimg_dir, kernel_dir,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs_dir, native_sysroot):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Called to do the actual content populatio=
n for a partition i.e. it<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;prepares&#39; the partition to be in=
corporated into the image.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wdir =3D &quot;%s/wdir&quot; % cr_workdir=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(wdir):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(wdir)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.install_grub_cfg(wdir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.install_grub_modules(wdir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.install_core_img_efi(kernel_dir, wdir=
)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;Prepare partition using=
 rootfs in %s&#39;, wdir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 part.prepare_rootfs(cr_workdir, oe_buildd=
ir, wdir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot, False)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def do_install_boot_img(cls, native_sysroot, wic_image)=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hybrid_boot_types =3D [&#39;hybrid-bios&#=
39;, &#39;modules&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_types =3D [&#39;bios&#39;, &#39;hybr=
id-bios&#39;, &#39;modules&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_path =3D &#39;%s/grub/%s&#39; % (cls=
.staging_libdir, cls.grub_format_pc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_img =3D &#39;%s/boot.img&#39; % (gru=
b_path)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cls.boot_type in boot_types:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dd_cmd =3D &#39;dd if=3D%s =
of=3D%s conv=3Dnotrunc bs=3D1 seek=3D0 count=3D440&#39; % (boot_img, wic_im=
age)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(dd_cmd, nat=
ive_sysroot)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Replicates what grub-install does to co=
re.img<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # when GPT based partition table format i=
s leveraged.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cls.boot_type in hybrid_boot_types:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dd_cmd =3D &quot;echo -ne &=
#39;\\x00\\x08&#39; | dd of=3D%s conv=3Dnotrunc bs=3D1 count=3D2 seek=3D92&=
quot; % (wic_image)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(dd_cmd, nat=
ive_sysroot)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dd_cmd =3D &quot;echo -ne &=
#39;\\x90\\x90&#39; | dd of=3D%s conv=3Dnotrunc bs=3D1 count=3D2 seek=3D102=
&quot; % (wic_image)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(dd_cmd, nat=
ive_sysroot)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def do_install_core_img(cls, kernel_dir, native_sysroot=
, wic_image):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 core_img =3D &#39;%s/grub-bios-core.img&#=
39; % (kernel_dir)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cls.boot_type =3D=3D &#39;bios&#39;:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dd_cmd =3D &#39;dd if=3D%s =
of=3D%s conv=3Dnotrunc bs=3D1 seek=3D512&#39; % (core_img, wic_image)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(dd_cmd, nat=
ive_sysroot)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @classmethod<br>
&gt; +=C2=A0 =C2=A0 def do_install_disk(cls, disk, disk_name, creator, cr_w=
orkdir, oe_builddir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bootimg_dir, kernel_dir, native_sysroot):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Called after all partitions have been pre=
pared and assembled into a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk image.=C2=A0 In this case, we insert=
/modify the MBR using isohybrid<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 utility for booting via BIOS from disk st=
orage devices.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wic_image =3D creator._full_path(cr_workd=
ir, disk_name, &quot;direct&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.do_install_boot_img(native_sysroot, w=
ic_image)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.do_install_core_img(kernel_dir, nativ=
e_sysroot, wic_image)<br>
&gt; +<br>
&gt; +# As this change is specific to the &#39;grub_install&#39;<br>
&gt; +# wics plugin no need to modify partition.py<br>
&gt; +def install_core_img_pc(self, rootfs, cr_workdir, oe_builddir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 rootfs_dir, native_sysroot, pseudo):<br>
&gt; +=C2=A0 =C2=A0 if not os.path.isfile(self.core_img):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&quot;core.img not built %=
s&quot; % (self.core_img))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 shutil.copy2(self.core_img, rootfs, follow_symlinks=3DT=
rue)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Replicates what grub-install does to core.img<br>
&gt; +=C2=A0 =C2=A0 # when GPT based partition table format is leveraged.<b=
r>
&gt; +=C2=A0 =C2=A0 dd_cmd =3D &quot;echo -ne &#39;\\x01\\x08&#39; | dd of=
=3D%s conv=3Dnotrunc bs=3D1 count=3D2 seek=3D500&quot; % (rootfs)<br>
&gt; +=C2=A0 =C2=A0 exec_native_cmd(dd_cmd, native_sysroot)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dd_cmd =3D &quot;echo -ne &#39;\\x2f\\x02&#39; | dd of=
=3D%s conv=3Dnotrunc bs=3D1 count=3D2 seek=3D508&quot; % (rootfs)<br>
&gt; +=C2=A0 =C2=A0 exec_native_cmd(dd_cmd, native_sysroot)<br>
&gt; +<br>
&gt; +Partition.core_img =3D &#39;&#39;<br>
&gt; +Partition.prepare_rootfs_none =3D install_core_img_pc<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#220209): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/220209" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/mes=
sage/220209</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11414119=
6/1686489" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https=
://lists.openembedded.org/mt/114141196/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-cor=
e+owner@lists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http=
s://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto=
:alex.kanavin@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">al=
ex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000da86380639e4fd75--

