Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QeCvv-0005Ye-UY
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 23:13:28 +0200
Received: by iym10 with SMTP id 10so6011556iym.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 14:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=eUJT3O8h6rvSZ1N2a9uHTlQgOBj+mIEEsIDbMov/Kl0=;
	b=I9eO9ziWHwBB/HZK7QnwAk0dsPqx9gKvswBwcEzBgKLj6u6sf4YnaAo9TF02L2gf8I
	9cXXE40PYViOJSMz0K6yzghaU+dembKXE+SIVu2CvBWghNOVDqbogImNMK++twe/BVuW
	34TH/BUhZ2IUoI9vCc++HjJlbpSHBIoWraSZg=
Received: by 10.42.161.71 with SMTP id s7mr3501925icx.464.1309900176538;
	Tue, 05 Jul 2011 14:09:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id vn4sm7982300icb.7.2011.07.05.14.09.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 14:09:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 14:09:17 -0700
Message-Id: <321d919eb68f690e4c986bef40ed26a15af242b3.1309899985.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <bceff46868b198126d398d7b89e7d444a67c0dff.1309899985.git.raj.khem@gmail.com>
References: <bceff46868b198126d398d7b89e7d444a67c0dff.1309899985.git.raj.khem@gmail.com>
In-Reply-To: <cover.1309899985.git.raj.khem@gmail.com>
References: <cover.1309899985.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] uclibc_git: Implement execvpe and refresh scheduler functions
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
X-List-Received-Date: Tue, 05 Jul 2011 21:13:28 -0000

Enable UCLIBC_HAS_UTMPX

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    3 +
 .../uclibc/uclibc-git/uclibc-execvpe.patch         |  160 +++++++
 .../uclibc-git/uclibc_scheduler_update.patch       |  455 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc_git.bb             |    4 +-
 4 files changed, 621 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index 223fb04..9b2a0e5 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -178,3 +178,6 @@ UCLIBC_HAS_FLOATS=y
 # by menuconfig for other arches.
 
 # COMPILE_IN_THUMB_MODE is not set
+
+# needed by systemd
+UCLIBC_HAS_UTMPX=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch
new file mode 100644
index 0000000..cd90a09
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch
@@ -0,0 +1,160 @@
+From d20556adadea03bff0bba051172caf0314a35471 Mon Sep 17 00:00:00 2001
+From: Henning Heinold <heinold@inf.fu-berlin.de>
+Date: Sat, 4 Jun 2011 21:23:15 +0200
+Subject: [PATCH 2/2] libc: add non standard execvpe function
+
+
+Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
+---
+ include/unistd.h      |    6 ++++++
+ libc/unistd/exec.c    |   38 +++++++++++++++++++++++++++++++++-----
+ libc/unistd/execvpe.c |    7 +++++++
+ 3 files changed, 46 insertions(+), 5 deletions(-)
+ create mode 100644 libc/unistd/execvpe.c
+
+diff --git a/include/unistd.h b/include/unistd.h
+index 9568790..070e4f2 100644
+--- a/include/unistd.h
++++ b/include/unistd.h
+@@ -557,6 +557,12 @@ extern int execvp (__const char *__file, char *__const __argv[])
+      __THROW __nonnull ((1));
+ libc_hidden_proto(execvp)
+ 
++/* Execute FILE, searching in the `PATH' environment variable if it contains
++   no slashes, with arguments ARGV and environment from a pointer */
++extern int execvpe (__const char *__file, char *__const __argv[], char *__const __envp[])
++     __THROW __nonnull ((1));
++libc_hidden_proto(execvpe)
++
+ /* Execute FILE, searching in the `PATH' environment variable if
+    it contains no slashes, with all arguments after FILE until a
+    NULL pointer and environment from `environ'.  */
+diff --git a/libc/unistd/exec.c b/libc/unistd/exec.c
+index 7d24072..802a174 100644
+--- a/libc/unistd/exec.c
++++ b/libc/unistd/exec.c
+@@ -32,6 +32,8 @@
+ /**********************************************************************/
+ #define EXEC_FUNC_COMMON 0
+ #define EXEC_FUNC_EXECVP 1
++#define EXEC_FUNC_EXECVPE 2
++
+ #if defined(__ARCH_USE_MMU__)
+ 
+ /* We have an MMU, so use alloca() to grab space for buffers and arg lists. */
+@@ -58,6 +60,7 @@
+  *  execle(a) -> execve(-)
+  *  execv(-)  -> execve(-)
+  *  execvp(a) -> execve(-)
++ *  execvpe(a) -> execve(-)
+  */
+ 
+ # define EXEC_ALLOC_SIZE(VAR)      /* nothing to do */
+@@ -219,15 +222,18 @@ libc_hidden_def(execlp)
+ 
+ #endif
+ /**********************************************************************/
+-#ifdef L_execvp
++#if defined (L_execvp) || defined(L_execvpe)
+ 
+ 
+ /* Use a default path that matches glibc behavior, since SUSv3 says
+  * this is implementation-defined.  The default is current working dir,
+  * /bin, and then /usr/bin. */
+ static const char default_path[] = ":/bin:/usr/bin";
+-
++#if defined (L_execvp)
+ int execvp(const char *path, char *const argv[])
++#elif defined (L_execvpe)
++int execvpe(const char *path, char *const argv[], char *const envp[])
++#endif
+ {
+ 	char *buf = NULL;
+ 	char *p;
+@@ -245,7 +251,11 @@ int execvp(const char *path, char *const argv[])
+ 	}
+ 
+ 	if (strchr(path, '/')) {
++#if defined (L_execvp)
+ 		execve(path, argv, __environ);
++#elif defined (L_execvpe)
++		execve(path, argv, envp);
++#endif
+ 		if (errno == ENOEXEC) {
+ 			char **nargv;
+ 			EXEC_ALLOC_SIZE(size2) /* Do NOT add a semicolon! */
+@@ -254,11 +264,19 @@ int execvp(const char *path, char *const argv[])
+ 			/* Need the dimension - 1.  We omit counting the trailing
+ 			 * NULL but we actually omit the first entry. */
+ 			for (n=0 ; argv[n] ; n++) {}
++#if defined (L_execvp)
+ 			nargv = (char **) EXEC_ALLOC((n+2) * sizeof(char *), size2, EXEC_FUNC_EXECVP);
++#elif defined (L_execvpe)
++			nargv = (char **) EXEC_ALLOC((n+2) * sizeof(char *), size2, EXEC_FUNC_EXECVPE);
++#endif
+ 			nargv[0] = argv[0];
+ 			nargv[1] = (char *)path;
+ 			memcpy(nargv+2, argv+1, n*sizeof(char *));
++#if defined (L_execvp)
+ 			execve("/bin/sh", nargv, __environ);
++#elif defined (L_execvpe)
++			execve("/bin/sh", nargv, envp);
++#endif
+ 			EXEC_FREE(nargv, size2);
+ 		}
+ 	} else {
+@@ -277,8 +295,11 @@ int execvp(const char *path, char *const argv[])
+ 			return -1;
+ 		}
+ 		len = (FILENAME_MAX - 1) - plen;
+-
++#if defined (L_execvp)
+ 		buf = EXEC_ALLOC(FILENAME_MAX, size, EXEC_FUNC_EXECVP);
++#elif defined (L_execvpe)
++		buf = EXEC_ALLOC(FILENAME_MAX, size, EXEC_FUNC_EXECVPE);
++#endif
+ 		{
+ 			int seen_small = 0;
+ 			s0 = buf + len;
+@@ -300,8 +321,11 @@ int execvp(const char *path, char *const argv[])
+ 					s[plen-1] = '/';
+ 				}
+ 
++#if defined (L_execvp)
+ 				execve(s, argv, __environ);
+-
++#elif defined (L_execvpe)
++				execve(s, argv, envp);
++#endif
+ 				seen_small = 1;
+ 
+ 				if (errno == ENOEXEC) {
+@@ -325,7 +349,11 @@ int execvp(const char *path, char *const argv[])
+ 
+ 	return -1;
+ }
++#if defined (L_execvp)
+ libc_hidden_def(execvp)
+-
++#elif defined (L_execvpe)
++libc_hidden_def(execvpe)
+ #endif
++
++#endif /* #if defined (L_execvp) || defined(L_execvpe) */
+ /**********************************************************************/
+diff --git a/libc/unistd/execvpe.c b/libc/unistd/execvpe.c
+new file mode 100644
+index 0000000..5c1ce06
+--- /dev/null
++++ b/libc/unistd/execvpe.c
+@@ -0,0 +1,7 @@
++/* Copyright (C) 2011      Hennning Heinold <heinold@inf.fu-berlin.de>
++ *
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#define L_execvpe
++#include "exec.c"
+-- 
+1.7.5.3
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch
new file mode 100644
index 0000000..78401bd
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch
@@ -0,0 +1,455 @@
+From 2becc16ecbef71c496644d9dc6cbd7383d7cdca3 Mon Sep 17 00:00:00 2001
+From: Henning Heinold <heinold@inf.fu-berlin.de>
+Date: Sat, 4 Jun 2011 21:21:41 +0200
+Subject: [PATCH 1/2] libc: updates the linux scheduler functions, most stuff
+ was taken from the eglibc
+
+
+Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
+---
+ include/sched.h                            |   52 ++++++++++++----
+ libc/sysdeps/linux/common/Makefile.in      |    4 +-
+ libc/sysdeps/linux/common/bits/sched.h     |   96 +++++++++++++++++++++++-----
+ libc/sysdeps/linux/common/sched_cpualloc.c |   27 ++++++++
+ libc/sysdeps/linux/common/sched_cpucount.c |   60 +++++++++++++++++
+ libc/sysdeps/linux/common/sched_cpufree.c  |   27 ++++++++
+ libc/sysdeps/linux/common/sched_getcpu.c   |   37 +++++++++++
+ libc/sysdeps/linux/common/unshare.c        |   12 ++++
+ 8 files changed, 286 insertions(+), 29 deletions(-)
+ create mode 100644 libc/sysdeps/linux/common/sched_cpualloc.c
+ create mode 100644 libc/sysdeps/linux/common/sched_cpucount.c
+ create mode 100644 libc/sysdeps/linux/common/sched_cpufree.c
+ create mode 100644 libc/sysdeps/linux/common/sched_getcpu.c
+ create mode 100644 libc/sysdeps/linux/common/unshare.c
+
+diff --git a/include/sched.h b/include/sched.h
+index 0d110c3..e265b84 100644
+--- a/include/sched.h
++++ b/include/sched.h
+@@ -1,5 +1,5 @@
+ /* Definitions for POSIX 1003.1b-1993 (aka POSIX.4) scheduling interface.
+-   Copyright (C) 1996,1997,1999,2001-2003,2004 Free Software Foundation, Inc.
++   Copyright (C) 1996,1997,1999,2001-2004,2007 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -25,6 +25,9 @@
+ /* Get type definitions.  */
+ #include <bits/types.h>
+ 
++#define __need_size_t
++#include <stddef.h>
++
+ #define __need_timespec
+ #include <time.h>
+ 
+@@ -65,11 +68,42 @@ extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) __THROW;
+ 
+ #if defined __USE_GNU && defined __UCLIBC_LINUX_SPECIFIC__
+ /* Access macros for `cpu_set'.  */
+-#define CPU_SETSIZE __CPU_SETSIZE
+-#define CPU_SET(cpu, cpusetp)	__CPU_SET (cpu, cpusetp)
+-#define CPU_CLR(cpu, cpusetp)	__CPU_CLR (cpu, cpusetp)
+-#define CPU_ISSET(cpu, cpusetp)	__CPU_ISSET (cpu, cpusetp)
+-#define CPU_ZERO(cpusetp)	__CPU_ZERO (cpusetp)
++# define CPU_SETSIZE __CPU_SETSIZE
++# define CPU_SET(cpu, cpusetp)	 __CPU_SET_S (cpu, sizeof (cpu_set_t), cpusetp)
++# define CPU_CLR(cpu, cpusetp)	 __CPU_CLR_S (cpu, sizeof (cpu_set_t), cpusetp)
++# define CPU_ISSET(cpu, cpusetp) __CPU_ISSET_S (cpu, sizeof (cpu_set_t), \
++						cpusetp)
++# define CPU_ZERO(cpusetp)	 __CPU_ZERO_S (sizeof (cpu_set_t), cpusetp)
++# define CPU_COUNT(cpusetp)	 __CPU_COUNT_S (sizeof (cpu_set_t), cpusetp)
++
++# define CPU_SET_S(cpu, setsize, cpusetp)   __CPU_SET_S (cpu, setsize, cpusetp)
++# define CPU_CLR_S(cpu, setsize, cpusetp)   __CPU_CLR_S (cpu, setsize, cpusetp)
++# define CPU_ISSET_S(cpu, setsize, cpusetp) __CPU_ISSET_S (cpu, setsize, \
++							   cpusetp)
++# define CPU_ZERO_S(setsize, cpusetp)	    __CPU_ZERO_S (setsize, cpusetp)
++# define CPU_COUNT_S(setsize, cpusetp)	    __CPU_COUNT_S (setsize, cpusetp)
++
++# define CPU_EQUAL(cpusetp1, cpusetp2) \
++  __CPU_EQUAL_S (sizeof (cpu_set_t), cpusetp1, cpusetp2)
++# define CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) \
++  __CPU_EQUAL_S (setsize, cpusetp1, cpusetp2)
++
++# define CPU_AND(destset, srcset1, srcset2) \
++  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, &)
++# define CPU_OR(destset, srcset1, srcset2) \
++  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, |)
++# define CPU_XOR(destset, srcset1, srcset2) \
++  __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, ^)
++# define CPU_AND_S(setsize, destset, srcset1, srcset2) \
++  __CPU_OP_S (setsize, destset, srcset1, srcset2, &)
++# define CPU_OR_S(setsize, destset, srcset1, srcset2) \
++  __CPU_OP_S (setsize, destset, srcset1, srcset2, |)
++# define CPU_XOR_S(setsize, destset, srcset1, srcset2) \
++  __CPU_OP_S (setsize, destset, srcset1, srcset2, ^)
++
++# define CPU_ALLOC_SIZE(count) __CPU_ALLOC_SIZE (count)
++# define CPU_ALLOC(count) __CPU_ALLOC (count)
++# define CPU_FREE(cpuset) __CPU_FREE (cpuset)
+ 
+ 
+ /* Set the CPU affinity for a task */
+@@ -79,12 +113,6 @@ extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
+ /* Get the CPU affinity for a task */
+ extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
+ 			      cpu_set_t *__cpuset) __THROW;
+-
+-extern int __clone (int (*__fn) (void *__arg), void *__child_stack,
+-		    int __flags, void *__arg, ...);
+-extern int __clone2 (int (*__fn) (void *__arg), void *__child_stack_base,
+-		     size_t __child_stack_size, int __flags, void *__arg, ...);
+-
+ #endif
+ 
+ __END_DECLS
+diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
+index 8f936ff..cb8c153 100644
+--- a/libc/sysdeps/linux/common/Makefile.in
++++ b/libc/sysdeps/linux/common/Makefile.in
+@@ -22,9 +22,11 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += capget.c capset.c inotify.c ioperm.c iopl.c \
+ 	modify_ldt.c pipe2.c personality.c ppoll.c prctl.c \
+ 	readahead.c reboot.c \
+ 	remap_file_pages.c sched_getaffinity.c sched_setaffinity.c \
++	sched_cpualloc.c sched_cpucount.c sched_cpufree.c \
+ 	sendfile64.c sendfile.c setfsgid.c setfsuid.c setresuid.c \
+ 	splice.c vmsplice.c tee.c signalfd.c swapoff.c swapon.c \
+-	sync_file_range.c sysctl.c sysinfo.c timerfd.c uselib.c vhangup.c
++	sync_file_range.c sysctl.c sysinfo.c timerfd.c unshare.c \
++	uselib.c vhangup.c
+ # NPTL needs these internally: madvise.c
+ CSRC-$(findstring y,$(UCLIBC_LINUX_SPECIFIC)$(UCLIBC_HAS_THREADS_NATIVE)) += madvise.c
+ ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)
+diff --git a/libc/sysdeps/linux/common/bits/sched.h b/libc/sysdeps/linux/common/bits/sched.h
+index b48a0c8..fea66a8 100644
+--- a/libc/sysdeps/linux/common/bits/sched.h
++++ b/libc/sysdeps/linux/common/bits/sched.h
+@@ -1,6 +1,7 @@
+ /* Definitions of constants and data structure for POSIX 1003.1b-1993
+    scheduling interface.
+-   Copyright (C) 1996-1999,2001-2003,2005,2006 Free Software Foundation, Inc.
++   Copyright (C) 1996-1999,2001-2003,2005,2006,2007,2008
++   Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -58,7 +59,13 @@
+ 				      force CLONE_PTRACE on this clone.  */
+ # define CLONE_CHILD_SETTID 0x01000000 /* Store TID in userlevel buffer in
+ 					  the child.  */
+-# define CLONE_STOPPED	0x02000000 /* Start in stopped state.  */
++# define CLONE_STOPPED 0x02000000 /* Start in stopped state.  */
++# define CLONE_NEWUTS	0x04000000	/* New utsname group.  */
++# define CLONE_NEWIPC	0x08000000	/* New ipcs.  */
++# define CLONE_NEWUSER	0x10000000	/* New user namespace.  */
++# define CLONE_NEWPID	0x20000000	/* New pid namespace.  */
++# define CLONE_NEWNET	0x40000000	/* New network namespace.  */
++# define CLONE_IO	0x80000000	/* Clone I/O context.  */
+ #endif
+ 
+ /* The official definition.  */
+@@ -74,10 +81,11 @@ __BEGIN_DECLS
+ extern int clone (int (*__fn) (void *__arg), void *__child_stack,
+ 		  int __flags, void *__arg, ...) __THROW;
+ 
+-#if 0
+ /* Unshare the specified resources.  */
+ extern int unshare (int __flags) __THROW;
+-#endif
++
++/* Get index of currently used CPU.  */
++extern int sched_getcpu (void) __THROW;
+ #endif
+ 
+ __END_DECLS
+@@ -102,7 +110,7 @@ struct __sched_param
+ # define __CPU_SETSIZE	1024
+ # define __NCPUBITS	(8 * sizeof (__cpu_mask))
+ 
+-/* Type for array elements in 'cpu_set'.  */
++/* Type for array elements in 'cpu_set_t'.  */
+ typedef unsigned long int __cpu_mask;
+ 
+ /* Basic access functions.  */
+@@ -116,17 +124,73 @@ typedef struct
+ } cpu_set_t;
+ 
+ /* Access functions for CPU masks.  */
+-# define __CPU_ZERO(cpusetp) \
++# define __CPU_ZERO_S(setsize, cpusetp) \
+   do {									      \
+-    unsigned int __i;							      \
+-    cpu_set_t *__arr = (cpusetp);					      \
+-    for (__i = 0; __i < sizeof (cpu_set_t) / sizeof (__cpu_mask); ++__i)      \
+-      __arr->__bits[__i] = 0;						      \
++    size_t __i;								      \
++    size_t __imax = (setsize) / sizeof (__cpu_mask);			      \
++    __cpu_mask *__bits = (cpusetp)->__bits;				      \
++    for (__i = 0; __i < __imax; ++__i)					      \
++      __bits[__i] = 0;							      \
+   } while (0)
+-# define __CPU_SET(cpu, cpusetp) \
+-  ((cpusetp)->__bits[__CPUELT (cpu)] |= __CPUMASK (cpu))
+-# define __CPU_CLR(cpu, cpusetp) \
+-  ((cpusetp)->__bits[__CPUELT (cpu)] &= ~__CPUMASK (cpu))
+-# define __CPU_ISSET(cpu, cpusetp) \
+-  (((cpusetp)->__bits[__CPUELT (cpu)] & __CPUMASK (cpu)) != 0)
++# define __CPU_SET_S(cpu, setsize, cpusetp) \
++  (__extension__							      \
++   ({ size_t __cpu = (cpu);						      \
++      __cpu < 8 * (setsize)						      \
++      ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]		      \
++	 |= __CPUMASK (__cpu))						      \
++      : 0; }))
++# define __CPU_CLR_S(cpu, setsize, cpusetp) \
++  (__extension__							      \
++   ({ size_t __cpu = (cpu);						      \
++      __cpu < 8 * (setsize)						      \
++      ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]		      \
++	 &= ~__CPUMASK (__cpu))						      \
++      : 0; }))
++# define __CPU_ISSET_S(cpu, setsize, cpusetp) \
++  (__extension__							      \
++   ({ size_t __cpu = (cpu);						      \
++      __cpu < 8 * (setsize)						      \
++      ? ((((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]	      \
++	  & __CPUMASK (__cpu))) != 0					      \
++      : 0; }))
++
++# define __CPU_COUNT_S(setsize, cpusetp) \
++  __sched_cpucount (setsize, cpusetp)
++
++# define __CPU_EQUAL_S(setsize, cpusetp1, cpusetp2) \
++  (__extension__							      \
++   ({ __cpu_mask *__arr1 = (cpusetp1)->__bits;				      \
++      __cpu_mask *__arr2 = (cpusetp2)->__bits;				      \
++      size_t __imax = (setsize) / sizeof (__cpu_mask);			      \
++      size_t __i;							      \
++      for (__i = 0; __i < __imax; ++__i)				      \
++	if (__arr1[__i] != __arr2[__i])					      \
++	  break;							      \
++      __i == __imax; }))
++
++# define __CPU_OP_S(setsize, destset, srcset1, srcset2, op) \
++  (__extension__							      \
++   ({ cpu_set_t *__dest = (destset);					      \
++      __cpu_mask *__arr1 = (srcset1)->__bits;				      \
++      __cpu_mask *__arr2 = (srcset2)->__bits;				      \
++      size_t __imax = (setsize) / sizeof (__cpu_mask);			      \
++      size_t __i;							      \
++      for (__i = 0; __i < __imax; ++__i)				      \
++	((__cpu_mask *) __dest->__bits)[__i] = __arr1[__i] op __arr2[__i];    \
++      __dest; }))
++
++# define __CPU_ALLOC_SIZE(count) \
++  ((((count) + __NCPUBITS - 1) / __NCPUBITS) * sizeof (__cpu_mask))
++# define __CPU_ALLOC(count) __sched_cpualloc (count)
++# define __CPU_FREE(cpuset) __sched_cpufree (cpuset)
++
++__BEGIN_DECLS
++
++extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
++  __THROW;
++extern cpu_set_t *__sched_cpualloc (size_t __count) __THROW __wur;
++extern void __sched_cpufree (cpu_set_t *__set) __THROW;
++
++__END_DECLS
++
+ #endif
+diff --git a/libc/sysdeps/linux/common/sched_cpualloc.c b/libc/sysdeps/linux/common/sched_cpualloc.c
+new file mode 100644
+index 0000000..2642a80
+--- /dev/null
++++ b/libc/sysdeps/linux/common/sched_cpualloc.c
+@@ -0,0 +1,27 @@
++/* Copyright (C) 2007 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <sched.h>
++#include <stdlib.h>
++
++
++cpu_set_t *
++__sched_cpualloc (size_t count)
++{
++  return malloc (CPU_ALLOC_SIZE (count));
++}
+diff --git a/libc/sysdeps/linux/common/sched_cpucount.c b/libc/sysdeps/linux/common/sched_cpucount.c
+new file mode 100644
+index 0000000..331c0b8
+--- /dev/null
++++ b/libc/sysdeps/linux/common/sched_cpucount.c
+@@ -0,0 +1,60 @@
++/* Copyright (C) 2007 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <limits.h>
++#include <sched.h>
++
++
++int
++__sched_cpucount (size_t setsize, const cpu_set_t *setp)
++{
++  int s = 0;
++  const __cpu_mask *p = setp->__bits;
++  const __cpu_mask *end = &setp->__bits[setsize / sizeof (__cpu_mask)];
++
++  while (p < end)
++    {
++      __cpu_mask l = *p++;
++
++#ifdef POPCNT
++      s += POPCNT (l);
++#else
++      if (l == 0)
++	continue;
++
++# if LONG_BIT > 32
++      l = (l & 0x5555555555555555ul) + ((l >> 1) & 0x5555555555555555ul);
++      l = (l & 0x3333333333333333ul) + ((l >> 2) & 0x3333333333333333ul);
++      l = (l & 0x0f0f0f0f0f0f0f0ful) + ((l >> 4) & 0x0f0f0f0f0f0f0f0ful);
++      l = (l & 0x00ff00ff00ff00fful) + ((l >> 8) & 0x00ff00ff00ff00fful);
++      l = (l & 0x0000ffff0000fffful) + ((l >> 16) & 0x0000ffff0000fffful);
++      l = (l & 0x00000000fffffffful) + ((l >> 32) & 0x00000000fffffffful);
++# else
++      l = (l & 0x55555555ul) + ((l >> 1) & 0x55555555ul);
++      l = (l & 0x33333333ul) + ((l >> 2) & 0x33333333ul);
++      l = (l & 0x0f0f0f0ful) + ((l >> 4) & 0x0f0f0f0ful);
++      l = (l & 0x00ff00fful) + ((l >> 8) & 0x00ff00fful);
++      l = (l & 0x0000fffful) + ((l >> 16) & 0x0000fffful);
++# endif
++
++      s += l;
++#endif
++    }
++
++  return s;
++}
+diff --git a/libc/sysdeps/linux/common/sched_cpufree.c b/libc/sysdeps/linux/common/sched_cpufree.c
+new file mode 100644
+index 0000000..dd4c613
+--- /dev/null
++++ b/libc/sysdeps/linux/common/sched_cpufree.c
+@@ -0,0 +1,27 @@
++/* Copyright (C) 2007 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <sched.h>
++#include <stdlib.h>
++
++
++void
++__sched_cpufree (cpu_set_t *set)
++{
++  free (set);
++}
+diff --git a/libc/sysdeps/linux/common/sched_getcpu.c b/libc/sysdeps/linux/common/sched_getcpu.c
+new file mode 100644
+index 0000000..b193d65
+--- /dev/null
++++ b/libc/sysdeps/linux/common/sched_getcpu.c
+@@ -0,0 +1,37 @@
++/* Copyright (C) 2007 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <stdlib.h>
++#include <errno.h>
++#include <sched.h>
++#include <sysdep.h>
++
++
++int
++sched_getcpu (void)
++{
++#ifdef __NR_getcpu
++  unsigned int cpu;
++  int r = INLINE_SYSCALL (getcpu, 3, &cpu, NULL, NULL);
++
++  return r == -1 ? r : cpu;
++#else
++  __set_errno (ENOSYS);
++  return -1;
++#endif
++}
+diff --git a/libc/sysdeps/linux/common/unshare.c b/libc/sysdeps/linux/common/unshare.c
+new file mode 100644
+index 0000000..485bf88
+--- /dev/null
++++ b/libc/sysdeps/linux/common/unshare.c
+@@ -0,0 +1,12 @@
++/* vi: set sw=4 ts=4: */
++/*
++ * unshare() for uClibc
++ *
++ * Copyright (C) 2011 Henning Heinold <heinold@inf.fu-berlin.de>
++ *
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++#include <sched.h>
++_syscall1(int, unshare, int, flags)
+-- 
+1.7.5.3
+
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 7d50997..f516e1c 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -6,7 +6,7 @@ require uclibc.inc
 DEFAULT_PREFERENCE = "-1"
 
 PV = "0.9.32+gitr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
@@ -24,5 +24,7 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://compile-arm-fork-with-O2.patch \
 	file://orign_path.patch \
 	file://rtld_no.patch \
+	file://uclibc-execvpe.patch \
+	file://uclibc_scheduler_update.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.4.1



