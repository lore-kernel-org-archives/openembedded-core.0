Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBF7C83F17
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:32:29 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.4400.1693164745703868517
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=J5oFSdUV;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso318767766b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164744; x=1693769544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUlTsoCRb7c61ci7ZVsjEUWCfwa7t3TQHbk7FZjqxn4=;
        b=J5oFSdUV7nTFqlXwXoDCbadLcXn9l4pmiFgUuP+6w2CdnAZSE58e/VrzUeeZheu2Ri
         NKuXeocwm+y5eNZ/StlSX+ug/5XEPPuvrTwbppOrOrTYBKzHUklDWeBLf2Us5KgqGdNz
         +EPNvDZpMu9l+bEtCO82jA4U4VwOQEUXzfgDJtBkTi0CJclbn+/1Fb4CyyMnyoGloqrK
         6AUn0FGSx1AZmcxLkKQKNBF1vqcTqo7vLzkxXku1gejlQgF6zTLxJGjIDYYSrgvhm7DE
         7n5VLgcvZKmHoPcFtuODyFHn1ZqHkqeyrfr1lbjT4euAxhyw4kFxoY/oV/wbEMPNHcaN
         KsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164744; x=1693769544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUlTsoCRb7c61ci7ZVsjEUWCfwa7t3TQHbk7FZjqxn4=;
        b=GvaRMoxnpgQ5s6VmdkeV4QFHaBBpRGLvviLVWS8uKEFLLS+pHWlnshnuNyJRXJJ0ic
         ib0EDRWLuOmvscSfHU0NST9VzBkw7aNC6WQ7L5K3GrT3V+GfUbKS+5yJryyB8NOWW04y
         eSrJrU1T9GOqTdqMDzgEoaB3027cCNmA//Q4JwUXMWXN/FZlp5/WjbLEY6K1IobgUgn1
         amDgHs/va5t1/R3JORXHcZBu4OX6mq38Tt8+jEEuV85R90vxqJphTk/lbVtoZ9/LwM3H
         4lxa9pbbrXNo+K/DIB8OqnvsCHc8+ksejB0b2arQiH9SKSVbr4Sq6a1XAR5qGFEzHDF7
         80Sg==
X-Gm-Message-State: AOJu0Yw9cxaiBcoEVTHcC4gwEYnY8R2qQ9UWe9KQxIpfoB7xAG3EpqVz
	r9BtngT3f1/R9HfnxYzsskll9GaDDuY=
X-Google-Smtp-Source: AGHT+IFFVv5BdCwH+2/z1B19qFivcV7vWgNa/DF7ZCLlNPkTrHdyf50OLnd8Kq8xorCjZYIDplPC3A==
X-Received: by 2002:a17:906:19:b0:9a1:ddb9:6550 with SMTP id 25-20020a170906001900b009a1ddb96550mr10683885eja.52.1693164743929;
        Sun, 27 Aug 2023 12:32:23 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm3740261ejb.96.2023.08.27.12.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:32:23 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 01/13] vscode: add minimal configuration
Date: Sun, 27 Aug 2023 21:29:43 +0200
Message-ID: <20230827193200.4083340-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
References: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186781

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


