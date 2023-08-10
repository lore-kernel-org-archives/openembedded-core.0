Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C83AC001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 07:00:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12058.1691650838563781598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 00:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kd4/p8Mo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=758670bc78=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37A6pGYW011895
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=xuYrYCzrcPg3onnkGYHdfXmC6nAGL2gQZJekDjzTZx8=; b=
	kd4/p8MohAN+jGAGb4ck4jpMo+0AjeHVTxZSmbwx9TOO+LBtebHevgnSGhb+PSD8
	WNNbSTxhJ5sY1JgwvueuEbLtOV6QPApvlT30VokW0VPtyGRmr3O3Bq1wiLx1JsUq
	y6hgTxOa/ODbn38YOEspvQ8a9zyZftUdNp+r47kwCB1ThThfvm2KdyPSZN4akmbR
	qNFBDWgFfrtxg9d+IFJEvT0dGg4LZaK9Tp1mpbhJ4XiHZuy2iyKLhV44pl+m4wUJ
	kTefENILngL62po26TDrL0rGZUXh9SR1rMozHXRRacIs0YKRS1/4m4ypLc3HEK13
	nbzKElZJ7aymQyYceLDR2g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3schfmgdyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:00:37 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 00:00:34 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 3/3] qemu: fix CVE-2023-2861
Date: Thu, 10 Aug 2023 07:00:12 +0000
Message-ID: <20230810070012.3740596-3-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230810070012.3740596-1-yogita.urade@windriver.com>
References: <20230810070012.3740596-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 5O5wBTrgsi5u0W938QCu2LlcSLyGdiCI
X-Proofpoint-ORIG-GUID: 5O5wBTrgsi5u0W938QCu2LlcSLyGdiCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_06,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308100058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185727

qemu: 9pfs: prevent opening special files

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-2861

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-2861.patch             | 171 ++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0112c29a8c..bc0d956e18 100644
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
2.35.5


