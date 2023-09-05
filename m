Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CC1CA1002
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:44 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.27268.1693933174362098010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=m6kGHog5;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so45094871fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933172; x=1694537972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUlTsoCRb7c61ci7ZVsjEUWCfwa7t3TQHbk7FZjqxn4=;
        b=m6kGHog5wvviT6RWxf2rOstCHV5ja1faUyMUZU/hcZLqPCLxW2m2zpbdo0N4f4IR3c
         VDR4mutdSMPcY2kaLE9Ilizqe09QwGLEZ2M2GB1BQ0Du3gUBRK7t1A+/GOEFTsglbUlT
         jlWfo39YOHUxBkT0y4jVJ9HiQj5hkr/f+piMTmhJgidCw6A6PgFscs0NV5TWH9T3nlBS
         vl8knIqWEByos07HpDXSDsiaiZyKnTh+eRoVs16HqVyfKALtuRlY6DrP0F4DmRPsFJJw
         wmaqo9+ycxLv3cwXLdqiM50pLzlEKV69HHLFP6lweRWDHmnwo6593Ae19GYAt5kbQdf8
         c84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933172; x=1694537972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUlTsoCRb7c61ci7ZVsjEUWCfwa7t3TQHbk7FZjqxn4=;
        b=ajvpsSKFe0Za0ecP/YZQrRxjWDpY3emttcARMw3pltHW69d9iBUbIx5S9BNvyU04sc
         eSVzExSfj1NKn47VrSYd6kyaZrJK/3Y6k4tCaJK6EUw2rRNLGC1XNM5GZxyv4nyb0gwT
         DT4y3kOYZL2nfM46xtNIAuq1vZh93VzuexZLB166ry8vbfhdYxti6zBbgoJ+8GC/7PCQ
         aLp8rDBewubO61HWkGpD/2ibFor+TjJTIgMKlM0m1cpLbolrmH1fghGtvYDqwigLG/8c
         0DxYI/doZ3mJgfmAI++OfAO7dx0YqRINYN7zIEs0U7/0Rrc/hGrEHuZ3CKj9ZnigN/9q
         VJrg==
X-Gm-Message-State: AOJu0YyW583I8MDpOtU82d0mavFKlHpjCYA6wLbtD9mIE8qPQIC6tvWA
	yKYFHbxMnFuVt+zRYKqAKjqvkjMii9U=
X-Google-Smtp-Source: AGHT+IGcV4F9Q6z8yne9uBGYX1KLD8GDURvC92MpEf3aMOIJKL8kWUQP+92yup8jL1wwfKsvPmBlEw==
X-Received: by 2002:a2e:980d:0:b0:2bc:fd7c:cd6d with SMTP id a13-20020a2e980d000000b002bcfd7ccd6dmr292557ljj.4.1693933171946;
        Tue, 05 Sep 2023 09:59:31 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:31 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 01/14] vscode: add minimal configuration
Date: Tue,  5 Sep 2023 18:51:10 +0200
Message-ID: <20230905165913.2560907-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187233

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


