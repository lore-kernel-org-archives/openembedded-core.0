Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShMrj-0001E3-6e
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:30:43 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so729762pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WtApz1epYpJvtUBpcYlcU/burT+CHaFA8cqvvxbn2qw=;
	b=jQdY1gde16stvT5rJUP0KqMJJjxFXSwRKbltPkXtCpF4UE9jmOax4zAk7fEwTZ4GFL
	I10K14GANg/uw6YfEOyn4XnvkykhEljAzSBY/vo+hHdYl7plp4U8ypoK1UE7t8GaugFy
	/1LbpaiGJL8ZX5rkAJ89tVciHrZvfNSIRlXKeHnO2iJScOgr4Qz2U3oku3fKsJ7pTqPP
	do9zJLMP3kqPMgvyzbDJwzi5kzIuK4Ben04hqYcsylD9EO1XDmljr2qqS9hwJN+dRLRE
	H7nNCH3esOJUiU6JfYYfqGUMZogV81SBAjXtPQKI6uQuqcKlfl7qbKH/igD0YUtS468M
	YU5A==
Received: by 10.68.222.9 with SMTP id qi9mr77345301pbc.164.1340205600227;
	Wed, 20 Jun 2012 08:20:00 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id jw3sm32227422pbc.65.2012.06.20.08.19.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 08:19:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 08:18:36 -0700
Message-Id: <b69f84fe9eeede659eb8f390497ccb764e37f880.1340205163.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1340205163.git.raj.khem@gmail.com>
References: <cover.1340205163.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] uclibc-git: Upgrade to latest tip of master
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
X-List-Received-Date: Wed, 20 Jun 2012 15:30:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/argp-support.patch           |  136 ++++++++++----------
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |   27 ----
 .../uclibc/uclibc-git/orign_path.patch             |   47 ++++----
 meta/recipes-core/uclibc/uclibc_git.bb             |    3 +-
 4 files changed, 93 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/argp-support.patch b/meta/recipes-core/uclibc/uclibc-git/argp-support.patch
index 3e9680f..bcec6a5 100644
--- a/meta/recipes-core/uclibc/uclibc-git/argp-support.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/argp-support.patch
@@ -74,9 +74,9 @@ Upstream-Status: Pending
 
 Index: git/Makefile.in
 ===================================================================
---- git.orig/Makefile.in
-+++ git/Makefile.in
-@@ -48,6 +48,7 @@ include $(top_srcdir)libresolv/Makefile.
+--- git.orig/Makefile.in	2012-06-18 13:10:12.000000000 -0700
++++ git/Makefile.in	2012-06-18 13:12:06.448829343 -0700
+@@ -48,6 +48,7 @@
  include $(top_srcdir)libutil/Makefile.in
  include $(top_srcdir)libpthread/Makefile.in
  include $(top_srcdir)librt/Makefile.in
@@ -84,7 +84,7 @@ Index: git/Makefile.in
  include $(top_srcdir)libubacktrace/Makefile.in
  include $(top_srcdir)extra/locale/Makefile.in
  
-@@ -230,6 +231,7 @@ HEADERS_RM- += sgtty.h
+@@ -250,6 +251,7 @@
  endif
  HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h
  HEADERS_RM-$(PTHREADS_DEBUG_SUPPORT)         += thread_db.h
@@ -92,10 +92,10 @@ Index: git/Makefile.in
  HEADERS_RM-$(UCLIBC_HAS_BSD_ERR)             += err.h
  HEADERS_RM-$(UCLIBC_HAS_CRYPT)               += crypt.h
  HEADERS_RM-$(UCLIBC_HAS_EPOLL)               += sys/epoll.h
-@@ -340,6 +342,12 @@ ifeq ($(UCLIBC_HAS_BACKTRACE),y)
- 		echo "GROUP ( $(UBACKTRACE_ASNEEDED) )" >> $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)/libc.so; \
- 	fi
+@@ -368,6 +370,12 @@
+ 	-$(INSTALL) -m 755 $(top_builddir)lib/libc.so $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)/
  endif
+ 	echo "$(UBACKTRACE_ASNEEDED)" >> $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)/libc.so
 +ifeq ($(UCLIBC_HAS_ARGP),y)
 +# Add the AS_NEEDED entry for libuargp.so
 +	if [ -f $(top_builddir)lib/libc.so -a -f $(PREFIX)$(RUNTIME_PREFIX)lib/$(SHARED_MAJORNAME) ] ; then \
@@ -107,9 +107,9 @@ Index: git/Makefile.in
  ifeq ($(HARDWIRED_ABSPATH),y)
 Index: git/Makerules
 ===================================================================
---- git.orig/Makerules
-+++ git/Makerules
-@@ -32,12 +32,12 @@ shared_objs = $(libc-y:.o=.os) $(libc-sh
+--- git.orig/Makerules	2012-06-18 13:10:12.000000000 -0700
++++ git/Makerules	2012-06-18 13:10:44.052825547 -0700
+@@ -32,12 +32,12 @@
  	$(libpthread-so-y) $(libpthread-nonshared-y) $(libthread_db-so-y) \
  	$(libresolv-so-y) $(librt-so-y) \
  	$(ldso-y) \
@@ -124,7 +124,7 @@ Index: git/Makerules
  ifeq ($(DOPIC),y)
  ar_objs := $(ar_objs:.o=.os)
  endif
-@@ -464,7 +464,7 @@ files.dep := $(libc-a-y) $(libc-so-y) $(
+@@ -472,7 +472,7 @@
  	$(librt-a-y) $(librt-so-y)  $(libresolv-a-y) $(libresolv-so-y) \
  	$(libcrypt-a-y) $(libcrypt-so-y) $(libutil-a-y) $(libutil-so-y) \
  	$(libnsl-a-y) $(libnsl-so-y) $(ldso-y) $(libdl-a-y) $(libdl-so-y) \
@@ -135,9 +135,9 @@ Index: git/Makerules
  	$(patsubst %.o,%.o.dep,$(filter %.o,$(files.dep))) \
 Index: git/Rules.mak
 ===================================================================
---- git.orig/Rules.mak
-+++ git/Rules.mak
-@@ -525,6 +525,13 @@ export UBACKTRACE_ASNEEDED:=$(shell $(LD
+--- git.orig/Rules.mak	2012-06-18 13:10:12.000000000 -0700
++++ git/Rules.mak	2012-06-18 13:10:44.056825544 -0700
+@@ -589,6 +589,13 @@
  else
  export UBACKTRACE_ASNEEDED:=""
  endif
@@ -153,9 +153,9 @@ Index: git/Rules.mak
  # Add a bunch of extra pedantic annoyingly strict checks
 Index: git/extra/Configs/Config.in
 ===================================================================
---- git.orig/extra/Configs/Config.in
-+++ git/extra/Configs/Config.in
-@@ -1814,6 +1814,23 @@ config UCLIBC_HAS_GNU_GETSUBOPT
+--- git.orig/extra/Configs/Config.in	2012-06-18 13:10:12.000000000 -0700
++++ git/extra/Configs/Config.in	2012-06-18 13:10:44.056825544 -0700
+@@ -1853,6 +1853,23 @@
  	  smaller SUSv3 compatible getsubopt().
  
  	  Most people will answer Y.
@@ -181,8 +181,8 @@ Index: git/extra/Configs/Config.in
  
 Index: git/libc/sysdeps/linux/common/bits/getopt_int.h
 ===================================================================
---- /dev/null
-+++ git/libc/sysdeps/linux/common/bits/getopt_int.h
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libc/sysdeps/linux/common/bits/getopt_int.h	2012-06-18 13:10:44.056825544 -0700
 @@ -0,0 +1,136 @@
 +/* Internal declarations for getopt.
 +   Copyright (C) 1989-1994,1996-1999,2001,2003,2004
@@ -322,9 +322,9 @@ Index: git/libc/sysdeps/linux/common/bits/getopt_int.h
 +#endif /* getopt_int.h */
 Index: git/libc/unistd/getopt.c
 ===================================================================
---- git.orig/libc/unistd/getopt.c
-+++ git/libc/unistd/getopt.c
-@@ -119,7 +119,7 @@
+--- git.orig/libc/unistd/getopt.c	2012-06-18 13:10:12.000000000 -0700
++++ git/libc/unistd/getopt.c	2012-06-18 13:10:44.056825544 -0700
+@@ -106,7 +106,7 @@
     they can distinguish the relative order of options and other arguments.  */
  
  #include <getopt.h>
@@ -333,7 +333,7 @@ Index: git/libc/unistd/getopt.c
  
  
  /* For communication from `getopt' to the caller.
-@@ -1183,6 +1183,15 @@ getopt_long (int argc, char *const *argv
+@@ -1170,6 +1170,15 @@
    return _getopt_internal (argc, argv, options, long_options, opt_index, 0);
  }
  
@@ -349,7 +349,7 @@ Index: git/libc/unistd/getopt.c
  /* Like getopt_long, but '-' as well as '--' can indicate a long option.
     If an option that starts with '-' (not '--') doesn't match a long option,
     but does match a short option, it is parsed as a short option
-@@ -1195,4 +1204,12 @@ getopt_long_only (int argc, char *const
+@@ -1182,4 +1191,12 @@
    return _getopt_internal (argc, argv, options, long_options, opt_index, 1);
  }
  
@@ -364,8 +364,8 @@ Index: git/libc/unistd/getopt.c
  #endif	/* Not ELIDE_CODE.  */
 Index: git/libuargp/Makefile
 ===================================================================
---- /dev/null
-+++ git/libuargp/Makefile
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/Makefile	2012-06-18 13:10:44.056825544 -0700
 @@ -0,0 +1,14 @@
 +# Makefile for uClibc (libuargp)
 +#
@@ -383,8 +383,8 @@ Index: git/libuargp/Makefile
 +include $(top_srcdir)Makerules
 Index: git/libuargp/Makefile.in
 ===================================================================
---- /dev/null
-+++ git/libuargp/Makefile.in
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/Makefile.in	2012-06-18 13:10:44.056825544 -0700
 @@ -0,0 +1,73 @@
 +# Makefile for uClibc (libuargp)
 +#
@@ -461,8 +461,8 @@ Index: git/libuargp/Makefile.in
 +	$(do_rm) $(addprefix $(libuargp_OUT)/*., o os oS a)
 Index: git/libuargp/argp-ba.c
 ===================================================================
---- /dev/null
-+++ git/libuargp/argp-ba.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/argp-ba.c	2012-06-18 13:10:44.056825544 -0700
 @@ -0,0 +1,26 @@
 +/* Default definition for ARGP_PROGRAM_BUG_ADDRESS.
 +   Copyright (C) 1996, 1997, 1999 Free Software Foundation, Inc.
@@ -492,8 +492,8 @@ Index: git/libuargp/argp-ba.c
 +const char *argp_program_bug_address;
 Index: git/libuargp/argp-eexst.c
 ===================================================================
---- /dev/null
-+++ git/libuargp/argp-eexst.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/argp-eexst.c	2012-06-18 13:10:44.056825544 -0700
 @@ -0,0 +1,32 @@
 +/* Default definition for ARGP_ERR_EXIT_STATUS
 +   Copyright (C) 1997 Free Software Foundation, Inc.
@@ -529,8 +529,8 @@ Index: git/libuargp/argp-eexst.c
 +error_t argp_err_exit_status = EX_USAGE;
 Index: git/libuargp/argp-fmtstream.c
 ===================================================================
---- /dev/null
-+++ git/libuargp/argp-fmtstream.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/argp-fmtstream.c	2012-06-18 13:10:44.056825544 -0700
 @@ -0,0 +1,439 @@
 +/* Word-wrapping and line-truncating streams
 +   Copyright (C) 1997-1999,2001,2002,2003,2005 Free Software Foundation, Inc.
@@ -973,8 +973,8 @@ Index: git/libuargp/argp-fmtstream.c
 +#endif /* !ARGP_FMTSTREAM_USE_LINEWRAP */
 Index: git/libuargp/argp-fmtstream.h
 ===================================================================
---- /dev/null
-+++ git/libuargp/argp-fmtstream.h
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/argp-fmtstream.h	2012-06-18 13:10:44.056825544 -0700
 @@ -0,0 +1,314 @@
 +/* Word-wrapping and line-truncating streams.
 +   Copyright (C) 1997 Free Software Foundation, Inc.
@@ -1292,8 +1292,8 @@ Index: git/libuargp/argp-fmtstream.h
 +#endif /* argp-fmtstream.h */
 Index: git/libuargp/argp-fs-xinl.c
 ===================================================================
---- /dev/null
-+++ git/libuargp/argp-fs-xinl.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/argp-fs-xinl.c	2012-06-18 13:10:44.056825544 -0700
 @@ -0,0 +1,44 @@
 +/* Real definitions for extern inline functions in argp-fmtstream.h
 +   Copyright (C) 1997, 2003, 2004 Free Software Foundation, Inc.
@@ -1341,8 +1341,8 @@ Index: git/libuargp/argp-fs-xinl.c
 +#endif
 Index: git/libuargp/argp-help.c
 ===================================================================
---- /dev/null
-+++ git/libuargp/argp-help.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/argp-help.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,1882 @@
 +/* Hierarchial argument parsing help output
 +   Copyright (C) 1995-2003, 2004, 2005, 2006, 2007
@@ -3228,8 +3228,8 @@ Index: git/libuargp/argp-help.c
 +}
 Index: git/libuargp/argp-parse.c
 ===================================================================
---- /dev/null
-+++ git/libuargp/argp-parse.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/argp-parse.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,949 @@
 +/* Hierarchial argument parsing, layered over getopt
 +   Copyright (C) 1995-2000, 2002, 2003, 2004 Free Software Foundation, Inc.
@@ -4182,8 +4182,8 @@ Index: git/libuargp/argp-parse.c
 +}
 Index: git/libuargp/argp-pv.c
 ===================================================================
---- /dev/null
-+++ git/libuargp/argp-pv.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/argp-pv.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,25 @@
 +/* Default definition for ARGP_PROGRAM_VERSION.
 +   Copyright (C) 1996, 1997, 1999 Free Software Foundation, Inc.
@@ -4212,8 +4212,8 @@ Index: git/libuargp/argp-pv.c
 +const char *argp_program_version;
 Index: git/libuargp/argp-pvh.c
 ===================================================================
---- /dev/null
-+++ git/libuargp/argp-pvh.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/argp-pvh.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,32 @@
 +/* Default definition for ARGP_PROGRAM_VERSION_HOOK.
 +   Copyright (C) 1996, 1997, 1999 Free Software Foundation, Inc.
@@ -4249,8 +4249,8 @@ Index: git/libuargp/argp-pvh.c
 +void (*argp_program_version_hook) (FILE *stream, struct argp_state *state);
 Index: git/libuargp/argp-xinl.c
 ===================================================================
---- /dev/null
-+++ git/libuargp/argp-xinl.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libuargp/argp-xinl.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,35 @@
 +/* Real definitions for extern inline functions in argp.h
 +   Copyright (C) 1997, 1998, 2004 Free Software Foundation, Inc.
@@ -4289,8 +4289,8 @@ Index: git/libuargp/argp-xinl.c
 +#include <argp.h>
 Index: git/test/argp/Makefile
 ===================================================================
---- /dev/null
-+++ git/test/argp/Makefile
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/argp/Makefile	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,7 @@
 +# uClibc argp tests
 +# Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
@@ -4301,8 +4301,8 @@ Index: git/test/argp/Makefile
 +include ../Test.mak
 Index: git/test/argp/Makefile.in
 ===================================================================
---- /dev/null
-+++ git/test/argp/Makefile.in
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/argp/Makefile.in	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,12 @@
 +# uClibc argp tests
 +# Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
@@ -4318,8 +4318,8 @@ Index: git/test/argp/Makefile.in
 +
 Index: git/test/argp/argp-ex1.c
 ===================================================================
---- /dev/null
-+++ git/test/argp/argp-ex1.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/argp/argp-ex1.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,15 @@
 +/* Argp example #1 -- a minimal program using argp */
 +
@@ -4338,8 +4338,8 @@ Index: git/test/argp/argp-ex1.c
 +}
 Index: git/test/argp/argp-ex2.c
 ===================================================================
---- /dev/null
-+++ git/test/argp/argp-ex2.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/argp/argp-ex2.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,45 @@
 +/* Argp example #2 -- a pretty minimal program using argp */
 +
@@ -4388,8 +4388,8 @@ Index: git/test/argp/argp-ex2.c
 +}
 Index: git/test/argp/argp-ex3.c
 ===================================================================
---- /dev/null
-+++ git/test/argp/argp-ex3.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/argp/argp-ex3.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,153 @@
 +/* Argp example #3 -- a program with options and arguments using argp */
 +
@@ -4546,8 +4546,8 @@ Index: git/test/argp/argp-ex3.c
 +}
 Index: git/test/argp/argp-ex4.c
 ===================================================================
---- /dev/null
-+++ git/test/argp/argp-ex4.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/argp/argp-ex4.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,167 @@
 +/* Argp example #4 -- a program with somewhat more complicated options */
 +
@@ -4718,8 +4718,8 @@ Index: git/test/argp/argp-ex4.c
 +}
 Index: git/test/argp/argp-test.c
 ===================================================================
---- /dev/null
-+++ git/test/argp/argp-test.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/argp/argp-test.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,209 @@
 +/* Test program for argp argument parser
 +   Copyright (C) 1997 Free Software Foundation, Inc.
@@ -4932,8 +4932,8 @@ Index: git/test/argp/argp-test.c
 +}
 Index: git/test/argp/bug-argp1.c
 ===================================================================
---- /dev/null
-+++ git/test/argp/bug-argp1.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/argp/bug-argp1.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,26 @@
 +#include <argp.h>
 +
@@ -4963,8 +4963,8 @@ Index: git/test/argp/bug-argp1.c
 +#include "../test-skeleton.c"
 Index: git/test/argp/tst-argp1.c
 ===================================================================
---- /dev/null
-+++ git/test/argp/tst-argp1.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/argp/tst-argp1.c	2012-06-18 13:10:44.060825542 -0700
 @@ -0,0 +1,118 @@
 +/* Copyright (C) 2002, 2003 Free Software Foundation, Inc.
 +   This file is part of the GNU C Library.
@@ -5086,8 +5086,8 @@ Index: git/test/argp/tst-argp1.c
 +#include "../test-skeleton.c"
 Index: git/test/argp/tst-argp2.c
 ===================================================================
---- /dev/null
-+++ git/test/argp/tst-argp2.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/test/argp/tst-argp2.c	2012-06-18 13:10:44.064825538 -0700
 @@ -0,0 +1,101 @@
 +/* Copyright (C) 2007 Free Software Foundation, Inc.
 +   This file is part of the GNU C Library.
diff --git a/meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch b/meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
deleted file mode 100644
index d44acca..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-resolver code should always be in arm mode
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: uClibc/ldso/ldso/arm/resolve.S
-===================================================================
---- uClibc.orig/ldso/ldso/arm/resolve.S	2009-03-20 12:03:32.000000000 -0700
-+++ uClibc/ldso/ldso/arm/resolve.S	2009-03-20 12:04:23.000000000 -0700
-@@ -97,7 +97,6 @@
- 
-  .text
-  .align 4      @ 16 byte boundary and there are 32 bytes below (arm case)
-- #if !defined(__thumb__) || defined(__thumb2__)
-  .arm
-  .globl _dl_linux_resolve
-  .type _dl_linux_resolve,%function
-@@ -129,7 +128,7 @@
- #else
- 	mov pc,ip
- #endif
--#else
-+#if 0
-        @ In the thumb case _dl_linux_resolver is thumb.  If a bl is used
-        @ from arm code the linker will insert a stub call which, with
-        @ binutils 2.16, is not PIC.  Since this code is accessed by an
diff --git a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch b/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
index c9c15a3..81bb8f8 100644
--- a/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/orign_path.patch
@@ -5,9 +5,9 @@ Upstream-Status: Pending
 
 Index: git/ldso/ldso/dl-elf.c
 ===================================================================
---- git.orig/ldso/ldso/dl-elf.c	2012-01-23 19:18:58.000000000 -0800
-+++ git/ldso/ldso/dl-elf.c	2012-01-23 21:52:06.144646590 -0800
-@@ -133,53 +133,60 @@
+--- git.orig/ldso/ldso/dl-elf.c	2012-06-19 18:29:08.629931662 -0700
++++ git/ldso/ldso/dl-elf.c	2012-06-19 21:21:14.798431393 -0700
+@@ -133,56 +133,60 @@
   * in uClibc/ldso/util/ldd.c */
  static struct elf_resolve *
  search_for_named_library(const char *name, unsigned rflags, const char *path_list,
@@ -16,9 +16,9 @@ Index: git/ldso/ldso/dl-elf.c
  {
 -	char *path, *path_n, *mylibname;
 +	char *mylibname;
-+	const char *p, *pn;
  	struct elf_resolve *tpnt;
 -	int done;
++	const char *p, *pn;
 +	int plen;
  
  	if (path_list==NULL)
@@ -82,24 +82,25 @@ Index: git/ldso/ldso/dl-elf.c
 -				_dl_strcpy(mylibname, "."); /* Assume current dir if empty path */
 -			_dl_strcat(mylibname, "/");
 -			_dl_strcat(mylibname, name);
--			if ((tpnt = _dl_load_elf_shared_library(rflags, rpnt, mylibname)) != NULL)
--				return tpnt;
++		_dl_strcat(mylibname, "/");
++		_dl_strcat(mylibname, name);
+ #ifdef __LDSO_SAFE_RUNPATH__
+-			if (*mylibname == '/')
++		if (*mylibname == '/')
+ #endif
+-				if ((tpnt = _dl_load_elf_shared_library(rflags, rpnt, mylibname)) != NULL)
+-					return tpnt;
 -			path_n = path+1;
 -		}
 -		path++;
 -	} while (!done);
-+		_dl_strcat(mylibname, "/");
-+		_dl_strcat(mylibname, name);
-+
-+		tpnt = _dl_load_elf_shared_library(rflags, rpnt, mylibname);
-+		if (tpnt != NULL)
++		if ((tpnt = _dl_load_elf_shared_library(rflags, rpnt, mylibname)) != NULL)
 +			return tpnt;
 +	}
-+
  	return NULL;
  }
  
-@@ -231,8 +238,10 @@
+@@ -234,8 +238,10 @@
  	if (pnt) {
  		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
  		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
@@ -111,7 +112,7 @@ Index: git/ldso/ldso/dl-elf.c
  	}
  #endif
  
-@@ -240,7 +249,7 @@
+@@ -243,7 +249,7 @@
  	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
  	if (_dl_library_path) {
  		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
@@ -120,7 +121,7 @@ Index: git/ldso/ldso/dl-elf.c
  		{
  			return tpnt1;
  		}
-@@ -254,7 +263,7 @@
+@@ -257,7 +263,7 @@
  	if (pnt) {
  		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
  		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
@@ -129,7 +130,7 @@ Index: git/ldso/ldso/dl-elf.c
  			return tpnt1;
  	}
  #endif
-@@ -288,7 +297,7 @@
+@@ -291,7 +297,7 @@
  	/* Look for libraries wherever the shared library loader
  	 * was installed */
  	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
@@ -138,7 +139,7 @@ Index: git/ldso/ldso/dl-elf.c
  	if (tpnt1 != NULL)
  		return tpnt1;
  #endif
-@@ -301,7 +310,7 @@
+@@ -304,7 +310,7 @@
  #ifndef __LDSO_CACHE_SUPPORT__
  					":" UCLIBC_RUNTIME_PREFIX "usr/X11R6/lib"
  #endif
@@ -149,9 +150,9 @@ Index: git/ldso/ldso/dl-elf.c
  
 Index: git/ldso/ldso/ldso.c
 ===================================================================
---- git.orig/ldso/ldso/ldso.c	2012-01-23 19:18:58.000000000 -0800
-+++ git/ldso/ldso/ldso.c	2012-01-23 21:34:11.152594621 -0800
-@@ -407,6 +407,20 @@
+--- git.orig/ldso/ldso/ldso.c	2012-06-19 18:29:08.633931663 -0700
++++ git/ldso/ldso/ldso.c	2012-06-19 18:29:10.197931738 -0700
+@@ -403,6 +403,20 @@
  	return p - list;
  }
  
@@ -172,7 +173,7 @@ Index: git/ldso/ldso/ldso.c
  void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
  			  ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp, char **argv
  			  DL_GET_READY_TO_RUN_EXTRA_PARMS)
-@@ -458,9 +472,7 @@
+@@ -454,9 +468,7 @@
  	 * been fixed up by now.  Still no function calls outside of this
  	 * library, since the dynamic resolver is not yet ready.
  	 */
@@ -181,5 +182,5 @@ Index: git/ldso/ldso/ldso.c
 -	}
 +	_dl_setup_progname(argv[0]);
  
- #ifndef __LDSO_STANDALONE_SUPPORT__
- 	if (_start == (void *) auxvt[AT_ENTRY].a_un.a_val) {
+ #ifdef __DSBT__
+ 	_dl_ldso_dsbt = (void *)tpnt->dynamic_info[DT_DSBT_BASE_IDX];
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 33f155f..1744c48 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -1,4 +1,4 @@
-SRCREV="e118373cbb58ba5ffa5fb6670957678d5b87cdb9"
+SRCREV="0dcc13bf7a61b1d0708e5dd103d5515e0ffec79a"
 
 require uclibc.inc
 
@@ -15,7 +15,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://uClibc.machine \
 	file://uClibc.distro \
 	file://uclibc_enable_log2_test.patch \
-	file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch \
 	file://powerpc_copysignl.patch \
 	file://argp-support.patch \
 	file://argp-headers.patch \
-- 
1.7.5.4



