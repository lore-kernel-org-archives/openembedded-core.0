Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BC3C678D5
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 14:37:50 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.19018.1677249460562653356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 06:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E/txjaIk;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: zarkakareem@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id bw19so3500353wrb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVKLO+lRrlLAmS+OcShAfQXU7qCxG2mXdbOr1b0jckY=;
        b=E/txjaIkIC5l1w/6yhp/ccTlDZRldc3jCvtSuqhglR3UUAwkWZNxg0s1JymkePaV1L
         JEHrL0KNzhDmtwjyP/2Q2L0PI8Is6Pa8sh5IaPmLo0Cst4iNoKUV3dmVX9kZy3txdEkX
         drdE0yosbIy8rhb36vfoAtvedAPlZ3vF+FDxeQB9Zdyh08o36+pqAIpxg4fm8PfmKsLB
         isfCxli0FV9GrbferX9MjNH1artYn/YqZIObkigdF2wtOi113gTvDmFtH93taB/p1ZOX
         DgZXWwqeowlr3Ed59u8NOMa1y2Zf6Dvyt491LY++/Zzl5Iw/I6QMQgiDnNcAOQDusoX2
         exXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVKLO+lRrlLAmS+OcShAfQXU7qCxG2mXdbOr1b0jckY=;
        b=l7tyBPgWRLWCyCD6kHMXh4gnSFmKfygyrRzL/s/3q8TdipRW1gvVEK3G2e5esydHHj
         6HdWF7WKf8oSvXmJG7q0HBgxxw+1Dat+q7QABrQIqW8hhq0sohLfIbhapg61UeppMEXK
         9AOx/DnNkFoEp2xT5hW71183KD8/Cpo+jRur19dcbinMsukyveMTxGeceA42WXH5nMw7
         oAZXvVBp485IE2oFLgF0abZnFFa+mJv9mrxOlGXK7rfLbi8R5H8uKjKQrG2f68KaPvg0
         Xpg2eDirSGGThV9cLj9LWSwcZMZzaggfk7MnYOw9ZcMinoU80ttc3PxdFn8sBSmVIl9B
         eqfg==
X-Gm-Message-State: AO0yUKWHZBSUf8JYwl7PZDI/a6tygtzu5LwyITTA+WtBWGwZTifo+BZR
	2RenDxXCy+PTLGWcb8ckT5ZOR67BZREas56O
X-Google-Smtp-Source: AK7set/1nXn92aR/oqXymM8ZIeCcfiYpzyoTAv6tvM6ANjSRTCtdd4QYQXBdImDAjGhSAwe/Go5bcw==
X-Received: by 2002:adf:dd45:0:b0:2c7:a55:bef5 with SMTP id u5-20020adfdd45000000b002c70a55bef5mr8212422wrm.23.1677249458639;
        Fri, 24 Feb 2023 06:37:38 -0800 (PST)
Received: from kareem-XPS-13-9370.wtcombo.net (93-46-174-218.ip108.fastwebnet.it. [93.46.174.218])
        by smtp.gmail.com with ESMTPSA id i16-20020adfefd0000000b002c552c6c8c2sm10907813wrp.87.2023.02.24.06.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:37:38 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] wic/plugins/source/bootimg-efi: Configure installation of kernel image into boot partition.
Date: Fri, 24 Feb 2023 15:37:15 +0100
Message-Id: <20230224143717.2669400-1-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 14:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177686

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


