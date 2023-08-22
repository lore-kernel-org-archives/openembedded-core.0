Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A85DEE49B7
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:46 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.5308.1692732217508595769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Aqv9/rDJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-991c786369cso646456066b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692732216; x=1693337016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJ2noxyUAermR9/zqZ9nBjZLZgXQzgpUT8BF3Db1Hes=;
        b=Aqv9/rDJI++yvr8lkjhf6l1ZDHQE1mQMB3FCLoIwP/Rq52d+lIMMTEFtRkhv7yUzdv
         ZTkXtOTBZmVu5yoAxoeljK17yM8jhgh+RjuXek89Bbf6V2Vof0u+TxaryZZJEfXRYVyj
         ccPdSxab1lffeonMsR7XX35MBmz2/cJlKwwXHg3+eF29b8fiD2QcePAx3YnUciyVuY4h
         bOUCoQkh4XqS7BVQ/Uh1bB9zJJAfxMExPzAYGB9Rdzx0GTnHhEhKn+YUX/H1wszSQhi4
         8dgnE/6qcdDvKMGHBevBuPu3j6oAZW18Ij84cjrxaAEeggKDQ/RNs0PCl8uRrGvxqp6o
         XYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732216; x=1693337016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJ2noxyUAermR9/zqZ9nBjZLZgXQzgpUT8BF3Db1Hes=;
        b=c4BarWNIoZtjEJ7s+VSuxPDI83KDnRHTf4adNV4ZmuiZbBJAM0/1BX8HQmvOz+96La
         t5sEEncAqulxUzqAHx/yPP/0oalpu+6FyneAFMDVVhmaWMQWZskpkhSvo9y3SwKwMF/W
         /wlG2ixB/b0+cuC78eNo1i7gqGOLQGYUAW1/3dou2rOVnu9rzeb2jrr5El7qcEIgZuMF
         MziUl403Iz8H4yjU29eUkLCel1cVcujbjhRFUc5ue4/WJ3FzW13ssEeyMa0G3BNr1fJb
         wHsjLQ4/oTmYIq6eDnghiTwguhHZB1UUipW28YfaB9/80FUVyEIfQoGN6C56fosoGFs8
         ivfA==
X-Gm-Message-State: AOJu0YzwMWEVBMV2YUHSn9rBCSmkTFQc5qPiloW/HXMos4vpK6r+zgAx
	SXhbz/R4gZPyL8bXarSCjsy2iFaizVE=
X-Google-Smtp-Source: AGHT+IFOjPCPJLvQj79P2E78EMA0tNvjRy8oTCk6+1/9XIEHuYUiC7N5DYEl19DqYCj2IHyyg9jl6Q==
X-Received: by 2002:a17:906:2099:b0:99b:64d0:f6c8 with SMTP id 25-20020a170906209900b0099b64d0f6c8mr9492541ejq.50.1692732215512;
        Tue, 22 Aug 2023 12:23:35 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b0098f99048053sm8744041ejf.148.2023.08.22.12.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:23:35 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 01/13] vscode: add minimal configuration
Date: Tue, 22 Aug 2023 21:20:07 +0200
Message-ID: <20230822192300.3235896-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186524

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

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .gitignore            |  2 ++
 .vscode/settings.json | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
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
index 00000000000..4c941d47444
--- /dev/null
+++ b/.vscode/settings.json
@@ -0,0 +1,29 @@
+{
+    "files.watcherExclude": {
+        "**/.git/**": true,
+        "**/cache/**": true,
+        "**/tmp*/**": true,
+        "**/downloads/**": true,
+        "**/sstate-cache/**": true,
+        "**/vscode-bitbake-build/**": true,
+        "**/workspace/sources/**": true
+    },
+    "files.exclude": {
+        "**/.git/**": true,
+        "**/cache/**": true,
+        "**/tmp*/**": true,
+        "**/downloads/**": true,
+        "**/sstate-cache/**": true,
+        "**/vscode-bitbake-build/**": true,
+        "**/workspace/sources/**": true
+    },
+    "python.analysis.exclude": [
+        "**/.git/**",
+        "**/cache/**",
+        "**/tmp*/**",
+        "**/downloads/**",
+        "**/sstate-cache/**",
+        "**/vscode-bitbake-build/**",
+        "**/workspace/sources/**"
+    ]
+}
-- 
2.41.0


