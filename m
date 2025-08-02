Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12419C87FD2
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 22:05:03 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.6925.1754172296170975370
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 15:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Yhuwz+AV;
 spf=pass (domain: underview.tech, ip: 209.85.222.177, mailfrom: vince@underview.tech)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e699d1179cso99015585a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 15:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754172295; x=1754777095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaOAG5PlHsZOLXXACUh4LeF2FLe7m+DFvUJOS1CTZBo=;
        b=Yhuwz+AVlSQznf5WWPuKi4FQyn4liLKr5wflJGt0AU4Hen2G93CEWrUDKlSUySBF4A
         +jRLA6ph29i1iteB5GvBM62F7QUfgs02MTWgLVFitK+oO9t1/wzftiFfTYmLGRqU5nWY
         hyLW/ZWPr5yw+RCliqPM8hlAvqtGF+qJZT63/77mF/3Vzb27WNdAsU+B3pwvugLhyQHp
         rEZSHRUapw1VSW8iIEIu5BHJaibc+rvYzVq7Y3uqYhQrD/Oqnm7o6HyjuP4TcoVTYSNr
         deaKf/AcSTR/pidJLhxZWv86KpuPiB53GBcqDYZFsYY3xHuhNj3kucUhktvQwPdSbv+p
         W96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754172295; x=1754777095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaOAG5PlHsZOLXXACUh4LeF2FLe7m+DFvUJOS1CTZBo=;
        b=iHkWp3Gx6abkmrQ4Aemp451kQkiw/sYFQ+tF9obE8JjG1Uev03ZPokWpAqW0fV3yAu
         /Q3X9QJiUuK1s1pK3BbjzdtEc+T0xpJgLh60GezIB27PwPufkGvkwWzQtaWseIPpsQd0
         wOOr8dBQs+Z/4vYDnesQmAMBWgG0YrdssObe+5l8DBHsF/Kp/e2uch5Whol2zAyAwch+
         gk8rdAuHHzSAY80tkUcbO/AjfyoWbr/TaRU3lAcG5tXYKems921N/1ImY1wmCM8Rui0G
         6pDciF5FcDroA71hWvtzzMDWPtWowiS9KkliIDhCUcLUbk3BO49Ifkxx6S6DTIDyEMnw
         8hOA==
X-Gm-Message-State: AOJu0Yz9Ej3sQDDjvuKJ2MtJU6keTKRZNI+46GY0s5O7gjXdfHbtA8hg
	fE5nwMB6KM/5d7XA05+S7QYUPa5QSmzW+A94L24AYIVw8mg11dy92p7KcVe27ebPNmGZjKxXR4i
	f5l5S
X-Gm-Gg: ASbGncuZ3vGAKvdFXKrfm1rD/bWKyxrbqFm0bTlIW1rBSQ3f+rZTlRVSy8gwwtiUSSj
	Gh5ifo1BOLOCVIrgAe9VqezSjrMBUF6YsBB5ZNuIi+6TP/u0iX/LQri56CXyr3PSTX+gV8uB8Wf
	pdex1zU3QaCZZyt72IM+3ltTdycwWcE7RmrWKdlUfbv8wD4z5NG0KEmMktqihEsPeAh9CR8vn22
	jIeYk3UTenL1YbSC7e4tU6pHt4WSGp3iNNF7UD755nnO5J/UlummJ466nBh6a00FSGTd89LS/rE
	QzAnpjHDu7Pkp0chY94oaAc4kEVs6ZZfr4QD9bMtwTlYrq666UURQg6gbVe5oe+4/YG37v99cvb
	2Pjfioj0+dIAFxRr3b6YHog==
X-Google-Smtp-Source: AGHT+IE5ddXQcKT8gCr7uapjyeHvLWG9/OuFVQf2LdZVTLmQW4KSY7mnobIgmzshY8fRmUXyxht2Rg==
X-Received: by 2002:a05:620a:46a6:b0:7e3:35dd:4829 with SMTP id af79cd13be357-7e69636879amr587563885a.46.1754172294769;
        Sat, 02 Aug 2025 15:04:54 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::71f9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f706406sm373028385a.49.2025.08.02.15.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 15:04:53 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v6 2/3] bootimg_pcbios: final import of grub legacy bios boot
Date: Sat,  2 Aug 2025 18:02:30 -0400
Message-ID: <20250802220229.2826203-4-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802220229.2826203-2-vince@underview.tech>
References: <20250802220229.2826203-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 22:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221393

Due to the bootimg_biosplusefi source_params['loader']
had to be named source_params['loader-bios'] so not
to create conflict in the wics plugin

Removes old syslinux implementation as it
was copied into seperate functions and
adds ability to set and or not set
source_params. If source_params set check
for both
	* syslinux
	* grub

if not set default to using syslinux

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 160 ++++--------------
 1 file changed, 33 insertions(+), 127 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 5138b680c9..27d7963389 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -96,27 +96,19 @@ class BootimgPcbiosPlugin(SourcePlugin):
         Called after all partitions have been prepared and assembled into a
         disk image.  In this case, we install the MBR.
         """
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
 
         full_path = creator._full_path(workdir, disk_name, "direct")
         logger.debug("Installing MBR on disk %s as %s with size %s bytes",
                      disk_name, full_path, disk.min_size)
 
-        dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
-        exec_cmd(dd_cmd, native_sysroot)
+        if cls.loader == 'grub':
+            cls._do_install_grub(creator, kernel_dir,
+                            native_sysroot, full_path)
+        elif cls.loader == 'syslinux':
+            cls._do_install_syslinux(creator, bootimg_dir,
+                            native_sysroot, full_path)
+        else:
+            raise WicError("boot loader some how not specified check do_prepare_partition")
 
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
@@ -125,56 +117,16 @@ class BootimgPcbiosPlugin(SourcePlugin):
         """
         Called before do_prepare_partition(), creates syslinux config
         """
-        hdddir = "%s/hdd/boot" % cr_workdir
-
-        install_cmd = "install -d %s" % hdddir
-        exec_cmd(install_cmd)
-
-        bootloader = creator.ks.bootloader
-
-        custom_cfg = None
-        if bootloader.configfile:
-            custom_cfg = get_custom_config(bootloader.configfile)
-            if custom_cfg:
-                # Use a custom configuration for grub
-                syslinux_conf = custom_cfg
-                logger.debug("Using custom configuration file %s "
-                             "for syslinux.cfg", bootloader.configfile)
-            else:
-                raise WicError("configfile is specified but failed to "
-                               "get it from %s." % bootloader.configfile)
 
-        if not custom_cfg:
-            # Create syslinux configuration using parameters from wks file
-            splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
-            if os.path.exists(splash):
-                splashline = "menu background splash.jpg"
+        try:
+            if source_params['loader-bios'] == 'grub':
+                cls._do_configure_grub_cfg(creator, cr_workdir)
+            elif source_params['loader-bios'] == 'syslinux':
+                cls._do_configure_syslinux_cfg(creator, cr_workdir, bootimg_dir)
             else:
-                splashline = ""
-
-            syslinux_conf = ""
-            syslinux_conf += "PROMPT 0\n"
-            syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
-            syslinux_conf += "\n"
-            syslinux_conf += "ALLOWOPTIONS 1\n"
-            syslinux_conf += "SERIAL 0 115200\n"
-            syslinux_conf += "\n"
-            if splashline:
-                syslinux_conf += "%s\n" % splashline
-            syslinux_conf += "DEFAULT boot\n"
-            syslinux_conf += "LABEL boot\n"
-
-            kernel = "/" + get_bitbake_var("KERNEL_IMAGETYPE")
-            syslinux_conf += "KERNEL " + kernel + "\n"
-
-            syslinux_conf += "APPEND label=boot root=%s %s\n" % \
-                             (creator.rootdev, bootloader.append)
-
-        logger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg",
-                     cr_workdir)
-        cfg = open("%s/hdd/boot/syslinux.cfg" % cr_workdir, "w")
-        cfg.write(syslinux_conf)
-        cfg.close()
+                raise WicError("unrecognized bootimg_pcbios loader: %s" % source_params['loader-bios'])
+        except KeyError:
+            cls._do_configure_syslinux_cfg(creator, cr_workdir, bootimg_dir)
 
     @classmethod
     def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
@@ -185,70 +137,24 @@ class BootimgPcbiosPlugin(SourcePlugin):
         'prepares' the partition to be incorporated into the image.
         In this case, prepare content for legacy bios boot partition.
         """
-        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
-
-        staging_kernel_dir = kernel_dir
-
-        hdddir = "%s/hdd/boot" % cr_workdir
 
-        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
-        if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
-            if get_bitbake_var("INITRAMFS_IMAGE"):
-                kernel = "%s-%s.bin" % \
-                    (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
-
-        cmds = ("install -m 0644 %s/%s %s/%s" %
-                (staging_kernel_dir, kernel, hdddir, get_bitbake_var("KERNEL_IMAGETYPE")),
-                "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" %
-                (bootimg_dir, hdddir),
-                "install -m 0644 %s/syslinux/vesamenu.c32 %s/vesamenu.c32" %
-                (bootimg_dir, hdddir),
-                "install -m 444 %s/syslinux/libcom32.c32 %s/libcom32.c32" %
-                (bootimg_dir, hdddir),
-                "install -m 444 %s/syslinux/libutil.c32 %s/libutil.c32" %
-                (bootimg_dir, hdddir))
-
-        for install_cmd in cmds:
-            exec_cmd(install_cmd)
-
-        du_cmd = "du -bks %s" % hdddir
-        out = exec_cmd(du_cmd)
-        blocks = int(out.split()[0])
-
-        extra_blocks = part.get_extra_block_count(blocks)
-
-        if extra_blocks < BOOTDD_EXTRA_SPACE:
-            extra_blocks = BOOTDD_EXTRA_SPACE
-
-        blocks += extra_blocks
-
-        logger.debug("Added %d extra blocks to %s to get to %d total blocks",
-                     extra_blocks, part.mountpoint, blocks)
-
-        # dosfs image, created by mkdosfs
-        bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
-
-        label = part.label if part.label else "boot"
-
-        dosfs_cmd = "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
-                    (label, part.fsuuid, bootimg, blocks)
-        exec_native_cmd(dosfs_cmd, native_sysroot)
-
-        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-        exec_native_cmd(mcopy_cmd, native_sysroot)
-
-        syslinux_cmd = "syslinux %s" % bootimg
-        exec_native_cmd(syslinux_cmd, native_sysroot)
-
-        chmod_cmd = "chmod 644 %s" % bootimg
-        exec_cmd(chmod_cmd)
-
-        du_cmd = "du -Lbks %s" % bootimg
-        out = exec_cmd(du_cmd)
-        bootimg_size = out.split()[0]
-
-        part.size = int(bootimg_size)
-        part.source_file = bootimg
+        try:
+            if source_params['loader-bios'] == 'grub':
+                cls._do_prepare_grub(part, cr_workdir, oe_builddir,
+                                kernel_dir, rootfs_dir, native_sysroot)
+            elif source_params['loader-bios'] == 'syslinux':
+                cls._do_prepare_syslinux(part, cr_workdir, oe_builddir,
+                                    bootimg_dir, kernel_dir, native_sysroot)
+            else:
+                raise WicError("unrecognized bootimg_pcbios loader: %s" % source_params['loader-bios'])
+
+            # Required by do_install_disk
+            cls.loader = source_params['loader-bios']
+        except KeyError:
+            # Required by do_install_disk
+            cls.loader = 'syslinux'
+            cls._do_prepare_syslinux(part, cr_workdir, oe_builddir,
+                                bootimg_dir, kernel_dir, native_sysroot)
 
     @classmethod
     def _get_staging_libdir(cls):
-- 
2.43.0


