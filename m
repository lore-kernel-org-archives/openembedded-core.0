Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B171ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:06:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.11243.1662275207502132453
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iVG5apZu;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id p18so5742680plr.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=vi3KmnoI4qEcqSGW7rQbzaL016b/OJqVk2vXXXgfyKU=;
        b=iVG5apZup6HssHj2IJjJ30abp+uS+mAZosUAgAkHmwkLQI0VLCUSMfP+ko7gxVU1mh
         p3fJPXsQmhmug/Ka0u/Amc74Xt0vNFcI/wllEIvzfwt1kvoFJ51qnt/sbXI7YvrGTdLa
         EI0lqQSPATRihLiZKDfUACF5dzqF6w2OwO6gdknhAcqGmBkb1zfFXbftUcZX4qQ15IuM
         WMWQ26j1FAlFERBD3i1Ou2STrgsukXXEJ5EipAdb8zLxUr374+HX1cKtBp/IY9giEJf5
         V+2qsVFbV0ZFmIpwFipv5czKec5qIFZg4asrGJZ6LKicV45Rmk2aPHoLISZpoHrgy94H
         KJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=vi3KmnoI4qEcqSGW7rQbzaL016b/OJqVk2vXXXgfyKU=;
        b=g18DRGGcXdJ+KzUw4zG6Gho8rDAnPGwcQbuQip6YXJLs/YCu2kapNhczt2J6MH28tW
         LQ3QpK2RllsKHyNiTWCPfACco4JyMEjr+pVgSOhxl8YPCHvcGJSgpb1O7YMiwvK973Gd
         caI7RrsQ30PbBmCdhIWb6fiiKWDZP5hZ8bDs5HUZpOVWILpNVZT2uk+1H1XbndpJj55W
         xqxp4MOOOqxcRsW76oLR0YuOt+vmnAQYWVTdlTTDhXVU4Wv6g6kBHfOiQ7jNtWz5XfAw
         tMH7haNZrmOSnWaY1I5E9sR3as7jB84Wm2NcxSNRJAOHsCr4eQKI1DNWXYRz+941fJiy
         3l3g==
X-Gm-Message-State: ACgBeo0zMcQXs6CRo19u//lJx+uRrpDJxlGAZfkhWOS70EIe41SCRz5j
	Oyd7JKtOJvBCfcP4CaoCyML6RTrdjy0=
X-Google-Smtp-Source: 
 AA6agR42js/HaIHWUeftMMjx2mvFaSPtZEirnmiG1FpfaSMO76zz3G3T20GZ5zief5Zyg0vLWmZOzg==
X-Received: by 2002:a17:90b:4d12:b0:1f5:59e1:994f with SMTP id
 mw18-20020a17090b4d1200b001f559e1994fmr13281050pjb.217.1662275206664;
        Sun, 04 Sep 2022 00:06:46 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 v15-20020a17090a458f00b001f3162e4e55sm4329772pjg.35.2022.09.04.00.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:06:46 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Randy.MacLeod@windriver.com,
	vinay.m.engg@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] rust: Enable verbose-tests to get the test results in
 readable format
Date: Sun,  4 Sep 2022 12:36:41 +0530
Message-Id: <20220904070641.2706229-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 07:06:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170278

From: pgowda <pgowda.cve@gmail.com>

Emits complete details regarding the test results to understand
and debug from logfiles

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 284347dedc..a0164c2f6b 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -116,6 +116,10 @@ python do_configure() {
     # Whether or not to optimize the compiler and standard library
     config.set("rust", "optimize", e(True))
 
+    # Emits extraneous output from tests to ensure that failures of the test
+    # harness are debuggable just from logfiles
+    config.set("rust", "verbose-tests", e(True))
+
     # [build]
     config.add_section("build")
     config.set("build", "submodules", e(False))
-- 
2.25.1


