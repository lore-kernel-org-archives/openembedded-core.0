Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA49CD98DF
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105057.1781424249262291800
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cE6FcKL4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49222fb062bso11343745e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424247; x=1782029047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RY4xOZ4M51pbMxzbZuTpLtm5o0qayb6Q/UcOQu07UcM=;
        b=cE6FcKL4bAY9munfnmWOdXN6bHNFK7cotrdf7rKLTHWdXvDgck3pV38g8hu7JDNoIA
         9701IfgW38B3uP0iYMPOVdtRh760Ly0LLlghxIyVzBPgNw67B6BNn2A2nPTS754fD2q2
         YKPpuogspMxOYIIb4AeLIT8RQs/cAkt3UP1Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424247; x=1782029047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RY4xOZ4M51pbMxzbZuTpLtm5o0qayb6Q/UcOQu07UcM=;
        b=cljV7BmcKw2p4OfD4aD1k2H3cRHZf7Ty/9LPTWXzfFKUVMrGvLjBfii2aqO1ojHSQq
         WZ7tGcn84IaSawGluxMj4IQIPivRBhEHzPVFoFDDPtJycQgkdc06i/vQjlv3K7r4hGj0
         yFAnnuQoV4EUzrlGbUGiqZxHVz4K7r0theCLEesDUKDAX93+x6xJDPcsQTyWEnGdTakN
         JXLHjUHb3fbWZgIwHc4fYMJqFdyKwpkYMOtxsrK1JCY0RnVV0npW8C1M4LKcfjhysCog
         MP3pD3NY5SDyjSNKXO3oCoZv9AgqBP+Y9Ckdv6es7XOPHpmVbJocNw4mWQ0lHh9b+6/G
         b+zw==
X-Gm-Message-State: AOJu0Yyc94iOJsmQN4oYO1bEA1Y/lpOAdxhKhJVcQDW0Fd/60i8PTE5C
	HYyJGVfcrTI0vga1qjwdCoBvu920Cqr7sXnq9mxFT/q+V1lrb1HQ6nfLWq0djrNNoNgeDJqiR52
	YukKw
X-Gm-Gg: Acq92OF81dZVKfffk6i//OGr8KLFLYxAIpd4DhEknWDTCjAPtzicH2prQes/+M5ZQkL
	wuXTtgBTzQ/uyG+32FIDqIvC3o0uo4KYsjJe8PLoXa9hMd3qQurwxqb+gHvJEdxiRj2mMAg5hQ9
	sthSQKc7BTi6j3V9vvMWSrMh5HDdHdMKFZmWeL926TyLVJZ6uay/tOrMZoyyWHdBcpNmIN3XOdq
	xKHNXtKxUZyPs3RpbLs7pfe4HhemT2Fxeum4v13xlc63LXVvtanAFpEXWf6Kj8trDmtqzrmHlIH
	Bs5Ca+MeLGc2DAmWuzB4Lm9KgWQqnXBs2aRr4Z30p5qASxjVceNcZDzAK1fhz7egxIYu1x8dDzC
	QcHBgi/dgULIhX/L59yS3nmyBCSrBu95Dtr+BS75y7FCbiYWGOyruZREVwosdtGVPiRsqV+x/Xw
	cshpeOXeH3nmbDeJkQ9SeuW4jzmQsiNRXwWlcwZ5A+KFt1bSlVNzY/
X-Received: by 2002:a05:600c:3b90:b0:490:b294:c652 with SMTP id 5b1f17b1804b1-490ec4e755emr114039475e9.20.1781424247596;
        Sun, 14 Jun 2026 01:04:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 37/56] python3-pip: upgrade 26.1.1 -> 26.1.2
Date: Sun, 14 Jun 2026 09:02:48 +0100
Message-ID: <20260614080307.4017177-37-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238721

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_26.1.1.bb => python3-pip_26.1.2.bb}     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.1.1.bb => python3-pip_26.1.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 5823d6307cb..e8b2982b2ab 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From adccf194155f40fb1d387c2cac432341a1dc8a0e Mon Sep 17 00:00:00 2001
+From e4e1fed9f8e3ff3e04467699f36599f76caa9487 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_26.1.1.bb b/meta/recipes-devtools/python/python3-pip_26.1.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.1.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.1.2.bb
index 2e09075de2e..dd1895ed55c 100644
--- a/meta/recipes-devtools/python/python3-pip_26.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.1.2.bb
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "d36762751d156a4ee895de8af39aa0abeeeb577f93a2eca6ab62467bbf0f8a78"
+SRC_URI[sha256sum] = "f49cd134c61cf2fd75e0ce2676db03e4054504a5a4986d00f8299ae632dc4605"
 
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).

