Return-Path: <kristian@klausen.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33F1C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 11:19:05 +0000 (UTC)
Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web09.29701.1632741543971045966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 04:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@klausen.dk header.s=dkim header.b=ALkjCTnc;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29,
 mailfrom: kristian@klausen.dk)
Date: Mon, 27 Sep 2021 13:18:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1632741540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hokJOKlHOo68gTOO+cFTKcCD3Z7bISgCgrXP3yRfeFg=;
	b=ALkjCTnc576WQsEtCjr6yXwR+R6dLJQBFRV1gYIK4ks4ECuIyxSUDEbrDclshuMKERyAwn
	nquAbsyyouXorrVUYyPBnmYyHYlmd7zxn5JTZ3X3ZmoE+TyPb18hlotJ8BlH72SXXD5GpE
	Dg1XuRqbEJmCxQsP6l9KZfpJVunUqrI=
From: Kristian Klausen <kristian@klausen.dk>
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>,
	richard.purdie@linuxfoundation.org
Subject: Re: [PATCH v2] wic/bootimg-efi: Add Unified Kernel Image option
Message-ID: <YVGooo7LiUG3JQ0h@bob>
References: <20210913081304.10799-1-kristian@klausen.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913081304.10799-1-kristian@klausen.dk>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 11:19:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156384

Den Mon, Sep 13, 2021 at 10:13:04 +0200 skrev Kristian Klausen:
> "A unified kernel image is a single EFI PE executable combining an EFI
> stub loader, a kernel image, an initramfs image, and the kernel command
> line.
> 
> [...]
> 
> Images of this type have the advantage that all metadata and payload
> that makes up the boot entry is monopolized in a single PE file that can
> be signed cryptographically as one for the purpose of EFI
> SecureBoot."[1]
> 
> This commit adds a create-unified-kernel-image=true option to the
> bootimg-efi plugin for creating a Unified Kernel Image[1] and installing
> it into $BOOT/EFI/Linux/ with a .efi extension per the the Boot Loader
> Specification[1][2]. This is useful for implementing Secure Boot.
> 
> systemd-boot is the only mainstream bootloader implementing the
> specification, but GRUB should be able to boot the EFI binary, this
> commit however doesn't implement the necessary changes to the GRUB
> config generation logic to boot the Unified Kernel Image.
> 
> [1] https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
> [2] https://systemd.io/BOOT_LOADER_SPECIFICATION/
> 
> Signed-off-by: Kristian Klausen <kristian@klausen.dk>

Any update on getting this merged?

Cheers,
Kristian

> ---
> V2:
> Add os-release as dependency
> Pull os-release file from STAGING_DIR_HOST, so it doesn't need to be
> installed into the rootfs
> Add selftest
> 
>  meta-selftest/wic/test_efi_plugin.wks         |  6 ++
>  meta/classes/image_types_wic.bbclass          |  5 +-
>  meta/lib/oeqa/selftest/cases/wic.py           | 29 ++++++++
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 71 ++++++++++++++++---
>  4 files changed, 99 insertions(+), 12 deletions(-)
>  create mode 100644 meta-selftest/wic/test_efi_plugin.wks
> 
> diff --git a/meta-selftest/wic/test_efi_plugin.wks b/meta-selftest/wic/test_efi_plugin.wks
> new file mode 100644
> index 0000000000..1603d6c4bb
> --- /dev/null
> +++ b/meta-selftest/wic/test_efi_plugin.wks
> @@ -0,0 +1,6 @@
> +# short-description: This file is used in oe-selftest wic module to test efi plugin
> +
> +part /boot --source bootimg-efi --sourceparams="loader=systemd-boot,create-unified-kernel-image=true,initrd=${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}" --active --align 1024 --use-uuid
> +part / --source rootfs --fstype=ext4 --align 1024 --use-uuid
> +
> +bootloader  --timeout=0 --append="console=ttyS0,115200n8"
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index d561fb2636..e3863c88a9 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -27,6 +27,7 @@ WICVARS ?= "\
>  	ROOTFS_SIZE \
>  	STAGING_DATADIR \
>  	STAGING_DIR \
> +	STAGING_DIR_HOST \
>  	STAGING_LIBDIR \
>  	TARGET_SYS \
>  "
> @@ -84,8 +85,8 @@ do_image_wic[deptask] += "do_image_complete"
>  WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
>  WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
>  WKS_FILE_DEPENDS_BOOTLOADERS = ""
> -WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot"
> -WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot"
> +WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
> +WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
>  WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
>  
>  WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_BOOTLOADERS}"
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index dc7b9e637e..5fc8e65142 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -1158,6 +1158,35 @@ class Wic2(WicTestCase):
>              out = glob(self.resultdir + "%s-*.direct" % wksname)
>              self.assertEqual(1, len(out))
>  
> +    @only_for_arch(['i586', 'i686', 'x86_64'])
> +    def test_efi_plugin_unified_kernel_image_qemu(self):
> +        """Test efi plugin's Unified Kernel Image feature in qemu"""
> +        config = 'IMAGE_FSTYPES = "wic"\n'\
> +                 'INITRAMFS_IMAGE = "core-image-minimal-initramfs"\n'\
> +                 'WKS_FILE = "test_efi_plugin.wks"\n'\
> +                 'MACHINE_FEATURES:append = " efi"\n'
> +        self.append_config(config)
> +        self.assertEqual(0, bitbake('core-image-minimal core-image-minimal-initramfs ovmf').status)
> +        self.remove_config(config)
> +
> +        with runqemu('core-image-minimal', ssh=False,
> +                     runqemuparams='ovmf', image_fstype='wic') as qemu:
> +            # Check that /boot has EFI bootx64.efi (required for EFI)
> +            cmd = "ls /boot/EFI/BOOT/bootx64.efi | wc -l"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> +            self.assertEqual(output, '1')
> +            # Check that /boot has EFI/Linux/linux.efi (required for Unified Kernel Images auto detection)
> +            cmd = "ls /boot/EFI/Linux/linux.efi | wc -l"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> +            self.assertEqual(output, '1')
> +            # Check that /boot doesn't have loader/entries/boot.conf (Unified Kernel Images are auto detected by the bootloader)
> +            cmd = "ls /boot/loader/entries/boot.conf 2&>/dev/null | wc -l"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> +            self.assertEqual(output, '0')
> +
>      def test_fs_types(self):
>          """Test filesystem types for empty and not empty partitions"""
>          img = 'core-image-minimal'
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index cdc72543c2..cc6f5cf063 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -12,6 +12,7 @@
>  
>  import logging
>  import os
> +import tempfile
>  import shutil
>  import re
>  
> @@ -119,12 +120,13 @@ class BootimgEFIPlugin(SourcePlugin):
>          bootloader = creator.ks.bootloader
>  
>          loader_conf = ""
> -        loader_conf += "default boot\n"
> +        if source_params.get('create-unified-kernel-image') != "true":
> +            loader_conf += "default boot\n"
>          loader_conf += "timeout %d\n" % bootloader.timeout
>  
>          initrd = source_params.get('initrd')
>  
> -        if initrd:
> +        if initrd and source_params.get('create-unified-kernel-image') != "true":
>              # obviously we need to have a common common deploy var
>              bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
>              if not bootimg_dir:
> @@ -183,11 +185,12 @@ class BootimgEFIPlugin(SourcePlugin):
>                  for rd in initrds:
>                      boot_conf += "initrd /%s\n" % rd
>  
> -        logger.debug("Writing systemd-boot config "
> -                     "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
> -        cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
> -        cfg.write(boot_conf)
> -        cfg.close()
> +        if source_params.get('create-unified-kernel-image') != "true":
> +            logger.debug("Writing systemd-boot config "
> +                         "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
> +            cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
> +            cfg.write(boot_conf)
> +            cfg.close()
>  
>  
>      @classmethod
> @@ -288,9 +291,57 @@ class BootimgEFIPlugin(SourcePlugin):
>                  kernel = "%s-%s.bin" % \
>                      (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
>  
> -        install_cmd = "install -m 0644 %s/%s %s/%s" % \
> -            (staging_kernel_dir, kernel, hdddir, kernel)
> -        exec_cmd(install_cmd)
> +        if source_params.get('create-unified-kernel-image') == "true":
> +            initrd = source_params.get('initrd')
> +            if initrd:
> +                initrds = initrd.split(';')
> +                if len(initrds) != 1:
> +                    raise WicError("initrd= must only referer a single initrd, exiting")
> +                initrd = initrds[0]
> +            else:
> +                raise WicError("initrd= must be specified when create-unified-kernel-image=true, exiting")
> +
> +            deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
> +            efi_stub = glob("%s/%s" % (deploy_dir, "linux*.efi.stub"))
> +            if len(efi_stub) == 0:
> +                raise WicError("Unified Kernel Image EFI stub not found, exiting")
> +            efi_stub = efi_stub[0]
> +
> +            with tempfile.NamedTemporaryFile(mode="w+") as cmdline:
> +                label = source_params.get('label')
> +                label_conf = "root=%s" % creator.rootdev
> +                if label:
> +                    label_conf = "LABEL=%s" % label
> +
> +                bootloader = creator.ks.bootloader
> +                cmdline.write("%s %s" % (label_conf, bootloader.append))
> +                cmdline.flush()
> +
> +                # Searched by systemd-boot:
> +                # https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
> +                install_cmd = "install -d %s/EFI/Linux" % hdddir
> +                exec_cmd(install_cmd)
> +
> +                staging_dir_host = get_bitbake_var("STAGING_DIR_HOST")
> +
> +                # https://github.com/systemd/systemd/blob/7728f6aa812f1af563821505d9f377a7f4f727d9/test/test-efi-create-disk.sh#L32-L38
> +                objcopy_cmd = "objcopy \
> +                    --add-section .osrel=%s --change-section-vma .osrel=0x20000 \
> +                    --add-section .cmdline=%s --change-section-vma .cmdline=0x30000 \
> +                    --add-section .linux=%s --change-section-vma .linux=0x2000000 \
> +                    --add-section .initrd=%s --change-section-vma .initrd=0x3000000 \
> +                    %s %s" % \
> +                    ("%s/usr/lib/os-release" % staging_dir_host,
> +                    cmdline.name,
> +                    "%s/%s" % (staging_kernel_dir, kernel),
> +                    "%s/%s" % (deploy_dir, initrd),
> +                    efi_stub,
> +                    "%s/EFI/Linux/linux.efi" % hdddir)
> +                exec_cmd(objcopy_cmd)
> +        else:
> +            install_cmd = "install -m 0644 %s/%s %s/%s" % \
> +                (staging_kernel_dir, kernel, hdddir, kernel)
> +            exec_cmd(install_cmd)
>  
>          if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
>              for src_path, dst_path in cls.install_task:
> -- 
> 2.25.1
> 

