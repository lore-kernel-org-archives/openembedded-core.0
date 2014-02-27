Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id BADBF6F139
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:50:43 +0000 (UTC)
Received: from SESTOEX05.enea.se ([fe80::41cb:8d2e:2e90:a183]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Thu, 27 Feb 2014 15:50:40 +0100
From: Tudor Florea <Tudor.Florea@enea.com>
To: Lu Chong <Chong.Lu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] diffutils: enable ptest support
Thread-Index: AQHPJ89nifnVPP/FkEKiH5lJTr10u5rIt7kAgAAfzwCAAA2iAIAAXq/A
Date: Thu, 27 Feb 2014 14:50:40 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A4289C714A@sestoex05.enea.se>
References: <cover.1392194903.git.Chong.Lu@windriver.com>
	<117d903587f2a50aefa11a1271ce66f62e551a68.1392194903.git.Chong.Lu@windriver.com>
	<530EE6AC.8070801@windriver.com>
	<26724FB0BFCB3D4C91BDE184751AA3A4289C6EC8@sestoex05.enea.se>
	<530F0CCA.6090208@windriver.com>
In-Reply-To: <530F0CCA.6090208@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.14.159]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 27 Feb 2014 14:50:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Since the recipe is inheriting autotools, then I think the Makefile is recr=
eated from Makefile.am/Makefile.in. If this is not the case this means=20
that do we ignore the changes eventually done upstream in those files?

One more small comment: I'd recommend using: "install -D" instead of "cp -r=
" in do_install_ptest().

Regards,
  Tudor.

-----Original Message-----
From: Lu Chong [mailto:Chong.Lu@windriver.com]=20
Sent: Thursday, February 27, 2014 12:01
To: Tudor Florea; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] diffutils: enable ptest support

If use Makefile.am, many variables and paths need be modified.
So I add a new Makefile for ptest.

Chong

On 02/27/2014 04:14 PM, Tudor Florea wrote:
> Isn't possible to modify Makefile.am and/or Makefile.in instead of Makefi=
le?
>   Regards,
>     Tudor.
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of Lu Chong
> Sent: Thursday, February 27, 2014 09:18
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] diffutils: enable ptest support
>
> ping
>
> On 02/12/2014 04:49 PM, Chong Lu wrote:
>> Install diffutils test suite and run it as ptest.
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>    .../diffutils/diffutils-3.3/Makefile               | 284 ++++++++++++=
+++++++++
>>    .../diffutils/diffutils-3.3/run-ptest              |   3 +
>>    meta/recipes-extended/diffutils/diffutils_3.3.bb   |  15 +-
>>    3 files changed, 301 insertions(+), 1 deletion(-)
>>    create mode 100644 meta/recipes-extended/diffutils/diffutils-3.3/Make=
file
>>    create mode 100644 meta/recipes-extended/diffutils/diffutils-3.3/run-=
ptest
>>
>> diff --git a/meta/recipes-extended/diffutils/diffutils-3.3/Makefile b/me=
ta/recipes-extended/diffutils/diffutils-3.3/Makefile
>> new file mode 100644
>> index 0000000..d3bb587
>> --- /dev/null
>> +++ b/meta/recipes-extended/diffutils/diffutils-3.3/Makefile
>> @@ -0,0 +1,284 @@
>> +am__tty_colors_dummy =3D \
>> +  mgn=3D red=3D grn=3D lgn=3D blu=3D brg=3D std=3D; \
>> +  am__color_tests=3Dno
>> +am__tty_colors =3D { \
>> +  $(am__tty_colors_dummy); \
>> +  if test "X$(AM_COLOR_TESTS)" =3D Xno; then \
>> +    am__color_tests=3Dno; \
>> +  elif test "X$(AM_COLOR_TESTS)" =3D Xalways; then \
>> +    am__color_tests=3Dyes; \
>> +  elif test "X$$TERM" !=3D Xdumb && { test -t 1; } 2>/dev/null; then \
>> +    am__color_tests=3Dyes; \
>> +  fi; \
>> +  if test $$am__color_tests =3D yes; then \
>> +    red=3D'=1B[0;31m'; \
>> +    grn=3D'=1B[0;32m'; \
>> +    lgn=3D'=1B[1;32m'; \
>> +    blu=3D'=1B[1;34m'; \
>> +    mgn=3D'=1B[0;35m'; \
>> +    brg=3D'=1B[1m'; \
>> +    std=3D'=1B[m'; \
>> +  fi; \
>> +}
>> +
>> +am__vpath_adj_setup =3D srcdirstrip=3D`echo "$(srcdir)" | sed 's|.|.|g'=
`;
>> +am__vpath_adj =3D case $$p in \
>> +    $(srcdir)/*) f=3D`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
>> +    *) f=3D$$p;; \
>> +  esac;
>> +am__rst_title =3D { sed 's/.*/   &   /;h;s/./=3D/g;p;x;s/ *$$//;p;g' &&=
 echo; }
>> +am__sh_e_setup =3D case $$- in *e*) set +e;; esac
>> +am__common_driver_flags =3D \
>> +  --color-tests "$$am__color_tests" \
>> +  --enable-hard-errors "$$am__enable_hard_errors" \
>> +  --expect-failure "$$am__expect_failure"
>> +
>> +am__check_pre =3D \
>> +$(am__sh_e_setup); \
>> +$(am__vpath_adj_setup) $(am__vpath_adj) \
>> +$(am__tty_colors); \
>> +srcdir=3D$(srcdir); export srcdir; \
>> +case "$@" in \
>> +  */*) am__odir=3D`echo "./$@" | sed 's|/[^/]*$$||'`;; \
>> +    *) am__odir=3D.;; \
>> +esac; \
>> +test "x$$am__odir" =3D x"." || test -d "$$am__odir" \
>> +  || $(MKDIR_P) "$$am__odir" || exit $$?; \
>> +if test -f "./$$f"; then dir=3D./; \
>> +elif test -f "$$f"; then dir=3D; \
>> +else dir=3D"$(srcdir)/"; fi; \
>> +tst=3D$$dir$$f; log=3D'$@'; \
>> +if test -n '$(DISABLE_HARD_ERRORS)'; then \
>> +  am__enable_hard_errors=3Dno; \
>> +else \
>> +  am__enable_hard_errors=3Dyes; \
>> +fi; \
>> +$(TESTS_ENVIRONMENT)
>> +
>> +am__set_TESTS_bases =3D \
>> +  bases=3D'$(TEST_LOGS)'; \
>> +  bases=3D`for i in $$bases; do echo $$i; done | sed 's/\.log$$//'`; \
>> +  bases=3D`echo $$bases`
>> +
>> +RECHECK_LOGS =3D $(TEST_LOGS)
>> +TEST_SUITE_LOG =3D test-suite.log
>> +LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
>> +am__test_logs1 =3D $(TESTS:=3D.log)
>> +am__test_logs2 =3D $(am__test_logs1:.log=3D.log)
>> +TEST_LOGS =3D $(am__test_logs2:.test.log=3D.log)
>> +TEST_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
>> +AWK =3D awk
>> +MKDIR_P =3D /bin/mkdir -p
>> +PACKAGE_BUGREPORT =3D bug-diffutils@gnu.org
>> +PACKAGE_STRING =3D GNU diffutils 3.3
>> +SHELL =3D /bin/sh
>> +VERSION =3D 3.3
>> +abs_srcdir =3D $(PWD)
>> +abs_top_builddir =3D $(PWD)/..
>> +abs_top_srcdir =3D $(PWD)/..
>> +srcdir =3D .
>> +top_srcdir =3D ..
>> +subdir =3D tests
>> +
>> +TESTS =3D \
>> +  basic \
>> +  binary \
>> +  colliding-file-names \
>> +  excess-slash \
>> +  help-version \
>> +  function-line-vs-leading-space \
>> +  label-vs-func	\
>> +  new-file \
>> +  no-dereference \
>> +  no-newline-at-eof \
>> +  stdin \
>> +  filename-quoting
>> +
>> +TESTS_ENVIRONMENT =3D \
>> +  tmp__=3D$$TMPDIR; test -d "$$tmp__" || tmp__=3D.; \
>> +  TMPDIR=3D$$tmp__; export TMPDIR; \
>> +  export \
>> +  VERSION=3D'$(VERSION)' \
>> +  abs_top_builddir=3D'$(abs_top_builddir)' \
>> +  abs_top_srcdir=3D'$(abs_top_srcdir)' \
>> +  abs_srcdir=3D'$(abs_srcdir)' \
>> +  built_programs=3Ddiff \
>> +  srcdir=3D'$(srcdir)' \
>> +  top_srcdir=3D'$(top_srcdir)' \
>> +  MAKE=3D$(MAKE) \
>> +  PACKAGE_BUGREPORT=3D'$(PACKAGE_BUGREPORT)' \
>> +  PATH=3D'$(abs_top_builddir)/src$(PATH_SEPARATOR)'"$$PATH" \
>> +  ; 9>&2
>> +
>> +$(TEST_SUITE_LOG): $(TEST_LOGS)
>> +	@$(am__set_TESTS_bases); \
>> +	am__f_ok () { test -f "$$1" && test -r "$$1"; }; \
>> +	redo_bases=3D`for i in $$bases; do \
>> +	              am__f_ok $$i.trs && am__f_ok $$i.log || echo $$i; \
>> +	            done`; \
>> +	st=3D0;  \
>> +	errmsg=3D"fatal: making $(TEST_SUITE_LOG): failed to create"; \
>> +	for i in $$redo_bases; do \
>> +	    test -f $$i.trs && test -r $$i.trs \
>> +	      || { echo "$$errmsg $$i.trs" >&2; st=3D1; }; \
>> +	    test -f $$i.log && test -r $$i.log \
>> +	      || { echo "$$errmsg $$i.log" >&2; st=3D1; }; \
>> +	done; \
>> +	test $$st -eq 0 || exit 1;
>> +	@$(am__sh_e_setup); $(am__tty_colors); $(am__set_TESTS_bases); \
>> +	ws=3D'[ 	]'; \
>> +	results=3D`for b in $$bases; do echo $$b.trs; done`; \
>> +	test -n "$$results" || results=3D/dev/null; \
>> +	all=3D`  grep "^$$ws*:test-result:"           $$results | wc -l`; \
>> +	pass=3D` grep "^$$ws*:test-result:$$ws*PASS"  $$results | wc -l`; \
>> +	fail=3D` grep "^$$ws*:test-result:$$ws*FAIL"  $$results | wc -l`; \
>> +	skip=3D` grep "^$$ws*:test-result:$$ws*SKIP"  $$results | wc -l`; \
>> +	xfail=3D`grep "^$$ws*:test-result:$$ws*XFAIL" $$results | wc -l`; \
>> +	xpass=3D`grep "^$$ws*:test-result:$$ws*XPASS" $$results | wc -l`; \
>> +	error=3D`grep "^$$ws*:test-result:$$ws*ERROR" $$results | wc -l`; \
>> +	if test `expr $$fail + $$xpass + $$error` -eq 0; then \
>> +	  success=3Dtrue; \
>> +	else \
>> +	  success=3Dfalse; \
>> +	fi; \
>> +	br=3D'=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D'; br=
=3D$$br$$br$$br$$br; \
>> +	result_count () \
>> +	{ \
>> +	    if test x"$$1" =3D x"--maybe-color"; then \
>> +	      maybe_colorize=3Dyes; \
>> +	    elif test x"$$1" =3D x"--no-color"; then \
>> +	      maybe_colorize=3Dno; \
>> +	    else \
>> +	      echo "$@: invalid 'result_count' usage" >&2; exit 4; \
>> +	    fi; \
>> +	    shift; \
>> +	    desc=3D$$1 count=3D$$2; \
>> +	    if test $$maybe_colorize =3D yes && test $$count -gt 0; then \
>> +	      color_start=3D$$3 color_end=3D$$std; \
>> +	    else \
>> +	      color_start=3D color_end=3D; \
>> +	    fi; \
>> +	    echo "$${color_start}# $$desc $$count$${color_end}"; \
>> +	}; \
>> +	create_testsuite_report () \
>> +	{ \
>> +	  result_count $$1 "TOTAL:" $$all   "$$brg"; \
>> +	  result_count $$1 "PASS: " $$pass  "$$grn"; \
>> +	  result_count $$1 "SKIP: " $$skip  "$$blu"; \
>> +	  result_count $$1 "XFAIL:" $$xfail "$$lgn"; \
>> +	  result_count $$1 "FAIL: " $$fail  "$$red"; \
>> +	  result_count $$1 "XPASS:" $$xpass "$$red"; \
>> +	  result_count $$1 "ERROR:" $$error "$$mgn"; \
>> +	}; \
>> +	{								\
>> +	  echo "$(PACKAGE_STRING): $(subdir)/$(TEST_SUITE_LOG)" |	\
>> +	    $(am__rst_title);						\
>> +	  create_testsuite_report --no-color;				\
>> +	  echo;								\
>> +	  echo ".. contents:: :depth: 2";				\
>> +	  echo;								\
>> +	  for b in $$bases; do echo $$b; done;				\
>> +	} >$(TEST_SUITE_LOG).tmp || exit 1;				\
>> +	mv $(TEST_SUITE_LOG).tmp $(TEST_SUITE_LOG);			\
>> +	if $$success; then						\
>> +	  col=3D"$$grn";							\
>> +	 else								\
>> +	  col=3D"$$red";							\
>> +	  test x"$$VERBOSE" =3D x || cat $(TEST_SUITE_LOG);		\
>> +	fi;								\
>> +	echo "$${col}$$br$${std}"; 					\
>> +	echo "$${col}Testsuite summary for $(PACKAGE_STRING)$${std}";	\
>> +	echo "$${col}$$br$${std}"; 					\
>> +	create_testsuite_report --maybe-color;				\
>> +	echo "$$col$$br$$std";						\
>> +	if $$success; then :; else					\
>> +	  echo "$${col}See $(subdir)/$(TEST_SUITE_LOG)$${std}";		\
>> +	  if test -n "$(PACKAGE_BUGREPORT)"; then			\
>> +	    echo "$${col}Please report to $(PACKAGE_BUGREPORT)$${std}";	\
>> +	  fi;								\
>> +	  echo "$$col$$br$$std";					\
>> +	fi;								\
>> +	$$success || exit 1
>> +
>> +check-TESTS:
>> +	@list=3D'$(RECHECK_LOGS)';           test -z "$$list" || rm -f $$list
>> +	@list=3D'$(RECHECK_LOGS:.log=3D.trs)'; test -z "$$list" || rm -f $$lis=
t
>> +	@test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
>> +	@set +e; $(am__set_TESTS_bases); \
>> +	log_list=3D`for i in $$bases; do echo $$i.log; done`; \
>> +	trs_list=3D`for i in $$bases; do echo $$i.trs; done`; \
>> +	log_list=3D`echo $$log_list`; trs_list=3D`echo $$trs_list`; \
>> +	$(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_LOGS=3D"$$log_list"; \
>> +	exit $$?;
>> +basic.log: basic
>> +	@p=3D'basic'; \
>> +	b=3D'basic'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +binary.log: binary
>> +	@p=3D'binary'; \
>> +	b=3D'binary'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +colliding-file-names.log: colliding-file-names
>> +	@p=3D'colliding-file-names'; \
>> +	b=3D'colliding-file-names'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +excess-slash.log: excess-slash
>> +	@p=3D'excess-slash'; \
>> +	b=3D'excess-slash'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +help-version.log: help-version
>> +	@p=3D'help-version'; \
>> +	b=3D'help-version'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +function-line-vs-leading-space.log: function-line-vs-leading-space
>> +	@p=3D'function-line-vs-leading-space'; \
>> +	b=3D'function-line-vs-leading-space'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +label-vs-func.log: label-vs-func
>> +	@p=3D'label-vs-func'; \
>> +	b=3D'label-vs-func'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +new-file.log: new-file
>> +	@p=3D'new-file'; \
>> +	b=3D'new-file'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +no-dereference.log: no-dereference
>> +	@p=3D'no-dereference'; \
>> +	b=3D'no-dereference'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +no-newline-at-eof.log: no-newline-at-eof
>> +	@p=3D'no-newline-at-eof'; \
>> +	b=3D'no-newline-at-eof'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +stdin.log: stdin
>> +	@p=3D'stdin'; \
>> +	b=3D'stdin'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> +filename-quoting.log: filename-quoting
>> +	@p=3D'filename-quoting'; \
>> +	b=3D'filename-quoting'; \
>> +	$(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>> +	--log-file $$b.log --trs-file $$b.trs \
>> +	$(am__common_driver_flags) -- $(SHELL) "$$tst"
>> diff --git a/meta/recipes-extended/diffutils/diffutils-3.3/run-ptest b/m=
eta/recipes-extended/diffutils/diffutils-3.3/run-ptest
>> new file mode 100644
>> index 0000000..695c5e8
>> --- /dev/null
>> +++ b/meta/recipes-extended/diffutils/diffutils-3.3/run-ptest
>> @@ -0,0 +1,3 @@
>> +#!/bin/sh
>> +
>> +make -C tests check-TESTS
>> diff --git a/meta/recipes-extended/diffutils/diffutils_3.3.bb b/meta/rec=
ipes-extended/diffutils/diffutils_3.3.bb
>> index 7a95c1a..ab6928a 100644
>> --- a/meta/recipes-extended/diffutils/diffutils_3.3.bb
>> +++ b/meta/recipes-extended/diffutils/diffutils_3.3.bb
>> @@ -3,7 +3,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673=
463ab874e80d47fae504"
>>   =20
>>    require diffutils.inc
>>   =20
>> -SRC_URI =3D "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz"
>> +SRC_URI =3D "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
>> +           file://Makefile \
>> +           file://run-ptest \
>> +"
>>   =20
>>    do_configure_prepend () {
>>    	# Need to remove gettext macros with weird mix of versions
>> @@ -14,3 +17,13 @@ do_configure_prepend () {
>>   =20
>>    SRC_URI[md5sum] =3D "99180208ec2a82ce71f55b0d7389f1b3"
>>    SRC_URI[sha256sum] =3D "a25e89a8ab65fded1731e4186be1bb25cda967834b6df=
973599cdcd5abdfc19c"
>> +
>> +inherit ptest
>> +
>> +do_install_ptest() {
>> +	t=3D${D}${PTEST_PATH}
>> +	mkdir $t/build-aux
>> +	cp ${S}/build-aux/test-driver $t/build-aux/
>> +	cp -r ${S}/tests $t
>> +	cp ${WORKDIR}/Makefile $t/tests/
>> +}
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


