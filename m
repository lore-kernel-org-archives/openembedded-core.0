Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6251AC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 10:35:20 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.3917.1678271710311344857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 02:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e2+pEYdg;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zarkakareem@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id da10so63843948edb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 02:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678271708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=03vR8ld1MuPM6yr8WCDxLm3BQPaXhHgZMPXYYujmoQA=;
        b=e2+pEYdgPiBZmbeOxplyCLwmZLbLnA9phQp7VtovSet7pgraX7m3JwAvd37cjrgmA6
         RmRxEP/6OPampARSMuK6mm/+IhR/SU0j8o9znTBGlmjj9HzEyWeMXA7325snj1+4Eum6
         TtYzvDLfDag/PHh6lMVWMuWjvcikO5MnYUADAe/HGs0NZtG6ck51K9sinegKQbBLW1rj
         41mdykAuorwPdd2wlUyGvCb+QcQGu/6fnNtpWKnoA9SfWuhsOHlvdDqrb3t+cM6bccvH
         Lm8tEXEUf3d/wzEq6DHBfP5w9JOVu54kVxzgW5eRlVGVOZpq3c9dKGA4DKacGmUDoWRi
         Ah4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03vR8ld1MuPM6yr8WCDxLm3BQPaXhHgZMPXYYujmoQA=;
        b=oK/5gsc0V4I2NlJ5Mns1hZ8DLc9hNyamQH71OI+eAVhGyRsBIBiGtb2gEA8D3gkKlB
         6/JcQ2TLRt13cPW4jkv7BEhe0hHexN3GqfsJZ6O1TgUK5SRenjgo75/k9zTj6WEGp9e+
         RUiIaISMS66r0QANc4sS9ZzZzCvRSodeoWtfMnsTsemkf6sW+TbUsk+xTWX34LRDWz3b
         oMPTaNlRZNPgcxJkg+zrJ6KyBk80PWLOBeOhJZv98aveBlXiSfYccoOYUihxnWr0FCaa
         kSm4b0Kbvi/uPHnvdOsJ8jcZYdG321Zd1tpF6HocY+hZgOusWKX/WWeIHNueWeZjW0/a
         Kj/Q==
X-Gm-Message-State: AO0yUKUL/PMMQrHtbsKJ+2w85Q0Wt39DYLwFHvS1+0STxyHGY9XJqGTd
	CTyBlApyvAVWBW+Opqz1CYxWW43yWGnDoCtj
X-Google-Smtp-Source: AK7set/5O90Rfkz2uQPCqGvwqpofUDH9EYKAfAasKrend6aKmX+TkKk9azUK/lTmccPIs/CqaVrhoA==
X-Received: by 2002:a17:906:374e:b0:8af:2af5:1191 with SMTP id e14-20020a170906374e00b008af2af51191mr17731582ejc.18.1678271708330;
        Wed, 08 Mar 2023 02:35:08 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id n24-20020a1709062bd800b008b17aa6afc8sm7301490ejg.30.2023.03.08.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:35:07 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] wic/plugins/source/bootimg-efi: Configure installation of kernel image into boot partition.
Date: Wed,  8 Mar 2023 11:34:47 +0100
Message-Id: <20230308103448.2134894-1-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 10:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178164

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


