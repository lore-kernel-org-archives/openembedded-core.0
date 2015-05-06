Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id AECC173EFD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 07:04:14 +0000 (UTC)
Received: by ieczm2 with SMTP id zm2so7115713iec.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UBb68uicYncmBI5U1qbxQw/NAFdpRXVNKPq1QV5BBGc=;
	b=WZuWxVTGcBqbuq+z1WwQcsSRhG2erensBiJy/Gx4x4998pZI8wehAeasivjP2i6oKw
	FgRMesxcXIYSZU6C/NCnTQqBovrzpfZgfPKf6/xU2MubhaPhUKCbnk/hRuujB6hYiLxO
	8obJ2onMomNdNCtxnM7pZezAhQObDfN5uNXhSHVEAiECKWo1oRgjWnbB8GW1YJEUSphh
	wIVEV4SyULjoBCK3O3WbVrQZBwes5jMCO6qzBTDa9XdmfcAdwr5lajDa+G/sStMOVx6n
	LqzFIYIOtzPLHjpVwUy6VYEjR54Ti3w3SEr1RtLoXOTBnjI0i7C5LGnhP3XnAa4E61J9
	ENIw==
X-Received: by 10.42.129.73 with SMTP id p9mr1168411ics.48.1430895855721;
	Wed, 06 May 2015 00:04:15 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id r39sm621832ioi.2.2015.05.06.00.04.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 May 2015 00:04:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 00:04:10 -0700
Message-Id: <cover.1430895556.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] gcc-5, aarch64 support for musl
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
X-List-Received-Date: Wed, 06 May 2015 07:04:15 -0000

This patchset adds gcc 5.1.0 recipes, additionally fixes
gcc configure defaults for cross building, fixes aarch64 multilib
case

Accomodate aach64 for musl and let glibc not build for non-glibc libcs

add patch to libart-lgpl to avoid configure time checks for datasizes

Khem Raj (6):
  glibc: ignore for musl/uclibc but only for target recipes
  gcc: Add 5 recipes
  insane: Support aarch64 on musl
  gcc-4.9,gcc-5: Use variable SYSTEMLIBS_DIR instead of hardcoding it
    for aarch64
  gcc-cross: Pass EXTRA_OECONF_GCC_FLOAT to configure
  libart-lgpl: Fix cross compiling

 meta/classes/insane.bbclass                        |    2 +
 meta/recipes-core/glibc/glibc-collateral.inc       |    3 +
 meta/recipes-core/glibc/glibc_2.21.bb              |    9 +-
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    1 +
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   24 +
 meta/recipes-devtools/gcc/gcc-5.1.inc              |  124 +
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   42 +
 .../gcc/gcc-5.1/0002-uclibc-conf.patch             |   53 +
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   87 +
 .../gcc/gcc-5.1/0004-uclibc-locale.patch           | 2862 ++++++++++++++++++++
 .../gcc/gcc-5.1/0005-uclibc-locale-no__x.patch     |  257 ++
 .../gcc/gcc-5.1/0006-uclibc-locale-wchar_fix.patch |   68 +
 .../gcc/gcc-5.1/0007-uclibc-locale-update.patch    |  542 ++++
 .../gcc/gcc-5.1/0008-missing-execinfo_h.patch      |   28 +
 .../gcc/gcc-5.1/0009-c99-snprintf.patch            |   28 +
 .../0010-gcc-poison-system-directories.patch       |  192 ++
 .../gcc/gcc-5.1/0011-gcc-poison-dir-extend.patch   |   39 +
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   73 +
 .../gcc/gcc-5.1/0013-64-bit-multilib-hack.patch    |   85 +
 .../gcc/gcc-5.1/0014-optional-libstdc.patch        |  101 +
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   59 +
 .../gcc/gcc-5.1/0016-COLLECT_GCC_OPTIONS.patch     |   38 +
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   96 +
 .../gcc-5.1/0018-fortran-cross-compile-hack.patch  |   46 +
 .../gcc/gcc-5.1/0019-libgcc-sjlj-check.patch       |   74 +
 .../gcc/gcc-5.1/0020-cpp-honor-sysroot.patch       |   54 +
 .../gcc-5.1/0021-MIPS64-Default-to-N64-ABI.patch   |   57 +
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  216 ++
 ...0023-gcc-Fix-argument-list-too-long-error.patch |   40 +
 .../gcc/gcc-5.1/0024-Disable-sdt.patch             |  113 +
 .../gcc/gcc-5.1/0025-libtool.patch                 |   42 +
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   43 +
 ...tilib-config-files-from-B-instead-of-usin.patch |  102 +
 ...-libdir-from-.la-which-usually-points-to-.patch |   31 +
 .../gcc/gcc-5.1/0029-export-CPP.patch              |   53 +
 ...AltiVec-generation-on-powepc-linux-target.patch |   44 +
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   42 +
 ...Ensure-target-gcc-headers-can-be-included.patch |   98 +
 ...-t-build-with-disable-dependency-tracking.patch |   54 +
 ...h-host-directory-during-relink-if-inst_pr.patch |   38 +
 ...-link-the-plugins-with-libgomp-explicitly.patch |   83 +
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   27 +
 .../recipes-devtools/gcc/gcc-cross-canadian_5.1.bb |    5 +
 meta/recipes-devtools/gcc/gcc-cross-initial_5.1.bb |    2 +
 meta/recipes-devtools/gcc/gcc-cross.inc            |    2 +
 meta/recipes-devtools/gcc/gcc-cross_5.1.bb         |    3 +
 .../gcc/gcc-crosssdk-initial_5.1.bb                |    3 +
 meta/recipes-devtools/gcc/gcc-crosssdk_5.1.bb      |    2 +
 meta/recipes-devtools/gcc/gcc-runtime_5.1.bb       |    7 +
 meta/recipes-devtools/gcc/gcc-sanitizers_5.1.bb    |    2 +
 meta/recipes-devtools/gcc/gcc-source_5.1.bb        |    2 +
 meta/recipes-devtools/gcc/gcc_5.1.bb               |    7 +
 meta/recipes-devtools/gcc/libgcc-initial_5.1.bb    |    2 +
 meta/recipes-devtools/gcc/libgcc_5.1.bb            |    2 +
 meta/recipes-devtools/gcc/libgfortran_5.1.bb       |    3 +
 .../libart_lgpl-2.3.21-crosscompile.patch          |   84 +
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     |   10 +-
 57 files changed, 6193 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0063-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0002-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0003-gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0004-uclibc-locale.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0005-uclibc-locale-no__x.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0006-uclibc-locale-wchar_fix.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0007-uclibc-locale-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0008-missing-execinfo_h.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0009-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0010-gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0011-gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0013-64-bit-multilib-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0014-optional-libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0016-COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0018-fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0019-libgcc-sjlj-check.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0020-cpp-honor-sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0021-MIPS64-Default-to-N64-ABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0023-gcc-Fix-argument-list-too-long-error.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0024-Disable-sdt.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0025-libtool.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0029-export-CPP.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0032-Ensure-target-gcc-headers-can-be-included.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-source_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgfortran_5.1.bb
 create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/libart_lgpl-2.3.21-crosscompile.patch

-- 
2.1.4


