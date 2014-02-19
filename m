Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7836E9D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 03:18:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1J3IGia006242
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 19:18:16 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 18 Feb 2014 19:18:15 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Feb 2014 11:18:12 +0800
Message-ID: <51aedd40b6624b18f0c1b61b18e75fe4908ebd0c.1392779759.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392779759.git.Chong.Lu@windriver.com>
References: <cover.1392779759.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpcre: enable ptest support
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
X-List-Received-Date: Wed, 19 Feb 2014 03:18:15 -0000
Content-Type: text/plain

Install libpcre test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/libpcre/libpcre/Makefile  | 183 +++++++++++++++++++++++++
 meta/recipes-support/libpcre/libpcre/run-ptest |   3 +
 meta/recipes-support/libpcre/libpcre_8.34.bb   |  19 ++-
 3 files changed, 203 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre/Makefile
 create mode 100644 meta/recipes-support/libpcre/libpcre/run-ptest

diff --git a/meta/recipes-support/libpcre/libpcre/Makefile b/meta/recipes-support/libpcre/libpcre/Makefile
new file mode 100644
index 0000000..5419d71
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre/Makefile
@@ -0,0 +1,183 @@
+TESTS = pcre_stringpiece_unittest RunTest RunGrepTest
+subdir = .
+am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
+am__vpath_adj = case $$p in \
+    $(srcdir)/*) f=`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
+    *) f=$$p;; \
+  esac;
+am__tty_colors_dummy = \
+  mgn= red= grn= lgn= blu= brg= std=; \
+  am__color_tests=no
+am__tty_colors = { \
+  $(am__tty_colors_dummy); \
+  if test "X$(AM_COLOR_TESTS)" = Xno; then \
+    am__color_tests=no; \
+  elif test "X$(AM_COLOR_TESTS)" = Xalways; then \
+    am__color_tests=yes; \
+  elif test "X$$TERM" != Xdumb && { test -t 1; } 2>/dev/null; then \
+    am__color_tests=yes; \
+  fi; \
+  if test $$am__color_tests = yes; then \
+    red='[0;31m'; \
+    grn='[0;32m'; \
+    lgn='[1;32m'; \
+    blu='[1;34m'; \
+    mgn='[0;35m'; \
+    brg='[1m'; \
+    std='[m'; \
+  fi; \
+}
+am__rst_title = { sed 's/.*/   &   /;h;s/./=/g;p;x;s/ *$$//;p;g' && echo; }
+am__sh_e_setup = case $$- in *e*) set +e;; esac
+am__common_driver_flags = \
+  --color-tests "$$am__color_tests" \
+  --enable-hard-errors "$$am__enable_hard_errors" \
+  --expect-failure "$$am__expect_failure"
+am__check_pre = \
+$(am__sh_e_setup); \
+$(am__vpath_adj_setup) $(am__vpath_adj) \
+$(am__tty_colors); \
+srcdir=$(srcdir); export srcdir; \
+case "$@" in \
+  */*) am__odir=`echo "./$@" | sed 's|/[^/]*$$||'`;; \
+    *) am__odir=.;; \
+esac; \
+test "x$$am__odir" = x"." || test -d "$$am__odir" \
+  || $(MKDIR_P) "$$am__odir" || exit $$?; \
+if test -f "./$$f"; then dir=./; \
+elif test -f "$$f"; then dir=; \
+else dir="$(srcdir)/"; fi; \
+tst=$$dir$$f; log='$@'; \
+if test -n '$(DISABLE_HARD_ERRORS)'; then \
+  am__enable_hard_errors=no; \
+else \
+  am__enable_hard_errors=yes; \
+fi;
+am__set_TESTS_bases = \
+  bases='$(TEST_LOGS)'; \
+  bases=`for i in $$bases; do echo $$i; done | sed 's/\.log$$//'`; \
+  bases=`echo $$bases`
+RECHECK_LOGS = $(TEST_LOGS)
+TEST_SUITE_LOG = test-suite.log
+TEST_EXTENSIONS =  .test
+LOG_DRIVER = $(SHELL) $(top_srcdir)/test-driver
+am__test_logs1 = $(TESTS:=.log)
+am__test_logs2 = $(am__test_logs1:.log=.log)
+TEST_LOGS = $(am__test_logs2:.test.log=.log)
+MKDIR_P = /bin/mkdir -p
+PACKAGE_STRING = PCRE 8.34
+SHELL = /bin/sh
+srcdir = .
+top_srcdir = .
+$(TEST_SUITE_LOG): $(TEST_LOGS)
+	@$(am__set_TESTS_bases); \
+	am__f_ok () { test -f "$$1" && test -r "$$1"; }; \
+	redo_bases=`for i in $$bases; do \
+	              am__f_ok $$i.trs && am__f_ok $$i.log || echo $$i; \
+	            done`; \
+	st=0;  \
+	errmsg="fatal: making $(TEST_SUITE_LOG): failed to create"; \
+	for i in $$redo_bases; do \
+	  test -f $$i.trs && test -r $$i.trs \
+	    || { echo "$$errmsg $$i.trs" >&2; st=1; }; \
+	  test -f $$i.log && test -r $$i.log \
+	    || { echo "$$errmsg $$i.log" >&2; st=1; }; \
+	done; \
+	test $$st -eq 0 || exit 1;
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
+	  for b in $$bases; do echo $$b; done;				\
+	} >$(TEST_SUITE_LOG).tmp || exit 1;				\
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
+	  echo "$$col$$br$$std";					\
+	fi;								\
+	$$success || exit 1
+check-TESTS:
+	@list='$(RECHECK_LOGS)';           test -z "$$list" || rm -f $$list
+	@test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
+	@set +e; $(am__set_TESTS_bases); \
+	log_list=`for i in $$bases; do echo $$i.log; done`; \
+	log_list=`echo $$log_list`; \
+	$(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_LOGS="$$log_list"; \
+	exit $$?;
+pcre_stringpiece_unittest.log: pcre_stringpiece_unittest$(EXEEXT)
+	@p='pcre_stringpiece_unittest$(EXEEXT)'; \
+	b='pcre_stringpiece_unittest'; \
+	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
+	--log-file $$b.log --trs-file $$b.trs \
+	$(am__common_driver_flags) -- "$$tst"
+RunTest.log: RunTest
+	@p='RunTest'; \
+	b='RunTest'; \
+	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
+	--log-file $$b.log --trs-file $$b.trs \
+	$(am__common_driver_flags) -- "$$tst"
+RunGrepTest.log: RunGrepTest
+	@p='RunGrepTest'; \
+	b='RunGrepTest'; \
+	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
+	--log-file $$b.log --trs-file $$b.trs \
+	$(am__common_driver_flags) -- "$$tst"
diff --git a/meta/recipes-support/libpcre/libpcre/run-ptest b/meta/recipes-support/libpcre/libpcre/run-ptest
new file mode 100644
index 0000000..990d4a1
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make check-TESTS
diff --git a/meta/recipes-support/libpcre/libpcre_8.34.bb b/meta/recipes-support/libpcre/libpcre_8.34.bb
index 0c2b082..5c5072c 100644
--- a/meta/recipes-support/libpcre/libpcre_8.34.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.34.bb
@@ -9,7 +9,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=0920cc1a9f7ba95464491fa83c86afd8"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
-           file://fix-pcre-name-collision.patch"
+           file://fix-pcre-name-collision.patch \
+           file://run-ptest \
+           file://Makefile \
+"
 
 SRC_URI[md5sum] = "5439e321351bddd5533551bbce128d07"
 SRC_URI[sha256sum] = "b6043ae1ff2720be665ffa28dc22b7c637cdde96f389a116c0c3020caeae583f"
@@ -21,7 +24,7 @@ DEPENDS += "bzip2 zlib"
 
 PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
 
-inherit autotools binconfig
+inherit autotools binconfig ptest
 
 PARALLEL_MAKE = ""
 
@@ -56,3 +59,15 @@ FILES_pcretest = "${bindir}/pcretest"
 FILES_pcretest-doc = "${mandir}/man1/pcretest.1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_ptest() {
+	t=${D}${PTEST_PATH}
+	cp ${WORKDIR}/Makefile $t
+	cp -r ${S}/testdata $t
+	for i in pcre_stringpiece_unittest pcregrep pcretest; \
+	  do cp ${B}/.libs/$i $t; \
+	done
+	for i in RunTest RunGrepTest test-driver; \
+	  do cp ${S}/$i $t; \
+	done
+}
-- 
1.8.1.2


