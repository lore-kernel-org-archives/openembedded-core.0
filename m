Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.992.1596646339219144936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 09:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UzJrEEGb;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id m8so16183632pfh.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vhdk06Mh3oWxhaW38NO+zU4FTPRTZcyD0MprBUO1DIE=;
        b=UzJrEEGbp4+TcjDf46fA4am+II4mqUGPCN5mT/GRmoHsLfH9XCySBCisluVBrqQ1n4
         Hjxvw3X6AMtct1lNoS3E+lOqz0vlpAt/4C2/C9DXBN496Sy56Lrij2xsRqMPaey9tEVR
         lFy3k+zkwGA4RkBRyXrxf2O0130J+DdyI7CvFEeKfHHgUBVeVQChG9EMBPPTtlRDJx0S
         UX7EL8/VqxafxVEDRfl0HAQuCxQ+guuugRXN59D6CwPGYGGfSoe3rHMq6Vt6K327sULU
         ifWxMixRdUbA8Y49icEpZj9CwGd0hfNRBm0llxzP49w3Z1+vMprdKm+vUXm4keDX+4jS
         mZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vhdk06Mh3oWxhaW38NO+zU4FTPRTZcyD0MprBUO1DIE=;
        b=G59UEGJ7d1+hq191XVRTs2UaescpSIv24ruhSORjpr7O73dXTFPvyNbsjL5yYwgYVA
         3DASehw0b0DDTC/wjOo+YIgZ4z2MQvIFapIvbB8rXZRa62TOl8eIUQJH0JE3ZgBu8K5c
         iwuKApnp6FDLqSqkr5UvFta7W027PIcqdyencPNGWCkO6RCdXyUN+wM7rdHxq5H4ZjBG
         kcIgH+b0D3PyP45ldphmhdkf/motazCyNMHE6uyRDiRxvq68DeE9LuKce/ELtAI9xB5s
         v8eecuYLAzeG8dWL0J2tWtM7y7T4ssEuIq2WIHyQgHuUWCuJ+c1A3BsR7zFW5EQupiBJ
         +QvQ==
X-Gm-Message-State: AOAM532UtQyaU2RxCORvuHND8qZ0vvMahMy3WwKN48MfPWs43o42aubJ
	WfqwmvWEB5mI7oUNwBLdxg7IDdAEBFY=
X-Google-Smtp-Source: ABdhPJyvVE8MK9WuzzOstWwaErHXq8VCzlVyXUj1Ix8hz+Nn86p6622owkoa0KbCEV1xJdCZnv+dxw==
X-Received: by 2002:a63:8ec8:: with SMTP id k191mr3783105pge.154.1596646337729;
        Wed, 05 Aug 2020 09:52:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id y10sm4327990pff.177.2020.08.05.09.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 09:52:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2] libunwind: Backport a fix for -fno-common option to compile
Date: Wed,  5 Aug 2020 09:52:15 -0700
Message-Id: <20200805165215.4127035-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

defaults for gcc is to use -fno-common this ensures that it keeps
building with gcc -fno-common

Fixes
src/arm/Ginit.c:60: multiple definition of `_U_dyn_info_list'; mi/.libs/dyn-info-list.o:/usr/src/debug/libunwind/1.4.0-r0/build/src/../../libunwind-1.4.0/src/mi/dyn-info-list.c:28: first defined here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use a backported patch instead of using -fcommon

 ...0001-Fix-compilation-with-fno-common.patch | 448 ++++++++++++++++++
 .../libunwind/libunwind_1.4.0.bb              |   1 +
 2 files changed, 449 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch

diff --git a/meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch b/meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch
new file mode 100644
index 0000000000..e11487fe97
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch
@@ -0,0 +1,448 @@
+From 00d18b21dcb9723c4f13889a39a760a654782370 Mon Sep 17 00:00:00 2001
+From: Yichao Yu <yyc1992@gmail.com>
+Date: Tue, 31 Mar 2020 00:43:32 -0400
+Subject: [PATCH] Fix compilation with -fno-common.
+
+Making all other archs consistent with IA64 which should not have this problem.
+Also move the FIXME to the correct place.
+
+Also add some minimum comments about this...
+
+Upstream-Status: Backport [https://github.com/libunwind/libunwind/pull/166]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/aarch64/Ginit.c                        | 15 +++++++--------
+ src/arm/Ginit.c                            | 15 +++++++--------
+ src/coredump/_UPT_get_dyn_info_list_addr.c |  5 +++++
+ src/hppa/Ginit.c                           | 15 +++++++--------
+ src/ia64/Ginit.c                           |  1 +
+ src/mi/Gfind_dynamic_proc_info.c           |  1 +
+ src/mips/Ginit.c                           | 15 +++++++--------
+ src/ppc32/Ginit.c                          | 11 +++++++----
+ src/ppc64/Ginit.c                          | 11 +++++++----
+ src/ptrace/_UPT_get_dyn_info_list_addr.c   |  5 +++++
+ src/s390x/Ginit.c                          | 15 +++++++--------
+ src/sh/Ginit.c                             | 15 +++++++--------
+ src/tilegx/Ginit.c                         | 15 +++++++--------
+ src/x86/Ginit.c                            | 15 +++++++--------
+ src/x86_64/Ginit.c                         | 15 +++++++--------
+ 15 files changed, 89 insertions(+), 80 deletions(-)
+
+diff --git a/src/aarch64/Ginit.c b/src/aarch64/Ginit.c
+index dec235c..3538976 100644
+--- a/src/aarch64/Ginit.c
++++ b/src/aarch64/Ginit.c
+@@ -61,13 +61,6 @@ tdep_uc_addr (unw_tdep_context_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -78,7 +71,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/arm/Ginit.c b/src/arm/Ginit.c
+index 2720d06..0bac0d7 100644
+--- a/src/arm/Ginit.c
++++ b/src/arm/Ginit.c
+@@ -57,18 +57,17 @@ tdep_uc_addr (unw_tdep_context_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/coredump/_UPT_get_dyn_info_list_addr.c b/src/coredump/_UPT_get_dyn_info_list_addr.c
+index 0d11905..739ed05 100644
+--- a/src/coredump/_UPT_get_dyn_info_list_addr.c
++++ b/src/coredump/_UPT_get_dyn_info_list_addr.c
+@@ -74,6 +74,11 @@ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
+ 
+ #else
+ 
++/* XXX fix me: there is currently no way to locate the dyn-info list
++       by a remote unwinder.  On ia64, this is done via a special
++       unwind-table entry.  Perhaps something similar can be done with
++       DWARF2 unwind info.  */
++
+ static inline int
+ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
+                int *countp)
+diff --git a/src/hppa/Ginit.c b/src/hppa/Ginit.c
+index 461e4b9..265455a 100644
+--- a/src/hppa/Ginit.c
++++ b/src/hppa/Ginit.c
+@@ -64,13 +64,6 @@ _Uhppa_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -81,7 +74,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/ia64/Ginit.c b/src/ia64/Ginit.c
+index b09a2ad..8601bb3 100644
+--- a/src/ia64/Ginit.c
++++ b/src/ia64/Ginit.c
+@@ -68,6 +68,7 @@ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+   if (!_U_dyn_info_list_addr)
+     return -UNW_ENOINFO;
+ #endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
+   *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+diff --git a/src/mi/Gfind_dynamic_proc_info.c b/src/mi/Gfind_dynamic_proc_info.c
+index 98d3501..2e7c62e 100644
+--- a/src/mi/Gfind_dynamic_proc_info.c
++++ b/src/mi/Gfind_dynamic_proc_info.c
+@@ -49,6 +49,7 @@ local_find_proc_info (unw_addr_space_t as, unw_word_t ip, unw_proc_info_t *pi,
+     return -UNW_ENOINFO;
+ #endif
+ 
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
+   list = (unw_dyn_info_list_t *) (uintptr_t) _U_dyn_info_list_addr ();
+   for (di = list->first; di; di = di->next)
+     if (ip >= di->start_ip && ip < di->end_ip)
+diff --git a/src/mips/Ginit.c b/src/mips/Ginit.c
+index 3df170c..bf7a8f5 100644
+--- a/src/mips/Ginit.c
++++ b/src/mips/Ginit.c
+@@ -69,13 +69,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -86,7 +79,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) (intptr_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/ppc32/Ginit.c b/src/ppc32/Ginit.c
+index c5312d9..f8d6886 100644
+--- a/src/ppc32/Ginit.c
++++ b/src/ppc32/Ginit.c
+@@ -91,9 +91,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -104,7 +101,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/ppc64/Ginit.c b/src/ppc64/Ginit.c
+index 4c88cd6..7bfb395 100644
+--- a/src/ppc64/Ginit.c
++++ b/src/ppc64/Ginit.c
+@@ -95,9 +95,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -108,7 +105,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/ptrace/_UPT_get_dyn_info_list_addr.c b/src/ptrace/_UPT_get_dyn_info_list_addr.c
+index cc5ed04..16671d4 100644
+--- a/src/ptrace/_UPT_get_dyn_info_list_addr.c
++++ b/src/ptrace/_UPT_get_dyn_info_list_addr.c
+@@ -71,6 +71,11 @@ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
+ 
+ #else
+ 
++/* XXX fix me: there is currently no way to locate the dyn-info list
++       by a remote unwinder.  On ia64, this is done via a special
++       unwind-table entry.  Perhaps something similar can be done with
++       DWARF2 unwind info.  */
++
+ static inline int
+ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
+                int *countp)
+diff --git a/src/s390x/Ginit.c b/src/s390x/Ginit.c
+index f0886ac..db01743 100644
+--- a/src/s390x/Ginit.c
++++ b/src/s390x/Ginit.c
+@@ -50,8 +50,6 @@ static struct unw_addr_space local_addr_space;
+ 
+ unw_addr_space_t unw_local_addr_space = &local_addr_space;
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+ static inline void *
+ uc_addr (ucontext_t *uc, int reg)
+ {
+@@ -75,11 +73,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -90,7 +83,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/sh/Ginit.c b/src/sh/Ginit.c
+index 52988a7..9fe96d2 100644
+--- a/src/sh/Ginit.c
++++ b/src/sh/Ginit.c
+@@ -58,13 +58,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -75,7 +68,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/tilegx/Ginit.c b/src/tilegx/Ginit.c
+index 7564a55..925e641 100644
+--- a/src/tilegx/Ginit.c
++++ b/src/tilegx/Ginit.c
+@@ -64,13 +64,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -81,7 +74,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) (intptr_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/x86/Ginit.c b/src/x86/Ginit.c
+index f6b8dc2..3cec74a 100644
+--- a/src/x86/Ginit.c
++++ b/src/x86/Ginit.c
+@@ -54,13 +54,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -71,7 +64,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/x86_64/Ginit.c b/src/x86_64/Ginit.c
+index 6161da6..5c4e426 100644
+--- a/src/x86_64/Ginit.c
++++ b/src/x86_64/Ginit.c
+@@ -49,13 +49,6 @@ static struct unw_addr_space local_addr_space;
+ 
+ unw_addr_space_t unw_local_addr_space = &local_addr_space;
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -66,7 +59,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+-- 
+2.28.0
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.4.0.bb b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
index 34c2249e91..2193bd8315 100644
--- a/meta/recipes-support/libunwind/libunwind_1.4.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://0006-Fix-for-X32.patch \
            file://sigset_t.patch \
+           file://0001-Fix-compilation-with-fno-common.patch \
            "
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
 
-- 
2.28.0

