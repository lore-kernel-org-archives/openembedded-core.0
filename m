Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.24792.1611128477823315504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:41:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xU4+Ax4pubHhpMG2YAqpfHwZGtrYUTIgQuSfNGCdX4hcb+HE5+fFIHDW8aZTxKyJxswTqUKmXG
 53WT7DaRQAKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158240483"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="158240483"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:28 -0800
IronPort-SDR: 6rs3HCIz5ngFG4/AlA11/xVufyQGnoatI91h0y/DW17e3HN5DFnORHN1Vd7ppPZWFmpKbDFjNx
 cwCkb10hvu4Q==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="350958545"
Received: from mrengasa-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] rt-tests/hwlatdetect: upgrade 1.9 -> 1.10
Date: Wed, 20 Jan 2021 15:40:58 +0800
Message-Id: <20210120074058.252462-10-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120074058.252462-1-anuj.mittal@intel.com>
References: <20210120074058.252462-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...Allow-for-CC-and-AR-to-be-overridden.patch | 10 ++--
 ...-Allow-build-for-not-supported-archs.patch | 52 -------------------
 ...hwlatdetect_1.9.bb => hwlatdetect_1.10.bb} |  0
 meta/recipes-rt/rt-tests/rt-tests.inc         |  2 +-
 .../{rt-tests_1.9.bb => rt-tests_1.10.bb}     |  1 -
 5 files changed, 7 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_1.9.bb => hwlatdetect_1.10.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_1.9.bb => rt-tests_1.10.bb} (92%)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index 8fd94b176c..b177ff7c5f 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -1,4 +1,4 @@
-From f89d6d6d23e0dacfd0008f686a457d536edc406a Mon Sep 17 00:00:00 2001
+From b608a817df2b652cd5fa1b5a7cf14b7d2d8afd5f Mon Sep 17 00:00:00 2001
 From: Randy Witt <randy.e.witt@intel.com>
 Date: Fri, 16 Oct 2020 16:54:30 -0700
 Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
@@ -9,17 +9,16 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
 Signed-off-by: Randy Witt <randy.e.witt@intel.com>
 
 Upstream-Status: Inappropriate [other]
-
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index c3ebbd7..2176835 100644
+index 636f191..9f57d2c 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
- VERSION = 1.9
+ VERSION = 1.10
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
@@ -27,3 +26,6 @@ index c3ebbd7..2176835 100644
  
  OBJDIR = bld
  
+-- 
+2.29.2
+
diff --git a/meta/recipes-rt/rt-tests/files/0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch b/meta/recipes-rt/rt-tests/files/0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
deleted file mode 100644
index 1ee7539f7d..0000000000
--- a/meta/recipes-rt/rt-tests/files/0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 165b597e3003c6870f5980e8902014d9344e6cf3 Mon Sep 17 00:00:00 2001
-From: Peter Xu <peterx@redhat.com>
-Date: Thu, 1 Oct 2020 14:47:26 -0400
-Subject: [PATCH] rt-tests: oslat: Allow build for not supported archs
-
-Now rt-tests won't build for archs other than x86/i386/ppc64 after oslat is
-merged.  Instead of failing the build, let's make it pass.  However, whenever
-oslat is executed, instead of running the real program, dump an error message,
-so that people can try to implement the frc() function for it when there's a
-real need for the new arch.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=165b597e3003c6870f5980e8902014d9344e6cf3]
-
-Signed-off-by: Peter Xu <peterx@redhat.com>
-Signed-off-by: John Kacur <jkacur@redhat.com>
-Signed-off-by: Peter Bergin <peter@berginkonsult.se>
-
----
- src/oslat/oslat.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/src/oslat/oslat.c b/src/oslat/oslat.c
-index f1a82f2..a8b6155 100644
---- a/src/oslat/oslat.c
-+++ b/src/oslat/oslat.c
-@@ -69,7 +69,9 @@ static inline void frc(uint64_t *pval)
- 	__asm__ __volatile__("mfspr %0, 268\n" : "=r" (*pval));
- }
- # else
--#  error Need frc() for this platform.
-+#  define relax()          do { } while (0)
-+#  define frc(x)
-+#  define FRC_MISSING
- # endif
- #else
- # error Need to add support for this compiler.
-@@ -810,6 +812,12 @@ int main(int argc, char *argv[])
- 	int i, n_cores;
- 	cpu_set_t cpu_set;
- 
-+#ifdef FRC_MISSING
-+	printf("This architecture is not yet supported. "
-+	       "Please implement frc() function first for %s.\n", argv[0]);
-+	return 0;
-+#endif
-+
- 	CPU_ZERO(&cpu_set);
- 
- 	g.app_name = argv[0];
--- 
-2.25.1
-
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb b/meta/recipes-rt/rt-tests/hwlatdetect_1.10.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_1.10.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 2dd890cf95..9358f13d06 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
 # Version 1.8
-SRCREV = "21c1df7d2ee199ac619cbb1806a38d15e7e95c09"
+SRCREV = "32819581cc0509c9d58c33c3061f57abe0c40c88"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.9.bb b/meta/recipes-rt/rt-tests/rt-tests_1.10.bb
similarity index 92%
rename from meta/recipes-rt/rt-tests/rt-tests_1.9.bb
rename to meta/recipes-rt/rt-tests/rt-tests_1.10.bb
index b916a7fe60..2834cabcd4 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.10.bb
@@ -12,7 +12,6 @@ SRC_URI += " \
             file://run-ptest \
             file://rt_bmark.py \
             file://0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch \
-            file://0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch \
            "
 
 # rt-tests needs PI mutex support in libc
-- 
2.29.2

