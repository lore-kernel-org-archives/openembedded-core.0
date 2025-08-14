Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3504CA0ED1
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 04:26:19 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.15478.1755145576741552651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 21:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=DdGk+Vmp;
 spf=pass (domain: underview.tech, ip: 209.85.219.41, mailfrom: vince@underview.tech)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70a9282141fso7467246d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1755145575; x=1755750375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnhWm4HTU8auWxhAYl/6t0HLjjhzJ4uhXsqEXynPhVk=;
        b=DdGk+VmpSCK8C8sXzDQejDPdPCOwXuxYpJXZ7nrm+fm2tQuCzATAbfNeRTxF/SqiAC
         j/0z+BlybawJTJr1W/hA25nEnk1K4nKXHllebj1BC+wzQJGKb0HC38huPyEOqVnBjr3H
         nyGowhZcNvO3ww0VXabvP7aU7U0WuMY9W0y+A4nYY2Byn/XWXZYoq5UvlMlQl39ZW15S
         Zvrz0XKh2JNBXvl0qi+WYQU9+/+Z65Oe7/NUNe9dD+TGbHReRnFJuGZAODsP+L/lyaZu
         lDOhe8gN0JDR3W9V3w+kyIhz9L/4FKjNsVN9KWmsn/A2z1i9UYPkW4vv/2GuaYuNNp7L
         P4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755145575; x=1755750375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnhWm4HTU8auWxhAYl/6t0HLjjhzJ4uhXsqEXynPhVk=;
        b=KgMGyCStNIwyCxbySnwGILFRDH2NUfwqPCAQbToMb7vJMesIAD74gMuHYqsfN/QEBH
         TcIHZm/h4+2lztuU763slAvNABKD04SxwwiqkHitgclcRkhIYD2oADrv8vniRP0FlJAe
         9TA6YmhMTYwWodCKhhMoDNyZApmhxzmR+paoppaVHlk+V+GevS1U6H0LwekF4uv+ffd3
         RAh0AFfqMWNg05SS24MwVBmYaFfr3yg7Ud62cg0ZJ9OtYS3cBTuLQQqiTIBm447q+nFF
         YkvlZDLTm3wC5ww9AzFqb54sSzqWA/zDekWNQ4dzWdSPITiHlch1HCDflT/eFMJtw62Q
         ZXxw==
X-Gm-Message-State: AOJu0YyQXq7O2yCcXUgEDYwFp2Ov8PHaDLaSK1Vtt81/+cJ41uPrD3V2
	Og3UXgfUsqneJLwZcwu0nVS6xfLwSjWoSCiwEV81Ivvh5zWk3n5hAjxskOgaHgWTLmSJgmjFIiD
	ReHSc0Bw=
X-Gm-Gg: ASbGncufrFDtIVeOzH5Nt7q5QuSoVOBDJSr7o1ZvLpf4knuLn1/n+2BJM+qUc5V6kfw
	8hbVwZv6I71JvesyDlH+XbNFvkcmrQitL/wuKY+KpPRdOYK+uH7CLfFYZkxiOdt6VNgDT5sDGm+
	ALpBkYhZkEXnsJQ4NSM5fHpJ6JIZ3FABo1wgY75xyPe7npqYIHoaw+1keO7qKvboXZDH3HCglWl
	g6a8TLX/cleTVEbVjmrehlGJYUENpixqwjdOv0FkR/+RDCgRbpNbKaRlSLf20fDTkDcCgcgZ2kb
	w2nOspfw1KBz3sl9kCdQPrkY3+TerKjcWBw08HC/osDz4FkhvMz35y9uGNPHFQ/u1r8FW74VTsG
	vJffOnkFFXinCRVFwYiQQQu27LO/zYt+PUIxPY5ASjNGZ7A==
X-Google-Smtp-Source: AGHT+IEvRlty3MlMKRExoq2e6v1iIa2q3kRsPZ5yLQGfAbeUz+fR8OdtNI54EUeBFOOI9+3jDfsdWQ==
X-Received: by 2002:a05:6214:1c8d:b0:707:4daf:641 with SMTP id 6a1803df08f44-70af5b2d44fmr31392156d6.39.1755145575441;
        Wed, 13 Aug 2025 21:26:15 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:e358:dd1a:4ea0:986c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6cb6cc2sm8322816d6.22.2025.08.13.21.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:26:15 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v8 8/9] bootimg_pcbios: add help and usage comments
Date: Thu, 14 Aug 2025 00:25:51 -0400
Message-Id: <20250814042552.21887-8-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814042552.21887-1-vince@underview.tech>
References: <20250814042552.21887-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221848

Adds comments underneath class declaration
defining plugin usage and potential
optional variables to set.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 1fa9d895bb..caabda6318 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -26,7 +26,48 @@ logger = logging.getLogger('wic')
 
 class BootimgPcbiosPlugin(SourcePlugin):
     """
-    Create MBR boot partition and install syslinux on it.
+    Creates boot partition that is legacy BIOS firmare bootable with
+    MBR/MSDOS as partition table format. Plugin will install caller
+    selected bootloader directly to resulting wic image.
+
+    Supported Bootloaders:
+        * syslinux (default)
+        * grub
+
+    ****************** Wic Plugin Depends/Vars ******************
+    WKS_FILE_DEPENDS = "grub-native grub"
+    WKS_FILE_DEPENDS = "syslinux-native syslinux"
+
+    # Optional variables
+    # GRUB_MKIMAGE_FORMAT_PC - Used to define target platform.
+    # GRUB_PREFIX_PATH       - Used to define which directory
+    #                          grub config and modules are going
+    #                          to reside in.
+    GRUB_PREFIX_PATH = '/boot/grub2'    # Default: /boot/grub
+    GRUB_MKIMAGE_FORMAT_PC = 'i386-pc'  # Default: i386-pc
+
+    WICVARS:append = "\
+        GRUB_PREFIX_PATH \
+        GRUB_MKIMAGE_FORMAT_PC \
+        "
+    ****************** Wic Plugin Depends/Vars ******************
+
+
+    **************** Example kickstart Legacy Bios Grub Boot ****************
+    part boot --label bios_boot --fstype ext4 --offset 1024 --fixed-size 78M
+        --source bootimg_pcbios --sourceparams="loader-bios=grub" --active
+
+    part roots --label rootfs --fstype ext4 --source rootfs --use-uuid
+    bootloader --ptable msdos --source bootimg_pcbios
+    **************** Example kickstart Legacy Bios Grub Boot ****************
+
+
+    *************** Example kickstart Legacy Bios Syslinux Boot ****************
+    part /boot --source bootimg_pcbios --sourceparams="loader-bios=syslinux"
+           --ondisk sda --label boot --fstype vfat --align 1024 --active
+
+    part roots --label rootfs --fstype ext4 --source rootfs --use-uuid
+    bootloader --ptable msdos --source bootimg_pcbios
     """
 
     name = 'bootimg_pcbios'
-- 
2.34.1


