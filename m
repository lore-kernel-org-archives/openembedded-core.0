Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 52ECD70C55
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:45:27 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XHBSC-0005Tv-Sr from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Aug 2014 05:45:28 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 12 Aug 2014 05:45:28 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Aug 2014 17:40:58 +0500
Message-Id: <1407847258-46064-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 12 Aug 2014 12:45:28.0738 (UTC)
	FILETIME=[4BBA4020:01CFB62B]
Subject: [PATCH] strace: apply ptrace.h conflict workaround
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
X-List-Received-Date: Tue, 12 Aug 2014 12:45:30 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

Apply patch from strace upstream to workaround ptrace.h
header file conflict. This patch is not available in
strace-4.8 tarball pulled in by recipe.

* patch from strace upstream
 - Work around conflict between <sys/ptrace.h> and
   <linux/ptrace.h>

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 ...-conflict-between-sys-ptrace.h-and-linux-.patch |  108 ++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.8.bb         |    1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace-4.8/0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch

diff --git a/meta/recipes-devtools/strace/strace-4.8/0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch b/meta/recipes-devtools/strace/strace-4.8/0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch
new file mode 100644
index 0000000..5a0090e
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace-4.8/0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch
@@ -0,0 +1,108 @@
+Upstream-Status: Backport
+
+From 0b4060f61f1bb101b5d8d084714b7d2feacdb199 Mon Sep 17 00:00:00 2001
+From: Ali Polatel <alip@exherbo.org>
+Date: Tue, 24 Sep 2013 20:04:32 +0300
+Subject: [PATCH] Work around conflict between <sys/ptrace.h> and
+ <linux/ptrace.h>
+
+Since glibc-2.18~39 <sys/ptrace.h> defines ptrace_peeksiginfo_args
+which collides with <linux/ptrace.h>.
+
+* configure.ac: Check for `struct ptrace_peeksiginfo_args' in
+<sys/ptrace.h>.
+* process.c: Work around potential conflict between <sys/ptrace.h>
+and <linux/ptrace.h> by redefining ptrace_peeksiginfo_args.
+* signal.c: Likewise.
+* syscall.c: Likewise.
+* util.c: Likewise.
+
+Signed-off-by: Ali Polatel <alip@exherbo.org>
+---
+ configure.ac | 2 +-
+ process.c    | 4 ++++
+ signal.c     | 4 ++++
+ syscall.c    | 4 ++++
+ util.c       | 4 ++++
+ 5 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f19e4f2..aa4923a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -257,7 +257,7 @@ AC_CHECK_MEMBERS([struct T_conn_res.QUEUE_ptr,
+ 
+ AC_CHECK_TYPES([struct __old_kernel_stat],,, [#include <asm/stat.h>])
+ 
+-AC_CHECK_TYPES([struct pt_all_user_regs, struct ia64_fpreg],,,
++AC_CHECK_TYPES([struct pt_all_user_regs, struct ia64_fpreg, struct ptrace_peeksiginfo_args],,,
+ 	       [#include <sys/ptrace.h>])
+ 
+ AC_CHECK_TYPES([struct user_desc],,, [#include <asm/ldt.h>])
+diff --git a/process.c b/process.c
+index 1a2181b..59428a4 100644
+--- a/process.c
++++ b/process.c
+@@ -63,7 +63,11 @@
+ # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
+ #  define pt_all_user_regs XXX_pt_all_user_regs
+ # endif
++# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
++#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
++# endif
+ # include <linux/ptrace.h>
++# undef ptrace_peeksiginfo_args
+ # undef ia64_fpreg
+ # undef pt_all_user_regs
+ #endif
+diff --git a/signal.c b/signal.c
+index 7fb9abf..3411ddd 100644
+--- a/signal.c
++++ b/signal.c
+@@ -51,7 +51,11 @@
+ # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
+ #  define pt_all_user_regs XXX_pt_all_user_regs
+ # endif
++# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
++#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
++# endif
+ # include <linux/ptrace.h>
++# undef ptrace_peeksiginfo_args
+ # undef ia64_fpreg
+ # undef pt_all_user_regs
+ #endif
+diff --git a/syscall.c b/syscall.c
+index 83a95bd..3477dcd 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -48,7 +48,11 @@
+ # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
+ #  define pt_all_user_regs XXX_pt_all_user_regs
+ # endif
++# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
++#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
++# endif
+ # include <linux/ptrace.h>
++# undef ptrace_peeksiginfo_args
+ # undef ia64_fpreg
+ # undef pt_all_user_regs
+ #endif
+diff --git a/util.c b/util.c
+index 0dab902..30a7f19 100644
+--- a/util.c
++++ b/util.c
+@@ -55,7 +55,11 @@
+ # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
+ #  define pt_all_user_regs XXX_pt_all_user_regs
+ # endif
++# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
++#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
++# endif
+ # include <linux/ptrace.h>
++# undef ptrace_peeksiginfo_args
+ # undef ia64_fpreg
+ # undef pt_all_user_regs
+ #endif
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
index d954c37..ed738ea 100644
--- a/meta/recipes-devtools/strace/strace_4.8.bb
+++ b/meta/recipes-devtools/strace/strace_4.8.bb
@@ -10,6 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://Makefile-ptest.patch \
            file://strace-fix-64-bit-process-detection.patch \
            file://run-ptest \
+           file://0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch \
           "
 
 SRC_URI[md5sum] = "c575ef43829586801f514fd91bfe7575"
-- 
1.7.9.5


