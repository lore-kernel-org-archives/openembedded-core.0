Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A009DC001B5
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 11:01:49 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.4301.1698836501395720846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 04:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C3j+haVH;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9c773ac9b15so990248666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698836499; x=1699441299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUlTsoCRb7c61ci7ZVsjEUWCfwa7t3TQHbk7FZjqxn4=;
        b=C3j+haVHS6MwH8cKAe8r4LbhTx9c2OhpNjf6Kva64MxZh9+AicH5DhTXosI66iZQFK
         zNXfO2xJhwno9Q5njp++7xuFs1VeNEAT+gAFcsdcRDX2gbjmkWblXbRSVTdoi+nEjGN1
         S57vJ2D8cv4Pc9nHngwkhEjrtMZY/ZMUHpapNJnul5IlrAR97wMDr06tREOjHfqxNgIk
         uIc/iX53Q4Fiduowiywr7061az2uzDygEB2g8tyHoKkMoj6UEDnM2zEWIhAyfwouK5Hy
         eIS7dJwZ/MRUP09pPqyFJMgzScr0Fmj3AmcR9Ua09PtisynYdYVrKTN2Yv4vYCfNCDUp
         u4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836499; x=1699441299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUlTsoCRb7c61ci7ZVsjEUWCfwa7t3TQHbk7FZjqxn4=;
        b=mtlEfR8INs8ZznEC6r0KXEufSfzjkzNRbWScAmkIlIZ7z0i3UqUDCVPKzCTDgHedWw
         zDLPnP59OD2JXqXFyNRvbLmhZC/5cv7omAcxak2V1HZEX5OHoSlWrcxkwyTP+Qq+L0Ar
         IlP5PcQH+Wdr4BFCPWlzsS8gAxWD9hFy2ZmApi25h+7Zrr/U/JkzWHcqGSSi9gplfqVV
         BckTGNX1NojGfoVYdtzyQOjEtxTpO63bYuTANRu/plW2R4GSx5XhSBFdD2AjWyniJ/+Z
         uPeCzZjgKaMMpEWT1ge2CUgrdtL7iWZcRFpYfuz2wQ8DoJSwy9RyJ66iwaxjSPl3kckI
         MUsw==
X-Gm-Message-State: AOJu0YwX+thtJL1ydu9dOP4n2ac6bmmjGgidwTFvFSF0FwVLtNkWQ4LT
	IN+vol5VWnUb+U+pcT2qRtlXSo8eHhs=
X-Google-Smtp-Source: AGHT+IFkpLsVZhhLPqR/2hQ+mTYn6Z3vJAsrNOthozYPMXRujRpYsU8EY2TLZc/UO9qw2HUBdrIyaA==
X-Received: by 2002:a17:906:d90:b0:9ba:a38:531e with SMTP id m16-20020a1709060d9000b009ba0a38531emr1368330eji.52.1698836499440;
        Wed, 01 Nov 2023 04:01:39 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090607cc00b009c7608eb499sm2262426ejc.94.2023.11.01.04.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:01:39 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v8 1/8] vscode: add minimal configuration
Date: Wed,  1 Nov 2023 12:01:22 +0100
Message-ID: <20231101110129.647878-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101110129.647878-1-adrian.freihofer@siemens.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 11:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189900

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


