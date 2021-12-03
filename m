Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6871C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:59 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.15503.1638555718859768039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ONe+d2lT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso3189523pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K1fvdgEoV/KtAjQ3/YSAxkxO/s1tN7wDcl/n6zAvRrk=;
        b=ONe+d2lT3BaJV5Avuzv2MWBWgmIXu5r+WTfDBsnNhD5uv0omckYbO4sXSj1SQYdcrQ
         Hc7iMAUT9lWXYbVQW04/o/hAtM/eAy26nXKBum4xQGjrHjlsYZ04cMwtWBL72r2TEbeI
         RUUOI3JAYJIzelo4xzh2cb0TJjlzz7rjYnQJGh5aMFVS0UHYQJoxaZTr9QH+yvpzEka3
         rJLnT6HEP0kQL2yPOJ/Mk6PcvQCwAD6vNzBe7svS4CxYDHuJ0zX6pfLEDpDnRY8bsuFo
         XMboVIdU0kOZK1ZhMOLXFMw3z7rqnu7KbF12Wlup798d87PDlAaWBekTL5H/8/P9eiXk
         ZqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K1fvdgEoV/KtAjQ3/YSAxkxO/s1tN7wDcl/n6zAvRrk=;
        b=KEHlZDlvYeKIPgKM+siPCTxHfDJX/V5va7oaBrWfwj6j6aUkwGGMCdcy2Y2n79MNh2
         xiTSNy0paME7NAzHJWcAiVByU3gF9Gdg8gn6PpPyXMnlCfnTV9UhKKe8ToB0uL6LD0sB
         qDmf8UecOpJJlujyHcimarc9oTtlCmm0pEVnYaOWnjIHAK6D/3Km0YY7QrDfUtIPo1Wo
         3lA4AojEXm2p7+NLShID53euCUPss1b8l0NTlL6qOPm7VNw10wcLfhCWxUpYgjzlBJt0
         cIaOrT2p//5DMXJGFyDmddtx2EFomyegL6g7Z3T3EcB4isIF6ZtiH0Gjx6YzopW32Biq
         idAg==
X-Gm-Message-State: AOAM530xsk5suWcMKl/K2tSgwYz8SOiJ0UWQ8caepqKYoJB9Xy7NXYbs
	yWARu99pSjgiUfl+Xc7vLxLHPOBbHBJBqZCNDX0=
X-Google-Smtp-Source: 
 ABdhPJzaHZvwfoVK8NsiySzGvXAERzdSqhY3mDg3JLpWRi6gQ72V79Xz3kINpemktwOcjx6VW1M6yg==
X-Received: by 2002:a17:902:c206:b0:142:631:5ffc with SMTP id
 6-20020a170902c20600b0014206315ffcmr24907120pll.38.1638555717658;
        Fri, 03 Dec 2021 10:21:57 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/18] libunwind: Backport a fix for -fno-common
 option to compile
Date: Fri,  3 Dec 2021 08:19:00 -1000
Message-Id: 
 <a99510ffa88498ede645d3c4711ec1f11d60265f.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159140

From: Khem Raj <raj.khem@gmail.com>

[Khem Raj]
defaults for gcc is to use -fno-common this ensures that it keeps
building with gcc -fno-common

Fixes
src/arm/Ginit.c:60: multiple definition of `_U_dyn_info_list'; mi/.libs/dyn-info-list.o:/usr/src/debug/libunwind/1.4.0-r0/build/src/../../libunwind-1.4.0/src/mi/dyn-info-list.c:28: first defined here

[Philippe Coval]

Change and related patch ported to dunfell branch on 1.3.1 version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Origin: https://github.com/openembedded/openembedded-core/commit/6cd2cf6525bcb241b3a2538e559fcef2a2084a7e
Signed-off-by: Philippe Coval <philippe.coval@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-Fix-compilation-with-fno-common.patch | 420 ++++++++++++++++++
 .../libunwind/libunwind_1.3.1.bb              |   1 +
 2 files changed, 421 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch

diff --git a/meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch b/meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch
new file mode 100644
index 0000000000..34a1f46b0f
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch
@@ -0,0 +1,420 @@
+From 51112447b316813ad1ae50ea66feca4eb755a424 Mon Sep 17 00:00:00 2001
+From: Yichao Yu <yyc1992@gmail.com>
+Date: Tue, 31 Mar 2020 00:43:32 -0400
+Subject: [PATCH] Fix compilation with -fno-common.
+
+[Khem Raj]
+Making all other archs consistent with IA64 which should not have this problem.
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
+Upstream-Status: Backport [https://github.com/libunwind/libunwind/pull/166]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Thanks-to: Yichao Yu <yyc1992@gmail.com>
+Origin: https://github.com/libunwind/libunwind/commit/29e17d8d2ccbca07c423e3089a6d5ae8a1c9cb6e
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
+index 2720d063..0bac0d72 100644
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
+index 0d119055..739ed056 100644
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
+index 461e4b93..265455a6 100644
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
+index b09a2ad5..8601bb3c 100644
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
+index 98d35012..2e7c62e5 100644
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
+index 3df170c7..bf7a8f5a 100644
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
+index ba302448..7b454558 100644
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
+index 4c88cd6e..7bfb395a 100644
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
+index cc5ed044..16671d45 100644
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
+diff --git a/src/sh/Ginit.c b/src/sh/Ginit.c
+index 52988a72..9fe96d2b 100644
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
+index 7564a558..925e6413 100644
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
+index f6b8dc27..3cec74a2 100644
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
+index b7e8e462..fe6bcc33 100644
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
+2.32.0
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.3.1.bb b/meta/recipes-support/libunwind/libunwind_1.3.1.bb
index 037e04c3c0..8ae94a834c 100644
--- a/meta/recipes-support/libunwind/libunwind_1.3.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.3.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            file://0004-Fix-build-on-mips-musl.patch \
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://0006-Fix-for-X32.patch \
+           file://0001-Fix-compilation-with-fno-common.patch \
            "
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
 
-- 
2.25.1


