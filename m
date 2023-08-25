Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A32C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 08:02:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.8836.1692950538661543386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 01:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LVpQboN+;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68a520dba33so577429b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 01:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1692950538; x=1693555338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MB6NefpGD5ZdQd52geLrWwZ9W04aiGDdJk1hEef2sIg=;
        b=LVpQboN+xlRyO35GNLOhIeI+gpBDMQDMTB27d1DPjad8bTs90lcazJHQVbcjil6oW7
         hyLQ2rnuTQa0k0tn3mdC8rWkmHjz1/i+bubw5qh3M9urg+3U3x/W0WURIuFrXQzaTrQZ
         do3nV/nZF31Xy6CY574R0ezhcAdKMzqES6GXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692950538; x=1693555338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MB6NefpGD5ZdQd52geLrWwZ9W04aiGDdJk1hEef2sIg=;
        b=RuqaHZSuDVGoeQHnjMDzxa8dMswpza0ceRmz2xWH5DlReytMYtl1ulxpZKtpgCPjvy
         PhTRIwt6ds2edJFIffugoBaK2m34OaGm/GldPLZ/Of+DvZ2tINmKk3vN2ydd6MSvdZFs
         +9/UWQAPnEDwieEUSLlgCNIMS8YAXbIM2BH9Xx9LAXpfM09+ZdAUEzxzKFLblmTLY0Bc
         QnCcK9Lv0qss+EozqtZ5be2devSpf7MEAt2YekOm0mGcLPmF/8AcFYV60fuGomX6y8AC
         +6/mskQQ5oajg0B3EvS+UNW8H1PH1Ns0o7mkMbGg5WOIs4QQU746He9V1k6bhSuYwiwc
         4yxg==
X-Gm-Message-State: AOJu0YxtSi77P6/WN6uKKtvY4xaY/Nsp7KYEqrrFCHRiht9eWwoqa58L
	5g1fVnSL/eKa1n1aBi2CRoro1evmJDGkclCDh1g=
X-Google-Smtp-Source: AGHT+IGexfu6HXpj7DqCzT8oD8DCyLab8TPa/Ef1CO+SEcVKNBg4j5ba2io+sIgWkUIYHik1b1UJTQ==
X-Received: by 2002:a05:6a20:dd97:b0:134:dc23:2994 with SMTP id kw23-20020a056a20dd9700b00134dc232994mr15788093pzb.31.1692950533341;
        Fri, 25 Aug 2023 01:02:13 -0700 (PDT)
Received: from localhost.localdomain ([49.34.68.246])
        by smtp.gmail.com with ESMTPSA id i9-20020a170902c94900b001aaecc0b6ffsm1004452pla.160.2023.08.25.01.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:02:12 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] Qemu: Resolve undefined reference issue in CVE-2023-2861
Date: Fri, 25 Aug 2023 13:32:05 +0530
Message-Id: <20230825080205.12308-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 08:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186699

The commit [https://github.com/openembedded/openembedded-core/commit/9bd4ddeb4b5efc65b0514d50d6991211271924c1] backports fix for CVE-2023-2861 for version 6.2.0.
The 'qemu_fstat' in `do_create_others' is not defined which leads to the undefined symbol error on certain architectures.

Also, the commit message says "(Mjt: drop adding qemu_fstat wrapper for 7.2 where wrappers aren't used)". So either the wrapper has to be dropped or it has to be defined.

Hence, backported the main patch rather than the cherry picked one.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../qemu/qemu/CVE-2023-2861.patch             | 66 +++++++++++--------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
index 48f51f5d03..a86413fbad 100644
--- a/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
@@ -1,14 +1,16 @@
-From 10fad73a2bf1c76c8aa9d6322755e5f877d83ce5 Mon Sep 17 00:00:00 2001
+From f6b0de53fb87ddefed348a39284c8e2f28dc4eda Mon Sep 17 00:00:00 2001
 From: Christian Schoenebeck <qemu_oss@crudebyte.com>
-Date: Wed Jun 7 18:29:33 2023 +0200
-Subject: [PATCH] 9pfs: prevent opening special files (CVE-2023-2861) The 9p
- protocol does not specifically define how server shall behave when client
- tries to open a special file, however from security POV it does make sense
- for 9p server to prohibit opening any special file on host side in general. A
- sane Linux 9p client for instance would never attempt to open a special file
- on host side, it would always handle those exclusively on its guest side. A
- malicious client however could potentially escape from the exported 9p tree
- by creating and opening a device file on host side.
+Date: Wed, 7 Jun 2023 18:29:33 +0200
+Subject: [PATCH] 9pfs: prevent opening special files (CVE-2023-2861)
+
+The 9p protocol does not specifically define how server shall behave when
+client tries to open a special file, however from security POV it does
+make sense for 9p server to prohibit opening any special file on host side
+in general. A sane Linux 9p client for instance would never attempt to
+open a special file on host side, it would always handle those exclusively
+on its guest side. A malicious client however could potentially escape
+from the exported 9p tree by creating and opening a device file on host
+side.
 
 With QEMU this could only be exploited in the following unsafe setups:
 
@@ -32,19 +34,16 @@ Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
 Reviewed-by: Greg Kurz <groug@kaod.org>
 Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
 Message-Id: <E1q6w7r-0000Q0-NM@lizzy.crudebyte.com>
-(cherry picked from commit f6b0de5)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-(Mjt: drop adding qemu_fstat wrapper for 7.2 where wrappers aren't used)
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/10fad73a2bf1c76c8aa9d6322755e5f877d83ce5]
 
+Upstream-Status: Backport from [https://github.com/qemu/qemu/commit/10fad73a2bf1c76c8aa9d6322755e5f877d83ce5]
 CVE: CVE-2023-2861
 
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
 ---
- fsdev/virtfs-proxy-helper.c | 27 ++++++++++++++++++++++++--
- hw/9pfs/9p-util.h           | 38 +++++++++++++++++++++++++++++++++++++
- 2 files changed, 63 insertions(+), 2 deletions(-)
+ fsdev/virtfs-proxy-helper.c | 27 +++++++++++++++++++++++--
+ hw/9pfs/9p-util.h           | 40 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 65 insertions(+), 2 deletions(-)
 
 diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
 index 15c0e79b0..f9e4669a5 100644
@@ -56,12 +55,12 @@ index 15c0e79b0..f9e4669a5 100644
  #include "hw/9pfs/9p-proxy.h"
 +#include "hw/9pfs/9p-util.h"
  #include "fsdev/9p-iov-marshal.h"
-
+ 
  #define PROGNAME "virtfs-proxy-helper"
 @@ -338,6 +339,28 @@ static void resetugid(int suid, int sgid)
      }
  }
-
+ 
 +/*
 + * Open regular file or directory. Attempts to open any special file are
 + * rejected.
@@ -106,22 +105,30 @@ index 15c0e79b0..f9e4669a5 100644
          ret = -errno;
      }
 diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
-index 546f46dc7..54e270ac6 100644
+index 546f46dc7..23000e917 100644
 --- a/hw/9pfs/9p-util.h
 +++ b/hw/9pfs/9p-util.h
-@@ -13,6 +13,8 @@
+@@ -13,12 +13,16 @@
  #ifndef QEMU_9P_UTIL_H
  #define QEMU_9P_UTIL_H
-
+ 
 +#include "qemu/error-report.h"
 +
  #ifdef O_PATH
  #define O_PATH_9P_UTIL O_PATH
  #else
-@@ -26,6 +28,38 @@ static inline void close_preserve_errno(int fd)
+ #define O_PATH_9P_UTIL 0
+ #endif
+ 
++#define qemu_fstat      fstat
++
+ static inline void close_preserve_errno(int fd)
+ {
+     int serrno = errno;
+@@ -26,6 +30,38 @@ static inline void close_preserve_errno(int fd)
      errno = serrno;
  }
-
+ 
 +/**
 + * close_if_special_file() - Close @fd if neither regular file nor directory.
 + *
@@ -157,10 +164,10 @@ index 546f46dc7..54e270ac6 100644
  static inline int openat_dir(int dirfd, const char *name)
  {
      return openat(dirfd, name,
-@@ -56,6 +90,10 @@ again:
+@@ -56,6 +92,10 @@ again:
          return -1;
      }
-
+ 
 +    if (close_if_special_file(fd) < 0) {
 +        return -1;
 +    }
@@ -168,5 +175,6 @@ index 546f46dc7..54e270ac6 100644
      serrno = errno;
      /* O_NONBLOCK was only needed to open the file. Let's drop it. We don't
       * do that with O_PATH since fcntl(F_SETFL) isn't supported, and openat()
---
-2.40.0
+-- 
+2.35.7
+
-- 
2.34.1


