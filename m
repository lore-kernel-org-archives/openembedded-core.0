Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7TOa-0002qq-KE
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 17:44:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Aug 2012 08:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,347,1344236400"; d="scan'208";a="194196808"
Received: from unknown (HELO [10.255.12.251]) ([10.255.12.251])
	by orsmga002.jf.intel.com with ESMTP; 31 Aug 2012 08:32:14 -0700
Message-ID: <5040D8FE.3050506@linux.intel.com>
Date: Fri, 31 Aug 2012 08:32:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: =?UTF-8?B?QmrDtnJuIFN0ZW5iZXJn?= <bjst@enea.com>
References: <1346422229-61628-1-git-send-email-bjst@enea.com>
	<1346422229-61628-3-git-send-email-bjst@enea.com>
In-Reply-To: <1346422229-61628-3-git-send-email-bjst@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] Enable bash-ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 15:44:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/31/2012 07:10 AM, Björn Stenberg wrote:
> Patch Makefile.in to allow test programs be built on host and ran on
> target.
> Patch tests/run-all to output PASS/FAIL for each testcase.
> Patch recipe to contitionally build and install ptest.
>
> Signed-off-by: Björn Stenberg <bjst@enea.com>
> ---
>   .../bash/bash-4.2/build-tests.patch                |   34 ++++++++++++++++++++
>   meta/recipes-extended/bash/bash-4.2/run-ptest      |    2 +
>   .../bash/bash-4.2/test-output.patch                |   19 +++++++++++
>   meta/recipes-extended/bash/bash.inc                |   23 +++++++++++++
>   meta/recipes-extended/bash/bash_4.2.bb             |    5 ++-
>   5 files changed, 82 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-extended/bash/bash-4.2/build-tests.patch
>   create mode 100644 meta/recipes-extended/bash/bash-4.2/run-ptest
>   create mode 100644 meta/recipes-extended/bash/bash-4.2/test-output.patch
>
You new patches still need patch headers with Upstream-Status and 
Signed-off-by tags.  Please review

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


> diff --git a/meta/recipes-extended/bash/bash-4.2/build-tests.patch b/meta/recipes-extended/bash/bash-4.2/build-tests.patch
> new file mode 100644
> index 0000000..17276c7
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash-4.2/build-tests.patch
> @@ -0,0 +1,34 @@
> +diff -uNr a/Makefile.in b/Makefile.in
> +--- a/Makefile.in	2012-08-31 13:54:15.259491840 +0200
> ++++ b/Makefile.in	2012-08-31 14:54:46.508053649 +0200
> +@@ -827,20 +827,26 @@
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
> + xcase$(EXEEXT):	$(SUPPORT_SRC)xcase.c
> +-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)xcase.c ${LIBS_FOR_BUILD}
> ++	@$(CC) $(CCFLAGS) -o $@ $<
> +
> +-test tests check:	force $(Program) $(TESTS_SUPPORT)
> ++test tests check:
> ++	@$(MAKE) buildtest
> ++	@$(MAKE) runtest
> ++
> ++buildtest: force $(Program) $(TESTS_SUPPORT)
> + 	@-test -d tests || mkdir tests
> + 	@cp $(TESTS_SUPPORT) tests
> ++
> ++runtest:
> + 	@( cd $(srcdir)/tests && \
> + 		PATH=$(BUILD_DIR)/tests:$$PATH THIS_SH=$(THIS_SH) $(SHELL) ${TESTSCRIPT} )
> diff --git a/meta/recipes-extended/bash/bash-4.2/run-ptest b/meta/recipes-extended/bash/bash-4.2/run-ptest
> new file mode 100644
> index 0000000..8dd3b99
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash-4.2/run-ptest
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +make -k THIS_SH=/bin/bash BUILD_DIR=. runtest
> diff --git a/meta/recipes-extended/bash/bash-4.2/test-output.patch b/meta/recipes-extended/bash/bash-4.2/test-output.patch
> new file mode 100644
> index 0000000..065a85c
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash-4.2/test-output.patch
> @@ -0,0 +1,19 @@
> +diff -uNr a/tests/run-all b/tests/run-all
> +--- a/tests/run-all	2012-06-14 10:15:15.007467700 +0200
> ++++ b/tests/run-all	2012-06-14 10:19:26.464678067 +0200
> +@@ -22,6 +22,14 @@
> + 	case $x in
> + 	$0|run-minimal|run-gprof)	;;
> + 	*.orig|*~) ;;
> +-	*)	echo $x ; sh $x ;;
> ++	*)	echo $x
> ++		output=`sh $x`
> ++		if [ -n "$output" ]; then
> ++			echo "$output"
> ++			echo "FAIL: $x"
> ++		else
> ++			echo "PASS: $x"
> ++		fi
> ++		;;
> + 	esac
> + done
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index 3684191..7f7a965 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -21,18 +21,41 @@ ALTERNATIVE_PRIORITY = "100"
>
>   export AUTOHEADER = "true"
>
> +RDEPENDS_${PN}-ptest += "make"
> +FILES_${PN}-dbg += "${PTEST_PATH}/.debug \
> +                    ${PTEST_PATH}/tests/.debug"
> +
> +PTEST_ENABLED = "${@base_contains('IMAGE_FEATURES', 'ptest-pkgs', '1', '0', d)}"
> +
Should this be a DISTRO or IMAGE FEATURE? I can see potential arguments 
for both sides, what was your thinking on choosing IMAGE over DISTRO?

Sau!


>   do_configure_prepend () {
>   	if [ ! -e acinclude.m4 ]; then
>   		cat aclocal.m4 > acinclude.m4
>   	fi
>   }
>
> +do_compile_append () {
> +        if [ ${PTEST_ENABLED} = "1" ] ; then
> +		oe_runmake buildtest
> +        fi
> +}
> +
>   do_install_append () {
>   	# Move /usr/bin/bash to /bin/bash, if need
>   	if [ "${base_bindir}" != "${bindir}" ]; then
>   		mkdir -p ${D}${base_bindir}
>   		mv ${D}${bindir}/bash ${D}${base_bindir}
>   	fi
> +
> +        if [ "${PN}" = "${BPN}" -a ${PTEST_ENABLED} = "1" ]; then
> +            mkdir -p ${D}${PTEST_PATH}
> +            install -m 0755 ${WORKDIR}/run-ptest    ${D}${PTEST_PATH}
> +            install -m 0755 ${B}/Makefile           ${D}${PTEST_PATH}
> +            install -m 0755 ${B}/recho              ${D}${PTEST_PATH}
> +            install -m 0755 ${B}/zecho              ${D}${PTEST_PATH}
> +            install -m 0755 ${B}/printenv           ${D}${PTEST_PATH}
> +            install -m 0755 ${B}/xcase              ${D}${PTEST_PATH}
> +            cp -r ${B}/tests                        ${D}${PTEST_PATH}
> +        fi
>   }
>
>   pkg_postinst_${PN} () {
> diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
> index 50f2ff6..5e9b50e 100644
> --- a/meta/recipes-extended/bash/bash_4.2.bb
> +++ b/meta/recipes-extended/bash/bash_4.2.bb
> @@ -1,6 +1,6 @@
>   require bash.inc
>
> -PR = "r4"
> +PR = "r5"
>
>   SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
>              ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
> @@ -14,6 +14,9 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
>              ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-009;apply=yes;striplevel=0;name=patch009 \
>              ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-010;apply=yes;striplevel=0;name=patch010 \
>              file://execute_cmd.patch;striplevel=0 \
> +           file://build-tests.patch \
> +           file://test-output.patch \
> +           file://run-ptest \
>              "
>
>   SRC_URI[tarball.md5sum] = "3fb927c7c33022f1c327f14a81c0d4b0"
>


