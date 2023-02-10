Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011CCC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 10:24:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.11293.1676024640749035644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 02:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DL65cqPN;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: zarkakareem@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id qb15so12493866ejc.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 02:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztu0yyU7eCRB1z+prHuok/xsNnT0S+t4qI2TRzCoGIE=;
        b=DL65cqPN2NkpPM2cD1FXNsfRXlFn4nJgipkOlu2ILxzDHm6kedZSBJPL+yA93i+gqr
         9p2XsBKlMEXoDy6vZojV5bBWkGNXJr4aU/Q+3JSWWpGrFwvhkj5Lc6+HiJ3ojMPmkiO1
         VzL+lUpzY/qcfHcy9H3ucZ+Xo4YVPlK+Xv/rjlw4SsKyszBsZ6+ntGcsuqCi+/GBzZgY
         oGC/H+QzUlkpWUB24nUiSJRIzIXzJ2cuVqXarGfe4lM6BrJZMazFLFLIlo6a1ZoCz+qK
         A3mCcdbzGdqJzc/uG2DJrfn+DbZ4JhssEhcY38tbJNDiVBAksPgBaWPARMFXCy1N/JGC
         Wr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztu0yyU7eCRB1z+prHuok/xsNnT0S+t4qI2TRzCoGIE=;
        b=nXX04MqtTFCQeJuGIkjdp5Z8aJyqNMzzvUisWbtWPedDJGut1irbn4LUN6nVEyY9cg
         1A5MfnhYg21owf4BmDxPa3JW5xHTKwaA5O5IPbnONXPUl7LUO8XQY6QgdkPZZHAbgMwy
         O/njMiTYp/r03zc322LpE3CNiiLUOi7ZlwzWasQJQ4ZqZmner8BUfysL97c2dzRzia2C
         F8ESC799gzVlT0jqDEM/TI2z4cxuWKg/keNIv2AFjTuX3v164OUu+ydB4jHVEPcuTm9V
         7RmJBysh3sbq67yBQaYEfK5nxzhw8mnnViAdoduDPJ9yjWMTofgHHq09rrrF2pEij1Ho
         vfPA==
X-Gm-Message-State: AO0yUKUpde2Vp5t2qcr2vBGvGI0hl1hu2qkn1l/v6B9ELpoF87p+LATw
	DeBrE8N1qOAV1iQx5D5rBMFxOvRr6/KXdksT
X-Google-Smtp-Source: AK7set/A3QLCSugCA1OZo8LiqvjNBE3to+NhBe6GB4kO67QmtJeTMvmRz6nk4kEjH/vMvPe7jczjSA==
X-Received: by 2002:a17:906:b49:b0:878:72d0:2817 with SMTP id v9-20020a1709060b4900b0087872d02817mr15209013ejg.29.1676024638791;
        Fri, 10 Feb 2023 02:23:58 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709060dc900b0088c804c4ae2sm2138710eji.201.2023.02.10.02.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 02:23:58 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] wic/plugins/source/bootimg-efi: Configure installation of kernel image into boot partition.
Date: Fri, 10 Feb 2023 11:23:36 +0100
Message-Id: <20230210102337.1527237-1-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 10:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176989

The issue with installing the kernel image to both rootfs
and boot partition is that some systems rely on the kernel image in
rootfs and not in the boot partition.
This leads to duplication of the kernel image, which can cause
unnecessary storage usage.

This patch provides a solution to the problem by adding a new parameter
"install-kernel-into-boot-dir" to the wic kickstart file.
If this parameter is set to 'true', the plugin will install the
kernel image to the boot partition. If the parameter is set to 'false',
the plugin will skip installing the kernel image, avoiding duplication.

Tests for this functionality will be added in the next patch.

Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 4b00913a70..4e99d37f26 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -363,9 +363,10 @@ class BootimgEFIPlugin(SourcePlugin):
                 objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
                 exec_native_cmd(objcopy_cmd, native_sysroot)
         else:
-            install_cmd = "install -m 0644 %s/%s %s/%s" % \
-                (staging_kernel_dir, kernel, hdddir, kernel)
-            exec_cmd(install_cmd)
+            if source_params.get('install-kernel-into-boot-dir') != 'false':
+                install_cmd = "install -m 0644 %s/%s %s/%s" % \
+                    (staging_kernel_dir, kernel, hdddir, kernel)
+                exec_cmd(install_cmd)
 
         if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
-- 
2.25.1


