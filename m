Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.1576.1587368379769469979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 00:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,405,1580745600"; 
   d="scan'208";a="89266761"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Apr 2020 15:37:35 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A06B850A9969
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2020 15:26:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Apr 2020 15:37:33 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libtirpc: upgrade 1.2.5 -> 1.2.6
Date: Tue, 21 Apr 2020 00:21:57 +0800
Message-ID: <1587399717-92909-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A06B850A9969.A7F33
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-xdr_float-do-not-include-bits-endian.h.patch
removed since it is included in 1.2.6

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...r_float-do-not-include-bits-endian.h.patch | 34 -------------------
 .../{libtirpc_1.2.5.bb => libtirpc_1.2.6.bb}  |  8 ++---
 2 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
 rename meta/recipes-extended/libtirpc/{libtirpc_1.2.5.bb => libtirpc_1.2.6.bb} (74%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
deleted file mode 100644
index 3797cdf521..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d04f4d6f0e682f16b0ce96839ab4eadade591eb1 Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Tue, 21 Jan 2020 11:51:16 -0500
-Subject: [PATCH] xdr_float: do not include bits/endian.h
-
-bits/endian.h is an internal header. endian.h should be included.
-
-Fixes compilation with recent musl.
-
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-
-Upstream-Status: Backport [http://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=d04f4d6f0e682f16b0ce96839ab4eadade591eb1]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- src/xdr_float.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/xdr_float.c b/src/xdr_float.c
-index 26bc865..349d48f 100644
---- a/src/xdr_float.c
-+++ b/src/xdr_float.c
-@@ -83,7 +83,7 @@ static struct sgl_limits {
- };
- #else
- 
--#include <bits/endian.h>
-+#include <endian.h>
- #define IEEEFP
- 
- #endif /* vax */
--- 
-2.21.1
-
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
similarity index 74%
rename from meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
index fc66821ecc..6100d157e5 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
@@ -9,13 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 
 PROVIDES = "virtual/librpc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
-           file://0001-xdr_float-do-not-include-bits-endian.h.patch \
-           "
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[md5sum] = "688787ddff7c6a92ef15ae3f5dc4dfa1"
-SRC_URI[sha256sum] = "f3b6350c7e9c3cd9c58fc7a5e5f8e6be469cc571bb5eb31eb9790b3e675186ca"
+SRC_URI[md5sum] = "b25f9cc18bfad50f7c446c77f4ae00bb"
+SRC_URI[sha256sum] = "4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc"
 
 inherit autotools pkgconfig
 
-- 
2.17.1



