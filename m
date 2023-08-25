Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC91FC6165
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 22:27:43 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.2557.1693002459014977151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 15:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=o6Tccs0g;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5256d74dab9so1995482a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693002457; x=1693607257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJ2noxyUAermR9/zqZ9nBjZLZgXQzgpUT8BF3Db1Hes=;
        b=o6Tccs0gC/tldC829eFazh7iz50UiV4DoLlNqp23vWzf8elctkuuNbYXHSlKb9CrEQ
         DMUOz8E9Eh51Ff0JeVGJ1UtR3K3L2kPsUJO0O1YQOq0M0l03ttHCwdjy9rc+LtMVkSoo
         FCz6a7yBDYEVB31FAMFvUvAS78SVXzXUWrur85vODQzVZ5ZxyOxdEZKKtqdnN9fK5bfd
         YwKsYdm3I27fEwlZ7w0lLqSeheB2+1R282k5pJ1Tb4fnLtUJmKvIBDPdUDBycUw7MM55
         OSpksEv2ts/KpgPCNyjlHMXAsAVzU9SdlIk5nFXfUmEa6O9qOzD2VaHUxzYO/7xcN4pT
         Pbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002457; x=1693607257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJ2noxyUAermR9/zqZ9nBjZLZgXQzgpUT8BF3Db1Hes=;
        b=lJN0NiokEvyyKwBPNw/0VMxg29uiatzI+mQ/f7QTBD9VUZ82x6x+iq0YjNlbI8xp+V
         4r4fc5BRgP7Ri8OoPNRRLInT693v0u1c/DRb+yaUTG1WWE/fEbQn046n54Q8yzmmWL76
         +SK80Z5tjfSwiGuegrhLBEci2Vqo3iOJXo9Lcd+C7suFlUyqTeCGXzS5wGZS6i7OkA60
         YvBp3/+BV7c9B03JQ+S6oWFVuktRA9oJskGpxZWvQRagnFXcQIXaOKHNuuZHnk//Yuhd
         4QUrnJCCJUnk8H5Rw1dxqEuW+JXOIzKHY0+2zmkTLGnWGIW22EkT/fdDyBsbPYdELpNp
         Y+Yg==
X-Gm-Message-State: AOJu0YyrXEyW6aZmALQcRffrfNuMMC2E2FyGmLQrOuls4pR0xMQUaHk2
	+3abj31fiITI2gLbpWiZUrZ6m4NZjFo=
X-Google-Smtp-Source: AGHT+IFlL5rz+uqQltt2a7l4RH2DEblV2yktV/m6lnON2lxDsLPZflKvWhbN24zz7sKulUBMl1culw==
X-Received: by 2002:aa7:c648:0:b0:525:7e46:940 with SMTP id z8-20020aa7c648000000b005257e460940mr16822172edr.24.1693002456912;
        Fri, 25 Aug 2023 15:27:36 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0050488d1d376sm1449057edo.0.2023.08.25.15.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:27:36 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 01/13] vscode: add minimal configuration
Date: Sat, 26 Aug 2023 00:25:41 +0200
Message-ID: <20230825222711.2735745-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 22:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186728

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


