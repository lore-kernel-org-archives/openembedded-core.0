Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72B6C48BEC
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:56:05 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.5818.1708037755833199823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ogtkvn7z;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-337cc8e72f5so110773f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708037754; x=1708642554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTnwboz/2EVH9DhLgRmL3j64UEEVwUII/pOtGUS8pHY=;
        b=Ogtkvn7z7IBZUmcGzsVtoBH4GLVeBOLtK0X414z13zt8BrOoWi8lnB0Oklhr/9BYw5
         vvFqnkw6QMvO44OTq5f9aWMeiHJQ4QLvPgsz4HScC5mXf1y9V/khRLpVg0Vk/dHzyDuY
         jxH1nHMyjEYB/C5/7ECcjLPvWClGqFMQD1jhyFKaKWV/SN9H+0Q06eRn9Fjm3cYwiHLs
         P7QNBfWcOezyi32zZy/1ojkhw0E/7z3ImX6ihvpu32tlm3wAAlZkZ+fyCFoZWhf4rfwC
         cJpF1dgeXDABBh1kgTWQFZscllQG5XH6HzwE5bK8TUZsTsIf27WjDjAiLFqkkFWfm0kZ
         Anrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708037754; x=1708642554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTnwboz/2EVH9DhLgRmL3j64UEEVwUII/pOtGUS8pHY=;
        b=YuUIy+UTWv0LBuVMnniQ7N2kyXw+hUSm5+v5j/diVJQxPrdRCCctaeI27AU0ff1PWi
         d6DF2wR3dXB1kbUXjSmMB8KxJ43fTU0K1Q48smaa+3CN2VWPR2E216apkmIEZw/cEV2N
         vBMQfgq1/r16W4vxq1WrnSva4mWYELACThY1Z+lJKPmBIZ2zz4Gu3nBr/sCtc/nlK6p9
         FXf+Ux0awdZa9TZKb5htbqYsQyZxtxHR/941J370ddImfA95SmqGKM5CJaCI4GGs8wsL
         aZM+l1Q03MR4TBx/4cvZ0bvBRhGc0BGNzw1qqhsP8Lvoz0XeS/VDh8/rggsmvhp6Puq9
         dfHg==
X-Gm-Message-State: AOJu0YwxgXRF/mPuTh2+ZOcUS1CEhVDPxUjmQAS8MNW8oJHsPzp2JrHd
	3+pdnGR9RWx1UnUs5PAwTg0bmdmelJTwKa8shNv9fEAsxWhGxyaKFCG8uonZn3w=
X-Google-Smtp-Source: AGHT+IFE4/l2TP03vVZ+7E8UReSYzoPQHRn7GbHy7/8FsXnLO8orDzl0bLwbMftnKQwGFHN0yaSmVg==
X-Received: by 2002:a5d:638d:0:b0:33b:401f:bd53 with SMTP id p13-20020a5d638d000000b0033b401fbd53mr2254014wru.45.1708037753891;
        Thu, 15 Feb 2024 14:55:53 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d40ca000000b0033ceca3a3dbsm419778wrq.2.2024.02.15.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:55:53 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 1/2] vscode: drop .vscode folder
Date: Thu, 15 Feb 2024 23:53:32 +0100
Message-ID: <20240215225542.337490-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215225542.337490-1-adrian.freihofer@siemens.com>
References: <20240215225542.337490-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195726

There is a new official bitbake plugin:
https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake

This plugin automatically updates the .vscode/settings.json file.
Having the settings.json file in git and a plugin which modifies this
file is not ideal. It can lead to anoying situations especially when
working with git. For example a git stash reverts the settings which are
automatically applied by the plugin. While git stashed the settings.json
file the plugin immediately changes the file again and tries to run
bitbake based on the newly generated settings. When git does a stash pop
the restored settings.json file conflicts with the new settigns.json
file which has been generated while the git stash took place.

Therefore this patch removes the .vscode folder from git.

Removing the settings.json leads to other issues as already described
in the commit message of 5ff688fe29. But we still need another solution
where the settings.json file is not in Git.

Discussion is here:
https://github.com/yoctoproject/vscode-bitbake/issues/95

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .gitignore            |  1 -
 .vscode/settings.json | 32 --------------------------------
 2 files changed, 33 deletions(-)
 delete mode 100644 .vscode/settings.json

diff --git a/.gitignore b/.gitignore
index f6ce090b5fc..ec0447356e2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -37,4 +37,3 @@ downloads/
 sstate-cache/
 toaster.sqlite
 .vscode/
-vscode-bitbake-build/
diff --git a/.vscode/settings.json b/.vscode/settings.json
deleted file mode 100644
index 517a86d1bfa..00000000000
--- a/.vscode/settings.json
+++ /dev/null
@@ -1,32 +0,0 @@
-{
-    "files.watcherExclude": {
-        "**/.git/**": true,
-        "**/cache/**": true,
-        "**/tmp*/**": true,
-        "**/downloads/**": true,
-        "**/sstate-cache/**": true,
-        "**/vscode-bitbake-build/**": true,
-        "**/workspace/sources/**": true,
-        "**/workspace/attic/**": true
-    },
-    "files.exclude": {
-        "**/.git/**": true,
-        "**/cache/**": true,
-        "**/tmp*/**": true,
-        "**/downloads/**": true,
-        "**/sstate-cache/**": true,
-        "**/vscode-bitbake-build/**": true,
-        "**/workspace/sources/**": true,
-        "**/workspace/attic/**": true
-    },
-    "python.analysis.exclude": [
-        "**/.git/**",
-        "**/cache/**",
-        "**/tmp*/**",
-        "**/downloads/**",
-        "**/sstate-cache/**",
-        "**/vscode-bitbake-build/**",
-        "**/workspace/sources/**",
-        "**/workspace/attic/**"
-    ]
-}
-- 
2.43.1


