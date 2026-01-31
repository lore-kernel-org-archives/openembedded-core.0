Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442C7D79757
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5006.1769846223726120003
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Fin1GMsN;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so37244115e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846222; x=1770451022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=016UgcrQEnkfxPTSBwfKcMxCE2gb98knx2wPC15YzEg=;
        b=Fin1GMsN5fGnNYteHfOySDR9Z8MOcHGbFoj1trMQWxly4EBmL477HBAGbYx5oAi3cl
         /tASJtP0+xD3X8fbDkOJu6LSXDcI8BOsvXDuLHav+USTfCk97c7MNEvestD63CHgkStG
         UiKWPEUOuxTDuInABVwbsgIX3WddbK/k8jbAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846222; x=1770451022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=016UgcrQEnkfxPTSBwfKcMxCE2gb98knx2wPC15YzEg=;
        b=DOR4s87X4T2sC9bbAI2NqbvgzOlDK4UCKxVM4P4PmKBFDIYEuuxisuPSSA+lzbOcE5
         k67dgSQKF5+HeEAn81/5URlNRqlSvjnCgnPgcRu0XqS6fKdjWLTr23TsAu1QTbvOrJ52
         rAlpuDa4hDAXOMl9eGmFbk1Pw8HqpaETGqCF7TzIGoDDsPqIG+3aLE7OvazT3pbsqIDp
         Ddv5bQMoVkB9Gf0S6AklSAypD/2Ic7ypu4niu/towLZOyi6x+B2T8Ujy5tysOaX6rNwI
         T98cl3T6bCZupCNj/1P0q5VH9C9V11V0G7q26fRwchZWEj8Mh01UFbI3U8DgqA3lYIf/
         9TZg==
X-Gm-Message-State: AOJu0YwjuffNxcJYAM0bNIxFRm84sb1GhkzqUCzC7Y38UoGrtOLBrD2M
	GXOFIYj6hiKF935ANylQ6DH5AZamvajFUJxoXqfd345Mj3LrTl+DkSeVYn/VUjWbbfj/oYz8v0Q
	cKigz4kw=
X-Gm-Gg: AZuq6aIvN2ReQK4F7o3oBWML6aGPiSdGgk4JrDAPU9LjAWbQere50u91bF6PWGYVxzY
	0eMYc2BYMwJAzt7pNhF6sOrAd9KCy34q0PUoVlbFuCXD2Y2tGRXIkwScYP5MnOp8QIz4+W4SZOL
	Lm6teA2pVmp5C8Tv3QkLJQo2i4/Wsz82eWhhVwcJzMCIj2hqLo4GA1479e5ON/hWsYj/W+F3Zs4
	O4PPfaxutsf3/f7eQX4ziC6Evf6738SICBv3oyYChotEkqdPF3OLKl2MUoYvSujwD4ggg/KksbF
	JjAQ0jePwd6yhesjNB3MFQJnAYA2v+wOi7O3akQsgeUVXH8wQ0DGSWukIHKvk7WKcuoKMcZwKa6
	JzrZH9VTCY40hIhBd8TuMU+nyL1TBMZs6yY559st2FB4XiXv9wHahiq/R0ReRWbk77HQXB04gqz
	bRheK+G87AObteRJnoEWTXNYRSipXJgWA2jA6MV+kUyxDiMPrsFw0dUYIa2hT2BIgEiC6skrsWj
	lVitILTagClF0a6
X-Received: by 2002:a05:600c:1f14:b0:480:4a90:1af2 with SMTP id 5b1f17b1804b1-482db4a5f2amr81438665e9.35.1769846221832;
        Fri, 30 Jan 2026 23:57:01 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 12/22] pseudo: Update to 1.9.3 release
Date: Sat, 31 Jan 2026 08:56:23 +0100
Message-ID: <e32c8a381cbc881140d056590826b0ff1caa4742.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230217

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in the following changes:

  Makefile.in: Bump version to 1.9.3
  configure: Minor code quality changes
  pseudo: code quality scan - resolved various potential issues
  makewrappers: improve error handling and robustness
  Update COPYRIGHT files
  ports/linux/pseudo_wrappers.c: Call the wrappers where possible
  ports/linux/pseudo_wrappers.c: Workaround compile error on Debian 11
  ports/linux/pseudo_wrappers.c: Reorder the syscall operations
  ports/unix/guts/realpath.c: Fix indents
  pseudo_util.c: Skip realpath like expansion for /proc on Linux
  test/test-proc-pipe.sh: Add test case for proc pipes
  ports/unix/guts/realpath.c: realpath fails if the resolved path doesn't exist

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 524f4bbb11f9c7e0126e8bd46af217b452d48f5e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 19b0d29b718..ed1e8fb3e01 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "125b020dd2bc46baa37a80784704e382732357b4"
-PV = "1.9.2+git"
+SRCREV = "750362cc7b9fa58dffccd95d919b435c6d8ac614"
+PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

