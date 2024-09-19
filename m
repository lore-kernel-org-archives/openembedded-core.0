Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7EECF3954
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:37:53 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.21523.1726756666863321882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PJUnk8Jx;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53653682246so1058598e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726756665; x=1727361465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0By32o/C+iOFmrKlzNfHouLvy5UgXAOcr2DlyVaw4c=;
        b=PJUnk8JxMDig1y5BIuGLTqz+x3ugGyfP8LC7uqToNFGJlnc9UqjUq+5MvSZV1ghqBF
         M1qCT7PBZAZYUiWq/oUWC95z7l8CTCPmOTCbmQFhLCk5c3Y6V3BaLGBpCc8mEPBD2bVN
         5IvWZ7Up3FHfv8iWq/oRwQd82c4L1qrQTMkvSrPNkMdhIBVcMyvmvKZ+UzT18gLFd9fe
         8VVzpZM42JTc0Ghh1+yay/rMWJc8KOE7a0vryrcPC9JgaYmvuKe2j1gTlt413I0wPWIX
         WV1sYHnErrpuEJpjNZ/waFCGp8JzzHZY24S3oEuPYLUoSd269NsJx8Rjs/4AqGbtJE28
         OTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756665; x=1727361465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0By32o/C+iOFmrKlzNfHouLvy5UgXAOcr2DlyVaw4c=;
        b=KqlFrCP9DY/bmfHdrm9/+tPJoi/sLcF+yp3nsqBuiDPgGrf+rkzR7Fy2hWKENxNPC8
         uFfOHsl2j+flbkmNSSQY01458tA8duvFVEUJrbCAJKPO24wXkgomD6hX28ViMSpyoX7g
         jSZzWcQ8wkUVLiXywfZKvn1eYqi+y7HKy2BdqYng8x6GyyylPwul558SxrXgs54ynjxC
         1we6RRM6FtRWZg2D5P1Nl2SJ6DEAPFPxCMp0E0zrgJOX1TPbxpEjPebjtWO+b7YcpW+D
         hUncruN4JGoLLwKCgssx3Hyv/OIEBA1PujPXp4OSQOIFiuCzlnigULNmcFIMdPnwmnhJ
         LfvA==
X-Gm-Message-State: AOJu0Yzx0F3pAhu0Adnhi2BtBfUdBxmSloIekAuHaCFtb/rqjY8MQFBj
	+ROebNnpMUhfWvX9WdVpIohmHVZVXaO1vFrPmr1AQu1K2vqP3Fx+FSdDalyvQOO4Uoxab79550j
	jE4w=
X-Google-Smtp-Source: AGHT+IEdUKFcUJtj5ENJiXPIJKDNGtxQRZRjGQCwz5atidumhFAA5PUJQWx/KOrb7W98gBUfFRX29g==
X-Received: by 2002:a05:6512:1581:b0:533:4327:b4cc with SMTP id 2adb3069b0e04-53678ff3092mr16790338e87.52.1726756664912;
        Thu, 19 Sep 2024 07:37:44 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8721sm1889194e87.232.2024.09.19.07.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:37:43 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 06/12] wic bootimg-efi.py: keep timestamps and add debug prints
Date: Thu, 19 Sep 2024 17:37:00 +0300
Message-ID: <20240919143706.6074-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919143706.6074-1-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204698

Keep timestamps etc to help build reproducibility.

Add prints to see what is being copied to ESP partition.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 49 ++++++++++++-------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 7cc5131541..d00f5428da 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -43,16 +43,18 @@ class BootimgEFIPlugin(SourcePlugin):
         if initrd:
             initrds = initrd.split(';')
             for rd in initrds:
-                cp_cmd = "cp %s/%s %s" % (bootimg_dir, rd, hdddir)
-                exec_cmd(cp_cmd, True)
+                cp_cmd = "cp -v -p %s/%s %s" % (bootimg_dir, rd, hdddir)
+                out = exec_cmd(cp_cmd, True)
+                logger.debug("initrd files:\n%s" % (out))
         else:
             logger.debug("Ignoring missing initrd")
 
         if dtb:
             if ';' in dtb:
                 raise WicError("Only one DTB supported, exiting")
-            cp_cmd = "cp %s/%s %s" % (bootimg_dir, dtb, hdddir)
-            exec_cmd(cp_cmd, True)
+            cp_cmd = "cp -v -p %s/%s %s" % (bootimg_dir, dtb, hdddir)
+            out = exec_cmd(cp_cmd, True)
+            logger.debug("dtb files:\n%s" % (out))
 
     @classmethod
     def do_configure_grubefi(cls, hdddir, creator, cr_workdir, source_params):
@@ -150,6 +152,7 @@ class BootimgEFIPlugin(SourcePlugin):
                      "%s/hdd/boot/loader/loader.conf", cr_workdir)
         cfg = open("%s/hdd/boot/loader/loader.conf" % cr_workdir, "w")
         cfg.write(loader_conf)
+        logger.debug("loader.conf:\n%s" % (loader_conf))
         cfg.close()
 
         configfile = creator.ks.bootloader.configfile
@@ -401,30 +404,33 @@ class BootimgEFIPlugin(SourcePlugin):
                 exec_native_cmd(objcopy_cmd, native_sysroot)
         else:
             if source_params.get('install-kernel-into-boot-dir') != 'false':
-                install_cmd = "install -m 0644 %s/%s %s/%s" % \
+                install_cmd = "install -v -p -m 0644 %s/%s %s/%s" % \
                     (staging_kernel_dir, kernel, hdddir, kernel)
-                exec_cmd(install_cmd)
+                out = exec_cmd(install_cmd)
+                logger.debug("Installed kernel files:\n%s" % out)
 
         if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
-                install_cmd = "install -m 0644 -D %s %s" \
+                install_cmd = "install -v -p -m 0644 -D %s %s" \
                               % (os.path.join(kernel_dir, src_path),
                                  os.path.join(hdddir, dst_path))
-                exec_cmd(install_cmd)
+                out = exec_cmd(install_cmd)
+                logger.debug("Installed IMAGE_EFI_BOOT_FILES:\n%s" % out)
 
         try:
             if source_params['loader'] == 'grub-efi':
                 shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
                                 "%s/grub.cfg" % cr_workdir)
                 for mod in [x for x in os.listdir(kernel_dir) if x.startswith("grub-efi-")]:
-                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[9:])
+                    cp_cmd = "cp -v -p %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[9:])
                     exec_cmd(cp_cmd, True)
                 shutil.move("%s/grub.cfg" % cr_workdir,
                             "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
             elif source_params['loader'] == 'systemd-boot':
                 for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
-                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
-                    exec_cmd(cp_cmd, True)
+                    cp_cmd = "cp -v -p %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
+                    out = exec_cmd(cp_cmd, True)
+                    logger.debug("systemd-boot files:\n%s" % out)
             elif source_params['loader'] == 'uefi-kernel':
                 kernel = get_bitbake_var("KERNEL_IMAGETYPE")
                 if not kernel:
@@ -445,8 +451,9 @@ class BootimgEFIPlugin(SourcePlugin):
                     raise WicError("UEFI stub kernel is incompatible with target %s" % target)
 
                 for mod in [x for x in os.listdir(kernel_dir) if x.startswith(kernel)]:
-                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, kernel_efi_image)
-                    exec_cmd(cp_cmd, True)
+                    cp_cmd = "cp -v -p %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, kernel_efi_image)
+                    out = exec_cmd(cp_cmd, True)
+                    logger.debug("uefi-kernel files:\n%s" % out)
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
                                source_params['loader'])
@@ -455,13 +462,15 @@ class BootimgEFIPlugin(SourcePlugin):
 
         startup = os.path.join(kernel_dir, "startup.nsh")
         if os.path.exists(startup):
-            cp_cmd = "cp %s %s/" % (startup, hdddir)
-            exec_cmd(cp_cmd, True)
+            cp_cmd = "cp -v -p %s %s/" % (startup, hdddir)
+            out = exec_cmd(cp_cmd, True)
+            logger.debug("startup files:\n%s" % out)
 
         for paths in part.include_path or []:
             for path in paths:
-                cp_cmd = "cp -r %s %s/" % (path, hdddir)
+                cp_cmd = "cp -v -p -r %s %s/" % (path, hdddir)
                 exec_cmd(cp_cmd, True)
+                logger.debug("include_path files:\n%s" % out)
 
         du_cmd = "du -bks %s" % hdddir
         out = exec_cmd(du_cmd)
@@ -489,12 +498,14 @@ class BootimgEFIPlugin(SourcePlugin):
 
         label = part.label if part.label else "ESP"
 
-        dosfs_cmd = "mkdosfs -n %s -i %s -C %s %d" % \
+        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d" % \
                     (label, part.fsuuid, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
+        logger.debug("mkdosfs:\n%s" % (str(out)))
 
-        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-        exec_native_cmd(mcopy_cmd, native_sysroot)
+        mcopy_cmd = "mcopy -v -p -i %s -s %s/* ::/" % (bootimg, hdddir)
+        out = exec_native_cmd(mcopy_cmd, native_sysroot)
+        logger.debug("mcopy:\n%s" % (str(out)))
 
         chmod_cmd = "chmod 644 %s" % bootimg
         exec_cmd(chmod_cmd)
-- 
2.34.1


