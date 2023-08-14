Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9374FC001DE
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 02:26:00 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.99478.1691979954982765980
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 19:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YxpUOXjD;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7679ea01e16so319156385a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 19:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691979954; x=1692584754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJ1DC7iLAVWF4OURV2AAD4dtJQVtkU7OuFuDKpo3bFg=;
        b=YxpUOXjDjdb5hyQmdOvFeyoeVlXsNr5+56OCYzCtCCvA7v/znmXS3JXIBp1da8u2TM
         WTO7KsMsXfHqW26xD9hJVaAOPvUTl8uj/2LrD19vql1n5r3uRLsYJj4/KeANEdKGcMue
         H2EpAA7MAs23fhyaJYA8Wzz9KWsfOte5GI4jU7sMclI9k4p0AmNA+Q6vicj/bJcijMYA
         3cSSysF7FWCXxVqhWewLYl1bt1EGpnic3w6pBb5VhgTC1xYm/JFd71Zz2HyQOy2b53BO
         dp61qpUIygGPKaK5l0fiqsPZ+qjlELi1SxurclqR4TkBWujvcVbLtvt2y1Mv5HkhuYg0
         BvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691979954; x=1692584754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJ1DC7iLAVWF4OURV2AAD4dtJQVtkU7OuFuDKpo3bFg=;
        b=lTwkorihgkgWi4s41N9iV4ZC9qFad161qB6WMOAfdp/QCyIcsZ53gaUqR7lWjGcKTY
         OaAbogqt9N9Nd8hP8cocoMdvpGyW4+1guNzNO3actH941N4TBNKma3dfnJHB7bXPFuB6
         hkzOhxWLD5yfnb1U0yrv1m6koVFkMz6xSQe3XxE71zUxTnlGcNGlV+EoPX1+gPYHacQ6
         cGrrksAqOeN1AcZyHCPUmm1v4KQXnPVYiKspR7LiGXjtWfZtTVzdyhBBJAhA/FoT5VDp
         6eEpILdCZrBRqJUgsDNoLoOaY4RBPDtQnKBJ7WlP4c0SLA/5XEDLny1O9KEj8YPeOqgx
         4piw==
X-Gm-Message-State: AOJu0YxFPEgRqeDmMxze60iLpQuyN0g8tLc9g4ENCP5wuK/JcBsLT5Qw
	JLfSkPqv1naPPcgqiMIpI+hfZnmBggZNhw==
X-Google-Smtp-Source: AGHT+IGMStuubNpk6CHyiq4hUsgX0AzMpUDT1aVzB79oPFkj7+FAotvaJK7L3W2ptDEUam2GkR9bmA==
X-Received: by 2002:a05:620a:298a:b0:762:4e2:847b with SMTP id r10-20020a05620a298a00b0076204e2847bmr11143832qkp.54.1691979953733;
        Sun, 13 Aug 2023 19:25:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090a070900b00267b38f5e13sm7426402pjl.2.2023.08.13.19.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 19:25:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] kernel.bbclass: Use KERNEL_STRIP instead of STRIP
Date: Sun, 13 Aug 2023 19:25:50 -0700
Message-ID: <20230814022550.357118-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 02:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185914

Kernel uses its own variables KERNEL_* instead of general toolchain env
variables, therefore use KERNEL_STRIP here explicitly, Problems happen
when using llvm-strip as default STRIP in distro settings, since kernel
defaults to using gcc, system does not stage llvm/clang toolchain into
kernel's staging sysroot and this function ends up with

FileNotFoundError: [Errno 2] No such file or directory: 'riscv64-yoe-linux-llvm-strip'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index bb5995b4954..acb43bd4d57 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -760,7 +760,7 @@ addtask kernel_link_images after do_compile before do_strip
 python do_strip() {
     import shutil
 
-    strip = d.getVar('STRIP')
+    strip = d.getVar('KERNEL_STRIP')
     extra_sections = d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
     kernel_image = d.getVar('B') + "/" + d.getVar('KERNEL_OUTPUT_DIR') + "/vmlinux"
 
-- 
2.41.0


