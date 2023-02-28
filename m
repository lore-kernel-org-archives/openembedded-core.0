Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE00C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 06:56:06 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.17859.1677567358783352568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 22:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IGqyXda8;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zarkakareem@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id cy6so35738245edb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 22:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=03vR8ld1MuPM6yr8WCDxLm3BQPaXhHgZMPXYYujmoQA=;
        b=IGqyXda84+vEXVdI/RLN2rB14SUUYVlSw4YIe15sd2OW1QlWITnW9oCNc/eVRogNCh
         O4/3Hrqq8A2UUlq9SA0o2ib5PcCyEXLRKkAiqJlFYc10DCB881y8qkgH9Lwg8Z/7fJO0
         x5CGiFlZ2APTa48BWatUS69pe2lX0Yrx0LjRkcp4f5xZ8MpAXvyRl0V0m/W/+PVXWKxq
         RSZO6JhHFWz1Zro4ijih+qFCMpbU7Ebm5JjMxNwas0BBLoeb/VkuqgmBEitIkrxmq9RY
         E+CgXAlOmvwBy0kQRDat6OmbaAhFnU21eW3UGFu2wA8XfDUSBeLZUjC1hNSYRcpptlJp
         duMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03vR8ld1MuPM6yr8WCDxLm3BQPaXhHgZMPXYYujmoQA=;
        b=3otwnYkiylaUkgYPJjuzLumiirN5nuHMcslNeLm81sKCuu2gVF1UwEK52YwiIR8PVn
         Wzrttr/jsDBrUE4JsN6T465ac8RSd429QRLm9ZDtt7SDH2PnzhLOte2JkbDW8VyjCftm
         sPxm0mSXu4jryoSFr0PzWdjn8b6Fz/4dPvEPifVr8oRupDZQwh1WdenlkMgAhveEpkGf
         BKgEW3DMR5Bbi5cTGyXeOm2yl35HPODkXy+GjQnh+Me1UouPOBsrJ8UX9fZZuKDtHbXV
         /bfiMEE63JGpSs27xG8eFEtEesLT6XfZo8gx0cq13BM9CHvz+zpPZJ71fmt1Fux9L7It
         jbPg==
X-Gm-Message-State: AO0yUKXco5euMlyWH9GNvZmyf0oMNRlJCqErbXF4NVbjulTHoAjMbOF7
	KR3HLAl1e797TeLmSGBEIyyqtQgxyEYLJ7y2
X-Google-Smtp-Source: AK7set/HrTqDUZ/gPBcJNWGAPj3mAKJjAyfCiVlcfDRcr28gHA9uggHkIuAl2WbP4P7hPpSVHe7Wpg==
X-Received: by 2002:aa7:dbc6:0:b0:4ab:cb8c:932b with SMTP id v6-20020aa7dbc6000000b004abcb8c932bmr1877878edt.40.1677567356967;
        Mon, 27 Feb 2023 22:55:56 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id ss24-20020a170907039800b008de50990fa7sm4099168ejb.21.2023.02.27.22.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 22:55:56 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] wic/plugins/source/bootimg-efi: Configure installation of kernel image into boot partition.
Date: Tue, 28 Feb 2023 07:55:34 +0100
Message-Id: <20230228065535.6174-1-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 06:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177820

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
index d6aeab2aad..09e9d6417c 100644
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


