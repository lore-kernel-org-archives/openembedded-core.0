Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9DACFD377
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 12:21:20 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.10038.1728649271205605446
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 05:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ywwpri2Y;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398b589032so3374047e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728649269; x=1729254069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0By32o/C+iOFmrKlzNfHouLvy5UgXAOcr2DlyVaw4c=;
        b=ywwpri2YgsbR//+Vw8O2cEs1VWZ3dLx5cStUhzPE/3v/Q6e90DcPiwtFDFK01RY6u6
         Nti3/T6MrLUDrqL0dAwkP3cN3cuodXM1g3AbqO5JF58lycTqrjaLdBlcpLQHlKqONBYL
         wZrQoVFLKUkiNkmFxQZfymNVXwAYlihXeDORYEbiZIlkITLbXM9Y7cqYAIUU0V2UZzyw
         qFJe7DuhzChM1r1/vl+6sHTblQf5jqRYrNin/nCOR+AJ32+xgcbS4eOr6WHOLBgBRHeM
         N78XWXNYTxyMvZGUXM5hp0lvmA1YuVqVb7BhdoY0GwCMXsssUXHZOBoRqsXCauSzYnzJ
         g8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649269; x=1729254069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0By32o/C+iOFmrKlzNfHouLvy5UgXAOcr2DlyVaw4c=;
        b=cRWORrde5JJteq03o3WVVVUsp9/c8tQ/fXfVXPSwsQoXU0QpfIFphc618kOLs7OcWx
         mrKVIO1sORft5qcyyJuD7kBgXCx85LcpCIWco1TBzP44x8iRODF5MH432dFxfqIlCofu
         5NOdf3AHGjT+kbaZ7Q3DY4gqcXJzjwaxYdbR7bVO8OCAy51CSXNv+E73P3IpYaulLjeK
         2wR2qH7ab92NwZM+pyNXNwH9SEtL/PBYVBHBsM8+N7wd791KKPj+J0CRyg7QHRT/NsoA
         341VpYNvoNapLLf/4qWRjLw64hnry4WZcl/2jra9cFKVKJckwqg4Dhm6vZH5Bbccnc56
         3vfg==
X-Gm-Message-State: AOJu0YyO+84JIUJTp40yza0W0QeaA5LW97iyYznGScEcH5VysNAo11JP
	yxp6w/gDBEFNt0MQK30KTn/DnFswPd3TrzhJ5c0Uwb62zspaS3l88ddy7jtAz0Njf9EkMqHpZH8
	cfiU=
X-Google-Smtp-Source: AGHT+IEZLltPnHCYbS7HBHfVeC9SammYtd7POs78utX8A5nHX8yKYOw9s5Sn8PsklNfUZb3vcyIFLQ==
X-Received: by 2002:a05:6512:2211:b0:539:9fbb:4331 with SMTP id 2adb3069b0e04-539da593919mr1843924e87.54.1728649269129;
        Fri, 11 Oct 2024 05:21:09 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8608sm591336e87.89.2024.10.11.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:21:07 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v8 2/8] wic bootimg-efi.py: keep timestamps and add debug prints
Date: Fri, 11 Oct 2024 15:20:38 +0300
Message-ID: <20241011122044.12222-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011122044.12222-1-mikko.rapeli@linaro.org>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205687

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


