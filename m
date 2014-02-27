Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8761B6028A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 07:18:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1R7I8eS028235
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 23:18:08 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 26 Feb 2014 23:18:07 -0800
Message-ID: <530EE6AC.8070801@windriver.com>
Date: Thu, 27 Feb 2014 15:18:04 +0800
From: Lu Chong <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1392194903.git.Chong.Lu@windriver.com>
	<117d903587f2a50aefa11a1271ce66f62e551a68.1392194903.git.Chong.Lu@windriver.com>
In-Reply-To: <117d903587f2a50aefa11a1271ce66f62e551a68.1392194903.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/1] diffutils: enable ptest support
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
X-List-Received-Date: Thu, 27 Feb 2014 07:18:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 02/12/2014 04:49 PM, Chong Lu wrote:
> Install diffutils test suite and run it as ptest.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   .../diffutils/diffutils-3.3/Makefile               | 284 +++++++++++++++++++++
>   .../diffutils/diffutils-3.3/run-ptest              |   3 +
>   meta/recipes-extended/diffutils/diffutils_3.3.bb   |  15 +-
>   3 files changed, 301 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/diffutils/diffutils-3.3/Makefile
>   create mode 100644 meta/recipes-extended/diffutils/diffutils-3.3/run-ptest
>
> diff --git a/meta/recipes-extended/diffutils/diffutils-3.3/Makefile b/meta/recipes-extended/diffutils/diffutils-3.3/Makefile
> new file mode 100644
> index 0000000..d3bb587
> --- /dev/null
> +++ b/meta/recipes-extended/diffutils/diffutils-3.3/Makefile
> @@ -0,0 +1,284 @@
> +am__tty_colors_dummy = \
> +  mgn= red= grn= lgn= blu= brg= std=; \
> +  am__color_tests=no
> +am__tty_colors = { \
> +  $(am__tty_colors_dummy); \
> +  if test "X$(AM_COLOR_TESTS)" = Xno; then \
> +    am__color_tests=no; \
> +  elif test "X$(AM_COLOR_TESTS)" = Xalways; then \
> +    am__color_tests=yes; \
> +  elif test "X$$TERM" != Xdumb && { test -t 1; } 2>/dev/null; then \
> +    am__color_tests=yes; \
> +  fi; \
> +  if test $$am__color_tests = yes; then \
> +    red='[0;31m'; \
> +    grn='[0;32m'; \
> +    lgn='[1;32m'; \
> +    blu='[1;34m'; \
> +    mgn='[0;35m'; \
> +    brg='[1m'; \
> +    std='[m'; \
> +  fi; \
> +}
> +
> +am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
> +am__vpath_adj = case $$p in \
> +    $(srcdir)/*) f=`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
> +    *) f=$$p;; \
> +  esac;
> +am__rst_title = { sed 's/.*/   &   /;h;s/./=/g;p;x;s/ *$$//;p;g' && echo; }
> +am__sh_e_setup = case $$- in *e*) set +e;; esac
> +am__common_driver_flags = \
> +  --color-tests "$$am__color_tests" \
> +  --enable-hard-errors "$$am__enable_hard_errors" \
> +  --expect-failure "$$am__expect_failure"
> +
> +am__check_pre = \
> +$(am__sh_e_setup); \
> +$(am__vpath_adj_setup) $(am__vpath_adj) \
> +$(am__tty_colors); \
> +srcdir=$(srcdir); export srcdir; \
> +case "$@" in \
> +  */*) am__odir=`echo "./$@" | sed 's|/[^/]*$$||'`;; \
> +    *) am__odir=.;; \
> +esac; \
> +test "x$$am__odir" = x"." || test -d "$$am__odir" \
> +  || $(MKDIR_P) "$$am__odir" || exit $$?; \
> +if test -f "./$$f"; then dir=./; \
> +elif test -f "$$f"; then dir=; \
> +else dir="$(srcdir)/"; fi; \
> +tst=$$dir$$f; log='$@'; \
> +if test -n '$(DISABLE_HARD_ERRORS)'; then \
> +  am__enable_hard_errors=no; \
> +else \
> +  am__enable_hard_errors=yes; \
> +fi; \
> +$(TESTS_ENVIRONMENT)
> +
> +am__set_TESTS_bases = \
> +  bases='$(TEST_LOGS)'; \
> +  bases=`for i in $$bases; do echo $$i; done | sed 's/\.log$$//'`; \
> +  bases=`echo $$bases`
> +
> +RECHECK_LOGS = $(TEST_LOGS)
> +TEST_SUITE_LOG = test-suite.log
> +LOG_DRIVER = $(SHELL) $(top_srcdir)/build-aux/test-driver
> +am__test_logs1 = $(TESTS:=.log)
> +am__test_logs2 = $(am__test_logs1:.log=.log)
> +TEST_LOGS = $(am__test_logs2:.test.log=.log)
> +TEST_LOG_DRIVER = $(SHELL) $(top_srcdir)/build-aux/test-driver
> +AWK = awk
> +MKDIR_P = /bin/mkdir -p
> +PACKAGE_BUGREPORT = bug-diffutils@gnu.org
> +PACKAGE_STRING = GNU diffutils 3.3
> +SHELL = /bin/sh
> +VERSION = 3.3
> +abs_srcdir = $(PWD)
> +abs_top_builddir = $(PWD)/..
> +abs_top_srcdir = $(PWD)/..
> +srcdir = .
> +top_srcdir = ..
> +subdir = tests
> +
> +TESTS = \
> +  basic \
> +  binary \
> +  colliding-file-names \
> +  excess-slash \
> +  help-version \
> +  function-line-vs-leading-space \
> +  label-vs-func	\
> +  new-file \
> +  no-dereference \
> +  no-newline-at-eof \
> +  stdin \
> +  filename-quoting
> +
> +TESTS_ENVIRONMENT = \
> +  tmp__=$$TMPDIR; test -d "$$tmp__" || tmp__=.; \
> +  TMPDIR=$$tmp__; export TMPDIR; \
> +  export \
> +  VERSION='$(VERSION)' \
> +  abs_top_builddir='$(abs_top_builddir)' \
> +  abs_top_srcdir='$(abs_top_srcdir)' \
> +  abs_srcdir='$(abs_srcdir)' \
> +  built_programs=diff \
> +  srcdir='$(srcdir)' \
> +  top_srcdir='$(top_srcdir)' \
> +  MAKE=$(MAKE) \
> +  PACKAGE_BUGREPORT='$(PACKAGE_BUGREPORT)' \
> +  PATH='$(abs_top_builddir)/src$(PATH_SEPARATOR)'"$$PATH" \
> +  ; 9>&2
> +
> +$(TEST_SUITE_LOG): $(TEST_LOGS)
> +	@$(am__set_TESTS_bases); \
> +	am__f_ok () { test -f "$$1" && test -r "$$1"; }; \
> +	redo_bases=`for i in $$bases; do \
> +	              am__f_ok $$i.trs && am__f_ok $$i.log || echo $$i; \
> +	            done`; \
> +	st=0;  \
> +	errmsg="fatal: making $(TEST_SUITE_LOG): failed to create"; \
> +	for i in $$redo_bases; do \
> +	    test -f $$i.trs && test -r $$i.trs \
> +	      || { echo "$$errmsg $$i.trs" >&2; st=1; }; \
> +	    test -f $$i.log && test -r $$i.log \
> +	      || { echo "$$errmsg $$i.log" >&2; st=1; }; \
> +	done; \
> +	test $$st -eq 0 || exit 1;
> +	@$(am__sh_e_setup); $(am__tty_colors); $(am__set_TESTS_bases); \
> +	ws='[ 	]'; \
> +	results=`for b in $$bases; do echo $$b.trs; done`; \
> +	test -n "$$results" || results=/dev/null; \
> +	all=`  grep "^$$ws*:test-result:"           $$results | wc -l`; \
> +	pass=` grep "^$$ws*:test-result:$$ws*PASS"  $$results | wc -l`; \
> +	fail=` grep "^$$ws*:test-result:$$ws*FAIL"  $$results | wc -l`; \
> +	skip=` grep "^$$ws*:test-result:$$ws*SKIP"  $$results | wc -l`; \
> +	xfail=`grep "^$$ws*:test-result:$$ws*XFAIL" $$results | wc -l`; \
> +	xpass=`grep "^$$ws*:test-result:$$ws*XPASS" $$results | wc -l`; \
> +	error=`grep "^$$ws*:test-result:$$ws*ERROR" $$results | wc -l`; \
> +	if test `expr $$fail + $$xpass + $$error` -eq 0; then \
> +	  success=true; \
> +	else \
> +	  success=false; \
> +	fi; \
> +	br='==================='; br=$$br$$br$$br$$br; \
> +	result_count () \
> +	{ \
> +	    if test x"$$1" = x"--maybe-color"; then \
> +	      maybe_colorize=yes; \
> +	    elif test x"$$1" = x"--no-color"; then \
> +	      maybe_colorize=no; \
> +	    else \
> +	      echo "$@: invalid 'result_count' usage" >&2; exit 4; \
> +	    fi; \
> +	    shift; \
> +	    desc=$$1 count=$$2; \
> +	    if test $$maybe_colorize = yes && test $$count -gt 0; then \
> +	      color_start=$$3 color_end=$$std; \
> +	    else \
> +	      color_start= color_end=; \
> +	    fi; \
> +	    echo "$${color_start}# $$desc $$count$${color_end}"; \
> +	}; \
> +	create_testsuite_report () \
> +	{ \
> +	  result_count $$1 "TOTAL:" $$all   "$$brg"; \
> +	  result_count $$1 "PASS: " $$pass  "$$grn"; \
> +	  result_count $$1 "SKIP: " $$skip  "$$blu"; \
> +	  result_count $$1 "XFAIL:" $$xfail "$$lgn"; \
> +	  result_count $$1 "FAIL: " $$fail  "$$red"; \
> +	  result_count $$1 "XPASS:" $$xpass "$$red"; \
> +	  result_count $$1 "ERROR:" $$error "$$mgn"; \
> +	}; \
> +	{								\
> +	  echo "$(PACKAGE_STRING): $(subdir)/$(TEST_SUITE_LOG)" |	\
> +	    $(am__rst_title);						\
> +	  create_testsuite_report --no-color;				\
> +	  echo;								\
> +	  echo ".. contents:: :depth: 2";				\
> +	  echo;								\
> +	  for b in $$bases; do echo $$b; done;				\
> +	} >$(TEST_SUITE_LOG).tmp || exit 1;				\
> +	mv $(TEST_SUITE_LOG).tmp $(TEST_SUITE_LOG);			\
> +	if $$success; then						\
> +	  col="$$grn";							\
> +	 else								\
> +	  col="$$red";							\
> +	  test x"$$VERBOSE" = x || cat $(TEST_SUITE_LOG);		\
> +	fi;								\
> +	echo "$${col}$$br$${std}"; 					\
> +	echo "$${col}Testsuite summary for $(PACKAGE_STRING)$${std}";	\
> +	echo "$${col}$$br$${std}"; 					\
> +	create_testsuite_report --maybe-color;				\
> +	echo "$$col$$br$$std";						\
> +	if $$success; then :; else					\
> +	  echo "$${col}See $(subdir)/$(TEST_SUITE_LOG)$${std}";		\
> +	  if test -n "$(PACKAGE_BUGREPORT)"; then			\
> +	    echo "$${col}Please report to $(PACKAGE_BUGREPORT)$${std}";	\
> +	  fi;								\
> +	  echo "$$col$$br$$std";					\
> +	fi;								\
> +	$$success || exit 1
> +
> +check-TESTS:
> +	@list='$(RECHECK_LOGS)';           test -z "$$list" || rm -f $$list
> +	@list='$(RECHECK_LOGS:.log=.trs)'; test -z "$$list" || rm -f $$list
> +	@test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
> +	@set +e; $(am__set_TESTS_bases); \
> +	log_list=`for i in $$bases; do echo $$i.log; done`; \
> +	trs_list=`for i in $$bases; do echo $$i.trs; done`; \
> +	log_list=`echo $$log_list`; trs_list=`echo $$trs_list`; \
> +	$(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_LOGS="$$log_list"; \
> +	exit $$?;
> +basic.log: basic
> +	@p='basic'; \
> +	b='basic'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +binary.log: binary
> +	@p='binary'; \
> +	b='binary'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +colliding-file-names.log: colliding-file-names
> +	@p='colliding-file-names'; \
> +	b='colliding-file-names'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +excess-slash.log: excess-slash
> +	@p='excess-slash'; \
> +	b='excess-slash'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +help-version.log: help-version
> +	@p='help-version'; \
> +	b='help-version'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +function-line-vs-leading-space.log: function-line-vs-leading-space
> +	@p='function-line-vs-leading-space'; \
> +	b='function-line-vs-leading-space'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +label-vs-func.log: label-vs-func
> +	@p='label-vs-func'; \
> +	b='label-vs-func'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +new-file.log: new-file
> +	@p='new-file'; \
> +	b='new-file'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +no-dereference.log: no-dereference
> +	@p='no-dereference'; \
> +	b='no-dereference'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +no-newline-at-eof.log: no-newline-at-eof
> +	@p='no-newline-at-eof'; \
> +	b='no-newline-at-eof'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +stdin.log: stdin
> +	@p='stdin'; \
> +	b='stdin'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> +filename-quoting.log: filename-quoting
> +	@p='filename-quoting'; \
> +	b='filename-quoting'; \
> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +	--log-file $$b.log --trs-file $$b.trs \
> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
> diff --git a/meta/recipes-extended/diffutils/diffutils-3.3/run-ptest b/meta/recipes-extended/diffutils/diffutils-3.3/run-ptest
> new file mode 100644
> index 0000000..695c5e8
> --- /dev/null
> +++ b/meta/recipes-extended/diffutils/diffutils-3.3/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make -C tests check-TESTS
> diff --git a/meta/recipes-extended/diffutils/diffutils_3.3.bb b/meta/recipes-extended/diffutils/diffutils_3.3.bb
> index 7a95c1a..ab6928a 100644
> --- a/meta/recipes-extended/diffutils/diffutils_3.3.bb
> +++ b/meta/recipes-extended/diffutils/diffutils_3.3.bb
> @@ -3,7 +3,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   
>   require diffutils.inc
>   
> -SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz"
> +SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
> +           file://Makefile \
> +           file://run-ptest \
> +"
>   
>   do_configure_prepend () {
>   	# Need to remove gettext macros with weird mix of versions
> @@ -14,3 +17,13 @@ do_configure_prepend () {
>   
>   SRC_URI[md5sum] = "99180208ec2a82ce71f55b0d7389f1b3"
>   SRC_URI[sha256sum] = "a25e89a8ab65fded1731e4186be1bb25cda967834b6df973599cdcd5abdfc19c"
> +
> +inherit ptest
> +
> +do_install_ptest() {
> +	t=${D}${PTEST_PATH}
> +	mkdir $t/build-aux
> +	cp ${S}/build-aux/test-driver $t/build-aux/
> +	cp -r ${S}/tests $t
> +	cp ${WORKDIR}/Makefile $t/tests/
> +}


