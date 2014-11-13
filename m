Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91F1165C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 04:42:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAD4g6JG002036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Nov 2014 20:42:07 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 20:42:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 13 Nov 2014 12:42:01 +0800
Message-ID: <e8e5995427a35f248d017ce287ce5c8d4338aa41.1415853569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415853569.git.hongxu.jia@windriver.com>
References: <cover.1415853569.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] parted: upgrade to 3.2
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
X-List-Received-Date: Thu, 13 Nov 2014 04:42:07 -0000
Content-Type: text/plain

Drop fix-git-version-gen.patch, fix-dvh-overflows.patch and
fix-deprecated-readline.patch, because the parted 3.2 have
merged them.

Add fix-compile-failure-while-dis.patch to fix compile failure

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/parted/files/Makefile        | 285 +++++++++++++++++++++
 .../files/fix-compile-failure-while-dis.patch      |  57 +++++
 .../parted/files/fix-doc-mandir.patch              |  20 ++
 meta/recipes-extended/parted/files/no_check.patch  |  20 ++
 meta/recipes-extended/parted/files/run-ptest       |   3 +
 meta/recipes-extended/parted/files/syscalls.patch  |  55 ++++
 .../parted/{parted_3.1.bb => parted_3.2.bb}        |   8 +-
 7 files changed, 443 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/parted/files/Makefile
 create mode 100644 meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
 create mode 100644 meta/recipes-extended/parted/files/fix-doc-mandir.patch
 create mode 100644 meta/recipes-extended/parted/files/no_check.patch
 create mode 100644 meta/recipes-extended/parted/files/run-ptest
 create mode 100644 meta/recipes-extended/parted/files/syscalls.patch
 rename meta/recipes-extended/parted/{parted_3.1.bb => parted_3.2.bb} (79%)

diff --git a/meta/recipes-extended/parted/files/Makefile b/meta/recipes-extended/parted/files/Makefile
new file mode 100644
index 0000000..ee90be0
--- /dev/null
+++ b/meta/recipes-extended/parted/files/Makefile
@@ -0,0 +1,285 @@
+am__tty_colors_dummy = \
+  mgn= red= grn= lgn= blu= brg= std=; \
+  am__color_tests=no
+
+am__tty_colors = \
+$(am__tty_colors_dummy); \
+test "X$(AM_COLOR_TESTS)" != Xno \
+&& test "X$$TERM" != Xdumb \
+&& { test "X$(AM_COLOR_TESTS)" = Xalways || test -t 1 2>/dev/null; } \
+&& { \
+  am__color_tests=yes; \
+  red='[0;31m'; \
+  grn='[0;32m'; \
+  lgn='[1;32m'; \
+  blu='[1;34m'; \
+  mgn='[0;35m'; \
+  brg='[1m'; \
+  std='[m'; \
+}
+
+am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
+am__vpath_adj = case $$p in \
+    $(srcdir)/*) f=`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
+    *) f=$$p;; \
+  esac;
+am__rst_title = { sed 's/.*/   &   /;h;s/./=/g;p;x;s/ *$$//;p;g' && echo; }
+am__rst_section = { sed 'p;s/./=/g;' && echo; }
+am__sh_e_setup = case $$- in *e*) set +e;; esac
+
+am__common_driver_flags = \
+  --color-tests "$$am__color_tests" \
+  --enable-hard-errors "$$am__enable_hard_errors" \
+  --expect-failure "$$am__expect_failure"
+am__check_pre = \
+$(am__sh_e_setup);					\
+$(am__vpath_adj_setup) $(am__vpath_adj)			\
+$(am__tty_colors);					\
+srcdir=$(srcdir); export srcdir;			\
+am__odir=`echo "./$@" | sed 's|/[^/]*$$||'`;		\
+test "x$$am__odir" = x. || $(MKDIR_P) "$$am__odir" || exit $$?;	\
+if test -f "./$$f"; then dir=./;			\
+elif test -f "$$f"; then dir=;				\
+else dir="$(srcdir)/"; fi;				\
+tst=$$dir$$f; log='$@'; 				\
+if test -n '$(DISABLE_HARD_ERRORS)'; then		\
+  am__enable_hard_errors=no; 				\
+else							\
+  am__enable_hard_errors=yes; 				\
+fi; 							\
+$(AM_TESTS_ENVIRONMENT) $(TESTS_ENVIRONMENT)
+
+am__set_TESTS_bases = \
+  bases='$(TEST_LOGS)'; \
+  bases=`for i in $$bases; do echo $$i; done | sed 's/\.log$$//'`; \
+  bases=`echo $$bases`
+
+RECHECK_LOGS = $(TEST_LOGS)
+TEST_SUITE_LOG = test-suite.log
+am__test_logs1 = $(TESTS:=.log)
+am__test_logs2 = $(am__test_logs1:.log=.log)
+TEST_LOGS = $(am__test_logs2:.sh.log=.log)
+SH_LOG_DRIVER = $(SHELL) $(top_srcdir)/build-aux/test-driver
+SH_LOG_COMPILE = $(SH_LOG_COMPILER)
+
+am__set_b = \
+  case '$@' in \
+    */*) \
+      case '$*' in \
+        */*) b='$*';; \
+          *) b=`echo '$@' | sed 's/\.log$$//'`; \
+       esac;; \
+    *) \
+      b='$*';; \
+  esac
+
+MKDIR_P = /bin/mkdir -p
+SHELL = /bin/bash
+VERSION = 3.1
+PACKAGE_STRING = GNU parted 3.1
+PACKAGE_BUGREPORT = bug-parted@gnu.org
+abs_srcdir = $(PWD)
+abs_top_builddir = $(PWD)/..
+abs_top_srcdir = $(PWD)/..
+srcdir = .
+top_srcdir = ..
+subdir = tests
+SH_LOG_COMPILER = $(SHELL)
+
+TESTS = \
+  help-version.sh \
+  t0000-basic.sh \
+  t0001-tiny.sh \
+  t0010-script-no-ctrl-chars.sh \
+  t0100-print.sh \
+  t0101-print-empty.sh \
+  t0200-gpt.sh \
+  t0201-gpt.sh \
+  t0202-gpt-pmbr.sh \
+  t0203-gpt-tiny-device-abort.sh \
+  t0203-gpt-shortened-device-primary-valid.sh \
+  t0205-gpt-list-clobbers-pmbr.sh \
+  t0206-gpt-print-with-corrupt-primary-clobbers-pmbr.sh \
+  t0207-IEC-binary-notation.sh \
+  t0208-mkpart-end-in-IEC.sh \
+  t0209-gpt-pmbr_boot.sh \
+  t0210-gpt-resized-partition-entry-array.sh \
+  t0211-gpt-rewrite-header.sh \
+  t0212-gpt-many-partitions.sh \
+  t0220-gpt-msftres.sh \
+  t0250-gpt.sh \
+  t0280-gpt-corrupt.sh \
+  t0300-dos-on-gpt.sh \
+  t0400-loop-clobber-infloop.sh \
+  t0500-dup-clobber.sh \
+  t0501-duplicate.sh \
+  t1100-busy-label.sh \
+  t1101-busy-partition.sh \
+  t1700-probe-fs.sh \
+  t2200-dos-label-recog.sh \
+  t2201-pc98-label-recog.sh \
+  t2300-dos-label-extended-bootcode.sh \
+  t2310-dos-extended-2-sector-min-offset.sh \
+  t2400-dos-hfs-partition-type.sh \
+  t2500-probe-corrupt-hfs.sh \
+  t3000-resize-fs.sh \
+  t3200-type-change.sh \
+  t3300-palo-prep.sh \
+  t3310-flags.sh \
+  t3400-whole-disk-FAT-partition.sh \
+  t4000-sun-raid-type.sh \
+  t4001-sun-vtoc.sh \
+  t4100-msdos-partition-limits.sh \
+  t4100-dvh-partition-limits.sh \
+  t4100-msdos-starting-sector.sh \
+  t4200-partprobe.sh \
+  t4300-nilfs2-tiny.sh \
+  t5000-tags.sh \
+  t6000-dm.sh \
+  t6001-psep.sh \
+  t6100-mdraid-partitions.sh \
+  t7000-scripting.sh \
+  t8000-loop.sh \
+  t8001-loop-blkpg.sh \
+  t9010-big-sector.sh \
+  t9020-alignment.sh \
+  t9021-maxima.sh \
+  t9022-one-unit-snap.sh \
+  t9023-value-lt-one.sh \
+  t9030-align-check.sh \
+  t9040-many-partitions.sh \
+  t9041-undetected-in-use-16th-partition.sh \
+  t9042-dos-partition-limit.sh \
+  t9050-partition-table-types.sh
+
+TESTS_ENVIRONMENT = \
+  export					\
+  abs_top_builddir='$(abs_top_builddir)'	\
+  abs_top_srcdir='$(abs_top_srcdir)'		\
+  abs_srcdir='$(abs_srcdir)'			\
+  built_programs=parted				\
+  srcdir='$(srcdir)'				\
+  top_srcdir='$(top_srcdir)'			\
+  VERSION=$(VERSION)				\
+  ; 9>&2
+
+.SUFFIXES: .log
+
+$(TEST_SUITE_LOG): $(TEST_LOGS)
+	@$(am__sh_e_setup); $(am__tty_colors); $(am__set_TESTS_bases); \
+	ws='[ 	]'; \
+	results=`for b in $$bases; do echo $$b.trs; done`; \
+	test -n "$$results" || results=/dev/null; \
+	all=`  grep "^$$ws*:test-result:"           $$results | wc -l`; \
+	pass=` grep "^$$ws*:test-result:$$ws*PASS"  $$results | wc -l`; \
+	fail=` grep "^$$ws*:test-result:$$ws*FAIL"  $$results | wc -l`; \
+	skip=` grep "^$$ws*:test-result:$$ws*SKIP"  $$results | wc -l`; \
+	xfail=`grep "^$$ws*:test-result:$$ws*XFAIL" $$results | wc -l`; \
+	xpass=`grep "^$$ws*:test-result:$$ws*XPASS" $$results | wc -l`; \
+	error=`grep "^$$ws*:test-result:$$ws*ERROR" $$results | wc -l`; \
+	if test `expr $$fail + $$xpass + $$error` -eq 0; then \
+	  success=true; \
+	else \
+	  success=false; \
+	fi; \
+	br='==================='; br=$$br$$br$$br$$br; \
+	result_count () \
+	{ \
+	    if test x"$$1" = x"--maybe-color"; then \
+	      maybe_colorize=yes; \
+	    elif test x"$$1" = x"--no-color"; then \
+	      maybe_colorize=no; \
+	    else \
+	      echo "$@: invalid 'result_count' usage" >&2; exit 4; \
+	    fi; \
+	    shift; \
+	    desc=$$1 count=$$2; \
+	    if test $$maybe_colorize = yes && test $$count -gt 0; then \
+	      color_start=$$3 color_end=$$std; \
+	    else \
+	      color_start= color_end=; \
+	    fi; \
+	    echo "$${color_start}# $$desc $$count$${color_end}"; \
+	}; \
+	create_testsuite_report () \
+	{ \
+	  result_count $$1 "TOTAL:" $$all   "$$brg"; \
+	  result_count $$1 "PASS: " $$pass  "$$grn"; \
+	  result_count $$1 "SKIP: " $$skip  "$$blu"; \
+	  result_count $$1 "XFAIL:" $$xfail "$$lgn"; \
+	  result_count $$1 "FAIL: " $$fail  "$$red"; \
+	  result_count $$1 "XPASS:" $$xpass "$$red"; \
+	  result_count $$1 "ERROR:" $$error "$$mgn"; \
+	}; \
+	{								\
+	  echo "$(PACKAGE_STRING): $(subdir)/$(TEST_SUITE_LOG)" |	\
+	    $(am__rst_title);						\
+	  create_testsuite_report --no-color;				\
+	  echo;								\
+	  echo ".. contents:: :depth: 2";				\
+	  echo;								\
+	  for i in $$bases; do						\
+	    if grep "^$$ws*:copy-in-global-log:$$ws*no$$ws*$$" $$i.trs \
+	         >/dev/null; then continue; \
+	    fi; \
+	    glob_res=`sed -n -e "s/$$ws*$$//" \
+	                     -e "s/^$$ws*:global-test-result:$$ws*//p" \
+		        $$i.trs`; \
+	    test -n "$$glob_res" || glob_res=RUN; \
+	    echo "$$glob_res: $$i" | $(am__rst_section); \
+	    if test ! -r $$i.log; then \
+	      echo "fatal: making $@: $$i.log is unreadable" >&2; \
+	      exit 1; \
+	    fi; \
+	    cat $$i.log; echo; \
+	  done;	\
+	} >$(TEST_SUITE_LOG).tmp;					\
+	mv $(TEST_SUITE_LOG).tmp $(TEST_SUITE_LOG);			\
+	if $$success; then						\
+	  col="$$grn";							\
+	 else								\
+	  col="$$red";							\
+	  test x"$$VERBOSE" = x || cat $(TEST_SUITE_LOG);		\
+	fi;								\
+	echo "$${col}$$br$${std}"; 					\
+	echo "$${col}Testsuite summary for $(PACKAGE_STRING)$${std}";	\
+	echo "$${col}$$br$${std}"; 					\
+	create_testsuite_report --maybe-color;				\
+	echo "$$col$$br$$std";						\
+	if $$success; then :; else					\
+	  echo "$${col}See $(subdir)/$(TEST_SUITE_LOG)$${std}";		\
+	  if test -n "$(PACKAGE_BUGREPORT)"; then			\
+	    echo "$${col}Please report to $(PACKAGE_BUGREPORT)$${std}";	\
+	  fi;								\
+	  echo "$$col$$br$$std";					\
+	fi;								\
+	$$success || exit 1
+
+check-TESTS:
+	@if test $@ != recheck; then \
+	   list='$(RECHECK_LOGS)'; \
+	   test -z "$$list" || rm -f $$list; \
+	 fi
+	@test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
+	@ws='[ 	]'; \
+	log_list='' trs_list=''; $(am__set_TESTS_bases); \
+	for i in $$bases; do \
+	  if test -z "$$log_list"; then \
+	    log_list="$$i.log"; \
+	  else \
+	    log_list="$$log_list $$i.log"; \
+	  fi; \
+	  if test -z "$$trs_list"; then \
+	    trs_list="$$i.trs"; \
+	  else \
+	    trs_list="$$trs_list $$i.trs"; \
+	  fi; \
+	done; \
+	$(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_LOGS="$$log_list"
+
+.sh.log:
+	@p='$<'; \
+	$(am__set_b); \
+	$(am__check_pre) $(SH_LOG_DRIVER) --test-name "$$f" \
+	--log-file $$b.log --trs-file $$b.trs \
+	$(am__common_driver_flags) -- $(SH_LOG_COMPILE) "$$tst"
diff --git a/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch b/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
new file mode 100644
index 0000000..68ab715
--- /dev/null
+++ b/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
@@ -0,0 +1,57 @@
+From 060e74354774d36d2c11ef08e3e7ea9b9b6e23fb Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 13 Nov 2014 11:29:33 +0800
+Subject: [PATCH] libparted/arch/linux.c: fix compile failure while
+ --disable-device-mapper
+
+While --disable-device-mapper, the MACRO ENABLE_DEVICE_MAPPER is
+undef, but it missed to scope some device mapper functions.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libparted/arch/linux.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
+index 6fd73c5..2afa479 100644
+--- a/libparted/arch/linux.c
++++ b/libparted/arch/linux.c
+@@ -2320,6 +2320,7 @@ zasprintf (const char *format, ...)
+ static char *
+ dm_canonical_path (PedDevice const *dev)
+ {
++#ifdef ENABLE_DEVICE_MAPPER
+         LinuxSpecific const *arch_specific = LINUX_SPECIFIC (dev);
+ 
+         /* Get map name from devicemapper */
+@@ -2337,6 +2338,7 @@ dm_canonical_path (PedDevice const *dev)
+         dm_task_destroy (task);
+         return dev_name;
+ err:
++#endif
+         return NULL;
+ }
+ 
+@@ -2957,13 +2959,15 @@ _disk_sync_part_table (PedDisk* disk)
+                                                unsigned long long *start,
+                                                unsigned long long *length);
+ 
+-
++#ifdef ENABLE_DEVICE_MAPPER
+         if (disk->dev->type == PED_DEVICE_DM) {
+                 add_partition = _dm_add_partition;
+                 remove_partition = _dm_remove_partition;
+                 resize_partition = _dm_resize_partition;
+                 get_partition_start_and_length = _dm_get_partition_start_and_length;
+-        } else {
++        } else
++#endif
++        {
+                 add_partition = _blkpg_add_partition;
+                 remove_partition = _blkpg_remove_partition;
+ #ifdef BLKPG_RESIZE_PARTITION
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/parted/files/fix-doc-mandir.patch b/meta/recipes-extended/parted/files/fix-doc-mandir.patch
new file mode 100644
index 0000000..0711d4e
--- /dev/null
+++ b/meta/recipes-extended/parted/files/fix-doc-mandir.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Submitted [bug-parted@gnu.org]
+
+| for po in `ls -1 ./*.pt_BR.po 2>/dev/null`; do \
+| 		make $(basename ${po%.pt_BR.po}); \
+| 	done
+| Makefile:904: *** Recursive variable `mandir' references itself (eventually).  Stop.
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
+--- parted-3.1/doc/po4a.mk.orig	2012-03-15 14:09:11.555831872 +0100
++++ parted-3.1/doc/po4a.mk	2012-03-15 14:10:44.243830985 +0100
+@@ -23,7 +23,7 @@
+ # threshold is 80%), it won't be distributed, and the build won't fail.
+ #
+ 
+-mandir = $(mandir)/$(lang)
++mandir := $(mandir)/$(lang)
+ 
+ # Inform automake that we want to install some man pages in section 1, 5
+ # and 8.
diff --git a/meta/recipes-extended/parted/files/no_check.patch b/meta/recipes-extended/parted/files/no_check.patch
new file mode 100644
index 0000000..58d8db4
--- /dev/null
+++ b/meta/recipes-extended/parted/files/no_check.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Inappropriate [configuration]
+
+If check is detected, it makes the builds non-determinstic so just force
+it to be disabled.
+
+RP - 4/11/08
+
+Index: parted-1.9.0/configure.ac
+===================================================================
+--- parted-1.9.0.orig/configure.ac	2009-07-23 18:52:08.000000000 +0100
++++ parted-1.9.0/configure.ac	2010-02-02 14:13:56.013905093 +0000
+@@ -477,7 +477,7 @@
+ AM_CONDITIONAL([BUILD_LINUX], [test "$OS" = linux])
+ 
+ dnl check for "check", unit testing library/header
+-PKG_CHECK_MODULES([CHECK], [check >= 0.9.3], have_check=yes, have_check=no)
++have_check=no
+ if test "$have_check" != "yes"; then
+     AC_MSG_RESULT([Unable to locate check version 0.9.3 or higher: not building])
+ fi
diff --git a/meta/recipes-extended/parted/files/run-ptest b/meta/recipes-extended/parted/files/run-ptest
new file mode 100644
index 0000000..695c5e8
--- /dev/null
+++ b/meta/recipes-extended/parted/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -C tests check-TESTS
diff --git a/meta/recipes-extended/parted/files/syscalls.patch b/meta/recipes-extended/parted/files/syscalls.patch
new file mode 100644
index 0000000..e9bbe9a
--- /dev/null
+++ b/meta/recipes-extended/parted/files/syscalls.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Pending
+
+---
+ libparted/arch/linux.c |   13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+Index: parted-1.9.0/libparted/arch/linux.c
+===================================================================
+--- parted-1.9.0.orig/libparted/arch/linux.c	2009-07-23 18:52:08.000000000 +0100
++++ parted-1.9.0/libparted/arch/linux.c	2010-02-02 14:14:16.523904768 +0000
+@@ -17,6 +17,8 @@
+ 
+ #define PROC_DEVICES_BUFSIZ 16384
+ 
++#include <linux/version.h>
++
+ #include <config.h>
+ #include <arch/linux.h>
+ 
+@@ -1477,12 +1479,14 @@
+ 
+ #if SIZEOF_OFF_T < 8
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,20)
+ static _syscall5(int,_llseek,
+                  unsigned int, fd,
+                  unsigned long, offset_high,
+                  unsigned long, offset_low,
+                  loff_t*, result,
+                  unsigned int, origin)
++#endif
+ 
+ loff_t
+ llseek (unsigned int fd, loff_t offset, unsigned int whence)
+@@ -1490,11 +1494,20 @@
+         loff_t result;
+         int retval;
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,20)
+         retval = _llseek(fd,
+                          ((unsigned long long)offset) >> 32,
+                          ((unsigned long long)offset) & 0xffffffff,
+                          &result,
+                          whence);
++#else
++ 	retval = syscall(__NR__llseek, fd,
++			 ((unsigned long long)offset) >> 32,
++                         ((unsigned long long)offset) & 0xffffffff,
++                          &result,
++			 whence);
++#endif
++
+         return (retval==-1 ? (loff_t) retval : result);
+ }
+ 
diff --git a/meta/recipes-extended/parted/parted_3.1.bb b/meta/recipes-extended/parted/parted_3.2.bb
similarity index 79%
rename from meta/recipes-extended/parted/parted_3.1.bb
rename to meta/recipes-extended/parted/parted_3.2.bb
index 9057463..655a825 100644
--- a/meta/recipes-extended/parted/parted_3.1.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -9,16 +9,14 @@ PR = "r1"
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://no_check.patch \
            file://syscalls.patch \
-           file://fix-git-version-gen.patch \
            file://fix-doc-mandir.patch \
-           file://fix-dvh-overflows.patch \
-           file://fix-deprecated-readline.patch \
+           file://fix-compile-failure-while-dis.patch \
            file://run-ptest \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "5d89d64d94bcfefa9ce8f59f4b81bdcb"
-SRC_URI[sha256sum] = "5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15"
+SRC_URI[md5sum] = "0247b6a7b314f8edeb618159fa95f9cb"
+SRC_URI[sha256sum] = "858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4"
 
 EXTRA_OECONF = "--disable-device-mapper"
 
-- 
1.9.1


