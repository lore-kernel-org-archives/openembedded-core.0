Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF9AC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 10:12:45 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.11145.1676023963189365145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 02:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=puDy5yNn;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: zarkakareem@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id c26so9691287ejz.10
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 02:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztu0yyU7eCRB1z+prHuok/xsNnT0S+t4qI2TRzCoGIE=;
        b=puDy5yNnZQgyuMW6KsiRVwj2KiA/gEiWBOYphzdRrgMHFE9KAmSIK984qONmqYRdrU
         j0RSWdWconGzABFug0MRZjgRt0ijgj15OMESRQNRER44FFg97tDQZVC3szoxCjiwjVR3
         YEyktoQ/+kYQIGKWeBtI3IcC5NLLMldCVeClgH2jpBNgOKv+6Rc6Y7ez9RzMJvhL6/Ol
         eItovFpI4UCyVeUBZmhSRnvNEKbxbWOlzP7b/tAD1M0cgU1UDXyBR82yIQDTMG+ZqkT5
         O6zpnVwzbHeeWqtd79lZSzI+6aTmsGGY0u9W7uRObvLOq3j0RfwOqiZdmdgcO9U6QG1K
         rotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztu0yyU7eCRB1z+prHuok/xsNnT0S+t4qI2TRzCoGIE=;
        b=MlZiFgQdt8F9iQyyOjCciqR3E3NyzLG6J1qdqI2zrZ53jb+uo8EXN4PJI+94pWJvIU
         Y9FihJxb9BStIWpyAIUOBP0OAl1p+Vb/dQs7yEXvErjLt7lkbka/GBc1LOfyLKYfEZ8V
         79xjGNR5xiibK/fwkB4BpLwEH6mSlGlF9mTM8K5oUUSlPMGFkxchCsm124+zSXfBXdc+
         J6ghMRBaJW+1kF834CdyD1hV2+aBhMVGi1Yzan8/ZQKyrIPRDw6C/KcLJJvPU8KInGGD
         7ewguuZH72MmlDzGw7xytqNCfeK3rA308naLpjWGie4R7rBGUDVbTqT+QbZepnjOaTaV
         Z0Ww==
X-Gm-Message-State: AO0yUKXIrK4zQOlf3z07Twc81e1wBdfYpG8QqzembX2WZyC2AkPwxLpS
	yyVH855qA/9Nh1ElNBD7yb79fvVWkrabICZP
X-Google-Smtp-Source: AK7set/auJPTF7Z90BxcKXtII/OdeGl9oAFbE29h9T4Y2r6yhImtQ1ys/8sh2PrgTsht6yU6tn+99Q==
X-Received: by 2002:a17:906:b085:b0:878:78f9:d1be with SMTP id x5-20020a170906b08500b0087878f9d1bemr13894977ejy.23.1676023961106;
        Fri, 10 Feb 2023 02:12:41 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id q7-20020a170906770700b008af42f87da2sm1732969ejm.79.2023.02.10.02.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 02:12:40 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] wic/plugins/source/bootimg-efi: Configure installation of
Date: Fri, 10 Feb 2023 11:12:19 +0100
Message-Id: <20230210101220.1525869-1-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 10:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176987

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


