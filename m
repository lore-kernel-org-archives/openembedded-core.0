Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2668C64EC6
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.3126.1675840910613950144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=njeDSGkA;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so744394wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsFUw37sKMOjqmdVp+WD4I9uiebipPOF+goLE/ajt+k=;
        b=njeDSGkAeujDNzJCiL56LRIxMzReTD2iuUUeaVF5/7r6vDO/8wVBIa6ayDMXXAhdwS
         jfI9/F7BU7yrlLXBwmve2g1VFzFj4zd61OU5BEhrJqc9eDL+il6GCD27dHcNY0zmxx60
         /a2VcLXZC3T3sd4KvMQ3grlGz5HlyGb2qVDXDVmJWma3egC0eBfcbp5PdMZe4YQGOFtT
         q+RiRASv4f7H07Ed6M0Go4nTd5dYZT6M6V721wy8KZeLBO21OBLLulvnhrzhBEXk9mUB
         /K8raDozmAcvIwpMITOAXZU/hmCFHFQYC5rlPArk2GdZ2oXtNm0oird4ezjLCKgTcXd2
         taYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsFUw37sKMOjqmdVp+WD4I9uiebipPOF+goLE/ajt+k=;
        b=O6OSCEmKQSFc/6MXPe14+qQ+uOU2coMtWxHn/rdBhXqDt/TLH0YumwAWFh8du2h/Rj
         x+NA9s8BhF0z/F1EciXdrHzLQm6i7NpArDLVajEuT7lBc7iAWJPWLZqxKiRBxAP8RsOE
         osZol8QHO6QvVX3/PUkwGCJziQd+4N397nGvS42ay143J60CJSQpSWOuym9a21duA31i
         X0dpPZJcJVKN1SA3yp1CVNjt9VXLUOeSaUL4MJojNZFZS6ywbHsEaA+n2jb47uyfLFlH
         +Lt1bJPF4h8XKANmIsFyDeqPbIYvy33k4s/gChcbcjOPap125ZMAGGzhb2E3JpNYQ06H
         Qw7A==
X-Gm-Message-State: AO0yUKXb3P6z7XQ5/JpRkLW+u7icQmYcUfhbhXOMc2+3H/QTW/mPSNi6
	C0fzJ3Pw3EXNnIe9M6f6eJ1gzaj+rrQ=
X-Google-Smtp-Source: AK7set9g0TW0JUNCnZ0oXvVaZjbRnwvCKthrChvNGq2dcmh+kRKXN68q00vhDr+riwjXAqJHIYiEJg==
X-Received: by 2002:a05:600c:491d:b0:3da:2a78:d7a4 with SMTP id f29-20020a05600c491d00b003da2a78d7a4mr5558834wmp.21.1675840930805;
        Tue, 07 Feb 2023 23:22:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/52] dpkg: upgrade 1.21.18 -> 1.21.19
Date: Wed,  8 Feb 2023 08:21:31 +0100
Message-Id: <20230208072143.2930292-40-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176880

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch | 2 +-
 meta/recipes-devtools/dpkg/{dpkg_1.21.18.bb => dpkg_1.21.19.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.18.bb => dpkg_1.21.19.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index 1b5b89644f..160adbbe6e 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From 54ca20a18253bcf0915b2e2985bbee79bf881ebe Mon Sep 17 00:00:00 2001
+From b68fcf0e23b91dca7fecfeeceb1c4267e29e6f9d Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.18.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.19.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.18.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.19.bb
index 3bb84a433a..8d0eb40bd6 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.18.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.19.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "ebc2c3def335ac391b010323ab65a302648f3ec7"
+SRCREV = "2f3105279e0fb2255f39b2e9a11f15837cacd44b"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


