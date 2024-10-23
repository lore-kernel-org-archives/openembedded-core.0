Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32DDCDDE78
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:09:30 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.7134.1729685362049283661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QjZS3Nwu;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso69429541fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729685360; x=1730290160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oflp4uTMQ+zTlPct28xqYF6LyrMyvI8XmhD31XupPA=;
        b=QjZS3NwuQZ1dmtwAdw3QMJNWSl6K5djes3Q9hoispNBDFH0iUsBYtL0C+8kESXsfvS
         YswYUxGF9b1utL4UO+KOnQWtHFHSZgZKlaHQQ0pJnaANLN+17BLYhUic+pSY+kC8+ESD
         RWDiSvYCxvkRhjGPltZww8gu1l69w1AsDfv2yFuJcs9gIOLbmk9USg6xv/uid7BYk7rb
         V6w+XEg2mFGvSxvAgvcBMBE1udC5r9jtKjbHrwH2ynGaObjOlQWqGKqxRHiJCrUwDZUj
         mcmEFKuq3ZWbW0mFq8dMH0Wh9CkUpMGmiI15jY11iY4p40D4/0j7pLUupfRsYlrQ59pd
         IKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685360; x=1730290160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oflp4uTMQ+zTlPct28xqYF6LyrMyvI8XmhD31XupPA=;
        b=h4c0cyJ8NNBRCV6Y70AIvZwkoe8iGAuvmHXI+sg+lJl3YHl58e9/WDqAatfmlWkn7e
         lZl1UEg8Di9INwkHsgGVaL6H701iNkhjZjeTVljhLA0zMN2vwG8UJ5RJflURAzA0a7qE
         cMcobcbbWRpaJRW1NpXpRD7sWGnIjP3m8hHdk9SKFAhMRM4kYqeaXqwri0u4AcpGyK3d
         qNBJueTE96x3BO+7t032BA8SgUzwPTl3lhr7/LSsytPyegtPV+PYHUuGMvwqtJbCURFj
         P/FKiVeyPut52DGwK7TzEcyStVKLo51rJWQViZyfLUyFipJskBPaAAmK3VWD3IL+S0ld
         KLUA==
X-Gm-Message-State: AOJu0Yx58DLq5M0UhcNoHhINtF59r/dMKMLgXV72Zgdah+1jGz1kee3F
	Z4kj7xuo4hvka0GkHxe3SfvqRNnH0O0qJ32mKA+o/vUQWYnXEJqFi7FH6Yh+dNyMdg2bUxrHoev
	KF3c=
X-Google-Smtp-Source: AGHT+IGGDh6PHZq/71VsaCRlwdq1skkSW8xd/2Gh76YBfQMIdPgnFb/XXsw3spv4wV4y0xx77HbfYA==
X-Received: by 2002:a2e:a547:0:b0:2fb:5035:7e4 with SMTP id 38308e7fff4ca-2fc9d2e54camr13800251fa.5.1729685359765;
        Wed, 23 Oct 2024 05:09:19 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae25d87sm10763801fa.139.2024.10.23.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:09:18 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v10 3/9] wic bootimg-efi.py: change UKI support from wic plugin to uki.bbclass
Date: Wed, 23 Oct 2024 15:08:33 +0300
Message-ID: <20241023120839.437771-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023120839.437771-1-mikko.rapeli@linaro.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206204

Remove custom wic plugin implementation and use systemd ukify reference
implementation when generating UKI images. Fail if users still have
create-unified-kernel-image in wic image config. uki.bbclass use is
detected from IMAGE_CLASSES variable ("inherit uki" in image
recipe) so export that to wic plugins.

If UKI is used, then only generate a minimal loader config for
systemd-boot which basically just sets a timeout. Also set 5 second
timeout by default instead of failing if wic bootloader config is
missing. Boot menu is generated at runtime based on UKI binaries
found from ESP partition.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass   |   3 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py | 140 ++++--------------
 2 files changed, 27 insertions(+), 116 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 1fa016c16e..9a2996658a 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -15,6 +15,7 @@ WICVARS ?= "\
 	HOSTTOOLS_DIR \
 	IMAGE_BASENAME \
 	IMAGE_BOOT_FILES \
+	IMAGE_CLASSES \
 	IMAGE_EFI_BOOT_FILES \
 	IMAGE_LINK_NAME \
 	IMAGE_ROOTFS \
@@ -113,7 +114,7 @@ WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native
 WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
-WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
+WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
 
 WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_BOOTLOADERS}"
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index d00f5428da..c05f38f229 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -125,8 +125,16 @@ class BootimgEFIPlugin(SourcePlugin):
     @classmethod
     def do_configure_systemdboot(cls, hdddir, creator, cr_workdir, source_params):
         """
-        Create loader-specific systemd-boot/gummiboot config
+        Create loader-specific systemd-boot/gummiboot config. Unified Kernel Image (uki)
+        support is done in image recipe with uki.bbclass and only systemd-boot loader config
+        and ESP partition structure is created here.
         """
+        # detect uki.bbclass usage
+        image_classes = get_bitbake_var("IMAGE_CLASSES").split()
+        unified_image = False
+        if "uki" in image_classes:
+            unified_image = True
+
         install_cmd = "install -d %s/loader" % hdddir
         exec_cmd(install_cmd)
 
@@ -134,19 +142,10 @@ class BootimgEFIPlugin(SourcePlugin):
         exec_cmd(install_cmd)
 
         bootloader = creator.ks.bootloader
-
-        unified_image = source_params.get('create-unified-kernel-image') == "true"
-
         loader_conf = ""
-        if not unified_image:
-            loader_conf += "default boot\n"
-        loader_conf += "timeout %d\n" % bootloader.timeout
 
-        initrd = source_params.get('initrd')
-        dtb = source_params.get('dtb')
-
-        if not unified_image:
-            cls._copy_additional_files(hdddir, initrd, dtb)
+        # 5 seconds is a sensible default timeout
+        loader_conf += "timeout %d\n" % (bootloader.timeout or 5)
 
         logger.debug("Writing systemd-boot config "
                      "%s/hdd/boot/loader/loader.conf", cr_workdir)
@@ -155,8 +154,14 @@ class BootimgEFIPlugin(SourcePlugin):
         logger.debug("loader.conf:\n%s" % (loader_conf))
         cfg.close()
 
+        initrd = source_params.get('initrd')
+        dtb = source_params.get('dtb')
+        if not unified_image:
+            cls._copy_additional_files(hdddir, initrd, dtb)
+
         configfile = creator.ks.bootloader.configfile
         custom_cfg = None
+        boot_conf = ""
         if configfile:
             custom_cfg = get_custom_config(configfile)
             if custom_cfg:
@@ -167,8 +172,7 @@ class BootimgEFIPlugin(SourcePlugin):
             else:
                 raise WicError("configfile is specified but failed to "
                                "get it from %s.", configfile)
-
-        if not custom_cfg:
+        else:
             # Create systemd-boot configuration using parameters from wks file
             kernel = get_bitbake_var("KERNEL_IMAGETYPE")
             if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
@@ -178,7 +182,6 @@ class BootimgEFIPlugin(SourcePlugin):
 
             title = source_params.get('title')
 
-            boot_conf = ""
             boot_conf += "title %s\n" % (title if title else "boot")
             boot_conf += "linux /%s\n" % kernel
 
@@ -203,6 +206,7 @@ class BootimgEFIPlugin(SourcePlugin):
                          "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
             cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
             cfg.write(boot_conf)
+            logger.debug("boot.conf:\n%s" % (boot_conf))
             cfg.close()
 
 
@@ -307,107 +311,13 @@ class BootimgEFIPlugin(SourcePlugin):
                     (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
 
         if source_params.get('create-unified-kernel-image') == "true":
-            initrd = source_params.get('initrd')
-            if not initrd:
-                raise WicError("initrd= must be specified when create-unified-kernel-image=true, exiting")
-
-            deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            efi_stub = glob("%s/%s" % (deploy_dir, "linux*.efi.stub"))
-            if len(efi_stub) == 0:
-                raise WicError("Unified Kernel Image EFI stub not found, exiting")
-            efi_stub = efi_stub[0]
-
-            with tempfile.TemporaryDirectory() as tmp_dir:
-                label = source_params.get('label')
-                label_conf = "root=%s" % creator.rootdev
-                if label:
-                    label_conf = "LABEL=%s" % label
-
-                bootloader = creator.ks.bootloader
-                cmdline = open("%s/cmdline" % tmp_dir, "w")
-                cmdline.write("%s %s" % (label_conf, bootloader.append))
-                cmdline.close()
+            raise WicError("create-unified-kernel-image is no longer supported. Please use uki.bbclass.")
 
-                initrds = initrd.split(';')
-                initrd = open("%s/initrd" % tmp_dir, "wb")
-                for f in initrds:
-                    with open("%s/%s" % (deploy_dir, f), 'rb') as in_file:
-                        shutil.copyfileobj(in_file, initrd)
-                initrd.close()
-
-                # Searched by systemd-boot:
-                # https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
-                install_cmd = "install -d %s/EFI/Linux" % hdddir
-                exec_cmd(install_cmd)
-
-                staging_dir_host = get_bitbake_var("STAGING_DIR_HOST")
-                target_sys = get_bitbake_var("TARGET_SYS")
-
-                objdump_cmd = "%s-objdump" % target_sys
-                objdump_cmd += " -p %s" % efi_stub
-                objdump_cmd += " | awk '{ if ($1 == \"SectionAlignment\"){print $2} }'"
-
-                ret, align_str = exec_native_cmd(objdump_cmd, native_sysroot)
-                align = int(align_str, 16)
-
-                objdump_cmd = "%s-objdump" % target_sys
-                objdump_cmd += " -h %s | tail -2" % efi_stub
-                ret, output = exec_native_cmd(objdump_cmd, native_sysroot)
-
-                offset = int(output.split()[2], 16) + int(output.split()[3], 16)
-
-                osrel_off = offset + align - offset % align
-                osrel_path = "%s/usr/lib/os-release" % staging_dir_host
-                osrel_sz = os.stat(osrel_path).st_size
-
-                cmdline_off = osrel_off + osrel_sz
-                cmdline_off = cmdline_off + align - cmdline_off % align
-                cmdline_sz = os.stat(cmdline.name).st_size
-
-                dtb_off = cmdline_off + cmdline_sz
-                dtb_off = dtb_off + align - dtb_off % align
-
-                dtb = source_params.get('dtb')
-                if dtb:
-                    if ';' in dtb:
-                        raise WicError("Only one DTB supported, exiting")
-                    dtb_path = "%s/%s" % (deploy_dir, dtb)
-                    dtb_params = '--add-section .dtb=%s --change-section-vma .dtb=0x%x' % \
-                            (dtb_path, dtb_off)
-                    linux_off = dtb_off + os.stat(dtb_path).st_size
-                    linux_off = linux_off + align - linux_off % align
-                else:
-                    dtb_params = ''
-                    linux_off = dtb_off
-
-                linux_path = "%s/%s" % (staging_kernel_dir, kernel)
-                linux_sz = os.stat(linux_path).st_size
-
-                initrd_off = linux_off + linux_sz
-                initrd_off = initrd_off + align - initrd_off % align
-
-                # https://www.freedesktop.org/software/systemd/man/systemd-stub.html
-                objcopy_cmd = "%s-objcopy" % target_sys
-                objcopy_cmd += " --enable-deterministic-archives"
-                objcopy_cmd += " --preserve-dates"
-                objcopy_cmd += " --add-section .osrel=%s" % osrel_path
-                objcopy_cmd += " --change-section-vma .osrel=0x%x" % osrel_off
-                objcopy_cmd += " --add-section .cmdline=%s" % cmdline.name
-                objcopy_cmd += " --change-section-vma .cmdline=0x%x" % cmdline_off
-                objcopy_cmd += dtb_params
-                objcopy_cmd += " --add-section .linux=%s" % linux_path
-                objcopy_cmd += " --change-section-vma .linux=0x%x" % linux_off
-                objcopy_cmd += " --add-section .initrd=%s" % initrd.name
-                objcopy_cmd += " --change-section-vma .initrd=0x%x" % initrd_off
-                objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
-
-                exec_native_cmd(objcopy_cmd, native_sysroot)
-        else:
-            if source_params.get('install-kernel-into-boot-dir') != 'false':
-                install_cmd = "install -v -p -m 0644 %s/%s %s/%s" % \
-                    (staging_kernel_dir, kernel, hdddir, kernel)
-                out = exec_cmd(install_cmd)
-                logger.debug("Installed kernel files:\n%s" % out)
+        if source_params.get('install-kernel-into-boot-dir') != 'false':
+            install_cmd = "install -v -p -m 0644 %s/%s %s/%s" % \
+                (staging_kernel_dir, kernel, hdddir, kernel)
+            out = exec_cmd(install_cmd)
+            logger.debug("Installed kernel files:\n%s" % out)
 
         if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
-- 
2.34.1


