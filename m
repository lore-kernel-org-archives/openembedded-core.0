Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04101C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 05:38:23 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.14880.1661146697763420855
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 22:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SqAT1HXQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso10159589pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 22:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=4dlpoo2KPzbq0gAj/ZR9kG4Kcfm62ueEjjOAy6kofac=;
        b=SqAT1HXQOyNXZtG9z5mZNYG60ZhlJkm5JRXiYrCu+9vRmSogoVPz1SeFm4GlLXolcY
         +lC7D9+wnkezJqEpnhLtXz+Muiynv3aGaKxrZ8eRRcUerkgQyjs/A4Rg5hvooNQ1Djfh
         0WgZZ7e4cv7QdoK9fwh9XWcc6iFBYYALMy2lDXfHS+ypETFB1K+AkqkTlFlne4bY1TWF
         eo9ix2GA2cX1LmnxaHKgnsAaL+Aeqrw634nWhjNUvru3eL2Zvxd/f5mTWxvCH++GJ7bq
         N+GZTEM6xglEtGrfpYvEDv7jsdOZEgNKdO0he7PI7s+qDGUuyUOX1b9v0hvl8kESZuWr
         vmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=4dlpoo2KPzbq0gAj/ZR9kG4Kcfm62ueEjjOAy6kofac=;
        b=mW7rFcKkC/IxdYSwasOK+X/dpJKhe5daAHHebWekbGrG0jnuSYlcn/UdUj5fPNTp+p
         msfU2bHiOBbe9EWyofOvJrW8nmj8maUj4a7KK/A/NBCqFZxXJn8gQymtCOU9RJFAeF8p
         NM8JInR1leYol7aFJMgbECmbdc3O6tgo7OcCK6AWAx4/MpI4/jl/m0RWIpWw6ENoS8kc
         0yd2H8qkfi/zDwBorPlU6e5Spk1teyD6Rh7JYRnClILlIteDhL7h352cHfUW+vcrFrgw
         l34ClZ8V8vYJVBBkx67vOUMfwsLZ6f+1aTWT6s7oonnHZsg2TIpe0lhQio1vHScQXMY6
         fFSw==
X-Gm-Message-State: ACgBeo1c9BpBvcOfZvgTtC+2PleY7QeBZ1oqxKeuKn1K0KCdU7k4ABWQ
	XqfeAUKBN/9jqRQJXB5qkygNsOXrtgMrDg==
X-Google-Smtp-Source: 
 AA6agR50sOotNsCgLZ2Np/QxYrmGw74dcZkTq2ZXfzH8/Ccc1X/I9ST3dFkBMTcDzw9V1bycIdpWgA==
X-Received: by 2002:a17:902:ef46:b0:168:bac3:2fd4 with SMTP id
 e6-20020a170902ef4600b00168bac32fd4mr721104plx.132.1661146696828;
        Sun, 21 Aug 2022 22:38:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 c15-20020a170903234f00b00172897952a0sm7387598plh.283.2022.08.21.22.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 22:38:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [master-next][PATCH] rust-llvm: Update to matching LLVM_VERSION from
 rust-source
Date: Sun, 21 Aug 2022 22:38:13 -0700
Message-Id: <20220822053813.59269-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 05:38:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169659

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rust/rust-llvm_1.63.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
index 5b94e22f7b..396f741953 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
@@ -1,6 +1,6 @@
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
-LLVM_RELEASE = "13.0.0"
+LLVM_RELEASE = "14.0.5"
 require rust-source.inc
 require rust-llvm.inc
 
-- 
2.37.2


