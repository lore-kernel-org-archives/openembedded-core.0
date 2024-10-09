Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09182CF0454
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 11:27:10 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.14022.1728473224089349149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 04:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lvdiJnsZ;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398ec2f3c3so8554862e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 04:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728473222; x=1729078022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0By32o/C+iOFmrKlzNfHouLvy5UgXAOcr2DlyVaw4c=;
        b=lvdiJnsZvMOKBWfBensDekmSOpC8RvFsPM1o8r3lrlDW7WjfahMZDAbxC19bxiNl5P
         ToZYxXUAk70R5CznVh+mn9QNMVXhM9xeqXEC7NmaK6/YY/KqyYvBuMbZSsEPFah/9B+Q
         2YnfOiDsDhXRTi1w3onXPKVbzCpjKUOr7GOFl3CX+5TdXRQ1HY9Qn2EWKIFDnqi6hXI6
         OHuRIMeIh7Zl2YAQ9cTLpUtcrM1us7J4wRx3Qy+A1SjZhiNP3cdCnbrAxXQsljix5923
         reDnvxejUTBtv1+x0eQlgf0FIEZqzF4j8hewxxeToXd4oOZpxi/c7KzjBXl5U95z9SSJ
         oLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473222; x=1729078022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0By32o/C+iOFmrKlzNfHouLvy5UgXAOcr2DlyVaw4c=;
        b=ljZqUN/UH0nHyyzmBQhyQCaN13vsxD+3KvES5+xtr9RVH7gQ22iBSHq5TuwgR512ek
         BdQld16iL7N9ZVN4qCbphpjtaN1KE/k1tyWiA3aiFjCywJjmqOA+Zix4nUgNZjkcKAUr
         xHJRzu6kdLUaT0gUtUi5hXe0YichNJJpMbPO8mChy1vOvA7dnBtC0jj1Q9ZBeiYe60cq
         cbz+Q42IYvhhbhuB6Qnr4u8XFu/0YIjb02YmMpvKWigQg4qh+HKuySV1jPw/zI+xfG35
         wPF3vP8WN7qLq3FHGajOscg+7uQ3oBu55b/p3d4uvDcJZ6wBOnbKQDOj0foo4+c1hV15
         GWpQ==
X-Gm-Message-State: AOJu0Yy9I2NVLaSY5bRezYUn5EuChUOwMS6+DKAgxWLH09rwOxxiJ93n
	XFN0TraOXjbJfRE16FJEvdDVArTOe5xNvRsQ5b+lpTs45MWVgyUmAf742nUg77Shdjnuh63PCBA
	dlrY=
X-Google-Smtp-Source: AGHT+IF/taH+YHrorjMkY7ZdVBlNI3mz1cA6SoiLhxl/EhEwhErk3uu6aH67Qhm6K/hLvmJIUAjv5w==
X-Received: by 2002:a05:6512:39d3:b0:539:918c:5124 with SMTP id 2adb3069b0e04-539c48d8258mr1086096e87.31.1728473222155;
        Wed, 09 Oct 2024 04:27:02 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff234e2sm1449220e87.223.2024.10.09.04.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:27:01 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 2/8] wic bootimg-efi.py: keep timestamps and add debug prints
Date: Wed,  9 Oct 2024 14:26:28 +0300
Message-ID: <20241009112634.402123-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009112634.402123-1-mikko.rapeli@linaro.org>
References: <20241009112634.402123-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 11:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205350

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


