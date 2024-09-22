Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C14CF9C68
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:42:14 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.11628.1726994532494796060
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oU/RBac6;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5356ab89665so4119442e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726994531; x=1727599331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0By32o/C+iOFmrKlzNfHouLvy5UgXAOcr2DlyVaw4c=;
        b=oU/RBac65sseBF565ucOY+DGZaFDPl/boTWqzjtNQUMmOQHNUDWt9JdptY5wzde0BT
         FvfEUI3lfkK08WPwESQC7HJLebhy3nc9Ujbp+L96h+3vzwVh3OA/k7Lm0cc5VLlAy5+Z
         u4QIZfMB6pspEdcELJ0T7II7UV561uR5RJK1yJk3aPRJG1p0pym2zX1AfkufU/bd+QJA
         pl98Iz/8deLFWCXQbPp3wGV6xHVvEZlJn/j70QOl1olKT+A+NEVWwk3PpWdGWb2t1dop
         4xzYwCPyjJUZmRD8OgEVZe3yb6KUgRfwTVknjuAVoD/6An1aVHMsWaXP5+Zw6EE3NHHA
         ib2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994531; x=1727599331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0By32o/C+iOFmrKlzNfHouLvy5UgXAOcr2DlyVaw4c=;
        b=lOtC/T38JLNfRB7LezvynX/aWgxkib//7zCi1Wu2iY4wGPeiZWf+BC4eSUtJtMXhxz
         faQJogoaYRjusMTc9WEv+MA51NS2Tv5N9ormjFHyJ94G4MCKdQf/0prUGVlkLwNGEVI+
         Q0TQZCrpOm3U6jf5fHqlBv4eYZ/ysPg0q0u4k/HdtXAX1+NRqAkzC0XRlYKCTpKzUA3q
         m/l7AMjSpI9hAmFRDLzRfqrB9RMVgaoTJCdKzyK7nuwcMrARodxFKcecCqkAQunjF+wc
         xITdBMoCLt9F8Ewl62DaVYPHXbcEQNgRZ0g4y7w8ALah8U5f/VLSi7rB9ZVD8yZAVqoh
         Mb3g==
X-Gm-Message-State: AOJu0YyFMtgFX+p/8B09ElbyxRXMaYN8uKAP3HhKY6GY06V1utu/JNlF
	POpQghdnB83HTLDXeLvGLZgyvdOgE+cW43+V5l3NQ2BbBWZS3oMoxBhe4vDg3DvTz3DmTsjRoza
	DQ8c=
X-Google-Smtp-Source: AGHT+IFa86JjL8MdzUq1OoVnyU5DFLqBgYLfsH5ru6kfrKWOKdSjc806n8GDE4BfF6tR1I4Ve9690g==
X-Received: by 2002:a05:6512:33d0:b0:536:53dd:6584 with SMTP id 2adb3069b0e04-536ad180828mr3739440e87.34.1726994530528;
        Sun, 22 Sep 2024 01:42:10 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8745sm2877339e87.236.2024.09.22.01.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:42:08 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 06/12] wic bootimg-efi.py: keep timestamps and add debug prints
Date: Sun, 22 Sep 2024 11:41:22 +0300
Message-ID: <20240922084128.9648-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240922084128.9648-1-mikko.rapeli@linaro.org>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204778

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


