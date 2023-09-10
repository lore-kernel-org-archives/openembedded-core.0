Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8ABEE57DF
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 16:19:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.39051.1694362761697020691
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 09:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oPBIYxXt;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40078c4855fso38899675e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 09:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694362760; x=1694967560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUlTsoCRb7c61ci7ZVsjEUWCfwa7t3TQHbk7FZjqxn4=;
        b=oPBIYxXtZlHBAvupd6Kf18F2PAU7OgrYK1suIXZfr6Ta8ZbdBzj015Pff1qsn8vbFz
         956aITzhDt9b5ce9yn7xqMip0AE6BroxsQxNUdSGQVCs//nT0jN3jNVI0hJikiQhDs4V
         /nXWxqOuOJXahLzkwVFzPkzTlP3sBLvTsFbrMUOhXVE3hYbNlqTBkn5GETDWKTUQGDQm
         PA0kJNEYOI4cHcUiYM/6QskxtlnQZ+0Pk/mDyR8R7WyIERGUHHurf5vA14kPsSbQGU46
         tMkptKSU5C10+JtHOKXxKNrRwLDjJxRGBUm2qLvH+59VeIUHhmJZFuzJWkt5jGtP2dYb
         GP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694362760; x=1694967560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUlTsoCRb7c61ci7ZVsjEUWCfwa7t3TQHbk7FZjqxn4=;
        b=YJk14yMk+kq7cK4+dZCg1DxeCMC7JOMYaf94NsibaQeIlSKsj9Z3rY8NkNizqfNknX
         6kPsKXBeFFsB41+byD7Q+2/QroVVsi97R1rNQJkNAowcElt3AnxKKSr53gmIsfAycujH
         RAnjlxRgnPkmqrigQxSCf/zhw6oDkARXxFJDKW7u+/d4IcYQANMYj9+sY7/NUPR1r9+U
         pb/pw4Z6FpH/P7pND3h5VCjtb+IdyJ0/fn4kcIGiM7jsqrAxv2oEcQSFy5K4y085aW4J
         6rWYoxvJLcB7Lz3ZZb4krNQdQvGPgpSTko/KNmxu//gvTU2Cl6ivr4KI/B12+QISf4PY
         40MA==
X-Gm-Message-State: AOJu0YwzZSqhSR19z29lSQnCDkhB0bPE0PYFCfj/83gHZYsJ1h/4KY9s
	kxE90mTMatd6DaXGTQSGHKxPNB/Jycs=
X-Google-Smtp-Source: AGHT+IE/Mpok2TS4WR3Pg+00laHo4iVFcGkP/RqIWVMB86u4ZumFG9JOp/TJlwv/IKD/JAZW83yMpA==
X-Received: by 2002:a7b:c459:0:b0:402:a464:1a20 with SMTP id l25-20020a7bc459000000b00402a4641a20mr6295468wmi.33.1694362759679;
        Sun, 10 Sep 2023 09:19:19 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d408c000000b003142ea7a661sm7605431wrp.21.2023.09.10.09.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 09:19:19 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v6 01/12] vscode: add minimal configuration
Date: Sun, 10 Sep 2023 17:52:27 +0200
Message-ID: <20230910161850.4032227-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 16:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187459

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


