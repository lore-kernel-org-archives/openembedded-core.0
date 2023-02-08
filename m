Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C5CC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 16:47:15 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.3072.1675874832649480881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 08:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jmBAMOWm;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id k13so19992491plg.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 08:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OX5SsI+RigO8g4XPVm3/5f+Ysm+HCoo1NY6d/UKqHg=;
        b=jmBAMOWm0A+vWdKAnJiO6hRvnl+/Ph5Z50R3xzcmGZot2kyu5UzsLJUqCSknf/71bE
         C/TQ3xiXPGq3xgvd5F4VKWB7km6t+1hRyU0rXsstRQitorDuaVN+mBtxCIFgO1c2Hn4J
         Flb3uMTVZgB28/kzf4wWvThN/gIrbFmHnJvpdYYu1yWbW4C4gQrvgIlT9gyf58NUWVtS
         KprG4RtyF/QcaK8hoWrOn/ZDEnIRsY1O8ewLsm+DJ0M3L8RrxftEqN5/7IR/Cyc+QsUV
         Zd1L14D5Q9IDBnYkC6M5YVd/r0M0xcpXHDg/mSSlcK7UTI7REQ31m1heZuxQLSpRvvwJ
         ADJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OX5SsI+RigO8g4XPVm3/5f+Ysm+HCoo1NY6d/UKqHg=;
        b=DumEnoeXJ3Ha0rNfGnB88+/tWmHMlt5MgEE/yrB4c6sWOhSHnVqEhY09Eh3K0QOkQl
         TYpmwgnXDhsetj2tyh/DelrYs1EKGGgJSTS6Rw6qhZWhZiFBYplUljHIyJICCYnCCKFN
         OUBFJsb6nc68QA/gK5aUQ/VVNMh+F9lpRix0ewG5wVviLuCHEvrtX4r3aZzv1mIn0hF1
         WmJ63G54LChZLKqjeC+ljGxb/LOcIkJ2QRtgVMBWfKi8ueyy8J/CU4jfJEeiwEc4UsuP
         g5hX/q4Yg+S5p7BBaneXfKLIV2L0rtXgR11VBWSye9db86kAJ1DwFxosu+pTLC3/hntY
         4ynA==
X-Gm-Message-State: AO0yUKVbXU1rriKlakj8u7Z3abVHJ5+RqlYrju3h/FYXN61B9+L7VPGN
	AboB7OD0LyrfR1BuGs2lHJZpY0htmSM=
X-Google-Smtp-Source: AK7set+MuBwUFdbiOyRhXyiUUrZBa2X5XaeCmkGfN9ytik1yrc+AMcFb7oa0kw4ihRkDWZb5afUooA==
X-Received: by 2002:a17:902:ce83:b0:199:2236:ae88 with SMTP id f3-20020a170902ce8300b001992236ae88mr8533155plg.43.1675874831092;
        Wed, 08 Feb 2023 08:47:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id v14-20020a170902e8ce00b001949c680b52sm11224361plg.193.2023.02.08.08.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 08:47:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lttng-tools: Update LFS64 patch with upstream feedback
Date: Wed,  8 Feb 2023 08:47:08 -0800
Message-Id: <20230208164708.3232743-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 16:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176908

See https://review.lttng.org/c/lttng-tools/+/9268

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...pat-Define-off64_t-as-off_t-on-linux.patch | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
index ef81703bc3..4e21d1e9f1 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
@@ -22,7 +22,14 @@ Change-Id: If2c6007a8c85bc3f3065002af8a7538b882fb4a8
 
 --- a/src/common/compat/compat-fcntl.c
 +++ b/src/common/compat/compat-fcntl.c
-@@ -13,7 +13,7 @@
+@@ -8,14 +8,17 @@
+ #define _LGPL_SOURCE
+ #include <common/compat/fcntl.h>
+ #include <common/macros.h>
++#include <common/bug.h>
++#include <stdint.h>
+ #include <unistd.h>
+ 
  #ifdef __linux__
  
  LTTNG_HIDDEN
@@ -30,25 +37,20 @@ Change-Id: If2c6007a8c85bc3f3065002af8a7538b882fb4a8
 +int compat_sync_file_range(int fd, off_t offset, off_t nbytes,
  		unsigned int flags)
  {
++	LTTNG_BUILD_BUG_ON(sizeof(off_t) != sizeof(int64_t));
  #ifdef HAVE_SYNC_FILE_RANGE
+ 	return sync_file_range(fd, offset, nbytes, flags);
+ #else
 --- a/src/common/compat/fcntl.h
 +++ b/src/common/compat/fcntl.h
-@@ -8,21 +8,21 @@
- #ifndef _COMPAT_FCNTL_H
- #define _COMPAT_FCNTL_H
- 
-+#include <assert.h>
- #include <fcntl.h>
- #include <sys/types.h>
+@@ -13,16 +13,12 @@
  
  #include <common/compat/errno.h>
  
 -#if (defined(__CYGWIN__))
 -typedef long long off64_t;
 -#endif
-+static_assert(sizeof(off_t) == sizeof(int64_t),
-+	      "Build system is misconfigured, off_t must be 64-bit wide");
- 
+-
  #if (defined(__FreeBSD__) || defined(__sun__))
  typedef off64_t loff_t;
  #endif
@@ -59,7 +61,7 @@ Change-Id: If2c6007a8c85bc3f3065002af8a7538b882fb4a8
  		unsigned int flags);
  #define lttng_sync_file_range(fd, offset, nbytes, flags) \
  	compat_sync_file_range(fd, offset, nbytes, flags)
-@@ -37,8 +37,8 @@ extern int compat_sync_file_range(int fd
+@@ -37,8 +33,8 @@ extern int compat_sync_file_range(int fd
  #define SYNC_FILE_RANGE_WAIT_BEFORE   0
  #define SYNC_FILE_RANGE_WRITE         0
  
-- 
2.39.1


