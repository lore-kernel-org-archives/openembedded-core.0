Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B570C46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 23:18:34 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.61172.1674170304728064966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 15:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QTTuZs13;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so3328394pjl.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sSQ+oYssLJXad7WC3RqovIP+xhWp0G67pBK2C4qwnC4=;
        b=QTTuZs13Uvhc0QwkBTrILWDmm0lIT7iLJn6Fq/4ybAQbpTn6SGMqUaLBYdxtl1LyGW
         SepaAXzOOYGXxrMTJfqqiZN1Spbjp9RLtQJHXLjzHq/Z3SFuGZ6TEU2n7K24lFp35lWj
         tkmGcJ4/xO1dBCzEBJ3bey+ypVwgZTT/IiKHYmHoceOksNir3yAL3lmh2A+sKuEa5w9F
         JGnmFUXikbiErYLmpvzaLQ+zLPd1IRKdlQzWa07CEG44B4HjvP2YZk49htl7Bmb6AezV
         Xo2ekl1Hrg7GK8zQSVrYX/MOwxmcNTD5KjYnyJYE+qXBPUEej/UAAawO553ajWxk8FgM
         k8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSQ+oYssLJXad7WC3RqovIP+xhWp0G67pBK2C4qwnC4=;
        b=VUqIFRG467wqCtPmlWprHc6YCJXGPfmbvGDlVX3uYnpYcGYWPel+DlS4nLjN+rS+Ie
         zkXQ4X9ZHo21M7lfWz4SR71CyVFNIVuNqwxWveXlv3N2eRUmD2hrCUjjM3eEPdewQXd0
         wF61jleqnZJYTria4nlnD3xKFrX0XTn+959r2ACg4aynxS8oOcYmIZAPePUy61Dj/In/
         U7XaYDUlOKl7n07PUXeVh7xhWsBIp1tk6CtLVPEVPQDVlaTqgyJrv21VJcs5isEPbLsO
         xu8ZrLMiBBKBZEjE3D4qyh7D8BajUcQt+yzUGeCRxVqMlW/s1dvI+SGHUylEfchrnGXo
         kI+Q==
X-Gm-Message-State: AFqh2kpI9nSb133kNMwVmvi+4R/i0ybUecDvTb0id7rJ9ndqDsb/0qZk
	OaPfcxvYa86ekyLzxJkiNY6w40sm0sbyUg==
X-Google-Smtp-Source: AMrXdXt7RIP4yAuvFe+AVudFRB8TUxyUb2YXoLkYuD3J5fF8XGcH2DJBqQVbOwcHRb6ycOevmluuuw==
X-Received: by 2002:a05:6a20:d80e:b0:b8:71b7:b903 with SMTP id iv14-20020a056a20d80e00b000b871b7b903mr11984874pzb.31.1674170303573;
        Thu, 19 Jan 2023 15:18:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id 8-20020a621608000000b0058a3d8eab6asm18382507pfw.134.2023.01.19.15.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 15:18:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] lttng-tools: Switch to alternative upstream submitted patch
Date: Thu, 19 Jan 2023 15:18:15 -0800
Message-Id: <20230119231817.1187300-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 23:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176169

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...pat-Define-off64_t-as-off_t-on-linux.patch | 75 ++++++++++++++-----
 1 file changed, 56 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
index e3d421f730..ef81703bc3 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
@@ -1,35 +1,72 @@
-From cc3e1abaa1e7ad85c6a299fe30a36e0cb732e1c8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 14:51:20 -0800
-Subject: [PATCH] compat: Define off64_t as off_t on linux
+From 74b3844737b03492756b4f896c938b504b069f14 Mon Sep 17 00:00:00 2001
+From: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+Date: Tue, 17 Jan 2023 16:57:35 -0500
+Subject: [PATCH] compat: off64_t is not defined by musl
 
-This helps compile with latest musl, where off64_t is not defined
-unless _LARGEFILE64_SOURCE is defined, on glibc _LARGEFILE64_SOURCE is
-defined if _GNU_SOURCE is defined, so the problem is only seen with musl
+This helps compile with latest musl, where off64_t is not defined unless
+_LARGEFILE64_SOURCE is defined. On glibc, _LARGEFILE64_SOURCE is defined
+if _GNU_SOURCE is defined, so the problem is only seen with musl.
 
-Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/164]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Since the project uses AC_SYS_LARGEFILE, which from the autoconf doc:
+"arrange for 64-bit file offsets, known as large-file support."
+
+As such, it is safe to assume off_t is 64-bit wide. This is checked by a
+static_assert to catch any platform where autoconf would let a 32-bit
+off_t slip.
+
+Upstream-Status: Submitted [https://review.lttng.org/c/lttng-tools/+/9268]
+Reported-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+Change-Id: If2c6007a8c85bc3f3065002af8a7538b882fb4a8
 ---
- src/common/compat/fcntl.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/common/compat/fcntl.h b/src/common/compat/fcntl.h
-index 5e566e50..d19a6ece 100644
+--- a/src/common/compat/compat-fcntl.c
++++ b/src/common/compat/compat-fcntl.c
+@@ -13,7 +13,7 @@
+ #ifdef __linux__
+ 
+ LTTNG_HIDDEN
+-int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
++int compat_sync_file_range(int fd, off_t offset, off_t nbytes,
+ 		unsigned int flags)
+ {
+ #ifdef HAVE_SYNC_FILE_RANGE
 --- a/src/common/compat/fcntl.h
 +++ b/src/common/compat/fcntl.h
-@@ -7,7 +7,6 @@
- 
+@@ -8,21 +8,21 @@
  #ifndef _COMPAT_FCNTL_H
  #define _COMPAT_FCNTL_H
--
+ 
++#include <assert.h>
  #include <fcntl.h>
  #include <sys/types.h>
  
-@@ -22,6 +21,7 @@ typedef off64_t loff_t;
+ #include <common/compat/errno.h>
+ 
+-#if (defined(__CYGWIN__))
+-typedef long long off64_t;
+-#endif
++static_assert(sizeof(off_t) == sizeof(int64_t),
++	      "Build system is misconfigured, off_t must be 64-bit wide");
+ 
+ #if (defined(__FreeBSD__) || defined(__sun__))
+ typedef off64_t loff_t;
  #endif
  
  #ifdef __linux__
-+typedef off_t off64_t;
- extern int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
+-extern int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
++extern int compat_sync_file_range(int fd, off_t offset, off_t nbytes,
  		unsigned int flags);
  #define lttng_sync_file_range(fd, offset, nbytes, flags) \
+ 	compat_sync_file_range(fd, offset, nbytes, flags)
+@@ -37,8 +37,8 @@ extern int compat_sync_file_range(int fd
+ #define SYNC_FILE_RANGE_WAIT_BEFORE   0
+ #define SYNC_FILE_RANGE_WRITE         0
+ 
+-static inline int lttng_sync_file_range(int fd, off64_t offset,
+-		off64_t nbytes, unsigned int flags)
++static inline int lttng_sync_file_range(int fd, off_t offset,
++		off_t nbytes, unsigned int flags)
+ {
+ 	return -ENOSYS;
+ }
-- 
2.39.1


