Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TRmry-0002gn-Ml
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 18:34:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Oct 2012 09:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="211263496"
Received: from unknown (HELO localhost) ([10.255.14.211])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2012 09:21:17 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 11:21:16 -0500
Message-Id: <c4bbf28d8312ef6e6935c1e3c00186f8f8ffa059.1351268333.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1351268333.git.tom.zanussi@intel.com>
References: <cover.1351268333.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] lttng-modules: remove unused lttng-syscalls patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 16:34:51 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

commit b7e184508 (lttng-2.0: fix srcrev/pv to match the recipe
filenames) removed the
lttng-sycalls-protect-is_compat_task-from-redefiniti.patch from the
SRC_URI but forgot to remove the patch itself.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 ...ls-protect-is_compat_task-from-redefiniti.patch | 41 ----------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch b/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
deleted file mode 100644
index 0056633..0000000
--- a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 415a1a678cb2fcf603f9777f2c7b71c1e38f8101 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Mon, 19 Mar 2012 13:30:31 -0400
-Subject: [PATCH] lttng-sycalls: protect is_compat_task from redefinition
-
-recent -stable kernels have their own fallback definition of is_compat_task
-
-   #define is_compat_task() (0)
-
-To protect against this double definition of is_compat_task we can check
-to see if it is already defined, and skip the lttng variant.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- lttng-syscalls.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/lttng-syscalls.c b/lttng-syscalls.c
-index 9de3c07..80d0f05 100644
---- a/lttng-syscalls.c
-+++ b/lttng-syscalls.c
-@@ -17,12 +17,16 @@
- #include "ltt-events.h"
- 
- #ifndef CONFIG_COMPAT
-+
-+#ifndef is_compat_task
- static inline int is_compat_task(void)
- {
- 	return 0;
- }
- #endif
- 
-+#endif
-+
- static
- void syscall_entry_probe(void *__data, struct pt_regs *regs, long id);
- 
--- 
-1.7.5.4
-
-- 
1.7.11.4



