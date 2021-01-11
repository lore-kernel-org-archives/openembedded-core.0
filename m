Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.32034.1610361178606890747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 02:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d0CO3dJf;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id w5so15784526wrm.11
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 02:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=876BOPz4RyR/mG2R5YTVz5ZNy8IisR0tfj8/WQ58qv4=;
        b=d0CO3dJfqc8oCzM0wpkzHMB9kUabtjmL4Vk3v3axyCNvysArvLbpqJuDzGknLIHKs3
         YH357AThMtz3ENYnRmvKZQXSsiPUxOaYnUZC+SsCT5mlTi+v6ARP43J9vpTy0gaK9SpT
         NKl9hUMQCyJVq0bJGNSUEye+bP1T86zrULRDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=876BOPz4RyR/mG2R5YTVz5ZNy8IisR0tfj8/WQ58qv4=;
        b=T0F50sbfqh2rxdiVLT6ule4+AniLZBk3033s5boM2j76WK0oYEVOnbFK4YF2kAzukG
         7eGRcbP/QSO2KCzaWzaYz9/LpfkFrIFFTp4Cfrvfmn9j+ov9vE78CuGVdlioZnG04n0G
         SIJ8e052BbfUWbumFpoCEB+01AGskfLeZ7l6VcBLF/wHZUx4nDVtJN/SYim59iOhjbba
         GJz24ojf+MpfAgBGcrh/yANtlRCdTiHXhMhZ5nxKJYsjTnV0ZRPX9dI4i6Nu1pPRDoMP
         B6pRer6YtXOCDUtIFdwisUjDMKnIRkGrsfFqRSYPVU8gq6b9E+qGs08bsoqGlA/XnTsn
         Lkbg==
X-Gm-Message-State: AOAM533al8HsfPZMg5q75uBxSJg7bK7Vi9qPgxIWcfgohD2hyq7u0oEt
	8DRufCzDPpxbsFcdIjmipT9ZPM8n7jH5Aw==
X-Google-Smtp-Source: ABdhPJyHomy3VSpz/N5wIzN4/hsRmJzQmLR2rZSDEFUTIUQe1Z3Pi8ExsOi05xm9AQbAtqQDdkEPlg==
X-Received: by 2002:a5d:6a4f:: with SMTP id t15mr16170645wrw.62.1610361176919;
        Mon, 11 Jan 2021 02:32:56 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76132-clif11-2-0-cust80.12-4.cable.virginm.net. [80.7.160.81])
        by smtp.gmail.com with ESMTPSA id a13sm23536969wrt.96.2021.01.11.02.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 02:32:56 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 3/6] wic: Allow exec_native_cmd to run HOSTTOOLS
Date: Mon, 11 Jan 2021 10:32:44 +0000
Message-Id: <20210111103247.11685-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111103247.11685-1-pbarker@konsulko.com>
References: <20210111103247.11685-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows programs from HOSTTOOLS (e.g. 'install', 'rm', 'mv', etc) to
be more easily executed by wic. Without this change only programs from
an actual *-native recipe built by bitbake can be executed by wic.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 scripts/lib/wic/misc.py              | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index a5ed780ceb..48f015de9b 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -3,7 +3,7 @@
 WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_EFI_BOOT_FILES IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
-           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
+           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS HOSTTOOLS_DIR \
            KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND \
            ASSUME_PROVIDED PSEUDO_IGNORE_PATHS"
 
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 4b08d649c6..75b219cd3f 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -138,9 +138,12 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     if pseudo:
         cmd_and_args = pseudo + cmd_and_args
 
-    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/bin" % \
+    hosttools_dir = get_bitbake_var("HOSTTOOLS_DIR")
+
+    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/bin:%s" % \
                    (native_sysroot, native_sysroot,
-                    native_sysroot, native_sysroot)
+                    native_sysroot, native_sysroot,
+                    hosttools_dir)
 
     native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
                    (native_paths, cmd_and_args)
-- 
2.26.2

