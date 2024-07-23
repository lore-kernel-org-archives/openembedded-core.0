Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B196C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 15:03:44 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.46187.1721747018171368815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 08:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TZjSfBZ7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efd530a4eso4532133e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 08:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721747016; x=1722351816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4fwqkGhULJyVC1I6TLvG4NgJoZxnvikgFdzuLzMffA=;
        b=TZjSfBZ7ZMjEd8uxh3F5lTuZv01ENq72WdSa2FF7jw7v2J1OR4iH0QMLtMDY4DQSDk
         PWsA+VkI1BD95wneCivWVZsuYvQP3b9QaEXH6tGaFmIJc1slStIIIjVgXAH81kpVnE2K
         3D1cSqRS5wSiFs6h3F+8hr5+4igD89VhEIqsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721747016; x=1722351816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4fwqkGhULJyVC1I6TLvG4NgJoZxnvikgFdzuLzMffA=;
        b=pzB8QhURlV+Ymc3e2YtxAsKY5UjlMzEaE6ncECa5jCc1MQNsL2Vbjq7CMMbl1d2qXZ
         rQes5vEJ07jrqkNTrs/R0Z/SZzgI40tUZgVIT5KANSm2rKTdC6Har7iXDeCL6XT29GLZ
         WIACDD6nRjvz6eX0ADhgMsAq5b2faDMNLUJQRoievwG3OeU3OqmRrRtsPDaMGa2jzKmM
         E2air/EEZj6nROgO7xbc1GeL7B6dGiGGp61db8mdKmKXewhk7aJ2IHsdiWnJv7bPslw1
         u0kn7Rm2QApwSNIE7iNa9+/nqTl6Z78KwYi0M2aNZU7zYw26zzXpYRuunfZmYAGfZtse
         1rqQ==
X-Gm-Message-State: AOJu0YysgoEHEwaTNxf8+e++K2oo3gSYJO0AX0obBh4bI5Fr3yovLQfi
	CIPwpV9KqMggWAiYS18gmVeeI7J2tizzs7AZR76TsXXeZPGLYRY0RviM0nFmtdSKcOG7JcCtNU2
	+52o=
X-Google-Smtp-Source: AGHT+IFJjG7H3aXNx5zg99Bb3r/rF5jw2lb3FjS6dadRmZXPSRnLyPo6Q3VO5AWyRW4f8vJIur4brQ==
X-Received: by 2002:a05:6512:1390:b0:52e:fd75:f060 with SMTP id 2adb3069b0e04-52fc407571amr2205043e87.61.1721747015424;
        Tue, 23 Jul 2024 08:03:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dcbe:ae7b:e03d:272d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868aa6esm11822613f8f.26.2024.07.23.08.03.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:03:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Fix to work with glibc 2.40
Date: Tue, 23 Jul 2024 16:03:34 +0100
Message-ID: <20240723150334.1552027-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 15:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202405

glibc 2.40 renames some internal header variables. Update our hack to
work with the new version. These kinds of problems illustrate we need to
address the issue properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/files/glibc238.patch | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
index da4b8caee36..dfb5c283f61 100644
--- a/meta/recipes-devtools/pseudo/files/glibc238.patch
+++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
@@ -9,7 +9,7 @@ Index: git/pseudo_wrappers.c
 ===================================================================
 --- git.orig/pseudo_wrappers.c
 +++ git/pseudo_wrappers.c
-@@ -6,6 +6,15 @@
+@@ -6,6 +6,18 @@
   * SPDX-License-Identifier: LGPL-2.1-only
   *
   */
@@ -21,6 +21,9 @@ Index: git/pseudo_wrappers.c
 +#undef __GLIBC_USE_ISOC2X
 +#undef __GLIBC_USE_C2X_STRTOL
 +#define __GLIBC_USE_C2X_STRTOL 0
++#undef __GLIBC_USE_ISOC23
++#undef __GLIBC_USE_C23_STRTOL
++#define __GLIBC_USE_C23_STRTOL 0
 +
  #include <assert.h>
  #include <stdlib.h>
@@ -29,7 +32,7 @@ Index: git/pseudo_util.c
 ===================================================================
 --- git.orig/pseudo_util.c
 +++ git/pseudo_util.c
-@@ -8,6 +8,14 @@
+@@ -8,6 +8,17 @@
   */
  /* we need access to RTLD_NEXT for a horrible workaround */
  #define _GNU_SOURCE
@@ -41,6 +44,9 @@ Index: git/pseudo_util.c
 +#undef __GLIBC_USE_ISOC2X
 +#undef __GLIBC_USE_C2X_STRTOL
 +#define __GLIBC_USE_C2X_STRTOL 0
++#undef __GLIBC_USE_ISOC23
++#undef __GLIBC_USE_C23_STRTOL
++#define __GLIBC_USE_C23_STRTOL 0
  
  #include <ctype.h>
  #include <errno.h>

