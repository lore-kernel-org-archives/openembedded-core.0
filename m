Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86D5C02197
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.92637.1738600897416395693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BvSMPif3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385d7f19f20so2061609f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600895; x=1739205695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWloYeXOW4QaytdzVsIVYG1GD3hS9rJLzpgn6nIaoVo=;
        b=BvSMPif3PK5jWqAfAZxierRmWJejECuViPnrbXDpoFOgoqagJh5lRPvvSDUlw9pMzZ
         l6k0oVUZ41w4JZdmG8vNMa+9dSvGFzKn49joEIFtLZatxNS+vbZt2400lDkbioWOcNVV
         HhAjvx63OwhlenpqZ6y4xDLtMlE8tW5NRIIt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600895; x=1739205695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWloYeXOW4QaytdzVsIVYG1GD3hS9rJLzpgn6nIaoVo=;
        b=QbYPf0rLdt0P1+TH9cVtd8/nhCybUZBtQD751FpgGrk1I8BsfkEMZAD79FoORN3tFV
         LvoA4Bc69mDOQ6AChyu+dmTh0alazata21dYwrXoglnked2PMNAhxQZcxtdTMw79ES9K
         ewJTh+HHTwUnGymLcufpufP9zDsZ+1WNoRQkCPwd+YRppjdfc1oxEJc9I214k+E99K6m
         TdFgAR2MeQSrDBeQ4c9sbOzbGNVoStHsls8aFkR/xaGri8ZGeR8zAr67NbThGaIF41S1
         FUc6GVmmni7/JU0mPbvIbJvc/HPBJULWs2H04ewKs466uzmMxuZUKN2uzH1d8sK0wQWn
         xPPQ==
X-Gm-Message-State: AOJu0YyRBGoqY/CTN5UWaQZG+ZrsLW6l961YBh6Cs2yqFMxWVlorhy6Q
	Y1oNzcGocxi+7fpgAXQ0llpspJbeNewW3iU6AkBbkwQ8YsqZTRW/nWqhI5ywoNbCfmIu6iusTjt
	+
X-Gm-Gg: ASbGncvAXISaslzmlqjWqT5AEPY+44zj1nY7yU1U74EhTdn0MAeWDINk1sVjUHB8wZ8
	FNSsd/pzuMU1XG5/AE7YPWSqVK/3d7gPL7I1UrcA05KRF5FK3ZdYJ6fz11DRFka2aJcTa7zr//7
	cppBYvqMB2NyLzFWmyL0cM7xNauPqo+Q7XDg2OY05ZL7RaJdsyQZG8O2qrM4L7goyqSNfbDTWS0
	4jR/pT0TCWVAeGfuAxfoMhRQbTjOYcRJw6hg0YXJU301KTkwW5tdjnqDePkAHgtsXWyf6NrWWco
	MKQFxg3zLOAEWkwdjPdhZe1v8XPTY+7M/UtPFoLi2qQG
X-Google-Smtp-Source: AGHT+IG+v/EU3CYo3TZ9OjS8TExDAiwblpL7H1sRVtKisrb9I6arysRWgqJWq+rJ9e3e925indWE9Q==
X-Received: by 2002:a05:6000:1a86:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-38c5194a53dmr19411313f8f.14.1738600895426;
        Mon, 03 Feb 2025 08:41:35 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/46] git: upgrade 2.47.1 -> 2.48.1
Date: Mon,  3 Feb 2025 16:40:49 +0000
Message-ID: <20250203164130.3403325-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210678

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...mak.uname-do-not-force-RHEL-7-specific-build-.patch |  4 ++--
 meta/recipes-devtools/git/git/fixsort.patch            | 10 +++++-----
 .../git/{git_2.47.1.bb => git_2.48.1.bb}               |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/git/{git_2.47.1.bb => git_2.48.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index e5135928f09..cbe9a32fa1b 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 348811a6f818408a31551d0830dcfe31c55d06a8 Mon Sep 17 00:00:00 2001
+From 2a97f61c558a03282c7d81797f1cd8b594f953dc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -17,7 +17,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index d511216..3144228 100644
+index b12d4e1..b5b8d82 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index d9a3672f1d6..e01953e324e 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,7 +1,7 @@
-From 83ae059943d3efd824978a759bcfd894ce5085d4 Mon Sep 17 00:00:00 2001
+From 0ada98b8e1de3fe835b439777303dfaf9ac65a08 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
-Subject: [PATCH] [PATCH] generate-configlist.sh: Fix determinism issue
+Subject: [PATCH] generate-configlist.sh: Fix determinism issue
 
 Currently git binaries are not entirely reproducible, at least partly
 due to config-list.h differing in order depending on the system's
@@ -23,12 +23,12 @@ Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd3
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generate-configlist.sh b/generate-configlist.sh
-index 8692fe5..e67ccac 100755
+index 5794226..6b0b939 100755
 --- a/generate-configlist.sh
 +++ b/generate-configlist.sh
-@@ -9,7 +9,7 @@ static const char *config_name_list[] = {
+@@ -15,7 +15,7 @@ static const char *config_name_list[] = {
  EOF
- 	grep -h '^[a-zA-Z].*\..*::$' Documentation/*config.txt Documentation/config/*.txt |
+ 	grep -h '^[a-zA-Z].*\..*::$' "$SOURCE_DIR"/Documentation/*config.txt "$SOURCE_DIR"/Documentation/config/*.txt |
  	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
 -	sort |
 +	LC_ALL=C sort |
diff --git a/meta/recipes-devtools/git/git_2.47.1.bb b/meta/recipes-devtools/git/git_2.48.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.47.1.bb
rename to meta/recipes-devtools/git/git_2.48.1.bb
index 8b5bfecd6aa..e0df23eb477 100644
--- a/meta/recipes-devtools/git/git_2.47.1.bb
+++ b/meta/recipes-devtools/git/git_2.48.1.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f4c4e98667800585d218dfdf415eb72f73baa7abcac4569e2ce497970f8d6665"
+SRC_URI[tarball.sha256sum] = "51b4d03b1e311ba673591210f94f24a4c5781453e1eb188822e3d9cdc04c2212"

