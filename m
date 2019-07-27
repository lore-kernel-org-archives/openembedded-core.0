Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 32E2E6BC44
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 15:59:05 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id i2so25890071plt.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jp1yk7JXBTWFUdvjRN/zJkgtxDtEqrr6dM4dCvtRkRg=;
	b=lIuQV/vvdc1UEWBmsoYX8UmFBKHe2rFZaH2/ZcGRPA336itfdHUsRMF4oR6kcZnhEt
	MxMucEQ6SdJCmJ9FziB9m5k7ZdFFRV5czkGOLOUxkrLizlabbDSOfxLqmHQQI3cxsCzo
	EAECFu5fKn88wYGCroJtZ8GyVtc40kqPFOgRwWAHLUlCkJNEmIaElXPJ0ptKo1Sc4NHd
	L59TXfdFP1ipueixo4QlIbboRs5la5xVdSJXFwwje/iyMns3gp5yZLEMC/NA9AFBko72
	Sk4e81JGFs+oeZ42/RGDfw9lUo9LepEasNdp8uoxnE+O4tfiPhlDLXDdi16qRi5TQPub
	c/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jp1yk7JXBTWFUdvjRN/zJkgtxDtEqrr6dM4dCvtRkRg=;
	b=GJzb7cqVSiL6DDXmvCCu9PmLCkwNnrWaQLtLaSRZXeOJGET6fxNI24uAhXcuFeDbgk
	eQcCYXJEAZ0lA0iEKIe2o/0DzNMMZx9CwmesDUvuNX7n1EXJUZsHBr5uGkOtR7OfOi/w
	yBdQs9RuTipedvX+5T+f72pplvGvRjx30qZGKULWeD0HSRvxJwXUXXFVOirP1NMvQ8e/
	z4Hocfy3CgAidC24ROyyliVamQWho6PbP9VyM9EQIBsQx0S+d7UTT0FDCCQhTr+qUkID
	dvFZYAXnxo131yIHc7uRxEgv7GhUYdQ+CR5XzMGOsK2/H8+PuHVlxz44XQ1GS37L78Y3
	5mvA==
X-Gm-Message-State: APjAAAX8ynMIf9k8zFeifgAE7QPsjBdYf5JSExyEin0hRF2fMrG3/zoR
	SSQrq6mP0blJNJLpDiBRFi/4PuaIMkQ=
X-Google-Smtp-Source: APXvYqzDK4H+RPxER2dOAqhBR6EL3F/fyGcHT70xMLA7Bxj1XUirsDMY07X7MDcidver0GpTtAV5+g==
X-Received: by 2002:a17:902:ea:: with SMTP id
	a97mr26413299pla.182.1564243145643; 
	Sat, 27 Jul 2019 08:59:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	g2sm57118347pfi.26.2019.07.27.08.59.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 08:59:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Jul 2019 08:58:48 -0700
Message-Id: <20190727155849.38385-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/2] ltp: Fix build with glibc 2.30
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Jul 2019 15:59:05 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...me-check-for-getdents-getdents64-API.patch | 72 +++++++++++++++++++
 ...k-for-RES_USE_INET6-during-configure.patch | 68 ++++++++++++++++++
 ...e-getdents-getdents64-only-for-glibc.patch | 50 -------------
 meta/recipes-extended/ltp/ltp_20190517.bb     |  3 +-
 4 files changed, 142 insertions(+), 51 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-configure.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0005-getdents-define-getdents-getdents64-only-for-glibc.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getdents-getdents64-API.patch b/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
new file mode 100644
index 0000000000..bfceadb190
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
@@ -0,0 +1,72 @@
+From 404dfeb4faef213b0450f173b60cd7080edec349 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Jul 2019 10:32:29 -0700
+Subject: [PATCH 1/2] Add configure time check for getdents/getdents64 APIs
+
+glibc 2.30 has added wrapper for getdents64 this will help in detecting
+right condition to use fallback
+
+Check for getdents API as well while here
+
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-July/012954.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                                  | 2 ++
+ testcases/kernel/syscalls/getdents/getdents.h | 8 ++++++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -65,6 +65,8 @@ AC_CHECK_FUNCS([ \
+     fallocate \
+     fchownat \
+     fstatat \
++    getdents \
++    getdents64 \
+     kcmp \
+     mkdirat \
+     mknodat \
+--- a/testcases/kernel/syscalls/getdents/getdents.h
++++ b/testcases/kernel/syscalls/getdents/getdents.h
+@@ -23,7 +23,7 @@
+ #include <stdint.h>
+ #include "test.h"
+ #include "lapi/syscalls.h"
+-
++#include "config.h"
+ /*
+  * See fs/compat.c struct compat_linux_dirent
+  */
+@@ -34,12 +34,17 @@ struct linux_dirent {
+ 	char            d_name[];
+ };
+ 
++#if HAVE_GETDENTS
++#include <unistd.h>
++#else
+ static inline int
+ getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
+ {
+ 	return ltp_syscall(__NR_getdents, fd, dirp, size);
+ }
+ 
++#endif /* HAVE_GETDENTS */
++
+ struct linux_dirent64 {
+ 	uint64_t	d_ino;
+ 	int64_t		d_off;
+@@ -48,10 +53,13 @@ struct linux_dirent64 {
+ 	char		d_name[];
+ };
+ 
++#if HAVE_GETDENTS64
++#include <unistd.h>
++#else
+ static inline int
+ getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
+ {
+ 	return ltp_syscall(__NR_getdents64, fd, dirp64, size);
+ }
+-
++#endif /* HAVE_GETDENTS64 */
+ #endif /* GETDENTS_H */
diff --git a/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-configure.patch b/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-configure.patch
new file mode 100644
index 0000000000..12e47eb2b6
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-configure.patch
@@ -0,0 +1,68 @@
+From 7bc134545b7beb09717a60541530c20a1a5740d3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Jul 2019 10:55:28 -0700
+Subject: [PATCH 2/2] check for RES_USE_INET6 during configure
+
+glibc 2.30 has remove RES_USE_INET6 define which has been on its way out
+since 2.26 release, this check ensures that we detect it before using it
+
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-July/012955.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                                        | 13 +++++++++++++
+ testcases/network/multicast/mc_gethost/mc_gethost.c |  6 ++++++
+ 2 files changed, 19 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2255b5c181..ed7acccb01 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -91,6 +91,19 @@ AC_CHECK_FUNCS([ \
+     vmsplice \
+ ])
+ 
++#check defines
++AC_MSG_CHECKING([for RES_USE_INET6])
++AC_COMPILE_IFELSE( [AC_LANG_PROGRAM([[#include <resolv.h>]],
++  [[char dummy[RES_USE_INET6];]])],
++  [
++    AC_MSG_RESULT([yes])
++    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 1, [Define to 1 if you have the RES_USE_INET6 macro.])
++  ],
++  [
++    AC_MSG_RESULT([no])
++    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 0, [Define to 1 if you have the RES_USE_INET6 macro.])
++  ]
++)
+ # Tools knobs
+ 
+ # Expect
+diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/testcases/network/multicast/mc_gethost/mc_gethost.c
+index 9cc15d086b..d1cae5441a 100644
+--- a/testcases/network/multicast/mc_gethost/mc_gethost.c
++++ b/testcases/network/multicast/mc_gethost/mc_gethost.c
+@@ -17,6 +17,8 @@
+ #include <string.h>
+ #include <stdlib.h>
+ 
++#include "config.h"
++
+ #ifndef LOG_PERROR
+ #define LOG_PERROR 0
+ #endif
+@@ -50,8 +52,12 @@ usage:
+ 		argv++, argc--;
+ 	}
+ 	if (argc >= 1 && !strcmp(*argv, "-6")) {
++#if HAVE_RES_USE_INET6
+ 		af = AF_INET6, size = IN6ADDRSZ;
+ 		_res.options |= RES_USE_INET6;
++#else
++		af = AF_INET, size = INADDRSZ;
++#endif
+ 		argv++, argc--;
+ 	}
+ 	if (argc >= 1 && !strcmp(*argv, "-f")) {
+-- 
+2.22.0
+
diff --git a/meta/recipes-extended/ltp/ltp/0005-getdents-define-getdents-getdents64-only-for-glibc.patch b/meta/recipes-extended/ltp/ltp/0005-getdents-define-getdents-getdents64-only-for-glibc.patch
deleted file mode 100644
index d1f7b0746b..0000000000
--- a/meta/recipes-extended/ltp/ltp/0005-getdents-define-getdents-getdents64-only-for-glibc.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From b996b2480fe3a800ffbdc4a0fdc5e8775c575449 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 06:57:04 +0000
-Subject: [PATCH] getdents: define getdents/getdents64 only for glibc
-
-getdents/getdents64 are implemented in musl and when we define static
-functions with same name, it errors out.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/syscalls/getdents/getdents.h | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/getdents/getdents.h b/testcases/kernel/syscalls/getdents/getdents.h
-index 702b0bd..860b22e 100644
---- a/testcases/kernel/syscalls/getdents/getdents.h
-+++ b/testcases/kernel/syscalls/getdents/getdents.h
-@@ -34,12 +34,13 @@ struct linux_dirent {
- 	char            d_name[];
- };
- 
-+#ifdef __GLIBC__
- static inline int
- getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
- {
- 	return ltp_syscall(__NR_getdents, fd, dirp, size);
- }
--
-+#endif
- struct linux_dirent64 {
- 	uint64_t	d_ino;
- 	int64_t		d_off;
-@@ -48,10 +49,11 @@ struct linux_dirent64 {
- 	char		d_name[];
- };
- 
-+#ifdef __GLIBC__
- static inline int
- getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
- {
- 	return ltp_syscall(__NR_getdents64, fd, dirp64, size);
- }
--
-+#endif
- #endif /* GETDENTS_H */
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index 1f3a94bdfa..c62f2618b5 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -34,7 +34,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
            file://0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
            file://0004-guard-mallocopt-with-__GLIBC__.patch \
-           file://0005-getdents-define-getdents-getdents64-only-for-glibc.patch \
            file://0006-rt_tgsigqueueinfo-disable-test-on-musl.patch \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
@@ -42,6 +41,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch \
            file://0011-direct_io-diotest4-drop-MAP_FIXED.patch \
            file://0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch \
+           file://0001-Add-configure-time-check-for-getdents-getdents64-API.patch \
+           file://0002-check-for-RES_USE_INET6-during-configure.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.22.0


