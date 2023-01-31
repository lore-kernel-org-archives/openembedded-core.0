Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11DCC38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 12:05:23 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.10439.1675166718596807336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 04:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HhTleWkG;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: zarkakareem@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id mc11so18431122ejb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 04:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JA5rAavUWL9nmDTtYojiGH9DhDqgk+ZT1gh3sBapI40=;
        b=HhTleWkGdC+xSr1skzzTe2RKX5Etp7OnvGW4OL2hKM7UMZFf/7+sylXbsfhByIL4we
         2504jxuIbNm0PpH+vN8n3For6Omik+2nNzfbri8QAroEJzhPwVJJloUoid50zpZmKUVm
         3ZibSF8rlhzKtF9n3q2bymTM7YsJDXmP20Wz69qvxpyfneoRw/ji4eIuVHfXMEGapcnX
         LchxdEjIBKKLl6Dio1ei0HhA2ve2NCteTR/QB7bmOtuE5KQuq2Hi8Xoaflrn4Ed3Xq9z
         2NeM3Zoaiv6pwNLtzsJfIwAK1g0Kj2HcapUC8xvYxu+lhCEa0J1VZfoZHEaxK5Fs6nes
         BTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JA5rAavUWL9nmDTtYojiGH9DhDqgk+ZT1gh3sBapI40=;
        b=N3qysuOp49AjLcadQ8AjOYmh/JtdZLMrXn0GcNT4KeQAryTzaqwhWPDiIL6vNZlCae
         dphD1O/06In1QG2VFXbdQ7wFyaXArG1f6N5zyyPCeknvEZ02YPwFF4djj3kSr/gc0OUf
         /8KJGxaayW5HonjEmP4D8W8SsJVNX6Foi/ZEWY7+OM7NBjOQYPbDDqlTa9+fs7+R4ymo
         mKUYEzdZxAKgN5ZTnJFrQxwM2MT/eKs9A3P+vN0YiLP3SREa6C4WniBL3z4s/HawsGBQ
         ijPL0Qa0tTDZrXMQ+0gKY6gLQQl5UFewqc/h2zpHdXqiS94A6H9EIMszN20fXgVMAExP
         fkxQ==
X-Gm-Message-State: AO0yUKUyivgKPQGRCOyUUsXLgpL+Y+J8MPVviGUc7FG7MDMj087RkXD4
	OYVsLIyupWtyUMWo1sYSSpBoAyctS+Nvgrs9
X-Google-Smtp-Source: AK7set/WXOnlJ31aA5iGCCqR9leg1nJGfSMUBKYIaG6VlQfbQB1eKFsrL2I0htlg85+U6viMYwDJYg==
X-Received: by 2002:a17:906:94c5:b0:87b:d2b3:67ca with SMTP id d5-20020a17090694c500b0087bd2b367camr15699583ejy.75.1675166716710;
        Tue, 31 Jan 2023 04:05:16 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id jt18-20020a170906ca1200b00889a9444e29sm2529351ejb.14.2023.01.31.04.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 04:05:16 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <kareem.zarka@huawei.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Andrei Gherzan <andrei.gherzan@huawei.com>,
	Zygmunt Krynicki <zygmunt.krynicki@huawei.com>
Subject: [PATCH] bootimg-efi.py: Skip installing kernel-image into boot partition for rootfs-reliant systems.
Date: Tue, 31 Jan 2023 13:04:55 +0100
Message-Id: <20230131120455.2966241-1-zarkakareem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 12:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176517

From: Kareem Zarka <kareem.zarka@huawei.com>

The issue with installing the kernel-image to both rootfs
and boot partition is that some systems rely on the kernel-image in
rootfs and not in the boot partition.
This leads to duplication of the kernel-image, which can cause
unnecessary storage usage and potential compatibility issues.

This patch provides a solution to this problem by adding a new
parameter "skip-kernel-install" to the wic kickstart file, which can
be passed to the plugin.
If the parameter is provided, the plugin will skip installing the
kernel-image to the boot partition, avoiding duplication and potential
issues.

By adding this new parameter, we give the users the option to install
the kernel-image only in rootfs, or to install it in both rootfs and
boot partition, depending on their needs and preferences.
This will help to improve the system's storage usage and compatibility.

Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 4b00913a70..e04d49abe6 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -363,9 +363,13 @@ class BootimgEFIPlugin(SourcePlugin):
                 objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
                 exec_native_cmd(objcopy_cmd, native_sysroot)
         else:
-            install_cmd = "install -m 0644 %s/%s %s/%s" % \
-                (staging_kernel_dir, kernel, hdddir, kernel)
-            exec_cmd(install_cmd)
+            # skip_kernal_install was added to source_params to conifgure installing the kernel-image.
+            # set skip_kernal_install in the kickstart file to skip installing it into hdddir.
+            # if not set then the kernel-image will be installed.
+            if not  source_params.get('skip_kernal_install'):
+                install_cmd = "install -m 0644 %s/%s %s/%s" % \
+                    (staging_kernel_dir, kernel, hdddir, kernel)
+                exec_cmd(install_cmd)
 
         if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
-- 
2.25.1


