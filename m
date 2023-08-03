Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFE8C04E69
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 14:04:38 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.15490.1691071471752143375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 07:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=J5xD9OGI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-686fc0d3c92so683570b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691071471; x=1691676271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orPYditGPciJweCGmUryhRip7kxdPAEDc2yTi2g4Ygc=;
        b=J5xD9OGIksJiIj4wWG3Jqy/a+leicFHlDrmXQUG+FhY8dcvn/nn/EPxnEy0XsI+elm
         dkYrd4LpJA4JJbWVmsaMSCgFn5ubTNmgEAy67tsQwTDyJUun4wqlyXRSoZbTPX22JNGY
         NusZ6kEzuCYKhcazf+Xqgcfg7yTZ+v9miEer3cP5HugBQXKX8xqFl8RTdJQv8H8RF2Zl
         cdn2LbW7wRO2YwuLdf8fauaEpx5HMSME14b8n7o+e30mgEf3tceMakshmWYsql/oOxy/
         aOPnhtCMuY3Q9nA4T3eZZz2kg09Nbt+wnp/tq0RAnew4t0LXlyoOqAjlVI8EOhvdaCz+
         pxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071471; x=1691676271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orPYditGPciJweCGmUryhRip7kxdPAEDc2yTi2g4Ygc=;
        b=UlMJtr20grbsM7cKLDyEJwlj4X1SVcT/Zi52aGTuXP5avEAM79atZfu+4V0dXIoiq4
         +azQqYxoDgVYdi5Jtkn7ZDoxVYekg8TbsqN6N/7IidIOK6ACHfDGVrcdht0jVse2uWrn
         0mvA+UNDofkb/FEkCmC2f1T6Htb8MmS/ncmxUZMMtWtolOhsFWfgrLwKZgpVoNPLAknI
         LdEO4GsEhi04bozBqrpUY+0DG1pRDL65kbGIjvOe786Y3IVRlQzktzo69XbYFwSfYk3G
         y7WUgT3gpRWVORMF1GIdqI//cilk3LnbuDjsMJoK5p6NsNBfqRJlVyFGyrmBJ5AuPt52
         Hf9w==
X-Gm-Message-State: ABy/qLb1V/UrtaMoR1rS/PmtFwTHo7T6qcTR5kOwbDZsa0GsCUBfUsfJ
	AWjtc1qL4S9Fs3GrTp+imTR2vqs7vcwfYdghU6s=
X-Google-Smtp-Source: APBJJlEWbm2HffnSoRRFtOyZfa37LSZtAhdCckR3JvXoe2KiyFshyWxBAdZfvOJnAvu/IQLtMDvfKQ==
X-Received: by 2002:a05:6a21:9996:b0:11f:2714:f6f3 with SMTP id ve22-20020a056a21999600b0011f2714f6f3mr19240401pzb.11.1691071470625;
        Thu, 03 Aug 2023 07:04:30 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm12866242pfe.75.2023.08.03.07.04.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:04:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/10] qemu: fix CVE-2023-2861
Date: Thu,  3 Aug 2023 04:04:09 -1000
Message-Id: <9bd4ddeb4b5efc65b0514d50d6991211271924c1.1691071255.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691071255.git.steve@sakoman.com>
References: <cover.1691071255.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185484

From: Archana Polampalli <archana.polampalli@windriver.com>

9pfs: prevent opening special files

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-2861

Upstream patches:
https://github.com/qemu/qemu/commit/10fad73a2bf1c76c8aa9d6322755e5f877d83ce5

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-2861.patch             | 172 ++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 83959f3c68..96a1cc93a5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -96,6 +96,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2023-0330.patch \
            file://CVE-2023-3301.patch \
            file://CVE-2023-3255.patch \
+           file://CVE-2023-2861.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
new file mode 100644
index 0000000000..48f51f5d03
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
@@ -0,0 +1,172 @@
+From 10fad73a2bf1c76c8aa9d6322755e5f877d83ce5 Mon Sep 17 00:00:00 2001
+From: Christian Schoenebeck <qemu_oss@crudebyte.com>
+Date: Wed Jun 7 18:29:33 2023 +0200
+Subject: [PATCH] 9pfs: prevent opening special files (CVE-2023-2861) The 9p
+ protocol does not specifically define how server shall behave when client
+ tries to open a special file, however from security POV it does make sense
+ for 9p server to prohibit opening any special file on host side in general. A
+ sane Linux 9p client for instance would never attempt to open a special file
+ on host side, it would always handle those exclusively on its guest side. A
+ malicious client however could potentially escape from the exported 9p tree
+ by creating and opening a device file on host side.
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
+(cherry picked from commit f6b0de5)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+(Mjt: drop adding qemu_fstat wrapper for 7.2 where wrappers aren't used)
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/10fad73a2bf1c76c8aa9d6322755e5f877d83ce5]
+
+CVE: CVE-2023-2861
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ fsdev/virtfs-proxy-helper.c | 27 ++++++++++++++++++++++++--
+ hw/9pfs/9p-util.h           | 38 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 63 insertions(+), 2 deletions(-)
+
+diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
+index 15c0e79b0..f9e4669a5 100644
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
+index 546f46dc7..54e270ac6 100644
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
+@@ -26,6 +28,38 @@ static inline void close_preserve_errno(int fd)
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
+@@ -56,6 +90,10 @@ again:
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


