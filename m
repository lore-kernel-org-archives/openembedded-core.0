Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B02EE49AA
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 11:15:24 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.8510.1692616519026515552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 04:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g15bbkeS;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-565f24a5c20so2023341a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692616518; x=1693221318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LsiYrqKy1oE0LQXcpDjuMIfbAgR8CUCww6aqau/H5g=;
        b=g15bbkeSsvLB9v50jk6MyT+iGfJ02rfknjvpWPZclkIqVLoN7ww27V1R6TQJNmMwmQ
         XixFH/YfTqfPY2JFMcJ1tTpqAC1Kp+MmRNetoresElCQxhgUHo3yYYkNdUJc9/0OY7b5
         m9mOKIncgNrbaxcY4nuGiO/YCGXXeEg5VJedzsg0Lq8zBifOq9Auz4t2t2e22Mq92Tng
         1qidy8qLsEMC5Nf2+haCFpkwfu2AskXLMJldHMmRk1fnQxKcoOx48RNEt5jWQifAUhXr
         w134AiEn61u+TTvEduT9+dcngoiPk+F34swQLO9vuuPnbmZOt2JpgM4GBLIUnWLH8Hu6
         01ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692616518; x=1693221318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LsiYrqKy1oE0LQXcpDjuMIfbAgR8CUCww6aqau/H5g=;
        b=kr5Ew+akYLtr021ACjA5y1OssFx7y3ROtNtg3JnbrvovtGGUiyAoVXU4b2rkkhnDrj
         GkgzM3gB4cow5FqoOmWiuO7rr2x5UopsjWkV1sGDGmUCJwlKwW2FoPMQIv56ZaDnTQxy
         blXZsk2JJJyzlHG0IdsxG8LdFfo6A1MdNF/7aLc4weGo5/RHG72Tc3WajFSoSChFakTT
         EwbuBx+lEW+ZQxb97b/AePcR0s5WHzfH7vWDzCbaj5DQYsG3zmAKvfF43yxbPlXvMZY0
         rP3lYyaeUI/8K2BMb7PkEiyr3nMXPJ+6vUMpAVwApm9dx1kkZzK/YRxm8x9uJyzJbnFa
         ymTA==
X-Gm-Message-State: AOJu0YxVz+4lh+cO5mnfIeMtY0NGL4HD8gHH7rmQMogTiFDsikJiufBf
	UWDBOFOWv7GPzA0K/yA1ONAgALJjatlpsQ==
X-Google-Smtp-Source: AGHT+IGE5u4447+e+WHjTc1A2oC0lJR1HnYaaeHA+G08BZ6KrkWG//U/HCYKQDCtEL5ZMQwamEPZ4w==
X-Received: by 2002:a17:90b:3651:b0:26b:4e40:7be6 with SMTP id nh17-20020a17090b365100b0026b4e407be6mr9051093pjb.20.1692616518093;
        Mon, 21 Aug 2023 04:15:18 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:bdd8:21f7:9051:f166:1be5])
        by smtp.gmail.com with ESMTPSA id iz22-20020a170902ef9600b001b9da42cd7dsm6833412plb.279.2023.08.21.04.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 04:15:17 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-core@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Sourav Pramanik <sourav.pramanik@kpit.com>
Subject: [[meta-oe][dunfell][PATCH]] rapidjson: Avoid usage of nobranch=1
Date: Mon, 21 Aug 2023 16:39:37 +0530
Message-Id: <20230821110937.66756-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 11:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186430

From: Sourav Pramanik <sourav.pramanik@kpit.com>

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 04ac93e92..bc90bffe5 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
-SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1;protocol=https"
+SRC_URI = "git://github.com/miloyip/rapidjson.git;branch=master;protocol=https"
 
 SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
 
-- 
2.25.1


