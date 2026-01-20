Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33808D2ED18
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4240.1768908270133907424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lvMnz4h/;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-432da746749so2716718f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908268; x=1769513068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nsHFJJyhFfxcust3IyUfFncMeTpvs6PKeoV94eZSl8=;
        b=lvMnz4h/7n1WidbICaFMAgdtjr9oLvDtP/Osig20djOYhhspvXeIT6KDamy4+Nf3gG
         eMQoTA2CcWQOjV91gWenKS6/pLf5dmRbqzu+YQoUoLskpbgnDgdr9DSXCdALYSRdObLr
         l5JsfvSs+E/JsqFLLrEA8HajBFXcyYA6AM9rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908268; x=1769513068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6nsHFJJyhFfxcust3IyUfFncMeTpvs6PKeoV94eZSl8=;
        b=OkGEUane1B+cjPj/N+7jKG62PmNm5oxRP/+3SG8Y1/bSrot3D8V4n/cf47cZJUteGW
         Fbey/I3hgJw+Y0r61yypCEAaT1nS8G9gd0y9nIHMBIgHDSG/pZVz3RUWifb8QoAWRjvY
         CGhydJOVBngn/bgWPz+m/FFnEL02mKUliCEntIuQP07b28vXCr4lm1CIZf5wc+PiAk5z
         20C5Uzsg5YrkeWMYaAoz4qnIyxtybIRB0Ei85UWQTSCLGX1O4/F7lS6XKqAJEwRyAf1o
         Hyo6ChvMLpJq1hBI/ZnC7DGM6uD+G0tlsZRMEgzm1infTtWxMdSR3qRMFqlSiAiE9aGg
         CSiA==
X-Gm-Message-State: AOJu0YztUnX0Hp9Sjpyu6P5nzt3ocCnZLZt7Aqlv2BBuuOIYg1IdetTg
	bs3NSUofd72RfzRjRua2Vps3AZjqMgP9TAvyLs+EZojEFmPquz2MCkR5UzmlXGxFvlrXr2NjDW+
	x5BYK
X-Gm-Gg: AZuq6aKj/SYfFzcyOS3xMnC6FTT7lhIENfUgXMK/hs4UhsqS67ZGGQvWhqzFDk897r2
	3mZQd7Yw0rmSOjrzQURUgPFXr5FpEjbGeeGa932ijzt9zzX15wBM82LrNPuDIK6rGz6QazpDWXw
	1Ohj0ofyScUSaxIDE1YzAqEDUT4nkSE6VAEAceKxKvh+nn8vWGHkDSw8ZOENbSnTJCbbMP0msNV
	IzzhrhBm0R4WQEZsSOvym06ixTzKb8uQ0ueQHZuTO2xoh2cZFCKSFG4jaDCIwAGswkE26RDouDr
	VU8T6F/YACB4UYOFm67304GQKJSh8WVmHxdIf5wzEPojiYCN8YeynqcJGx1YVd4Xcwo0Vxu1/rZ
	ra1ChewaJ+SOeGv0xlRjBd388Jow4WOHjjwIqSjjn49TaqkO//djJsK4aknjK1QRQVjpMA2U/aZ
	0J/e9NZWidO7NCnBh96KhLv/OBM31cQ4z8SGdA2Q37ZHTHYpY/DVetGqOi4OCudo+rzLfWAt4Zm
	n1AOG1K+sy07t68w/nfeLqtXFq3Fnai
X-Received: by 2002:a5d:5f96:0:b0:431:a0:7de0 with SMTP id ffacd0b85a97d-43569bc1928mr18502923f8f.35.1768908268121;
        Tue, 20 Jan 2026 03:24:28 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 05/15] pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'
Date: Tue, 20 Jan 2026 12:23:50 +0100
Message-ID: <bf84ec942686138421cf69cc3fc5d62f970118e9.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229665

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The pseudo update was causing hangs in builds, pull in the fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8acdbefd0a148c8b7713f46066ae8489984c5d2d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a1a00d1a95..19b0d29b71 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9ce8c09980af23ebd4ebf072010469882d0459a6"
+SRCREV = "125b020dd2bc46baa37a80784704e382732357b4"
 PV = "1.9.2+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

