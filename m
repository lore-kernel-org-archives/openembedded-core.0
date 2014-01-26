Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F28986AE39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 05:56:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0Q5uCZv016436
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 21:56:12 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 25 Jan 2014 21:56:12 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jan 2014 13:56:09 +0800
Message-ID: <a901087ec74163558f429d5df254173ef39ee8e4.1390715716.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1390715716.git.Chong.Lu@windriver.com>
References: <cover.1390715716.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] parted: enable ptest support
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
X-List-Received-Date: Sun, 26 Jan 2014 05:56:12 -0000
Content-Type: text/plain

Install parted test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/parted/parted-3.1/Makefile  | 285 ++++++++++++++++++++++
 meta/recipes-extended/parted/parted-3.1/run-ptest |   3 +
 meta/recipes-extended/parted/parted_3.1.bb        |  25 +-
 3 files changed, 311 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/parted/parted-3.1/Makefile
 create mode 100644 meta/recipes-extended/parted/parted-3.1/run-ptest

diff --git a/meta/recipes-extended/parted/parted-3.1/Makefile b/meta/recipes-extended/parted/parted-3.1/Makefile
new file mode 100644
index 0000000..ee90be0
--- /dev/null
+++ b/meta/recipes-extended/parted/parted-3.1/Makefile
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
diff --git a/meta/recipes-extended/parted/parted-3.1/run-ptest b/meta/recipes-extended/parted/parted-3.1/run-ptest
new file mode 100644
index 0000000..695c5e8
--- /dev/null
+++ b/meta/recipes-extended/parted/parted-3.1/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -C tests check-TESTS
diff --git a/meta/recipes-extended/parted/parted_3.1.bb b/meta/recipes-extended/parted/parted_3.1.bb
index 2d72027..1e07da4 100644
--- a/meta/recipes-extended/parted/parted_3.1.bb
+++ b/meta/recipes-extended/parted/parted_3.1.bb
@@ -11,13 +11,34 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://syscalls.patch \
            file://fix-git-version-gen.patch \
            file://fix-doc-mandir.patch \
-           file://fix-dvh-overflows.patch"
+           file://fix-dvh-overflows.patch \
+           file://run-ptest \
+           file://Makefile \
+"
 
 SRC_URI[md5sum] = "5d89d64d94bcfefa9ce8f59f4b81bdcb"
 SRC_URI[sha256sum] = "5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15"
 
 EXTRA_OECONF = "--disable-device-mapper"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext ptest
 
 BBCLASSEXTEND = "native"
+
+do_compile_ptest() {
+	oe_runmake -C tests print-align print-max dup-clobber duplicate fs-resize
+}
+
+do_install_ptest() {
+	t=${D}${PTEST_PATH}
+	mkdir $t/build-aux
+	cp ${S}/build-aux/test-driver $t/build-aux/
+	cp -r ${S}/tests $t
+	cp ${WORKDIR}/Makefile $t/tests/
+	for i in print-align print-max dup-clobber duplicate fs-resize; \
+	  do cp ${B}/tests/.libs/$i $t/tests/; \
+	done
+	sed -e 's| ../parted||' -i $t/tests/*.sh
+}
+
+RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup"
-- 
1.8.1.2


