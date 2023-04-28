Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3453DC77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.14784.1682671709020154549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nP3Q74Cl;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-2f7a7f9667bso5972837f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671707; x=1685263707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=avoCL16mdBze8YdZMm3kP56M0k1Y6wXV7K8SqIgx1SA=;
        b=nP3Q74ClHoPVF2HmmJ4OC/ntnqpEZ6RXufa1EZhT9969BPJ4GMT2PmHlV9LXuqAcLG
         cOjdcjD1oP6TmPnxzYDsSFDShxbxZhVxuGL2d5p9jvVRcCrU789xSeo6GCuiJ3ZLiNJT
         UBymCIA9vBEQ+IcXZmEYeoeBqIMXG5/0igWmRDcFqupQLKjpUPVPd1mmxdlpCfqz6moZ
         eIkj9XCr782QkvizDRZgAQdT/J8aplKp6VRhYMM86zg/GKhya2qZd286GjCjCKQrCbzh
         33yhY7Bs15i7AhUCoOePU43sDgCqXU9UKg8fpUf+E92qB4G3NNgS6rU3PH2vUDbJ5GKO
         Lonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671707; x=1685263707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avoCL16mdBze8YdZMm3kP56M0k1Y6wXV7K8SqIgx1SA=;
        b=Rio2dbMNfOcocrB+Pqj4dPjVJp+dqidzErK+nDjsOI+TLOs8Nxe8tSnGi6EK2EcdV+
         x3FqTH1JVxahmIIMNxnHLs4OdPPHZOkYOBRRBvf+BTWU8ts8bmZE5FpGHhz+z9jaztZs
         +jlFty6qwYMlxw38GjyohMDRS2tqE3ZqV4rXRWP2h3YJISDYS1rt+Dr3JakSqYTxRsBB
         AbqwRcTtNRUnLL6z7viwFfmn8mu3UFCD7kXDTvEfz129jAo6eB076jLQZTH9WgSDPy5U
         CkSxyULabYEbuf9wTjCHW4u4hXmuUw46nJjxhhQsAPD598TlYcIkLCyArANwBGsXK8PY
         16ZQ==
X-Gm-Message-State: AC+VfDxlbvf46wuitoO2IhEomDpS2ZWnzrAvosZZhETnQ0nQbhu6shUo
	ZUR07e8+vN7Lv6OotOMNdoPLwPj7GIQ=
X-Google-Smtp-Source: ACHHUZ5EsRrlHuxd1aEgRNqmamiB4Z4wT2Y+8NaOdiBmwZXNDuLLd5yXR5UnRxUdXOP/BLTAdxRe8Q==
X-Received: by 2002:adf:efca:0:b0:2f5:8116:6453 with SMTP id i10-20020adfefca000000b002f581166453mr3057129wrp.61.1682671707315;
        Fri, 28 Apr 2023 01:48:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 01/11] binutils: backport a patch to address failures when time64.inc is in use
Date: Fri, 28 Apr 2023 10:43:42 +0200
Message-Id: <20230428084352.836515-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180512

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


