Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A920C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:48:37 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.36337.1741610914439216523
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 05:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JazQI6Tb;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476977848c4so527111cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 05:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741610913; x=1742215713; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIDw0YEltYeGV/1pZ6aEXndaVrcaWZDjlraEMFzKegQ=;
        b=JazQI6TbFc5Ruvb/h5epYYUE15PLc/tCyHk5avWBMSjcaPpTikc80TDSfVOHTNXVqs
         clqBE9FaD3HRMR/1lnXLIFFwXbXtpSSeGpiqyOhQS6X1M/wk5B/2pC2YZMOjJTnD3/dQ
         oS1Z/toKj2pAPE6uVF0BcRnQ4CeldJZm4/QslM/fqPIaIhm6r8dVcFKnuOxxrqR65eqf
         f+eeb+offmhMv0d1vbkltQfFXw+VgCvZHEZegyW1sCfXaOq2svolcZS2Th0SpAB1Oqpw
         qIXCwY8EBw3FzUitLFQ/R0EQy4B5payNh+gYfsIAGsOwyvFr/NBTufACiHKXC8K9vzlR
         ZpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610913; x=1742215713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIDw0YEltYeGV/1pZ6aEXndaVrcaWZDjlraEMFzKegQ=;
        b=bDhAxZVG5uDrmwQG+zEEpIbwX80895uKQOawoYYiee1PcRcmvNubPUfQH9BeGtgcX3
         iMaLrYP7c+y0JIXGgTROvCNe61BzXJW/zQ5rDItobKvHjCayFOoXU/Fe6Wr0rjzXJa1N
         limIW7c1G7tYwt6rNZE+0CVSQ0oc6YM5kvx6TsEw+tYqA7ehW3cFOXpJlUcQ84h17fnA
         tGw8wK9RVkId7uUgSo+w40pFquLXGxwGflTsgdY/hyxYatK93D/1h9tLUUbliowBzxjb
         bsbj+rh6oXZtsKBrwweM0UGsAwhEQgkXsyQnpHGUSD/w25+hi05R7/EJFcNRvfmMuYoN
         adTQ==
X-Gm-Message-State: AOJu0Yx13PmC9CS7tFfyWm0N5pN+6yMhUFXkTAc/JVGVY6fArXzJxqFi
	XhvPmyjAvZshZMve5JMN7H91y7soVJ/VJnaDLpJ2VeaHN1o47l3XNuDBU6RrAmlECqO4+6NRmJ9
	pqd9l3n9OlViCRAnBGWRTFPh6JVc=
X-Gm-Gg: ASbGncsYhQKY2+S089uZHIvKCIMsZVCpfRAuQi5Ne7BFP0x2G7jIuhDvprSce69854A
	rPnEzPe7wBrgr+rclhAQQb6WaZkXi/91HptnzMKZg6fo1hcyDLqMItoWpYlthk8tHqN6JEDqxgY
	RkmCwAIIu0r3WqxzQihEZ8pX98
X-Google-Smtp-Source: AGHT+IGSB1gqjYPEPvJn4azU7NIQduhb9boLKSYb4DWj87EiqNV/+nGSQU5ucEyRhRJ9Mgs9PqGpGoZCFp4pX09L5FA=
X-Received: by 2002:a05:6214:27e2:b0:6e8:9444:7ac8 with SMTP id
 6a1803df08f44-6e9005f78cfmr186063896d6.17.1741610911732; Mon, 10 Mar 2025
 05:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250310071133.2713991-1-bin.lan.cn@windriver.com> <20250310071133.2713991-2-bin.lan.cn@windriver.com>
In-Reply-To: <20250310071133.2713991-2-bin.lan.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Mar 2025 13:48:17 +0100
X-Gm-Features: AQ5f1JrTrINGEE3OVBeuCKJrGQl8eNiNALtsGUSaAu0sy9rsooHYJN2LhZ-cXis
Message-ID: <CANNYZj96yOjER4+xHS5mxjbcj7QeNookrsR_+ee=pz2_TnEayQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 1/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
To: bin.lan.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 12:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212512

Please do not add new Pending patches, especially without an
explanation of what is pending.

If they're suitable for upstream submission, then you should do so
before submitting them to oe-core.

Alex

On Mon, 10 Mar 2025 at 08:12, Bin Lan via lists.openembedded.org
<bin.lan.cn=windriver.com@lists.openembedded.org> wrote:
>
> From: Bin Lan <bin.lan.cn@windriver.com>
>
> Update 0001-Make-manpages-multilib-identical.patch with correct line number.
> 0001-tests-do-not-run-some-tests.patch is used to disable some new test
> cases.
> 0001-tests-do-not-run-test-applications-from-.libs.patch is deleted for the
> commit log is not very accurate and the line number is changed, is replaced
> by 001-tests-set-the-correct-plugin-directory.patch.
> 0001-tests-set-the-correct-plugin-directory.patch is used to set
> the correct directory of plugin shared library.
>
> Copy the trace files (*.ref) and the metadata files (*.mctf) which are required
> by test cases from source directory in babeltrace2_2.1.0.bb.
> Set the correct test environment variables in tests/utils/env.sh when running in an
> embedded environment. Remove "GREP=grep SED=sed PYTHON=python3" from the file run-ptest
> for these test environment variables are set in tests/utils/env.sh.
>
> License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-SA-4.0 PSF-2.0
> Babeltrace 2.1 is a major change. Babeltrace 2.1 is released after five years
> of development after the release of Babeltrace 2.0. The licenses did change
> significantly.
>
> Changelog:
> Babeltrace 2.1, MIP 1 is available and adds many functions
> to support CTF 2 features.
> The Python bindings wrap all the library changes in the same
> systematic way as in Babeltrace 2.0. Add type hints to the
> public API to assist with static analysis of your applications.
>
> Details about the 2.1.0 release:
> https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html
>
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---
>  ...001-Make-manpages-multilib-identical.patch |  9 +--
>  .../0001-tests-do-not-run-some-tests.patch    | 58 +++++++++++++++++++
>  ...not-run-test-applications-from-.libs.patch | 28 ---------
>  ...sts-set-the-correct-plugin-directory.patch | 29 ++++++++++
>  .../lttng/babeltrace2/run-ptest               |  4 +-
>  ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} | 33 +++++++++--
>  6 files changed, 122 insertions(+), 39 deletions(-)
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some-tests.patch
>  delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
>  rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (70%)
>
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
> index 2401b176e6..76bef9c3b8 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
> @@ -5,15 +5,17 @@ Subject: [PATCH] Make manpages multilib identical
>
>  Upstream-Status: Pending
>  Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>  ---
>   doc/man/asciidoc-attrs.conf.in | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attrs.conf.in
> -index ad1183f1..e11c7031 100644
> +index 88fb13ce2..27858b720 100644
>  --- a/doc/man/asciidoc-attrs.conf.in
>  +++ b/doc/man/asciidoc-attrs.conf.in
> -@@ -1,7 +1,7 @@
> +@@ -4,8 +4,8 @@
> +
>   [attributes]
>   # default values
>  -system_plugin_path="@LIBDIR@/babeltrace2/plugins"
> @@ -24,5 +26,4 @@ index ad1183f1..e11c7031 100644
>   enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
>   defrdport=5344
>  --
> -2.24.1
> -
> +2.34.1
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some-tests.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some-tests.patch
> new file mode 100644
> index 0000000000..11d97a276b
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some-tests.patch
> @@ -0,0 +1,58 @@
> +From da489a5476249dbf087cef7f5da57e61aedd443b Mon Sep 17 00:00:00 2001
> +From: Bin Lan <bin.lan.cn@windriver.com>
> +Date: Thu, 6 Mar 2025 16:14:45 +0800
> +Subject: [PATCH] tests: do not run cpp test applications and
> + src.ctf.lttng-live/test-live.sh
> +
> +These cpp common test applications are needed to re-build
> +in the target. The test cases src.ctf.lttng-live/test-live.sh
> +need a local or remote LTTng relay daemon.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> +---
> + tests/Makefile.am | 13 +++++++------
> + 1 file changed, 7 insertions(+), 6 deletions(-)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 2a4022bc4..df990218d 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -128,10 +128,11 @@ cpp_common_test_unicode_conv_LDADD = \
> +       $(top_builddir)/src/lib/libbabeltrace2.la \
> +       $(COMMON_TEST_LDADD)
> +
> +-TESTS_CPP_COMMON = \
> +-      cpp-common/test-c-string-view \
> +-      cpp-common/test-uuid \
> +-      cpp-common/test-unicode-conv
> ++TESTS_CPP_COMMON =
> ++#TESTS_CPP_COMMON = \
> ++#     cpp-common/test-c-string-view \
> ++#     cpp-common/test-uuid \
> ++#     cpp-common/test-unicode-conv
> +
> + TESTS_LIB = \
> +       lib/test-bt-uuid \
> +@@ -225,7 +226,7 @@ endif
> + endif
> +
> + if HAVE_PYTHON
> +-TESTS_PLUGINS += plugins/src.ctf.lttng-live/test-live.sh
> ++#TESTS_PLUGINS += plugins/src.ctf.lttng-live/test-live.sh
> +
> + if DEV_MODE
> + TESTS_LIB += lib/conds/test-conds.sh
> +@@ -272,7 +273,7 @@ endef
> + $(eval $(call check_target,bindings,$(TESTS_BINDINGS)))
> + $(eval $(call check_target,bitfield,$(TESTS_BITFIELD)))
> + $(eval $(call check_target,cli,$(TESTS_CLI)))
> +-$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
> ++#$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
> + $(eval $(call check_target,ctf-writer,$(TESTS_CTF_WRITER)))
> + $(eval $(call check_target,lib,$(TESTS_LIB)))
> + $(eval $(call check_target,plugins,$(TESTS_PLUGINS)))
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
> deleted file mode 100644
> index 805dde8064..0000000000
> --- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
> -Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wallinux@gmail.com>
> -From: Anders Wallin <wallinux@gmail.com>
> -Date: Thu, 5 Mar 2020 11:20:04 +0100
> -Subject: [PATCH] tests: do not run test applications from .libs
> -
> -Cross compile specific change
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -
> -Signed-off-by: Anders Wallin <wallinux@gmail.com>
> ----
> - tests/lib/test_plugin | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
> -index 652c90cc..1f817c50 100755
> ---- a/tests/lib/test_plugin
> -+++ b/tests/lib/test_plugin
> -@@ -26,4 +26,4 @@ fi
> - # shellcheck source=../utils/utils.sh
> - source "$UTILSSH"
> -
> --"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins/.libs"
> -+"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin-plugins"
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
> new file mode 100644
> index 0000000000..6a46c821bf
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
> @@ -0,0 +1,29 @@
> +From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
> +From: Bin Lan <bin.lan.cn@windriver.com>
> +Date: Wed, 5 Mar 2025 10:51:11 +0800
> +Subject: [PATCH] tests: set the correct directory of plugin shared library
> +
> +test-plugins-plugins/.libs is not exist when cross build. The plugin shared
> +libraries are moved from its original test-plugins-plugins/.libs directory
> +to test-plugins-plugins directory when cross build.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> +---
> + tests/lib/test-plugins.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/lib/test-plugins.sh b/tests/lib/test-plugins.sh
> +index f83e42baa..939236393 100755
> +--- a/tests/lib/test-plugins.sh
> ++++ b/tests/lib/test-plugins.sh
> +@@ -14,4 +14,4 @@ fi
> + # shellcheck source=../utils/utils.sh
> + source "$UTILSSH"
> +
> +-"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins/.libs"
> ++"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-plugins-plugins"
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> index 71a9c81bfb..a0bf33b75d 100755
> --- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> +++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> @@ -4,7 +4,7 @@
>
>  # Without --ignore-exit, the tap harness causes any FAILs within a
>  # test plan to raise ERRORs; this is just noise.
> -makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD GREP=grep SED=sed PYTHON=python3"
> +makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD"
>
>  exec 2> error.log
>  make -C tests -k -s $makeargs $target
> @@ -16,4 +16,4 @@ if [ -e tests/test-suite.log ]; then
>      cat tests/test-suite.log
>  fi
>
> -exit $exitcode
> \ No newline at end of file
> +exit $exitcode
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
> similarity index 70%
> rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
> rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
> index 6a0052f779..090d9293e4 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
> @@ -2,17 +2,18 @@ SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
>  DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
>  HOMEPAGE = "http://babeltrace.org/"
>  BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
> -LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
> +LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
>
>  DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>
> -SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
> +SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https \
>             file://run-ptest \
> -           file://0001-tests-do-not-run-test-applications-from-.libs.patch \
>             file://0001-Make-manpages-multilib-identical.patch \
> +           file://0001-tests-do-not-run-some-tests.patch \
> +           file://0001-tests-set-the-correct-plugin-directory.patch \
>             "
> -SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
> +SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
>
>  S = "${WORKDIR}/git"
> @@ -33,6 +34,14 @@ LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld
>  # coreutils since we need full mktemp
>  RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
>
> +do_configure:append() {
> +    # when doing cross compile, the path ${B}/src/plugins/ctf/common/src/metadata/tsdl
> +    # is not created by the babeltrace2 build system. It is need when generating
> +    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
> +    # So make this directory after configuration.
> +    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
> +}
> +
>  do_compile_ptest () {
>      make -C tests all
>  }
> @@ -51,6 +60,10 @@ do_install_ptest () {
>              -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>         find "${S}/tests/$d" -maxdepth 1 -name *.expect \
>              -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> +       find "${S}/tests/$d" -maxdepth 1 -name *.ref \
> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
> +       find "${S}/tests/$d" -maxdepth 1 -name *.mctf \
> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>      done
>      install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
>      cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/data/ctf-traces/
> @@ -92,6 +105,16 @@ do_install_ptest () {
>
>      # Remove architechture specific testfiles
>      rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
> +
> +    # Set the correct environment variables when running embedded environment
> +    envsh=${D}${PTEST_PATH}/tests/utils/env.sh
> +    sed -i "/BT_TESTS_SRCDIR/c\_set_var_def BT_TESTS_SRCDIR '/usr/lib64/babeltrace2/ptest/tests'" $envsh
> +    sed -i "/BT_TESTS_BUILDDIR/c\_set_var_def BT_TESTS_BUILDDIR '/usr/lib64/babeltrace2/ptest/tests'" $envsh
> +    sed -i "/BT_TESTS_AWK_BIN/c\_set_var_def BT_TESTS_AWK_BIN 'gawk'" $envsh
> +    sed -i "/BT_TESTS_GREP_BIN/c\_set_var_def BT_TESTS_GREP_BIN 'grep'" $envsh
> +    sed -i "/BT_TESTS_PYTHON_BIN/c\_set_var_def BT_TESTS_PYTHON_BIN 'python3'" $envsh
> +    sed -i "/BT_TESTS_SED_BIN/c\_set_var_def BT_TESTS_SED_BIN 'sed'" $envsh
> +    sed -i "/BT_TESTS_CC_BIN/c\_set_var_def BT_TESTS_CC_BIN ''" $envsh
>  }
>
>  do_install:append:class-nativesdk() {
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212489): https://lists.openembedded.org/g/openembedded-core/message/212489
> Mute This Topic: https://lists.openembedded.org/mt/111614780/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

