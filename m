Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56805C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:24:43 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.138749.1692116680352810812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Nt4bTCfW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bcad794ad4so35890925ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116679; x=1692721479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvMYiMC9tVU1N6aoujJbqfRKuiENxVyD6f0Uk0cY2Rk=;
        b=Nt4bTCfWXYgRbY6ei9l/hSVQSb7+h7GUayirXV+6ilFm2DYmtg+jY+e+3o0ZGNsK7d
         sj/qBYuxwVjruZ2m9pl3YRB9ORY225Sow98mPOeCyFF7SJWPyO5jD/rFRR1tLwn/dj1R
         XC3lh4TwdrheMM3BOSMWnkYahwKTLTxZ/XSGpeTrTYM/fiOxOgVssJ2BnvnWz+XaliLI
         s/wqcvhcl02yUXQRPMFuSP3UPkGHqN6CE/C8iSZ4X4ouXC83USrKL4wTxWUwAs0DbU5M
         hoLFm/txB2v2yF635979WCcrC5gKOX5ozauwGoQeAb4Ni8n/ZHY5WS/22oDIh9Zdgj6q
         8HYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116679; x=1692721479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvMYiMC9tVU1N6aoujJbqfRKuiENxVyD6f0Uk0cY2Rk=;
        b=LD4kHMwQbCE0haEwGfZAO5mTT6AUOrovvAKVglc6TBWJES+HEHS9WiOGjoHsTHz25m
         BxuuUKSi9r7euW8+63HyuiEQ5mHtREoss7LlCbqz9yVtO8S2i5QMEeBTON1gLSRfQPuD
         LY5hNqpW14GyHtrcFPDQUUBzsFYy1kswE6Z8VsIhaCoJpeRo/HjJBXVaXL1mP1lhfpnY
         otLfS3eh7oAqNM+YTKRabY+HEKJgBahYR01S5BkSNo58nw1vd6QkocNZ7/cMLQw3CAzh
         7gCDpO0nW6D2J6nIBnjrTgMppgCGtLPYoJGdPOAdggsgzRFpZE0SA/hIsgkTutedHaOY
         Hrlw==
X-Gm-Message-State: AOJu0YyeMij41Q5TCsHUQghwFIp1UM9OD6FKnJPwEJdGUgPYsp3+dwLf
	LZd337AtXYrF+kv1b5l2KjEjwbWYnthpSokNCEc=
X-Google-Smtp-Source: AGHT+IFs2d2fYLIUCWj7XkWuthIIinRWWS3PmaJapzXWniDhAhScyt4qjHiJyeXMZgg4AI75YEIPbA==
X-Received: by 2002:a17:902:e809:b0:1bb:de7f:a4d4 with SMTP id u9-20020a170902e80900b001bbde7fa4d4mr13132854plg.61.1692116679320;
        Tue, 15 Aug 2023 09:24:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/18] qemu: fix CVE-2023-2861
Date: Tue, 15 Aug 2023 06:24:12 -1000
Message-Id: <4dd99f7f48664dbaef7f3a083a9d362552ba44ac.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186082

From: Yogita Urade <yogita.urade@windriver.com>

qemu: 9pfs: prevent opening special files

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-2861

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-2861.patch             | 171 ++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7dc382ffdb..fbfc9f7499 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-0330.patch \
 	   file://CVE-2023-3301.patch \
 	   file://CVE-2023-3255.patch \
+	   file://CVE-2023-2861.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
new file mode 100644
index 0000000000..34be8afe16
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
@@ -0,0 +1,171 @@
+From f6b0de53fb87ddefed348a39284c8e2f28dc4eda Mon Sep 17 00:00:00 2001
+From: Christian Schoenebeck <qemu_oss@crudebyte.com>
+Date: Wed, 2 Aug 2023 13:02:55 +0000
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
+
+With QEMU this could only be exploited in the following unsafe setups:
+
+  - Running QEMU binary as root AND 9p 'local' fs driver AND 'passthrough'
+    security model.
+
+or
+
+  - Using 9p 'proxy' fs driver (which is running its helper daemon as
+    root).
+
+These setups were already discouraged for safety reasons before,
+however for obvious reasons we are now tightening behaviour on this.
+
+Fixes: CVE-2023-2861
+Reported-by: Yanwu Shen <ywsPlz@gmail.com>
+Reported-by: Jietao Xiao <shawtao1125@gmail.com>
+Reported-by: Jinku Li <jkli@xidian.edu.cn>
+Reported-by: Wenbo Shen <shenwenbo@zju.edu.cn>
+Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
+Reviewed-by: Greg Kurz <groug@kaod.org>
+Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
+Message-Id: <E1q6w7r-0000Q0-NM@lizzy.crudebyte.com>
+
+CVE: CVE-2023-2861
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/10fad73a2bf1c76c8aa9d6322755e5f877d83ce5]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ fsdev/virtfs-proxy-helper.c | 27 ++++++++++++++++++++++++--
+ hw/9pfs/9p-util.h           | 38 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 63 insertions(+), 2 deletions(-)
+
+diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
+index 5cafcd770..d9511f429 100644
+--- a/fsdev/virtfs-proxy-helper.c
++++ b/fsdev/virtfs-proxy-helper.c
+@@ -26,6 +26,7 @@
+ #include "qemu/xattr.h"
+ #include "9p-iov-marshal.h"
+ #include "hw/9pfs/9p-proxy.h"
++#include "hw/9pfs/9p-util.h"
+ #include "fsdev/9p-iov-marshal.h"
+
+ #define PROGNAME "virtfs-proxy-helper"
+@@ -338,6 +339,28 @@ static void resetugid(int suid, int sgid)
+     }
+ }
+
++/*
++ * Open regular file or directory. Attempts to open any special file are
++ * rejected.
++ *
++ * returns file descriptor or -1 on error
++ */
++static int open_regular(const char *pathname, int flags, mode_t mode)
++{
++    int fd;
++
++    fd = open(pathname, flags, mode);
++    if (fd < 0) {
++        return fd;
++    }
++
++    if (close_if_special_file(fd) < 0) {
++        return -1;
++    }
++
++    return fd;
++}
++
+ /*
+  * send response in two parts
+  * 1) ProxyHeader
+@@ -682,7 +705,7 @@ static int do_create(struct iovec *iovec)
+     if (ret < 0) {
+         goto unmarshal_err_out;
+     }
+-    ret = open(path.data, flags, mode);
++    ret = open_regular(path.data, flags, mode);
+     if (ret < 0) {
+         ret = -errno;
+     }
+@@ -707,7 +730,7 @@ static int do_open(struct iovec *iovec)
+     if (ret < 0) {
+         goto err_out;
+     }
+-    ret = open(path.data, flags);
++    ret = open_regular(path.data, flags, 0);
+     if (ret < 0) {
+         ret = -errno;
+     }
+diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
+index c3526144c..6b44e5f7a 100644
+--- a/hw/9pfs/9p-util.h
++++ b/hw/9pfs/9p-util.h
+@@ -13,6 +13,8 @@
+ #ifndef QEMU_9P_UTIL_H
+ #define QEMU_9P_UTIL_H
+
++#include "qemu/error-report.h"
++
+ #ifdef O_PATH
+ #define O_PATH_9P_UTIL O_PATH
+ #else
+@@ -112,6 +114,38 @@ static inline void close_preserve_errno(int fd)
+     errno = serrno;
+ }
+
++/**
++ * close_if_special_file() - Close @fd if neither regular file nor directory.
++ *
++ * @fd: file descriptor of open file
++ * Return: 0 on regular file or directory, -1 otherwise
++ *
++ * CVE-2023-2861: Prohibit opening any special file directly on host
++ * (especially device files), as a compromised client could potentially gain
++ * access outside exported tree under certain, unsafe setups. We expect
++ * client to handle I/O on special files exclusively on guest side.
++ */
++static inline int close_if_special_file(int fd)
++{
++    struct stat stbuf;
++
++    if (fstat(fd, &stbuf) < 0) {
++        close_preserve_errno(fd);
++        return -1;
++    }
++    if (!S_ISREG(stbuf.st_mode) && !S_ISDIR(stbuf.st_mode)) {
++        error_report_once(
++            "9p: broken or compromised client detected; attempt to open "
++            "special file (i.e. neither regular file, nor directory)"
++        );
++        close(fd);
++        errno = ENXIO;
++        return -1;
++    }
++
++    return 0;
++}
++
+ static inline int openat_dir(int dirfd, const char *name)
+ {
+     return openat(dirfd, name,
+@@ -146,6 +180,10 @@ again:
+         return -1;
+     }
+
++    if (close_if_special_file(fd) < 0) {
++        return -1;
++    }
++
+     serrno = errno;
+     /* O_NONBLOCK was only needed to open the file. Let's drop it. We don't
+      * do that with O_PATH since fcntl(F_SETFL) isn't supported, and openat()
+--
+2.40.0
-- 
2.34.1


