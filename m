Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A9F6F60D8A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2013 17:59:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Dec 2013 09:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,561,1384329600"; d="scan'208";a="456573006"
Received: from unknown (HELO [10.255.15.249]) ([10.255.15.249])
	by fmsmga002.fm.intel.com with ESMTP; 27 Dec 2013 09:59:07 -0800
Message-ID: <52BDBFEB.8090109@linux.intel.com>
Date: Fri, 27 Dec 2013 09:59:07 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Chong Lu <Chong.Lu@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1388139291.git.Chong.Lu@windriver.com>
	<c0abd31a05e879ed231974b0412831cdcb2949f1.1388139291.git.Chong.Lu@windriver.com>
In-Reply-To: <c0abd31a05e879ed231974b0412831cdcb2949f1.1388139291.git.Chong.Lu@windriver.com>
Subject: Re: [PATCH 2/2] quilt: enable ptest support
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
X-List-Received-Date: Fri, 27 Dec 2013 17:59:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2013 02:17 AM, Chong Lu wrote:
> Install quilt test suite and run it as ptest.
> Make all ptest pass.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta/recipes-devtools/quilt/quilt-0.61.inc  |   2 +
>   meta/recipes-devtools/quilt/quilt-ptest.inc |  13 +++
>   meta/recipes-devtools/quilt/quilt/Makefile  | 153 ++++++++++++++++++++++++++++
>   meta/recipes-devtools/quilt/quilt/run-ptest |   3 +
>   4 files changed, 171 insertions(+)
>   create mode 100644 meta/recipes-devtools/quilt/quilt-ptest.inc
>   create mode 100644 meta/recipes-devtools/quilt/quilt/Makefile
>   create mode 100755 meta/recipes-devtools/quilt/quilt/run-ptest
>
> diff --git a/meta/recipes-devtools/quilt/quilt-0.61.inc b/meta/recipes-devtools/quilt/quilt-0.61.inc
> index c4a929d..df31663 100644
> --- a/meta/recipes-devtools/quilt/quilt-0.61.inc
> +++ b/meta/recipes-devtools/quilt/quilt-0.61.inc
> @@ -34,3 +34,5 @@ do_install () {
>   	# cleanup unpackaged files
>   	rm -rf ${D}/${datadir}/emacs
>   }
> +
> +require quilt-ptest.inc

Couldn't this just go in the quilt_0.61.bb since it's not needed for the 
-native version?

> diff --git a/meta/recipes-devtools/quilt/quilt-ptest.inc b/meta/recipes-devtools/quilt/quilt-ptest.inc
> new file mode 100644
> index 0000000..026bff5
> --- /dev/null
> +++ b/meta/recipes-devtools/quilt/quilt-ptest.inc
> @@ -0,0 +1,13 @@
> +inherit ptest
> +
> +SRC_URI += "file://run-ptest \
> +            file://Makefile \
> +"
> +
> +do_install_ptest() {
> +	tar -cf - bin/ compat/ quilt/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
Do you really need everything in those directories? Do you need the *.in 
source files?

> +	tar -cf - test/ --exclude delete.test --exclude mail.test --exclude patch-wrapper.test --exclude setup.test| ( cd ${D}${PTEST_PATH} && tar -xf - )
Why exclude some of these tests?

> +	cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}
> +}
> +
> +RDEPENDS_${PN} += "make gawk diffutils findutils ed perl perl-module-filehandle perl-module-getopt-std perl-module-posix"
I think this should be RDEPENDS_${PN}-ptest

> diff --git a/meta/recipes-devtools/quilt/quilt/Makefile b/meta/recipes-devtools/quilt/quilt/Makefile
> new file mode 100644

I also think that you can cut down this makefile to just the check bits 
and remove alot of the additional unused setting up variable.

Sau!

> index 0000000..737c9b8
> --- /dev/null
> +++ b/meta/recipes-devtools/quilt/quilt/Makefile
> @@ -0,0 +1,153 @@
> +PACKAGE :=	quilt
> +VERSION :=	0.61
> +RELEASE :=	1
> +PACKAGE_TARNAME := quilt
> +PACKAGE_BUGREPORT := quilt-dev@nongnu.org
> +
> +prefix :=	/usr
> +exec_prefix :=	/usr
> +bindir :=	/usr/bin
> +datarootdir :=	${prefix}/share
> +datadir :=	/usr/share
> +docdir :=	${datarootdir}/doc/${PACKAGE_TARNAME}
> +mandir :=	/usr/share/man
> +localedir :=	$(datadir)/locale
> +emacsdir :=	$(datadir)/emacs/site-lisp
> +etcdir :=	/etc
> +
> +INSTALL :=	/usr/bin/install -c
> +POD2MAN :=	/usr/bin/pod2man
> +CP :=		/bin/cp
> +DATE :=		/bin/date
> +PERL :=		/usr/bin/perl
> +BASH :=		/bin/bash
> +SHELL:=		/bin/bash # It does not work if dash is used as a shell, for example
> +GREP :=		/bin/grep
> +TAIL :=		/usr/bin/tail
> +TR :=		/usr/bin/tr
> +SED :=		sed
> +AWK :=		/usr/bin/gawk
> +FIND :=		/usr/bin/find
> +XARGS :=	/usr/bin/xargs
> +DIFF :=		/usr/bin/diff
> +PATCH :=	/usr/bin/patch
> +MKTEMP :=	/bin/mktemp
> +DIFFSTAT :=	/usr/bin/diffstat
> +
> +USE_NLS :=	yes
> +STAT_HARDLINK := -c '%h'
> +
> +#-----------------------------------------------------------------------
> +DIRT +=		$(shell $(FIND) . -name '*~')
> +DIRT +=		$(shell $(FIND) . -name '.\#*')
> +
> +BIN_IN :=	quilt guards
> +BIN_SRC :=	$(BIN_IN:%=%.in)
> +BIN :=		$(BIN_IN)
> +SRC +=		$(BIN_SRC:%=bin/%) bin/patch-wrapper.in
> +DIRT +=		$(BIN_IN:%=bin/%) bin/patch-wrapper
> +
> +QUILT_IN :=	$(patsubst quilt/%.in,%,$(wildcard quilt/*.in))
> +QUILT_SRC :=	$(QUILT_IN:%=%.in)
> +QUILT :=	$(QUILT_IN)
> +SRC +=		$(QUILT_SRC:%=quilt/%)
> +DIRT +=		$(QUILT_IN:%=quilt/%)
> +
> +SCRIPTS_IN :=	patchfns inspect dependency-graph edmail	\
> +		remove-trailing-ws backup-files
> +
> +SCRIPTS_SRC :=	$(SCRIPTS_IN:%=%.in)
> +SCRIPTS :=	$(SCRIPTS_IN)
> +SRC +=		$(SCRIPTS_SRC:%=quilt/scripts/%)
> +SRC +=		quilt/scripts/utilfns
> +DIRT +=		$(SCRIPTS_IN:%=quilt/scripts/%)
> +
> +COMPAT :=	$(COMPAT_PROGRAMS:%=compat/%) $(COMPAT_SYMLINKS:%=compat/%)
> +SRC +=		$(wildcard compat/*.in) $(wildcard compat/*.sh)
> +DIRT +=		$(patsubst %.in,%,$(wildcard compat/*.in)) $(COMPAT_SYMLINKS:%=compat/%)
> +
> +LIB_SRC :=	quilt.el
> +SRC +=		$(LIB_SRC:%=lib/%)
> +
> +ifneq ($(POD2MAN),)
> +MAN1 +=		bin/guards.1
> +DIRT +=		bin/guards.1
> +endif
> +
> +LINGUAS :=	fr de ja ru
> +PO :=		quilt.pot $(LINGUAS:%=%.po)
> +SRC +=		$(PO:%=po/%)
> +DIRT +=		po/*.mo po/*~
> +
> +SRC +=		$(wildcard test/*.test) test/run test/test.quiltrc
> +SRC +=		changes2changelog
> +
> +NON_EXEC_IN :=	doc/quilt.1 doc/README quilt/scripts/patchfns quilt/scripts/utilfns
> +
> +TESTS :=	test/*.test
> +DIRT +=		test/.depend $(wildcard test/.*.ok)
> +
> +# Settings for running the uninstalled version of quilt in the source tree:
> +PATH :=		$(CURDIR)/bin:$(CURDIR)/compat:$(PATH)
> +QUILT_DIR :=	$(CURDIR)/quilt
> +QUILTRC :=	$(CURDIR)/test/test.quiltrc
> +export QUILT_DIR QUILTRC
> +
> +#-----------------------------------------------------------------------
> +scripts : $(BIN:%=bin/%) $(QUILT:%=quilt/%) 				\
> +	  $(SCRIPTS:%=quilt/scripts/%) 					\
> +	  $(if $(PATCH_WRAPPER),bin/patch-wrapper)
> +
> +bin/guards.1 : bin/guards
> +	$(POD2MAN) $< > $@
> +
> +compat_leftover := $(filter-out $(COMPAT),$(shell $(FIND) compat -type f -perm -0100))
> +
> +.PHONY :: compat
> +compat :: $(COMPAT)
> +	$(if $(compat_leftover),rm -f $(compat_leftover))
> +
> +
> +check-% : test/.%.ok
> +	@/bin/true
> +
> +# Only include the test suite dependencies when required
> +ifneq ($(findstring test,$(MAKECMDGOALS))$(findstring check,$(MAKECMDGOALS)),)
> +-include test/.depend
> +endif # (test|check)
> +
> +# Include a run-time generated list of dependencies for each test case
> +test/.depend : $(TESTS)
> +	@(  printf "%s : bin/quilt quilt/scripts/patchfns quilt/scripts/utilfns quilt/scripts/backup-files $(COMPAT)\n" $(TESTS); \
> +	    $(AWK) 'sub(/.*\$$ *quilt /, "")				\
> +			{ print FILENAME, ":", "quilt/"$$1}' $(TESTS); \
> +	    $(AWK) 'sub(/.*\<quilt_command /, "") && ($$1 !~ /[^a-z]/)	\
> +			{ print FILENAME, ":", "quilt/"$$1 }' quilt/*.in; \
> +	    $(AWK) 'sub(/.*\$$ *%{QUILT_DIR}\/scripts\//, "")		\
> +			{ print FILENAME, ":", "quilt/scripts/"$$1 }' $(TESTS); \
> +	) | sort -u | $(SED) -re 's:^test/(.*)\.test:test/.\1.ok:' \
> +	    -e 's:quilt/graph:quilt/graph quilt/scripts/dependency-graph:' \
> +	    -e 's:quilt/mail:quilt/mail quilt/scripts/edmail:' \
> +	    -e 's:quilt/refresh:quilt/refresh quilt/scripts/remove-trailing-ws:' \
> +	    -e 's:quilt/setup:quilt/setup quilt/scripts/inspect:' \
> +	  > $@
> +
> +ifneq ($(shell . $(QUILTRC) ;  echo $$QUILT_PATCHES_PREFIX),)
> +CHECK_ENV := P=patches/; _P=../patches/; export P _P
> +endif
> +
> +# Each tests dependencies are stored in test/.depend
> +ifneq ($(findstring check-,$(MAKECMDGOALS)),)
> +test/.%.ok : test/%.test FORCE
> +else
> +test/.%.ok : test/%.test
> +endif
> +	@LANG=C; LC_ALL=C;						\
> +	export LANG LC_ALL;						\
> +	unset POSIXLY_CORRECT;						\
> +	$(CHECK_ENV);							\
> +	cd $(@D);							\
> +	./run -q $(<F)
> +	@touch $@
> +
> +FORCE:
> diff --git a/meta/recipes-devtools/quilt/quilt/run-ptest b/meta/recipes-devtools/quilt/quilt/run-ptest
> new file mode 100755
> index 0000000..5557c0f
> --- /dev/null
> +++ b/meta/recipes-devtools/quilt/quilt/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; do make check-$i; if [ -f test/.$i.ok ]; then echo PASS: $i.test; else echo FAIL: $i.test; fi; done
>

