Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 33D40605F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 10:39:38 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1V1DWk-0004oy-6Z from Muhammad_Shakeel@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Jul 2013 03:39:38 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 22 Jul 2013 03:39:38 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Mon, 22 Jul 2013 11:39:35 +0100
Message-ID: <51ED0C16.7060707@mentor.com>
Date: Mon, 22 Jul 2013 15:40:22 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1373008998-24899-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1373008998-24899-1-git-send-email-muhammad_shakeel@mentor.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 22 Jul 2013 10:39:38.0106 (UTC)
	FILETIME=[C3BFBDA0:01CE86C7]
Subject: Re: [PATCH] bash: Add ptest
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
X-List-Received-Date: Mon, 22 Jul 2013 10:39:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 07/05/2013 12:23 PM, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> ptest support was already added for v4.2 but for the distros
> using GPLv2 version of bash (3.2.48) this update is required.
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>   .../bash/bash-3.2.48/build-tests.patch             |   44 ++++++++++++++++++++
>   meta/recipes-extended/bash/bash-3.2.48/run-ptest   |    2 +
>   .../bash/bash-3.2.48/test-output.patch             |   25 +++++++++++
>   meta/recipes-extended/bash/bash_3.2.48.bb          |    3 ++
>   4 files changed, 74 insertions(+)
>
> diff --git a/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch b/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch
> new file mode 100644
> index 0000000..91341ee
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch
> @@ -0,0 +1,44 @@
> +Add 'ptest' target to Makefile, to run tests without checking dependencies.
> +
> +Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> +Upstream-Status: Pending
> +---
> +diff -dNaur bash-3.2.48/Makefile.in.orig bash-3.2.48/Makefile.in
> +--- bash-3.2.48/Makefile.in.orig	2006-08-17 23:03:35.000000000 +0500
> ++++ bash-3.2.48/Makefile.in	2013-07-02 20:20:07.512709327 +0500
> +@@ -803,17 +803,31 @@
> + 	fi
> +
> + recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
> +-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)recho.c ${LIBS_FOR_BUILD}
> ++	@$(CC) $(CCFLAGS) -o $@ $<
> +
> + zecho$(EXEEXT):		$(SUPPORT_SRC)zecho.c
> +-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)zecho.c ${LIBS_FOR_BUILD}
> ++	@$(CC) $(CCFLAGS) -o $@ $<
> +
> + printenv$(EXEEXT):	$(SUPPORT_SRC)printenv.c
> +-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)printenv.c ${LIBS_FOR_BUILD}
> ++	@$(CC) $(CCFLAGS) -o $@ $<
> +
> +-test tests check:	force $(Program) $(TESTS_SUPPORT)
> ++test tests check:
> ++	@$(MAKE) install-test
> ++	@$(MAKE) runtest
> ++
> ++install-test: buildtest
> ++ifeq ($(origin INSTALL_TEST_DIR), undefined)
> + 	@-test -d tests || mkdir tests
> + 	@cp $(TESTS_SUPPORT) tests
> ++else
> ++	@-test -d $(INSTALL_TEST_DIR) || mkdir -p $(INSTALL_TEST_DIR)
> ++	@cp -r $(srcdir)/tests/* $(INSTALL_TEST_DIR)/
> ++	@cp $(TESTS_SUPPORT) $(INSTALL_TEST_DIR)
> ++endif
> ++
> ++buildtest: force $(Program) $(TESTS_SUPPORT)
> ++
> ++runtest:
> + 	@( cd $(srcdir)/tests && \
> + 		PATH=$(BUILD_DIR)/tests:$$PATH THIS_SH=$(THIS_SH) $(SHELL) ${TESTSCRIPT} )
> +
> diff --git a/meta/recipes-extended/bash/bash-3.2.48/run-ptest b/meta/recipes-extended/bash/bash-3.2.48/run-ptest
> new file mode 100644
> index 0000000..8dd3b99
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash-3.2.48/run-ptest
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +make -k THIS_SH=/bin/bash BUILD_DIR=. runtest
> diff --git a/meta/recipes-extended/bash/bash-3.2.48/test-output.patch b/meta/recipes-extended/bash/bash-3.2.48/test-output.patch
> new file mode 100644
> index 0000000..2b09b7d
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash-3.2.48/test-output.patch
> @@ -0,0 +1,25 @@
> +Add FAIL/PASS output to test output.
> +
> +Signed-off-by: Björn Stenberg <bjst@enea.com>
> +Upstream-Status: Pending
> +---
> +diff -uNr a/tests/run-all b/tests/run-all
> +--- a/tests/run-all	1999-10-08 17:07:46.000000000 +0200
> ++++ b/tests/run-all	2012-10-27 21:04:18.663331887 +0200
> +@@ -22,7 +22,15 @@
> + 	case $x in
> + 	$0|run-minimal|run-gprof)	;;
> + 	*.orig|*~) ;;
> +-	*)	echo $x ; sh $x ;;
> ++    *)  echo $x
> ++         output=`sh $x`
> ++         if [ -n "$output" ]; then
> ++             echo "$output"
> ++             echo "FAIL: $x"
> ++         else
> ++             echo "PASS: $x"
> ++         fi
> ++         ;;
> + 	esac
> + done
> +
> diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
> index 4e6f0f3..fe04b28 100644
> --- a/meta/recipes-extended/bash/bash_3.2.48.bb
> +++ b/meta/recipes-extended/bash/bash_3.2.48.bb
> @@ -10,6 +10,9 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
>              ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=patch002 \
>              ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003 \
>              file://mkbuiltins_have_stringize.patch \
> +           file://build-tests.patch \
> +           file://test-output.patch \
> +           file://run-ptest \
>             "
>   
>   SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
Hi Saul,

Can you please comment on the status of this patch?

Best Regards
Shakeel

