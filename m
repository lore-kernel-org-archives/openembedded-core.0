Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BBCC77B7F
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.3962.1682502644722513520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UtTuVm3y;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f086770a50so46091705e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502643; x=1685094643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=avoCL16mdBze8YdZMm3kP56M0k1Y6wXV7K8SqIgx1SA=;
        b=UtTuVm3yJZuMJjG34WhkUg9Ak0XeQOHYCI4WHBzbVw1s9qqJFKZCCfMDN2rvB3Cc96
         lhlt1+So8Otg5lJwESnZ97M2zLy7OkLhBtmoj6++ynKgpTrkEXE0VlEKthn5ifKFgPdp
         HbPjsbA0rzHvC7hfFndNnmoOCAj09kwsgBb6KHyrR7tSsiPoLVUaocM+SOrDIZnA380H
         ZJNmkd4h7R3GsWwWjNwf4cDVS3kXt1rg+WT549t/x5yCwgQeJbL8rHM0Me5a9WvO2L/A
         a2P10bKfWLUdec91vPVddl5aW9yXcGs5EVtIQi1htfJKJt9hWlgbeeocQUh6uKJnMQaJ
         joJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502643; x=1685094643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avoCL16mdBze8YdZMm3kP56M0k1Y6wXV7K8SqIgx1SA=;
        b=KYIuIuk1dAoq5bCS5FMyp8MbvrvNjVTwR71OSQ071M8u7lN4kbVNIUDwRpc7GWNcgR
         HmRhWnrIaVKyjqiKrqquFdOppuR46OeNpOgRf+BlDKr7vso9uEiuGn5gMWAiIdkYVRiG
         NTbElNSkqZOUl2HbBHlmflX5FauWBuc5BNZIhSfmFD9H6tnGxaSm+qdAMq/aP5jdVqfF
         d0h5zk7qPEobRU4EvjUOAPHspr+jyqT0idcQup1vty8CbUV1o7B5rCAR6XmP6qEq5Vbq
         8wu31BrpA2B3/+3l92DvYCvicTiB+b03ShpDeSH2e8uN9SIDvV+4QbWVhb3G3YhNr7im
         qr9Q==
X-Gm-Message-State: AAQBX9cOZWPpCuvl4ZtEcxVywgV9L/m5u6XRvNUmM+xrtm0yzND5IgRd
	3OZUPaAA39xpGWi9tBFQlY9dSTTfp4g=
X-Google-Smtp-Source: AKy350ZOFoxrAbNhx5IalDD+bXBD1fttQWeggZtbmqL5XXwW3I/m82lLZMh+TvwyHubxbXgn/oCZAw==
X-Received: by 2002:a7b:c845:0:b0:3f1:9526:22be with SMTP id c5-20020a7bc845000000b003f1952622bemr11124032wml.23.1682502642983;
        Wed, 26 Apr 2023 02:50:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/11] binutils: backport a patch to address failures when time64.inc is in use
Date: Wed, 26 Apr 2023 11:50:26 +0200
Message-Id: <20230426095036.2632847-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180419

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../binutils/binutils-2.40.inc                |  1 +
 .../binutils/binutils/fix-time64.patch        | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/fix-time64.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index 93631ca3d7f..ad2c9f9da14 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch \
      file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0016-CVE-2023-25586.patch \
+     file://fix-time64.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/fix-time64.patch b/meta/recipes-devtools/binutils/binutils/fix-time64.patch
new file mode 100644
index 00000000000..0bfc977fd4e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/fix-time64.patch
@@ -0,0 +1,94 @@
+From f6f19a39ecfe962cb8a05522c27f513308687a74 Mon Sep 17 00:00:00 2001
+From: Vladimir Mezentsev <vladimir.mezentsev@oracle.com>
+Date: Thu, 16 Feb 2023 19:00:47 -0800
+Subject: [PATCH] gprofng: PR30036 Build failure on aarch64 w/ glibc: symbol
+ `pwrite64' is already defined
+
+gprofng/ChangeLog
+2023-02-16  Vladimir Mezentsev  <vladimir.mezentsev@oracle.com>
+
+	PR gprofng/30036
+	* libcollector/iotrace.c: Define creat64 and pwrite64 only when
+	__USE_LARGEFILE64 and __USE_FILE_OFFSET64 are not defined.
+	* libcollector/mmaptrace.c: Likewise for mmap64.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6f19a39ecfe962cb8a05522c27f513308687a74]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ gprofng/libcollector/iotrace.c   | 15 ++++++++-------
+ gprofng/libcollector/mmaptrace.c |  2 +-
+ 2 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/gprofng/libcollector/iotrace.c b/gprofng/libcollector/iotrace.c
+index af90cc31f1a..d8439b02b3a 100644
+--- a/gprofng/libcollector/iotrace.c
++++ b/gprofng/libcollector/iotrace.c
+@@ -1441,7 +1441,7 @@ creat (const char *path, mode_t mode)
+ }
+ 
+ /*------------------------------------------------------------- creat64 */
+-#if WSIZE(32)
++#if WSIZE(32) && !defined(__USE_LARGEFILE64)
+ int
+ creat64 (const char *path, mode_t mode)
+ {
+@@ -2476,7 +2476,7 @@ __collector_pwrite_2_1 (int fildes, const void *buf, size_t nbyte, off_t offset)
+   return ret;
+ }
+ 
+-#else
++#endif
+ ssize_t
+ pwrite (int fildes, const void *buf, size_t nbyte, off_t offset)
+ {
+@@ -2497,11 +2497,10 @@ pwrite (int fildes, const void *buf, size_t nbyte, off_t offset)
+   POP_REENTRANCE (guard);
+   return ret;
+ }
+-#endif
+ 
+ /*------------------------------------------------------------- pwrite64 */
+-#if WSIZE(32)
+-#if !defined(__MUSL_LIBC) && ARCH(Intel)
++#if WSIZE(32) && ARCH(Intel)
++#if !defined(__MUSL_LIBC)
+ // map interposed symbol versions
+ 
+ SYMVER_ATTRIBUTE (__collector_pwrite64_2_2, pwrite64@GLIBC_2.2)
+@@ -2547,8 +2546,9 @@ __collector_pwrite64_2_1 (int fildes, const void *buf, size_t nbyte, off64_t off
+   POP_REENTRANCE (guard);
+   return ret;
+ }
++#endif
+ 
+-#else
++#if !defined(__USE_FILE_OFFSET64)
+ ssize_t
+ pwrite64 (int fildes, const void *buf, size_t nbyte, off64_t offset)
+ {
+@@ -2570,7 +2570,8 @@ pwrite64 (int fildes, const void *buf, size_t nbyte, off64_t offset)
+   return ret;
+ }
+ #endif
+-#endif /* SIZE(32) */
++
++#endif /* SIZE(32)  && ARCH(Intel) */
+ 
+ /*------------------------------------------------------------- fgets */
+ char*
+diff --git a/gprofng/libcollector/mmaptrace.c b/gprofng/libcollector/mmaptrace.c
+index 61613c21560..221b4e2d176 100644
+--- a/gprofng/libcollector/mmaptrace.c
++++ b/gprofng/libcollector/mmaptrace.c
+@@ -1494,7 +1494,7 @@ mmap (void *start, size_t length, int prot, int flags, int fd, off_t offset)
+ }
+ 
+ /*------------------------------------------------------------- mmap64 */
+-#if WSIZE(32)       /* mmap64 only defined for non-64-bit */
++#if WSIZE(32) && !defined(__USE_FILE_OFFSET64)
+ 
+ void *
+ mmap64 (void *start, size_t length, int prot, int flags, int fd, off64_t offset)
+-- 
+2.31.1
+
-- 
2.30.2


