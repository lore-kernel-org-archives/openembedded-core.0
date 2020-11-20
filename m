Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.21733.1605854920794009604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 22:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,355,1599494400"; 
   d="scan'208";a="101578200"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 14:48:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0E4AF4CE5468
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 14:48:14 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 14:48:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libunwind: upgrade 1.4.0 -> 1.5.0
Date: Sat, 21 Nov 2020 00:29:18 +0800
Message-ID: <1605889758-38324-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0E4AF4CE5468.A7066
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Fix-compilation-with-fno-common.patch
0002-backtrace-Use-only-with-glibc-and-uclibc.patch
sigset_t.patch
Removed since these are included in 1.5.0

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...0001-Fix-compilation-with-fno-common.patch | 448 ------------------
 ...trace-Use-only-with-glibc-and-uclibc.patch |  45 --
 .../libunwind/libunwind/sigset_t.patch        |  28 --
 ...{libunwind_1.4.0.bb => libunwind_1.5.0.bb} |   7 +-
 4 files changed, 2 insertions(+), 526 deletions(-)
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0002-backtrace-Use-only-with-glibc-and-uclibc.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind/sigset_t.patch
 rename meta/recipes-support/libunwind/{libunwind_1.4.0.bb => libunwind_1.5.0.bb} (74%)

diff --git a/meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch b/meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch
deleted file mode 100644
index e11487fe97..0000000000
--- a/meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch
+++ /dev/null
@@ -1,448 +0,0 @@
-From 00d18b21dcb9723c4f13889a39a760a654782370 Mon Sep 17 00:00:00 2001
-From: Yichao Yu <yyc1992@gmail.com>
-Date: Tue, 31 Mar 2020 00:43:32 -0400
-Subject: [PATCH] Fix compilation with -fno-common.
-
-Making all other archs consistent with IA64 which should not have this problem.
-Also move the FIXME to the correct place.
-
-Also add some minimum comments about this...
-
-Upstream-Status: Backport [https://github.com/libunwind/libunwind/pull/166]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/aarch64/Ginit.c                        | 15 +++++++--------
- src/arm/Ginit.c                            | 15 +++++++--------
- src/coredump/_UPT_get_dyn_info_list_addr.c |  5 +++++
- src/hppa/Ginit.c                           | 15 +++++++--------
- src/ia64/Ginit.c                           |  1 +
- src/mi/Gfind_dynamic_proc_info.c           |  1 +
- src/mips/Ginit.c                           | 15 +++++++--------
- src/ppc32/Ginit.c                          | 11 +++++++----
- src/ppc64/Ginit.c                          | 11 +++++++----
- src/ptrace/_UPT_get_dyn_info_list_addr.c   |  5 +++++
- src/s390x/Ginit.c                          | 15 +++++++--------
- src/sh/Ginit.c                             | 15 +++++++--------
- src/tilegx/Ginit.c                         | 15 +++++++--------
- src/x86/Ginit.c                            | 15 +++++++--------
- src/x86_64/Ginit.c                         | 15 +++++++--------
- 15 files changed, 89 insertions(+), 80 deletions(-)
-
-diff --git a/src/aarch64/Ginit.c b/src/aarch64/Ginit.c
-index dec235c..3538976 100644
---- a/src/aarch64/Ginit.c
-+++ b/src/aarch64/Ginit.c
-@@ -61,13 +61,6 @@ tdep_uc_addr (unw_tdep_context_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -78,7 +71,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/arm/Ginit.c b/src/arm/Ginit.c
-index 2720d06..0bac0d7 100644
---- a/src/arm/Ginit.c
-+++ b/src/arm/Ginit.c
-@@ -57,18 +57,17 @@ tdep_uc_addr (unw_tdep_context_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/coredump/_UPT_get_dyn_info_list_addr.c b/src/coredump/_UPT_get_dyn_info_list_addr.c
-index 0d11905..739ed05 100644
---- a/src/coredump/_UPT_get_dyn_info_list_addr.c
-+++ b/src/coredump/_UPT_get_dyn_info_list_addr.c
-@@ -74,6 +74,11 @@ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
- 
- #else
- 
-+/* XXX fix me: there is currently no way to locate the dyn-info list
-+       by a remote unwinder.  On ia64, this is done via a special
-+       unwind-table entry.  Perhaps something similar can be done with
-+       DWARF2 unwind info.  */
-+
- static inline int
- get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
-                int *countp)
-diff --git a/src/hppa/Ginit.c b/src/hppa/Ginit.c
-index 461e4b9..265455a 100644
---- a/src/hppa/Ginit.c
-+++ b/src/hppa/Ginit.c
-@@ -64,13 +64,6 @@ _Uhppa_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -81,7 +74,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/ia64/Ginit.c b/src/ia64/Ginit.c
-index b09a2ad..8601bb3 100644
---- a/src/ia64/Ginit.c
-+++ b/src/ia64/Ginit.c
-@@ -68,6 +68,7 @@ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-   if (!_U_dyn_info_list_addr)
-     return -UNW_ENOINFO;
- #endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-   *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
-diff --git a/src/mi/Gfind_dynamic_proc_info.c b/src/mi/Gfind_dynamic_proc_info.c
-index 98d3501..2e7c62e 100644
---- a/src/mi/Gfind_dynamic_proc_info.c
-+++ b/src/mi/Gfind_dynamic_proc_info.c
-@@ -49,6 +49,7 @@ local_find_proc_info (unw_addr_space_t as, unw_word_t ip, unw_proc_info_t *pi,
-     return -UNW_ENOINFO;
- #endif
- 
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-   list = (unw_dyn_info_list_t *) (uintptr_t) _U_dyn_info_list_addr ();
-   for (di = list->first; di; di = di->next)
-     if (ip >= di->start_ip && ip < di->end_ip)
-diff --git a/src/mips/Ginit.c b/src/mips/Ginit.c
-index 3df170c..bf7a8f5 100644
---- a/src/mips/Ginit.c
-+++ b/src/mips/Ginit.c
-@@ -69,13 +69,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -86,7 +79,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) (intptr_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/ppc32/Ginit.c b/src/ppc32/Ginit.c
-index c5312d9..f8d6886 100644
---- a/src/ppc32/Ginit.c
-+++ b/src/ppc32/Ginit.c
-@@ -91,9 +91,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -104,7 +101,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/ppc64/Ginit.c b/src/ppc64/Ginit.c
-index 4c88cd6..7bfb395 100644
---- a/src/ppc64/Ginit.c
-+++ b/src/ppc64/Ginit.c
-@@ -95,9 +95,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -108,7 +105,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/ptrace/_UPT_get_dyn_info_list_addr.c b/src/ptrace/_UPT_get_dyn_info_list_addr.c
-index cc5ed04..16671d4 100644
---- a/src/ptrace/_UPT_get_dyn_info_list_addr.c
-+++ b/src/ptrace/_UPT_get_dyn_info_list_addr.c
-@@ -71,6 +71,11 @@ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
- 
- #else
- 
-+/* XXX fix me: there is currently no way to locate the dyn-info list
-+       by a remote unwinder.  On ia64, this is done via a special
-+       unwind-table entry.  Perhaps something similar can be done with
-+       DWARF2 unwind info.  */
-+
- static inline int
- get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
-                int *countp)
-diff --git a/src/s390x/Ginit.c b/src/s390x/Ginit.c
-index f0886ac..db01743 100644
---- a/src/s390x/Ginit.c
-+++ b/src/s390x/Ginit.c
-@@ -50,8 +50,6 @@ static struct unw_addr_space local_addr_space;
- 
- unw_addr_space_t unw_local_addr_space = &local_addr_space;
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
- static inline void *
- uc_addr (ucontext_t *uc, int reg)
- {
-@@ -75,11 +73,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -90,7 +83,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/sh/Ginit.c b/src/sh/Ginit.c
-index 52988a7..9fe96d2 100644
---- a/src/sh/Ginit.c
-+++ b/src/sh/Ginit.c
-@@ -58,13 +58,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -75,7 +68,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/tilegx/Ginit.c b/src/tilegx/Ginit.c
-index 7564a55..925e641 100644
---- a/src/tilegx/Ginit.c
-+++ b/src/tilegx/Ginit.c
-@@ -64,13 +64,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -81,7 +74,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) (intptr_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/x86/Ginit.c b/src/x86/Ginit.c
-index f6b8dc2..3cec74a 100644
---- a/src/x86/Ginit.c
-+++ b/src/x86/Ginit.c
-@@ -54,13 +54,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -71,7 +64,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/x86_64/Ginit.c b/src/x86_64/Ginit.c
-index 6161da6..5c4e426 100644
---- a/src/x86_64/Ginit.c
-+++ b/src/x86_64/Ginit.c
-@@ -49,13 +49,6 @@ static struct unw_addr_space local_addr_space;
- 
- unw_addr_space_t unw_local_addr_space = &local_addr_space;
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -66,7 +59,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
--- 
-2.28.0
-
diff --git a/meta/recipes-support/libunwind/libunwind/0002-backtrace-Use-only-with-glibc-and-uclibc.patch b/meta/recipes-support/libunwind/libunwind/0002-backtrace-Use-only-with-glibc-and-uclibc.patch
deleted file mode 100644
index 1b862dccb1..0000000000
--- a/meta/recipes-support/libunwind/libunwind/0002-backtrace-Use-only-with-glibc-and-uclibc.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From b61446add7ae1c041266c2fa5ba2f51cb3b65d35 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2015 06:44:07 +0000
-Subject: [PATCH 2/6] backtrace: Use only with glibc and uclibc
-
-backtrace API is glibc specific not linux specific
-so make it behave so.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test-coredump-unwind.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/test-coredump-unwind.c b/tests/test-coredump-unwind.c
-index 5349823..3b153cb 100644
---- a/tests/test-coredump-unwind.c
-+++ b/tests/test-coredump-unwind.c
-@@ -57,7 +57,9 @@
- #include <grp.h>
- 
- /* For SIGSEGV handler code */
-+#ifdef __GLIBC__
- #include <execinfo.h>
-+#endif
- #include <sys/ucontext.h>
- 
- #include <libunwind-coredump.h>
-@@ -238,11 +240,11 @@ void handle_sigsegv(int sig, siginfo_t *info, void *ucontext)
- 			ip);
- 
-   {
-+#ifdef __GLIBC__
-     /* glibc extension */
-     void *array[50];
-     int size;
-     size = backtrace(array, 50);
--#ifdef __linux__
-     backtrace_symbols_fd(array, size, 2);
- #endif
-   }
--- 
-2.20.1
-
diff --git a/meta/recipes-support/libunwind/libunwind/sigset_t.patch b/meta/recipes-support/libunwind/libunwind/sigset_t.patch
deleted file mode 100644
index 6baaa77db5..0000000000
--- a/meta/recipes-support/libunwind/libunwind/sigset_t.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5df1555828add4e256cb4bba49fffffc22127c34 Mon Sep 17 00:00:00 2001
-From: Dave Watson <dade.watson@gmail.com>
-Date: Wed, 27 May 2020 08:21:04 -0700
-Subject: [PATCH] aarch64: Fix __sigset build issue on muslC
-
-Described in issue #176.   Taken from Alpine Linux project.
-
-Change __sigset_t to sigset_t
-
-Upstream-Status: Backport [https://github.com/libunwind/libunwind/commit/5df1555828]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/libunwind-aarch64.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/libunwind-aarch64.h b/include/libunwind-aarch64.h
-index db01a9f69..d1bd8708f 100644
---- a/include/libunwind-aarch64.h
-+++ b/include/libunwind-aarch64.h
-@@ -202,7 +202,7 @@ typedef struct
- 	unsigned long uc_flags;
- 	struct ucontext *uc_link;
- 	stack_t uc_stack;
--	__sigset_t uc_sigmask;
-+	sigset_t uc_sigmask;
- 	struct unw_sigcontext uc_mcontext;
-   } unw_tdep_context_t;
- 
diff --git a/meta/recipes-support/libunwind/libunwind_1.4.0.bb b/meta/recipes-support/libunwind/libunwind_1.5.0.bb
similarity index 74%
rename from meta/recipes-support/libunwind/libunwind_1.4.0.bb
rename to meta/recipes-support/libunwind/libunwind_1.5.0.bb
index 2193bd8315..089c4064f4 100644
--- a/meta/recipes-support/libunwind/libunwind_1.4.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.5.0.bb
@@ -2,18 +2,15 @@ require libunwind.inc
 
 SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV}.tar.gz \
            file://0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
-           file://0002-backtrace-Use-only-with-glibc-and-uclibc.patch \
            file://0003-x86-Stub-out-x86_local_resume.patch \
            file://0004-Fix-build-on-mips-musl.patch \
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://0006-Fix-for-X32.patch \
-           file://sigset_t.patch \
-           file://0001-Fix-compilation-with-fno-common.patch \
            "
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
 
-SRC_URI[md5sum] = "5114504c74ac3992ac06aa551cd55678"
-SRC_URI[sha256sum] = "df59c931bd4d7ebfd83ee481c943edf015138089b8e50abed8d9c57ba9338435"
+SRC_URI[md5sum] = "c6923dda0675f6a4ef21426164dc8b6a"
+SRC_URI[sha256sum] = "90337653d92d4a13de590781371c604f9031cdb50520366aa1e3a91e1efb1017"
 
 EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests --enable-static"
 
-- 
2.25.1



