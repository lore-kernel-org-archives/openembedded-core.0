Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sjlcc-0003Gz-BS
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:21:02 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so894934dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7xOi8B812lHGa1r5qsedMhsOAU10rfsHHA0G4vGcMdQ=;
	b=UIdQ7hv2Ojhs73k3XwRWBRcBbrOsawZBjtw9mSScARAIDDfGvMsiNlNZcSovcE2lr5
	wi638lJaq2dKN6w3hiQNsSI/1enKDl4IMvThleE6p0qn02rLrMSlTWOnmX1eQyPrd+hR
	2CQZFywztwj3Lh4o3LKN9PuJEXgCG8MXK5Qp5yJIkLZneXVvaV01CIsq8N5zhcDNH5bt
	yTOmZ827XT2Mt0F5xK0PT1gMdzlVqc0qvAYlptU1jA8pjE62lPWD+HGKfOelcWNXDott
	4qG6wKWoe+8hlPKEW2DHUdKnxATO1r6CqRwqf5XGaFIps87nunUmBrMdP5ulSjPeUWLG
	WerQ==
Received: by 10.68.221.41 with SMTP id qb9mr14204321pbc.147.1340777410949;
	Tue, 26 Jun 2012 23:10:10 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ob9sm14168304pbb.28.2012.06.26.23.10.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 23:10:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2012 23:09:48 -0700
Message-Id: <28aaeecaa0df947037895c5a1ffe28b1a1e1cd5d.1340777116.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
References: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340777115.git.raj.khem@gmail.com>
References: <cover.1340777115.git.raj.khem@gmail.com>
Subject: [PATCH 4/7] uclibc-git: Update for building systemd
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
X-List-Received-Date: Wed, 27 Jun 2012 06:21:03 -0000

This adds uclibc patches to build systemd there are
new functions that are used by systemd which are needed

Additionally when using gold linker to build userspace
based on uclibc there are spurious hidden symbol that
show up in librt.so and libc.so which should not exist

So we patch uclibc for that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |   10 +-
 ...1-atexit_old-Do-not-add-it-to-shared-libc.patch |   44 +++
 ...brt-Use-nodefaultlibs-instead-of-nostdlib.patch |   33 ++
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |   31 ++
 ...rk-Hide-pthread_atfork-in-shared-versions.patch |   74 ++++
 .../uclibc-git/define-MSG_CMSG_CLOEXEC.patch       |   25 ++
 meta/recipes-core/uclibc/uclibc-git/dup3.patch     |   37 ++
 .../uclibc/uclibc-git/posix_fallocate.patch        |  408 ++++++++++++++++++++
 .../uclibc/uclibc-git/utmp-locking.patch           |  106 -----
 9 files changed, 660 insertions(+), 108 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/dup3.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/utmp-locking.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index eac7e75..60d36f4 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -3,7 +3,7 @@ SRCREV="0dcc13bf7a61b1d0708e5dd103d5515e0ffec79a"
 DEFAULT_PREFERENCE = "-1"
 
 PV = "0.9.33+git${SRCPV}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
@@ -18,6 +18,12 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://compile-arm-fork-with-O2.patch \
 	file://uclibc-execvpe.patch \
 	file://orign_path.patch \
+	file://dup3.patch \
+	file://define-MSG_CMSG_CLOEXEC.patch \
+	file://posix_fallocate.patch \
+	file://0001-atexit_old-Do-not-add-it-to-shared-libc.patch \
+	file://0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch \
+	file://0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
+	file://0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch \
 	"
-
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch b/meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
new file mode 100644
index 0000000..b6dfce4
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
@@ -0,0 +1,44 @@
+From 74667582526b39a1906228574d73a6528f4587eb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Jun 2012 13:26:30 -0700
+Subject: [PATCH] atexit_old: Do not add it to shared libc
+
+atexit should only be in either uclibc_nonshared.a
+shared libc case or libc.a in static build case
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ libc/stdlib/Makefile.in |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libc/stdlib/Makefile.in b/libc/stdlib/Makefile.in
+index 3166b8e..3d686d9 100644
+--- a/libc/stdlib/Makefile.in
++++ b/libc/stdlib/Makefile.in
+@@ -60,7 +60,6 @@ CSRC-$(if $(findstring yyy,$(UCLIBC_HAS_FLOATS)$(UCLIBC_HAS_WCHAR)$(UCLIBC_HAS_X
+ 
+ # multi source _atexit.c
+ CSRC-y += __cxa_atexit.c __cxa_finalize.c __exit_handler.c exit.c on_exit.c
+-CSRC-$(COMPAT_ATEXIT) += old_atexit.c
+ 
+ STDLIB_DIR := $(top_srcdir)libc/stdlib
+ STDLIB_OUT := $(top_builddir)libc/stdlib
+@@ -70,11 +69,12 @@ STDLIB_OBJ := $(patsubst %.c,$(STDLIB_OUT)/%.o,$(CSRC-y))
+ 
+ libc-y += $(STDLIB_OBJ)
+ libc-static-y += $(STDLIB_OUT)/atexit.o $(STDLIB_OUT)/system.o
++libc-static-$(COMPAT_ATEXIT) += $(STDLIB_OUT)/old_atexit.o
+ libc-shared-y += $(STDLIB_OUT)/system.oS
+ 
+ # this should always be the PIC version, because it could be used in shared libs
+ libc-nonshared-y += $(STDLIB_OUT)/atexit.os
+-
++libc-nonshared-$(COMPAT_ATEXIT) += $(STDLIB_OUT)/old_atexit.os
+ libc-nomulti-y += $(STDLIB_OUT)/labs.o $(STDLIB_OUT)/atol.o $(STDLIB_OUT)/_stdlib_strto_l.o $(STDLIB_OUT)/_stdlib_strto_ll.o
+ libc-nomulti-$(UCLIBC_HAS_XLOCALE) += $(STDLIB_OUT)/_stdlib_strto_l_l.o $(STDLIB_OUT)/_stdlib_strto_ll_l.o
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch b/meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
new file mode 100644
index 0000000..ecb9d31
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
@@ -0,0 +1,33 @@
+From 95f9b6f37152b8316735d3c86c0db963ff59e22d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Jun 2012 16:51:52 -0700
+Subject: [PATCH] librt: Use -nodefaultlibs instead of -nostdlib
+
+nostdlib disables linking in startup files too which is not
+what we want here since it needs to resolve __dso_handle
+which comes from crtbeginS.o, otherwise librt has this
+undefined reference to a weak undefined __dso_handle that
+shows up as error (with gold linker)
+when shared libraries are being built which are
+linking in librt
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+---
+ librt/Makefile.in |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: git/librt/Makefile.in
+===================================================================
+--- git.orig/librt/Makefile.in	2012-06-24 10:32:59.512653237 -0700
++++ git/librt/Makefile.in	2012-06-24 11:31:00.660821666 -0700
+@@ -15,6 +15,9 @@
+ ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)
+ LIBS-librt.so += $(top_builddir)lib/libdl.so $(top_builddir)lib/libpthread.so
+ endif
++START_FILE-librt.so := $(SHARED_START_FILES)
++END_FILE-librt.so := $(SHARED_END_FILES)
++
+ 
+ librt_FULL_NAME := librt-$(VERSION).so
+ 
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
new file mode 100644
index 0000000..bf6f2c8
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
@@ -0,0 +1,31 @@
+From 714f543f4fa8fb3911449b6ce1517481359e0cff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Jun 2012 14:21:17 -0700
+Subject: [PATCH] nptl/arm: Move aeabi_read_tp to uclibc_nonshared.a
+
+Otherwise it creates wrong references from shared libs
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+---
+ libc/sysdeps/linux/arm/Makefile.arch |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/arm/Makefile.arch b/libc/sysdeps/linux/arm/Makefile.arch
+index 5fc3e54..8285b9b 100644
+--- a/libc/sysdeps/linux/arm/Makefile.arch
++++ b/libc/sysdeps/linux/arm/Makefile.arch
+@@ -13,7 +13,9 @@ SSRC := \
+ 	vfork.S clone.S
+ 
+ ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)
+-SSRC += libc-aeabi_read_tp.S libc-thumb_atomics.S
++SSRC += libc-thumb_atomics.S
++libc-nonshared-y += $(ARCH_OUT)/libc-aeabi_read_tp.os
++libc-static-y += $(ARCH_OUT)/libc-aeabi_read_tp.o
+ endif
+ 
+ ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),y)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
new file mode 100644
index 0000000..297a40b
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
@@ -0,0 +1,74 @@
+From d021e6252b33e779857846714fb1899a25c9965d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Jun 2012 15:59:01 -0700
+Subject: [PATCH] nptl/atfork: Hide pthread_atfork in shared versions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+---
+ libpthread/nptl/Makefile.in      |    4 +++-
+ libpthread/nptl/pthread_atfork.c |   12 ++++++++++--
+ 2 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/libpthread/nptl/Makefile.in b/libpthread/nptl/Makefile.in
+index 158bcae..3ef7175 100644
+--- a/libpthread/nptl/Makefile.in
++++ b/libpthread/nptl/Makefile.in
+@@ -16,6 +16,7 @@ libc-shared-routines-y = forward.c libc-cancellation.c
+ libc-static-routines-y = alloca_cutoff.c libc-cancellation.c
+ libpthread-shared-only-routines-y = version.c
+ libpthread-static-only-routines-y = pthread_atfork.c
++
+ libpthread-routines- += $(notdir $(wildcard $(libpthread_DIR)/gen_*.c)) # dummy generated files
+ libpthread-routines- += allocatestack.c # dummy included by pthread_create.c
+ libpthread-routines- += pthread_mutex_getprioceiling.c pthread_mutex_setprioceiling.c # XXX: delete those or use them!
+@@ -208,7 +209,7 @@ CFLAGS-msgsnd.c = -fexceptions -fasynchronous-unwind-tables
+ CFLAGS-tcdrain.c = -fexceptions -fasynchronous-unwind-tables
+ 
+ CFLAGS-pt-system.c = -fexceptions -I$(top_srcdir)libc/stdlib
+-
++CFLAGS-pthread_atfork.c = -DNOT_IN_libc
+ #
+ # The rest of this file is uClibc specific.
+ #
+@@ -224,3 +225,4 @@ CFLAGS-OMIT-alloca_cutoff.c = $(CFLAGS-nptl)
+ CFLAGS-OMIT-forward.c = $(CFLAGS-nptl)
+ CFLAGS-OMIT-libc-lowlevelock.c = $(CFLAGS-nptl)
+ CFLAGS-OMIT-libc-cancellation.c = $(CFLAGS-nptl)
++
+diff --git a/libpthread/nptl/pthread_atfork.c b/libpthread/nptl/pthread_atfork.c
+index e607d49..6224c17 100644
+--- a/libpthread/nptl/pthread_atfork.c
++++ b/libpthread/nptl/pthread_atfork.c
+@@ -38,13 +38,17 @@
+ #include <fork.h>
+ 
+ /* This is defined by newer gcc version unique for each module.  */
+-extern void *__dso_handle __attribute__ ((__weak__));
+-					  //,__visibility__ ("hidden")));
++extern void *__dso_handle __attribute__ ((__weak__,
++					  __visibility__ ("hidden")));
+ 
+ 
+ /* Hide the symbol so that no definition but the one locally in the
+    executable or DSO is used.  */
+ int
++#ifndef __pthread_atfork
++/* Don't mark the compatibility function as hidden.  */
++attribute_hidden
++#endif
+ __pthread_atfork (
+      void (*prepare) (void),
+      void (*parent) (void),
+@@ -53,4 +57,8 @@ __pthread_atfork (
+   return __register_atfork (prepare, parent, child,
+ 			    &__dso_handle == NULL ? NULL : __dso_handle);
+ }
++#ifndef __pthread_atfork
++extern int pthread_atfork (void (*prepare) (void), void (*parent) (void),
++	                           void (*child) (void)) attribute_hidden;
+ strong_alias (__pthread_atfork, pthread_atfork)
++#endif
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch b/meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch
new file mode 100644
index 0000000..4e900f3
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch
@@ -0,0 +1,25 @@
+Add definition of MSG_WAITFORONE and MSG_CMSG_CLOEXEC
+
+Upstream-Status: Pending
+
+Index: git/libc/sysdeps/linux/common/bits/socket.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/common/bits/socket.h	2012-01-26 23:23:21.537456132 -0800
++++ git/libc/sysdeps/linux/common/bits/socket.h	2012-01-26 23:25:10.125461388 -0800
+@@ -235,8 +235,15 @@
+ #define	MSG_ERRQUEUE	MSG_ERRQUEUE
+     MSG_NOSIGNAL	= 0x4000, /* Do not generate SIGPIPE.  */
+ #define	MSG_NOSIGNAL	MSG_NOSIGNAL
+-    MSG_MORE		= 0x8000  /* Sender will send more.  */
++    MSG_MORE		= 0x8000,  /* Sender will send more.  */
+ #define	MSG_MORE	MSG_MORE
++    MSG_WAITFORONE      = 0x10000, /* Wait for at least one packet to return.*/
++#define MSG_WAITFORONE  MSG_WAITFORONE
++
++    MSG_CMSG_CLOEXEC    = 0x40000000    /* Set close_on_exit for file
++                                           descriptor received through
++                                           SCM_RIGHTS.  */
++#define MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
+   };
+ 
+ 
diff --git a/meta/recipes-core/uclibc/uclibc-git/dup3.patch b/meta/recipes-core/uclibc/uclibc-git/dup3.patch
new file mode 100644
index 0000000..481f23b
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/dup3.patch
@@ -0,0 +1,37 @@
+Implement dup3()
+
+Upstream-Status: Pending
+
+Index: git/libc/sysdeps/linux/common/dup3.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libc/sysdeps/linux/common/dup3.c	2012-01-27 07:40:52.802900849 -0800
+@@ -0,0 +1,15 @@
++/* vi: set sw=4 ts=4: */
++/*
++ * dup3() for uClibc
++ *
++ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
++ *
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++#include <unistd.h>
++
++
++_syscall3(int, dup3, int, oldfd, int, newfd, int, flags)
++libc_hidden_def(dup3)
+Index: git/include/unistd.h
+===================================================================
+--- git.orig/include/unistd.h	2012-01-27 01:19:17.521792781 -0800
++++ git/include/unistd.h	2012-01-27 07:40:03.106898447 -0800
+@@ -512,6 +512,8 @@
+ /* Duplicate FD to FD2, closing FD2 and making it open on the same file.  */
+ extern int dup2 (int __fd, int __fd2) __THROW;
+ libc_hidden_proto(dup2)
++extern int dup3 (int __fd, int __fd2, int __flags) __THROW;
++libc_hidden_proto(dup3)
+ 
+ /* NULL-terminated array of "NAME=VALUE" environment variables.  */
+ extern char **__environ;
diff --git a/meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch b/meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch
new file mode 100644
index 0000000..46448ba
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch
@@ -0,0 +1,408 @@
+Delivered-To: raj.khem@gmail.com
+Received: by 10.152.129.134 with SMTP id nw6csp47712lab;
+        Tue, 17 Apr 2012 00:30:48 -0700 (PDT)
+Received: by 10.68.216.167 with SMTP id or7mr34112133pbc.140.1334647840512;
+        Tue, 17 Apr 2012 00:30:40 -0700 (PDT)
+Return-Path: <uclibc-bounces@uclibc.org>
+Received: from hemlock.osuosl.org (hemlock.osuosl.org. [140.211.166.133])
+        by mx.google.com with ESMTP id gr10si13305623pbc.339.2012.04.17.00.30.39;
+        Tue, 17 Apr 2012 00:30:40 -0700 (PDT)
+Received-SPF: neutral (google.com: 140.211.166.133 is neither permitted nor denied by best guess record for domain of uclibc-bounces@uclibc.org) client-ip=140.211.166.133;
+Authentication-Results: mx.google.com; spf=neutral (google.com: 140.211.166.133 is neither permitted nor denied by best guess record for domain of uclibc-bounces@uclibc.org) smtp.mail=uclibc-bounces@uclibc.org; dkim=neutral (body hash did not verify) header.i=@gmail.com
+Received: from localhost (localhost [127.0.0.1])
+	by hemlock.osuosl.org (Postfix) with ESMTP id 7C494A0277;
+	Tue, 17 Apr 2012 07:30:39 +0000 (UTC)
+X-Virus-Scanned: amavisd-new at osuosl.org
+Received: from hemlock.osuosl.org ([127.0.0.1])
+	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
+	with ESMTP id ZsSp5xE48GwC; Tue, 17 Apr 2012 07:30:34 +0000 (UTC)
+Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
+	by hemlock.osuosl.org (Postfix) with ESMTP id 1C4F5A0274;
+	Tue, 17 Apr 2012 07:30:33 +0000 (UTC)
+X-Original-To: uclibc@lists.busybox.net
+Delivered-To: uclibc@osuosl.org
+Received: from fraxinus.osuosl.org (fraxinus.osuosl.org [140.211.166.137])
+ by ash.osuosl.org (Postfix) with ESMTP id 17FDE8F75B
+ for <uclibc@lists.busybox.net>; Tue, 17 Apr 2012 07:30:32 +0000 (UTC)
+Received: from localhost (localhost [127.0.0.1])
+ by fraxinus.osuosl.org (Postfix) with ESMTP id 07B491016A1
+ for <uclibc@lists.busybox.net>; Tue, 17 Apr 2012 07:30:32 +0000 (UTC)
+X-Virus-Scanned: amavisd-new at osuosl.org
+Received: from fraxinus.osuosl.org ([127.0.0.1])
+ by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
+ with ESMTP id XKP7jhcUijp4 for <uclibc@lists.busybox.net>;
+ Tue, 17 Apr 2012 07:30:27 +0000 (UTC)
+X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
+Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
+ [74.125.82.174])
+ by fraxinus.osuosl.org (Postfix) with ESMTPS id 2CC0B100190
+ for <uclibc@uclibc.org>; Tue, 17 Apr 2012 07:30:26 +0000 (UTC)
+Received: by wejx9 with SMTP id x9so5218587wej.33
+ for <uclibc@uclibc.org>; Tue, 17 Apr 2012 00:30:25 -0700 (PDT)
+DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
+ h=from:to:cc:subject:date:message-id:x-mailer;
+ bh=vadTQ1GL81XLDadHLtwCrcdL0YvVNNbIuISfTaQphgg=;
+ b=KkyW95PC1TUTmwGt+iBJ8p0FfGtTPAsTlXmul/1iH2p21itEpWkU+WcVd2jBH+jc6L
+ gzf4d6K1pmmfscdbPY3OkpFfvO/v/E4KYN7JmeI+fX1NY+gLBSHhExAVhM1Opue9z09V
+ 54MrEMtlIA9Wo/5QPd1+W7o9gXHYEnMkoqYYZLmfPlG3+pCXZ6RP36fOZnSV44BQgOFz
+ KBqn7XLo6nxgP5X/+JuEe4stvCrI9/66nX30u/Sh77a9poj5pp8hQZmtIpbbm3xRKGnM
+ Fi72jNCq/0nHh3M7eMqn+rvwi1JQjk/90zWNv8v5ShAKqSJVrfqLVN72KjTJtXfLOqbL
+ e2qA==
+Received: by 10.216.133.72 with SMTP id p50mr8903959wei.78.1334647825412;
+ Tue, 17 Apr 2012 00:30:25 -0700 (PDT)
+Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
+ [85.127.86.115])
+ by mx.google.com with ESMTPS id n20sm40466274wiw.5.2012.04.17.00.30.23
+ (version=TLSv1/SSLv3 cipher=OTHER);
+ Tue, 17 Apr 2012 00:30:24 -0700 (PDT)
+Received: from cow by s42.loc with local (Exim 4.77)
+ (envelope-from <rep.dot.nop@gmail.com>)
+ id 1SK2rm-0008Pl-V3; Tue, 17 Apr 2012 09:30:23 +0200
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+To: uclibc@uclibc.org
+Subject: [PATCH,CFT] libc: add posix_fallocate()
+Date: Tue, 17 Apr 2012 09:30:15 +0200
+Message-Id: <1334647815-32315-1-git-send-email-rep.dot.nop@gmail.com>
+X-Mailer: git-send-email 1.7.9.1
+X-BeenThere: uclibc@uclibc.org
+X-Mailman-Version: 2.1.14
+Precedence: list
+List-Id: "Discussion and development of uClibc \(the embedded C library\)"
+ <uclibc.uclibc.org>
+List-Unsubscribe: <http://lists.busybox.net/mailman/options/uclibc>,
+ <mailto:uclibc-request@uclibc.org?subject=unsubscribe>
+List-Archive: <http://lists.busybox.net/pipermail/uclibc>
+List-Post: <mailto:uclibc@uclibc.org>
+List-Help: <mailto:uclibc-request@uclibc.org?subject=help>
+List-Subscribe: <http://lists.busybox.net/mailman/listinfo/uclibc>,
+ <mailto:uclibc-request@uclibc.org?subject=subscribe>
+MIME-Version: 1.0
+Content-Type: text/plain; charset="us-ascii"
+Content-Transfer-Encoding: 7bit
+Errors-To: uclibc-bounces@uclibc.org
+Sender: uclibc-bounces@uclibc.org
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Upstream-Status: Pending
+---
+ include/fcntl.h                                  |    4 +-
+ libc/sysdeps/linux/common/Makefile.in            |    3 +-
+ libc/sysdeps/linux/common/bits/kernel-features.h |    8 ++
+ libc/sysdeps/linux/common/posix_fallocate.c      |   43 ++++++++
+ libc/sysdeps/linux/common/posix_fallocate64.c    |   39 +++++++
+ libc/sysdeps/linux/common/stubs.c                |    4 +
+ test/.gitignore                                  |    1 +
+ test/unistd/Makefile.in                          |    3 +
+ test/unistd/tst-posix_fallocate.c                |  121 ++++++++++++++++++++++
+ 9 files changed, 222 insertions(+), 4 deletions(-)
+ create mode 100644 libc/sysdeps/linux/common/posix_fallocate.c
+ create mode 100644 libc/sysdeps/linux/common/posix_fallocate64.c
+ create mode 100644 test/unistd/tst-posix_fallocate.c
+
+Index: git/include/fcntl.h
+===================================================================
+--- git.orig/include/fcntl.h	2012-06-23 18:47:18.000000000 -0700
++++ git/include/fcntl.h	2012-06-23 18:48:54.805911794 -0700
+@@ -218,9 +218,7 @@
+ 
+ #endif
+ 
+-#if 0 /* && defined __UCLIBC_HAS_ADVANCED_REALTIME__ */
+-
+-/* FIXME -- uClibc should probably implement these... */
++#if defined __UCLIBC_HAS_ADVANCED_REALTIME__
+ 
+ /* Reserve storage for the data of the file associated with FD.
+ 
+Index: git/libc/sysdeps/linux/common/Makefile.in
+===================================================================
+--- git.orig/libc/sysdeps/linux/common/Makefile.in	2012-06-23 18:47:18.000000000 -0700
++++ git/libc/sysdeps/linux/common/Makefile.in	2012-06-23 18:50:14.033915572 -0700
+@@ -81,7 +81,8 @@
+ 	sched_get_priority_max.c sched_get_priority_min.c sched_getscheduler.c \
+ 	sched_rr_get_interval.c sched_setparam.c sched_setscheduler.c sigqueue.c
+ # clock_getcpuclockid|clock_nanosleep|mq_timedreceive|mq_timedsend|posix_fadvise|posix_fallocate|posix_madvise|posix_memalign|posix_mem_offset|posix_spawnattr_destroy|posix_spawnattr_init|posix_spawnattr_getflags|posix_spawnattr_setflags|posix_spawnattr_getpgroup|posix_spawnattr_setpgroup|posix_spawnattr_getschedparam|posix_spawnattr_setschedparam|posix_spawnattr_getschedpolicy|posix_spawnattr_setschedpolicy|posix_spawnattr_getsigdefault|posix_spawnattr_setsigdefault|posix_spawnattr_getsigmask|posix_spawnattr_setsigmask|posix_spawnattr_init|posix_spawnattr_setflags|posix_spawnattr_setpgroup|posix_spawnattr_setschedparam|posix_spawnattr_setschedpolicy|posix_spawnattr_setsigdefault|posix_spawnattr_setsigmask|posix_spawn_file_actions_addclose|posix_spawn_file_actions_addopen|posix_spawn_file_actions_adddup2|posix_spawn_file_actions_addopen|posix_spawn_file_actions_destroy|posix_spawn_file_actions_init|posix_spawn_file_actions_init|posix_spawn|posix_spawnp|posix_spawnp|posix_typed_mem_get_info|pthread_mutex_timedlock|sem_timedwait
+-CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c posix_madvise.c
++CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c posix_madvise.c \
++	posix_fallocate.c posix_fallocate64.c
+ CSRC-$(UCLIBC_SUSV4_LEGACY) += utime.c
+ CSRC-$(UCLIBC_HAS_EPOLL) += epoll.c
+ CSRC-$(UCLIBC_HAS_XATTR) += xattr.c
+Index: git/libc/sysdeps/linux/common/bits/kernel-features.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/common/bits/kernel-features.h	2012-06-23 18:47:18.000000000 -0700
++++ git/libc/sysdeps/linux/common/bits/kernel-features.h	2012-06-23 18:48:54.805911794 -0700
+@@ -494,6 +494,14 @@
+ # define __ASSUME_PRIVATE_FUTEX	1
+ #endif
+ 
++/* Support for fallocate was added in 2.6.23,
++   on s390 only after 2.6.23-rc1, on alpha only after 2.6.33-rc1.  */
++#if __LINUX_KERNEL_VERSION >= 0x020617 \
++    && (!defined __s390__ || __LINUX_KERNEL_VERSION >= 0x020618) \
++    && (!defined __alpha__ || __LINUX_KERNEL_VERSION >= 0x020621)
++# define __ASSUME_FALLOCATE 1
++#endif
++
+ /* getcpu is a syscall for x86-64 since 3.1.  */
+ #if defined __x86_64__ && __LINUX_KERNEL_VERSION >= 0x030100
+ # define __ASSUME_GETCPU_SYSCALL        1
+Index: git/libc/sysdeps/linux/common/posix_fallocate.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libc/sysdeps/linux/common/posix_fallocate.c	2012-06-23 18:48:54.825911795 -0700
+@@ -0,0 +1,43 @@
++/* vi: set sw=4 ts=4: */
++/*
++ * posix_fallocate() for uClibc
++ * http://www.opengroup.org/onlinepubs/9699919799/functions/posix_fallocate.html
++ *
++ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
++ *
++ * Licensed under the LGPL v2.1 or later, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++#include <fcntl.h>
++#include <bits/kernel-features.h>
++#include <stdint.h>
++
++#if defined __NR_fallocate
++int posix_fallocate(int fd, __off_t offset, __off_t len)
++{
++	int ret;
++
++# if __WORDSIZE == 32
++	uint32_t off_low = offset;
++	uint32_t len_low = len;
++	/* may assert that these >>31 are 0 */
++	uint32_t zero = 0;
++	INTERNAL_SYSCALL_DECL(err);
++	ret = (int) (INTERNAL_SYSCALL(fallocate, err, 6, fd, 0,
++		__LONG_LONG_PAIR (zero, off_low),
++		__LONG_LONG_PAIR (zero, len_low)));
++# elif __WORDSIZE == 64
++	INTERNAL_SYSCALL_DECL(err);
++	ret = (int) (INTERNAL_SYSCALL(fallocate, err, 4, fd, 0, offset, len));
++# else
++# error your machine is neither 32 bit or 64 bit ... it must be magical
++#endif
++    if (unlikely(INTERNAL_SYSCALL_ERROR_P (ret, err)))
++      return INTERNAL_SYSCALL_ERRNO (ret, err);
++    return 0;
++}
++# if defined __UCLIBC_HAS_LFS__ && __WORDSIZE == 64
++strong_alias(posix_fallocate,posix_fallocate64)
++# endif
++#endif
+Index: git/libc/sysdeps/linux/common/posix_fallocate64.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libc/sysdeps/linux/common/posix_fallocate64.c	2012-06-23 18:48:54.825911795 -0700
+@@ -0,0 +1,39 @@
++/* vi: set sw=4 ts=4: */
++/*
++ * posix_fallocate() for uClibc
++ * http://www.opengroup.org/onlinepubs/9699919799/functions/posix_fallocate.html
++ *
++ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
++ *
++ * Licensed under the LGPL v2.1 or later, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++#include <fcntl.h>
++#include <bits/kernel-features.h>
++#include <stdint.h>
++
++#if defined __NR_fallocate
++
++# if __WORDSIZE == 64
++/* Can use normal posix_fallocate() */
++# elif __WORDSIZE == 32
++int posix_fallocate64(int fd, __off64_t offset, __off64_t len)
++{
++	int ret;
++	uint32_t off_low = offset & 0xffffffff;
++	uint32_t off_high = offset >> 32;
++	uint32_t len_low = len & 0xffffffff;
++	uint32_t len_high = len >> 32;
++	INTERNAL_SYSCALL_DECL(err);
++	ret = (int) (INTERNAL_SYSCALL(fallocate, err, 6, fd, 0,
++		__LONG_LONG_PAIR (off_high, off_low),
++		__LONG_LONG_PAIR (len_high, len_low)));
++    if (unlikely(INTERNAL_SYSCALL_ERROR_P (ret, err)))
++      return INTERNAL_SYSCALL_ERRNO (ret, err);
++    return 0;
++}
++# else
++# error your machine is neither 32 bit or 64 bit ... it must be magical
++# endif
++#endif
+Index: git/libc/sysdeps/linux/common/stubs.c
+===================================================================
+--- git.orig/libc/sysdeps/linux/common/stubs.c	2012-06-23 18:47:18.000000000 -0700
++++ git/libc/sysdeps/linux/common/stubs.c	2012-06-23 18:48:54.825911795 -0700
+@@ -253,6 +253,10 @@
+ make_ret_stub(posix_fadvise64)
+ #endif
+ 
++#if !defined __NR_fallocate && defined __UCLIBC_HAS_ADVANCED_REALTIME__
++make_ret_stub(posix_fallocate)
++#endif
++
+ #ifndef __NR_madvise
+ make_ret_stub(posix_madvise)
+ #endif
+Index: git/test/.gitignore
+===================================================================
+--- git.orig/test/.gitignore	2012-06-23 18:47:18.000000000 -0700
++++ git/test/.gitignore	2012-06-23 18:48:54.825911795 -0700
+@@ -316,6 +316,7 @@
+ unistd/getopt
+ unistd/getopt_long
+ unistd/tstgetopt
++unistd/tst-posix_fallocate
+ unistd/tst-preadwrite
+ unistd/tst-preadwrite64
+ unistd/vfork
+Index: git/test/unistd/Makefile.in
+===================================================================
+--- git.orig/test/unistd/Makefile.in	2012-06-23 18:47:18.000000000 -0700
++++ git/test/unistd/Makefile.in	2012-06-23 18:48:54.829911795 -0700
+@@ -4,6 +4,9 @@
+ ifeq ($(UCLIBC_HAS_LFS),)
+ TESTS_DISABLED := tst-preadwrite64
+ endif
++ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),)
++TESTS_DISABLED := tst-posix_fallocate
++endif
+ OPTS_getopt      := -abcXXX -9
+ OPTS_getopt_long := --add XXX --delete YYY --verbose
+ ifeq ($(UCLIBC_HAS_GNU_GETOPT),y)
+Index: git/test/unistd/tst-posix_fallocate.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/unistd/tst-posix_fallocate.c	2012-06-23 18:48:54.829911795 -0700
+@@ -0,0 +1,121 @@
++#include <fcntl.h>
++#include <sys/stat.h>
++
++static void do_prepare (void);
++#define PREPARE(argc, argv) do_prepare ()
++static int do_test (void);
++#define TEST_FUNCTION do_test ()
++#include <test-skeleton.c>
++
++static int fd;
++#ifndef O_LARGEFILE
++# error no O_LARGEFILE
++#endif
++static void
++do_prepare (void)
++{
++  fd = create_temp_file ("tst-posix_fallocate.", NULL);
++  if (fd == -1)
++    {
++      printf ("cannot create temporary file: %m\n");
++      exit (1);
++    }
++}
++
++
++static int
++do_test (void)
++{
++  struct stat64 st;
++
++  if (fstat64 (fd, &st) != 0)
++    {
++      puts ("1st fstat failed");
++      return 1;
++    }
++
++  if (st.st_size != 0)
++    {
++      puts ("file not created with size 0");
++      return 1;
++    }
++
++  if (posix_fallocate (fd, 512, 768) != 0)
++    {
++      puts ("1st posix_fallocate call failed");
++      return 1;
++    }
++
++  if (fstat64 (fd, &st) != 0)
++    {
++      puts ("2nd fstat failed");
++      return 1;
++    }
++
++  if (st.st_size != 512 + 768)
++    {
++      printf ("file size after 1st posix_fallocate call is %llu, expected %u\n",
++	      (unsigned long long int) st.st_size, 512u + 768u);
++      return 1;
++    }
++
++  if (posix_fallocate (fd, 0, 1024) != 0)
++    {
++      puts ("2nd posix_fallocate call failed");
++      return 1;
++    }
++
++  if (fstat64 (fd, &st) != 0)
++    {
++      puts ("3rd fstat failed");
++      return 1;
++    }
++
++  if (st.st_size != 512 + 768)
++    {
++      puts ("file size changed in 2nd posix_fallocate");
++      return 1;
++    }
++
++  if (posix_fallocate (fd, 2048, 64) != 0)
++    {
++      puts ("3rd posix_fallocate call failed");
++      return 1;
++    }
++
++  if (fstat64 (fd, &st) != 0)
++    {
++      puts ("4th fstat failed");
++      return 1;
++    }
++
++  if (st.st_size != 2048 + 64)
++    {
++      printf ("file size after 3rd posix_fallocate call is %llu, expected %u\n",
++	      (unsigned long long int) st.st_size, 2048u + 64u);
++      return 1;
++    }
++
++  if (posix_fallocate64 (fd, 4097ULL, 4294967295ULL + 2ULL) != 0)
++    {
++      puts ("4th posix_fallocate call failed");
++      return 1;
++    }
++
++  if (fstat64 (fd, &st) != 0)
++    {
++      puts ("5th fstat failed");
++      return 1;
++    }
++
++  if (st.st_size != 4097ULL + 4294967295ULL + 2ULL)
++    {
++      printf ("file size after 4th posix_fallocate call is %llu, expected %u\n",
++	      (unsigned long long int) st.st_size, 4097ULL + 4294967295ULL + 2ULL);
++      return 1;
++    }
++
++  close (fd);
++
++  return 0;
++}
diff --git a/meta/recipes-core/uclibc/uclibc-git/utmp-locking.patch b/meta/recipes-core/uclibc/uclibc-git/utmp-locking.patch
deleted file mode 100644
index 85efaf2..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/utmp-locking.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-diff --git a/libc/misc/utmp/utent.c b/libc/misc/utmp/utent.c
-index 136ac69..a35bb2b 100644
---- a/libc/misc/utmp/utent.c
-+++ b/libc/misc/utmp/utent.c
-@@ -34,7 +34,7 @@ static const char default_file_name[] = _PATH_UTMP;
- static const char *static_ut_name = default_file_name;
- 
- /* This function must be called with the LOCK held */
--static void __setutent_nolock(void)
-+static void __setutent_unlocked(void)
- {
-     if (static_fd < 0) {
- 	static_fd = open_not_cancel_2(static_ut_name, O_RDWR | O_CLOEXEC);
-@@ -56,12 +56,12 @@ static void __setutent_nolock(void)
- static void __setutent(void)
- {
-     __UCLIBC_MUTEX_LOCK(utmplock);
--    __setutent_nolock();
-+    __setutent_unlocked();
-     __UCLIBC_MUTEX_UNLOCK(utmplock);
- }
- #else
- static void __setutent(void);
--strong_alias(__setutent_nolock,__setutent)
-+strong_alias(__setutent_unlocked,__setutent)
- #endif
- strong_alias(__setutent,setutent)
- 
-@@ -70,7 +70,7 @@ strong_alias(__setutent,setutxent)
- #endif
- 
- /* This function must be called with the LOCK held */
--static struct utmp *__getutent_lock(void)
-+static struct utmp *__getutent_unlocked(void)
- {
-     if (static_fd < 0) {
- 	__setutent();
-@@ -91,13 +91,13 @@ static struct utmp *__getutent(void)
-     struct utmp *ret;
- 
-     __UCLIBC_MUTEX_LOCK(utmplock);
--    ret = __getutent_lock();
-+    ret = __getutent_unlocked();
-     __UCLIBC_MUTEX_UNLOCK(utmplock);
-     return ret;
- }
- #else
- static struct utmp *__getutent(void);
--strong_alias(__getutent_lock,__getutent)
-+strong_alias(__getutent_unlocked,__getutent)
- #endif
- strong_alias(__getutent,getutent)
- 
-@@ -123,7 +123,7 @@ strong_alias(__endutent,endutxent)
- #endif
- 
- /* This function must be called with the LOCK held */
--static struct utmp *__getutid_lock(const struct utmp *utmp_entry)
-+static struct utmp *__getutid_unlocked(const struct utmp *utmp_entry)
- {
-     struct utmp *lutmp;
-     unsigned type;
-@@ -133,7 +133,7 @@ static struct utmp *__getutid_lock(const struct utmp *utmp_entry)
-     type = utmp_entry->ut_type - 1;
-     type /= 4;
- 
--    while ((lutmp = __getutent()) != NULL) {
-+    while ((lutmp = __getutent_unlocked()) != NULL) {
- 	if (type == 0 && lutmp->ut_type == utmp_entry->ut_type)	{
- 	    /* one of RUN_LVL, BOOT_TIME, NEW_TIME, OLD_TIME */
- 	    return lutmp;
-@@ -152,13 +152,13 @@ static struct utmp *__getutid(const struct utmp *utmp_entry)
-     struct utmp *ret;
- 
-     __UCLIBC_MUTEX_LOCK(utmplock);
--    ret = __getutid_lock(utmp_entry);
-+    ret = __getutid_unlocked(utmp_entry);
-     __UCLIBC_MUTEX_UNLOCK(utmplock);
-     return ret;
- }
- #else
- static struct utmp *__getutid(const struct utmp *utmp_entry);
--strong_alias(__getutid_lock,__getutid)
-+strong_alias(__getutid_unlocked,__getutid)
- #endif
- strong_alias(__getutid,getutid)
- 
-@@ -174,7 +174,7 @@ static struct utmp *__getutline(const struct utmp *utmp_entry)
-     struct utmp *lutmp;
- 
-     __UCLIBC_MUTEX_LOCK(utmplock);
--    while ((lutmp = __getutent()) != NULL) {
-+    while ((lutmp = __getutent_unlocked()) != NULL) {
- 	if (lutmp->ut_type == USER_PROCESS || lutmp->ut_type == LOGIN_PROCESS) {
- 	    if (strncmp(lutmp->ut_line, utmp_entry->ut_line, sizeof(lutmp->ut_line)) == 0) {
- 		break;
-@@ -200,7 +200,7 @@ static struct utmp *__pututline(const struct utmp *utmp_entry)
-        the file pointer where they want it, everything will work out. */
-     lseek(static_fd, (off_t) - sizeof(struct utmp), SEEK_CUR);
- 
--    if (__getutid(utmp_entry) != NULL)
-+    if (__getutid_unlocked(utmp_entry) != NULL)
- 	lseek(static_fd, (off_t) - sizeof(struct utmp), SEEK_CUR);
-     else
- 	lseek(static_fd, (off_t) 0, SEEK_END);
-
-- 
1.7.9.5



