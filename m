Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C485DC87FD3
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 02:17:54 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.78531.1754014668220993475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 19:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=TXMpAtpE;
 spf=pass (domain: underview.tech, ip: 209.85.222.171, mailfrom: vince@underview.tech)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e32cf22fdfso153291585a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 19:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754014667; x=1754619467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ey9inekT2ivpd1wA78Rd8Xv0/XGJfqiVv8GZREUNtM=;
        b=TXMpAtpEDxMRUoWIeBb4seAzxIpF8hUd+hscKIoJ3zSak4VOPQUlIHENRzWAmJIDj1
         k9Sb5JVBONOydbmef8UAJ66MDUEf5QOn61rGYfDyw6vlStXiN8DJ4Q/wS9VRK/ut30Is
         p0vG4D2Q1hAB4VTWWyuw6UQRQavu91jqTealfqr/U7cCdwS5UDWbM6zyU1wvTewU965l
         g+qRNw7UI8p4fH+pD2UOcoxszr/xlO9j7wyx2MzztoQ+R/vztEuxhVlski2VsJ403TnK
         Fb58asRIRBMqAsX5481MejsEt+ZiA5bXrXx+onVoSdOQFx/OAwy/jpiGNsu5UaUbkgvj
         MgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754014667; x=1754619467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ey9inekT2ivpd1wA78Rd8Xv0/XGJfqiVv8GZREUNtM=;
        b=dB2u+kyKoxt/Le2uhC9F6snHl+8wed6PC5oOFWq4NMb94qYVmLFtYagRwR8yVj7Iye
         WyPGbeavB0p6eCKD8f7e1jSlYkPqp+nfLSO48uBczPkN7KwDA0xoRP+Y1Yf8pRATEy2O
         U2Di8dWWD/+PS0aNbvHLNiYx2Mh6Ai0uojJy6KW12shnz3xbuFz43VO3TrLWt3ZWBY0R
         2m3zSpyTD4Z3iGPujAL8q1MPgPsQOeFAOCV4ITeFGlj76dgTEiRJ6+7+Ck3v8ASB7eKy
         nTtorcdSAY/PEM2iePfEE8DR1lqzUq1dKITIuxL2HZa4nN2e6R/2zgGp3rmQXkm9YDdR
         tWmw==
X-Gm-Message-State: AOJu0Ywr8kgXKLSHQVsHSF4frB4u6Goq1FFttrEdyvBtrZYvAzdvGT/w
	3wbaL/qPuXSRO37/zsQClo18VZbK+QqbpEOf8zt1Zskk7I9c41IsDhbI/oV45le0YxtKaQVLnW0
	1+RFY
X-Gm-Gg: ASbGncupR04cgLHKImywbtLdJTrePoHT9so4640F9EnauNRfjcn4sXtyI8wh2TdH5TM
	hWkGkWtDaJ8qeZi72quoVBZyMKJjUrNkV5qi8y3T3sTJf6n7ocj3I7JSFiiGiUKQmUGLwZgGv2u
	/6yyVrWMZBr64oZex6UMdf5ysqTxMomMmsJ6r4inAEseKjQfueHn+dA0dvecnDshZYzcNgZvrSC
	Z6j31NtI+aawmS5AZX6cCw/0nq1ijKnu+VgLd42xI123SU/9pChSrgMPyv8vX6I9/v2S/2ZH3z3
	N6UeK/9PeH3wPTcwpubscsodATuJwXCKKnm/aJqCQft27ol5V0hzWHdvR9j34u3nOuN5lKeoIYq
	dxRgXhMxJijo=
X-Google-Smtp-Source: AGHT+IGz9HP42YFVYduCg3cjqnNsXQZnKldXXlp8gBcU5DjjX92Pks97KZo86Pm0UyZvtzih60AfkQ==
X-Received: by 2002:a05:620a:254d:b0:7e6:2cf0:3b7b with SMTP id af79cd13be357-7e66efb88e2mr1482981685a.25.1754014666630;
        Thu, 31 Jul 2025 19:17:46 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::71f9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6877517dcsm101220585a.67.2025.07.31.19.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 19:17:46 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v5 1/3] bootimg_pcbios: initial import of grub legacy bios boot
Date: Thu, 31 Jul 2025 22:16:06 -0400
Message-ID: <20250801021607.511597-2-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 02:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221210

Moves syslinux config file creation,
partition prepare, and mbr install
tasks into there own seperate functions
before removal from SourcePlugin class
functions.

Add 3 new functions for creation of
grub config, preparing boot partition
to contain grub config and modules,
and install grub boot.img to resulting
wic image.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 345 +++++++++++++++++-
 1 file changed, 344 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 21f41e00bb..f74075ed79 100644
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
@@ -24,11 +26,49 @@ logger = logging.getLogger('wic')
 
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
+    **************** Example kickstart Legacy Bios Grub Boot ****************
+    part boot --label bios_boot --fstype ext4 --offset 1024 --fixed-size 78M
+        --source bootimg_pcbios --sourceparams="loader-bios=grub" --active
+
+    part roots --label rootfs --fstype ext4 --source rootfs --use-uuid
+    bootloader --ptable msdos --source bootimg_pcbios
+    **************** Example kickstart Legacy Bios Grub Boot ****************
+
+    *************** Example kickstart Legacy Bios Syslinux Boot ****************
+    part /boot --source bootimg_pcbios --sourceparams="loader-bios=syslinux"
+           --ondisk sda --label boot --active --align 1024
+
+    part roots --label rootfs --fstype ext4 --source rootfs --use-uuid
+    bootloader --ptable msdos --source bootimg_pcbios
     """
 
     name = 'bootimg_pcbios'
 
+    # Variable required for do_install_disk
+    loader = ''
+
     @classmethod
     def _get_bootimg_dir(cls, bootimg_dir, dirname):
         """
@@ -207,3 +247,306 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         part.size = int(bootimg_size)
         part.source_file = bootimg
+
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
+    @classmethod
+    def _get_bootloader_config(cls, bootloader, loader):
+        custom_cfg = None
+
+        if bootloader.configfile:
+            custom_cfg = get_custom_config(bootloader.configfile)
+            if custom_cfg:
+                logger.debug("Using custom configuration file %s "
+                             "for %s.cfg", bootloader.configfile,
+                             loader)
+                return custom_cfg
+            else:
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s." % bootloader.configfile)
+        return custom_cfg
+
+    @classmethod
+    def _do_configure_syslinux_cfg(cls, creator, cr_workdir, bootimg_dir):
+        hdddir = "%s/hdd/boot" % cr_workdir
+        bootloader = creator.ks.bootloader
+
+        syslinux_conf = cls._get_bootloader_config(bootloader, 'syslinux')
+
+        install_cmd = "install -d %s" % hdddir
+        exec_cmd(install_cmd)
+
+        if not syslinux_conf:
+            # Create syslinux configuration using parameters from wks file
+            splash = os.path.join(hdddir, "/splash.jpg")
+            if os.path.exists(splash):
+                splashline = "menu background splash.jpg"
+            else:
+                splashline = ""
+
+            syslinux_conf = ""
+            syslinux_conf += "PROMPT 0\n"
+            syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
+            syslinux_conf += "\n"
+            syslinux_conf += "ALLOWOPTIONS 1\n"
+            syslinux_conf += "SERIAL 0 115200\n"
+            syslinux_conf += "\n"
+            if splashline:
+                syslinux_conf += "%s\n" % splashline
+            syslinux_conf += "DEFAULT boot\n"
+            syslinux_conf += "LABEL boot\n"
+
+            kernel = "/" + get_bitbake_var("KERNEL_IMAGETYPE")
+            syslinux_conf += "KERNEL " + kernel + "\n"
+
+            syslinux_conf += "APPEND label=boot root=%s %s\n" % \
+                             (creator.rootdev, bootloader.append)
+
+        logger.debug("Writing syslinux config %s/syslinux.cfg", hdddir)
+        cfg = open("%s/syslinux.cfg" % hdddir, "w")
+        cfg.write(syslinux_conf)
+        cfg.close()
+
+    @classmethod
+    def _do_prepare_syslinux(cls, part, cr_workdir, oe_builddir,
+                             bootimg_dir, kernel_dir, native_sysroot):
+
+        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
+
+        staging_kernel_dir = kernel_dir
+
+        hdddir = "%s/hdd/boot" % cr_workdir
+
+        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+        if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
+            if get_bitbake_var("INITRAMFS_IMAGE"):
+                kernel = "%s-%s.bin" % \
+                    (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
+
+        cmds = ("install -m 0644 %s/%s %s/%s" %
+                (staging_kernel_dir, kernel, hdddir, get_bitbake_var("KERNEL_IMAGETYPE")),
+                "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" %
+                (bootimg_dir, hdddir),
+                "install -m 0644 %s/syslinux/vesamenu.c32 %s/vesamenu.c32" %
+                (bootimg_dir, hdddir),
+                "install -m 444 %s/syslinux/libcom32.c32 %s/libcom32.c32" %
+                (bootimg_dir, hdddir),
+                "install -m 444 %s/syslinux/libutil.c32 %s/libutil.c32" %
+                (bootimg_dir, hdddir))
+
+        for install_cmd in cmds:
+            exec_cmd(install_cmd)
+
+        du_cmd = "du -bks %s" % hdddir
+        out = exec_cmd(du_cmd)
+        blocks = int(out.split()[0])
+
+        extra_blocks = part.get_extra_block_count(blocks)
+
+        if extra_blocks < BOOTDD_EXTRA_SPACE:
+            extra_blocks = BOOTDD_EXTRA_SPACE
+
+        blocks += extra_blocks
+
+        logger.debug("Added %d extra blocks to %s to get to %d total blocks",
+                     extra_blocks, part.mountpoint, blocks)
+
+        # dosfs image, created by mkdosfs
+        bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
+
+        label = part.label if part.label else "boot"
+
+        dosfs_cmd = "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
+                    (label, part.fsuuid, bootimg, blocks)
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
+        exec_native_cmd(mcopy_cmd, native_sysroot)
+
+        syslinux_cmd = "syslinux %s" % bootimg
+        exec_native_cmd(syslinux_cmd, native_sysroot)
+
+        chmod_cmd = "chmod 644 %s" % bootimg
+        exec_cmd(chmod_cmd)
+
+        du_cmd = "du -Lbks %s" % bootimg
+        out = exec_cmd(du_cmd)
+        bootimg_size = out.split()[0]
+
+        part.size = int(bootimg_size)
+        part.source_file = bootimg
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
+    def _do_configure_grub_cfg(cls, creator, cr_workdir):
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
-- 
2.43.0


