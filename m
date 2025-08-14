Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40F7CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 04:26:19 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.15476.1755145571717625721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 21:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=fzUl/nWM;
 spf=pass (domain: underview.tech, ip: 209.85.219.50, mailfrom: vince@underview.tech)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-70a9f5509f5so5419736d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1755145570; x=1755750370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBKRFSS370kTonC5vGdeLwS/U+ATyMsp7AFQ6ttUiLI=;
        b=fzUl/nWMU8F2qb6bNrSiR6vb4odj0GfoUxyVdj3jJ+eQl95yH0RG3ofxa2zq8U8iZ3
         XqTmoI4sk0Z+45NGhJ5Ck8xI6uS5snEbf2s4yA1wqIAG7KtAv+umVDraE6YCVfX93hIh
         nq62/ZJv0O1F0ArVXjCs6HbDS32gnBMFEIoixx8SLq+uVJsVpbEc6ynxKDL0hfGVYGO1
         sQ0A21qykBbIc3QIMYf90TWetCS0ecZnjkuEnf8Cf0vYrVAlafAYLKlOe/npvPIjBC9z
         SxTrvIsnBNAA3pNVue9CfJQ4jmOcinyjqtW0nnMgDIBi+8NcwJsMtJiARbJP+mZwmJS/
         rnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755145570; x=1755750370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBKRFSS370kTonC5vGdeLwS/U+ATyMsp7AFQ6ttUiLI=;
        b=pNf9sbXI0VWHHE4wxKP+C23wAmnLa/AGe9GUuQoLicNGFdhZZfzPE6Aq8u/BMbNO3l
         iijkhiOfHRpHpEDnuq5Usox5OxNNE0LACnatgfw4dOQ6poeZS0nbcJ+ywdaqahdoUNZ2
         meEkbNmicw6hqwEfb4ZivF4P7B/r0n3Ey0hUTzAWYzUwQRJ4UrQG4vVtOvo9H64lrPkL
         1I6EMj4A8dPnSCXcrxvIO3NGg2RYpTdA0NDcERqur/TfwcnNf4vgzK+py95LKQib+ZwZ
         ld8U8+zyZ57nj8vSJgErF7uY0jQmMb9Z1FVGdfRxj/7yYD+7Xmggt00oKy5XL+p1CIc0
         CM+Q==
X-Gm-Message-State: AOJu0Yyvj2rOLFaEW7DIiNQM1QBpepMuYZB6GTfUJYT/fL5Kh/R2cQLy
	015AJ6zsmK5mRmWfObsR+vqb3yYCpYQWqaUZOkd+EmxGAs9bN6JVUzWS48DmxebJtzEB785k4aU
	TlU0sjvQ=
X-Gm-Gg: ASbGnctP0HQy5Gsge/Xz0KZVjU5I8EL+Aq2p/RZcy2l8IMfj3LIgZPB3aCkE/kdJtmK
	oncUzQVoWoLItb7a0rscm0R9JljxPL4hnrCJ4iCKUiVHaXU77r8KGQlJyXPD2vHCd4vYTsBZDjD
	PLRPGboBv2mqRb07DQAeIUTNQhx0TVL2C47IJoflTxCgEKoALb3eD7RWpjq+VNEZsvPIzyziZmj
	LYjzgcBdfuQz07XLF/SI2bbIlwdI4lpL80M0V29zpwtXC6WApyI2gRO+v9m/QKHiZhlyBLQhFmk
	IKyeyZDprhl8/kx7ZuSvIRjQKCHVFc0muaMxkYUdnBTReTz409xfw0FLrI0tTqkKaopF6VCq23G
	nlPYj0GoV99D4KL0ALeGp42Qh2gCWTe6bPmMIwXh2v8YOgw==
X-Google-Smtp-Source: AGHT+IHFhVpG1s3vkLRNeYpOrhrwRr3ozWotcjDu6XYXYzOLEPA4RyR7oyvWaHQlJsShSzJP6kbLWw==
X-Received: by 2002:a05:6214:493:b0:707:4229:6e8c with SMTP id 6a1803df08f44-70af5b93968mr29525716d6.12.1755145570462;
        Wed, 13 Aug 2025 21:26:10 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:e358:dd1a:4ea0:986c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6cb6cc2sm8322816d6.22.2025.08.13.21.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:26:10 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v8 5/9] bootimg_pcbios: cleanup prepare and install syslinux funcs
Date: Thu, 14 Aug 2025 00:25:48 -0400
Message-Id: <20250814042552.21887-5-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814042552.21887-1-vince@underview.tech>
References: <20250814042552.21887-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221845

This commit:

1. Removes unrequired function params from
   	* _do_prepare_syslinux
   	* _do_install_syslinux
   Reason is that they aren't required by
   the function.
2. Moves finding of resulting wic image
   back into do_install_disk task. As
   the same code may be leverage to install
   other bootloaders to the resulting disk.

Signed-off-by: Vincent Davis Jr. <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 887a548cde..a4fabec0ae 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -50,9 +50,12 @@ class BootimgPcbiosPlugin(SourcePlugin):
     @classmethod
     def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
+        full_path = creator._full_path(workdir, disk_name, "direct")
+        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
+                     disk_name, full_path, disk.min_size)
 
-        cls._do_install_syslinux(disk, disk_name, creator, workdir, oe_builddir,
-                                 bootimg_dir, kernel_dir, native_sysroot)
+        cls._do_install_syslinux(creator, bootimg_dir,
+                            native_sysroot, full_path)
 
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
@@ -66,9 +69,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
 
-        cls._do_prepare_syslinux(part, source_params, creator, cr_workdir,
-                                 oe_builddir, bootimg_dir, kernel_dir,
-                                 rootfs_dir, native_sysroot)
+        cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
+                                 kernel_dir, native_sysroot)
 
     @classmethod
     def _get_bootloader_config(cls, bootloader, loader):
@@ -144,9 +146,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def _do_prepare_syslinux(cls, part, source_params, creator, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
+    def _do_prepare_syslinux(cls, part, cr_workdir, bootimg_dir,
+                             kernel_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
@@ -218,8 +219,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
         part.source_file = bootimg
 
     @classmethod
-    def _do_install_syslinux(cls, disk, disk_name, creator, workdir, oe_builddir,
-                             bootimg_dir, kernel_dir, native_sysroot):
+    def _do_install_syslinux(cls, creator, bootimg_dir,
+                             native_sysroot, full_path):
         """
         Called after all partitions have been prepared and assembled into a
         disk image.  In this case, we install the MBR.
@@ -240,9 +241,5 @@ class BootimgPcbiosPlugin(SourcePlugin):
                            "have the right MACHINE set in local.conf?  If not, "
                            "is the bootimg_dir path correct?" % mbrfile)
 
-        full_path = creator._full_path(workdir, disk_name, "direct")
-        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
-                     disk_name, full_path, disk.min_size)
-
         dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
         exec_cmd(dd_cmd, native_sysroot)
-- 
2.34.1


