Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 74D6F78870
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 02:41:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2018 19:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,468,1515484800"; d="scan'208";a="211340206"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO [10.221.20.87])
	([10.221.20.87])
	by fmsmga005.fm.intel.com with ESMTP; 13 Mar 2018 19:41:28 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
References: <1519721818-32415-1-git-send-email-anuj.mittal@intel.com>
	<1519786272-21483-1-git-send-email-anuj.mittal@intel.com>
Message-ID: <dfd68a9f-3d73-136e-d5d4-ebd8faf0e76b@intel.com>
Date: Wed, 14 Mar 2018 10:41:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519786272-21483-1-git-send-email-anuj.mittal@intel.com>
Subject: Re: [PATCH v2] gstreamer: enable ptest support
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
X-List-Received-Date: Wed, 14 Mar 2018 02:41:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping. Was there anything wrong with this?

Thanks,
Anuj

On 02/28/2018 10:51 AM, Anuj Mittal wrote:
> Make sure that the tests are packaged and can be executed
> when ptest is enabled. Also, remove build host specific references
> from Makefile.
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../files/add-a-target-to-compile-tests.patch      | 61 ++++++++++++++++++++++
>  meta/recipes-multimedia/gstreamer/files/run-ptest  |  3 ++
>  meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 24 ++++++++-
>  3 files changed, 86 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/files/run-ptest
> 
> diff --git a/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
> new file mode 100644
> index 0000000..b1405b6
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
> @@ -0,0 +1,61 @@
> +From 442691c7778601e3e4b88d0fbfb9d512ed34f414 Mon Sep 17 00:00:00 2001
> +From: Anuj Mittal <anuj.mittal@intel.com>
> +Date: Tue, 27 Feb 2018 09:27:01 +0800
> +Subject: [PATCH] add targets for test installation
> +
> +Targets to make sure tests can be installed and then run on
> +the target.
> +
> +Upstream-Status: Inappropriate [specific to oe setup]
> +
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + Makefile.am             |  3 +++
> + tests/check/Makefile.am | 17 +++++++++++++++++
> + 2 files changed, 20 insertions(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index de057c4..42e90fe 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -96,6 +96,9 @@ check-torture:
> + 
> + build-checks:
> + 	$(MAKE) -C tests/check build-checks
> ++
> ++install-ptest:
> ++	$(MAKE) -C tests/check DESTDIR=$(DESTDIR) $@
> + else
> + check-valgrind:
> + 	echo "'check' library not installed, skipping"
> +diff --git a/tests/check/Makefile.am b/tests/check/Makefile.am
> +index 13b916d..05ab267 100644
> +--- a/tests/check/Makefile.am
> ++++ b/tests/check/Makefile.am
> +@@ -178,6 +178,23 @@ noinst_PROGRAMS =
> + 
> + TESTS = $(check_PROGRAMS)
> + 
> ++install-ptest: $(TESTS)
> ++	@$(INSTALL) -d $(DESTDIR)
> ++	@for dir in gst libs tools pipelines elements generic; do \
> ++		if [ -x $$dir/.libs ]; then \
> ++			$(INSTALL) -d $(DESTDIR)/$$dir; \
> ++			$(INSTALL_PROGRAM) $$dir/.libs/* $(DESTDIR)/$$dir/; \
> ++		fi \
> ++	done
> ++
> ++runtests:
> ++	@for b in $(TESTS); do \
> ++		if [ -x $$b ]; then \
> ++			$(AM_TESTS_ENVIRONMENT) $(SHELL) test-driver --test-name "$$b" \
> ++			--log-file $$b.log --trs-file $$b.trs $$b; \
> ++		fi \
> ++	done
> ++
> + noinst_HEADERS = \
> + 	gst/capslist.h \
> + 	gst/struct_arm.h \
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-multimedia/gstreamer/files/run-ptest b/meta/recipes-multimedia/gstreamer/files/run-ptest
> new file mode 100644
> index 0000000..473d0b6
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/files/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make -k runtests
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> index c2df1f3..9371132 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> @@ -8,7 +8,7 @@ LICENSE = "LGPLv2+"
>  
>  DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
>  
> -inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc
> +inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc ptest
>  
>  # This way common/m4/introspection.m4 will come first
>  # (it has a custom INTROSPECTION_INIT macro, and so must be used instead of our common introspection.m4 file)
> @@ -18,9 +18,12 @@ SRC_URI_append = " \
>      file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>      file://gtk-doc-tweaks.patch \
>      file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
> +    file://add-a-target-to-compile-tests.patch \
> +    file://run-ptest \
>  "
>  
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
> +                   "
>  
>  PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
>  PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
> @@ -59,3 +62,20 @@ do_configure[prefuncs] += "delete_pkg_m4_file"
>  do_compile_prepend() {
>          export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
>  }
> +
> +do_compile_ptest() {
> +        oe_runmake build-checks
> +}
> +
> +do_install_ptest() {
> +        install -m 644 ${B}/tests/check/Makefile ${D}${PTEST_PATH}
> +        install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
> +        sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> +            -e 's|${DEBUG_PREFIX_MAP}||g' \
> +            -e 's:${HOSTTOOLS_DIR}/::g' \
> +            -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> +            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \-e 's/^Makefile:/_Makefile:/' \
> +            -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir = \(.*\)/top_srcdir = ./' \
> +            -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir = \(.*\)/top_builddir = ./' \
> +            -i ${D}${PTEST_PATH}/Makefile
> +}
> 


