Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3016279BA6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 03:01:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0C311ad013447
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 19:01:01 -0800 (PST)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 11 Jan 2019 19:01:00 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Jan 2019 22:00:51 -0500
Message-ID: <20190112030051.24130-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] strace: update from 4.25 to 4.26
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
X-List-Received-Date: Sat, 12 Jan 2019 03:01:01 -0000
Content-Type: text/plain

Refresh patches using devtool.
Update license since the main code is now covered by
LGPL-2.1+ and the tests under GPL-2.
Fix a MIPS build error with an upstream patch.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...sing-non-glibc-libc-implementation-o.patch | 10 +-
 ...0001-caps-abbrev.awk-fix-gawk-s-path.patch | 12 +--
 .../strace/0001-mips-o32-fix-build.patch      | 98 +++++++++++++++++++
 ...Check-for-mips-and-alpha-before-usin.patch | 12 +--
 .../strace/strace/Makefile-ptest.patch        |  8 +-
 .../strace/disable-git-version-gen.patch      |  6 +-
 .../strace/strace/mips-SIGEMT.patch           | 19 +++-
 ...st-test-for-m32-mx32-compile-support.patch | 15 +--
 .../strace/strace/update-gawk-paths.patch     | 29 +++---
 .../strace/{strace_4.25.bb => strace_4.26.bb} |  9 +-
 10 files changed, 160 insertions(+), 58 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch
 rename meta/recipes-devtools/strace/{strace_4.25.bb => strace_4.26.bb} (86%)

diff --git a/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch b/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
index 7f59210ca9..daafceb37b 100644
--- a/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
+++ b/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
@@ -1,4 +1,4 @@
-From 1f0c22b79045cfcdc976643f383c1d09589d3087 Mon Sep 17 00:00:00 2001
+From af1fdce78bff4343f3c84ea118abdc3c739fc646 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 16:23:56 +0000
 Subject: [PATCH] Fix build when using non-glibc libc implementation on ppc
@@ -8,15 +8,16 @@ musl does not
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  ptrace.h | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/ptrace.h b/ptrace.h
-index d8af976..4978a69 100644
+index 89d4b95..b3f45bb 100644
 --- a/ptrace.h
 +++ b/ptrace.h
-@@ -52,7 +52,13 @@ extern long ptrace(int, int, char *, long);
+@@ -30,7 +30,13 @@
  # define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
  #endif
  
@@ -31,6 +32,3 @@ index d8af976..4978a69 100644
  
  #ifdef HAVE_STRUCT_IA64_FPREG
  # undef ia64_fpreg
--- 
-1.8.3.1
-
diff --git a/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch b/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
index 4f13706161..52d2cdcdc5 100644
--- a/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
+++ b/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
@@ -1,4 +1,4 @@
-From 83757523c50748ea845c1e220b1c3b2080d3cc49 Mon Sep 17 00:00:00 2001
+From d225aaa8841f47ba8aa7b353b0ac3028d5913efe Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 9 Feb 2017 01:27:49 -0800
 Subject: [PATCH] caps-abbrev.awk: fix gawk's path
@@ -8,6 +8,7 @@ It should be /usr/bin/gawk as other scripts use in this package.
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
  tests-m32/caps-abbrev.awk  | 2 +-
  tests-mx32/caps-abbrev.awk | 2 +-
@@ -15,7 +16,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
-index 86de7f2..0535cac 100644
+index c00023b..a56cd56 100644
 --- a/tests-m32/caps-abbrev.awk
 +++ b/tests-m32/caps-abbrev.awk
 @@ -1,4 +1,4 @@
@@ -25,7 +26,7 @@ index 86de7f2..0535cac 100644
  # This file is part of caps strace test.
  #
 diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
-index 86de7f2..0535cac 100644
+index c00023b..a56cd56 100644
 --- a/tests-mx32/caps-abbrev.awk
 +++ b/tests-mx32/caps-abbrev.awk
 @@ -1,4 +1,4 @@
@@ -35,7 +36,7 @@ index 86de7f2..0535cac 100644
  # This file is part of caps strace test.
  #
 diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
-index 86de7f2..0535cac 100644
+index c00023b..a56cd56 100644
 --- a/tests/caps-abbrev.awk
 +++ b/tests/caps-abbrev.awk
 @@ -1,4 +1,4 @@
@@ -44,6 +45,3 @@ index 86de7f2..0535cac 100644
  #
  # This file is part of caps strace test.
  #
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch b/meta/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch
new file mode 100644
index 0000000000..a5dccfb08c
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch
@@ -0,0 +1,98 @@
+From 2c8b6de913973274e877639658e9e7273a012adb Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Tue, 8 Jan 2019 19:23:44 +0000
+Subject: [PATCH] mips o32: fix build
+
+Upstream-Status: Backport
+
+Commit 917c2ccf3a67 "Refactor stack pointers" moved mips_REG_* macros
+from linux/mips/arch_regs.h to linux/mips/arch_regs.c because these
+macros are no longer used outside syscall.c or files included by
+syscall.c, but this caused a build regression on mips o32 because
+decode_syscall_subcall() uses mips_REG_SP prior to its definition.
+
+* syscall.c (decode_syscall_subcall): Move ...
+* linux/mips/get_syscall_args.c: ... here.
+
+Reported-by: Baruch Siach <baruch@tkos.co.il>
+Fixes: v4.26~61 "Refactor stack pointers"
+---
+ linux/mips/get_syscall_args.c | 26 ++++++++++++++++++++++++++
+ syscall.c                     | 27 ++-------------------------
+ 2 files changed, 29 insertions(+), 25 deletions(-)
+
+diff --git a/linux/mips/get_syscall_args.c b/linux/mips/get_syscall_args.c
+index 387aa852..e2889f98 100644
+--- a/linux/mips/get_syscall_args.c
++++ b/linux/mips/get_syscall_args.c
+@@ -37,3 +37,29 @@ arch_get_syscall_args(struct tcb *tcp)
+ #endif
+ 	return 1;
+ }
++
++#ifdef SYS_syscall_subcall
++static void
++decode_syscall_subcall(struct tcb *tcp)
++{
++	if (!scno_is_valid(tcp->u_arg[0]))
++		return;
++	tcp->scno = tcp->u_arg[0];
++	tcp->qual_flg = qual_flags(tcp->scno);
++	tcp->s_ent = &sysent[tcp->scno];
++	memmove(&tcp->u_arg[0], &tcp->u_arg[1],
++		sizeof(tcp->u_arg) - sizeof(tcp->u_arg[0]));
++	/*
++	 * Fetching the last arg of 7-arg syscalls (fadvise64_64
++	 * and sync_file_range) requires additional code,
++	 * see linux/mips/get_syscall_args.c
++	 */
++	if (tcp->s_ent->nargs == MAX_ARGS) {
++		if (umoven(tcp,
++			   mips_REG_SP + MAX_ARGS * sizeof(tcp->u_arg[0]),
++			   sizeof(tcp->u_arg[0]),
++			   &tcp->u_arg[MAX_ARGS - 1]) < 0)
++		tcp->u_arg[MAX_ARGS - 1] = 0;
++	}
++}
++#endif /* SYS_syscall_subcall */
+diff --git a/syscall.c b/syscall.c
+index d78f51dd..51fcc721 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -349,31 +349,8 @@ decode_ipc_subcall(struct tcb *tcp)
+ #endif /* SYS_ipc_subcall */
+ 
+ #ifdef SYS_syscall_subcall
+-static void
+-decode_syscall_subcall(struct tcb *tcp)
+-{
+-	if (!scno_is_valid(tcp->u_arg[0]))
+-		return;
+-	tcp->scno = tcp->u_arg[0];
+-	tcp->qual_flg = qual_flags(tcp->scno);
+-	tcp->s_ent = &sysent[tcp->scno];
+-	memmove(&tcp->u_arg[0], &tcp->u_arg[1],
+-		sizeof(tcp->u_arg) - sizeof(tcp->u_arg[0]));
+-# ifdef LINUX_MIPSO32
+-	/*
+-	 * Fetching the last arg of 7-arg syscalls (fadvise64_64
+-	 * and sync_file_range) requires additional code,
+-	 * see linux/mips/get_syscall_args.c
+-	 */
+-	if (tcp->s_ent->nargs == MAX_ARGS) {
+-		if (umoven(tcp,
+-			   mips_REG_SP + MAX_ARGS * sizeof(tcp->u_arg[0]),
+-			   sizeof(tcp->u_arg[0]),
+-			   &tcp->u_arg[MAX_ARGS - 1]) < 0)
+-		tcp->u_arg[MAX_ARGS - 1] = 0;
+-	}
+-# endif /* LINUX_MIPSO32 */
+-}
++/* The implementation is architecture specific.  */
++static void decode_syscall_subcall(struct tcb *);
+ #endif /* SYS_syscall_subcall */
+ 
+ static void
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch b/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
index 52096b28cf..b17dcb1d46 100644
--- a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
+++ b/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
@@ -1,4 +1,4 @@
-From 9f3fd388ae7c46420bccba405468690ed46d669a Mon Sep 17 00:00:00 2001
+From 879ae71c472ce522f1b3514d2abf6ad49b4acc07 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 18 Sep 2017 22:51:32 -0700
 Subject: [PATCH] tests/sigaction: Check for mips and alpha before using
@@ -13,17 +13,16 @@ Fixes
 |  # define SA_RESTORER_ARGS , new_act->restorer
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
 
+---
  tests/sigaction.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/sigaction.c b/tests/sigaction.c
-index 7b46944..f46cda7 100644
+index 95be197..54819f9 100644
 --- a/tests/sigaction.c
 +++ b/tests/sigaction.c
-@@ -170,7 +170,7 @@ main(void)
+@@ -156,7 +156,7 @@ main(void)
  	sigdelset(mask.libc, SIGHUP);
  
  	memcpy(new_act->mask, mask.old, sizeof(mask.old));
@@ -32,6 +31,3 @@ index 7b46944..f46cda7 100644
  	new_act->flags = SA_RESTORER;
  	new_act->restorer = (unsigned long) 0xdeadfacecafef00dULL;
  # define SA_RESTORER_FMT ", sa_flags=SA_RESTORER, sa_restorer=%#lx"
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 460b6e26ee..08fa5c53b8 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 207fc7814bbeb0241382329215d21fd3b57066f9 Mon Sep 17 00:00:00 2001
+From ef5040b4f15006a22ac63a3bacfceac36ffc2045 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -14,10 +14,10 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 19 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index a2f3950..4fa97e2 100644
+index 825c989..4623c48 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -34,6 +34,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
+@@ -14,6 +14,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
  MPERS_NAME =
  MPERS_CC_FLAGS =
  ARCH_MFLAGS =
@@ -25,7 +25,7 @@ index a2f3950..4fa97e2 100644
  AM_CFLAGS = $(WARN_CFLAGS)
  AM_CPPFLAGS = $(ARCH_MFLAGS) \
  	      -I$(builddir) \
-@@ -490,3 +491,21 @@ BUILT_SOURCES = ksysent.h
+@@ -477,3 +478,21 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../scno.am
diff --git a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
index 9e5ec11097..d6354bf4b6 100644
--- a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
+++ b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
@@ -1,4 +1,4 @@
-From bee0680754730498485e24dd037303318c68916c Mon Sep 17 00:00:00 2001
+From ed30a4fc4dc264ce5f5881462e03ae13c921bfed Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 13:33:50 -0800
 Subject: [PATCH] strace: remove need for scripts
@@ -16,10 +16,10 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ad1d00f..96fa205 100644
+index 8045ebd..4319709 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -32,12 +32,12 @@
+@@ -12,12 +12,12 @@
  
  AC_PREREQ(2.57)
  AC_INIT([strace],
diff --git a/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch b/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch
index b24378bfee..0d3192b345 100644
--- a/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch
+++ b/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch
@@ -1,3 +1,8 @@
+From 20c184a7ab3fb7be67fb7626c411e756ea61d2f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Aug 2016 23:47:57 -0700
+Subject: [PATCH] strace: Fix build with mips/mips64 on musl
+
 SIGEMT is not defined everywhere e.g musl does
 not define it. Therefore check it being defined
 before using it.
@@ -8,11 +13,15 @@ Fixes errors e.g.
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: strace-4.13/tests/signal2name.c
-===================================================================
---- strace-4.13.orig/tests/signal2name.c
-+++ strace-4.13/tests/signal2name.c
-@@ -42,7 +42,9 @@ signal2name(int sig)
+---
+ tests/signal2name.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/signal2name.c b/tests/signal2name.c
+index 1d8e7c5..6722aa1 100644
+--- a/tests/signal2name.c
++++ b/tests/signal2name.c
+@@ -49,7 +49,9 @@ signal2name(int sig)
  	CASE(SIGEMT);
  	CASE(SIGLOST);
  #elif defined MIPS
diff --git a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
index 3d4913d68e..a9bd900da8 100644
--- a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
+++ b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
@@ -1,4 +1,4 @@
-From 154af50ed7ed8b91838d713052ebf29b0b14f765 Mon Sep 17 00:00:00 2001
+From cc97307e8e39a81999c6a365d057487a02e6128e Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:00:00 -0800
 Subject: [PATCH] mpers.m4: more robust test for -m32/-mx32 compile support
@@ -18,15 +18,16 @@ detects the limitations of the OE toolchain.
 Upstream-Status: Pending
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
  m4/mpers.m4 | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: strace-4.22/m4/mpers.m4
-===================================================================
---- strace-4.22.orig/m4/mpers.m4
-+++ strace-4.22/m4/mpers.m4
-@@ -108,6 +108,7 @@ case "$arch" in
+diff --git a/m4/mpers.m4 b/m4/mpers.m4
+index 13725d7..d8578ea 100644
+--- a/m4/mpers.m4
++++ b/m4/mpers.m4
+@@ -88,6 +88,7 @@ case "$arch" in
  	CFLAGS="$CFLAGS MPERS_CFLAGS $IFLAG"
  	AC_CACHE_CHECK([for mpers_name personality compile support], [st_cv_cc],
  		[AC_COMPILE_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
@@ -34,7 +35,7 @@ Index: strace-4.22/m4/mpers.m4
  						     int main(){return 0;}]])],
  				   [st_cv_cc=yes],
  				   [st_cv_cc=no])])
-@@ -115,6 +116,7 @@ case "$arch" in
+@@ -95,6 +96,7 @@ case "$arch" in
  		AC_CACHE_CHECK([for mpers_name personality runtime support],
  			[st_cv_runtime],
  			[AC_RUN_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index f6ffa8e7a8..7077048c75 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 3836518c46bd5bb3e71371b1b18274bf2d487133 Mon Sep 17 00:00:00 2001
+From f0d7ebf48441e0b090c3e6053b8c845d0a4a3b18 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
@@ -11,6 +11,7 @@ from #!/bin/gawk to #!/usr/bin/gawk. Fixes missing RDPENDS QA tests:
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
  mpers.awk                   | 2 +-
  tests-m32/caps.awk          | 2 +-
@@ -25,7 +26,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  10 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/mpers.awk b/mpers.awk
-index fe54763..b5238a8 100644
+index 17f8f2b..d69dcd5 100644
 --- a/mpers.awk
 +++ b/mpers.awk
 @@ -1,4 +1,4 @@
@@ -35,7 +36,7 @@ index fe54763..b5238a8 100644
  # Copyright (c) 2015 Elvira Khabirova <lineprinter0@gmail.com>
  # Copyright (c) 2015-2016 Dmitry V. Levin <ldv@altlinux.org>
 diff --git a/tests-m32/caps.awk b/tests-m32/caps.awk
-index c6e31ef..5efc6cc 100644
+index 941564a..0bcc3ff 100644
 --- a/tests-m32/caps.awk
 +++ b/tests-m32/caps.awk
 @@ -1,4 +1,4 @@
@@ -45,17 +46,17 @@ index c6e31ef..5efc6cc 100644
  # This file is part of caps strace test.
  #
 diff --git a/tests-m32/match.awk b/tests-m32/match.awk
-index abfbae9..f2740bf 100644
+index d91c518..ee5d908 100644
 --- a/tests-m32/match.awk
 +++ b/tests-m32/match.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2014-2018 Dmitry V. Levin <ldv@altlinux.org>
  # All rights reserved.
 diff --git a/tests-m32/rt_sigaction.awk b/tests-m32/rt_sigaction.awk
-index 9c3a9ed..8414243 100644
+index 81dd813..9cd9549 100644
 --- a/tests-m32/rt_sigaction.awk
 +++ b/tests-m32/rt_sigaction.awk
 @@ -1,4 +1,4 @@
@@ -65,7 +66,7 @@ index 9c3a9ed..8414243 100644
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
 diff --git a/tests-mx32/caps.awk b/tests-mx32/caps.awk
-index c6e31ef..5efc6cc 100644
+index 941564a..0bcc3ff 100644
 --- a/tests-mx32/caps.awk
 +++ b/tests-mx32/caps.awk
 @@ -1,4 +1,4 @@
@@ -75,17 +76,17 @@ index c6e31ef..5efc6cc 100644
  # This file is part of caps strace test.
  #
 diff --git a/tests-mx32/match.awk b/tests-mx32/match.awk
-index abfbae9..f2740bf 100644
+index d91c518..ee5d908 100644
 --- a/tests-mx32/match.awk
 +++ b/tests-mx32/match.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2014-2018 Dmitry V. Levin <ldv@altlinux.org>
  # All rights reserved.
 diff --git a/tests-mx32/rt_sigaction.awk b/tests-mx32/rt_sigaction.awk
-index 9c3a9ed..8414243 100644
+index 81dd813..9cd9549 100644
 --- a/tests-mx32/rt_sigaction.awk
 +++ b/tests-mx32/rt_sigaction.awk
 @@ -1,4 +1,4 @@
@@ -95,7 +96,7 @@ index 9c3a9ed..8414243 100644
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
 diff --git a/tests/caps.awk b/tests/caps.awk
-index c6e31ef..5efc6cc 100644
+index 941564a..0bcc3ff 100644
 --- a/tests/caps.awk
 +++ b/tests/caps.awk
 @@ -1,4 +1,4 @@
@@ -105,17 +106,17 @@ index c6e31ef..5efc6cc 100644
  # This file is part of caps strace test.
  #
 diff --git a/tests/match.awk b/tests/match.awk
-index abfbae9..f2740bf 100644
+index d91c518..ee5d908 100644
 --- a/tests/match.awk
 +++ b/tests/match.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2014-2018 Dmitry V. Levin <ldv@altlinux.org>
  # All rights reserved.
 diff --git a/tests/rt_sigaction.awk b/tests/rt_sigaction.awk
-index 9c3a9ed..8414243 100644
+index 81dd813..9cd9549 100644
 --- a/tests/rt_sigaction.awk
 +++ b/tests/rt_sigaction.awk
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-devtools/strace/strace_4.25.bb b/meta/recipes-devtools/strace/strace_4.26.bb
similarity index 86%
rename from meta/recipes-devtools/strace/strace_4.25.bb
rename to meta/recipes-devtools/strace/strace_4.26.bb
index 028aa71729..24f92c99e5 100644
--- a/meta/recipes-devtools/strace/strace_4.25.bb
+++ b/meta/recipes-devtools/strace/strace_4.26.bb
@@ -1,8 +1,8 @@
 SUMMARY = "System call tracing tool"
 HOMEPAGE = "http://strace.io"
 SECTION = "console/utils"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6ddb91734b9c705f3e87362e97e5f64b"
+LICENSE = "LGPL-2.1+ & GPL-2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5c84d1c6e48e7961ccd2cd2ae32f7bf1"
 
 SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://disable-git-version-gen.patch \
@@ -14,9 +14,10 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
+           file://0001-mips-o32-fix-build.patch \
            "
-SRC_URI[md5sum] = "fa5ac841e9ce6af133061822898d49a9"
-SRC_URI[sha256sum] = "d685f8e65470b7832c3aff60c57ab4459f26ff89f07c10f92bd70ee89efac701"
+SRC_URI[md5sum] = "daa51acc0c7c696221ec03cf0b30a7af"
+SRC_URI[sha256sum] = "7c4d2ffeef4f7d1cdc71062ca78d1130eb52f947c2fca82f59f6a1183bfa1e1c"
 
 inherit autotools ptest bluetooth
 
-- 
2.17.0


