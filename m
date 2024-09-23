Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16B4CF9C71
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 18:59:57 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.2822.1727117992673040559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R2n9IYMS;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-537a399e06dso1308414e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727117991; x=1727722791; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y4MEHwoP4s9hoyIDJ+lAt2DaqVx5UUF95JcZYFnUl/M=;
        b=R2n9IYMSbiOnU8g3uS8YnrMMHYZl3f+u/ItkhkaLb8vYKh2ZzVrTMdYy0+kNsdQgIV
         X3CrAyy+05cZgV8vubAcMFdQ/UTeteygUmP7n7spOKV3t91Eo4dy4u6t+cvZlGfq8uGB
         Y98QqQ6s1Gc7toMKnhTUgHWx31xJZ36506RYgs8/J0YVKfpUn34YnGbkRGfgNzcu0MDa
         Y887QjMkF8d/MFYjhGcpA6VJKdiCIfWR8/0R+5PV3HKuZ0fpMKX6Anzwdt/DojYF0mGU
         F/fHB1FDoxp0ZIlOUKOc/AzjtW6xJXE9uxhdzdl0fapCEojFqbTJcI5B96ZbJjSymxH2
         nMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727117991; x=1727722791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4MEHwoP4s9hoyIDJ+lAt2DaqVx5UUF95JcZYFnUl/M=;
        b=W1aTgViyHHQLp2RelVk3glnw74ESK2cuk7OYkc5wnFeI6Vo7PZAgjcjgTliWAKzuGL
         ZG9Fajc8JIwUH5cp3OyMTAdv/Blr8uPHBj2a/bhpKztEcXN5gqhGiDSaSLfeb/sSu1in
         TJvwOHu00+Komf+Jw9xtZFFCJ3PSbCZ5t5DDwBeYCLFNt7waiFINdVCi96qvSLEbF0ea
         kXBPfV6IZxab/Mb6gDVwuWQhMfnLr082fYaiIp9ETYCW5qy9gQxF/eU5f2W+nuaalmLz
         7dT80rmHCLNco60rKxL/LEcCZHlcB9T0uAbb1iKUf/nFcmbTLpetnE/pcgnW0ukrGkFS
         /TfA==
X-Gm-Message-State: AOJu0Yxr/1gOPC1sZw+kIgv2VWND6iqHA11P/EDSbMa5FIR/ZZULmDw8
	K9cafAJ0KCupJ+9wbP3s5F0xsz7c6fuF5azoWsJ7Jaujg309AkXmkczxyg6rZh1K+WcwnBTwKel
	ssnAOd8ymfSIDAsq30FX5FnEaDgM=
X-Google-Smtp-Source: AGHT+IFtqlodM+3wRVrLoMm0AUBQsOw5E0qNJc2KxXyTwTJb/FOB0Snn9J1SUjaafQR5kzWyZd/DGeKxIeRFRrff/Bg=
X-Received: by 2002:a05:6512:ad3:b0:533:482f:afb7 with SMTP id
 2adb3069b0e04-536ac32017amr5793459e87.39.1727117990497; Mon, 23 Sep 2024
 11:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240922084128.9648-1-mikko.rapeli@linaro.org> <20240922084128.9648-8-mikko.rapeli@linaro.org>
In-Reply-To: <20240922084128.9648-8-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Sep 2024 20:59:38 +0200
Message-ID: <CANNYZj-ALoNbzpWqoyJPKfMxHGyO12pwp5UvZ_MLOdREgOO4pA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 07/12] wic bootimg-efi.py: change UKI support
 from wic plugin to uki.bbclass
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 18:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204825

Thanks, this is an excellent improvement.

Alex

On Sun, 22 Sept 2024 at 10:42, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> Remove custom wic plugin implementation and use systemd ukify reference
> implementation when generating UKI images. Fail if users still have
> create-unified-kernel-image in wic image config. uki.bbclass use is
> detected from IMAGE_CLASSES variable ("inherit uki" in image
> recipe) so export that to wic plugins.
>
> If UKI is used, then only generate a minimal loader config for
> systemd-boot which basically just sets a timeout. Also set 5 second
> timeout by default instead of failing if wic bootloader config is
> missing. Boot menu is generated at runtime based on UKI binaries
> found from ESP partition.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/image_types_wic.bbclass   |   3 +-
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 144 ++++--------------
>  2 files changed, 31 insertions(+), 116 deletions(-)
>
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> index e02eb0b367..668d0c6d64 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -15,6 +15,7 @@ WICVARS ?= "\
>         HOSTTOOLS_DIR \
>         IMAGE_BASENAME \
>         IMAGE_BOOT_FILES \
> +       IMAGE_CLASSES \
>         IMAGE_EFI_BOOT_FILES \
>         IMAGE_LINK_NAME \
>         IMAGE_ROOTFS \
> @@ -112,7 +113,7 @@ WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native
>  WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
>  WKS_FILE_DEPENDS_BOOTLOADERS ?= "systemd-boot os-release"
>  WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
> -WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
> +WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux systemd-boot os-release"
>  WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
>
>  WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_BOOTLOADERS}"
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index d00f5428da..dbe1dcde07 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -125,8 +125,16 @@ class BootimgEFIPlugin(SourcePlugin):
>      @classmethod
>      def do_configure_systemdboot(cls, hdddir, creator, cr_workdir, source_params):
>          """
> -        Create loader-specific systemd-boot/gummiboot config
> +        Create loader-specific systemd-boot/gummiboot config. Unified Kernel Image (uki)
> +        support is done in image recipe with uki.bbclass and only systemd-boot loader config
> +        and ESP partition structure is created here.
>          """
> +        # detect uki.bbclass usage
> +        image_classes = get_bitbake_var("IMAGE_CLASSES").split()
> +        unified_image = False
> +        if "uki" in image_classes:
> +            unified_image = True
> +
>          install_cmd = "install -d %s/loader" % hdddir
>          exec_cmd(install_cmd)
>
> @@ -134,19 +142,10 @@ class BootimgEFIPlugin(SourcePlugin):
>          exec_cmd(install_cmd)
>
>          bootloader = creator.ks.bootloader
> -
> -        unified_image = source_params.get('create-unified-kernel-image') == "true"
> -
>          loader_conf = ""
> -        if not unified_image:
> -            loader_conf += "default boot\n"
> -        loader_conf += "timeout %d\n" % bootloader.timeout
>
> -        initrd = source_params.get('initrd')
> -        dtb = source_params.get('dtb')
> -
> -        if not unified_image:
> -            cls._copy_additional_files(hdddir, initrd, dtb)
> +        # 5 seconds is a sensible default timeout
> +        loader_conf += "timeout %d\n" % (bootloader.timeout or 5)
>
>          logger.debug("Writing systemd-boot config "
>                       "%s/hdd/boot/loader/loader.conf", cr_workdir)
> @@ -155,8 +154,14 @@ class BootimgEFIPlugin(SourcePlugin):
>          logger.debug("loader.conf:\n%s" % (loader_conf))
>          cfg.close()
>
> +        initrd = source_params.get('initrd')
> +        dtb = source_params.get('dtb')
> +        if not unified_image:
> +            cls._copy_additional_files(hdddir, initrd, dtb)
> +
>          configfile = creator.ks.bootloader.configfile
>          custom_cfg = None
> +        boot_conf = ""
>          if configfile:
>              custom_cfg = get_custom_config(configfile)
>              if custom_cfg:
> @@ -167,8 +172,7 @@ class BootimgEFIPlugin(SourcePlugin):
>              else:
>                  raise WicError("configfile is specified but failed to "
>                                 "get it from %s.", configfile)
> -
> -        if not custom_cfg:
> +        else:
>              # Create systemd-boot configuration using parameters from wks file
>              kernel = get_bitbake_var("KERNEL_IMAGETYPE")
>              if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
> @@ -178,7 +182,6 @@ class BootimgEFIPlugin(SourcePlugin):
>
>              title = source_params.get('title')
>
> -            boot_conf = ""
>              boot_conf += "title %s\n" % (title if title else "boot")
>              boot_conf += "linux /%s\n" % kernel
>
> @@ -198,11 +201,16 @@ class BootimgEFIPlugin(SourcePlugin):
>              if dtb:
>                  boot_conf += "devicetree /%s\n" % dtb
>
> +            boot_conf = ""
> +            boot_conf += "title %s\n" % (title if title else "boot")
> +            boot_conf += "efi /linux.efi\n"
> +
>          if not unified_image:
>              logger.debug("Writing systemd-boot config "
>                           "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
>              cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
>              cfg.write(boot_conf)
> +            logger.debug("boot.conf:\n%s" % (boot_conf))
>              cfg.close()
>
>
> @@ -307,107 +315,13 @@ class BootimgEFIPlugin(SourcePlugin):
>                      (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
>
>          if source_params.get('create-unified-kernel-image') == "true":
> -            initrd = source_params.get('initrd')
> -            if not initrd:
> -                raise WicError("initrd= must be specified when create-unified-kernel-image=true, exiting")
> -
> -            deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
> -            efi_stub = glob("%s/%s" % (deploy_dir, "linux*.efi.stub"))
> -            if len(efi_stub) == 0:
> -                raise WicError("Unified Kernel Image EFI stub not found, exiting")
> -            efi_stub = efi_stub[0]
> -
> -            with tempfile.TemporaryDirectory() as tmp_dir:
> -                label = source_params.get('label')
> -                label_conf = "root=%s" % creator.rootdev
> -                if label:
> -                    label_conf = "LABEL=%s" % label
> -
> -                bootloader = creator.ks.bootloader
> -                cmdline = open("%s/cmdline" % tmp_dir, "w")
> -                cmdline.write("%s %s" % (label_conf, bootloader.append))
> -                cmdline.close()
> +            raise WicError("create-unified-kernel-image is no longer supported. Please use uki.bbclass.")
>
> -                initrds = initrd.split(';')
> -                initrd = open("%s/initrd" % tmp_dir, "wb")
> -                for f in initrds:
> -                    with open("%s/%s" % (deploy_dir, f), 'rb') as in_file:
> -                        shutil.copyfileobj(in_file, initrd)
> -                initrd.close()
> -
> -                # Searched by systemd-boot:
> -                # https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
> -                install_cmd = "install -d %s/EFI/Linux" % hdddir
> -                exec_cmd(install_cmd)
> -
> -                staging_dir_host = get_bitbake_var("STAGING_DIR_HOST")
> -                target_sys = get_bitbake_var("TARGET_SYS")
> -
> -                objdump_cmd = "%s-objdump" % target_sys
> -                objdump_cmd += " -p %s" % efi_stub
> -                objdump_cmd += " | awk '{ if ($1 == \"SectionAlignment\"){print $2} }'"
> -
> -                ret, align_str = exec_native_cmd(objdump_cmd, native_sysroot)
> -                align = int(align_str, 16)
> -
> -                objdump_cmd = "%s-objdump" % target_sys
> -                objdump_cmd += " -h %s | tail -2" % efi_stub
> -                ret, output = exec_native_cmd(objdump_cmd, native_sysroot)
> -
> -                offset = int(output.split()[2], 16) + int(output.split()[3], 16)
> -
> -                osrel_off = offset + align - offset % align
> -                osrel_path = "%s/usr/lib/os-release" % staging_dir_host
> -                osrel_sz = os.stat(osrel_path).st_size
> -
> -                cmdline_off = osrel_off + osrel_sz
> -                cmdline_off = cmdline_off + align - cmdline_off % align
> -                cmdline_sz = os.stat(cmdline.name).st_size
> -
> -                dtb_off = cmdline_off + cmdline_sz
> -                dtb_off = dtb_off + align - dtb_off % align
> -
> -                dtb = source_params.get('dtb')
> -                if dtb:
> -                    if ';' in dtb:
> -                        raise WicError("Only one DTB supported, exiting")
> -                    dtb_path = "%s/%s" % (deploy_dir, dtb)
> -                    dtb_params = '--add-section .dtb=%s --change-section-vma .dtb=0x%x' % \
> -                            (dtb_path, dtb_off)
> -                    linux_off = dtb_off + os.stat(dtb_path).st_size
> -                    linux_off = linux_off + align - linux_off % align
> -                else:
> -                    dtb_params = ''
> -                    linux_off = dtb_off
> -
> -                linux_path = "%s/%s" % (staging_kernel_dir, kernel)
> -                linux_sz = os.stat(linux_path).st_size
> -
> -                initrd_off = linux_off + linux_sz
> -                initrd_off = initrd_off + align - initrd_off % align
> -
> -                # https://www.freedesktop.org/software/systemd/man/systemd-stub.html
> -                objcopy_cmd = "%s-objcopy" % target_sys
> -                objcopy_cmd += " --enable-deterministic-archives"
> -                objcopy_cmd += " --preserve-dates"
> -                objcopy_cmd += " --add-section .osrel=%s" % osrel_path
> -                objcopy_cmd += " --change-section-vma .osrel=0x%x" % osrel_off
> -                objcopy_cmd += " --add-section .cmdline=%s" % cmdline.name
> -                objcopy_cmd += " --change-section-vma .cmdline=0x%x" % cmdline_off
> -                objcopy_cmd += dtb_params
> -                objcopy_cmd += " --add-section .linux=%s" % linux_path
> -                objcopy_cmd += " --change-section-vma .linux=0x%x" % linux_off
> -                objcopy_cmd += " --add-section .initrd=%s" % initrd.name
> -                objcopy_cmd += " --change-section-vma .initrd=0x%x" % initrd_off
> -                objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
> -
> -                exec_native_cmd(objcopy_cmd, native_sysroot)
> -        else:
> -            if source_params.get('install-kernel-into-boot-dir') != 'false':
> -                install_cmd = "install -v -p -m 0644 %s/%s %s/%s" % \
> -                    (staging_kernel_dir, kernel, hdddir, kernel)
> -                out = exec_cmd(install_cmd)
> -                logger.debug("Installed kernel files:\n%s" % out)
> +        if source_params.get('install-kernel-into-boot-dir') != 'false':
> +            install_cmd = "install -v -p -m 0644 %s/%s %s/%s" % \
> +                (staging_kernel_dir, kernel, hdddir, kernel)
> +            out = exec_cmd(install_cmd)
> +            logger.debug("Installed kernel files:\n%s" % out)
>
>          if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
>              for src_path, dst_path in cls.install_task:
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204779): https://lists.openembedded.org/g/openembedded-core/message/204779
> Mute This Topic: https://lists.openembedded.org/mt/108587933/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

