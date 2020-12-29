Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.8914.1609225419166257601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 23:03:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SaidbI0A;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id l23so1054683pjg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 23:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8ZNFx5wd1TXncWN5J1otOq4113StYEX2MIZC7dFHQg=;
        b=SaidbI0AiItP1t0TTmqB1f+rnw8BHBwutBidbiXEX+bT2cjlEjFxTWQh7j+f2LF60A
         QfHXLM8P6yIHZekVGtITzVDso8e6I/quxSIVQvng+LboVsrnT7aWREZLZWi+RXAfgykW
         RmAximo8+YUzn+xrELhHgoiCnuLdZNr/kdphaBsB6qo3fi0eYdn6SjaEylnaXUg7w2iV
         IsS3itD0DZ6agrAbiyqxunIb6XHl7j8vBO2ixj5ppq1dDdeFqE+lbed/OiG7iKKBQ7MX
         QuxFpTs0a9SRns/tiSttIJMfuMbh+jW4A21dysG5eYS1Z9/N5c0AsycjlfFNXGkxAjo9
         Q6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8ZNFx5wd1TXncWN5J1otOq4113StYEX2MIZC7dFHQg=;
        b=MCvAJXO5SFVTxD/gjrXm8ZNEM/5n37CVosEf+JTGZnyDK+13yJDqjbIgPE/SQhfqnI
         r7lsSdKXFgLmf3kQy2t/G11lJjd6h1sV1S//qF27xggDyE8IbZCMaztlfWt08KnYCaww
         YyCZhxEnYAzratMNjMJjfujt1dM9WF4Yfz+30tCX8XErvgyqce5prlmhO+jGCjA7t6rl
         BSx19lmhA2E67CacckfEQhrgNvU9agzfVoSKI6JP+LvpqfduvsDzn7r+LiDdrQnwb0d9
         7TMgeh0DjGokwdNeAtI9PBLaS4XX7O7M98Hg8Ye2VkK3mP/tKt1o0AYHrZ54BwyHkKH0
         R0jQ==
X-Gm-Message-State: AOAM533Z1w4TD05jCtXbU9ASlBgF5zYl7altWGV3G5/gCr1BLq9CX4as
	/RWwpQCLhII9moscnvBo+ORzXFV/XsyZZQ==
X-Google-Smtp-Source: ABdhPJx+zix0LXGAibeFOKPJV7B2fA8gRMdaeEHTPG+AXpwALs3DwDLb0AZMI1KbDdhdI7t/1sFdWQ==
X-Received: by 2002:a17:90a:cf17:: with SMTP id h23mr2750223pju.82.1609225418387;
        Mon, 28 Dec 2020 23:03:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::92e8])
        by smtp.gmail.com with ESMTPSA id g3sm1675395pjt.34.2020.12.28.23.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 23:03:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] util-linux: Build fixes for 32bit arches with 64bit time_t
Date: Mon, 28 Dec 2020 23:03:34 -0800
Message-Id: <20201229070334.1245271-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

some 32bit architectures ( e.g. riscv32 and arc ) are using 64bit time_t
from get go, therefore may not have time32 syscalls, these backports
help restore the successful builds for util-linux on such machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-build-plymouth-ctrl.c-w-disabled-pl.patch | 52 +++++++++++++++++++
 ...-not-assume-__NR_settimeofday_time32.patch | 30 +++++++++++
 .../util-linux/util-linux_2.36.1.bb           |  2 +
 3 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch

diff --git a/meta/recipes-core/util-linux/util-linux/0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch b/meta/recipes-core/util-linux/util-linux/0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch
new file mode 100644
index 0000000000..f3ae5ef948
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch
@@ -0,0 +1,52 @@
+From 5547316c85cd45c0ea29c4c7c48eecd616783cd5 Mon Sep 17 00:00:00 2001
+From: Pino Toscano <toscano.pino@tiscali.it>
+Date: Tue, 17 Nov 2020 11:27:48 +0100
+Subject: [PATCH] build-sys: do not build plymouth-ctrl.c w/ disabled plymouth
+
+Do not build plymouth-ctrl.c in agetty and sulogin in case the plymouth
+support is disabled.
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/5547316c85cd45c0ea29c4c7c48eecd616783cd5]
+Signed-off-by: Pino Toscano <toscano.pino@tiscali.it>
+---
+ login-utils/Makemodule.am | 6 ++++--
+ term-utils/Makemodule.am  | 6 ++++--
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/login-utils/Makemodule.am b/login-utils/Makemodule.am
+index 4f52cea3c..8bc3ee37e 100644
+--- a/login-utils/Makemodule.am
++++ b/login-utils/Makemodule.am
+@@ -31,8 +31,10 @@ dist_man_MANS += login-utils/sulogin.8
+ sulogin_SOURCES = \
+ 	login-utils/sulogin.c \
+ 	login-utils/sulogin-consoles.c \
+-	login-utils/sulogin-consoles.h \
+-	lib/plymouth-ctrl.c
++	login-utils/sulogin-consoles.h
++if USE_PLYMOUTH_SUPPORT
++sulogin_SOURCES += lib/plymouth-ctrl.c
++endif
+ sulogin_LDADD = $(LDADD) libcommon.la
+ 
+ if HAVE_LIBCRYPT
+diff --git a/term-utils/Makemodule.am b/term-utils/Makemodule.am
+index 92df7dbc8..c424dbdf8 100644
+--- a/term-utils/Makemodule.am
++++ b/term-utils/Makemodule.am
+@@ -42,8 +42,10 @@ endif # BUILD_SCRIPTLIVE
+ if BUILD_AGETTY
+ sbin_PROGRAMS += agetty
+ dist_man_MANS += term-utils/agetty.8
+-agetty_SOURCES = term-utils/agetty.c \
+-		 lib/plymouth-ctrl.c
++agetty_SOURCES = term-utils/agetty.c
++if USE_PLYMOUTH_SUPPORT
++agetty_SOURCES += lib/plymouth-ctrl.c
++endif
+ agetty_LDADD = $(LDADD) libcommon.la
+ if BSD
+ agetty_LDADD += -lutil
+-- 
+2.29.2
+
diff --git a/meta/recipes-core/util-linux/util-linux/0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch b/meta/recipes-core/util-linux/util-linux/0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch
new file mode 100644
index 0000000000..3e818470fe
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch
@@ -0,0 +1,30 @@
+From 367972fae13d170675768d63678577cae1890143 Mon Sep 17 00:00:00 2001
+From: Pino Toscano <toscano.pino@tiscali.it>
+Date: Tue, 17 Nov 2020 11:32:45 +0100
+Subject: [PATCH] hwclock: do not assume __NR_settimeofday_time32
+
+Check that __NR_settimeofday_time32 exists before trying to use it as
+syscall number.
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/367972fae13d170675768d63678577cae1890143]
+Signed-off-by: Pino Toscano <toscano.pino@tiscali.it>
+---
+ sys-utils/hwclock.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys-utils/hwclock.c b/sys-utils/hwclock.c
+index 1f7ef3317..db448687d 100644
+--- a/sys-utils/hwclock.c
++++ b/sys-utils/hwclock.c
+@@ -678,7 +678,7 @@ display_time(struct timeval hwctime)
+ #ifndef SYS_settimeofday
+ # ifdef __NR_settimeofday
+ #  define SYS_settimeofday	__NR_settimeofday
+-# else
++# elif defined(__NR_settimeofday_time32)
+ #  define SYS_settimeofday	__NR_settimeofday_time32
+ # endif
+ #endif
+-- 
+2.29.2
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.1.bb b/meta/recipes-core/util-linux/util-linux_2.36.1.bb
index 8ea0bac9b2..bf46922271 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.1.bb
@@ -39,6 +39,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://0001-build-sys-do-not-build-plymouth-ctrl.c-w-disabled-pl.patch \
+           file://0001-hwclock-do-not-assume-__NR_settimeofday_time32.patch \
            "
 SRC_URI[sha256sum] = "09fac242172cd8ec27f0739d8d192402c69417617091d8c6e974841568f37eed"
 
-- 
2.29.2

