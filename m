Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFCDC5518D
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.10458.1649768905803745042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SUpOIn5I;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id g18so11385222wrb.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8inaRJWXE6o6gLMXtyxY/EClo9DWSz6TDRCuZpLHqbU=;
        b=SUpOIn5IFjTKLiyX3E5D1ZdvWtPbolBf2/pON+zYB1Zww7wjN9QRkU1qmiZ2EnPHzp
         ZhRx/fYuKmkffrdJCV6bUG/3sxvHQXCedt98mklJXARDUnjODCSEylhVEKDdr/oKpkQu
         VtXET/2myWa9w27pErF/C9N9gW4UasEllbkP58bIPLSLf+c1/kbkZJyJuIp05nyLubxR
         0WydRLZ1Awo6QXD7gtSsaH7/W6205ZW7ikC5yA2dczTldpDvhKDsBlryuUEkjA1d862O
         rs7wVBDT2Az531Xau5h/hWUswPzVb3fwlqHZp91wr5bUUjJSoHbf/fgqs1lJ044wL5B6
         nPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8inaRJWXE6o6gLMXtyxY/EClo9DWSz6TDRCuZpLHqbU=;
        b=VMvasQeFjCq36baiQyVrFx88PtJHusIv4nEVLPhR7j5JD8b2Hihib5JzHDCK5gk5dG
         9givGkOfIwVR76MOAq7vaQ1eREnouRNH59JclR3wMLyf+sZfyvENDlYKgwp7osvaekz8
         5hYHTxzrry1/qtt7WZj1aXVibeyC+zbtQKF8U65M1YNRmqipPrpBk/1RV3ZAXODYt6Bm
         ihx8NtbjvPruXPHhkwqQ/awcxJUJSRDfxSraKKAF+IwXDGhvS5H3hKZWecpfT4PncHL6
         copNZC0mv8dxc7B/0QvRZRtfoA4KIzC1loUkxrEfBuP7d7/4w7gruREBVg+RLvveNsAg
         rOEg==
X-Gm-Message-State: AOAM5330dAzqXGJBhJXksmj2e408ZQABiJq3R0iFf2AhPPr99Xi0bt00
	Xu3cONflAjX0XY8VIx7UetGAUwgqCno=
X-Google-Smtp-Source: 
 ABdhPJxTe+o4WgfZh2j0CdeQmBHpzCUYPcjkqyXEK/trRFKRLoxSVos5P5Bfimg8GODNZod/6AUWBA==
X-Received: by 2002:a05:6000:1106:b0:207:aac0:f5ae with SMTP id
 z6-20020a056000110600b00207aac0f5aemr5625543wrw.360.1649768903791;
        Tue, 12 Apr 2022 06:08:23 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a05600002c500b002079960cdc1sm11764449wry.44.2022.04.12.06.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 06:08:23 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [meta-oe][PATCH] kernel: Delete unused KERNEL_LOCALVERSION variable
Date: Tue, 12 Apr 2022 14:08:18 +0100
Message-Id: <20220412130818.26000-1-alexk@zuma.ai>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164273

This has been unused since:

  commit fb61dc1430f81ae2ee59766ffab8404fd79ff1b1
  Author: Richard Purdie <richard@openedhand.com>
  Date:   Mon Jan 8 21:05:18 2007 +0000

      kernel.bbclass: Drop KERNEL_RELEASE variable

      git-svn-id: https://svn.o-hand.com/repos/poky/trunk@1123 311d38ba-8fff-0310-9ca6-ca027cbcb966

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 meta/classes/kernel.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7ca847f0a341..cd900edd5cb6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -221,8 +221,6 @@ export CMDLINE_CONSOLE = "console=${@d.getVar("KERNEL_CONSOLE") or "ttyS0"}"
 
 KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
 
-KERNEL_LOCALVERSION ?= ""
-
 # kernels are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
2.35.1


