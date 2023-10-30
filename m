Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FFCC00144
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 21:32:15 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.171848.1698701532657332157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 14:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bLLQjynD;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4079ed65582so36240145e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698701531; x=1699306331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUlTsoCRb7c61ci7ZVsjEUWCfwa7t3TQHbk7FZjqxn4=;
        b=bLLQjynDyUuRPPY4LzPw85xVNqn48m2G4VqlbS433YUcfT0HtQLXrUAQ4h45dvmK1z
         6tJQg4rMc0iDERt+JKECn5HfZCLHRn0pURuceO3QX/IvXabrvCy4u19Wc3rQK12eLfTU
         uMF195zy6wCY2eEqaH/kAWDHMLHjvVtr5gQNCJJdwcyYb0ENAofVoI9f+zGNrUDB+Wr5
         2t6FdWY3oFXFs/Lryar3o72qMwAe6+YD6xZUSeYTrGPb5TTnGKjRxgM6tadCqQmRL6oH
         UKxk2WwL7nfdDbwegJe/8ear4TC5opbHJuUDMx6b5024yWb1dF2BtWNEt2/psh2R4rfT
         krAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698701531; x=1699306331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUlTsoCRb7c61ci7ZVsjEUWCfwa7t3TQHbk7FZjqxn4=;
        b=fTzJqrFIpib5KEHyOG9maSp1xoMwSSNgB6Z8WjnT9ehloA7Kxpy06XhgKs1+O0lGor
         SyVcUngFzegzRq0b1tyvDp4+TStLOpvbFZf+Il1Gxrpm+Rb0UwxWIQGBfmcDBxldYwq+
         kr3frUYuhXD9telzThXQgBwSkJTozzT0Xa2uLunWbZR2JxsQUjQYktS3s0ggbFR2c7Zu
         Mq/E3IpgDHu83g7ZgnRnSF/zeIhtEn9vD82ohhYZDRgfaN2XyzzIgkIn3AN1RjktZhHS
         3YLdr7Kq01DQz5jcqvIZXWanefLIquZ7WcPKWejJDqXOste2xN+S8AJLFypuJRLRiHOL
         olFQ==
X-Gm-Message-State: AOJu0Yx/+aCl0VcynI+U0t6AaaitBJk15kDdzI/UUfW9Ged7cCLsEyCn
	8MHz6w6b4OF0d5/7102FBSo5NbeXxDg=
X-Google-Smtp-Source: AGHT+IEqRNSIJb90fp4FMluQGuJe2CrwGuNq5gfM+P6f8iQfjmMb4XNGFp+6gn5/6GOy8CYsM46Imw==
X-Received: by 2002:a05:600c:4ecb:b0:407:58e1:24ed with SMTP id g11-20020a05600c4ecb00b0040758e124edmr8664487wmq.39.1698701530675;
        Mon, 30 Oct 2023 14:32:10 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003fc0505be19sm304811wmq.37.2023.10.30.14.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 14:32:10 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 1/8] vscode: add minimal configuration
Date: Mon, 30 Oct 2023 22:31:58 +0100
Message-ID: <20231030213205.2824790-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
References: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189813

It is essential to configure VSCode indexer plugins to ignore the build
folder of bitbake. Otherwise, the indexer plugins run with 100% CPU load
until an OOM exception occurs. In practice, this makes VSCode more or
less unusable for working with Yocto until a file like the one added by
this commit is deployed before VSCode starts. From the user's point of
view, it is not obvious why the system runs at 100% CPU load and
eventually crashes.

It is even more misleading that VSCode starts the indexers immediately,
but does not stop or reconfigure them when the ignore list is updated.
In practice, this means that every time the ignore list is changed,
VSCode immediately starts indexing the build folder until the OOM
exception stops it. Depending on the system's OOM handler, the entire
build machine may crash.
Particularly annoying is the Python plugin that ignores the general
ignore list and requires an extra ignore section.

The settings are suitable for workflows like bitbake, devtool modify,
devtool reset. The settings are not intended to work on the source code
of a recipe. It is assumed that a separate instance of VSCode is used
per workspace folder. These per workspace instances can have different
settings depending on the details of the sources that come with the
recipe. The new devtool ide plugin will generate settings to match this.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .gitignore            |  2 ++
 .vscode/settings.json | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 .vscode/settings.json

diff --git a/.gitignore b/.gitignore
index 8f48d452dab..f6ce090b5fc 100644
--- a/.gitignore
+++ b/.gitignore
@@ -36,3 +36,5 @@ _toaster_clones/
 downloads/
 sstate-cache/
 toaster.sqlite
+.vscode/
+vscode-bitbake-build/
diff --git a/.vscode/settings.json b/.vscode/settings.json
new file mode 100644
index 00000000000..517a86d1bfa
--- /dev/null
+++ b/.vscode/settings.json
@@ -0,0 +1,32 @@
+{
+    "files.watcherExclude": {
+        "**/.git/**": true,
+        "**/cache/**": true,
+        "**/tmp*/**": true,
+        "**/downloads/**": true,
+        "**/sstate-cache/**": true,
+        "**/vscode-bitbake-build/**": true,
+        "**/workspace/sources/**": true,
+        "**/workspace/attic/**": true
+    },
+    "files.exclude": {
+        "**/.git/**": true,
+        "**/cache/**": true,
+        "**/tmp*/**": true,
+        "**/downloads/**": true,
+        "**/sstate-cache/**": true,
+        "**/vscode-bitbake-build/**": true,
+        "**/workspace/sources/**": true,
+        "**/workspace/attic/**": true
+    },
+    "python.analysis.exclude": [
+        "**/.git/**",
+        "**/cache/**",
+        "**/tmp*/**",
+        "**/downloads/**",
+        "**/sstate-cache/**",
+        "**/vscode-bitbake-build/**",
+        "**/workspace/sources/**",
+        "**/workspace/attic/**"
+    ]
+}
-- 
2.41.0


