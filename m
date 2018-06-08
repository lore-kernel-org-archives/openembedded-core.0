Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6787C74CCA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 07:28:11 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id q4-v6so4915302pgr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7OAyrLzMP6VwgzOh8MsjPgTJgKl4DFatc8s8ils9UlQ=;
	b=USSKTzky+ghPzUXZZDBvpZ+CCi9VCjTHznu2vZL9J7PtZ0/l0Ht7AI8A/zTY3z/zIX
	7RSyZqTQo9FWl1TrcOTYTmiQULea3OX6sGr5hNj4Tltn7VQXq6tPAUAgEXt9eol0EO9k
	oGfkXXrTwj1yJTQ2Eq8C9yjJZIK4vXGgg2nWB+iNAdf2JKZr0BoQ3WxrZE6YSFWNE0Uw
	IaRfyMwwku3UBGOcMpL5yGjtnay/bPSraeYoPCeNBNnqvJBenrivUR8NqfC6aGk2hlcJ
	ek4F5ZcbC9TstcbdIDeeIM96cNHUMbArqEspO3dpAm2D6aJbIsK01FQ+vEHlPdFG57jL
	WLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7OAyrLzMP6VwgzOh8MsjPgTJgKl4DFatc8s8ils9UlQ=;
	b=AOnHGTkEKqgX+t27PAS53U+kdZB1rN6OnOtyeFL2e0sxk8STzFrdxmDvJk8UuMEYQe
	fl+zmUgH7ZGRE264izZVBsEWB/nMM7jWLdNvpmglqSCQtiCCB5gNEKYVp3Dt29bZXD+V
	Q8eW136TOxDVF2yjgdgUxF+j37fHc95HOnKMtObLFp2jVg8FaLJm0r7y18t0WnOFkC4n
	x9ssDdx0uRr5Pi1/Um9y45jE+wO9FNTDtqUydmdu4SXYvyoVGJYvHwcBhbrlPuqttlp2
	4Q0oUFMOs9B1DS03U5ExckrR0N3AfLxjhQY2L9NKAj0kh7gMzES8Gh6TySyvssxVNIi+
	eoZw==
X-Gm-Message-State: APt69E2VPx+G0QupdJrIBrmpE5ZCs/Zx8ow2cj1wEJs2IzdpUcNLpe0A
	1QGm3lkE2TMbNG1Jpe5rhokqgA==
X-Google-Smtp-Source: ADUXVKKhxTzpUNIIusCbW0wnxJHAY4PfdI6rdM3P+MRUsflhINQ5TNy5JzD2R/zm6pDf6cyYHY9dfA==
X-Received: by 2002:a62:9c9c:: with SMTP id
	u28-v6mr4912471pfk.90.1528442891936; 
	Fri, 08 Jun 2018 00:28:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	b15-v6sm39930760pgu.54.2018.06.08.00.28.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 00:28:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 00:28:08 -0700
Message-Id: <cover.1528442551.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH V3 0/7] Add GCC 8 recipes
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
X-List-Received-Date: Fri, 08 Jun 2018 07:28:11 -0000

This changeset is including the review feedback from last patchset

V3:

- Drop wholesale change of ARM tune files
- Fix gcc/libatomic by disabling ifuncs for libatomic
  to avoid march/mtune incompatiblity on armv7+, (thanks Andre for working on it)
- Keep valgrind patches

V2:

- Fixes ppc such that we dont have to change machine options so it remains backward compatible and folks can still use gcc7
- Tweaks arm tunes to set -mtune instead of -mcpu, this avoids conflicts between -march/-mcpu
- Removes workarounds to avoid these conflicts in valgrind
- Add mips 74kc tune files
- Linux yocto changes are also part of Bruce's kernel updates but this makes it complete until those changes are pulled in

The following changes since commit 23f15c63777020f5d43b070a1eb2bcf246c19ff8:

  rpm: Fix patch to ensure variables aren't used uninitialised (2018-06-07 08:52:13 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-8
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8

Khem Raj (7):
  gcc-8: Add recipes for 8.1 release
  gcc-8: Disable libssp for non mingw targets
  gcc-8: Disable float128 for ppc/musl
  gcc-8: Enabled mspe options for rs6000 ppc backend
  gcc-runtime_8.1.bb: disable ifuncs in libatomic for arm arch
  tune-mips-74k.inc: add tune file for 74kc mips
  tcmode-default: Switch to gcc 8.0

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../machine/include/mips/tune-mips-74k.inc    |  37 +++
 meta/recipes-devtools/gcc/gcc-8.1.inc         | 127 +++++++++
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  42 +++
 .../gcc/gcc-8.1/0002-c99-snprintf.patch       |  28 ++
 .../0003-gcc-poison-system-directories.patch  | 192 +++++++++++++
 .../gcc-8.1/0004-gcc-poison-dir-extend.patch  |  39 +++
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 +++++
 .../gcc-8.1/0006-64-bit-multilib-hack.patch   |  85 ++++++
 .../gcc/gcc-8.1/0007-optional-libstdc.patch   | 125 +++++++++
 ...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 ++++
 .../gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch    |  38 +++
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 +++++++
 .../0011-fortran-cross-compile-hack.patch     |  46 ++++
 .../gcc/gcc-8.1/0012-cpp-honor-sysroot.patch  |  54 ++++
 .../0013-MIPS64-Default-to-N64-ABI.patch      |  57 ++++
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 234 ++++++++++++++++
 ...gcc-Fix-argument-list-too-long-error.patch |  40 +++
 .../gcc/gcc-8.1/0016-Disable-sdt.patch        | 113 ++++++++
 .../gcc/gcc-8.1/0017-libtool.patch            |  42 +++
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  43 +++
 ...-config-files-from-B-instead-of-usin.patch | 102 +++++++
 ...ir-from-.la-which-usually-points-to-.patch |  31 +++
 .../gcc/gcc-8.1/0021-export-CPP.patch         |  53 ++++
 ...ILIB_OSDIRNAMES-and-other-multilib-o.patch |  42 +++
 ...e-target-gcc-headers-can-be-included.patch |  98 +++++++
 ...ild-with-disable-dependency-tracking.patch |  54 ++++
 ...t-directory-during-relink-if-inst_pr.patch |  38 +++
 ...IR-replacement-instead-of-hardcoding.patch |  29 ++
 ...27-aarch64-Add-support-for-musl-ldso.patch |  28 ++
 ...-fix-libcc1-s-install-path-and-rpath.patch |  54 ++++
 ...le-sysroot-support-for-nativesdk-gcc.patch | 213 +++++++++++++++
 ...sroot-gcc-version-specific-dirs-with.patch | 102 +++++++
 ...ous-_FOR_BUILD-and-related-variables.patch | 137 ++++++++++
 ...032-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  28 ++
 ...d-to-link-commandline-for-musl-targe.patch |  87 ++++++
 ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 125 +++++++++
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 ++
 ...as-for-__cpu_indicator_init-instead-.patch |  86 ++++++
 .../0037-sync-gcc-stddef.h-with-musl.patch    |  91 ++++++
 ...-fault-in-precompiled-header-generat.patch |  60 ++++
 .../0039-Fix-for-testsuite-failure.patch      | 258 ++++++++++++++++++
 ...Re-introduce-spe-commandline-options.patch |  41 +++
 meta/recipes-devtools/gcc/gcc-common.inc      |   2 +-
 .../gcc/gcc-cross-canadian_8.1.bb             |   5 +
 .../gcc/gcc-cross-initial_8.1.bb              |   2 +
 meta/recipes-devtools/gcc/gcc-cross_8.1.bb    |   3 +
 .../gcc/gcc-crosssdk-initial_8.1.bb           |   3 +
 meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb |   2 +
 meta/recipes-devtools/gcc/gcc-runtime_8.1.bb  |  10 +
 .../gcc/gcc-sanitizers_8.1.bb                 |   2 +
 meta/recipes-devtools/gcc/gcc-source_8.1.bb   |   4 +
 meta/recipes-devtools/gcc/gcc_8.1.bb          |  10 +
 .../gcc/libgcc-initial_8.1.bb                 |   2 +
 meta/recipes-devtools/gcc/libgcc_8.1.bb       |   2 +
 meta/recipes-devtools/gcc/libgfortran_8.1.bb  |   3 +
 56 files changed, 3406 insertions(+), 2 deletions(-)
 create mode 100644 meta/conf/machine/include/mips/tune-mips-74k.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-source_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgfortran_8.1.bb

-- 
2.17.1


