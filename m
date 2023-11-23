Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617FFC61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 03:10:34 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.83757.1700709025677519304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 19:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CPe4jHiT;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5aa7172bafdso323576a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 19:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700709025; x=1701313825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pi7SMKTLGaD6nCGlHjyH3UBTVsqmdG47bbFlv3gYcMA=;
        b=CPe4jHiTR62XXe0MDCoqyjGalygZfOElqmG5hYWDtEI5Em2e3MuGdGgOt/IV32xjsa
         Ycm1W+hShn4rfLcRRx+xswX1GuB/rdB+czi76gxBF2aGuMxAvyeJFbT0zB3DJJWQ3gzT
         UQQW1+ypnl2zPTS4fIE1ZixFNEZbvqHPi12aiV2yyctbio3NBbfUf3IKZgwlDRPYZd3L
         BxSwuYcorlW9bd8Q3Ayitcw6RtOVJUUPg+quPLQlIGxs/ZGSfIoVnU2dWNvnLRWRNK3A
         0U4q5vt1mgkfDp298e9O3fGwxBIh+k5dZ/imvnZzcn96LbfXiLu5oP1sBU427gVYilXX
         0owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700709025; x=1701313825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pi7SMKTLGaD6nCGlHjyH3UBTVsqmdG47bbFlv3gYcMA=;
        b=rZ0ey73BtDkMqi613Ivrk4xAwpoT0IanMNkE0y4LzXPF27yR2XGN4wnPhk2FEz/SUp
         OjrGhbKvAPbBqfVT8YbmVaaHubeolMyMHlpk3b5pnBihljcw8In3zKwtc7HuqO8d2XlY
         lBIJq0xB4Sw1ZvobhS7SBnPX+lDZpMEjqj0TWATE2lUJyym//SrnnUfOI9oaJWG03MiC
         7jjMg2iM0QkQHUEWnPIkH1Xf32eU1kf2qj9H6fHjs9TiY4Y/+jppABwMFu9PoUOJckaO
         EYEwAZtwMXMC5glB2+2vzD3hjVRh1kAf0iaqAXANTmpLMFtEAEbBpEgESbfCIbn8dauH
         XthQ==
X-Gm-Message-State: AOJu0Yx8z3XAKquRpdTzvKnZhmbP9BBJhOV0jVahsxDvdO47SvdkP9un
	E+CZdHIaiVIyeSgvFGeOgbKravnhzAyDzQ==
X-Google-Smtp-Source: AGHT+IElGQnV3qsN9CMPVld5dw17tUho2q2RD9fhdVAF6FmsOwUcNoa5IlCM9opll3tBblxl7KczOg==
X-Received: by 2002:a17:90b:3145:b0:281:3a2:80ee with SMTP id ip5-20020a17090b314500b0028103a280eemr4150093pjb.14.1700709024485;
        Wed, 22 Nov 2023 19:10:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id v8-20020a170902b7c800b001bc5dc0cd75sm149060plz.180.2023.11.22.19.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 19:10:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] shared-mime-info: Fix build with clang-17+
Date: Wed, 22 Nov 2023 19:10:21 -0800
Message-ID: <20231123031022.2885472-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 03:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191130

This is needed with libxml2-2.12 and newer

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ild-with-libxml2-2.12.0-and-clang-17.patch | 26 +++++++++++++++++++
 .../shared-mime-info/shared-mime-info_2.4.bb  |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
new file mode 100644
index 00000000000..936f72ccf87
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
@@ -0,0 +1,26 @@
+From 665383306c725f299a1b373f947cda01949d49e4 Mon Sep 17 00:00:00 2001
+From: David Faure <faure@kde.org>
+Date: Sun, 19 Nov 2023 11:18:11 +0100
+Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
+
+Fixes #219
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/commit/c918fe77e255150938e83a6aec259f153d303573]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/test-subclassing.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/test-subclassing.c b/src/test-subclassing.c
+index dd099e4..0758164 100644
+--- a/src/test-subclassing.c
++++ b/src/test-subclassing.c
+@@ -1,4 +1,5 @@
+ #include <libxml/tree.h>
++#include <libxml/parser.h>
+ #include <stdio.h>
+ #include <string.h>
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index 5ba40236096..c7da0ca2d2d 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
+           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch"
 SRCREV = "9a6d6b8e963935f145f3a1ef446552de6996dada"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


