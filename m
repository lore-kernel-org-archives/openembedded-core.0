Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172A1C48297
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 07:56:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.13490.1706946986188688395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 23:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ym7u8p2O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33b30557dafso51667f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 23:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706946984; x=1707551784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MqMKoAV8H0B1gjNRCCPpoQFpCKtb4cPnmUlVjxIvsxY=;
        b=Ym7u8p2OG6A+Z77p/LqZ+1y99l4/j4o9j/k7dx1WWZoPorFxYbQDioM5HUJtvDQDh+
         zehuGwNwGX6lf1zWO/wHAF4HQnmFI+FAsVPBqpHqC8BbxVusVX/T8pwQ7u9nQY3xywKt
         vaZuM8NqpAA1mPpuUeAe58UrTNtGzojs3cGTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706946984; x=1707551784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqMKoAV8H0B1gjNRCCPpoQFpCKtb4cPnmUlVjxIvsxY=;
        b=v+P2AkSOa2vVpdiP5cn4BlbPaTgjPuuqAqvnjtnLQIvCOGZfhEwJCDM7AbtJmX2zXu
         YsDS9jMOtw+gKio1Ok534rfbn1Rp/YVjjOrsuneCOkGBgII/lbvoWR0DxzY2k7SPrfzA
         KgzKGxCF+iWRZ9Ox2CWyX4kbde+o22/vny/8+usPXqVJqZ/nA8rYId4B+cX0XlWheRsm
         yBr4KeE8k5gf7I8qYu/ZMePR7tBO2a7/GwhYAUw4Kd5l44ZQ/+fDewHEO37voUAuWBdr
         jShu8ECg6gGs6N4cT3hcUurYT/Baqaw7LZ3jfUSAJlS+XVjLNWEX5XC2Jqk95V28fj8J
         z1FQ==
X-Gm-Message-State: AOJu0YzhibjgmyGFwTo97WXMsqBmcmgqmi5FACS/3EImGfPcMHUFiOk0
	ZU9Ob9TD9HIUv7bKJYRPw0pY5mxQzg70qV4qfBWd6aMVLCQmH0d4PiMZxguvXxFdnEWMsAIIDFH
	m
X-Google-Smtp-Source: AGHT+IHDHpXnVqQcKaGZhCWi1PDqsEYWv8STa0VeCsOKC97U1/OQaCN28K8ZLkytGKLZHAuimz02hQ==
X-Received: by 2002:a5d:50ce:0:b0:33b:1eb3:bf29 with SMTP id f14-20020a5d50ce000000b0033b1eb3bf29mr2687932wrt.33.1706946984255;
        Fri, 02 Feb 2024 23:56:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5be5:6aa5:96ae:21ea])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d40cf000000b0033aeb0afa8fsm3490195wrq.39.2024.02.02.23.56.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 23:56:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] pseudo: Update to pull in gcc14 fix and missing statvfs64 intercept
Date: Sat,  3 Feb 2024 07:56:21 +0000
Message-Id: <20240203075623.2150849-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 07:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194832

rpm 4.19 now builds with LFS64 support enabled by default,
so it calls statvfs64() to get the space available on the
filesystem it is installing packages into.  This is not
getting caught by pseudo, so rpm is checking the host's
root filesystem, rather than the filesystem where the
build is happening.

Merge in that fix and a gcc14 fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/files/glibc238.patch | 13 -------------
 meta/recipes-devtools/pseudo/pseudo_git.bb        |  2 +-
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
index 76ca8c11eb6..da4b8caee36 100644
--- a/meta/recipes-devtools/pseudo/files/glibc238.patch
+++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
@@ -44,19 +44,6 @@ Index: git/pseudo_util.c
  
  #include <ctype.h>
  #include <errno.h>
-Index: git/pseudolog.c
-===================================================================
---- git.orig/pseudolog.c
-+++ git/pseudolog.c
-@@ -8,7 +8,7 @@
-  */
- /* We need _XOPEN_SOURCE for strptime(), but if we define that,
-  * we then don't get S_IFSOCK... _GNU_SOURCE turns on everything. */
--#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <ctype.h>
- #include <limits.h>
 Index: git/pseudo_client.c
 ===================================================================
 --- git.orig/pseudo_client.c
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 699cab11c66..025cf0fc9ca 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "a8453eea4d902bbb0e01c786f1cb4a178c3bbee3"
+SRCREV = "516a0a3c4b46f046895d27bfa019d685fe462dfa"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.40.1


