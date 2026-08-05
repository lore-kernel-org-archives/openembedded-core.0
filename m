Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B410C55ABF
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 21:23:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6163.1785965001869313368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 14:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OX7e8KOo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f84023916so1313727f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 14:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785965000; x=1786569800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDhPJKnViUjU7o8J8wRcFlopJvxxkTifvb/xaD3H18w=;
        b=OX7e8KOoi9pORcn/nekG/ktgJ4ORnJyfNEhg5L2wFB+jLAZyeppLGdR1G7dVNQoAfD
         8o2hrgF5wL6G6WJliAm9UehwTI5Myix8EZeAFKfVHhtDES24cxK02nRiKQPqMmbEQSsW
         ONOFc94Xy8lO7SUnQnHA3ntYEe0wmEL1EDj60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965000; x=1786569800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vDhPJKnViUjU7o8J8wRcFlopJvxxkTifvb/xaD3H18w=;
        b=fNfVGzGgQmo5ozbFuYxhGFGgcntrpwcyEvDJS7NL7XQeqaHd/t9EwWClIbJCVwxtHM
         gzZYPdTuqKKM6KJLVMUP+HWGdDiMALHHaEcrYVBJOF84MyKMXR0Ft3ykxL6YOCa04Yoz
         M5gZFWluZuFhC6bxj5j01aclmtOiLWOd08FMQJLE53Hv42Zm6mYyZSPVofV3u+gMNuWV
         hp8EfWIX03G1hyzsyXTnOsBBJbLiHh/UXIkfgH2hEiNDAK0IiNFOvQY5KAFQ6Q7LqUDU
         K5gAKqvIuIC7Big7ivtstsC5C2HDOItyW5lKwceX3WKwtIUZD0oZex0z49XKdWXdpCbD
         S+3A==
X-Gm-Message-State: AOJu0Yxad++mT0Cpjz4PTrnwMHWBOmvDolzbz0GuDa1yo3VgcmteIUHz
	KP2rIvIetXcjZ7Sg9Gl84n9MYhcgSzWvwl5sUmhMUXxAlw1Hj2koFZczf0htwVtB5U6+YQh6q9I
	ZCla5SP4=
X-Gm-Gg: AR+sD1167GI/TmwNE4w6CA39b5fAfSSw9B1MnzHJBwoVhBtYriIa87lnZWTYEgvA37Z
	5bjnJHUOW07qYpLWCab0LKycwgT4+zuD7EFmGitSsaKV+MIc2PuwA7rxrwm7UXJdRk8c/1Lt9R/
	7Lno87Ze46wMXlbc6seY1VGQ/35Gul54a7z8M+Ud8M1ZGu5rNoQ8pvUzjbIGF9k5hCuFilOTofy
	RF8SSynGRisIuHRVyFyFCiARiZtkAOIxL61lk3oDI0Hq6e8430IbpoTwx3/AwwrGEmXdusrhq7b
	Bo9PbF1YGCmU+zLz3LpdBuRPXm0iNYjWvoxEFnck/vQ1lYFzok3K8TFz61cwLvH/5XFwMxo63fc
	LU6W9T0Y7NO/fBKKhMpi5e2nmaLs7vKkM95wLBKuZDmhS3NZjPxIE+I25X9OoR5ZzIiYQWkQ4b7
	jkDFIM9f2F/A6VVyKIY9a7FnfOHi0opVgzKGafuRTfgdgdgv8vCcxkxbZUS7hQ+8j4u/wpkagaJ
	jYIBPPcj8Rpvf+x
X-Received: by 2002:a05:600c:840f:b0:496:c1f3:e8fb with SMTP id 5b1f17b1804b1-4994e71ffafmr126209685e9.8.1785964999815;
        Wed, 05 Aug 2026 14:23:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:acb0:465d:83cf:164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542133f0sm8195055e9.5.2026.08.05.14.23.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:23:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: 1.9.10 -> 1.9.11
Date: Wed,  5 Aug 2026 22:23:18 +0100
Message-ID: <20260805212318.1260713-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 21:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242894

Adds suport for a working close_range() intercept.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d0559f6c9f3..d8466b018e1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "2a5521e9573049864e07907415f1fee28232d90c"
-PV = "1.9.10"
+SRCREV = "ba8887e5f1e922f866681ec7dec1a00b602a9328"
+PV = "1.9.11"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

