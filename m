Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F85C433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:22 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.20249.1637901381238719028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ibRLpPSM;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id o14so5881409plg.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=slFTWDu5YltNJqdbEVOkkaPEYR/Fj4s2oRnkajD7QdY=;
        b=ibRLpPSM0BTgMQERjuQdkdsh845t73R8tycMy+OsLW66zJbkI2COOBRIwzFjCtEekX
         duxPQzV2T3zx3VD48tAhOu54F9VNd3ZLo8ltCu0ir5yBiI24D8vf2EWxvr2E8nw8clSB
         UC4y6Bg7qYM5wkaNEwX5sZhr4tL6LFKL/A/uvfKQuh/o0MCszou+grrahS20uHRZf4p3
         Pm2E1qbX3w+A9RDN9pC2x17nvakELiSs0OIW7iUY/YyDhYsbtExY/2hshrkSyL8dwZ+y
         8tDsPt6FIesPJFDyJIFFueJOx86x4DJBX9r+/618NVTo/qJV8MMbFjs/cEH4mqCOYRE3
         kChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=slFTWDu5YltNJqdbEVOkkaPEYR/Fj4s2oRnkajD7QdY=;
        b=7pQM9OdOCQks4ckLLzxFxCJ4JGLtMX7qEPe6vrkoSeMB0IEpoWipJ3zY8XsrWP6qvU
         pi6dFHOTZyQMPvADiOE8QoWTMuzXB5m8gvJgMPT3ejj/eUkvomsJ3oKCgJQ8xj2Wtxgg
         W871Agz4CZ3MSK3VPFfwge7jB7ogn33UoFNczA7+EQ0GBdRrjTgeY26PvQichNVb/p0Q
         NLtFZxK3DAB27UENS176bHFF0bNOqdRlDqNPCsywHrQYjvMEsByTlJ9f667qHy3zoHxz
         +p0YOd9m+haP86Her1SWkYNvwzTuPDstDSt23TC/dhgHRwodYQMNKkKk+Ck5spvv/3I9
         DheA==
X-Gm-Message-State: AOAM533j5u0mHxRHXyDaPxQN0PwQA9hzUq6bp0kdTeWwa7nCdL9Tg0Jz
	wDRUgocKTdLelc/5Cxa8le7Ludg/pfM=
X-Google-Smtp-Source: 
 ABdhPJzKsbaDIC2tFubCs0WNMFoMYvO1Okk1hmyBU9wBVyQDFC9rRF6aG17D7VAOyHH9JIPo7R92lA==
X-Received: by 2002:a17:90b:17cf:: with SMTP id
 me15mr12693115pjb.125.1637901380509;
        Thu, 25 Nov 2021 20:36:20 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:19 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 08/26] python3-pip: inherit setuptools3 not distutils3
Date: Thu, 25 Nov 2021 20:35:47 -0800
Message-Id: 
 <2b050699e8854c54b423a69b69777eac9008138c.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158804

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/python/python3-pip_21.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pip_21.3.1.bb b/meta/recipes-devtools/python/python3-pip_21.3.1.bb
index 6ddb1d62966..c893135059b 100644
--- a/meta/recipes-devtools/python/python3-pip_21.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.3.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c4fa2b50f55649f43060fa04b0919b9b"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-inherit pypi distutils3
+inherit pypi setuptools3
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-- 
2.30.2


