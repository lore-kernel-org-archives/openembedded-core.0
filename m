Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6ACB962132
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 15:37:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v79FbENq012315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Aug 2017 08:37:15 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 9 Aug 2017 08:37:14 -0700
To: Joe Slater <jslater@windriver.com>,
	<openembedded-core@lists.openembedded.org>, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>
References: <20170801193653.250282-1-jslater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <d3091518-36fd-c50b-ee4e-188fa1e55d07@windriver.com>
Date: Wed, 9 Aug 2017 11:37:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170801193653.250282-1-jslater@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH 1/1] slang: fix terminfo related problems
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
X-List-Received-Date: Wed, 09 Aug 2017 15:37:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-01 03:36 PM, Joe Slater wrote:
> Do not use the JD_TERMCAP macro since we cannot get the terminfo from
> ncurses pkg-config variants, but fix the macro to not reference host
> directories.  Also add src/test/Makefile.in so that we can use -ltermcap
> if we want to.
> 
> Since the recipe DEPENDS on ncurses, we assume terminfo is there.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>

Not in master[-next] yet...

Robert is listed as the maintainer.
Robert, do you agree with this fix?

../Randy

> ---
>   .../slang/slang/terminfo_fixes.patch               | 148 +++++++++++++++++++++
>   meta/recipes-extended/slang/slang_2.3.1a.bb        |   1 +
>   2 files changed, 149 insertions(+)
>   create mode 100644 meta/recipes-extended/slang/slang/terminfo_fixes.patch
> 
> diff --git a/meta/recipes-extended/slang/slang/terminfo_fixes.patch b/meta/recipes-extended/slang/slang/terminfo_fixes.patch
> new file mode 100644
> index 0000000..3e6d15a
> --- /dev/null
> +++ b/meta/recipes-extended/slang/slang/terminfo_fixes.patch
> @@ -0,0 +1,148 @@
> +Do not use the JD_TERMCAP macro since we cannot get the terminfo from
> +ncurses pkg-config, but fix the macro to not reference host directories.
> +Also add src/test/Makefile.in so that we can use -ltermcap if we want to.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +
> +--- a/autoconf/aclocal.m4
> ++++ b/autoconf/aclocal.m4
> +@@ -506,14 +506,10 @@ then
> + else
> +    MISC_TERMINFO_DIRS=""
> + fi
> +-JD_Terminfo_Dirs="$MISC_TERMINFO_DIRS \
> +-                  /usr/lib/terminfo \
> +-                  /usr/share/terminfo \
> +-                  /usr/share/lib/terminfo \
> +-		  /usr/local/lib/terminfo"
> ++
> + TERMCAP=-ltermcap
> +
> +-for terminfo_dir in $JD_Terminfo_Dirs
> ++for terminfo_dir in $MISC_TERMINFO_DIRS
> + do
> +    if test -d $terminfo_dir
> +    then
> +--- a/autoconf/configure.ac
> ++++ b/autoconf/configure.ac
> +@@ -249,7 +249,14 @@ AC_CHECK_SIZEOF(size_t)
> + JD_CHECK_LONG_LONG
> + JD_LARGE_FILE_SUPPORT
> +
> +-JD_TERMCAP
> ++dnl Do not use JD_TERMCAP, since we cannot get terminfo from ncurses*-config anymore.
> ++dnl Set TERMCAP=-ltermcap and AC_DEFINE(USE_TERMCAP,1,[Define to use termcap])
> ++dnl to use libtermcap.
> ++TERMCAP=""
> ++MISC_TERMINFO_DIRS=""
> ++AC_SUBST(TERMCAP)dnl
> ++AC_SUBST(MISC_TERMINFO_DIRS)dnl
> ++
> + JD_GCC_WARNINGS
> +
> + JD_SET_OBJ_SRC_DIR(src)
> +@@ -364,7 +371,7 @@ AC_CONFIG_HEADER(src/sysconf.h:src/confi
> + dnl AC_CONFIG_SUBDIRS(demo)
> +
> + AC_OUTPUT(Makefile:autoconf/Makefile.in \
> +-  src/Makefile slsh/Makefile modules/Makefile demo/Makefile \
> ++  src/Makefile src/test/Makefile slsh/Makefile modules/Makefile demo/Makefile \
> +   slang.pc:autoconf/slangpc.in \
> + )
> +
> +--- /dev/null
> ++++ b/src/test/Makefile.in
> +@@ -0,0 +1,90 @@
> ++# -*- make -*-
> ++TEST_SCRIPTS_SLC = argv syntax scircuit eqs sscanf loops arith array strops \
> ++  bstring pack stdio assoc selfload struct nspace path ifeval anytype arrmult \
> ++  time utf8 except bugs list regexp method deref naninf overflow sort \
> ++  longlong signal dollar req docfun debug qualif compare break multline \
> ++  stack misc posixio posdir proc math
> ++
> ++TEST_SCRIPTS_NO_SLC = autoload nspace2 prep
> ++
> ++TEST_SCRIPTS = $(TEST_SCRIPTS_SLC) $(TEST_SCRIPTS_NO_SLC)
> ++
> ++TEST_PGM = sltest
> ++MEMCHECK = valgrind --tool=memcheck --leak-check=yes --leak-resolution=med --num-callers=20
> ++RUN_TEST_PGM = ./$(TEST_PGM)
> ++SLANGINC = ..
> ++SLANGLIB = ../$(ARCH)objs
> ++OTHER_LIBS = -lm @TERMCAP@
> ++OTHER_CFLAGS =
> ++
> ++runtests: $(TEST_PGM) cleantmp
> ++	@tests=""; \
> ++	for test in $(TEST_SCRIPTS); \
> ++	do \
> ++	   tests="$$tests $$test.sl"; \
> ++	done; \
> ++	for test in $(TEST_SCRIPTS_SLC); \
> ++	do \
> ++	   tests="$$tests $$test.slc"; \
> ++	done; \
> ++	MAKERUNNING=1 ./runtests.sh $$tests
> ++#	@touch $(TEST_PGM).c
> ++
> ++update: $(TEST_PGM) cleantmp
> ++	@tests=""; \
> ++	for X in $(TEST_SCRIPTS); \
> ++	do \
> ++	  if [ ! -e lastrun/$$X.sl ] || [ $$X.sl -nt lastrun/$$X.sl ] ; \
> ++	  then \
> ++	   tests="$$tests $$X.sl"; \
> ++	  fi \
> ++	done; \
> ++	for X in $(TEST_SCRIPTS_SLC); \
> ++	do \
> ++	  if [ ! -e lastrun/$$X.slc ] || [ $$X.sl -nt lastrun/$$X.slc ] ; \
> ++	  then \
> ++	   tests="$$tests $$X.slc"; \
> ++	  fi \
> ++	done; \
> ++	if test -n "$$tests"; \
> ++	then \
> ++	  MAKERUNNING=1 ./runtests.sh $$tests; \
> ++	fi
> ++#	@touch $(TEST_PGM).c
> ++
> ++memcheck_runtests: $(TEST_PGM) cleantmp
> ++	@echo ""
> ++	@echo "Running tests:"
> ++	@echo ""
> ++	-@for X in $(TEST_SCRIPTS); \
> ++	do \
> ++	   $(MEMCHECK) --log-file=log.$${X} $(RUN_TEST_PGM) $$X.sl; \
> ++	   grep ERROR log.$${X}; grep 'lost: [^0]' log.$${X}; \
> ++	   $(MEMCHECK) --log-file=log.$${X}_u $(RUN_TEST_PGM) -utf8 $$X.sl; \
> ++	   grep ERROR log.$${X}_u; grep 'lost: [^0]' log.$${X}_u; \
> ++	done
> ++#	touch $(TEST_PGM).c
> ++
> ++memcheck_runtests_slc: $(TEST_PGM) cleantmp
> ++	@echo ""
> ++	@echo "Running tests:"
> ++	@echo ""
> ++	-@for X in $(TEST_SCRIPTS_SLC); \
> ++	do \
> ++	   $(MEMCHECK) --log-file=log.$${X}_c $(RUN_TEST_PGM) $$X.slc; \
> ++	   $(MEMCHECK) --log-file=log.$${X}_uc $(RUN_TEST_PGM) -utf8 $$X.slc; \
> ++	done
> ++#	touch $(TEST_PGM).c
> ++
> ++memcheck: memcheck_runtests memcheck_runtests_slc
> ++
> ++$(TEST_PGM): $(TEST_PGM).c assoc.c list.c $(SLANGLIB)/libslang.a
> ++	$(CC) $(CFLAGS) $(OTHER_CFLAGS) $(LDFLAGS) $(TEST_PGM).c -o $(TEST_PGM) -I$(SLANGINC) -L$(SLANGLIB) -lslang $(OTHER_LIBS)
> ++cleantmp:
> ++	-/bin/rm -rf tmpfile*.* tmpdir*.*
> ++clean: cleantmp
> ++	-/bin/rm -f *~ *.o *.log log.pid* *.slc log.* *.log-*
> ++distclean: clean
> ++	/bin/rm -f $(TEST_PGM) $(TEST_PGM).gcda $(TEST_PGM).gcno
> ++.PHONY: clean memcheck runtests memcheck_runtests_slc memcheck_runtests cleantmp
> ++
> diff --git a/meta/recipes-extended/slang/slang_2.3.1a.bb b/meta/recipes-extended/slang/slang_2.3.1a.bb
> index b302104..0585c14 100644
> --- a/meta/recipes-extended/slang/slang_2.3.1a.bb
> +++ b/meta/recipes-extended/slang/slang_2.3.1a.bb
> @@ -18,6 +18,7 @@ SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
>              file://no-x.patch \
>              file://dont-link-to-host.patch \
>              file://test-add-output-in-the-format-result-testname.patch \
> +           file://terminfo_fixes.patch \
>              file://run-ptest \
>             "
>   
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

