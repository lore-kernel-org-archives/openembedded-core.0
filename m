Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA410C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 20:31:08 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.23413.1707510661651054681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 12:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FLSml28Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33934567777so769605f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 12:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707510660; x=1708115460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QRlw2Ix+tT0OufUWCyFj57+y6Pa1m7iXzJTLnRhMIYE=;
        b=FLSml28YZQkUKUTagpv8jPKc86dxWdIPlgRce7y0q5eJpTxzUmv8YwWwh8l4AWkLdp
         eZOElL+0qFQWr+NLtXFON2w/D6BNMvrH3HVlOaC2HnNyvctI0xLS9+5MAwnWp4QNQDMP
         fg0le1b7X2TBezq3bBOdWlGplMLi3YdMkO8exQSMYl0u6v6rXTu32PSGunapz1ONwks3
         ErHxdxQa8rf1VV5OiRrZpGosIdbCwPG9LMcL0hM8e2LtOxu1iYmsMBMkkT1TJokm1mjk
         u7NQvNaMy7K3hGMcnsPNcFwpe+dS/3YROm9NcgfO8d8LtIDX38NPRx+YyRvCuIbraPov
         fl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707510660; x=1708115460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRlw2Ix+tT0OufUWCyFj57+y6Pa1m7iXzJTLnRhMIYE=;
        b=viI9yV6DHyc2vwxzkJaCAXuuHWvXz2CPPSA9qXiBWMF+pFh1GOx9ENU6XPoa9NaAIV
         MDEIZZuVijJoL0pMpZZU7BLl6o+/zk6p8SkMBHR9sqUtV0136FeqUuo0BPgVDNEREIzs
         MU7h0lPs74DouP2Ia1Rq4N1qybo0rYp2q82a6Z0gXNmHNudwdOh9tG8NjtWmZWCWfZug
         d4zek0WBaGm3HuZVKH5QcxWeJg7lpbH2Y8Foh1Na42jwpWBispC03fCobZ/zX66eOVXM
         XS7q6YoBRdb5vlqRVDbqgugT70l6zFbydrDIb5mcCdb5vwlL7x6/stqadMIy8TMDKUCx
         5r2Q==
X-Gm-Message-State: AOJu0Yw7z7PkM++o5pR+LwcqpExJdkfJtQXmkbCMC2z5ljFCRxb+PXhM
	Yce7GidHBAVyUSQNXCkaaSJVfhn84SP7RizB+J11+FWkah1S5Dcpt6Uo3DAk
X-Google-Smtp-Source: AGHT+IHA2etQpG8nVQ4jyeXixKjpjLFYzd9gThgttUANxEJsbSlrGshevuUJL2B/0457gQ2Jz9GZdA==
X-Received: by 2002:adf:e94a:0:b0:33b:247c:d61a with SMTP id m10-20020adfe94a000000b0033b247cd61amr91683wrn.31.1707510659625;
        Fri, 09 Feb 2024 12:30:59 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b0033b44b4da56sm108879wrt.111.2024.02.09.12.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 12:30:59 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] vscode: improve settings for new yocto plugin
Date: Fri,  9 Feb 2024 21:30:29 +0100
Message-ID: <20240209203029.3801065-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 20:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195246

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

Removing the settings.json from git would lead to other issues as
already described in the commit message of 5ff688fe29. Until VSCode or
the plugin supports multiple config files like bitbake does with the
site.conf and the local.conf files, there are probably some use cases
and workflows where the plugin needs to be disabled.

This commit aligns the default settings.json file with the default
settings.json which gets generated by the plugin. This is a workaround
for the issue described above. But it works only for the default build
configuration with one build folder named "build".

Discussion is here:
https://github.com/yoctoproject/vscode-bitbake/issues/95
---
 .gitignore            |  4 ++--
 .vscode/settings.json | 28 +++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/.gitignore b/.gitignore
index f6ce090b5fc..fa5345a79f5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -36,5 +36,5 @@ _toaster_clones/
 downloads/
 sstate-cache/
 toaster.sqlite
-.vscode/
-vscode-bitbake-build/
+.vscode/*
+!.vscode/settings.json
diff --git a/.vscode/settings.json b/.vscode/settings.json
index 517a86d1bfa..4d615ae3aa9 100644
--- a/.vscode/settings.json
+++ b/.vscode/settings.json
@@ -28,5 +28,31 @@
         "**/vscode-bitbake-build/**",
         "**/workspace/sources/**",
         "**/workspace/attic/**"
-    ]
+    ],
+    "bitbake.pathToBitbakeFolder": "${workspaceFolder}/bitbake",
+    "bitbake.pathToEnvScript": "${workspaceFolder}/oe-init-build-env",
+    "bitbake.pathToBuildFolder": "${workspaceFolder}/build",
+    "bitbake.commandWrapper": "",
+    "bitbake.workingDirectory": "",
+    "python.autoComplete.extraPaths": [
+        "${workspaceFolder}/bitbake/lib",
+        "${workspaceFolder}/meta/lib"
+    ],
+    "python.analysis.extraPaths": [
+        "${workspaceFolder}/bitbake/lib",
+        "${workspaceFolder}/meta/lib"
+    ],
+    "[python]": {
+        "diffEditor.ignoreTrimWhitespace": false,
+        "gitlens.codeLens.symbolScopes": [
+            "!Module"
+        ],
+        "editor.formatOnType": true,
+        "editor.wordBasedSuggestions": "off",
+        "files.trimTrailingWhitespace": false
+    },
+    "[shellscript]": {
+        "files.eol": "\n",
+        "files.trimTrailingWhitespace": false
+    }
 }
-- 
2.43.0


