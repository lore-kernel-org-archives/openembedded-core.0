Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503DEC52D73
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:52 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.30126.1722791384068746539
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vS6JCUW5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7093d565310so7999373a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791383; x=1723396183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVEDN8zOdbopMA2MRwe5MW9i1Y5Q0eex+5eQET9aXCQ=;
        b=vS6JCUW5vvmEBVa/BbLhMZ1uArpFjk6VroUKBwGaXrxs+tEyKrpYTes9p9OJ9e79dh
         zCXtswFgsqX7mtJInA3jB+DYaAI5CquB6n31u2duYFK4CO8rsO0s7tnAAYwYr9npxt6g
         /NNthJMapBisNDwq0rc1You6N/oi6d2xPpHGaTodMLvRoTf0zvicIuqXoMyoBfFTvRf0
         XoJwjSt67Fke34EPgDiKpyFkRW+Dl1DSzb0AnkWAmEaRZca+ABJ4TqtKg9iSOtoXCsc1
         xv9B/yJ1ZHJLpRwDoEHpFocrV4kSBgNrKHQevWZAN8sXf9GDHxNqXnqOfkx7QH8qB9uo
         TE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791383; x=1723396183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVEDN8zOdbopMA2MRwe5MW9i1Y5Q0eex+5eQET9aXCQ=;
        b=C6uHBsENcW+RbalTPFCH7M0WiXVKx6741eqTvVjg74/zjg1wojUAzBG/C34sQjIh9B
         E4CNVWIPt7YF2OmsjZ0gT2UMn6cg74+d5RTY7JDqOPH0q4uq/FCkEyqp8AbKYeFI6Tkx
         MiTBm/0xD2YNoLrwdEON8ci8KlcxzitBohjOLrlg+2bF7PwQ3ueFDHtIdvZWQN3VPqkV
         eI78b2osTPN8gzzBi04Wcp623bkt197RBwoJBlJDlXkxXAyeL8NiUd2cZ0TggxFzyChS
         8BTd0nTnSPZ1mYbUYytezg0DYFZvlBq/ifDxld9peVFrpN2Rz6BlQeaFW4Fu3m2UA65w
         Xm5A==
X-Gm-Message-State: AOJu0YyxHfMDpSdLHYtW9Z3qIwZPvEDrSX0iDeUJbRJiUBZcGn1JBwO4
	F+sGNsu/GFGr39ZLqllvSSYMOFofW8O0YaKa782OGab7eML8wTylFKlccWYEWlabsCwnfjRxZLl
	oT56Qgg==
X-Google-Smtp-Source: AGHT+IGucGSs7bfP2V596x2M7USPRmF7++14y+E7a4rtdHLmoJCMMnhT2hu0U6b6dEkiwoF5E5kwGA==
X-Received: by 2002:a05:6830:390b:b0:709:49fe:5a31 with SMTP id 46e09a7af769-709b3214010mr15262701a34.13.1722791383209;
        Sun, 04 Aug 2024 10:09:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/18] pseudo: Fix to work with glibc 2.40
Date: Sun,  4 Aug 2024 10:09:15 -0700
Message-Id: <1d5903bf749436d9b26df858041337b723614963.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202971

From: Richard Purdie <richard.purdie@linuxfoundation.org>

glibc 2.40 renames some internal header variables. Update our hack to
work with the new version. These kinds of problems illustrate we need to
address the issue properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35021d650de3eecc3f42000181b39a5db5a8eaa0)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/files/glibc238.patch | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
index da4b8caee3..dfb5c283f6 100644
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
-- 
2.34.1


