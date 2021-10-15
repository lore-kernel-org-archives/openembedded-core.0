Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3D6C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 03:58:06 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.5063.1634270286404787975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 20:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JDB7bmTf;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 75so7432210pga.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 20:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WwpJmarf6FZzRJ1GWZpJjuBhD7IsUH+eVYd/9suUSu8=;
        b=JDB7bmTfWaYM49Eu0sUAzUrfgYl09snQS2HUd12T93v3+Wg718PMticr2H6ipF+la/
         JUdMVTIT23R+cSAkuUseAaB8uGycLYxKrUOFQoU+wOrsGjW/h35zRdFJXuGCk8iBAiR2
         gybkka7KJuUX/HwI3TnSjdO165nS6kQ9+28SjT+O7uog8sxPaTpyo22O+ZDgxc9NcPU1
         CrXm5NDSI0ZP1vXyM8P7h/w+JaJLeHaNG9Jy6sYFEghBjvL14ILazBOCtBT/lHvoN0MD
         0McoIl/pLhvbn7KTtrpa4XVwhb936G2WMZv23J9qAO+VIF6nzt64uLfEluW8s1CW9/Pr
         /d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WwpJmarf6FZzRJ1GWZpJjuBhD7IsUH+eVYd/9suUSu8=;
        b=a82OiVAw4IqgVyosNtgzE9h+h/wCGYvoH65rE8ImXF+aq1L9gO7pZIRiD66LsNUiYa
         jhVbEhHAzpD8CyB56QRpRlI54m5jwwWO8J6dRugczOLvHUwPZlo2lBdQ9w791IEf0KXv
         SksrVqGs7s+NDsipMatzZyBDtXwxtoVnPiMyL2QediDCg4pSGAPYOzUsNlzVtgYd0pRB
         jkqDwoer+ABmiiNEZ5mVGzzvu++NdiZ/aPtCq5741PIpg4yQocIfggu/7929JDT4oE6d
         pndypk/sFWImYQffnMiFGe/lqGQGcl8qBlFi3qFEEe2us8YGYzsjH4i95dD4MmfKCs6T
         GYMw==
X-Gm-Message-State: AOAM533Kj42puL3UrF6eIFVWoZVnv5Z8NiLt9p6ba+RbEZU8KVm0dttu
	/alKOVk5YvwrmgErbLx7jBv3e8ywIyJZxg==
X-Google-Smtp-Source: 
 ABdhPJwU3nMOCIjDaC+kXmwomwW+mvWnuClxZX4eyWUBST2PwfwpFyGhtytrq8VOicollhCDGYioVA==
X-Received: by 2002:a63:cf10:: with SMTP id j16mr7357715pgg.257.1634270285644;
        Thu, 14 Oct 2021 20:58:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 b10sm3735543pfi.122.2021.10.14.20.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 20:58:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/2] opensbi-payloads.inc: Use strings for fallback
Date: Thu, 14 Oct 2021 20:58:02 -0700
Message-Id: <20211015035803.1524562-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 03:58:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156983

This function is evaluated during parse and some machines maynot use
external payload, on such machines this fails to parse

Fixes
bb.data_smart.ExpansionError: Failure expanding variable do_compile[depends], expression was  ${@riscv_get_do_compile_depends(d)} which triggered exception TypeError: argument of type 'NoneType' is not iterab
le

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/opensbi/opensbi-payloads.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
index cc31ab3b1d..ce537c0587 100644
--- a/meta/recipes-bsp/opensbi/opensbi-payloads.inc
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -17,13 +17,13 @@ def riscv_get_extra_oemake_fdt(d):
     return "FW_FDT_PATH=" + deploy_dir + "/" + sbi_fdt
 
 def riscv_get_do_compile_depends(d):
-    sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
-    sbi_fdt = d.getVar('RISCV_SBI_FDT')
+    sbi_payload = d.getVar('RISCV_SBI_PAYLOAD') or ""
+    sbi_fdt = d.getVar('RISCV_SBI_FDT') or ""
 
-    if sbi_payload is None and sbi_fdt is None:
+    if sbi_payload == "" and sbi_fdt == "":
         return ""
 
-    if sbi_fdt is not None and 'u-boot.bin' in sbi_payload:
+    if sbi_fdt != "" and 'u-boot.bin' in sbi_payload:
         return "virtual/kernel:do_deploy virtual/bootloader:do_deploy"
 
     if 'linux' in sbi_payload or 'Image' in sbi_payload:
-- 
2.33.1


