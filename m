Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DEBC3DA66
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:47 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.1054.1692634305538203557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YjFLk3CT;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31781e15a0cso3197204f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634304; x=1693239104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztC4glNDsCLeZ5ufLXMbEaWJuPeagRJ9R8zvlcJsRUo=;
        b=YjFLk3CT6sMxBOYGIffTC97XQ1krjwj9NQfqDvFKrBxJcaF1yyVQctTA0yDtAOikqH
         OIy4aPMKi62IoKhbW/z/KaDdanIfQkn94vPtXIAwMwqTd9kuSiZTokfOpOMTILsQwTwz
         XcDnn2SjolpYMi3jBE9yYHmv2dTbK/IRMCvOB/7PguJiWGIujxYgJ1AbqEPv8sCIlvvu
         dfOgtHzBpj3lq7dm/EGuGE5AG+u+rxxP9WUQG5KNoGrbq+Jss+RBxR3jrq0dqJs4xHqq
         Wi61/f5wYrduLqGLDqu1Dum/wlQHT0rEmNikVffuz7RuEkBTofG466tNN1g+FhrR11RC
         Thiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634304; x=1693239104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztC4glNDsCLeZ5ufLXMbEaWJuPeagRJ9R8zvlcJsRUo=;
        b=OZ8nlbA7A9ZSpDe2XUIySh2XZf0N7QpL24YZsYm+jlgnzex4v+eXTv+mANQo7NCh2l
         IHuGWSNqsGl/LSQ4MrE8FK3Jv5nz+SQQ7iGqbB5FquMTb9rrNTvVYYf5ZBTrO+CCGh4R
         pd2iNO+mMELgwMYUBwJGfkeyp4F8P56asAKi7Muru6qQC7uI1xnTOIOxkofdhZ4u8f3Y
         WFF/Ny+sQ9BL82HH5iUfBHdFpSrF2FmdW+RqZxh+qqW3a+3Iw1zd0i55OfM56SRfpn5W
         0HYMbWRg6Q/1iDU6F8yLp+nIs/5FJc8RQDYOaTxv6mg86NZav3qeeOpP8gL+fsb8IVbE
         aVOw==
X-Gm-Message-State: AOJu0Yw67nYyiDP1L5EdPWnF2PUhiPM/1XoE5ZwMCpFshYW22MKoOmEP
	yyCujtEaYVYLSLRp9qfu1gAHWmNEMb8=
X-Google-Smtp-Source: AGHT+IE5SZxqPofQhSduROCsYQ8FU6nQy2Mqf3oCTmhuYPRM2te6pmRUkerbjEE1lgCzHQo2cXCXcw==
X-Received: by 2002:a5d:560c:0:b0:31c:488e:ff33 with SMTP id l12-20020a5d560c000000b0031c488eff33mr2628705wrv.58.1692634303508;
        Mon, 21 Aug 2023 09:11:43 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:43 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 02/14] build: vscode configuration
Date: Mon, 21 Aug 2023 18:07:05 +0200
Message-ID: <20230821161120.171956-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186465

This is just my setup. It's not supposed to be merged into poky.
However, it could be useful to have something similar in poky because
if VSCode tries to index the build folder it runs until the OOM killer
stops it. Depending on the configuration of the OOM killer it's also
very likely that some other randomly selected tasks get killed.
---
 .vscode/extensions.json | 11 +++++++++++
 .vscode/launch.json     | 27 +++++++++++++++++++++++++++
 .vscode/settings.json   | 30 ++++++++++++++++++++++++++++++
 oe-init-build-env       |  8 ++++++++
 4 files changed, 76 insertions(+)
 create mode 100644 .vscode/extensions.json
 create mode 100644 .vscode/launch.json
 create mode 100644 .vscode/settings.json

diff --git a/.vscode/extensions.json b/.vscode/extensions.json
new file mode 100644
index 00000000000..09983dbc0dc
--- /dev/null
+++ b/.vscode/extensions.json
@@ -0,0 +1,11 @@
+{
+    "recommendations": [
+        "EditorConfig.EditorConfig",
+        "EugenWiens.bitbake",
+        "maattdd.gitless",
+        "ms-python.isort",
+        "ms-python.python",
+        "ms-python.vscode-pylance",
+        "timonwong.shellcheck",
+    ]
+}
diff --git a/.vscode/launch.json b/.vscode/launch.json
new file mode 100644
index 00000000000..145d2ab3e8c
--- /dev/null
+++ b/.vscode/launch.json
@@ -0,0 +1,27 @@
+{
+    // Use IntelliSense to learn about possible attributes.
+    // Hover to view descriptions of existing attributes.
+    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
+    "version": "0.2.0",
+    "configurations": [
+        {
+            "name": "Python: bitbake -T-1 --server-only",
+            "type": "python",
+            "request": "launch",
+            "program": "${workspaceFolder}/bitbake/bin/bitbake",
+            "args": ["-T-1", "--server-only", "-DDD"],
+            "cwd": "${workspaceFolder}/build",
+            "envFile": "${workspaceFolder}/oe-init-build-env",
+            "console": "integratedTerminal",
+            "justMyCode": true
+        },
+        {
+            "name": "Python: Current File",
+            "type": "python",
+            "request": "launch",
+            "program": "${file}",
+            "console": "integratedTerminal",
+            "justMyCode": true
+        }
+    ]
+}
\ No newline at end of file
diff --git a/.vscode/settings.json b/.vscode/settings.json
new file mode 100644
index 00000000000..4b61b35e1aa
--- /dev/null
+++ b/.vscode/settings.json
@@ -0,0 +1,30 @@
+{
+    // Configure glob patterns of file paths to exclude from file watching. Patterns must match on absolute paths (i.e. prefix with ** or the full path to match properly). Changing this setting requires a restart. When you experience Code consuming lots of CPU time on startup, you can exclude large folders to reduce the initial load.
+    "files.watcherExclude": {
+        "**/.git/**": true,
+        "**/build*/cache/**": true,
+        "**/build*/tmp/**": true,
+        "**/downloads/**": true,
+        "**/sstate-cache/**": true,
+        "**/vscode-bitbake-build/**": true,
+        "**/workspace/sources/**": true
+    },
+    // Configure glob patterns for excluding files and folders. For example, the files explorer decides which files and folders to show or hide based on this setting.
+    "files.exclude": {
+        "**/.git/**": true,
+        "**/build*/cache/**": true,
+        "**/build*/tmp/**": true,
+        "**/downloads/**": true,
+        "**/sstate-cache/**": true,
+        "**/vscode-bitbake-build/**": true,
+        "**/workspace/sources/**": true
+    },
+    "python.analysis.exclude": [
+        "**/.git/**",
+        "**/build*/**",
+        "**/downloads/**",
+        "**/sstate-cache/**",
+        "**/vscode-bitbake-build/**",
+        "**/workspace/sources/**"
+    ]
+}
diff --git a/oe-init-build-env b/oe-init-build-env
index 38333ab8582..450ae71788c 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -51,3 +51,11 @@ unset OEROOT
 
 [ -z "$BUILDDIR" ] || cd "$BUILDDIR"
 
+
+# Generate a minimal env file which can be used e.g. to debug bitbake with a Python debugger
+cat << EOFbuildenv > $BUILDDIR/.buildenv
+BBPATH="$BBPATH"
+BUILDDIR="$BUILDDIR"
+PATH="$PATH"
+BB_ENV_PASSTHROUGH_ADDITIONS="$BB_ENV_PASSTHROUGH_ADDITIONS"
+EOFbuildenv
-- 
2.41.0


