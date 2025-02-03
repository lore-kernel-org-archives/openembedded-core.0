Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21EBC02197
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.92271.1738600873080653570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eEPWZ+XB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862d161947so2360838f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600871; x=1739205671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWloYeXOW4QaytdzVsIVYG1GD3hS9rJLzpgn6nIaoVo=;
        b=eEPWZ+XBTE6JiQiHbpfaj5yJUYAfIn2g3Nf2dQIo/OjxkHYFkf2Xl7muPiS2wk/mi5
         4WN4cYBZjiwxh147renE0kTSk0Gj3KRXfmd4DkwLoIumyv8uolShf7ua8Roo9UVidrdN
         KjrmGU97V7xPU2xSZZLEECNesvLZ32bMfuymA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600871; x=1739205671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWloYeXOW4QaytdzVsIVYG1GD3hS9rJLzpgn6nIaoVo=;
        b=kW548X0SbxIckxlcVKEK5+LwysSE1N/EITSI+N2T0NOhcat3qBczl5YA/0b8FMiLGc
         q3hiE4OYFxoijJ8s4sSCzo5aqm1aT1qCNs2e+YRJfYCsu3ylv1yR8/lUX2YE2cHtj3EH
         GwHApvPShx0bSX+jAPDoihFIn0u4XvA9JLCll70TG5pIUqj8debO2q8VabMplTTMND3v
         VZ6ehAm0brvrZCY7MxDEtNBbKx2tsUg12vOBnU5P1Fity8wFCPltGJqXP5lwSx1+6GZZ
         0voO4Y18rN8aKHkZl31jd6pUvPjjQTS2zVaV/0kzkvt4irzewsQila1VQ3OYBmYarEHh
         zx4Q==
X-Gm-Message-State: AOJu0YzHoGTq240h6+1cZWXCYfvj1QjBxiyiTMml9UIoZ9RJEbdWZUCQ
	8fs5HV+M6wO+OzB4kV+2Y9dS4r+32VbJwGu6UnpNZ0lE1DOBG5nytrVbbeqynvBCwIe85Pqwc/d
	A
X-Gm-Gg: ASbGncty/rvfcYFNwZX2r/NyN3xL1Ys4c3X7Ivg//ZUzHsQyWSmuwLXsFuu8XCXzeDk
	FT+gV03rGZ6+rD/rgHV4TRUSSIM5Z0eFy2VCsdrWIodIY1AI37H2r/b0BQMqOn/9xnRP5OcnhvJ
	HKyu62rJ42BGh/YhZZP5QNwXSl2zlxqYFsCLNLTMJCEJuy/DASMJCGaCMx9pEBA/BI4BD+YsydM
	QswE25xpwX72aLMTkWgyuMMCA5AE+EqzEJBY1G8s7vNU4/jPKe7V2UlCg4zMTkm6jUbPoZIhMAX
	Jr/MeuxV/ZPpryo0zWVIfvZ5e9pNJoyKShU8Vo1NIMRd
X-Google-Smtp-Source: AGHT+IEJUAar3bg5kzYVNuLVMdQpvLK741P8RiJsopHsWtgefcjJO0cX/z+yzcR1B+8siR5TyD8aNw==
X-Received: by 2002:a05:6000:1fa8:b0:38c:5c9a:eaeb with SMTP id ffacd0b85a97d-38c5c9aeeedmr14993049f8f.15.1738600871140;
        Mon, 03 Feb 2025 08:41:11 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1d0bbfsm13479806f8f.98.2025.02.03.08.41.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/47] git: upgrade 2.47.1 -> 2.48.1
Date: Mon,  3 Feb 2025 16:40:23 +0000
Message-ID: <20250203164104.3403226-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164104.3403226-1-richard.purdie@linuxfoundation.org>
References: <20250203164104.3403226-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210672

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

