Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE0CC54E5D
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:31 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.14881.1709739743259263117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T7soraQR;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-567f7bba941so922679a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739742; x=1710344542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBElgnmyKretgDpZ35dG/pdyAD4vvtWVfjYYIUv3LOg=;
        b=T7soraQR43IjowwitY5n+XsBZtgTOCDfoUK51COQ8dnW/1pwJElpIo+RR+BmmfUjUE
         4edd2cy1uQx5cQEWNX3u6eWhUA4ma09oUl2/7CQpceJ5bpIDLPAFnvlzyusOiD8dtKkF
         kaNMzdCZZPGfi6HyLy0XcbhHrxUDrsYA4OJbyccWqqR83YA4SdoWfJ69zz6Q4gpOpYnU
         XkTcYg7JuByZ1rP8qov8oNKiGdYlMAth9yKAcdBDEuMq21nYzSM6/bAmlQ1Q2nK3rwIi
         iZjaLzS1wCEHn4bJs+AhqTX4RpFW6gEgFBhUTjxnT6jfg+TvP8/rvdnJg1GmJ7YE6cxK
         KoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739742; x=1710344542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBElgnmyKretgDpZ35dG/pdyAD4vvtWVfjYYIUv3LOg=;
        b=QUf+NmeNuz38jOT1G2iZIque6sZ5jXlm9YuAxSsxjLVt4KK94TJ1OMPdCm7TdmG/Js
         vjxkXlTyJ+ZvkSDjovYvoO+MrPvXb7ioDehL0QhmIXGhZf1JKoqC6U9B7HGo0KTL/O6v
         /7b1pj26iuGYVOO7kdK6D+D2iwGwgX5OnoR12I334mkU1nLFr+skpPUgR1K7/YOq4iUV
         c2gjytK0BnpSihRVhituHUeO8Fl+0G2ZyiOIlslphS/l+2IRFYQnRCy4Ul11XOKBi5eT
         OtNDNWmIhZY6kP4dtZn3JB+I36TkBnQKsflKTkmzWGVSpqM+N5X/+9qgG7f7Trl1iNc+
         MmzA==
X-Gm-Message-State: AOJu0YyCs8glavagEFw72iPybHMmu5cgQF+Q+ahvACZAi4SRefb+SGTT
	lXjHfXc63nPT7kB1DLFNyNdgnya/87RETkB2mOA8s3kMEG9cH1VB+p6VYwV5
X-Google-Smtp-Source: AGHT+IF9uKu/TB46H3bhOlMwBlo9Ppdjf4/qK/exib4OomFx2AwkV/vLHWpB/bpg7a3AvppZbxy/gQ==
X-Received: by 2002:a17:906:d148:b0:a45:67ce:5264 with SMTP id br8-20020a170906d14800b00a4567ce5264mr5450186ejb.56.1709739741722;
        Wed, 06 Mar 2024 07:42:21 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/47] repo: upgrade 2.41 -> 2.42
Date: Wed,  6 Mar 2024 16:41:43 +0100
Message-Id: <20240306154151.3741709-39-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196722

Drop patch as issue fixed upstream:
https://gerrit.googlesource.com/git-repo/+/b8139bdcf87540fbe88a8b9180c052f5cc3a91b7

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../repo/repo/0001-python3-shebang.patch      | 26 -------------------
 .../repo/{repo_2.41.bb => repo_2.42.bb}       |  3 +--
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
 rename meta/recipes-devtools/repo/{repo_2.41.bb => repo_2.42.bb} (90%)

diff --git a/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch b/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
deleted file mode 100644
index fba89a32d82..00000000000
--- a/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b8e84b202cd302a7c99288d3835dc9c63071f8f2 Mon Sep 17 00:00:00 2001
-From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
-Date: Tue, 14 Sep 2021 16:46:51 +0200
-Subject: [PATCH] python3 shebang
-
-Yocto does not symlink from python to python3, thus change the shebang from
-python to python3.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
----
- repo | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/repo b/repo
-index b13e34c..205e0e5 100755
---- a/repo
-+++ b/repo
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2008 The Android Open Source Project
- #
---
-2.33.0
diff --git a/meta/recipes-devtools/repo/repo_2.41.bb b/meta/recipes-devtools/repo/repo_2.42.bb
similarity index 90%
rename from meta/recipes-devtools/repo/repo_2.41.bb
rename to meta/recipes-devtools/repo/repo_2.42.bb
index 4d614d9c5f4..9bb5000fabb 100644
--- a/meta/recipes-devtools/repo/repo_2.41.bb
+++ b/meta/recipes-devtools/repo/repo_2.42.bb
@@ -10,9 +10,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
-           file://0001-python3-shebang.patch \
            "
-SRCREV = "4217a82bec7b95c1a0bc7b081a1764a6a6d6c59b"
+SRCREV = "5554572f02537b8646139d59ab520e59e1d5f7b3"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.39.2


