Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D9A7F77B8B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:15 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u62so18367313pgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=a3RWrlRv2e1ildqndzhFKqFdPeWVke2vj9+3CSlRgA8=;
	b=nhwXjUJqw+b3DDjK2CJoo8ZoZbCysjNmNnIUA2Xa8DNOdqISMT/EXPy29+OeZFc7cR
	2J/w1YQxXO4PV0kO6X+O9D9rcZT9ipYDUR4tHVFd1o6KbXe5WcMzioaneSX7wbtbQwlW
	kAjjS0LlQ1KJ7+mKD0paVoG+WbAlqU8fS1ISiqm4/dq+/0dVgKDTxcP08cy8jeaJgtNh
	eAczAuKkWcRvT1vIodcR+c8EdNLW8fL+S3wM6pMqs7JbjZzVC+Ud+FENXDNC4hQCf/ZQ
	PCPo6iS7kgWrA3dvkOOGTmH1DOJ/aAhCcWyKkF7OLLqc6ca/UthTmVad5ctJqM/O66Lj
	VMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a3RWrlRv2e1ildqndzhFKqFdPeWVke2vj9+3CSlRgA8=;
	b=tN831mTbrswB9komI9Tr8QdcpnP9Xt6u5i/GRNOylmRu2XudDhCGT3Wh22qz/ElcHj
	fswNkDe75/iynFtlHnjHt3TSh4877kfu959VTLYJ+8HxJKsyTubDFbC5sJyaGHuDkdtQ
	zi9CwK/40Biiz7nTiCF3+f4KDbcaOgcU+VzGKNU2T3Xxph4ZngPjn+sr+mhaLNttIvPu
	5EazCrWJnuNJwDI6MvVxsFp3Bvb0kTwx+LQ+l1gtku1XTOXMIi9Yr2oDGL0Pkk0FZ+Mf
	gs3gVEo2MDX3dtZOWINFpmgFvDPDspM4FJgtlRz+zfly+UWHpDYs1/Us/LJkLPLb5KnS
	LwSA==
X-Gm-Message-State: AIVw111dgiotx/zt2xacDJWKKBiiLq3KosGcvuO1epafI2nlKU8kBqFD
	C0ifJk5G2OVUYqQs
X-Received: by 10.99.125.20 with SMTP id y20mr1026944pgc.259.1498918995997;
	Sat, 01 Jul 2017 07:23:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	y28sm23636594pfd.32.2017.07.01.07.23.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:04 -0700
Message-Id: <cover.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH 00/19] Rework GCC PIE and security flags (take 3)
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:16 -0000

* This patchset add a switch to configure gcc driver with PIE defaults
* Add support for generating static PIE in gcc
* Gets rid of lot of bandaids from distro security flags file
* Adjust recipes for new way of specifying pie

v1->v2:

* apply linking spec changes libssp_nonshared.a to musl alone
* icu/iptable/gstreamer1.0-plugins-bad fixes are done on top not really depend on pie rework

v2->v3:

* Add glibc 2.25.90 upgrade patches to this pull request as it has few depending gcc patches with hardening
* Fixes for recipes to build against glibc 2.26
* Add fixes to sysklogd
* Dont compile sysklogd with PIE

The following changes since commit de7914954571ea8e717f56b6d6df13157b0973bc:

  scripts/contrib/patchreview: add new script (2017-06-29 13:01:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/hardening-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/hardening-fixes

Khem Raj (19):
  glibc: Upgrade to 2.25.90
  glibc: Drop obsoleted bits/string.h from multilibbing
  glibc: Enable obsoleted nsl
  gcc: Introduce a knob to configure gcc to default to PIE
  security_flags.inc: Delete pinnings for SECURITY_NO_PIE_CFLAGS
  distutils,setuptools: Delete use of SECURITY_NO_PIE_CFLAGS
  gcc7: Enable static PIE
  gcc: Link libssp_nonshared.a only on musl targets
  sysklogd: Improve build and fix runtime crash
  libunwind: We set -fPIE in security flags now if gcc is not configured
    for default PIE
  valgrind: Remove -no-pie from cflags
  icu: Fix build with glibc 2.26
  gstreamer1.0-plugins-bad: Fix missing library with bcm egl
  gcc-sanitizer: Fix build with glibc 2.26
  gcc: Use ucontext_t instead of ucontext
  valgrind: Fix build with glibc 2.26
  strace: upgrade to 4.17
  qemu: Replace use of struct ucontext with ucontext_t
  epiphany: Fix build errors when compiling with security flags

 meta/classes/distutils-common-base.bbclass         |   2 -
 meta/classes/setuptools.bbclass                    |   2 -
 meta/conf/distro/include/security_flags.inc        |  85 ++-----
 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 ...e_2.25.bb => cross-localedef-native_2.25.90.bb} |  27 ++-
 ...bc-initial_2.25.bb => glibc-initial_2.25.90.bb} |   0
 ...libc-locale_2.25.bb => glibc-locale_2.25.90.bb} |   0
 ...libc-mtrace_2.25.bb => glibc-mtrace_2.25.90.bb} |   0
 meta/recipes-core/glibc/glibc-package.inc          |   2 +-
 ...bc-scripts_2.25.bb => glibc-scripts_2.25.90.bb} |   0
 ...libc-Look-for-host-system-ld.so.cache-as-.patch |   6 +-
 ...libc-Fix-buffer-overrun-with-a-relocated-.patch |   6 +-
 ...libc-Raise-the-size-of-arrays-containing-.patch |  34 +--
 ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch |  11 +-
 ...500-e5500-e6500-603e-fsqrt-implementation.patch |  42 ++--
 ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |   6 +-
 ...-Fix-undefined-reference-to-__sqrt_finite.patch |  28 +--
 ...qrt-f-are-now-inline-functions-and-call-o.patch |  28 +--
 ...bug-1443-which-explains-what-the-patch-do.patch |   8 +-
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |   6 +-
 ...qrt-f-are-now-inline-functions-and-call-o.patch |   8 +-
 ...ersion-output-matching-grok-gold-s-output.patch |  44 ----
 ...configure.ac-handle-correctly-libc_cv_ro.patch} |  10 +-
 ...ibute.patch => 0013-Add-unused-attribute.patch} |   8 +-
 ...hin-the-path-sets-wrong-config-variables.patch} |  30 +--
 ...timezone-re-written-tzselect-as-posix-sh.patch} |  12 +-
 ...ove-bash-dependency-for-nscd-init-script.patch} |  11 +-
 ...-Cross-building-and-testing-instructions.patch} |  10 +-
 ...18-eglibc-Help-bootstrap-cross-toolchain.patch} |  10 +-
 ... 0019-eglibc-Clear-cache-lines-on-ppc8xx.patch} |  10 +-
 ...020-eglibc-Resolve-__fpscr_values-on-SH4.patch} |  10 +-
 ...atch => 0021-eglibc-Install-PIC-archives.patch} |  20 +-
 ...ard-port-cross-locale-generation-support.patch} |  36 +--
 ...023-Define-DUMMY_LOCALE_T-if-not-defined.patch} |   8 +-
 ...m.patch => 0024-local-dynamic-resolvconf.patch} |  57 +++--
 ...c-Make-_dl_build_local_scope-breadth-fir.patch} |   8 +-
 ...locale-fix-hard-coded-reference-to-gcc-E.patch} |  10 +-
 .../glibc/{glibc_2.25.bb => glibc_2.25.90.bb}      |  37 +--
 meta/recipes-devtools/gcc/gcc-7.1.inc              |   5 +-
 ...shared-to-link-commandline-for-musl-targe.patch |  42 ++++
 .../gcc/gcc-7.1/0040-ssp_nonshared.patch           |  28 ---
 .../gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch   |  37 +++
 ...r-Use-stack_t-instead-of-struct-sigaltsta.patch | 160 +++++++++++++
 ...0-replace-struct-ucontext-with-ucontext_t.patch | 149 ++++++++++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +
 ...lace-struct-ucontext-with-ucontext_t-type.patch | 265 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.8.1.1.bb         |  46 ++--
 ...8-replace-struct-ucontext-with-ucontext_t.patch |  31 +++
 .../strace/strace/Makefile-ptest.patch             |  19 +-
 .../strace/{strace_4.16.bb => strace_4.17.bb}      |   5 +-
 ...sts-Use-ucontext_t-instead-of-struct-ucon.patch |  30 +++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +-
 ...s-that-causes-a-segmentation-fault-under-.patch |  28 +++
 ...way-for-respecting-flags-from-environment.patch |  35 +++
 meta/recipes-extended/sysklogd/sysklogd.inc        |   6 +-
 meta/recipes-gnome/epiphany/epiphany_3.24.2.bb     |   6 +-
 ...bookmarks-Check-for-return-value-of-fread.patch |  32 +++
 .../link-with-libvchostif.patch                    |  35 +++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 .../icu/icu/0001-i18n-Drop-include-xlocale.h.patch |  31 +++
 meta/recipes-support/icu/icu_58.2.bb               |   3 +-
 meta/recipes-support/libunwind/libunwind_1.2.bb    |   4 -
 62 files changed, 1209 insertions(+), 429 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.25.bb => cross-localedef-native_2.25.90.bb} (61%)
 rename meta/recipes-core/glibc/{glibc-initial_2.25.bb => glibc-initial_2.25.90.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.25.bb => glibc-locale_2.25.90.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.25.bb => glibc-mtrace_2.25.90.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.25.bb => glibc-scripts_2.25.90.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
 rename meta/recipes-core/glibc/glibc/{0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch => 0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch} (82%)
 rename meta/recipes-core/glibc/glibc/{0014-Add-unused-attribute.patch => 0013-Add-unused-attribute.patch} (82%)
 rename meta/recipes-core/glibc/glibc/{0015-yes-within-the-path-sets-wrong-config-variables.patch => 0014-yes-within-the-path-sets-wrong-config-variables.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0016-timezone-re-written-tzselect-as-posix-sh.patch => 0015-timezone-re-written-tzselect-as-posix-sh.patch} (81%)
 rename meta/recipes-core/glibc/glibc/{0017-Remove-bash-dependency-for-nscd-init-script.patch => 0016-Remove-bash-dependency-for-nscd-init-script.patch} (89%)
 rename meta/recipes-core/glibc/glibc/{0018-eglibc-Cross-building-and-testing-instructions.patch => 0017-eglibc-Cross-building-and-testing-instructions.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0019-eglibc-Help-bootstrap-cross-toolchain.patch => 0018-eglibc-Help-bootstrap-cross-toolchain.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0021-eglibc-Clear-cache-lines-on-ppc8xx.patch => 0019-eglibc-Clear-cache-lines-on-ppc8xx.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0022-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0020-eglibc-Resolve-__fpscr_values-on-SH4.patch} (88%)
 rename meta/recipes-core/glibc/glibc/{0023-eglibc-Install-PIC-archives.patch => 0021-eglibc-Install-PIC-archives.patch} (90%)
 rename meta/recipes-core/glibc/glibc/{0024-eglibc-Forward-port-cross-locale-generation-support.patch => 0022-eglibc-Forward-port-cross-locale-generation-support.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0025-Define-DUMMY_LOCALE_T-if-not-defined.patch => 0023-Define-DUMMY_LOCALE_T-if-not-defined.patch} (80%)
 rename meta/recipes-core/glibc/glibc/{0020-eglibc-cherry-picked-from.patch => 0024-local-dynamic-resolvconf.patch} (49%)
 rename meta/recipes-core/glibc/glibc/{0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch => 0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch} (89%)
 rename meta/recipes-core/glibc/glibc/{0027-locale-fix-hard-coded-reference-to-gcc-E.patch => 0026-locale-fix-hard-coded-reference-to-gcc-E.patch} (82%)
 rename meta/recipes-core/glibc/{glibc_2.25.bb => glibc_2.25.90.bb} (80%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0040-ssp_nonshared.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
 rename meta/recipes-devtools/strace/{strace_4.16.bb => strace_4.17.bb} (87%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-fix-problems-that-causes-a-segmentation-fault-under-.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/0002-Make-way-for-respecting-flags-from-environment.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch
 create mode 100644 meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch

-- 
2.13.2


