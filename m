Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 3091E61165
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:23:06 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Sep 2013 11:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,855,1371106800"; d="scan'208";a="291753419"
Received: from unknown (HELO [10.255.14.211]) ([10.255.14.211])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Sep 2013 11:22:46 -0700
Message-ID: <522A1D75.8040408@linux.intel.com>
Date: Fri, 06 Sep 2013 11:22:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Mihaela Sendrea <mihaela.sendrea@enea.com>
References: <1378474690-39713-1-git-send-email-mihaela.sendrea@enea.com>
	<1378474690-39713-3-git-send-email-mihaela.sendrea@enea.com>
In-Reply-To: <1378474690-39713-3-git-send-email-mihaela.sendrea@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] gcc-runtime: Add ptest
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
X-List-Received-Date: Fri, 06 Sep 2013 18:23:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2013 06:38 AM, Mihaela Sendrea wrote:
> libstdc++-v3 tests need g++ installed on the target, otherwise the
> majority of the tests will fail.
> The v3-build_support (initial support for objects needed for the test
> suite) is built separately at build time, to be able to still run and
> see the testcases and their output: PASS/FAIL/SKIP.
>
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.8.inc              |    2 +
>   .../gcc-4.8/add-install-ptest-to-Makefile.patch    |  162 ++++++++++++++++++++
>   meta/recipes-devtools/gcc/gcc-4.8/run-ptest        |    3 +
>   meta/recipes-devtools/gcc/gcc-common.inc           |    2 +-
>   meta/recipes-devtools/gcc/gcc-runtime.inc          |   21 ++-
>   5 files changed, 188 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/add-install-ptest-to-Makefile.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/run-ptest
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index 0fbbc1d..9632e6f 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -75,6 +75,8 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>   	   file://0043-cpp.patch \
>   	   file://0044-gengtypes.patch \
>   	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
> +	   file://add-install-ptest-to-Makefile.patch \
> +	   file://run-ptest \
>   	  "
>   SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
>   SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/add-install-ptest-to-Makefile.patch b/meta/recipes-devtools/gcc/gcc-4.8/add-install-ptest-to-Makefile.patch
> new file mode 100644
> index 0000000..3dedde5
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/add-install-ptest-to-Makefile.patch
> @@ -0,0 +1,162 @@
> +Add 'install-ptest' rule.
> +
> +Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> +Upstream-status: Pending

A small nit, status should bu Upstream-Status:

Sau!



> +---
> +diff -uNr a/libstdc++-v3/Makefile.in b/libstdc++-v3/Makefile.in
> +--- a/libstdc++-v3/Makefile.in	2013-07-01 13:01:43.659958328 +0200
> ++++ b/libstdc++-v3/Makefile.in	2013-08-23 13:22:41.962029555 +0200
> +@@ -710,6 +710,26 @@
> + dvi:
> + install-dvi:
> +
> ++spath=$(subst /,\/,$(SOURCE_DIR))
> ++bpath=$(subst /,\/,$(BUILD_DIR))
> ++rpath=$(subst /,\/,$(REPLACE_DIR))
> ++install-ptest:
> ++	mkdir -p $(DEST_DIR)/gcc/testsuite
> ++	mkdir -p $(DEST_DIR)/libstdc++-v3
> ++	mkdir -p $(DEST_DIR)/contrib
> ++	cp -r $(SOURCE_DIR)/libstdc++-v3/testsuite $(DEST_DIR)/libstdc++-v3
> ++	cp    $(SOURCE_DIR)/contrib/dg-extract-results.sh $(DEST_DIR)/contrib
> ++	cp    $(SOURCE_DIR)/gcc/BASE-VER $(DEST_DIR)/gcc
> ++	cp -r $(SOURCE_DIR)/gcc/testsuite/lib $(DEST_DIR)/gcc/testsuite
> ++	cp -r $(SOURCE_DIR)/libstdc++-v3/scripts $(DEST_DIR)/libstdc++-v3
> ++	cp $(BUILD_DIR)/libstdc++-v3/scripts/* $(DEST_DIR)/libstdc++-v3/scripts
> ++	cp $(BUILD_DIR)/libstdc++-v3/testsuite/Makefile	$(DEST_DIR)/libstdc++-v3/testsuite
> ++	cp $(BUILD_DIR)/libstdc++-v3/Makefile $(DEST_DIR)/libstdc++-v3
> ++	sed -i -e 's|^Makefile:|_Makefile:|' $(DEST_DIR)/libstdc++-v3/testsuite/Makefile
> ++	sed -i -e "s/$(spath)/$(rpath)/g" -e "s/$(bpath)/$(rpath)/g" $(DEST_DIR)/libstdc++-v3/testsuite/Makefile
> ++	sed -i -e "s/$(spath)/$(rpath)/g" -e "s/$(bpath)/$(rpath)/g" $(DEST_DIR)/libstdc++-v3/Makefile
> ++	sed -i -e 's/RUNTESTDEFAULTFLAGS.=/RUNTESTDEFAULTFLAGS =-a/g' ${DEST_DIR}/libstdc++-v3/testsuite/Makefile
> ++
> + # All the machinations with string instantiations messes up the
> + # automake-generated TAGS rule. Make a simple one here.
> + TAGS: tags-recursive $(LISP)
> +diff -uNr a/libstdc++-v3/testsuite/Makefile.in b/libstdc++-v3/testsuite/Makefile.in
> +--- a/libstdc++-v3/testsuite/Makefile.in	2013-07-05 16:06:08.995480821 +0200
> ++++ b/libstdc++-v3/testsuite/Makefile.in	2013-08-26 08:50:04.698546942 +0200
> +@@ -478,6 +478,8 @@
> + 	maintainer-clean-generic mostlyclean mostlyclean-generic \
> + 	mostlyclean-libtool pdf pdf-am ps ps-am uninstall uninstall-am
> +
> ++buildtest-TESTS:
> ++	-@runtest $(AM_RUNTESTFLAGS) --tool libstdc++ $(RUNTESTFLAGS) buildtest.exp
> +
> + # This rule generates all of the testsuite_files* lists at once.
> + ${lists_of_files}:
> +@@ -545,7 +547,7 @@
> +
> + # Run the testsuite in normal mode.
> + check-DEJAGNU $(check_DEJAGNU_normal_targets): check-DEJAGNU%: site.exp
> +-	AR="$(AR)"; export AR; \
> ++	-@(AR="$(AR)"; export AR; \
> + 	RANLIB="$(RANLIB)"; export RANLIB; \
> + 	if [ -z "$*$(filter-out --target_board=%, $(RUNTESTFLAGS))" ] \
> + 	    && [ "$(filter -j, $(MFLAGS))" = "-j" ]; then \
> +@@ -563,6 +565,7 @@
> + 	  exit 0; \
> + 	fi; \
> + 	srcdir=`$(am__cd) $(srcdir) && pwd`; export srcdir; \
> ++	$(SHELL) command -v g++ >/dev/null 2>&1 || echo "g++ is not installed on your system! Please note that most of the tests need g++."; \
> + 	EXPECT=$(EXPECT); export EXPECT; \
> + 	runtest=$(RUNTEST); \
> + 	if [ -z "$$runtest" ]; then runtest=runtest; fi; \
> +@@ -606,7 +609,7 @@
> + 		    $(RUNTESTFLAGS); \
> + 	  fi; \
> + 	else echo "WARNING: could not find \`runtest'" 1>&2; :;\
> +-	fi
> ++	fi)
> +
> + check-am:
> + 	$(MAKE) $(AM_MAKEFLAGS) check-DEJAGNU
> +diff -uNr a/libstdc++-v3/testsuite/buildtest.exp b/libstdc++-v3/testsuite/buildtest.exp
> +--- a/libstdc++-v3/testsuite/buildtest.exp	1970-01-01 01:00:00.000000000 +0100
> ++++ b/libstdc++-v3/testsuite/buildtest.exp	2013-08-14 09:25:57.773587133 +0200
> +@@ -0,0 +1,33 @@
> ++# Copyright (C) 2013 Free Software Foundation, Inc.
> ++#
> ++# This program is free software; you can redistribute it and/or modify
> ++# it under the terms of the GNU General Public License as published by
> ++# the Free Software Foundation; either version 3 of the License, or
> ++# (at your option) any later version.
> ++#
> ++# This program is distributed in the hope that it will be useful,
> ++# but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++# GNU General Public License for more details.
> ++#
> ++# You should have received a copy of the GNU General Public License
> ++# along with this program; see the file COPYING3.  If not see
> ++# <http://www.gnu.org/licenses/>.
> ++
> ++# If there is no baseline file, or we can't find the library, skip
> ++# this test. Or, hey, if we don't support this kind of symbol
> ++# versioning test: don't run it.
> ++
> ++
> ++set baseline_subdir "[eval exec $cxx $baseline_subdir_switch]"
> ++
> ++# Build the support objects.
> ++v3-build_support
> ++
> ++# Build the abi_check program.
> ++if { [v3_target_compile "$srcdir/util/testsuite_abi_check.cc" "abi_check" \
> ++      "executable" [list "additional_flags=-w"]] != "" } {
> ++    error "could not compile testsuite_abi_check.cc"
> ++}
> ++
> ++
> +diff -uNr a/libstdc++-v3/testsuite/libstdc++-abi/abi.exp b/libstdc++-v3/testsuite/libstdc++-abi/abi.exp
> +--- a/libstdc++-v3/testsuite/libstdc++-abi/abi.exp	2013-08-09 10:02:56.769743266 +0200
> ++++ b/libstdc++-v3/testsuite/libstdc++-abi/abi.exp	2013-08-14 09:27:15.722299887 +0200
> +@@ -24,11 +24,6 @@
> +     set lib $blddir/src/.libs/libstdc++.so
> + }
> +
> +-set baseline_subdir "[eval exec $cxx $baseline_subdir_switch]"
> +-
> +-# Build the support objects.
> +-v3-build_support
> +-
> + if { (${v3-symver} == 0) || ![info exists baseline_dir] \
> + 	 || ![file exists $baseline_dir] \
> + 	 || ![file exists $lib] } {
> +@@ -50,12 +45,6 @@
> + remote_exec "build" "$objdir/../scripts/extract_symvers" \
> +     [list $lib "current_symbols.txt"]
> +
> +-# Build the abi_check program.
> +-if { [v3_target_compile "$srcdir/util/testsuite_abi_check.cc" "abi_check" \
> +-      "executable" [list "additional_flags=-w"]] != "" } {
> +-    error "could not compile testsuite_abi_check.cc"
> +-}
> +-
> + remote_download "target" $baseline_file "baseline_symbols.txt"
> + remote_download "target" "current_symbols.txt" "current_symbols.txt"
> + set result [${tool}_load "./abi_check" \
> +diff -uNr a/libstdc++-v3/testsuite/libstdc++-dg/conformance.exp b/libstdc++-v3/testsuite/libstdc++-dg/conformance.exp
> +--- a/libstdc++-v3/testsuite/libstdc++-dg/conformance.exp	2013-08-09 13:06:20.795174486 +0200
> ++++ b/libstdc++-v3/testsuite/libstdc++-dg/conformance.exp	2013-08-23 13:25:31.290856664 +0200
> +@@ -21,9 +21,6 @@
> + # Initialization.
> + dg-init
> +
> +-# Build the support objects.
> +-v3-build_support
> +-
> + set tests [list]
> +
> + # If there is a "testsuite_files" file, use it.
> +diff -uNr a/libstdc++-v3/testsuite/libstdc++-prettyprinters/prettyprinters.exp b/libstdc++-v3/testsuite/libstdc++-prettyprinters/prettyprinters.exp
> +--- a/libstdc++-v3/testsuite/libstdc++-prettyprinters/prettyprinters.exp	2013-08-09 13:08:17.946244225 +0200
> ++++ b/libstdc++-v3/testsuite/libstdc++-prettyprinters/prettyprinters.exp	2013-08-09 13:31:19.812003255 +0200
> +@@ -17,7 +17,6 @@
> + load_lib gdb-test.exp
> +
> + dg-init
> +-v3-build_support
> +
> + global GDB
> + if ![info exists ::env(GUALITY_GDB_NAME)] {
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/run-ptest b/meta/recipes-devtools/gcc/gcc-4.8/run-ptest
> new file mode 100644
> index 0000000..36eccc3
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make -C libstdc++-v3/testsuite -i check | sed -e 's/ERROR/FAIL/' -e 's/XFAIL/PASS/' -e 's/XPASS/FAIL/' -e 's/UNRESOLVED/SKIP/' -e 's/UNTESTED/SKIP/' -e 's/UNSUPPORTED/SKIP/'
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> index d20be9f..b1d87fb 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -5,7 +5,7 @@ LICENSE = "GPL"
>
>   NATIVEDEPS = ""
>
> -inherit autotools gettext
> +inherit autotools gettext ptest
>
>   def get_gcc_fpu_setting(bb, d):
>       if d.getVar('ARMPKGSFX_EABI', True) == "hf" and d.getVar('TRANSLATED_TARGET_ARCH', True) == "arm":
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index b882889..69a7897 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -9,7 +9,8 @@ EXTRA_OECONF_PATHS = " \
>
>   ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
>
> -EXTRA_OECONF += "--disable-libunwind-exceptions"
> +EXTRA_OECONF += "--disable-libunwind-exceptions \
> +                 ${@base_contains('DISTRO_FEATURES', 'ptest', 1, 0, d)}"
>   EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>
>   RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
> @@ -57,6 +58,23 @@ do_install () {
>   	chown -R root:root ${D}
>   }
>
> +RDEPENDS_${PN}-ptest = "dejagnu make"
> +
> +do_configure_ptest() {
> +    if [ "${PN}" = "${BPN}" ]; then
> +        mkdir -p ${D}${PTEST_PATH}
> +        cp ${S}/../run-ptest ${WORKDIR}
> +    fi
> +}
> +
> +do_compile_ptest() {
> +    oe_runmake -C ${B}/${TARGET_SYS}/libstdc++-v3/testsuite buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +    oe_runmake -C ${B}/${TARGET_SYS}/libstdc++-v3 install-ptest DEST_DIR=${D}${PTEST_PATH} SOURCE_DIR=${S} BUILD_DIR=${B}/${TARGET_SYS} REPLACE_DIR=${PTEST_PATH}
> +}
> +
>   INHIBIT_DEFAULT_DEPS = "1"
>   DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ libgcc"
>   PROVIDES = "virtual/${TARGET_PREFIX}compilerlibs"
> @@ -81,6 +99,7 @@ PACKAGES = "\
>     libgomp \
>     libgomp-dev \
>     libgomp-staticdev \
> +  ${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)} \
>   "
>   # The base package doesn't exist, so we clear the recommends.
>   RRECOMMENDS_${PN}-dbg = ""
>

