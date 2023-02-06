Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BC8C05027
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 19:16:56 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.63258.1675711012045691397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 11:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e8OPtDMT;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: zarkakareem@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id m2so37159913ejb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 11:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLUMFPd+aHSQ76JS1VX4WwaQs83hrHOwgzWY6oAGCeI=;
        b=e8OPtDMTEbJzdA/+ozxEPRRhIQcpyCQKgSnE5pPWYAdYsUI6LHueoPKWBNWNMvD/cZ
         zNBfpXkYMWFeuC3i10gA+aG4tk4fNxRRAOI+L0Hipmp57/k1noMX51QiosF1FrJfZqz9
         IlN566b5sfV0ks8MVeKRkgTMMnDqwL754qdXPZE1j8dSgcG6lIp/PkyRHVvmHaSj1slw
         H0VpIljx4UfKDJphsbaPeGoUXmurqEreD3mlw1VvzmW/9CTGvS7TVaujhLOkCnUMN9Ul
         HQdYQEZKV520Eq+qBVVM50nR0os7M3cm3eUabKDCvSPOthqzJCU9iJD99VHH1D6loKrM
         b9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLUMFPd+aHSQ76JS1VX4WwaQs83hrHOwgzWY6oAGCeI=;
        b=vzfTW9tbRpHXm9lf5TjymIPs36aEPJAFWhFCO7S2C397FBlMMiINWgdjJpL4X9aUWo
         3qpaKIPTv/eG+DX0VLf6YRJRzT3QdWb5kQ/U5PuZJlmARhjzxrQyIm9tdFk2evHlHPbP
         Wkn3pgxzJACEP9txlN+BzIeDQtseIim8ScLr3Php7gpnx8ZwNb1DrMqnX0y3XB0sXl+X
         Q+M1SPXlhQoC/0mHdQ0Pt98e7LLGlrxiDyz5zFRN/YCrlhMqHLKkL7DVve9dPeb+knlO
         96STMHoa5iM4IoBIEl0NfC4TcI1oUks43HsG65cJctLfWDR7foifBulAn7GwBeEqGuCq
         bCDA==
X-Gm-Message-State: AO0yUKXxCA/Xf6EaFEYHQ/R4mtmmUdOMdhEPjEUswW3ACZULMwSRcugD
	FTHIqBKme+yUNSMvA7BoWyzDFoioBBvnzxv+
X-Google-Smtp-Source: AK7set/N+IyVsbp8Ei8++tMeXJ/JuXJfUDib3J+flwrhE57ucNvn5Cs6TIRhPdE/vCeiEZ7ZwxiT6w==
X-Received: by 2002:a17:906:2297:b0:887:74b2:811 with SMTP id p23-20020a170906229700b0088774b20811mr374439eja.74.1675711010306;
        Mon, 06 Feb 2023 11:16:50 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id o15-20020a170906600f00b00857c2c29553sm5816200ejj.197.2023.02.06.11.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 11:16:49 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] wic/plugins/source/bootimg-efi: Skip installing kernel-image into boot.
Date: Mon,  6 Feb 2023 20:16:14 +0100
Message-Id: <20230206191615.2675373-1-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 19:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176794

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

Tests for this functionality will be added in the next patch.

Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 4b00913a70..363b9f5242 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -363,9 +363,13 @@ class BootimgEFIPlugin(SourcePlugin):
                 objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
                 exec_native_cmd(objcopy_cmd, native_sysroot)
         else:
-            install_cmd = "install -m 0644 %s/%s %s/%s" % \
-                (staging_kernel_dir, kernel, hdddir, kernel)
-            exec_cmd(install_cmd)
+            # skip-kernal-install was added to source_params to conifgure installing the kernel-image.
+            # set skip_kernal_install in the kickstart file to skip installing it into hdddir.
+            # if not set then the kernel-image will be installed.
+            if not  source_params.get('skip-kernal-install'):
+                install_cmd = "install -m 0644 %s/%s %s/%s" % \
+                    (staging_kernel_dir, kernel, hdddir, kernel)
+                exec_cmd(install_cmd)
 
         if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
-- 
2.25.1


