Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8797382F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 05:34:17 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so108270902igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VfOWf6a+yq24CIMjW7fTcEAqyMHjpGM1dHv8H7Un1gk=;
	b=MKl1StoOQBxPBBD0tUNpMchM5tEjMBEvrYk//+YpS/H2S/YUMUyCLCS4319En0IsQX
	wbAp0Nf55qBFKoKsjn3vV7sw334RVfMnBYevTpwxLqCilCPc4LW/fJEZueOGsmYW1U0j
	faK4ZGbwJHMFIRMBr9mKgLIANsM0EwinYPD2/wlnI26vaIvA4RySk//r98hNby096csC
	TONdYlI9LnUFagboRRX7w8XtpDGJeWdOdtjRZRsRGYpxaX1cLaILvPAnqbOnV8/Mlw8t
	phTC0tZoTg568m3xIsUMcmPEvcO7kUa/+NTulDiIwLz+/ONYOWAkD6aXINYyAyVMo8V/
	DFtw==
X-Received: by 10.43.66.131 with SMTP id xq3mr1632630icb.9.1430285658934;
	Tue, 28 Apr 2015 22:34:18 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by mx.google.com with ESMTPSA id
	w33sm16192737ioi.17.2015.04.28.22.34.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Apr 2015 22:34:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 22:34:12 -0700
Message-Id: <cover.1430285475.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] gcc-5 and fixes for curl and non-glibc C libraries
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
X-List-Received-Date: Wed, 29 Apr 2015 05:34:19 -0000

Add recipes for gcc-5, its not default _yet_
enable it in local.conf as described in patch header to use it
Fix curl build on 32bit arches with largefile support
Let glibc provide nativesdk versions for musl and uclibc bases systems

The following changes since commit 4dd4b96b6d60246338bb30ede9f3ab1b2e757be9:

  libxfont: Security Advisory - libxfont - CVE-2015-1804 (2015-04-28 07:56:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/for-master
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/for-master

Khem Raj (3):
  gcc: Add 5 recipes
  curl: Fix wrong assumption about sizeof off_t on largefile systems
  glibc: ignore for musl/uclibc but only for target recipes

 meta/recipes-core/glibc/glibc-collateral.inc       |    3 +
 meta/recipes-core/glibc/glibc_2.21.bb              |    9 +-
 meta/recipes-devtools/gcc/gcc-5.1.inc              |  123 +
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
 .../recipes-devtools/gcc/gcc-cross-canadian_5.1.bb |    5 +
 meta/recipes-devtools/gcc/gcc-cross-initial_5.1.bb |    2 +
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
 meta/recipes-support/curl/curl_7.42.0.bb           |    4 +
 51 files changed, 6053 insertions(+), 6 deletions(-)
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

-- 
2.1.4


