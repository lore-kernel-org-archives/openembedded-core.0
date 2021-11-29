Return-Path: <philippe.coval@astrolabe.coop>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E236C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 09:11:25 +0000 (UTC)
Received: from ynh.rzr.cloudns.org (ynh.rzr.cloudns.org [78.197.125.113])
 by mx.groups.io with SMTP id smtpd.web10.58670.1638177083540953974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 01:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: ynh.rzr.cloudns.org, ip: 78.197.125.113,
 mailfrom: rzr@ynh.rzr.cloudns.org)
From: philippe.coval@astrolabe.coop
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [PATCH] libunwind: Backport a fix for -fno-common option to compile
Date: Mon, 29 Nov 2021 09:11:13 +0000
Message-Id: <20211129091113.3553-1-philippe.coval@astrolabe.coop>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 09:11:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158932

From: Khem Raj <raj.khem@gmail.com>

[Khem Raj]
defaults for gcc is to use -fno-common this ensures that it keeps
building with gcc -fno-common

Fixes
src/arm/Ginit.c:60: multiple definition of `_U_dyn_info_list'; mi/.libs/d=
yn-info-list.o:/usr/src/debug/libunwind/1.4.0-r0/build/src/../../libunwin=
d-1.4.0/src/mi/dyn-info-list.c:28: first defined here

[Philippe Coval]

Change and related patch ported to dunfell branch on 1.3.1 version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Origin: https://github.com/openembedded/openembedded-core/commit/6cd2cf65=
25bcb241b3a2538e559fcef2a2084a7e
Relate-to: https://github.com/libunwind/libunwind/pull/312
Relate-to: https://booting.oniroproject.org/distro/oniro/-/issues/191
Change-Id: If34ea06e365f57b6007e9ea3da8d9d716e4b01cc
Cc: openembedded-core@lists.openembedded.org
Forwarded: https://lists.openembedded.org/g/openembedded-core/search?&q=3D=
philippe.coval
Last-Update: 2021-11-29
Signed-off-by: Philippe Coval <philippe.coval@huawei.com>
---
 ...0001-Fix-compilation-with-fno-common.patch | 420 ++++++++++++++++++
 .../libunwind/libunwind_1.3.1.bb              |   1 +
 2 files changed, 421 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-Fix-com=
pilation-with-fno-common.patch

diff --git a/meta/recipes-support/libunwind/libunwind/0001-Fix-compilatio=
n-with-fno-common.patch b/meta/recipes-support/libunwind/libunwind/0001-F=
ix-compilation-with-fno-common.patch
new file mode 100644
index 0000000000..34a1f46b0f
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-=
fno-common.patch
@@ -0,0 +1,420 @@
+From 51112447b316813ad1ae50ea66feca4eb755a424 Mon Sep 17 00:00:00 2001
+From: Yichao Yu <yyc1992@gmail.com>
+Date: Tue, 31 Mar 2020 00:43:32 -0400
+Subject: [PATCH] Fix compilation with -fno-common.
+
+[Khem Raj]
+Making all other archs consistent with IA64 which should not have this p=
roblem.
+Also move the FIXME to the correct place.
+
+Also add some minimum comments about this...
+
+[Philippe Coval]
+
+Patch ported to v1.3-stable branch,
+patch to be used used in openembedded-core dunfell branch (on v1.3.1)
+for oniro project.
+
+Upstream-Status: Backport [https://github.com/libunwind/libunwind/pull/1=
66]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Thanks-to: Yichao Yu <yyc1992@gmail.com>
+Origin: https://github.com/libunwind/libunwind/commit/29e17d8d2ccbca07c4=
23e3089a6d5ae8a1c9cb6e
+Relate-to: https://booting.oniroproject.org/distro/oniro/-/issues/191
+Forwarded: https://github.com/libunwind/libunwind/pull/312
+Last-Update: 2021-11-25
+Signed-off-by: Philippe Coval <philippe.coval@huawei.com>
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
+ src/sh/Ginit.c                             | 15 +++++++--------
+ src/tilegx/Ginit.c                         | 15 +++++++--------
+ src/x86/Ginit.c                            | 15 +++++++--------
+ src/x86_64/Ginit.c                         | 15 +++++++--------
+ 14 files changed, 82 insertions(+), 72 deletions(-)
+
+diff --git a/src/aarch64/Ginit.c b/src/aarch64/Ginit.c
+index 9c4eae82..cb954b15 100644
+--- a/src/aarch64/Ginit.c
++++ b/src/aarch64/Ginit.c
+@@ -61,13 +61,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+=20
+ # endif /* UNW_LOCAL_ONLY */
+=20
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void =
*arg)
+ {
+@@ -78,7 +71,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_=
addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr =3D (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
++  *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+=20
+diff --git a/src/arm/Ginit.c b/src/arm/Ginit.c
+index 2720d063..0bac0d72 100644
+--- a/src/arm/Ginit.c
++++ b/src/arm/Ginit.c
+@@ -57,18 +57,17 @@ tdep_uc_addr (unw_tdep_context_t *uc, int reg)
+=20
+ # endif /* UNW_LOCAL_ONLY */
+=20
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_=
addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr =3D (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
++  *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+=20
+diff --git a/src/coredump/_UPT_get_dyn_info_list_addr.c b/src/coredump/_=
UPT_get_dyn_info_list_addr.c
+index 0d119055..739ed056 100644
+--- a/src/coredump/_UPT_get_dyn_info_list_addr.c
++++ b/src/coredump/_UPT_get_dyn_info_list_addr.c
+@@ -74,6 +74,11 @@ get_list_addr (unw_addr_space_t as, unw_word_t *dil_a=
ddr, void *arg,
+=20
+ #else
+=20
++/* XXX fix me: there is currently no way to locate the dyn-info list
++       by a remote unwinder.  On ia64, this is done via a special
++       unwind-table entry.  Perhaps something similar can be done with
++       DWARF2 unwind info.  */
++
+ static inline int
+ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
+                int *countp)
+diff --git a/src/hppa/Ginit.c b/src/hppa/Ginit.c
+index 461e4b93..265455a6 100644
+--- a/src/hppa/Ginit.c
++++ b/src/hppa/Ginit.c
+@@ -64,13 +64,6 @@ _Uhppa_uc_addr (ucontext_t *uc, int reg)
+=20
+ # endif /* UNW_LOCAL_ONLY */
+=20
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void =
*arg)
+ {
+@@ -81,7 +74,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_=
addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr =3D (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
++  *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+=20
+diff --git a/src/ia64/Ginit.c b/src/ia64/Ginit.c
+index b09a2ad5..8601bb3c 100644
+--- a/src/ia64/Ginit.c
++++ b/src/ia64/Ginit.c
+@@ -68,6 +68,7 @@ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_=
t *dyn_info_list_addr,
+   if (!_U_dyn_info_list_addr)
+     return -UNW_ENOINFO;
+ #endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
+   *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+diff --git a/src/mi/Gfind_dynamic_proc_info.c b/src/mi/Gfind_dynamic_pro=
c_info.c
+index 98d35012..2e7c62e5 100644
+--- a/src/mi/Gfind_dynamic_proc_info.c
++++ b/src/mi/Gfind_dynamic_proc_info.c
+@@ -49,6 +49,7 @@ local_find_proc_info (unw_addr_space_t as, unw_word_t =
ip, unw_proc_info_t *pi,
+     return -UNW_ENOINFO;
+ #endif
+=20
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
+   list =3D (unw_dyn_info_list_t *) (uintptr_t) _U_dyn_info_list_addr ()=
;
+   for (di =3D list->first; di; di =3D di->next)
+     if (ip >=3D di->start_ip && ip < di->end_ip)
+diff --git a/src/mips/Ginit.c b/src/mips/Ginit.c
+index 3df170c7..bf7a8f5a 100644
+--- a/src/mips/Ginit.c
++++ b/src/mips/Ginit.c
+@@ -69,13 +69,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+=20
+ # endif /* UNW_LOCAL_ONLY */
+=20
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void =
*arg)
+ {
+@@ -86,7 +79,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_=
addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr =3D (unw_word_t) (intptr_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
++  *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+=20
+diff --git a/src/ppc32/Ginit.c b/src/ppc32/Ginit.c
+index ba302448..7b454558 100644
+--- a/src/ppc32/Ginit.c
++++ b/src/ppc32/Ginit.c
+@@ -91,9 +91,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+=20
+ # endif /* UNW_LOCAL_ONLY */
+=20
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void =
*arg)
+ {
+@@ -104,7 +101,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_=
addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr =3D (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
++  *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+=20
+diff --git a/src/ppc64/Ginit.c b/src/ppc64/Ginit.c
+index 4c88cd6e..7bfb395a 100644
+--- a/src/ppc64/Ginit.c
++++ b/src/ppc64/Ginit.c
+@@ -95,9 +95,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+=20
+ # endif /* UNW_LOCAL_ONLY */
+=20
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void =
*arg)
+ {
+@@ -108,7 +105,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_=
addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr =3D (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
++  *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+=20
+diff --git a/src/ptrace/_UPT_get_dyn_info_list_addr.c b/src/ptrace/_UPT_=
get_dyn_info_list_addr.c
+index cc5ed044..16671d45 100644
+--- a/src/ptrace/_UPT_get_dyn_info_list_addr.c
++++ b/src/ptrace/_UPT_get_dyn_info_list_addr.c
+@@ -71,6 +71,11 @@ get_list_addr (unw_addr_space_t as, unw_word_t *dil_a=
ddr, void *arg,
+=20
+ #else
+=20
++/* XXX fix me: there is currently no way to locate the dyn-info list
++       by a remote unwinder.  On ia64, this is done via a special
++       unwind-table entry.  Perhaps something similar can be done with
++       DWARF2 unwind info.  */
++
+ static inline int
+ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
+                int *countp)
+diff --git a/src/sh/Ginit.c b/src/sh/Ginit.c
+index 52988a72..9fe96d2b 100644
+--- a/src/sh/Ginit.c
++++ b/src/sh/Ginit.c
+@@ -58,13 +58,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+=20
+ # endif /* UNW_LOCAL_ONLY */
+=20
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void =
*arg)
+ {
+@@ -75,7 +68,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_=
addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr =3D (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
++  *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+=20
+diff --git a/src/tilegx/Ginit.c b/src/tilegx/Ginit.c
+index 7564a558..925e6413 100644
+--- a/src/tilegx/Ginit.c
++++ b/src/tilegx/Ginit.c
+@@ -64,13 +64,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+=20
+ # endif /* UNW_LOCAL_ONLY */
+=20
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void =
*arg)
+ {
+@@ -81,7 +74,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_=
addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr =3D (unw_word_t) (intptr_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
++  *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+=20
+diff --git a/src/x86/Ginit.c b/src/x86/Ginit.c
+index f6b8dc27..3cec74a2 100644
+--- a/src/x86/Ginit.c
++++ b/src/x86/Ginit.c
+@@ -54,13 +54,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+=20
+ # endif /* UNW_LOCAL_ONLY */
+=20
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void =
*arg)
+ {
+@@ -71,7 +64,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_=
addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr =3D (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
++  *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+=20
+diff --git a/src/x86_64/Ginit.c b/src/x86_64/Ginit.c
+index b7e8e462..fe6bcc33 100644
+--- a/src/x86_64/Ginit.c
++++ b/src/x86_64/Ginit.c
+@@ -49,13 +49,6 @@ static struct unw_addr_space local_addr_space;
+=20
+ unw_addr_space_t unw_local_addr_space =3D &local_addr_space;
+=20
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void =
*arg)
+ {
+@@ -66,7 +59,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_=
addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr =3D (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libu=
nwind.so.
++  *dyn_info_list_addr =3D _U_dyn_info_list_addr ();
+   return 0;
+ }
+=20
+--=20
+2.32.0
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.3.1.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.3.1.bb
index 037e04c3c0..8ae94a834c 100644
--- a/meta/recipes-support/libunwind/libunwind_1.3.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.3.1.bb
@@ -7,6 +7,7 @@ SRC_URI =3D "http://download.savannah.nongnu.org/releases=
/libunwind/libunwind-${PV
            file://0004-Fix-build-on-mips-musl.patch \
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-=
and.patch \
            file://0006-Fix-for-X32.patch \
+           file://0001-Fix-compilation-with-fno-common.patch \
            "
 SRC_URI_append_libc-musl =3D " file://musl-header-conflict.patch"
=20
--=20
2.20.1


