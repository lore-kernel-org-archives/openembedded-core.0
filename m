Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S9gvi-0008Sg-RK
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 19:03:39 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2JHsCYW011320;
	Mon, 19 Mar 2012 10:54:13 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 19 Mar 2012 13:53:57 -0400
Message-Id: <d1a3b4878911d3a345469985e01a31d6a649661e.1332179433.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332179433.git.bruce.ashfield@windriver.com>
References: <cover.1332179433.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1332179433.git.bruce.ashfield@windriver.com>
References: <cover.1332179433.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] lttng-modules: fix compliation error with 3.2.x -stable kernels
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2012 18:03:39 -0000

recent -stable kernels have their own fallback definition of is_compat_task

   #define is_compat_task() (0)

To protect against this double definition of is_compat_task we can check
to see if it is already defined, and skip the lttng variant.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...ls-protect-is_compat_task-from-redefiniti.patch |   41 ++++++++++++++++++++
 .../lttng-2.0/lttng-modules_2.0.pre11.bb           |    3 +-
 2 files changed, 43 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch b/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
new file mode 100644
index 0000000..0056633
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
@@ -0,0 +1,41 @@
+From 415a1a678cb2fcf603f9777f2c7b71c1e38f8101 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Mon, 19 Mar 2012 13:30:31 -0400
+Subject: [PATCH] lttng-sycalls: protect is_compat_task from redefinition
+
+recent -stable kernels have their own fallback definition of is_compat_task
+
+   #define is_compat_task() (0)
+
+To protect against this double definition of is_compat_task we can check
+to see if it is already defined, and skip the lttng variant.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ lttng-syscalls.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/lttng-syscalls.c b/lttng-syscalls.c
+index 9de3c07..80d0f05 100644
+--- a/lttng-syscalls.c
++++ b/lttng-syscalls.c
+@@ -17,12 +17,16 @@
+ #include "ltt-events.h"
+ 
+ #ifndef CONFIG_COMPAT
++
++#ifndef is_compat_task
+ static inline int is_compat_task(void)
+ {
+ 	return 0;
+ }
+ #endif
+ 
++#endif
++
+ static
+ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id);
+ 
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
index fa7bbec..4c78f36 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
@@ -15,7 +15,8 @@ PV = "2.0.pre11+git${SRCREV}"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
+           file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 export KERNEL_SRC="${STAGING_KERNEL_DIR}"
-- 
1.7.5.4



