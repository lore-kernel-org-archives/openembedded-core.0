Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.7465.1589437737073086861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 23:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; 
   d="scan'208";a="92042800"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 May 2020 14:28:53 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 75DE64BCC89B
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:28:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 May 2020 14:28:51 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] watchdog: upgrade 5.15 -> 5.16
Date: Thu, 14 May 2020 23:29:13 +0800
Message-ID: <1589470153-4364-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 75DE64BCC89B.A6546
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch
removed since it is included in 5.16

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...param.h-for-EXEC_PAGESIZE-definition.patch | 32 -------------------
 .../{watchdog_5.15.bb => watchdog_5.16.bb}    |  7 ++--
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch
 rename meta/recipes-extended/watchdog/{watchdog_5.15.bb => watchdog_5.16.bb} (88%)

diff --git a/meta/recipes-extended/watchdog/watchdog/0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch b/meta/recipes-extended/watchdog/watchdog/0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch
deleted file mode 100644
index 198f198619..0000000000
--- a/meta/recipes-extended/watchdog/watchdog/0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8f91385dbd5e7c14b36ecbd8a01ca82c709f6d77 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 24 Jun 2016 18:19:29 +0000
-Subject: [PATCH] Include linux/param.h for EXEC_PAGESIZE definition
-
-Musl does not include linux/param.h whereas glibc
-does, so it fails to build on musl.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- src/watchdog.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/watchdog.c b/src/watchdog.c
-index acf6450..486384a 100644
---- a/src/watchdog.c
-+++ b/src/watchdog.c
-@@ -26,6 +26,9 @@
- #include <sys/param.h>		/* For EXEC_PAGESIZE */
- #include <linux/oom.h>
- #include <linux/watchdog.h>
-+#ifdef __linux__
-+#include <linux/param.h>
-+#endif
- #include <string.h>
- 
- #include <libgen.h>
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
similarity index 88%
rename from meta/recipes-extended/watchdog/watchdog_5.15.bb
rename to meta/recipes-extended/watchdog/watchdog_5.16.bb
index 1acab2e9e7..0199487e2e 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -6,17 +6,16 @@ HOMEPAGE = "http://watchdog.sourceforge.net/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
 
 LICENSE = "GPL-2.0+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
+LIC_FILES_CHKSUM = "file://COPYING;md5=084236108b1d4a9851bf5213fea586fd"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
-           file://0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch \
            file://0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch \
            file://watchdog.init \
            file://wd_keepalive.init \
 "
 
-SRC_URI[md5sum] = "678c32f6f35a0492c9c1b76b4aa88828"
-SRC_URI[sha256sum] = "ffdc865137ad5d8e53664bd22bad4de6ca136d1b4636720320cb52af0c18947c"
+SRC_URI[md5sum] = "1b4f51cabc64d1bee2fce7cdd626831f"
+SRC_URI[sha256sum] = "b8e7c070e1b72aee2663bdc13b5cc39f76c9232669cfbb1ac0adc7275a3b019d"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.17.1



