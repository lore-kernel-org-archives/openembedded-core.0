Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: PRNQIaG3kWJV3ginOqUzIyahkomYOblLhUk7rHGchqACf1pd8VYSm2fn5WIoQZy2/e3cEZtAu0
 60IN3W9Q5JQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818256"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818256"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:58 -0700
IronPort-SDR: DIu7oD1Gu20howGxLzGWVsIwI77eu9ObQ857oxGaF8GN0WHGqFZy+4SE2AHnpMlRh4TgWGhYbh
 BoYvD5V/SLVg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067496"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 45/64] libxshmfence: Build fixes for riscv32
Date: Mon, 26 Apr 2021 08:53:16 +0800
Message-Id: <45fedd892d2263ac14ceae16f1f9c5ed2b312ff7.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

NR_futex is not defined by newer architectures e.g. riscv32 as
they only have 64bit variant of time_t. Glibc defines SYS_futex
interface based on __NR_futex, since this is used in applications,
such applications start to fail to build for these newer architectures.

Define a fallback to alias __NR_futex to __NR_futex_time64 to make
SYS_futex keep working.

Reference: https://git.openembedded.org/openembedded-core/commit/?id=7a218adf9990f5e18d0b6a33eb34091969f979c7

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81599bf32135187b34726d41e9f619d22ca1bdd1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.30.2

