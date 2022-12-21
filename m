Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6EDC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:53:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.17635.1671627201557954335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dj1moW9Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id o15so11076615wmr.4
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4gQi8OuYoeZcVag7RZJ3HkFSj96ezDIqCzNwhzZp4I=;
        b=dj1moW9YmbdkuGkZNtIrhShZYg3aSlu32o1ck0G0zzhH2WQnIkVCP+a03VNDrEQjU6
         3tPRZwpN2IulVj1VBpMjJAWghIjM+2XUVSK7Fl0cCVzDEWIBZD1upVACp62lU4o54knH
         jmvtBS8JywDuZwn2/JG2GHfrSddhApa8HaqoKQKvw+VFdbkoO9U73RmeD/LbRHpa+rZI
         8Nh3TW4AhEQdLcILRz80/Hen80jm0uDqLSc0EYrh88LBBF5FDSQLvGmHVChAQUAHcWq8
         dwsjj3Z5LOzbaSHjjlN9KpqjLuKsNNWFB8XdbzyJSgmxENpjNnuzMIUA930RXhBivldL
         bLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4gQi8OuYoeZcVag7RZJ3HkFSj96ezDIqCzNwhzZp4I=;
        b=OsntKRi4NjckWBqExYYH0OWIXm+zdnu6+O6xLGz7em+M4RGx/EYfjH9RNXBPTo4tbj
         bKuWYiP+S2Zv51B4S+KS76OFCwGFGj8jzZvKJBJXMS/x7zG1huOgoHuH/w1MSGy3tU+b
         3nHCFOpCJIwSiinVN9QsYmDEEx5LRHhLlt9C0rN2RwrZ2/3DUsXxJkVU1yD9rCttS3cc
         7KI/5v9oEVK8Fb7gHl4OTQZ5I1xk1Dr95VKMDGtewqvwIj3Ci2Rg23hxUW6hV4PbmHJR
         SzicssVIJHZIQusqiJTTxZ1QiUHaNYhA8cqnKepsyxhAKuwMw4YcRjRJ0ZfdzVcEwTPF
         wHoA==
X-Gm-Message-State: AFqh2kqdL9aPpbAPdBla2TJdeRlbq9ovkcEpZufizozdfd780TqCfVM7
	ppxxG1txy7nCkQOCdCZhpFwxZCr9SSQ=
X-Google-Smtp-Source: AMrXdXvwQIxC/ndltmLdKcV6bDixFjRRogohgCXDQcasv9Dem6WaY8uG+cxalzXjNWMG7+hadPRE1g==
X-Received: by 2002:a1c:1905:0:b0:3d1:e04f:9bf1 with SMTP id 5-20020a1c1905000000b003d1e04f9bf1mr1579117wmz.35.1671627199887;
        Wed, 21 Dec 2022 04:53:19 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003b47ff307e1sm2124097wmi.31.2022.12.21.04.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:53:19 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 05/10] rust-llvm: Update LLVM_VERSION to match embedded version
Date: Wed, 21 Dec 2022 12:53:00 +0000
Message-Id: <20221221125306.13779-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221125306.13779-1-alex.kiernan@gmail.com>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 12:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174911

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/rust/rust-llvm_1.66.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
index e1baeb78574f..4cf244bb67f5 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.rust-lang.org"
 
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
-LLVM_RELEASE = "14.0.5"
+LLVM_RELEASE = "15.0.2"
 
 require rust-source.inc
 
-- 
2.39.0


