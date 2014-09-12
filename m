Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 283BF60703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 21:03:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8CL3Vt0019882
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 14:03:31 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 12 Sep 2014 14:03:31 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Sep 2014 14:03:31 -0700
Message-ID: <1410555811-30996-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] sysprof: add aarch64 support
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
X-List-Received-Date: Fri, 12 Sep 2014 21:03:32 -0000
Content-Type: text/plain

Enable sysprof compilation for aarch64.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-kernel/sysprof/files/collector_c.patch |   30 ++++++++++++++++++++
 meta/recipes-kernel/sysprof/files/rmb-arm.patch    |    2 +-
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    2 +
 3 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/sysprof/files/collector_c.patch

diff --git a/meta/recipes-kernel/sysprof/files/collector_c.patch b/meta/recipes-kernel/sysprof/files/collector_c.patch
new file mode 100644
index 0000000..92d1fdc
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/collector_c.patch
@@ -0,0 +1,30 @@
+sysprof: recognize aarch64
+
+Value for __NR_perf_counter_open set to value of __NR_perf_event_open
+in usr/include/asm/unistd.h.
+
+Upstream-Status: Pending
+
+Signed-off-by: joe.slater@windriver.com
+
+
+--- a/collector.c
++++ b/collector.c
+@@ -157,6 +157,8 @@ sysprof_perf_counter_open (struct perf_e
+ #define __NR_perf_counter_open 298
+ #elif defined(__arm__)
+ #define __NR_perf_counter_open 364
++#elif defined(__aarch64__)
++#define __NR_perf_counter_open 241
+ #elif defined(__bfin__)
+ #define __NR_perf_counter_open 369
+ #elif defined(__frv__)
+@@ -185,6 +187,8 @@ sysprof_perf_counter_open (struct perf_e
+ #define __NR_perf_counter_open 364
+ #elif defined(__sparc__) || defined(__sparc64__)
+ #define __NR_perf_counter_open 327
++#else
++#error "___NR_perf_counter_open is not defined"
+ #endif
+ #endif
+ 
diff --git a/meta/recipes-kernel/sysprof/files/rmb-arm.patch b/meta/recipes-kernel/sysprof/files/rmb-arm.patch
index c53ac64..c4f9002 100644
--- a/meta/recipes-kernel/sysprof/files/rmb-arm.patch
+++ b/meta/recipes-kernel/sysprof/files/rmb-arm.patch
@@ -9,7 +9,7 @@ Index: git/util.h
  #define cpu_relax()     asm volatile("" ::: "memory");
  #endif
  
-+#ifdef __arm__
++#if defined(__arm__) || defined(__aarch64__)
 +/*
 + * Use the __kuser_memory_barrier helper in the CPU helper page. See
 + * arch/arm/kernel/entry-armv.S in the kernel source for details.
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index ef1e270..6e5e4cd 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -9,9 +9,11 @@ PV = "1.2.0+git${SRCPV}"
 
 SRC_URI = "git://git.gnome.org/sysprof \
            file://define-NT_GNU_BUILD_ID.patch \
+           file://collector_c.patch \
           "
 
 SRC_URI_append_arm  = " file://rmb-arm.patch"
+SRC_URI_append_aarch64  = " file://rmb-arm.patch"
 SRC_URI_append_mips = " file://rmb-mips.patch"
 SRC_URI_append_mips64 = " file://rmb-mips.patch"
 
-- 
1.7.3.4


