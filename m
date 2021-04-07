Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.4091.1617782908295237479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 01:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 13788QZO022872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Apr 2021 01:08:26 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 01:08:26 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 7 Apr 2021 01:08:25 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libxshmfence: Build fixes for riscv32
Date: Wed, 7 Apr 2021 16:08:24 +0800
Message-ID: <20210407080824.37913-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

NR_futex is not defined by newer architectures e.g. riscv32 as
they only have 64bit variant of time_t. Glibc defines SYS_futex
interface based on __NR_futex, since this is used in applications,
such applications start to fail to build for these newer architectures.

Define a fallback to alias __NR_futex to __NR_futex_time64 to make
SYS_futex keep working.

Reference: https://git.openembedded.org/openembedded-core/commit/?id=7a218adf9990f5e18d0b6a33eb34091969f979c7

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...h-Define-SYS_futex-if-it-does-not-ex.patch | 39 +++++++++++++++++++
 .../xorg-lib/libxshmfence_1.3.bb              |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
new file mode 100644
index 0000000000..3e87794d20
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
@@ -0,0 +1,39 @@
+From 5827f6389a227157958d14a687fb29223cb3a03a Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 7 Apr 2021 07:48:42 +0000
+Subject: [PATCH] xshmfence_futex.h: Define SYS_futex if it does not exist
+
+_NR_futex is not defines by newer architectures e.g. riscv32 as
+they only have 64bit variant of time_t. Glibc defines SYS_futex
+interface based on __NR_futex, since this is used in applications,
+such applications start to fail to build for these newer architectures.
+This patch defines a fallback to alias __NR_futex to __NR_futex_time64
+to make SYS_futex keep working.
+
+Reference: https://git.openembedded.org/openembedded-core/commit/?id=7a218adf9990f5e18d0b6a33eb34091969f979c7
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/xshmfence_futex.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/xshmfence_futex.h b/src/xshmfence_futex.h
+index 673ac0e..a71efa5 100644
+--- a/src/xshmfence_futex.h
++++ b/src/xshmfence_futex.h
+@@ -53,6 +53,10 @@ static inline int futex_wait(int32_t *addr, int32_t value) {
+ #include <sys/time.h>
+ #include <sys/syscall.h>
+ 
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++#define SYS_futex SYS_futex_time64
++#endif
++
+ static inline long sys_futex(void *addr1, int op, int val1, struct timespec *timeout, void *addr2, int val3)
+ {
+ 	return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
+-- 
+2.29.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index cc45696530..d153c7a603 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -13,7 +13,9 @@ DEPENDS += "virtual/libx11"
 
 EXTRA_OECONF += "--with-shared-memory-dir=/dev/shm"
 
-BBCLASSEXTEND = "native nativesdk"
+SRC_URI += "file://0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch"
 
 SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
 SRC_URI[sha256sum] = "b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

