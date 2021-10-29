Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F171C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 17:10:26 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.8339.1635527425432892809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hdovk/4Z;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so7800495pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1eg+fCSOk6hqvGbBQgCSA6Y7i792r0CwhKRFUeMOQ1o=;
        b=Hdovk/4ZlR8PI9WMOHr5cIHLz8pfwpEXibAP0MgiZnJECVcLuVF1jxlibz9qrP7Uii
         lbj89Ksp+3oe62cnLCCskG9EzAkBFfl5851aYdwMLR3BgvvYDJHY/IhCdKpRvXPjOdeC
         Fd4wz2dolMj1YEIZ4rHbXdTVeLMLojWB9pPu69eJdGMGWDd4oD/SPxrCf0sk0U6i/s/o
         lbFMZ1erCGu7eg1m6JWcpuoxGL31ThkS1CKXynofD8ZCunFIPQDEivguzMb4SArJMjrN
         zMoTThrl/EMs/TWy5hzr44tVQiTAAtPfGeOGtihicl26jmybW3Hoi7N5KjxefkBpD8pQ
         dLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1eg+fCSOk6hqvGbBQgCSA6Y7i792r0CwhKRFUeMOQ1o=;
        b=3r6GHV7Dc8Yy7KZqBaPSpMMd18BoFeS1HJIoOschFBBiIlanV9r5cepmKZBEvwwqaS
         B3+a105BOOLDm0D7/syzI963zwE1Lhn3hJ914Rahn285t8AtklOa5ds1sGcLJ7Uu2vNh
         pvPYXZ+nFAbAVZudH8qoZpbhE7lgCU2l0m3nZuLisvqFo15HZbdiwopVc/mua4QHPTSG
         Xg/Y8D85MJsJs90qcTcZCOnTEr4sj70xkZeHEas/dkbl+6+7rXgbJ0PPhOO7Uf39tceW
         p2VYLuPJqPyTqhEoFcftWgQGuNPGYQrFxgxg18oXkTHPB/7uHi9+XsSbAh9LdNfkESoD
         CWCw==
X-Gm-Message-State: AOAM533XXDZq/PSk0JvwKB85gz1YaHqRMsy2DDRu7SaqimCrCib2KdQc
	u65mbr+KZOdLIeBysc+uH+jaKWXRXGo=
X-Google-Smtp-Source: 
 ABdhPJwX937Mu5AL3KW3Y9FHpcT7kd5ji38+0sQA/iDfRvr3B0Pgd/1J9TtsnwLkE8TP3xFGsVxbXg==
X-Received: by 2002:a17:90b:4a8d:: with SMTP id
 lp13mr13002423pjb.32.1635527424752;
        Fri, 29 Oct 2021 10:10:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 z7sm5887805pgo.11.2021.10.29.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 10:10:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/3] musl: Update to tip of trunk
Date: Fri, 29 Oct 2021 10:10:20 -0700
Message-Id: <20211029171022.1279107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 17:10:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157631

This brings following fixes

* b76f37fd add qsort_r and make qsort a wrapper around it
* 7be59733 add SPE FPU support to powerpc-sf
* e3e7189c fix undefined behavior in getdelim via null pointer arithmetic and memcpy
* b713b8b2 fix excessively slow TLS performance on some mips models
* 3eed6a6f fix error checking in pthread_getname_np

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change
v3: Rebased on master-next

 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index a2f96f1dbe..03ab0a449f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "3f701faace7addc75d16dea8a6cd769fa5b3f260"
+SRCREV = "b76f37fd5625d038141b52184956fb4b7838e9a5"
 
 BASEVER = "1.2.2"
 
-- 
2.33.1


