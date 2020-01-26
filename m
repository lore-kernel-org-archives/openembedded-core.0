Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB1297FEE8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:38 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id d5so2095704pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RMPiByNBGwRSwsExFdVQbxXWb4YfMmgkdlsQGigLMM4=;
	b=NO3kkLJmOzi1LLy/jveoL2L+ujSE91Q7eL3rpNnWn3YNVTFTDksIpNfIb0HLsL56Xe
	EJzF2OTR1JCb95IzSiRvJXt0aEoElzzNkvUMP4oAh9yiqtO+OHBYQzULfaLJeWhwyFBO
	cf02lzfDnW0oijZPK9xgG1DtIKV+FpsFi6nxg2g6JYNqM7vou6mJZqBj5ehRnT/r5guU
	V1iUtL0DzZnmmTNaWuMThudoDlsLzVf+6qss5aeGbDF18SPkRfI6Ahbv7tlEoakeXgrr
	hsLb07IuSs1ox7E/9ZkgvCX4ZeuxqhIj6CEhtEbslB0l66QxsX6fT/X/EeomHsUwEIWH
	nfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RMPiByNBGwRSwsExFdVQbxXWb4YfMmgkdlsQGigLMM4=;
	b=WxbVVoSnqR5QXEsoMO/wp2qlk9rg04z+uAz2MC+8p6mqsuW0gQ2gYLG/4T5nTiuRXU
	xiXBygXXRUOEsfAkTir+hJGegD5F8LwskImCdjTF4siwo98T79J94kTB06R7V1wgi2Od
	I9cL0DDyewWg0vifZK4quTzsK57wMnPU5b3Kdl/53z+rF/efjajIuijKtA8ybG1cin9O
	oH3miEQp26Xr7F3eYIbHVrhfNXnKriMl3WGRztBBhm/Zk48Rs4PBBX0aQ7pNXnOz4YHa
	3+X8YjPv1cXfty4A9xUlrEMfRA7uHeE8O3wyE/I2ssqbS4qQtx0qLfG3tdOzR+zoOgc3
	nh2A==
X-Gm-Message-State: APjAAAUc7sq/YF48R190DZgLQeiz8vCrxjjQwl6YwyQEO2QqD7TWr8mE
	PIcLs0Wuw2QhyyVOUU/njiacT8W1j+c=
X-Google-Smtp-Source: APXvYqx3+c3Yp2zjYZRIBW0vpGn5NEIM3g+zE64TxFcWDXkknZ8YerUsra1ra/nqu6PXYq897xjGag==
X-Received: by 2002:a17:90a:330f:: with SMTP id
	m15mr10498221pjb.24.1580066859270; 
	Sun, 26 Jan 2020 11:27:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u13sm12778031pjn.29.2020.01.26.11.27.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:39 -0800
Message-Id: <cover.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 00/13] glibc/musl/go updates
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:38 -0000
Content-Transfer-Encoding: 8bit

This patchet addresses few things together

* Glibc is updated to latest snapshot before 2.31 release
* Drop clang helping glibc fortify patch
* Drop ppc cacheline optimization patch from eglibc days
* Update musl to latest, add libucontext to help musl app world
* Support Go on RISCV, support is currently not upstream and enabled in
  meta-riscv but few pieces are needed in core to make it work
* Fix gcc10 found issues in ruby and fix nss build failure
* rv32 will now ask for 5.4 for minimum kernel starting glibc 2.31+

The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:

  bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/pu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/pu

Khem Raj (13):
  libucontext: Add recipe
  nss: Pass NSS_USE_ARM_HW_CRYPTO as define in CFLAGS
  ruby: Remove __has_include and __has_include_next from preprocessed
    header file
  perf: Pass LDSHARED and CCLD via EXTRA_OEMAKE
  Musl: Update to latest master
  glibc: Update to final 2.31 release
  glibc: Drop fortify refactoring patch
  gettext: Drop overloadable attibute for getcwd declaration
  riscv32: Bump oldest kernel to 5.4
  go.bbclass: Disable PIE on riscv
  go-dep: Fix bolt for riscv64
  Disable CGO on riscv64
  go: Disable PIE on RISCV

 meta/classes/go.bbclass                       |    3 +-
 meta/conf/bitbake.conf                        |    2 +-
 meta/conf/distro/include/maintainers.inc      |    1 +
 .../gettext/gettext-0.20.1/overloadable.patch |   22 -
 meta/recipes-core/gettext/gettext_0.20.1.bb   |    2 -
 .../glibc/cross-localedef-native_2.31.bb      |    9 +-
 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 ...dd-hardlink-resolver-from-util-linux.patch |    2 +-
 ...-fix-ups-hardlink-to-make-it-compile.patch |    2 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |    2 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |    2 +-
 ...Raise-the-size-of-arrays-containing-.patch |    2 +-
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |    2 +-
 ...Make-relocatable-install-for-locales.patch |    2 +-
 ...5500-e6500-603e-fsqrt-implementation.patch |    2 +-
 ...RE_KNOWN_INTERPRETER_NAMES-to-known-.patch |    2 +-
 ...undefined-reference-to-__sqrt_finite.patch |    2 +-
 ...-are-now-inline-functions-and-call-o.patch |    2 +-
 ...443-which-explains-what-the-patch-do.patch |    2 +-
 ...m-err-tab.pl-with-specific-dirs-in-S.patch |    2 +-
 ...-are-now-inline-functions-and-call-o.patch |    2 +-
 ...igure.ac-handle-correctly-libc_cv_ro.patch |    2 +-
 .../glibc/0016-Add-unused-attribute.patch     |    2 +-
 ...the-path-sets-wrong-config-variables.patch |    2 +-
 ...zone-re-written-tzselect-as-posix-sh.patch |    2 +-
 ...bash-dependency-for-nscd-init-script.patch |    2 +-
 ...ss-building-and-testing-instructions.patch |    2 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |    2 +-
 ...2-eglibc-Clear-cache-lines-on-ppc8xx.patch |   80 -
 ...glibc-Resolve-__fpscr_values-on-SH4.patch} |    2 +-
 ...ort-cross-locale-generation-support.patch} |    2 +-
 ...efine-DUMMY_LOCALE_T-if-not-defined.patch} |    2 +-
 ...archive-uses-a-hard-coded-locale-pa.patch} |    2 +-
 ...e-_dl_build_local_scope-breadth-fir.patch} |    2 +-
 ...t-no-lines-in-bison-generated-files.patch} |    2 +-
 ...028-inject-file-assembly-directives.patch} |    2 +-
 ...ybe-uninitialized-errors-with-Os-BZ.patch} |    2 +-
 .../0031-Refactor-FORTIFY-in-glibc.patch      | 2780 -----------------
 meta/recipes-core/glibc/glibc_2.31.bb         |   18 +-
 .../0001-pass-LDFLAGS-to-link-step.patch      |   31 +
 meta/recipes-core/musl/libucontext_git.bb     |   62 +
 meta/recipes-core/musl/musl_git.bb            |    2 +-
 ...bolt_riscv64-Add-support-for-riscv64.patch |   33 +
 meta/recipes-devtools/go/go-dep_0.5.4.bb      |    1 +
 meta/recipes-devtools/go/go_1.13.bb           |    6 +-
 .../ruby/ruby/remove_has_include_macros.patch |   26 +
 meta/recipes-devtools/ruby/ruby_2.6.5.bb      |    1 +
 meta/recipes-kernel/perf/perf.bb              |    2 +
 ...figure-option-to-disable-ARM-HW-cryp.patch |   25 +-
 49 files changed, 227 insertions(+), 2939 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.20.1/overloadable.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0022-eglibc-Clear-cache-lines-on-ppc8xx.patch
 rename meta/recipes-core/glibc/glibc/{0023-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0022-eglibc-Resolve-__fpscr_values-on-SH4.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0024-eglibc-Forward-port-cross-locale-generation-support.patch => 0023-eglibc-Forward-port-cross-locale-generation-support.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0025-Define-DUMMY_LOCALE_T-if-not-defined.patch => 0024-Define-DUMMY_LOCALE_T-if-not-defined.patch} (92%)
 rename meta/recipes-core/glibc/glibc/{0026-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch => 0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (97%)
 rename meta/recipes-core/glibc/glibc/{0027-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch => 0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch} (95%)
 rename meta/recipes-core/glibc/glibc/{0028-intl-Emit-no-lines-in-bison-generated-files.patch => 0027-intl-Emit-no-lines-in-bison-generated-files.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0029-inject-file-assembly-directives.patch => 0028-inject-file-assembly-directives.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch => 0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch} (96%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-Refactor-FORTIFY-in-glibc.patch
 create mode 100644 meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
 create mode 100644 meta/recipes-core/musl/libucontext_git.bb
 create mode 100644 meta/recipes-devtools/go/go-dep/0001-bolt_riscv64-Add-support-for-riscv64.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch

-- 
2.25.0


