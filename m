Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB98BCD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 22:57:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.373.1778713030351427708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 15:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LJkaIC73;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b150559bso57204935e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 15:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778713028; x=1779317828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/EtukHc/UfPbBNX15CqL63gih+sELz6XFyzvZq0Lknk=;
        b=LJkaIC73fSF1ywoEXo7uz/j/l5Ha3XXyOzfwtpnePzIuRUp5fhwWOe3JTU9tJTtsp4
         6fHW7Jh9Q8R2fDWYbTuCmgWigjmeWMBphNzYtn6xRJjOV7Qi8L4SoWpOTmXS+wZnz299
         stRdyq9F/2TPLOLOqWHq9sEegvgdE+IEfnFBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778713028; x=1779317828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EtukHc/UfPbBNX15CqL63gih+sELz6XFyzvZq0Lknk=;
        b=B4mspSLTsfVKueqVYCXcCDwFp1NzNQrdxK3mHet+p29fMuIwRKSIWwtckseJzq6IQV
         1veZKil77lJtvIz88HstaeIMGpLGQ1tNfWPvjRGstI1nZFhdF571NLu7d4OZODq6LAiR
         UyO/aoUIrBSe5+Hs8JCVkU3uZrCxgu4c4eHDwYzSIqOq8M/VyFYjn491UPknDjpQ5USS
         atjURzk6ciG7fggk4xEq7vcNDN7c/IcCfwLj4TcHUI9BvykSJj3NaLDfg9tstKlrBJd9
         IkXsqvWCYb22l8TDMRbWWi9OjoCMDPk9M5Yvl8L/SFekpnDnC0S8GX8z/q17EIXbueKz
         fnGA==
X-Gm-Message-State: AOJu0Yxf984PScxwzYsUEU/+lxZrr2xdnorGhQZIdJQtWcyllZwfQKTN
	9Tp8V2OtvzTvFEjH+PLyx6qL2OI7JUk60c8mXRQArHCE6rRaLBOUecCG24diwb7QGaHsFep7sKO
	f06vZ
X-Gm-Gg: Acq92OHqnSvttGYYQyK93YgcUIC2iV3A9gUB8f3rD16y4JVskieE18/w5sVbdUt2haZ
	ROSuaXbAo5Opl8JD2yM07oaj8asZX07gIPlZmTT8DrYhP7HiZDePOls/r26tyfzySG/tfX7BQh+
	YIiKuku3o0EiGCRfKYW/fXuKcQwb2RbH03DuTrBaOMVfiN47LEI+4xDnxKU75J4VRDPpBq+xEeR
	eRMftoB7cllngj8k+IE7cpGnpRdXQZsCwQEn2OtBXBrOHsABKzZaNbO+rTaoXv9vj4rqpnkSKzW
	NJ2lUR4O8QjnzAekpFj6kt2PFGuXNHx7eqhQI54kmV41KCGNSMVzS6sP23Vk5FcwfXBTQZReYs7
	WTdV2sPP99hd06njq0N0lQLJkn++TJNOESSCQFhUY5Sg5NZSwabIlXZlrMyj28+ySj8WQyMuuFl
	fxzrYMypez4NDIGKaYAQUksdVezM3UwaaZTvtbs5qQlZ5rySw6M9Xs
X-Received: by 2002:a05:600c:198a:b0:48a:97b6:7420 with SMTP id 5b1f17b1804b1-48fc9a4d99fmr79482445e9.24.1778713028279;
        Wed, 13 May 2026 15:57:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd29:d27b:c65f:5d27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd6498cdesm26517765e9.5.2026.05.13.15.57.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:57:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Upgrade 1.9.6 -> 1.9.7
Date: Wed, 13 May 2026 23:57:06 +0100
Message-ID: <20260513225706.1518021-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 22:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237010

Pulls in fixes to rename/renameat/renameat2:

Changqing Li (1):
  renameat2/renameat: only ignore when both old and new path are not in PSEUDO_INCLUDE_PATHS

Mark Hatle (4):
  run_tests.sh: Allow the user to specify specific tests to run
  tests: Add mv then hardlink testing
  rename: only ignore when both old and new path are not in PSEUDO_INCLUDE_PATHS
  Makefile.in: Bump version to 1.9.7

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index b118f436db8..22bb938cd1d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "7109ac1b417cd31e0100f6e1c4f3e5743541b9ed"
-PV = "1.9.6"
+SRCREV = "5b7c4b59e7e198aab54b35ea194aeb6d99794f96"
+PV = "1.9.7"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

