Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A373DC87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 02:18:14 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.78712.1754014685962726302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 19:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=QfDcDbej;
 spf=pass (domain: underview.tech, ip: 209.85.222.179, mailfrom: vince@underview.tech)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e6817653d0so43181685a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 19:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754014684; x=1754619484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcYx03FBNEwn7FltsdhhnIp7vDUmTuUeVt5PB6uiM7o=;
        b=QfDcDbejEBuRHp6ZlOlVJR8oz6p5qTAJZQhwUDbD0S/i5KgOtkj7Na6FaZb5682XLp
         YLS4tRT3lvCXESkfKMVQqTOlskYC+q14J9tZNd84KFT+Z9H/Ar4hGiv3kSO9k+sbmzTb
         a15T9bOcrBbGsy02SLfQ2Nu2pyVExPfTD9TAqXgBE3DQugLqyezUp7iv/npFZE0Zzcc5
         dVG8xb63gx91HeEBuIC6IGI+W2Z72Y6bu7yOWlEPWibJmXsjOiO9g9/qVntCpoO3bFWQ
         PcfiY99WjgBLtj7CSc1dxoZxlwjpwsB485HlCce/4JYOAmJ53QBgPhgun02JZSPgOChx
         N2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754014684; x=1754619484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcYx03FBNEwn7FltsdhhnIp7vDUmTuUeVt5PB6uiM7o=;
        b=qZt8fuAs3YaK7bBGd8VYvfRVnyIdM6bZD4QhRyFGu9PH3CvyGTGMboGOEoXsKLCKw1
         OYOAy+PaebCNphL4kEXI+NOM1PQB6hSt9D08a01gjHMKsrKdYK00NAEQ6RWcgh7KUVy7
         8jHWMAASrATPavBl9CKOVv6oU2cRQ2QCIhvjal7Su0vya3iFlEkV/01cNC2p9eoZFgv1
         l3RnPzD9lrmap6nBzdhF23uJBefPUzsNZ165aNIhrytx+ZSU1ul3hrHd1hnIB2I3Jqun
         G4KUcMSSVVkDIIzYERoYM2IvjSdkarmfT5KCHlJcvUs2VJ+d+MyF6NGr+VLDbw5Acnpa
         NR6w==
X-Gm-Message-State: AOJu0YyAz1ehRg/hcv/ByHDbVssoyQ9UDrpseei2np7wH+UJZniKHhRx
	h5ktndlAFT3jphkj7nvLjms8pBqpyhQWg6R9nSSJBsGnRvyfh231OVKEnpcS2HQAf4OL0T9tjul
	7wzu3
X-Gm-Gg: ASbGnctuuSVgR2lMfUZQ1ZeEw97K0KpyUFqUc+K1p0rg0kVdSxaYaI0bq+7WsorGrpn
	tHJFLIaEcEHe+x6vGL0ExNi+e8JDU+hKTZiQFA66jYoUUvwacFnlUQIOwCdH2ZYAegGb/sbBcMG
	CWAsbwGqFumfenZ5ZI14PG7VmdqAAhkk1GkzQSzmOBMdh0gr0Ctics5rNhE6F3skvQSR0r8PAZZ
	Y2e6Pw1LhipZZtYT4d5LfpiJkwvzD1vQ5vOhBMenilpyi+zyvlDWXnoDFgj1Y3GOYpZxOb4qqup
	qdURFP3zis+/Z37Wp2KToIb8E+IDwo7MwiNoWtCMr8uKoJSttSyYcpM7Q1ytUs4Lz2pDWPBBI6j
	Zsth+pdkYMIg=
X-Google-Smtp-Source: AGHT+IHOBmOuVX53NZyuhchsvy1ZCZbNFs6W7XQeH1USI8srK5kRYQ+8+Cbm2oCnw++XlDtv09I/Zw==
X-Received: by 2002:a05:620a:6193:b0:7e3:17dc:d1e4 with SMTP id af79cd13be357-7e66f3c46c9mr1169699085a.58.1754014684373;
        Thu, 31 Jul 2025 19:18:04 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::71f9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6877517dcsm101220585a.67.2025.07.31.19.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 19:18:04 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v5 2/3] bootimg_pcbios: final import of grub legacy boot
Date: Thu, 31 Jul 2025 22:16:08 -0400
Message-ID: <20250801021607.511597-4-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801021607.511597-2-vince@underview.tech>
References: <20250801021607.511597-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 02:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221211

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
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 156 ++++--------------
 1 file changed, 30 insertions(+), 126 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index f74075ed79..3c403f4ec2 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -94,27 +94,19 @@ class BootimgPcbiosPlugin(SourcePlugin):
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
@@ -123,56 +115,16 @@ class BootimgPcbiosPlugin(SourcePlugin):
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
@@ -183,70 +135,22 @@ class BootimgPcbiosPlugin(SourcePlugin):
         'prepares' the partition to be incorporated into the image.
         In this case, prepare content for legacy bios boot partition.
         """
-        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
-
-        staging_kernel_dir = kernel_dir
 
-        hdddir = "%s/hdd/boot" % cr_workdir
-
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
+        try:
+            if source_params['loader-bios'] == 'grub':
+                cls._do_prepare_grub(part, cr_workdir, oe_builddir,
+                                kernel_dir, rootfs_dir, native_sysroot)
+            elif source_params['loader-bios'] == 'syslinux':
+                cls._do_prepare_syslinux(part, cr_workdir, oe_builddir,
+                                    bootimg_dir, kernel_dir, native_sysroot)
+            else:
+                raise WicError("unrecognized bootimg_pcbios loader: %s" % source_params['loader-bios'])
 
-        part.size = int(bootimg_size)
-        part.source_file = bootimg
+            # Required by do_install_disk
+            cls.loader = source_params['loader-bios']
+        except KeyError:
+            # Required by do_install_disk
+            cls.loader = 'syslinux'
 
     @classmethod
     def _get_staging_libdir(cls):
-- 
2.43.0


