Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C109578874
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 01:06:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2018 18:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,220,1526367600"; d="scan'208";a="236992871"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.16.95])
	([10.221.16.95])
	by fmsmga005.fm.intel.com with ESMTP; 13 Jun 2018 18:06:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
References: <20180525062014.22022-1-anuj.mittal@intel.com>
Message-ID: <19b0e46e-9aab-ac07-1a64-70087e01d64a@intel.com>
Date: Thu, 14 Jun 2018 09:06:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180525062014.22022-1-anuj.mittal@intel.com>
Subject: Re: [PATCH v4 01/12] gstreamer: enable ptest support
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
X-List-Received-Date: Thu, 14 Jun 2018 01:06:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

On 05/25/2018 02:20 PM, Anuj Mittal wrote:
> Make sure that the tests are packaged and can be executed
> when ptest is enabled. Also, remove build host specific references
> from Makefile.
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
> 
> v4:
> Tweak AM_TESTS_ENVIRONMENT to remove hardcoded paths.
> 
> ---
>  .../files/add-a-target-to-compile-tests.patch | 69 +++++++++++++++++++
>  .../gstreamer/files/run-ptest                 |  3 +
>  .../gstreamer/gstreamer1.0_1.14.0.bb          | 26 ++++++-
>  3 files changed, 96 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/files/run-ptest
> 
> diff --git a/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
> new file mode 100644
> index 0000000000..d02d869410
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
> @@ -0,0 +1,69 @@
> +From d61414bc17cf2df019510c2908048c4cabf5cf09 Mon Sep 17 00:00:00 2001
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
> +
> +---
> + tests/check/Makefile.am | 27 ++++++++++++++++++++-------
> + 1 file changed, 20 insertions(+), 7 deletions(-)
> +
> +diff --git a/tests/check/Makefile.am b/tests/check/Makefile.am
> +index 13b916d..a66786d 100644
> +--- a/tests/check/Makefile.am
> ++++ b/tests/check/Makefile.am
> +@@ -8,11 +8,7 @@ REGISTRY_ENVIRONMENT = \
> + 	GST_REGISTRY=$(CHECK_REGISTRY)
> + 
> + AM_TESTS_ENVIRONMENT += \
> +-        GST_STATE_IGNORE_ELEMENTS="$(STATE_IGNORE_ELEMENTS)"	\
> +-        $(REGISTRY_ENVIRONMENT)					\
> +-        GST_PLUGIN_SCANNER_1_0=$(top_builddir)/libs/gst/helpers/gst-plugin-scanner \
> +-        GST_PLUGIN_SYSTEM_PATH_1_0=					\
> +-        GST_PLUGIN_PATH_1_0=$(top_builddir)/plugins
> ++        GST_STATE_IGNORE_ELEMENTS="$(STATE_IGNORE_ELEMENTS)"
> + 
> + plugindir = $(libdir)/gstreamer-@GST_API_VERSION@
> + 
> +@@ -178,6 +174,23 @@ noinst_PROGRAMS =
> + 
> + TESTS = $(check_PROGRAMS)
> + 
> ++install-ptest: $(TESTS)
> ++	@$(INSTALL) -d $(DESTDIR)
> ++	@for dir in `find -maxdepth 1 -type d`; do \
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
> +@@ -221,9 +234,9 @@ gst_gstprintf_LDADD = \
> + 	$(LDADD)
> + 
> + elements_fdsrc_CFLAGS=$(GST_OBJ_CFLAGS) $(AM_CFLAGS) \
> +-	-DTESTFILE=\"$(top_srcdir)/configure.ac\"
> ++	-DTESTFILE=\"Makefile\"
> + elements_filesrc_CFLAGS=$(GST_OBJ_CFLAGS) $(AM_CFLAGS) \
> +-	-DTESTFILE=\"$(top_srcdir)/configure.ac\"
> ++	-DTESTFILE=\"Makefile\"
> + 
> + libs_controller_LDADD = \
> + 	$(top_builddir)/libs/gst/controller/libgstcontroller-@GST_API_VERSION@.la \
> diff --git a/meta/recipes-multimedia/gstreamer/files/run-ptest b/meta/recipes-multimedia/gstreamer/files/run-ptest
> new file mode 100644
> index 0000000000..473d0b67a7
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/files/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make -k runtests
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
> index b4398c8111..e842f30c5a 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
> @@ -8,7 +8,7 @@ LICENSE = "LGPLv2+"
>  
>  DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
>  
> -inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc
> +inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc ptest
>  
>  # This way common/m4/introspection.m4 will come first
>  # (it has a custom INTROSPECTION_INIT macro, and so must be used instead of our common introspection.m4 file)
> @@ -24,11 +24,14 @@ SRC_URI = " \
>      file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>      file://gtk-doc-tweaks.patch \
>      file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
> +    file://add-a-target-to-compile-tests.patch \
> +    file://run-ptest \
>  "
>  SRC_URI[md5sum] = "63c7cbfb86aa28c4522e374dc5555b96"
>  SRC_URI[sha256sum] = "fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e6b251db8b4b0398466e"
>  
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
> +                   "
>  
>  PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
>  PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
> @@ -55,6 +58,7 @@ FILES_${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadi
>  
>  RRECOMMENDS_${PN}_qemux86 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
>  RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
> +RDEPENDS_${PN}-ptest += "make"
>  
>  delete_pkg_m4_file() {
>          # This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
> @@ -68,4 +72,22 @@ do_compile_prepend() {
>          export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
>  }
>  
> +do_compile_ptest() {
> +        oe_runmake build-checks
> +}
> +
> +do_install_ptest() {
> +        oe_runmake -C tests/check DESTDIR=${D}${PTEST_PATH} install-ptest
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
> +
>  CVE_PRODUCT = "gstreamer"
> 


