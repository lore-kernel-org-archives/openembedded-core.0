Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFT-0001HK-Nv
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:16 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0J/lq+lACcX33evxUE8eHwEJeE1LQJseemOZ5fcUT4A=;
	b=Tweb4acFW+BuZtPTlbMsbZGnP34ELEKLU8vRKLG0U2jfKoLemmTP/+V9TacIWhVdtl
	q+NCiV4AuVVLAslzaNWb7cLbIyGGInxXrdzQ8TMUl8vIArzCNTeEo2b/jSJFQU00aDNj
	12alJp+K20IO5veEjIjHyV6fV1iRsKndzsYmh/aO6T3rsSj8v58XFrpkDUKGuz4jtIWg
	0XMQE5kVe3BW3VP1sSz/h2M53hoKjuPkTOv8kXyhn4gQ9QWIIPWcyDvLRlxQ15U1gW8d
	BhGpJiGdPW3SmDLFWv/tRPEA4HQsYtDMVTo/gqyETpiaDCkmhSmWLJFHwSiYvRHlkBg7
	TMIg==
Received: by 10.66.9.2 with SMTP id v2mr59420925paa.65.1341763869304;
	Sun, 08 Jul 2012 09:11:09 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:20 -0700
Message-Id: <42582a859bd6fd47c1d305be0065867659e056b4.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 02/19] gdb: Replace struct siginfo with proper siginfo_t
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
X-List-Received-Date: Sun, 08 Jul 2012 16:22:16 -0000

Fixes errors like

/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gdb-7.4.1-r0.0/gdb-7.4.1/gdb/linux-nat.h:79:18:
error: field 'siginfo' has incomplete type

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc      |    2 +-
 meta/recipes-devtools/gdb/gdb.inc             |    1 +
 meta/recipes-devtools/gdb/gdb/siginfo_t.patch |  403 +++++++++++++++++++++++++
 3 files changed, 405 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gdb/gdb/siginfo_t.patch

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index be4d77a..348bdee 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -12,7 +12,7 @@ LTTNGUST_mips64 = ""
 LTTNGUST_mips64el = ""
 LTTNGUST_sh4 = ""
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index a620eca..c1ad83a 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -5,6 +5,7 @@ inherit gettext
 SRC_URI += "file://kill_arm_map_symbols.patch \
             file://gdbserver-cflags-last.diff;striplevel=0 \
 	    file://renesas-sh-native-support.patch \
+	    file://siginfo_t.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/siginfo_t.patch b/meta/recipes-devtools/gdb/gdb/siginfo_t.patch
new file mode 100644
index 0000000..465645d
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/siginfo_t.patch
@@ -0,0 +1,403 @@
+POSIX says you get "siginto_t" *not* "struct siginfo
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gdb-7.4.1/gdb/alpha-linux-tdep.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/alpha-linux-tdep.c	2012-01-05 20:43:04.000000000 -0800
++++ gdb-7.4.1/gdb/alpha-linux-tdep.c	2012-07-03 10:12:30.154227388 -0700
+@@ -114,7 +114,7 @@
+   /* __NR_rt_sigreturn has a couple of structures on the stack.  This is:
+ 
+ 	struct rt_sigframe {
+-	  struct siginfo info;
++	  siginfo_t info;
+ 	  struct ucontext uc;
+         };
+ 
+Index: gdb-7.4.1/gdb/amd64-linux-nat.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/amd64-linux-nat.c	2012-01-05 20:43:04.000000000 -0800
++++ gdb-7.4.1/gdb/amd64-linux-nat.c	2012-07-03 10:12:30.154227388 -0700
+@@ -671,13 +671,13 @@
+    INF.  */
+ 
+ static int
+-amd64_linux_siginfo_fixup (struct siginfo *native, gdb_byte *inf, int direction)
++amd64_linux_siginfo_fixup (siginfo_t *native, gdb_byte *inf, int direction)
+ {
+   /* Is the inferior 32-bit?  If so, then do fixup the siginfo
+      object.  */
+   if (gdbarch_addr_bit (get_frame_arch (get_current_frame ())) == 32)
+     {
+-      gdb_assert (sizeof (struct siginfo) == sizeof (compat_siginfo_t));
++      gdb_assert (sizeof (siginfo_t) == sizeof (compat_siginfo_t));
+ 
+       if (direction == 0)
+ 	compat_siginfo_from_siginfo ((struct compat_siginfo *) inf, native);
+Index: gdb-7.4.1/gdb/arm-linux-nat.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/arm-linux-nat.c	2012-01-05 20:43:04.000000000 -0800
++++ gdb-7.4.1/gdb/arm-linux-nat.c	2012-07-03 10:12:30.154227388 -0700
+@@ -1137,7 +1137,7 @@
+ static int
+ arm_linux_stopped_data_address (struct target_ops *target, CORE_ADDR *addr_p)
+ {
+-  struct siginfo *siginfo_p = linux_nat_get_siginfo (inferior_ptid);
++  siginfo_t *siginfo_p = linux_nat_get_siginfo (inferior_ptid);
+   int slot = siginfo_p->si_errno;
+ 
+   /* This must be a hardware breakpoint.  */
+Index: gdb-7.4.1/gdb/arm-linux-tdep.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/arm-linux-tdep.c	2012-01-05 20:43:04.000000000 -0800
++++ gdb-7.4.1/gdb/arm-linux-tdep.c	2012-07-03 10:12:30.154227388 -0700
+@@ -301,7 +301,7 @@
+ 
+ /* There are three elements in an rt_sigframe before the ucontext:
+    pinfo, puc, and info.  The first two are pointers and the third
+-   is a struct siginfo, with size 128 bytes.  We could follow puc
++   is a siginfo_t, with size 128 bytes.  We could follow puc
+    to the ucontext, but it's simpler to skip the whole thing.  */
+ #define ARM_OLD_RT_SIGFRAME_SIGINFO 0x8
+ #define ARM_OLD_RT_SIGFRAME_UCONTEXT 0x88
+Index: gdb-7.4.1/gdb/frv-linux-tdep.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/frv-linux-tdep.c	2012-01-05 20:43:12.000000000 -0800
++++ gdb-7.4.1/gdb/frv-linux-tdep.c	2012-07-03 10:12:30.154227388 -0700
+@@ -94,9 +94,9 @@
+       {
+ 	      void (*pretcode)(void);
+ 	      int sig;
+-	      struct siginfo *pinfo;
++	      siginfo_t *pinfo;
+ 	      void *puc;
+-	      struct siginfo info;
++	      siginfo_t info;
+ 	      struct ucontext uc;
+ 	      uint32_t retcode[2];
+       };
+Index: gdb-7.4.1/gdb/gdbserver/linux-arm-low.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/gdbserver/linux-arm-low.c	2012-01-05 20:43:37.000000000 -0800
++++ gdb-7.4.1/gdb/gdbserver/linux-arm-low.c	2012-07-03 10:12:30.154227388 -0700
+@@ -631,7 +631,7 @@
+ arm_stopped_by_watchpoint (void)
+ {
+   struct lwp_info *lwp = get_thread_lwp (current_inferior);
+-  struct siginfo siginfo;
++  siginfo_t siginfo;
+ 
+   /* We must be able to set hardware watchpoints.  */
+   if (arm_linux_get_hw_watchpoint_count () == 0)
+Index: gdb-7.4.1/gdb/gdbserver/linux-low.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/gdbserver/linux-low.c	2012-01-05 20:43:37.000000000 -0800
++++ gdb-7.4.1/gdb/gdbserver/linux-low.c	2012-07-03 10:12:30.154227388 -0700
+@@ -4522,7 +4522,7 @@
+    layout of the inferiors' architecture.  */
+ 
+ static void
+-siginfo_fixup (struct siginfo *siginfo, void *inf_siginfo, int direction)
++siginfo_fixup (siginfo_t *siginfo, void *inf_siginfo, int direction)
+ {
+   int done = 0;
+ 
+@@ -4534,9 +4534,9 @@
+   if (!done)
+     {
+       if (direction == 1)
+-	memcpy (siginfo, inf_siginfo, sizeof (struct siginfo));
++	memcpy (siginfo, inf_siginfo, sizeof (siginfo_t));
+       else
+-	memcpy (inf_siginfo, siginfo, sizeof (struct siginfo));
++	memcpy (inf_siginfo, siginfo, sizeof (siginfo_t));
+     }
+ }
+ 
+@@ -4545,8 +4545,8 @@
+ 		    unsigned const char *writebuf, CORE_ADDR offset, int len)
+ {
+   int pid;
+-  struct siginfo siginfo;
+-  char inf_siginfo[sizeof (struct siginfo)];
++  siginfo_t siginfo;
++  char inf_siginfo[sizeof (siginfo_t)];
+ 
+   if (current_inferior == NULL)
+     return -1;
+Index: gdb-7.4.1/gdb/gdbserver/linux-low.h
+===================================================================
+--- gdb-7.4.1.orig/gdb/gdbserver/linux-low.h	2012-01-05 20:43:37.000000000 -0800
++++ gdb-7.4.1/gdb/gdbserver/linux-low.h	2012-07-03 10:20:28.554250548 -0700
+@@ -22,6 +22,7 @@
+ #endif
+ 
+ #include "gdb_proc_service.h"
++#include <signal.h>
+ 
+ #ifdef HAVE_LINUX_REGSETS
+ typedef void (*regset_fill_func) (struct regcache *, void *);
+@@ -46,8 +47,6 @@
+ extern struct regset_info target_regsets[];
+ #endif
+ 
+-struct siginfo;
+-
+ struct process_info_private
+ {
+   /* Arch-specific additions.  */
+@@ -103,7 +102,7 @@
+      Returns true if any conversion was done; false otherwise.
+      If DIRECTION is 1, then copy from INF to NATIVE.
+      If DIRECTION is 0, copy from NATIVE to INF.  */
+-  int (*siginfo_fixup) (struct siginfo *native, void *inf, int direction);
++  int (*siginfo_fixup) (siginfo_t *native, void *inf, int direction);
+ 
+   /* Hook to call when a new process is created or attached to.
+      If extra per-process architecture-specific data is needed,
+Index: gdb-7.4.1/gdb/gdbserver/linux-x86-low.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/gdbserver/linux-x86-low.c	2012-01-05 20:43:37.000000000 -0800
++++ gdb-7.4.1/gdb/gdbserver/linux-x86-low.c	2012-07-03 10:12:30.154227388 -0700
+@@ -906,13 +906,13 @@
+    INF.  */
+ 
+ static int
+-x86_siginfo_fixup (struct siginfo *native, void *inf, int direction)
++x86_siginfo_fixup (siginfo_t *native, void *inf, int direction)
+ {
+ #ifdef __x86_64__
+   /* Is the inferior 32-bit?  If so, then fixup the siginfo object.  */
+   if (register_size (0) == 4)
+     {
+-      if (sizeof (struct siginfo) != sizeof (compat_siginfo_t))
++      if (sizeof (siginfo_t) != sizeof (compat_siginfo_t))
+ 	fatal ("unexpected difference in siginfo");
+ 
+       if (direction == 0)
+Index: gdb-7.4.1/gdb/hppa-linux-tdep.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/hppa-linux-tdep.c	2012-01-05 20:43:15.000000000 -0800
++++ gdb-7.4.1/gdb/hppa-linux-tdep.c	2012-07-03 10:12:30.158227388 -0700
+@@ -181,10 +181,10 @@
+     }
+ 
+   /* sp + sfoffs[try] points to a struct rt_sigframe, which contains
+-     a struct siginfo and a struct ucontext.  struct ucontext contains
++     a siginfo_t and a struct ucontext.  struct ucontext contains
+      a struct sigcontext.  Return an offset to this sigcontext here.  Too 
+      bad we cannot include system specific headers :-(.
+-     sizeof(struct siginfo) == 128
++     sizeof(siginfo_t) == 128
+      offsetof(struct ucontext, uc_mcontext) == 24.  */
+   return sp + sfoffs[try] + 128 + 24;
+ }
+Index: gdb-7.4.1/gdb/ia64-linux-nat.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/ia64-linux-nat.c	2012-01-05 20:43:16.000000000 -0800
++++ gdb-7.4.1/gdb/ia64-linux-nat.c	2012-07-03 10:12:30.158227388 -0700
+@@ -637,7 +637,7 @@
+ ia64_linux_stopped_data_address (struct target_ops *ops, CORE_ADDR *addr_p)
+ {
+   CORE_ADDR psr;
+-  struct siginfo *siginfo_p;
++  siginfo_t *siginfo_p;
+   struct regcache *regcache = get_current_regcache ();
+ 
+   siginfo_p = linux_nat_get_siginfo (inferior_ptid);
+Index: gdb-7.4.1/gdb/linux-nat.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/linux-nat.c	2012-01-05 20:43:19.000000000 -0800
++++ gdb-7.4.1/gdb/linux-nat.c	2012-07-03 10:12:30.158227388 -0700
+@@ -179,7 +179,7 @@
+ /* The method to call, if any, when the siginfo object needs to be
+    converted between the layout returned by ptrace, and the layout in
+    the architecture of the inferior.  */
+-static int (*linux_nat_siginfo_fixup) (struct siginfo *,
++static int (*linux_nat_siginfo_fixup) (siginfo_t *,
+ 				       gdb_byte *,
+ 				       int);
+ 
+@@ -4138,7 +4138,7 @@
+    layout of the inferiors' architecture.  */
+ 
+ static void
+-siginfo_fixup (struct siginfo *siginfo, gdb_byte *inf_siginfo, int direction)
++siginfo_fixup (siginfo_t *siginfo, gdb_byte *inf_siginfo, int direction)
+ {
+   int done = 0;
+ 
+@@ -4150,9 +4150,9 @@
+   if (!done)
+     {
+       if (direction == 1)
+-	memcpy (siginfo, inf_siginfo, sizeof (struct siginfo));
++	memcpy (siginfo, inf_siginfo, sizeof (siginfo_t));
+       else
+-	memcpy (inf_siginfo, siginfo, sizeof (struct siginfo));
++	memcpy (inf_siginfo, siginfo, sizeof (siginfo_t));
+     }
+ }
+ 
+@@ -4162,8 +4162,8 @@
+ 		    const gdb_byte *writebuf, ULONGEST offset, LONGEST len)
+ {
+   int pid;
+-  struct siginfo siginfo;
+-  gdb_byte inf_siginfo[sizeof (struct siginfo)];
++  siginfo_t siginfo;
++  gdb_byte inf_siginfo[sizeof (siginfo_t)];
+ 
+   gdb_assert (object == TARGET_OBJECT_SIGNAL_INFO);
+   gdb_assert (readbuf || writebuf);
+@@ -5852,7 +5852,7 @@
+    inferior.  */
+ void
+ linux_nat_set_siginfo_fixup (struct target_ops *t,
+-			     int (*siginfo_fixup) (struct siginfo *,
++			     int (*siginfo_fixup) (siginfo_t *,
+ 						   gdb_byte *,
+ 						   int))
+ {
+@@ -5861,7 +5861,7 @@
+ }
+ 
+ /* Return the saved siginfo associated with PTID.  */
+-struct siginfo *
++siginfo_t *
+ linux_nat_get_siginfo (ptid_t ptid)
+ {
+   struct lwp_info *lp = find_lwp_pid (ptid);
+Index: gdb-7.4.1/gdb/linux-nat.h
+===================================================================
+--- gdb-7.4.1.orig/gdb/linux-nat.h	2012-01-05 20:43:19.000000000 -0800
++++ gdb-7.4.1/gdb/linux-nat.h	2012-07-03 10:12:30.158227388 -0700
+@@ -76,7 +76,7 @@
+ 
+   /* Non-zero si_signo if this LWP stopped with a trap.  si_addr may
+      be the address of a hardware watchpoint.  */
+-  struct siginfo siginfo;
++  siginfo_t siginfo;
+ 
+   /* STOPPED_BY_WATCHPOINT is non-zero if this LWP stopped with a data
+      watchpoint trap.  */
+@@ -171,7 +171,7 @@
+    that ptrace returns, and the layout in the architecture of the
+    inferior.  */
+ void linux_nat_set_siginfo_fixup (struct target_ops *,
+-				  int (*) (struct siginfo *,
++				  int (*) (siginfo_t *,
+ 					   gdb_byte *,
+ 					   int));
+ 
+@@ -180,7 +180,7 @@
+ void linux_nat_switch_fork (ptid_t new_ptid);
+ 
+ /* Return the saved siginfo associated with PTID.  */
+-struct siginfo *linux_nat_get_siginfo (ptid_t ptid);
++siginfo_t *linux_nat_get_siginfo (ptid_t ptid);
+ 
+ /* Compute and return the processor core of a given thread.  */
+ int linux_nat_core_of_thread_1 (ptid_t ptid);
+Index: gdb-7.4.1/gdb/linux-tdep.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/linux-tdep.c	2012-01-05 20:43:19.000000000 -0800
++++ gdb-7.4.1/gdb/linux-tdep.c	2012-07-03 10:12:30.158227388 -0700
+@@ -150,7 +150,7 @@
+   append_composite_type_field (type, "si_fd", int_type);
+   append_composite_type_field (sifields_type, "_sigpoll", type);
+ 
+-  /* struct siginfo */
++  /* siginfo_t */
+   siginfo_type = arch_composite_type (gdbarch, NULL, TYPE_CODE_STRUCT);
+   TYPE_NAME (siginfo_type) = xstrdup ("siginfo");
+   append_composite_type_field (siginfo_type, "si_signo", int_type);
+Index: gdb-7.4.1/gdb/mips-linux-tdep.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/mips-linux-tdep.c	2012-01-05 20:43:20.000000000 -0800
++++ gdb-7.4.1/gdb/mips-linux-tdep.c	2012-07-03 10:12:30.158227388 -0700
+@@ -905,7 +905,7 @@
+    struct rt_sigframe {
+      u32 rs_ass[4];            [argument save space for o32]
+      u32 rs_code[2]            [signal trampoline or fill]
+-     struct siginfo rs_info;
++     siginfo_t rs_info;
+      struct ucontext rs_uc;
+    };
+ 
+@@ -1033,7 +1033,7 @@
+   struct rt_sigframe_n32 {
+     u32 rs_ass[4];                  [ argument save space for o32 ]
+     u32 rs_code[2];                 [ signal trampoline or fill ]
+-    struct siginfo rs_info;
++    siginfo_t rs_info;
+     struct ucontextn32 rs_uc;
+   };
+ 
+@@ -1048,7 +1048,7 @@
+   struct rt_sigframe {
+     u32 rs_ass[4];                  [ argument save space for o32 ]
+     u32 rs_code[2];                 [ signal trampoline ]
+-    struct siginfo rs_info;
++    siginfo_t rs_info;
+     struct ucontext rs_uc;
+   };
+ 
+Index: gdb-7.4.1/gdb/mn10300-linux-tdep.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/mn10300-linux-tdep.c	2012-01-05 20:43:20.000000000 -0800
++++ gdb-7.4.1/gdb/mn10300-linux-tdep.c	2012-07-03 10:12:30.158227388 -0700
+@@ -528,9 +528,9 @@
+ {
+ 	void (*pretcode)(void);
+ 	int sig;
+-	struct siginfo *pinfo;
++	siginfo_t *pinfo;
+ 	void *puc;
+-	struct siginfo info;
++	siginfo_t info;
+ 	struct ucontext uc;
+ 	struct fpucontext fpuctx;
+ 	char retcode[8];
+Index: gdb-7.4.1/gdb/ppc-linux-nat.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/ppc-linux-nat.c	2012-01-05 20:43:22.000000000 -0800
++++ gdb-7.4.1/gdb/ppc-linux-nat.c	2012-07-03 10:12:30.158227388 -0700
+@@ -2213,7 +2213,7 @@
+ static int
+ ppc_linux_stopped_data_address (struct target_ops *target, CORE_ADDR *addr_p)
+ {
+-  struct siginfo *siginfo_p;
++  siginfo_t *siginfo_p;
+ 
+   siginfo_p = linux_nat_get_siginfo (inferior_ptid);
+ 
+Index: gdb-7.4.1/gdb/procfs.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/procfs.c	2012-01-05 20:43:25.000000000 -0800
++++ gdb-7.4.1/gdb/procfs.c	2012-07-03 10:12:30.158227388 -0700
+@@ -262,7 +262,7 @@
+ #ifdef HAVE_PR_SIGINFO64_T
+ typedef pr_siginfo64_t gdb_siginfo_t;
+ #else
+-typedef struct siginfo gdb_siginfo_t;
++typedef siginfo_t gdb_siginfo_t;
+ #endif
+ 
+ /* On mips-irix, praddset and prdelset are defined in such a way that
+Index: gdb-7.4.1/gdb/tic6x-linux-tdep.c
+===================================================================
+--- gdb-7.4.1.orig/gdb/tic6x-linux-tdep.c	2012-01-05 20:54:31.000000000 -0800
++++ gdb-7.4.1/gdb/tic6x-linux-tdep.c	2012-07-03 10:12:30.158227388 -0700
+@@ -34,7 +34,7 @@
+ 
+ /* The offset from rt_sigframe pointer to SP register.  */
+ #define TIC6X_SP_RT_SIGFRAME 8
+-/* Size of struct siginfo info.  */
++/* Size of siginfo_t info.  */
+ #define TIC6X_SIGINFO_SIZE 128
+ /* Size of type stack_t, which contains three fields of type void*, int, and
+    size_t respectively.  */
-- 
1.7.9.5



