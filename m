Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B6CC47258
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 02:52:02 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.2807.1705546313687061830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 18:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N+eUEGkw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5cf87cdc4c5so2174517a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 18:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705546312; x=1706151112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8G7k3fUX3AaP8UOxinah3/B00sxkB6oBf8EyPGDaHgw=;
        b=N+eUEGkwrwMTYq3aawHPUDcxqlnKQv1iqc7Ryph9yGOAYJHBm4rWeKn5kwN6xHrhim
         MWQPaReHLsn8JyHL+l4YC7GKZU5c1mayaqFIVT8Bd/Y0Hd+rYJgsU0oL4oGdeuJ4JtbD
         Uh/qLnjVA/AKaDDvlNLj1q9E0ov4H99Izg2bGUtv1hFfJOz7JckrGUXeLe/0KazbkuZu
         iXzRty8HYmwT1RgtgcOwdGiGOpmMnlrERWEEmn/AUxcqVQsCogjPC9kxuvgiC1Q3xLmU
         uO7cKOxv6pl5LcdVTWPKy4NIwh9jaGSKV7Z83bVYA6VgU2QhIt9gjDNTgm5qOzsCOO42
         F2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705546312; x=1706151112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8G7k3fUX3AaP8UOxinah3/B00sxkB6oBf8EyPGDaHgw=;
        b=ITZ1oFXVcKq/IW/kO8Owi968ulPDv9aWbVSBJGdriSRA/dSCUntlBhBsXCaQHPRmeo
         CH5bYuTHRoW4aQAtXfNzRs7hsawX9zGuTG8OWT6nlYSag+3KjYyqJnhAi+1e2ERXejIc
         zGAyLQ31FXCg1df6tVs4UlnjTERIswlNUuRpwKqtihOJaRifWvaN0RaZQ1dFSveYVoQu
         KGxxHQkZmiUunDQP6JeZnAgZMvtAb59j2JNNt3QGxSiYyWL17koEF3uapwe8rwoOvXtU
         1zE7lyPw73QLznTDqS8dLe8/FgQ3WG59VasOKY1EuKEnqq7a7LNJ4pF3j/eQZIvc5Ra/
         Song==
X-Gm-Message-State: AOJu0Yxg2gzMqz3CsUMNKaHQW2DgZ1ONjRERYkSVmxAqYeCgXZLCrIwc
	OEFO1fsTvIvtNjFfQvvgobEel+wh8BZP7KDUGHWO9jN3iLTG4kBpewyxfvPyGoyKSUwTitsfko/
	j2Is=
X-Google-Smtp-Source: AGHT+IGZ34zeMdLWZisphVbIpZTN27MMseGe9oECjvDPx56Oso+aizK3xPd/rRXEYZqYJBI2MTa3bw==
X-Received: by 2002:a05:6a20:9148:b0:19a:2d38:9572 with SMTP id x8-20020a056a20914800b0019a2d389572mr288360pzc.14.1705546312168;
        Wed, 17 Jan 2024 18:51:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb2-20020a17090b280200b0028dd956835bsm441844pjb.2.2024.01.17.18.51.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 18:51:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/6] qemu: Backport fix for CVE-2023-2861
Date: Wed, 17 Jan 2024 16:51:37 -1000
Message-Id: <cede843cdd1d1a83b2d616086aa69a2b584f9442.1705546122.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705546122.git.steve@sakoman.com>
References: <cover.1705546122.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193960

From: Vijay Anusuri <vanusuri@mvista.com>

Updated 0012-fix-libcap-header-issue-on-some-distro.patch to resolve
patch fuzz caused by the CVE-2023-2861 patch

Upstream-Status: Backport
[https://gitlab.com/qemu-project/qemu/-/commit/a5804fcf7b22fc7d1f9ec794dd284c7d504bd16b
&
https://gitlab.com/qemu-project/qemu/-/commit/f6b0de53fb87ddefed348a39284c8e2f28dc4eda]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 ...x-libcap-header-issue-on-some-distro.patch |   9 +-
 ...e-O_NOATIME-if-we-don-t-have-permiss.patch |  63 +++++++
 .../qemu/qemu/CVE-2023-2861.patch             | 178 ++++++++++++++++++
 4 files changed, 249 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/9pfs-local-ignore-O_NOATIME-if-we-don-t-have-permiss.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4f856c749e..59ff69d51d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -142,6 +142,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-3180.patch \
            file://CVE-2020-24165.patch \
            file://CVE-2023-5088.patch \
+           file://9pfs-local-ignore-O_NOATIME-if-we-don-t-have-permiss.patch \
+           file://CVE-2023-2861.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch b/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
index 3a7d7bbd33..3789f1edea 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-some-distro.patch
@@ -60,7 +60,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
-index 6f132c5f..8329950c 100644
+index 300c9765..2823db7d 100644
 --- a/fsdev/virtfs-proxy-helper.c
 +++ b/fsdev/virtfs-proxy-helper.c
 @@ -13,7 +13,6 @@
@@ -71,9 +71,9 @@ index 6f132c5f..8329950c 100644
  #include <sys/fsuid.h>
  #include <sys/vfs.h>
  #include <sys/ioctl.h>
-@@ -27,7 +26,11 @@
- #include "9p-iov-marshal.h"
+@@ -28,7 +27,11 @@
  #include "hw/9pfs/9p-proxy.h"
+ #include "hw/9pfs/9p-util.h"
  #include "fsdev/9p-iov-marshal.h"
 -
 +/*
@@ -84,3 +84,6 @@ index 6f132c5f..8329950c 100644
  #define PROGNAME "virtfs-proxy-helper"
  
  #ifndef XFS_SUPER_MAGIC
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/9pfs-local-ignore-O_NOATIME-if-we-don-t-have-permiss.patch b/meta/recipes-devtools/qemu/qemu/9pfs-local-ignore-O_NOATIME-if-we-don-t-have-permiss.patch
new file mode 100644
index 0000000000..72d9c47bde
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/9pfs-local-ignore-O_NOATIME-if-we-don-t-have-permiss.patch
@@ -0,0 +1,63 @@
+From a5804fcf7b22fc7d1f9ec794dd284c7d504bd16b Mon Sep 17 00:00:00 2001
+From: Omar Sandoval <osandov@fb.com>
+Date: Thu, 14 May 2020 08:06:43 +0200
+Subject: [PATCH] 9pfs: local: ignore O_NOATIME if we don't have permissions
+
+QEMU's local 9pfs server passes through O_NOATIME from the client. If
+the QEMU process doesn't have permissions to use O_NOATIME (namely, it
+does not own the file nor have the CAP_FOWNER capability), the open will
+fail. This causes issues when from the client's point of view, it
+believes it has permissions to use O_NOATIME (e.g., a process running as
+root in the virtual machine). Additionally, overlayfs on Linux opens
+files on the lower layer using O_NOATIME, so in this case a 9pfs mount
+can't be used as a lower layer for overlayfs (cf.
+https://github.com/osandov/drgn/blob/dabfe1971951701da13863dbe6d8a1d172ad9650/vmtest/onoatimehack.c
+and https://github.com/NixOS/nixpkgs/issues/54509).
+
+Luckily, O_NOATIME is effectively a hint, and is often ignored by, e.g.,
+network filesystems. open(2) notes that O_NOATIME "may not be effective
+on all filesystems. One example is NFS, where the server maintains the
+access time." This means that we can honor it when possible but fall
+back to ignoring it.
+
+Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
+Signed-off-by: Omar Sandoval <osandov@fb.com>
+Message-Id: <e9bee604e8df528584693a4ec474ded6295ce8ad.1587149256.git.osandov@fb.com>
+Signed-off-by: Greg Kurz <groug@kaod.org>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/a5804fcf7b22fc7d1f9ec794dd284c7d504bd16b]
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ hw/9pfs/9p-util.h | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
+index 79ed6b233e5..546f46dc7dc 100644
+--- a/hw/9pfs/9p-util.h
++++ b/hw/9pfs/9p-util.h
+@@ -37,9 +37,22 @@ static inline int openat_file(int dirfd, const char *name, int flags,
+ {
+     int fd, serrno, ret;
+ 
++again:
+     fd = openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
+                 mode);
+     if (fd == -1) {
++        if (errno == EPERM && (flags & O_NOATIME)) {
++            /*
++             * The client passed O_NOATIME but we lack permissions to honor it.
++             * Rather than failing the open, fall back without O_NOATIME. This
++             * doesn't break the semantics on the client side, as the Linux
++             * open(2) man page notes that O_NOATIME "may not be effective on
++             * all filesystems". In particular, NFS and other network
++             * filesystems ignore it entirely.
++             */
++            flags &= ~O_NOATIME;
++            goto again;
++        }
+         return -1;
+     }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
new file mode 100644
index 0000000000..70b7d6c562
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
@@ -0,0 +1,178 @@
+From f6b0de53fb87ddefed348a39284c8e2f28dc4eda Mon Sep 17 00:00:00 2001
+From: Christian Schoenebeck <qemu_oss@crudebyte.com>
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
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/f6b0de53fb87ddefed348a39284c8e2f28dc4eda]
+CVE: CVE-2023-2861
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ fsdev/virtfs-proxy-helper.c | 27 +++++++++++++++++++++++--
+ hw/9pfs/9p-util.h           | 40 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 65 insertions(+), 2 deletions(-)
+
+diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
+index 6f132c5f..300c9765 100644
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
+@@ -350,6 +351,28 @@ static void resetugid(int suid, int sgid)
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
++	return fd;
++    }
++
++    if (close_if_special_file(fd) < 0) {
++	return -1;
++    }
++
++    return fd;
++}
++
+ /*
+  * send response in two parts
+  * 1) ProxyHeader
+@@ -694,7 +717,7 @@ static int do_create(struct iovec *iovec)
+     if (ret < 0) {
+         goto unmarshal_err_out;
+     }
+-    ret = open(path.data, flags, mode);
++    ret = open_regular(path.data, flags, mode);
+     if (ret < 0) {
+         ret = -errno;
+     }
+@@ -719,7 +742,7 @@ static int do_open(struct iovec *iovec)
+     if (ret < 0) {
+         goto err_out;
+     }
+-    ret = open(path.data, flags);
++    ret = open_regular(path.data, flags, 0);
+     if (ret < 0) {
+         ret = -errno;
+     }
+diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
+index 546f46dc..79fdd2a3 100644
+--- a/hw/9pfs/9p-util.h
++++ b/hw/9pfs/9p-util.h
+@@ -13,12 +13,16 @@
+ #ifndef QEMU_9P_UTIL_H
+ #define QEMU_9P_UTIL_H
+ 
++#include "qemu/error-report.h"
++
+ #ifdef O_PATH
+ #define O_PATH_9P_UTIL O_PATH
+ #else
+ #define O_PATH_9P_UTIL 0
+ #endif
+ 
++#define qemu_fstat      fstat
++
+ static inline void close_preserve_errno(int fd)
+ {
+     int serrno = errno;
+@@ -26,6 +30,38 @@ static inline void close_preserve_errno(int fd)
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
++    if (qemu_fstat(fd, &stbuf) < 0) {
++	close_preserve_errno(fd);
++	return -1;
++    }
++    if (!S_ISREG(stbuf.st_mode) && !S_ISDIR(stbuf.st_mode)) {
++	error_report_once(
++	    "9p: broken or compromised client detected; attempt to open "
++	    "special file (i.e. neither regular file, nor directory)"
++	);
++	close(fd);
++	errno = ENXIO;
++	return -1;
++    }
++
++    return 0;
++}
++
+ static inline int openat_dir(int dirfd, const char *name)
+ {
+     return openat(dirfd, name,
+@@ -56,6 +92,10 @@ again:
+         return -1;
+     }
+ 
++    if (close_if_special_file(fd) < 0) {
++	return -1;
++    }
++
+     serrno = errno;
+     /* O_NONBLOCK was only needed to open the file. Let's drop it. We don't
+      * do that with O_PATH since fcntl(F_SETFL) isn't supported, and openat()
+-- 
+2.25.1
+
-- 
2.34.1


