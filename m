Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AF1C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 19:03:56 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.831.1675796634089634536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 11:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OoywIhvb;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: zarkakareem@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id hx15so45069296ejc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 11:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztu0yyU7eCRB1z+prHuok/xsNnT0S+t4qI2TRzCoGIE=;
        b=OoywIhvbF/ir4hEGuLIJd1be4mevyOTJoss71MZx7ce283RoNEv1MN0KLnE36dvRF1
         wVz02uwThVpBPr7nMkR6NqQfoEwdxwGUH6qj3W5LWDTvX38ooUEr6hLyHaDdr9AZF0SU
         Lh9NlUBqh6lM61isJWLngSmWreO0TXEPt90OPniG6jJS8ntUdyT6pDrQTU0jE41E+bIg
         K4XrGmztec9z62CgV12NW7UoKewgqPDxp6d10HUivDSFvkIiK5f3g4EyhS1A2aXnc6Wx
         GSWnu+eOak0Nys3zLf1JWPIRiK+EyulPYCItMugSAWM1dNYsFGhQ78msozZnbRooctOD
         egJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztu0yyU7eCRB1z+prHuok/xsNnT0S+t4qI2TRzCoGIE=;
        b=cMQiLJMlwJweCqdFBpRUhmIqdmn6Tv23uUGYjKlUmOC00BXFegMpv3BNWcOw/h4K0R
         vguHEblZzgZgs5b+Omn6kiqPoBPw2JtgTR9YrQ4qvgQ97RL0bKDFYYYFWIXpELkJg6Dw
         oX70CcyAnSb5R7DMODSm54TR7qfmu9OwVD6rEcUpufxm1LQWLIvuQLM7boLj+SjuHxoN
         hsRDHP6H93KnsH34MYiE//Ec5Ugotx0dl7y3IEERHnMF88ND65Cc2Vg/v6clYwWnFwbn
         7G5locuIIEFV5HOAy4+RQIl2Dcaio+nd2vvgxnQu1uIgy90igkWh2rHMv1XpNQ63nUss
         rhfw==
X-Gm-Message-State: AO0yUKUSMwsa2mK9vB7fAw7iepyTXURO1wMLP1DzKINgxuIhbU8zgOMf
	NnU1Ds+0pshMTaClF9r71lfetrBt5HZl8Tf8
X-Google-Smtp-Source: AK7set+nw1cs4/NEYhgGwGBK/EjmnN7WP2uNkRjrqNQWwf+Py5me2IUyV+NBTa++gkibAbu7/z0jvA==
X-Received: by 2002:a17:906:3590:b0:8aa:bf7f:3105 with SMTP id o16-20020a170906359000b008aabf7f3105mr70197ejb.30.1675796631930;
        Tue, 07 Feb 2023 11:03:51 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id gu19-20020a170906f29300b008a9e585786dsm1107751ejb.64.2023.02.07.11.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 11:03:51 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] wic/plugins/source/bootimg-efi: Configure installation of
Date: Tue,  7 Feb 2023 20:03:04 +0100
Message-Id: <20230207190305.3071923-1-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 19:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176829

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


