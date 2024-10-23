Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0958CDDE74
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:09:20 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.7131.1729685359419861491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zoEtHz+Z;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so72641791fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729685357; x=1730290157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0By32o/C+iOFmrKlzNfHouLvy5UgXAOcr2DlyVaw4c=;
        b=zoEtHz+ZWw2ewk76BPvmyiNJI4eh/i5ChIUMBKG4i3vuZ7xkKQvRJRuuYl/qBNbbYg
         vswAp0ZlN6zKizZtduYFTIjo2oHVYHpV/Wum6pow72PH9Ow1R0Hd0WaS5ZVFtTFCq8bs
         zcFEzplIT/00GrQgz7QbpnYjBl1Jn1EUQohonOJ0zRNEDhialKeBpsmVkc0Zv22mcooW
         jurjDJshXnN596qmGv1UqYfegQrFdetX7PfKO7z/ypuirFEHvfIHDhUXDiVm1FNLflL5
         IxuLxeICJlplV08sMfDtFd39KlTalD2346FKO+lgvpBZHp/Tn7Bh/Ly8kaPgmwA/B4sn
         3X/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685357; x=1730290157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0By32o/C+iOFmrKlzNfHouLvy5UgXAOcr2DlyVaw4c=;
        b=vKo6r0jklo9J5x7L2zyKiuyjdqWzkevtqBDLSxe6dMgywoRjD9r+GeszRXyAB060Im
         VDaE3pJ3pTAHPF+w96VJ9//wKAtnCOe+/yMORIsKoITvQtgu5i+AbQ2m3PhDdNIeP2iw
         xfQ+bG9ppyJEDNvR0SfQTRXBCf5MmJwUe7jD3KOu5o5q6FwQOLAOGp1vSBMaXmaorqGX
         LUfL4YRzbcn1/M71+IQYOJ+BYNAwVG7BRRcrgGPYC2NO8Flfh9Ah2NaoIMAvdRt6ngcK
         IbjQxA5iXsioc5mcSDCDLrrBXxwJK2EEhEstuQL9grsjtUGVHKtsB5aUHkHZnuQYtb5h
         2v2A==
X-Gm-Message-State: AOJu0Yy1AoU4PPNSql3VjwQmzZp7/6lnSH3I3U9OrWKS4M/K34SzWWUw
	pxn9nbMcGJV8sn4ivN2OGirUIBeDl7uk4Kh5gWPiESmUOOljTLutn4io7KLRUCv+aWlLX4ALIy9
	KUGs=
X-Google-Smtp-Source: AGHT+IELfrTNy6hmlIu6+RYvDW60ss8lbQP8qVjS0bXVOeqYvIGQGl/ezJ2taSpyCZhhy1E7tVJaQA==
X-Received: by 2002:a2e:a554:0:b0:2fb:3d86:d932 with SMTP id 38308e7fff4ca-2fc9d2f77d7mr14830961fa.12.1729685355634;
        Wed, 23 Oct 2024 05:09:15 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae25d87sm10763801fa.139.2024.10.23.05.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:09:13 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v10 2/9] wic bootimg-efi.py: keep timestamps and add debug prints
Date: Wed, 23 Oct 2024 15:08:32 +0300
Message-ID: <20241023120839.437771-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023120839.437771-1-mikko.rapeli@linaro.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206203

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


