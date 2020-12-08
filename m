Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.4773.1607407964245615246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 22:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102166407"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 14:12:42 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 430034CE5CF8
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Dec 2020 14:12:36 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 14:12:34 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libaio: upgrade 0.3.111 -> 0.3.112
Date: Tue, 8 Dec 2020 14:12:32 +0800
Message-ID: <1607407952-2364-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 430034CE5CF8.A24D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

destdir.patch
removed since it is included in 0.3.112

modify system-linkage.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libaio/libaio/destdir.patch                | 17 -----------------
 .../libaio/libaio/system-linkage.patch         | 18 +++++++-----------
 .../{libaio_0.3.111.bb => libaio_0.3.112.bb}   |  3 +--
 3 files changed, 8 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/libaio/libaio/destdir.patch
 rename meta/recipes-extended/libaio/{libaio_0.3.111.bb => libaio_0.3.112.bb} (88%)

diff --git a/meta/recipes-extended/libaio/libaio/destdir.patch b/meta/recipes-extended/libaio/libaio/destdir.patch
deleted file mode 100644
index 0f90406bee..0000000000
--- a/meta/recipes-extended/libaio/libaio/destdir.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-from openembedded, added by Qing He <qing.he@intel.com>
-
-Index: libaio-0.3.110/Makefile
-===================================================================
---- libaio-0.3.110.orig/Makefile
-+++ libaio-0.3.110/Makefile
-@@ -15,7 +15,7 @@ all:
- 	@$(MAKE) -C src
- 
- install:
--	@$(MAKE) -C src install prefix=$(prefix) includedir=$(includedir) libdir=$(libdir)
-+	@$(MAKE) -C src install prefix=$(DESTDIR)$(prefix) includedir=$(DESTDIR)$(includedir) libdir=$(DESTDIR)$(libdir)
- 
- check:
- 	@$(MAKE) -C harness check
diff --git a/meta/recipes-extended/libaio/libaio/system-linkage.patch b/meta/recipes-extended/libaio/libaio/system-linkage.patch
index 0b1f475697..cc91ea99d9 100644
--- a/meta/recipes-extended/libaio/libaio/system-linkage.patch
+++ b/meta/recipes-extended/libaio/libaio/system-linkage.patch
@@ -12,26 +12,22 @@ undefined reference to `__stack_chk_fail_local'
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 ---
- src/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index eadb336..56ab701 100644
+index 37ae219..22e0c9a 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -3,10 +3,10 @@ includedir=$(prefix)/include
- libdir=$(prefix)/lib
- 
- CFLAGS ?= -g -fomit-frame-pointer -O2
--CFLAGS += -nostdlib -nostartfiles -Wall -I. -fPIC
-+CFLAGS += -Wall -I. -fPIC
+@@ -6,7 +6,7 @@ CFLAGS ?= -g -fomit-frame-pointer -O2
+ CFLAGS += -Wall -I. -fPIC
  SO_CFLAGS=-shared $(CFLAGS)
  L_CFLAGS=$(CFLAGS)
 -LINK_FLAGS=
 +LINK_FLAGS=$(LDFLAGS)
  LINK_FLAGS+=$(LDFLAGS)
+ ENABLE_SHARED ?= 1
  
- soname=libaio.so.1
 -- 
-2.1.4
+2.25.1
 
diff --git a/meta/recipes-extended/libaio/libaio_0.3.111.bb b/meta/recipes-extended/libaio/libaio_0.3.112.bb
similarity index 88%
rename from meta/recipes-extended/libaio/libaio_0.3.111.bb
rename to meta/recipes-extended/libaio/libaio_0.3.112.bb
index 8e1cd349a0..b3606474a5 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.111.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.112.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "git://pagure.io/libaio.git;protocol=https \
            file://00_arches.patch \
-           file://destdir.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \
            "
-SRCREV = "f66be22ab0a59a39858900ab72a8c6a6e8b0b7ec"
+SRCREV = "d025927efa75a0d1b46ca3a5ef331caa2f46ee0e"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
-- 
2.25.1



