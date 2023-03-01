Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7CAC64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 10:24:36 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.18781.1677666274991132164
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 02:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dhPnyknR;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id n6so12088195plf.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 02:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1914xggGb3pQhvlVRZ+BcvwwMleXMwIqzGe4tS7xSYc=;
        b=dhPnyknREe63fy/Vi6GwDPrI22Uq1qodnfW0Mc6ghcc84h6KbYaJYciitaGaopRdN8
         vqXDvwKEdzOaGz9x/vOtFlta+UCBU4RQM16hv7uYAKG0V1dZGxbcYAyM+ZdTGxR4hsd4
         z64hUnKbPu/TwC9s/ZwSNiyALmbcPqdCyTgcgpQV0PTZXkFvOgP3VWSzg7k+Ltxl39G1
         Pk2fJH+FYdXjb67lR0ymgzdYHJiFA1wHOAHVebhjcZAC1HsN/WOpJZdAoBjOConwH8/V
         oqYZIB0agvWLzTA/IK+zbb4V68VrliJzsHWKrvKftNzEhwq1qyeeQDXKSG7X8c6eTnO+
         J1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1914xggGb3pQhvlVRZ+BcvwwMleXMwIqzGe4tS7xSYc=;
        b=drHPPMML4mCXte6EUwSQ7/s/QAueUvpbL+tj/jr77UPE1sZmP269Ua0LL+H//9tJ/m
         Q2FVmFXNIXeKf8kwQZI3De9hkjIMGYZaeH6gl8n0VA+znBudEGxFeLMx3Ao//DxW2hMf
         fxjBH58iCMyHpgDBfx0P0OdPWaPtKDdBy0p+uoLbmJOegEKl1DlgJc0CVBruxXL/+0zB
         QWzYiMwJ3BijoYGESsP+tA8/rxjiA6nrIn+oSyPOEnFnswljU9ESRm6IjvljQITM/teT
         sBIl9lgIcnfVwmFGopWiw/sV2l4gKuxmly0WbHBxLSYqgVEdfhMvBZ1ExycGB7oE2MJt
         PRCw==
X-Gm-Message-State: AO0yUKXQjHncjHq/rfkb5YeJFxe6MVsntYVdDu03IsnTK8mztqslq3Dd
	IQ0uDzc3xqzF92OXOX618Hepsdwc6nw=
X-Google-Smtp-Source: AK7set+ntqn7fChrtS55oP8e2FI9zwMDiCk8SBlyg6tO2mtyhHBxLvJrI+mOxpIdMdVugP78itb2rw==
X-Received: by 2002:a17:903:284f:b0:19c:eb9a:76fe with SMTP id kq15-20020a170903284f00b0019ceb9a76femr4927493plb.62.1677666273625;
        Wed, 01 Mar 2023 02:24:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0019b06263bcasm3068956pll.247.2023.03.01.02.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 02:24:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] opensbi: Do not add dependencies if RISCV_SBI_FDT is not set
Date: Wed,  1 Mar 2023 02:24:28 -0800
Message-Id: <20230301102428.4027652-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 10:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177882

Dependencies only make sense when opensbi is being used to deliver
payload which maybe an artifact of kernel or u-boot, otherwise it should
be not added. This avoids circular dependencies when RISCV machines do
not define RISCV_SBI_PAYLOAD but do define RISCV_SBI_FDT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/opensbi/opensbi-payloads.inc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
index e590a27573..a55679632e 100644
--- a/meta/recipes-bsp/opensbi/opensbi-payloads.inc
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -1,13 +1,15 @@
 def riscv_get_extra_oemake_image(d):
     sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
-    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
-
     if sbi_payload is None:
         return ""
 
+    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
+
     return "FW_PAYLOAD_PATH=" + deploy_dir + "/" + sbi_payload
 
 def riscv_get_extra_oemake_fdt(d):
+    if d.getVar('RISCV_SBI_PAYLOAD') is None:
+        return ""
     sbi_fdt = d.getVar('RISCV_SBI_FDT')
     deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
 
@@ -18,11 +20,11 @@ def riscv_get_extra_oemake_fdt(d):
 
 def riscv_get_do_compile_depends(d):
     sbi_payload = d.getVar('RISCV_SBI_PAYLOAD') or ""
-    sbi_fdt = d.getVar('RISCV_SBI_FDT') or ""
-
-    if sbi_payload == "" and sbi_fdt == "":
+    if sbi_payload == "":
         return ""
 
+    sbi_fdt = d.getVar('RISCV_SBI_FDT') or ""
+
     if sbi_fdt != "" and 'u-boot.bin' in sbi_payload:
         return "virtual/kernel:do_deploy virtual/bootloader:do_deploy"
 
-- 
2.39.2


