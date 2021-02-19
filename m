Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6990.1613732762125727807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 03:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,189,1610380800"; 
   d="scan'208";a="104643986"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 Feb 2021 19:05:54 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 631DA4CE72E8
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 19:05:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 19 Feb 2021 19:05:48 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] util-linux: upgrade 2.36.1 -> 2.36.2
Date: Fri, 19 Feb 2021 19:05:44 +0800
Message-ID: <1613732745-5747-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 631DA4CE72E8.A3777
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch
0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch
removed since they are included in 2.36.2

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-build-plymouth-ctrl.c-w-disabled-pl.patch | 52 -------------------
 ...-not-assume-__NR_settimeofday_time32.patch | 30 -----------
 ...l-linux_2.36.1.bb => util-linux_2.36.2.bb} |  4 +-
 3 files changed, 1 insertion(+), 85 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch
 rename meta/recipes-core/util-linux/{util-linux_2.36.1.bb => util-linux_2.36.2.bb} (98%)

diff --git a/meta/recipes-core/util-linux/util-linux/0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch b/meta/recipes-core/util-linux/util-linux/0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch
deleted file mode 100644
index f3ae5ef948..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 5547316c85cd45c0ea29c4c7c48eecd616783cd5 Mon Sep 17 00:00:00 2001
-From: Pino Toscano <toscano.pino@tiscali.it>
-Date: Tue, 17 Nov 2020 11:27:48 +0100
-Subject: [PATCH] build-sys: do not build plymouth-ctrl.c w/ disabled plymouth
-
-Do not build plymouth-ctrl.c in agetty and sulogin in case the plymouth
-support is disabled.
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/5547316c85cd45c0ea29c4c7c48eecd616783cd5]
-Signed-off-by: Pino Toscano <toscano.pino@tiscali.it>
----
- login-utils/Makemodule.am | 6 ++++--
- term-utils/Makemodule.am  | 6 ++++--
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/login-utils/Makemodule.am b/login-utils/Makemodule.am
-index 4f52cea3c..8bc3ee37e 100644
---- a/login-utils/Makemodule.am
-+++ b/login-utils/Makemodule.am
-@@ -31,8 +31,10 @@ dist_man_MANS += login-utils/sulogin.8
- sulogin_SOURCES = \
- 	login-utils/sulogin.c \
- 	login-utils/sulogin-consoles.c \
--	login-utils/sulogin-consoles.h \
--	lib/plymouth-ctrl.c
-+	login-utils/sulogin-consoles.h
-+if USE_PLYMOUTH_SUPPORT
-+sulogin_SOURCES += lib/plymouth-ctrl.c
-+endif
- sulogin_LDADD = $(LDADD) libcommon.la
- 
- if HAVE_LIBCRYPT
-diff --git a/term-utils/Makemodule.am b/term-utils/Makemodule.am
-index 92df7dbc8..c424dbdf8 100644
---- a/term-utils/Makemodule.am
-+++ b/term-utils/Makemodule.am
-@@ -42,8 +42,10 @@ endif # BUILD_SCRIPTLIVE
- if BUILD_AGETTY
- sbin_PROGRAMS += agetty
- dist_man_MANS += term-utils/agetty.8
--agetty_SOURCES = term-utils/agetty.c \
--		 lib/plymouth-ctrl.c
-+agetty_SOURCES = term-utils/agetty.c
-+if USE_PLYMOUTH_SUPPORT
-+agetty_SOURCES += lib/plymouth-ctrl.c
-+endif
- agetty_LDADD = $(LDADD) libcommon.la
- if BSD
- agetty_LDADD += -lutil
--- 
-2.29.2
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch b/meta/recipes-core/util-linux/util-linux/0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch
deleted file mode 100644
index 3e818470fe..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 367972fae13d170675768d63678577cae1890143 Mon Sep 17 00:00:00 2001
-From: Pino Toscano <toscano.pino@tiscali.it>
-Date: Tue, 17 Nov 2020 11:32:45 +0100
-Subject: [PATCH] hwclock: do not assume __NR_settimeofday_time32
-
-Check that __NR_settimeofday_time32 exists before trying to use it as
-syscall number.
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/367972fae13d170675768d63678577cae1890143]
-Signed-off-by: Pino Toscano <toscano.pino@tiscali.it>
----
- sys-utils/hwclock.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sys-utils/hwclock.c b/sys-utils/hwclock.c
-index 1f7ef3317..db448687d 100644
---- a/sys-utils/hwclock.c
-+++ b/sys-utils/hwclock.c
-@@ -678,7 +678,7 @@ display_time(struct timeval hwctime)
- #ifndef SYS_settimeofday
- # ifdef __NR_settimeofday
- #  define SYS_settimeofday	__NR_settimeofday
--# else
-+# elif defined(__NR_settimeofday_time32)
- #  define SYS_settimeofday	__NR_settimeofday_time32
- # endif
- #endif
--- 
-2.29.2
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.1.bb b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
similarity index 98%
rename from meta/recipes-core/util-linux/util-linux_2.36.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.36.2.bb
index bf46922271..19950a2726 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
@@ -39,10 +39,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch \
-           file://0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch \
            "
-SRC_URI[sha256sum] = "09fac242172cd8ec27f0739d8d192402c69417617091d8c6e974841568f37eed"
+SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
 
 PACKAGES =+ "${PN}-swaponoff"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
-- 
2.25.1



