Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCDEC282EC
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 14:21:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.14444.1741270863877584985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 06:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BlsHPaqv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bd45e4d91so4931315e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 06:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741270862; x=1741875662; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1mODPTwyjLQ9+KF9gyZziIOWPY7B3AC/gVxQRf68sdM=;
        b=BlsHPaqvaHpBqY2Sv/fknBfaLeI4+11i0EuECOT7hVlCg4rm2Dd2ftSct5Sr/qrY19
         NNiRsmrFOzzWRnBHNjtsF68MQSr8Mxf/53gNDL0N/I4Y9avxrDerT/aqv0Gw+ijmOt1n
         ft8ApDY18iuZ0wBRzodgXZYTQ9/VVrxgCEPlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741270862; x=1741875662;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mODPTwyjLQ9+KF9gyZziIOWPY7B3AC/gVxQRf68sdM=;
        b=F+iY8z1xQI8qoDo2A9sWxanxGQFuN+LWtsOBFKSXD39/Y0Gy+ugiOm7tMyyZu8b7Hn
         qHK0rpu7kwIRz5aQ28OAY8z8hgWZnTaf/zJ7d4nrfkCfKtavRP6LrITXJLs9ysEPDSdG
         hqSBiTh6OcDvlAxHlyOVSxsgvbK4uTb0XsblkDjyS6vfMAIjAlPjNmkJvQIa+7ozpO6J
         NMSxY//fOKMTho5P+XuzuNoBSZ/iKcpIWRRDnVRJlGs/EKsGH0T1Dh6NpzNUxP4449Ty
         bX1vEDQ2tw0yr1AFx5RvqchxXbYxD1lJzWoKgb29/1yTsdSBTGY6teEXKDcWnswaye1x
         auxg==
X-Forwarded-Encrypted: i=1; AJvYcCVUeLGlTSFfAkznFpF7sFSuohj9HDirgwZKxHCujVxiWiSgPqDMSF7qqkGvR/MvbZpUPL3odIbiRogRkJ94zwcYbQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx+ak9HDrTRObcb+DLBEqU+cMetqRKPhl9vaJLAxjogF2xcMlHK
	BCYD0E2g44xmlQXE13qMDHMa3M08nD3jGuTgPWcXnJVChACRJKxMizO5Lnm03Fo=
X-Gm-Gg: ASbGncvGNSIFaktWQn6oi75Va9m4A8mFmKknnzTDPq3h/C7O8dPG8+ENJXLZeC9lgzH
	QBBV6Qkj1d8FtsCifxjbr9VxpoR9+SP3/9RJm4XgMOE5xyapwbbtingM4p1hQH46RhjzcHna+94
	1IOQOBzujfbieNeiVg6cmRFxnnlQGVC67LHQEoiHukXvuS845xSrcRQ2qGYkFy7xMvNsL2/SAjq
	wLa4gIGWfRWPNr+u6QTxtDHk0gewAnUTQ300fq0nPyDnRtsgiGVv4N/E25aLeOjCFU9yDMQegQ0
	XbzEpC3n5Z2DYPaodOTgxGjRfGLn65Qsavi1ZLtwiRCXLt0FYheg6Xpzd3QBCJvxizwGU+62jdj
	hF0iYNmYmHx1PewvuBjwyV0mIm2xvZoPOXg==
X-Google-Smtp-Source: AGHT+IET9XZa5ec0p8yAhwOTPYVBAE9QQ7Uq4kIUJYrVdi/2twmeqkxa3K+8B0OZvZlqwukB7I/WYA==
X-Received: by 2002:a05:600c:1989:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-43bdb37b723mr25438825e9.5.1741270861831;
        Thu, 06 Mar 2025 06:21:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:da9c:79c9:8542:465b? ([2001:8b0:aba:5f3c:da9c:79c9:8542:465b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8de4ffsm21445665e9.24.2025.03.06.06.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 06:21:01 -0800 (PST)
Message-ID: <d398e9868bddf35019775837e9d7296b574cba50.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3] babeltrace2: upgrade 2.0.6 -> 2.1.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bin.lan.cn@windriver.com, openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Thu, 06 Mar 2025 14:20:59 +0000
In-Reply-To: <20250306085625.2864894-1-bin.lan.cn@windriver.com>
References: <20250306085625.2864894-1-bin.lan.cn@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 14:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212391

On Thu, 2025-03-06 at 16:56 +0800, Bin Lan via lists.openembedded.org wrote=
:
> From: Bin Lan <bin.lan.cn@windriver.com>
>=20
> 0001-tests-do-not-run-test-applications-from-.libs.patch is deleted
> for tests/lib/test_plugin is removed.
> 0001-tests-do-not-run-some-tests.patch is used to disable
> some new test cases.
>=20
> License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-SA-4.=
0 PSF-2.0

It would be helpful to note that 2.1 is a major change and 5 years of
development compared to 2.0. This means the licenses did change
significantly.

> Changelog:
> Babeltrace 2.1, MIP 1 is available and adds many functions
> to support CTF 2 features.
> The Python bindings wrap all the library changes in the same
> systematic way as in Babeltrace 2.0. Add type hints to the
> public API to assist with static analysis of your applications.
>=20
> Details about the 2.1.0 release:
> https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.=
html
>=20
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---
> Some failed test cases are disabled for I have not time to fix it=20
> before the feature freeze to investigate.
> All test cases are passed when running in intel-x86-64 board, please see
> the following summary:
>=20
> Testsuite summary for babeltrace2 2.1.0
> # TOTAL: 1962
> # PASS:=C2=A0 1962
> # SKIP:=C2=A0 0
> # XFAIL: 0
> # FAIL:=C2=A0 0
> # XPASS: 0
> # ERROR: 0
>=20
> ---
> =C2=A0...001-Make-manpages-multilib-identical.patch |=C2=A0 9 +--
> =C2=A0.../0001-tests-do-not-run-some-tests.patch=C2=A0=C2=A0=C2=A0 | 58 +=
++++++++++++++++++
> =C2=A0...not-run-test-applications-from-.libs.patch | 28 ---------
> =C2=A0...o-not-run-test-applications-in-.libs.patch | 27 +++++++++
> =C2=A0.../lttng/babeltrace2/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++-
> =C2=A0...eltrace2_2.0.6.bb =3D> babeltrace2_2.1.0.bb} | 25 ++++++--
> =C2=A06 files changed, 115 insertions(+), 39 deletions(-)
> =C2=A0create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests=
-do-not-run-some-tests.patch
> =C2=A0delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests=
-do-not-run-test-applications-from-.libs.patch
> =C2=A0create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests=
-do-not-run-test-applications-in-.libs.patch
> =C2=A0rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb =3D> babeltr=
ace2_2.1.0.bb} (77%)
>=20
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-mul=
tilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-man=
pages-multilib-identical.patch
> index 2401b176e6..76bef9c3b8 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-i=
dentical.patch
> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-i=
dentical.patch
> @@ -5,15 +5,17 @@ Subject: [PATCH] Make manpages multilib identical
> =C2=A0
> =C2=A0Upstream-Status: Pending
> =C2=A0Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> =C2=A0---
> =C2=A0 doc/man/asciidoc-attrs.conf.in | 4 ++--
> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> =C2=A0
> =C2=A0diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attr=
s.conf.in
> -index ad1183f1..e11c7031 100644
> +index 88fb13ce2..27858b720 100644
> =C2=A0--- a/doc/man/asciidoc-attrs.conf.in
> =C2=A0+++ b/doc/man/asciidoc-attrs.conf.in
> -@@ -1,7 +1,7 @@
> +@@ -4,8 +4,8 @@
> +
> =C2=A0 [attributes]
> =C2=A0 # default values
> =C2=A0-system_plugin_path=3D"@LIBDIR@/babeltrace2/plugins"
> @@ -24,5 +26,4 @@ index ad1183f1..e11c7031 100644
> =C2=A0 enable_debug_info=3D"@ENABLE_DEBUG_INFO_VAL@"
> =C2=A0 defrdport=3D5344
> =C2=A0--=20
> -2.24.1
> -
> +2.34.1
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-=
some-tests.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-=
run-some-tests.patch
> new file mode 100644
> index 0000000000..a488662e67
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-some-te=
sts.patch
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
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> +---
> + tests/Makefile.am | 13 +++++++------
> + 1 file changed, 7 insertions(+), 6 deletions(-)
>=20

Has this issue been discussed with upstream? It sounds like a generic
problem they might be interested to fix?

> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 2a4022bc4..df990218d 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -128,10 +128,11 @@ cpp_common_test_unicode_conv_LDADD =3D \
> +=C2=A0	$(top_builddir)/src/lib/libbabeltrace2.la \
> +=C2=A0	$(COMMON_TEST_LDADD)
> +=20
> +-TESTS_CPP_COMMON =3D \
> +-	cpp-common/test-c-string-view \
> +-	cpp-common/test-uuid \
> +-	cpp-common/test-unicode-conv
> ++TESTS_CPP_COMMON =3D
> ++#TESTS_CPP_COMMON =3D \
> ++#	cpp-common/test-c-string-view \
> ++#	cpp-common/test-uuid \
> ++#	cpp-common/test-unicode-conv
> +=20
> + TESTS_LIB =3D \
> +=C2=A0	lib/test-bt-uuid \
> +@@ -225,7 +226,7 @@ endif
> + endif
> +=20
> + if HAVE_PYTHON
> +-TESTS_PLUGINS +=3D plugins/src.ctf.lttng-live/test-live.sh
> ++#TESTS_PLUGINS +=3D plugins/src.ctf.lttng-live/test-live.sh
> +=20
> + if DEV_MODE
> + TESTS_LIB +=3D lib/conds/test-conds.sh
> +@@ -272,7 +273,7 @@ endef
> + $(eval $(call check_target,bindings,$(TESTS_BINDINGS)))
> + $(eval $(call check_target,bitfield,$(TESTS_BITFIELD)))
> + $(eval $(call check_target,cli,$(TESTS_CLI)))
> +-$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
> ++#$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
> + $(eval $(call check_target,ctf-writer,$(TESTS_CTF_WRITER)))
> + $(eval $(call check_target,lib,$(TESTS_LIB)))
> + $(eval $(call check_target,plugins,$(TESTS_PLUGINS)))
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-=
test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/=
0001-tests-do-not-run-test-applications-from-.libs.patch
> deleted file mode 100644
> index 805dde8064..0000000000
> --- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-ap=
plications-from-.libs.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 2001
> -Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git.wal=
linux@gmail.com>
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
> - # shellcheck source=3D../utils/utils.sh
> - source "$UTILSSH"
> -=20
> --"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin=
-plugins/.libs"
> -+"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-plugin=
-plugins"
> ---=20
> -2.25.1

I suspect this is incorrect upstream and should be fixed there. .libs
in an internal libtool thing and shouldn't be referenced.


> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-=
test-applications-in-.libs.patch b/meta/recipes-kernel/lttng/babeltrace2/00=
01-tests-do-not-run-test-applications-in-.libs.patch
> new file mode 100644
> index 0000000000..36d7184e97
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-ap=
plications-in-.libs.patch
> @@ -0,0 +1,27 @@
> +From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 2001
> +From: Bin Lan <bin.lan.cn@windriver.com>
> +Date: Wed, 5 Mar 2025 10:51:11 +0800
> +Subject: [PATCH] tests: do not run test applications in .libs
> +
> +.libs is not exist when cross build.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
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
> + # shellcheck source=3D../utils/utils.sh
> + source "$UTILSSH"
> +=20
> +-"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-=
plugins-plugins/.libs"
> ++"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/test-=
plugins-plugins"
> +--=20
> +2.34.1
>=20

Same as above.


> diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recip=
es-kernel/lttng/babeltrace2/run-ptest
> index 71a9c81bfb..7620161838 100755
> --- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> +++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
> @@ -4,7 +4,9 @@
> =C2=A0
> =C2=A0# Without --ignore-exit, the tap harness causes any FAILs within a
> =C2=A0# test plan to raise ERRORs; this is just noise.
> -makeargs=3D"LOG_DRIVER_FLAGS=3D--ignore-exit abs_top_srcdir=3D$PWD abs_t=
op_builddir=3D$PWD GREP=3Dgrep SED=3Dsed PYTHON=3Dpython3"
> +makeargs=3D"LOG_DRIVER_FLAGS=3D--ignore-exit abs_top_srcdir=3D$PWD abs_t=
op_builddir=3D$PWD \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BT_TESTS_SED_BIN=
=3Dsed BT_TESTS_PYTHON_BIN=3Dpython3 BT_TESTS_GREP_BIN=3Dgrep \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BT_TESTS_AWK_BIN=
=3Dawk"
> =C2=A0
> =C2=A0exec 2> error.log
> =C2=A0make -C tests -k -s $makeargs $target
> @@ -16,4 +18,5 @@ if [ -e tests/test-suite.log ]; then
> =C2=A0=C2=A0=C2=A0=C2=A0 cat tests/test-suite.log
> =C2=A0fi
> =C2=A0
> -exit $exitcode
> \ No newline at end of file
> +exit $exitcode
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipe=
s-kernel/lttng/babeltrace2_2.1.0.bb
> similarity index 77%
> rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
> rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
> index a50ba8fcdf..322aaf8201 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
> @@ -2,17 +2,18 @@ SUMMARY =3D "Babeltrace2 - Trace Format Babel Tower"
> =C2=A0DESCRIPTION =3D "Babeltrace provides trace read and write libraries=
 in host side, as well as a trace converter, which used to convert LTTng 2.=
0 traces into human-readable log."
> =C2=A0HOMEPAGE =3D "http://babeltrace.org/"
> =C2=A0BUGTRACKER =3D "https://bugs.lttng.org/projects/babeltrace"
> -LICENSE =3D "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da6a458c13f18385b7bc5069a6d7b1=
76e"
> +LICENSE =3D "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-C=
lause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6b015e4f388d6e78adb1b1f9a887=
d06"
> =C2=A0
> =C2=A0DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-native"
> =C2=A0
> -SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=3Dstable-2.0;p=
rotocol=3Dhttps \
> +SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=3Dstable-2.1;p=
rotocol=3Dhttps \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/run-ptest=C2=A0\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-tests-do-not-run-test-applications-from-.libs.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-Make-manpages-multilib-identical.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-tests-do-not-run-some-tests.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-tests-do-not-run-test-applications-in-.libs.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> -SRCREV =3D "0a6632f77801f3218a288604c646f8a39cb0d2c4"
> +SRCREV =3D "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
> =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>2(\.\d+)+)$"
> =C2=A0
> =C2=A0S =3D "${WORKDIR}/git"
> @@ -33,6 +34,14 @@ LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'ld-is-lld ptest', '-fuse-ld
> =C2=A0# coreutils since we need full mktemp
> =C2=A0RDEPENDS:${PN}-ptest +=3D "bash gawk python3 make grep coreutils fi=
ndutils"
> =C2=A0
> +do_configure:append() {
> +=C2=A0=C2=A0=C2=A0 # when doing cross compile, the path ${B}/src/plugins=
/ctf/common/src/metadata/tsdl
> +=C2=A0=C2=A0=C2=A0 # is not created by the babeltrace2 build system. It =
is need when generating
> +=C2=A0=C2=A0=C2=A0 # parser.cpp by executing /bin/bash ../../git/config/=
ylwrap.
> +=C2=A0=C2=A0=C2=A0 # So make this directory after configuration.
> +=C2=A0=C2=A0=C2=A0 mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsd=
l
> +}
> +
> =C2=A0do_compile_ptest () {
> =C2=A0=C2=A0=C2=A0=C2=A0 make -C tests all
> =C2=A0}
> @@ -51,6 +60,10 @@ do_install_ptest () {
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 -exec install -t "${D}${PTEST_PATH}/tests=
/$d" {} \;
> =C2=A0	find "${S}/tests/$d" -maxdepth 1 -name *.expect \
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 -exec install -t "${D}${PTEST_PATH}/tests=
/$d" {} \;
> +	find "${S}/tests/$d" -maxdepth 1 -name *.ref \
> +	=C2=A0=C2=A0=C2=A0=C2=A0 -exec install -t "${D}${PTEST_PATH}/tests/$d" =
{} \;
> +	find "${S}/tests/$d" -maxdepth 1 -name *.mctf \
> +	=C2=A0=C2=A0=C2=A0=C2=A0 -exec install -t "${D}${PTEST_PATH}/tests/$d" =
{} \;
> =C2=A0=C2=A0=C2=A0=C2=A0 done

This needs explaining in the commit message.

> =C2=A0=C2=A0=C2=A0=C2=A0 install -d "${D}${PTEST_PATH}/tests/data/ctf-tra=
ces/"
> =C2=A0=C2=A0=C2=A0=C2=A0 cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_P=
ATH}/tests/data/ctf-traces/
> @@ -93,3 +106,5 @@ do_install_ptest () {
> =C2=A0=C2=A0=C2=A0=C2=A0 # Remove architechture specific testfiles
> =C2=A0=C2=A0=C2=A0=C2=A0 rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.=
lttng-utils.debug-info/*
> =C2=A0}
> +
> +INSANE_SKIP:${PN}-ptest +=3D "buildpaths"

If this is required, this will break reproducibility. I'm not merging
any patch which sets this, the data in the package needs fixing.

Cheers,

Richard



