Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 74F2F77170
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:13 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id a7-v6so2117098plp.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mP+0D2hQU+w2XvoybBn+pdP0uKdlWftPqNAVubKJ9Cw=;
	b=a0WCPBaVh9GaQEj6Dt0VSE6eVOSkheru2UAe5hVN705xZ11IIj3PuCx82GQMsR8qbs
	8/SUobgQNXcOrQ0Vn5EVMXevGF9w/hb0ejUDPyRbXJp9GvTRDcl6bACcztm7P73GcU+n
	QOA3LWPrqb9Ip2lbcX/9St6eS2lyDcj5ibDy+jMa0h9uhmppOFMdbt2PgOmC1TeyYHHI
	XeceBbiuiH+tC8EKXIPckqdyzdaN6LkohC2TKQ89xJwg52jyUvohcFLIuMy6NoA2EjwG
	z/BocjdfCkvHNCfIbkuUeApj45umxTNNmaOyKaNxi1VAFc7dp0qfZe7JCL9G39xHajdn
	oToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mP+0D2hQU+w2XvoybBn+pdP0uKdlWftPqNAVubKJ9Cw=;
	b=YOlRoOOcy6aBn7ba5OCW5fX4ESFfWGblp9v90LA5m/V/P4M/oPI87grjEaTUN93gOs
	MDaCoPSv8NFkJsho1UqgthsiujnPj2CMMIbdlK6NnngeYaz/QEJnfZj5QJqoHMYkb9nr
	YaesfD4ScCgedaPyTTi9mQalWJUcaqmGLWKf8xBpoOF7RFk09Ty5q/rGDwydgmsh9SPo
	BdEnBnpSS/9NMCBNUcUz4YCfUmRSz7OuXkwU0nx8BHLCA4ZBQ0Uz7yEQ7968n3EZOn+7
	pGhAxzl0hS5tQjYaxFq4mY+VflNkqOCemy2DumN+3+m42VbEV8Pp3NqDosX6V8RUOx00
	rEHg==
X-Gm-Message-State: APt69E0AdOYlQoQzte5zed5UP8SvIsgaTJzvvv9odr7RDajpUv+yiJ9X
	/9Q+X4/4THFRf4sfcF34oYv6aQ==
X-Google-Smtp-Source: ADUXVKI2OOpXUPzrhfXjPljDM1yQw24zdZn+WCov29/xBnKly78OfxX8yQn3AYBMTAdI8JLYH7RhyA==
X-Received: by 2002:a17:902:a703:: with SMTP id
	w3-v6mr4990443plq.111.1528321033938; 
	Wed, 06 Jun 2018 14:37:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	j19-v6sm8003772pfi.84.2018.06.06.14.37.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:14 -0700
Message-Id: <cover.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH V2 00/12] Add GCC 8 recipes
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:13 -0000

This changeset is including the review feedback from last patchset

- Fixes ppc such that we dont have to change machine options so it remains backward compatible and folks can still use gcc7
- Tweaks arm tunes to set -mtune instead of -mcpu, this avoids conflicts between -march/-mcpu
- Removes workarounds to avoid these conflicts in valgrind
- Add mips 74kc tune files
- Linux yocto changes are also part of Bruce's kernel updates but this makes it complete until those changes are pulled in

The following changes since commit cd195bdf5dd2c8ff03c58a63dcabe88b142d2a9c:

  oe-pkgdata-util: package-info: Re-add support for the --extra option (2018-06-04 15:14:43 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-8
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8

Khem Raj (12):
  tune/arm: Set -mtune instead of -mcpu
  valgrind: Remove code to remove -mcpu option on arm
  tune-mips-74k.inc: add tune file for 74kc mips
  gcc-8: Add recipes for 8.1 release
  gcc-8: Disable libssp for non mingw targets
  gcc-8: Disable float128 for ppc/musl
  gcc-8: Enabled mspe options for rs6000 ppc backend
  tcmode-default: Switch to gcc 8.0
  linux-yocto: Fix build with gcc8 for ppc
  linux-yocto: Fix mips build with gcc8
  linux-yocto: Fix mips64 build with gcc8
  linux-yocto: Fix GCC 8 -Wrestrict error

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../machine/include/mips/tune-mips-74k.inc    |  37 +++
 .../conf/machine/include/tune-arm1136jf-s.inc |   2 +-
 meta/conf/machine/include/tune-arm920t.inc    |   2 +-
 meta/conf/machine/include/tune-arm926ejs.inc  |   2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc   |   2 +-
 meta/conf/machine/include/tune-cortexa15.inc  |   2 +-
 meta/conf/machine/include/tune-cortexa17.inc  |   2 +-
 meta/conf/machine/include/tune-cortexa5.inc   |   2 +-
 meta/conf/machine/include/tune-cortexa7.inc   |   2 +-
 meta/conf/machine/include/tune-cortexa8.inc   |   2 +-
 meta/conf/machine/include/tune-cortexa9.inc   |   2 +-
 meta/conf/machine/include/tune-ep9312.inc     |   2 +-
 meta/conf/machine/include/tune-iwmmxt.inc     |   2 +-
 .../machine/include/tune-strongarm1100.inc    |   2 +-
 meta/conf/machine/include/tune-thunderx.inc   |   2 +-
 meta/conf/machine/include/tune-xscale.inc     |   2 +-
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
 meta/recipes-devtools/gcc/gcc-runtime_8.1.bb  |   7 +
 .../gcc/gcc-sanitizers_8.1.bb                 |   2 +
 meta/recipes-devtools/gcc/gcc-source_8.1.bb   |   4 +
 meta/recipes-devtools/gcc/gcc_8.1.bb          |  10 +
 .../gcc/libgcc-initial_8.1.bb                 |   2 +
 meta/recipes-devtools/gcc/libgcc_8.1.bb       |   2 +
 meta/recipes-devtools/gcc/libgfortran_8.1.bb  |   3 +
 .../valgrind/valgrind_3.13.0.bb               |  11 -
 ...ips-Disable-attribute-alias-warnings.patch |  43 +++
 ...ps64-Disable-attribute-alias-warning.patch |  26 ++
 ...jtool-perf-Fix-GCC-8-Wrestrict-error.patch |  51 ++++
 ...e-attribute-alias-warnings-from-gcc8.patch |  31 +++
 ...d-pager.c-do-not-alias-select-params.patch |  43 +++
 ...isable-array-bounds-warning-with-gcc.patch |  28 ++
 meta/recipes-kernel/linux/linux-yocto_4.15.bb |   8 +
 79 files changed, 3648 insertions(+), 28 deletions(-)
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
 create mode 100644 meta/recipes-kernel/linux/files/0001-mips-Disable-attribute-alias-warnings.patch
 create mode 100644 meta/recipes-kernel/linux/files/0001-mips64-Disable-attribute-alias-warning.patch
 create mode 100644 meta/recipes-kernel/linux/files/0001-objtool-perf-Fix-GCC-8-Wrestrict-error.patch
 create mode 100644 meta/recipes-kernel/linux/files/0001-powerpc-Disable-attribute-alias-warnings-from-gcc8.patch
 create mode 100644 meta/recipes-kernel/linux/files/0001-tools-lib-subcmd-pager.c-do-not-alias-select-params.patch
 create mode 100644 meta/recipes-kernel/linux/files/0002-powerpc-ptrace-Disable-array-bounds-warning-with-gcc.patch

-- 
2.17.1


