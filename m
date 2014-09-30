Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86B2D65F77
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 09:34:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8U9YFJl026738
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 02:34:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 02:34:14 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Sep 2014 17:33:05 +0800
Message-ID: <e5de510ded9ca2d3d09f9c1e4f8ab46fb4603ab0.1412068157.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1412068156.git.Chong.Lu@windriver.com>
References: <cover.1412068156.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] strace: Upgrade to 4.9
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
X-List-Received-Date: Tue, 30 Sep 2014 09:34:19 -0000
Content-Type: text/plain

Remove two backported patches:
0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch
strace-fix-64-bit-process-detection.patch

Update two patches to fit new version:
Makefile-ptest.patch
strace-add-configure-options.patch

Add coreutils, grep and gawk to RDEPENDS_${PN}-ptest for making
ptest pass.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 ...-conflict-between-sys-ptrace.h-and-linux-.patch | 108 ---------------------
 .../strace-fix-64-bit-process-detection.patch      |  34 -------
 .../Makefile-ptest.patch                           |  44 ++++++---
 .../{strace-4.8 => strace-4.9}/git-version-gen     |   0
 .../strace/{strace-4.8 => strace-4.9}/run-ptest    |   0
 .../strace-add-configure-options.patch             |  37 ++++---
 .../strace/{strace_4.8.bb => strace_4.9.bb}        |   8 +-
 7 files changed, 52 insertions(+), 179 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace-4.8/0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.8/strace-fix-64-bit-process-detection.patch
 rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/Makefile-ptest.patch (61%)
 rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/git-version-gen (100%)
 rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/run-ptest (100%)
 rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/strace-add-configure-options.patch (63%)
 rename meta/recipes-devtools/strace/{strace_4.8.bb => strace_4.9.bb} (77%)

diff --git a/meta/recipes-devtools/strace/strace-4.8/0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch b/meta/recipes-devtools/strace/strace-4.8/0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch
deleted file mode 100644
index 5a0090e..0000000
--- a/meta/recipes-devtools/strace/strace-4.8/0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-Upstream-Status: Backport
-
-From 0b4060f61f1bb101b5d8d084714b7d2feacdb199 Mon Sep 17 00:00:00 2001
-From: Ali Polatel <alip@exherbo.org>
-Date: Tue, 24 Sep 2013 20:04:32 +0300
-Subject: [PATCH] Work around conflict between <sys/ptrace.h> and
- <linux/ptrace.h>
-
-Since glibc-2.18~39 <sys/ptrace.h> defines ptrace_peeksiginfo_args
-which collides with <linux/ptrace.h>.
-
-* configure.ac: Check for `struct ptrace_peeksiginfo_args' in
-<sys/ptrace.h>.
-* process.c: Work around potential conflict between <sys/ptrace.h>
-and <linux/ptrace.h> by redefining ptrace_peeksiginfo_args.
-* signal.c: Likewise.
-* syscall.c: Likewise.
-* util.c: Likewise.
-
-Signed-off-by: Ali Polatel <alip@exherbo.org>
----
- configure.ac | 2 +-
- process.c    | 4 ++++
- signal.c     | 4 ++++
- syscall.c    | 4 ++++
- util.c       | 4 ++++
- 5 files changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f19e4f2..aa4923a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -257,7 +257,7 @@ AC_CHECK_MEMBERS([struct T_conn_res.QUEUE_ptr,
- 
- AC_CHECK_TYPES([struct __old_kernel_stat],,, [#include <asm/stat.h>])
- 
--AC_CHECK_TYPES([struct pt_all_user_regs, struct ia64_fpreg],,,
-+AC_CHECK_TYPES([struct pt_all_user_regs, struct ia64_fpreg, struct ptrace_peeksiginfo_args],,,
- 	       [#include <sys/ptrace.h>])
- 
- AC_CHECK_TYPES([struct user_desc],,, [#include <asm/ldt.h>])
-diff --git a/process.c b/process.c
-index 1a2181b..59428a4 100644
---- a/process.c
-+++ b/process.c
-@@ -63,7 +63,11 @@
- # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
- #  define pt_all_user_regs XXX_pt_all_user_regs
- # endif
-+# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
-+#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
-+# endif
- # include <linux/ptrace.h>
-+# undef ptrace_peeksiginfo_args
- # undef ia64_fpreg
- # undef pt_all_user_regs
- #endif
-diff --git a/signal.c b/signal.c
-index 7fb9abf..3411ddd 100644
---- a/signal.c
-+++ b/signal.c
-@@ -51,7 +51,11 @@
- # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
- #  define pt_all_user_regs XXX_pt_all_user_regs
- # endif
-+# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
-+#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
-+# endif
- # include <linux/ptrace.h>
-+# undef ptrace_peeksiginfo_args
- # undef ia64_fpreg
- # undef pt_all_user_regs
- #endif
-diff --git a/syscall.c b/syscall.c
-index 83a95bd..3477dcd 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -48,7 +48,11 @@
- # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
- #  define pt_all_user_regs XXX_pt_all_user_regs
- # endif
-+# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
-+#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
-+# endif
- # include <linux/ptrace.h>
-+# undef ptrace_peeksiginfo_args
- # undef ia64_fpreg
- # undef pt_all_user_regs
- #endif
-diff --git a/util.c b/util.c
-index 0dab902..30a7f19 100644
---- a/util.c
-+++ b/util.c
-@@ -55,7 +55,11 @@
- # ifdef HAVE_STRUCT_PT_ALL_USER_REGS
- #  define pt_all_user_regs XXX_pt_all_user_regs
- # endif
-+# ifdef HAVE_STRUCT_PTRACE_PEEKSIGINFO_ARGS
-+#  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
-+# endif
- # include <linux/ptrace.h>
-+# undef ptrace_peeksiginfo_args
- # undef ia64_fpreg
- # undef pt_all_user_regs
- #endif
--- 
-1.8.2.1
-
diff --git a/meta/recipes-devtools/strace/strace-4.8/strace-fix-64-bit-process-detection.patch b/meta/recipes-devtools/strace/strace-4.8/strace-fix-64-bit-process-detection.patch
deleted file mode 100644
index a6579df..0000000
--- a/meta/recipes-devtools/strace/strace-4.8/strace-fix-64-bit-process-detection.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-powerpc64: fix 64-bit process detection on embedded
-
-* syscall.c (get_scno) [POWERPC64]: Fix 64-bit process detection
-on embedded powerpc.
-
-Upstream-Status: Backport
-
-Signed-off-by: James Yang <james.yang@freescale.com>
-Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
-
-diff --git a/syscall.c.orig b/syscall.c
-index 7efee0e..72d9453 100644
---- a/syscall.c.orig
-+++ b/syscall.c
-@@ -1207,11 +1207,14 @@ get_scno(struct tcb *tcp)
- 	/* Check for 64/32 bit mode. */
- 	if (upeek(tcp, sizeof(unsigned long)*PT_MSR, &val) < 0)
- 		return -1;
--	/* SF is bit 0 of MSR */
--	if (val < 0)
--		currpers = 0;
--	else
--		currpers = 1;
-+
-+	/*
-+	 * Check for 64/32 bit mode.
-+	 * Embedded implementations covered by Book E extension of PPC use
-+	 * bit 0 (CM) of 32-bit Machine state register (MSR).
-+	 * Other implementations use bit 0 (SF) of 64-bit MSR.
-+	 */
-+	currpers = (val & 0x8000000080000000) ? 0 : 1;
- 	update_personality(tcp, currpers);
- # endif
- #elif defined(AVR32)
diff --git a/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace-4.9/Makefile-ptest.patch
similarity index 61%
rename from meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
rename to meta/recipes-devtools/strace/strace-4.9/Makefile-ptest.patch
index 3a0eb39..df01310 100644
--- a/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace-4.9/Makefile-ptest.patch
@@ -4,13 +4,32 @@ Upstream-Status: Inappropriate
 
 Signed-off-by: Gabriel Barbu <gabriel.barbu@enea.com>
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ configure.ac      |  2 +-
+ tests/Makefile.am | 18 ++++++++++++++++++
+ 2 files changed, 19 insertions(+), 1 deletion(-)
 
---- old/tests/Makefile.am	2013-07-23 13:44:24.660481381 +0200
-+++ new/tests/Makefile.am	2013-07-23 16:22:42.937654391 +0200
-@@ -9,3 +9,21 @@
- EXTRA_DIST = init.sh $(TESTS)
+diff --git a/configure.ac b/configure.ac
+index 054f85b..9aec566 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -6,7 +6,7 @@ AC_INIT([strace],
+ AC_CONFIG_SRCDIR([strace.c])
+ AC_CONFIG_AUX_DIR([.])
+ AC_CONFIG_HEADERS([config.h])
+-AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules parallel-tests])
++AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules serial-tests])
+ AM_MAINTAINER_MODE
+ AC_CANONICAL_HOST
+ 
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 922452a..b17837f 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -37,3 +37,21 @@ TEST_LOG_COMPILER = $(srcdir)/run.sh
+ EXTRA_DIST = init.sh run.sh sigaction.awk $(TESTS)
  
- CLEANFILES = check.log
+ CLEANFILES = $(TESTS:=.tmp)
 +
 +buildtest-TESTS: $(check_PROGRAMS) $(TESTS)
 +
@@ -28,14 +47,7 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
 +		install $(srcdir)/$$file $(DESTDIR)/$(TESTDIR); \
 +		sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
 +	done
-+	sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/net
---- a/configure.ac
-+++ b/configure.ac
-@@ -6,7 +6,7 @@ AC_INIT([strace],
- AC_CONFIG_SRCDIR([strace.c])
- AC_CONFIG_AUX_DIR([.])
- AC_CONFIG_HEADERS([config.h])
--AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules])
-+AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules serial-tests])
- AM_MAINTAINER_MODE
- AC_CANONICAL_HOST
++	for i in net net-fd scm_rights-fd sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace-4.8/git-version-gen b/meta/recipes-devtools/strace/strace-4.9/git-version-gen
similarity index 100%
rename from meta/recipes-devtools/strace/strace-4.8/git-version-gen
rename to meta/recipes-devtools/strace/strace-4.9/git-version-gen
diff --git a/meta/recipes-devtools/strace/strace-4.8/run-ptest b/meta/recipes-devtools/strace/strace-4.9/run-ptest
similarity index 100%
rename from meta/recipes-devtools/strace/strace-4.8/run-ptest
rename to meta/recipes-devtools/strace/strace-4.9/run-ptest
diff --git a/meta/recipes-devtools/strace/strace-4.8/strace-add-configure-options.patch b/meta/recipes-devtools/strace/strace-4.9/strace-add-configure-options.patch
similarity index 63%
rename from meta/recipes-devtools/strace/strace-4.8/strace-add-configure-options.patch
rename to meta/recipes-devtools/strace/strace-4.9/strace-add-configure-options.patch
index 27266d9..15e37bc 100644
--- a/meta/recipes-devtools/strace/strace-4.8/strace-add-configure-options.patch
+++ b/meta/recipes-devtools/strace/strace-4.9/strace-add-configure-options.patch
@@ -3,18 +3,24 @@ Add options "aio" and "acl" to enable/disable libaio and acl support.
 Upstream-Status: Pending
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ configure.ac | 27 ++++++++++++++++++++++++++-
+ 1 file changed, 26 insertions(+), 1 deletion(-)
 
---- strace-4.8/configure.ac.orig	2013-06-21 15:37:52.145892182 +0800
-+++ strace-4.8/configure.ac	2013-06-21 15:45:49.029909004 +0800
-@@ -219,7 +219,6 @@ AC_CHECK_HEADERS(m4_normalize([
- 	netinet/sctp.h
+diff --git a/configure.ac b/configure.ac
+index 054f85b..8ed49f1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -238,7 +238,6 @@ AC_CHECK_HEADERS(m4_normalize([
  	poll.h
+ 	scsi/sg.h
  	stropts.h
 -	sys/acl.h
  	sys/asynch.h
  	sys/conf.h
  	sys/epoll.h
-@@ -231,6 +230,19 @@ AC_CHECK_HEADERS(m4_normalize([
+@@ -250,6 +249,18 @@ AC_CHECK_HEADERS(m4_normalize([
  	sys/uio.h
  	sys/vfs.h
  ]))
@@ -22,30 +28,25 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 +AC_ARG_ENABLE([acl],
 +	[AS_HELP_STRING([--enable-acl], [turn on acl support])],
 +	[case $enableval in
-+	yes) 
++	yes)
 +		AC_CHECK_HEADERS([sys/acl.h])
 +		;;
 +	no)  ;;
 +	*)   AC_MSG_ERROR([bad value $enableval for aio option]) ;;
 +	esac]
-+	
 +)
 +
  AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h linux/if_packet.h],
                   [], [], [#include <stddef.h>
  #include <sys/socket.h>
-@@ -301,10 +313,19 @@ AC_CHECK_SIZEOF([long])
- AC_CHECK_SIZEOF([long long])
- AC_CHECK_SIZEOF([rlim_t],,[#include <sys/resource.h>])
+@@ -649,6 +660,20 @@ if test "x$st_cv_have___builtin_popcount" = xyes; then
+ 		  [Define to 1 if the system provides __builtin_popcount function])
+ fi
  
--AC_CHECK_HEADERS([libaio.h], [
--	AC_CHECK_MEMBERS([struct iocb.u.c.flags],,, [#include <libaio.h>])
--	AC_CHECK_DECLS([IO_CMD_PWRITE, IO_CMD_PWRITEV],,, [#include <libaio.h>])
--])
 +AC_ARG_ENABLE([aio],
 +	[AS_HELP_STRING([--enable-aio], [turn on libaio support])],
 +	[case $enableval in
-+	yes) 
++	yes)
 +	AC_CHECK_HEADERS([libaio.h], [
 +		AC_CHECK_MEMBERS([struct iocb.u.c.flags],,, [#include <libaio.h>])
 +		AC_CHECK_DECLS([IO_CMD_PWRITE, IO_CMD_PWRITEV],,, [#include <libaio.h>])
@@ -55,6 +56,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 +	*)   AC_MSG_ERROR([bad value $enableval for aio option]) ;;
 +	esac]
 +)
- 
++
  AC_PATH_PROG([PERL], [perl])
  
+ dnl stack trace with libunwind
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.9.bb
similarity index 77%
rename from meta/recipes-devtools/strace/strace_4.8.bb
rename to meta/recipes-devtools/strace/strace_4.9.bb
index ed738ea..f64c6ec 100644
--- a/meta/recipes-devtools/strace/strace_4.8.bb
+++ b/meta/recipes-devtools/strace/strace_4.9.bb
@@ -8,16 +8,14 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://git-version-gen \
            file://strace-add-configure-options.patch \
            file://Makefile-ptest.patch \
-           file://strace-fix-64-bit-process-detection.patch \
            file://run-ptest \
-           file://0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch \
           "
 
-SRC_URI[md5sum] = "c575ef43829586801f514fd91bfe7575"
-SRC_URI[sha256sum] = "f492291f07a7c805c07a8395cce1ea054a6401ad414f4cc12185672215e1d7f8"
+SRC_URI[md5sum] = "885eafadb10f6c60464a266d3929a2a4"
+SRC_URI[sha256sum] = "095bfea5c540b91d297ccac73b21b92fd54a24599fd70395db87ff9eb7fd6f65"
 
 inherit autotools ptest
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make coreutils grep gawk"
 
 PACKAGECONFIG_class-target ?= "libaio ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
 
-- 
1.9.1


