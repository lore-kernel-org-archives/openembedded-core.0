Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5067FEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 04:20:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5650.1690863619907010443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 21:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oUFxU/sV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=757755136f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3713xahJ002855
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Aug 2023 04:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Xk2J4
	E6JBTPn3KM0zx6d9tzfYBhYNr6iXTl9IaFWrXQ=; b=oUFxU/sVkPyu25vwKpEBv
	3TiRwFQ158PxedTBVzdLkOYZzcCAx2F+IvH9360B796HSgSHayf+IsPxT5i8AhTr
	bQdUz6H0MMMA4v7rOxnZbeK3x7x3bL12zjGO8kq8goW19FFaNlfNFc+Y72v74YJv
	qRgJ1hx5K3P9Hjk2MT9zz/LrGVAFaU4Cod8aLYmssgox2G/DLJVy77fsvR8pdPus
	ntGUhlWzx/O1eJm6CupQF3NSrY7ijeGwOVdSsA/tzE2U1YDRsgQru07sOywrPgFF
	v12Lzv1GKCke3lnCVEmq4MKoPdAxMJpNWiMl913qejTr6KBczbPxIHdIOCKDG+Mp
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx2cqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 04:20:18 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 21:20:16 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] qemu: fix CVE-2023-2861
Date: Tue, 1 Aug 2023 04:20:03 +0000
Message-ID: <20230801042003.1487222-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: z_ju191jPlx-uusiCn0fnqX0PE3enCpY
X-Proofpoint-ORIG-GUID: z_ju191jPlx-uusiCn0fnqX0PE3enCpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_01,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308010038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 04:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185190

9pfs: prevent opening special files

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-2861

Upstream patches:
https://github.com/qemu/qemu/commit/10fad73a2bf1c76c8aa9d6322755e5f877d83ce5

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
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
2.40.0


