Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A900FEE8000
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:47:27 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.39465.1694180838855598516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xV6f1wiM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68bec3a9bdbso1671982b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694180838; x=1694785638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=klu+xor2MceVsLlecY4Mxu3+mXCqzSJf3Z6Xa4N8H8w=;
        b=xV6f1wiMCGqvETBDoutvulNzDgLF2wxtfqUEgqgJmS7JJ3ynYUUfVWa/onndt0srFb
         0ZG/bEuTT7NT4RcUuOsyIL4CEeVd98PVo1JliXNXDNWRSzCkCd9dWd+OulxwhNCl9Pne
         FKaUzgjU4+yq/SkfaYBvoAVdasmZhwe3D91bhnQG2yvxkai1WLmhKLhwlurPGirsLtI6
         cEcnBe/yeu0EPKA9+MVyhWD9/Nc4Rbq0iTrfOj3GJhivq+DtnzdDwxDXmDr9PqV94ZD+
         bpzub5dtKiTZJGh1Prs/uC25VgTPPvBvA2b4z7/Jtr44XWzqqzLLV+lWp9bJOhTcZ5zS
         AJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180838; x=1694785638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klu+xor2MceVsLlecY4Mxu3+mXCqzSJf3Z6Xa4N8H8w=;
        b=FjHM161QjYq/EgPCBzwIrD9Jv3ggo2ONYAO9JxJh4llZf5cFeOgGIBO3TUHr8oI4OV
         o0mmHoVQQ9sarW1/ze8fxq0bADe7K73iQ4ZmdwK8gEfarSVXL94PV2IPQzsazzeQXLIO
         sDC+SP92NGYrjH5wjddPwKJahNxFD/5CUbLEUY2EuYMJtAU+qgFinE5qsWgBYf0Se1a+
         T8/gT/ZI1L8IVlzGoWvUfd0DMxJdSqPXbtxSxwBE9mAG1GELNrJ44W1Yhiw6Hw5LK3Qp
         zeRuTrX4pP3M+NhIwVNUlK3wVmqOSJOCqFdSGLJ36jxQa4J8IWQ8PWMc2olHDFHXIQtB
         rPTw==
X-Gm-Message-State: AOJu0YydH77qmASKgWXxxO9lw2r/4s34UQFlAYj3EgEMt1DyrqZ9VbEW
	RACmdQEka0aSAeWHsCU5fSGwKhZEauS4YTNvaQc=
X-Google-Smtp-Source: AGHT+IHnvhsm/KTvW0yV1CL3E2xoClXsh0ncLBwDAJI7wll15JjGhr48v10vVrxfvj+9kUqlPyZPRQ==
X-Received: by 2002:a05:6a20:3d1d:b0:149:802f:28be with SMTP id y29-20020a056a203d1d00b00149802f28bemr2991726pzi.52.1694180837888;
        Fri, 08 Sep 2023 06:47:17 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b00653fe2d527esm1344828pfv.32.2023.09.08.06.47.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:47:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 5/9] python3: upgrade 3.11.2 -> 3.11.3
Date: Fri,  8 Sep 2023 03:46:56 -1000
Message-Id: <a991fe85dca51ddf36994666e14e69839dd694b2.1694179812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694179812.git.steve@sakoman.com>
References: <cover.1694179812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187427

From: Alexander Kanavin <alex.kanavin@gmail.com>

(cherry picked from commit 7d5bb3a4690ef61a1fee21773b4717e829789e32)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Don-t-search-system-for-headers-libraries.patch        | 2 +-
 ...1-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch | 2 +-
 .../python3/12-distutils-prefix-is-inside-staging-area.patch    | 2 +-
 .../python/{python3_3.11.2.bb => python3_3.11.3.bb}             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.11.2.bb => python3_3.11.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 96e5e81342..c9253832cf 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 7d296dc635ad3ac2792955ce37e140a4104b098f Mon Sep 17 00:00:00 2001
+From 6cb667f37beacd832cb409e5244b3c90dfad32f7 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 86971f4048..d5b7ce2b95 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From cab8b8b1390165a93dfb27c48c1cc4c3e4280dfd Mon Sep 17 00:00:00 2001
+From 4ed481f4928c361970e78f27c4d9be8700af176b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index e080b5c562..5ee4e4f126 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 79e7ed59750612e57647847957ab85709307ea38 Mon Sep 17 00:00:00 2001
+From 4c39252c71d8bca81fdc43753c83a59f8668c619 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.3.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.11.2.bb
rename to meta/recipes-devtools/python/python3_3.11.3.bb
index f3be9768bf..0563a0ab9b 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.3.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "29e4b8f5f1658542a8c13e2dd277358c9c48f2b2f7318652ef1675e402b9d2af"
+SRC_URI[sha256sum] = "8a5db99c961a7ecf27c75956189c9602c968751f11dbeae2b900dbff1c085b5e"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


