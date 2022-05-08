Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Khem Raj" <raj.khem@gmail.com>
Subject: [PATCH] gcc: upgrade 11.3 -> 12.1
Date: Sat,  7 May 2022 17:38:20 -0700
Message-Id: <20220508003820.1120893-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>

Major gcc release with lot of changes [2]

- Add patch to re-shuffle include of sched.h to fix build on musl
- porting guide to gcc 12 [1]
- Fix version in maintainers entry

[1] https://gcc.gnu.org/gcc-12/porting_to.html
[2] https://gcc.gnu.org/gcc-12/changes.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |    2 +-
 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 .../gcc/{gcc-11.3.inc => gcc-12.1.inc}        |   83 +-
 ...ian_11.3.bb => gcc-cross-canadian_12.1.bb} |    0
 .../{gcc-cross_11.3.bb => gcc-cross_12.1.bb}  |    0
 ...-crosssdk_11.3.bb => gcc-crosssdk_12.1.bb} |    0
 meta/recipes-devtools/gcc/gcc-runtime.inc     |    2 +-
 ...cc-runtime_11.3.bb => gcc-runtime_12.1.bb} |    0
 ...itizers_11.3.bb => gcc-sanitizers_12.1.bb} |    0
 ...{gcc-source_11.3.bb => gcc-source_12.1.bb} |    0
 .../gcc/gcc/0001-CVE-2021-42574.patch         | 2282 -----------------
 .../gcc/gcc/0001-CVE-2021-46195.patch         |  128 -
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |   10 +-
 .../gcc/gcc/0002-CVE-2021-42574.patch         | 1765 -------------
 .../0002-gcc-poison-system-directories.patch  |   52 +-
 .../gcc/gcc/0003-64-bit-multilib-hack.patch   |   15 +-
 .../gcc/gcc/0003-CVE-2021-42574.patch         |  142 -
 .../gcc/gcc/0004-CVE-2021-42574.patch         |  573 -----
 ..._BUILD-in-a-couple-of-places-to-avo.patch} |   12 +-
 ...s.h-in-B-instead-of-S-and-t-oe-in-B.patch} |   16 +-
 ...oot.patch => 0006-cpp-honor-sysroot.patch} |   18 +-
 ...MIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} |  201 +-
 ...gcc-Fix-argument-list-too-long-error.patch |   42 -
 .../gcc/gcc/0008-libtool.patch                |    2 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |    6 +-
 ...-config-files-from-B-instead-of-usin.patch |   14 +-
 ...ir-from-.la-which-usually-points-to-.patch |    2 +-
 .../gcc/gcc/0012-export-CPP.patch             |   50 +
 ...-target-gcc-headers-can-be-included.patch} |   30 +-
 ...-directory-during-relink-if-inst_pr.patch} |    2 +-
 ...re-build-CPP-CPPFLAGS-is-used-for-bu.patch |  204 --
 ...fix-libcc1-s-install-path-and-rpath.patch} |   10 +-
 ...e-sysroot-support-for-nativesdk-gcc.patch} |   88 +-
 ...root-gcc-version-specific-dirs-with.patch} |   16 +-
 ...-to-link-commandline-for-musl-targe.patch} |   14 +-
 ...e-introduce-spe-commandline-options.patch} |    6 +-
 ...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   25 -
 ...s-for-__cpu_indicator_init-instead-.patch} |   28 +-
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   26 -
 ...-Do-not-use-__LINE__-for-maintainin.patch} |   72 +-
 ...gw32-Enable-operation_not_supported.patch} |    4 +-
 .../0022-sync-gcc-stddef.h-with-musl.patch    |   88 -
 ...mic-Do-not-enforce-march-on-aarch64.patch} |    4 +-
 ... 0024-Fix-install-path-of-linux64.h.patch} |    6 +-
 ...ched.h-include-ahead-of-user-headers.patch |   56 +
 ...ly-debug-prefix-maps-before-checksum.patch |  101 -
 .../gcc/{gcc_11.3.bb => gcc_12.1.bb}          |    0
 ...initial_11.3.bb => libgcc-initial_12.1.bb} |    0
 .../gcc/{libgcc_11.3.bb => libgcc_12.1.bb}    |    0
 ...ibgfortran_11.3.bb => libgfortran_12.1.bb} |    0
 50 files changed, 534 insertions(+), 5665 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-11.3.inc => gcc-12.1.inc} (51%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.3.bb => gcc-cross-canadian_12.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.3.bb => gcc-cross_12.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.3.bb => gcc-crosssdk_12.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.3.bb => gcc-runtime_12.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.3.bb => gcc-sanitizers_12.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.3.bb => gcc-source_12.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
 rename meta/recipes-devtools/gcc/gcc/{0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch => 0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch} (85%)
 rename meta/recipes-devtools/gcc/gcc/{0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch => 0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch} (88%)
 rename meta/recipes-devtools/gcc/gcc/{0005-cpp-honor-sysroot.patch => 0006-cpp-honor-sysroot.patch} (82%)
 rename meta/recipes-devtools/gcc/gcc/{0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch => 0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} (58%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch
 rename meta/recipes-devtools/gcc/gcc/{0012-Ensure-target-gcc-headers-can-be-included.patch => 0013-Ensure-target-gcc-headers-can-be-included.patch} (85%)
 rename meta/recipes-devtools/gcc/gcc/{0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch => 0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch} (93%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
 rename meta/recipes-devtools/gcc/gcc/{0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch => 0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch} (87%)
 rename meta/recipes-devtools/gcc/gcc/{0017-handle-sysroot-support-for-nativesdk-gcc.patch => 0016-handle-sysroot-support-for-nativesdk-gcc.patch} (90%)
 rename meta/recipes-devtools/gcc/gcc/{0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch => 0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (89%)
 rename meta/recipes-devtools/gcc/gcc/{0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch => 0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch} (89%)
 rename meta/recipes-devtools/gcc/gcc/{0023-Re-introduce-spe-commandline-options.patch => 0019-Re-introduce-spe-commandline-options.patch} (87%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 rename meta/recipes-devtools/gcc/gcc/{0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch => 0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch} (76%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
 rename meta/recipes-devtools/gcc/gcc/{0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch => 0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch} (75%)
 rename meta/recipes-devtools/gcc/gcc/{0026-mingw32-Enable-operation_not_supported.patch => 0022-mingw32-Enable-operation_not_supported.patch} (89%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.patch
 rename meta/recipes-devtools/gcc/gcc/{0027-libatomic-Do-not-enforce-march-on-aarch64.patch => 0023-libatomic-Do-not-enforce-march-on-aarch64.patch} (94%)
 rename meta/recipes-devtools/gcc/gcc/{0029-Fix-install-path-of-linux64.h.patch => 0024-Fix-install-path-of-linux64.h.patch} (85%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0025-Move-sched.h-include-ahead-of-user-headers.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
 rename meta/recipes-devtools/gcc/{gcc_11.3.bb => gcc_12.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.3.bb => libgcc-initial_12.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.3.bb => libgcc_12.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.3.bb => libgfortran_12.1.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d518bdd2adc..eaa8fed9b14 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -190,7 +190,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-11.3.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-12.1.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index e8ea7cc5462..9660f2804a7 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -16,7 +16,7 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "11.%"
+GCCVERSION ?= "12.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.38%"
 GDBVERSION ?= "11.%"
diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-12.1.inc
similarity index 51%
rename from meta/recipes-devtools/gcc/gcc-11.3.inc
rename to meta/recipes-devtools/gcc/gcc-12.1.inc
index b1ef9d25af9..c8c4ae93e16 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.1.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "11.3.0"
+PV = "12.1.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "11.3.0"
+BINV = "12.1.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -22,57 +22,52 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
     file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
 "
-
-#RELEASE ?= "5b2ac9b40c325e9209c0bd55955db84aad4a0cc5"
-#BASEURI ?= "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip"
-
-BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz \
-           "
-SRC_URI = "\
-           ${BASEURI} \
+# from git
+#RELEASE ?= "7092b7aea122a91824d048aeb23834cf1d19b1a1"
+#BASEURI ?= "https://repo.or.cz/official-gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=gcc-${PV}-${RELEASE}.tar.gz"
+#SOURCEDIR ?= "official-gcc-${@'${RELEASE}'[0:7]}"
+
+# from snapshot
+#RELEASE ?= "12.1.0-RC-20220429"
+#SOURCEDIR ?= "gcc-${RELEASE}"
+#BASEURI ?= "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
+
+# official release
+RELEASE ?= "${PV}"
+BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
+SOURCEDIR ?= "gcc-${PV}"
+
+SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
            file://0002-gcc-poison-system-directories.patch \
            file://0003-64-bit-multilib-hack.patch \
-           file://0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
-           file://0005-cpp-honor-sysroot.patch \
-           file://0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
-           file://0007-gcc-Fix-argument-list-too-long-error.patch \
+           file://0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch \
+           file://0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
+           file://0006-cpp-honor-sysroot.patch \
+           file://0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
            file://0008-libtool.patch \
            file://0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
            file://0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
            file://0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
-           file://0012-Ensure-target-gcc-headers-can-be-included.patch \
-           file://0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
-           file://0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
-           file://0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch \
-           file://0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
-           file://0017-handle-sysroot-support-for-nativesdk-gcc.patch \
-           file://0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
-           file://0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
-           file://0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
-           file://0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
-           file://0022-sync-gcc-stddef.h-with-musl.patch \
-           file://0023-Re-introduce-spe-commandline-options.patch \
-           file://0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
-           file://0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
-           file://0026-mingw32-Enable-operation_not_supported.patch \
-           file://0027-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
-           file://0029-Fix-install-path-of-linux64.h.patch \
-           \
-           file://0001-CVE-2021-42574.patch \
-           file://0002-CVE-2021-42574.patch \
-           file://0003-CVE-2021-42574.patch \
-           file://0004-CVE-2021-42574.patch \
-           file://0001-CVE-2021-46195.patch \
+           file://0012-export-CPP.patch \
+           file://0013-Ensure-target-gcc-headers-can-be-included.patch \
+           file://0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
+           file://0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
+           file://0016-handle-sysroot-support-for-nativesdk-gcc.patch \
+           file://0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
+           file://0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
+           file://0019-Re-introduce-spe-commandline-options.patch \
+           file://0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
+           file://0022-mingw32-Enable-operation_not_supported.patch \
+           file://0023-libatomic-Do-not-enforce-march-on-aarch64.patch \
+           file://0024-Fix-install-path-of-linux64.h.patch \
+           file://0025-Move-sched.h-include-ahead-of-user-headers.patch \
 "
-SRC_URI[sha256sum] = "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39"
-
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+SRC_URI[sha256sum] = "62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b"
 
-# For dev release snapshotting
-#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
-#B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
+B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
 FORTRAN = ""
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.3.bb b/meta/recipes-devtools/gcc/gcc-cross_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_12.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_12.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index e9f2cf16e84..c39a0caf8a7 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -2,7 +2,7 @@ require gcc-configure-common.inc
 
 SUMMARY = "Runtime libraries from GCC"
 
-# Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPL-3.0-only"
+# Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
 # All gcc-runtime packages are now covered by the runtime exception.
 LICENSE = "GPL-3.0-with-GCC-exception"
 
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_12.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_12.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_11.3.bb b/meta/recipes-devtools/gcc/gcc-source_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_11.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_12.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
deleted file mode 100644
index 4d680ccc8f6..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
+++ /dev/null
@@ -1,2282 +0,0 @@
-From bd5e882cf6e0def3dd1bc106075d59a303fe0d1e Mon Sep 17 00:00:00 2001
-From: David Malcolm <dmalcolm@redhat.com>
-Date: Mon, 18 Oct 2021 18:55:31 -0400
-Subject: [PATCH] diagnostics: escape non-ASCII source bytes for certain
- diagnostics
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-This patch adds support to GCC's diagnostic subsystem for escaping certain
-bytes and Unicode characters when quoting source code.
-
-Specifically, this patch adds a new flag rich_location::m_escape_on_output
-which is a hint from a diagnostic that non-ASCII bytes in the pertinent
-lines of the user's source code should be escaped when printed.
-
-The patch sets this for the following diagnostics:
-- when complaining about stray bytes in the program (when these
-are non-printable)
-- when complaining about "null character(s) ignored");
-- for -Wnormalized= (and generate source ranges for such warnings)
-
-The escaping is controlled by a new option:
-  -fdiagnostics-escape-format=[unicode|bytes]
-
-For example, consider a diagnostic involing a source line containing the
-string "before" followed by the Unicode character U+03C0 ("GREEK SMALL
-LETTER PI", with UTF-8 encoding 0xCF 0x80) followed by the byte 0xBF
-(a stray UTF-8 trailing byte), followed by the string "after", where the
-diagnostic highlights the U+03C0 character.
-
-By default, this line will be printed verbatim to the user when
-reporting a diagnostic at it, as:
-
- beforeÏXafter
-       ^
-
-(using X for the stray byte to avoid putting invalid UTF-8 in this
-commit message)
-
-If the diagnostic sets the "escape" flag, it will be printed as:
-
- before<U+03C0><BF>after
-       ^~~~~~~~
-
-with -fdiagnostics-escape-format=unicode (the default), or as:
-
-  before<CF><80><BF>after
-        ^~~~~~~~
-
-if the user supplies -fdiagnostics-escape-format=bytes.
-
-This only affects how the source is printed; it does not affect
-how column numbers that are printed (as per -fdiagnostics-column-unit=
-and -fdiagnostics-column-origin=).
-
-gcc/c-family/ChangeLog:
-	* c-lex.c (c_lex_with_flags): When complaining about non-printable
-	CPP_OTHER tokens, set the "escape on output" flag.
-
-gcc/ChangeLog:
-	* common.opt (fdiagnostics-escape-format=): New.
-	(diagnostics_escape_format): New enum.
-	(DIAGNOSTICS_ESCAPE_FORMAT_UNICODE): New enum value.
-	(DIAGNOSTICS_ESCAPE_FORMAT_BYTES): Likewise.
-	* diagnostic-format-json.cc (json_end_diagnostic): Add
-	"escape-source" attribute.
-	* diagnostic-show-locus.c
-	(exploc_with_display_col::exploc_with_display_col): Replace
-	"tabstop" param with a cpp_char_column_policy and add an "aspect"
-	param.  Use these to compute m_display_col accordingly.
-	(struct char_display_policy): New struct.
-	(layout::m_policy): New field.
-	(layout::m_escape_on_output): New field.
-	(def_policy): New function.
-	(make_range): Update for changes to exploc_with_display_col ctor.
-	(default_print_decoded_ch): New.
-	(width_per_escaped_byte): New.
-	(escape_as_bytes_width): New.
-	(escape_as_bytes_print): New.
-	(escape_as_unicode_width): New.
-	(escape_as_unicode_print): New.
-	(make_policy): New.
-	(layout::layout): Initialize new fields.  Update m_exploc ctor
-	call for above change to ctor.
-	(layout::maybe_add_location_range): Update for changes to
-	exploc_with_display_col ctor.
-	(layout::calculate_x_offset_display): Update for change to
-	cpp_display_width.
-	(layout::print_source_line): Pass policy
-	to cpp_display_width_computation. Capture cpp_decoded_char when
-	calling process_next_codepoint.  Move printing of source code to
-	m_policy.m_print_cb.
-	(line_label::line_label): Pass in policy rather than context.
-	(layout::print_any_labels): Update for change to line_label ctor.
-	(get_affected_range): Pass in policy rather than context, updating
-	calls to location_compute_display_column accordingly.
-	(get_printed_columns): Likewise, also for cpp_display_width.
-	(correction::correction): Pass in policy rather than tabstop.
-	(correction::compute_display_cols): Pass m_policy rather than
-	m_tabstop to cpp_display_width.
-	(correction::m_tabstop): Replace with...
-	(correction::m_policy): ...this.
-	(line_corrections::line_corrections): Pass in policy rather than
-	context.
-	(line_corrections::m_context): Replace with...
-	(line_corrections::m_policy): ...this.
-	(line_corrections::add_hint): Update to use m_policy rather than
-	m_context.
-	(line_corrections::add_hint): Likewise.
-	(layout::print_trailing_fixits): Likewise.
-	(selftest::test_display_widths): New.
-	(selftest::test_layout_x_offset_display_utf8): Update to use
-	policy rather than tabstop.
-	(selftest::test_one_liner_labels_utf8): Add test of escaping
-	source lines.
-	(selftest::test_diagnostic_show_locus_one_liner_utf8): Update to
-	use policy rather than tabstop.
-	(selftest::test_overlapped_fixit_printing): Likewise.
-	(selftest::test_overlapped_fixit_printing_utf8): Likewise.
-	(selftest::test_overlapped_fixit_printing_2): Likewise.
-	(selftest::test_tab_expansion): Likewise.
-	(selftest::test_escaping_bytes_1): New.
-	(selftest::test_escaping_bytes_2): New.
-	(selftest::diagnostic_show_locus_c_tests): Call the new tests.
-	* diagnostic.c (diagnostic_initialize): Initialize
-	context->escape_format.
-	(convert_column_unit): Update to use default character width policy.
-	(selftest::test_diagnostic_get_location_text): Likewise.
-	* diagnostic.h (enum diagnostics_escape_format): New enum.
-	(diagnostic_context::escape_format): New field.
-	* doc/invoke.texi (-fdiagnostics-escape-format=): New option.
-	(-fdiagnostics-format=): Add "escape-source" attribute to examples
-	of JSON output, and document it.
-	* input.c (location_compute_display_column): Pass in "policy"
-	rather than "tabstop", passing to
-	cpp_byte_column_to_display_column.
-	(selftest::test_cpp_utf8): Update to use cpp_char_column_policy.
-	* input.h (class cpp_char_column_policy): New forward decl.
-	(location_compute_display_column): Pass in "policy" rather than
-	"tabstop".
-	* opts.c (common_handle_option): Handle
-	OPT_fdiagnostics_escape_format_.
-	* selftest.c (temp_source_file::temp_source_file): New ctor
-	overload taking a size_t.
-	* selftest.h (temp_source_file::temp_source_file): Likewise.
-
-gcc/testsuite/ChangeLog:
-	* c-c++-common/diagnostic-format-json-1.c: Add regexp to consume
-	"escape-source" attribute.
-	* c-c++-common/diagnostic-format-json-2.c: Likewise.
-	* c-c++-common/diagnostic-format-json-3.c: Likewise.
-	* c-c++-common/diagnostic-format-json-4.c: Likewise, twice.
-	* c-c++-common/diagnostic-format-json-5.c: Likewise.
-	* gcc.dg/cpp/warn-normalized-4-bytes.c: New test.
-	* gcc.dg/cpp/warn-normalized-4-unicode.c: New test.
-	* gcc.dg/encoding-issues-bytes.c: New test.
-	* gcc.dg/encoding-issues-unicode.c: New test.
-	* gfortran.dg/diagnostic-format-json-1.F90: Add regexp to consume
-	"escape-source" attribute.
-	* gfortran.dg/diagnostic-format-json-2.F90: Likewise.
-	* gfortran.dg/diagnostic-format-json-3.F90: Likewise.
-
-libcpp/ChangeLog:
-	* charset.c (convert_escape): Use encoding_rich_location when
-	complaining about nonprintable unknown escape sequences.
-	(cpp_display_width_computation::::cpp_display_width_computation):
-	Pass in policy rather than tabstop.
-	(cpp_display_width_computation::process_next_codepoint): Add "out"
-	param and populate *out if non-NULL.
-	(cpp_display_width_computation::advance_display_cols): Pass NULL
-	to process_next_codepoint.
-	(cpp_byte_column_to_display_column): Pass in policy rather than
-	tabstop.  Pass NULL to process_next_codepoint.
-	(cpp_display_column_to_byte_column): Pass in policy rather than
-	tabstop.
-	* errors.c (cpp_diagnostic_get_current_location): New function,
-	splitting out the logic from...
-	(cpp_diagnostic): ...here.
-	(cpp_warning_at): New function.
-	(cpp_pedwarning_at): New function.
-	* include/cpplib.h (cpp_warning_at): New decl for rich_location.
-	(cpp_pedwarning_at): Likewise.
-	(struct cpp_decoded_char): New.
-	(struct cpp_char_column_policy): New.
-	(cpp_display_width_computation::cpp_display_width_computation):
-	Replace "tabstop" param with "policy".
-	(cpp_display_width_computation::process_next_codepoint): Add "out"
-	param.
-	(cpp_display_width_computation::m_tabstop): Replace with...
-	(cpp_display_width_computation::m_policy): ...this.
-	(cpp_byte_column_to_display_column): Replace "tabstop" param with
-	"policy".
-	(cpp_display_width): Likewise.
-	(cpp_display_column_to_byte_column): Likewise.
-	* include/line-map.h (rich_location::escape_on_output_p): New.
-	(rich_location::set_escape_on_output): New.
-	(rich_location::m_escape_on_output): New.
-	* internal.h (cpp_diagnostic_get_current_location): New decl.
-	(class encoding_rich_location): New.
-	* lex.c (skip_whitespace): Use encoding_rich_location when
-	complaining about null characters.
-	(warn_about_normalization): Generate a source range when
-	complaining about improperly normalized tokens, rather than just a
-	point, and use encoding_rich_location so that the source code
-	is escaped on printing.
-	* line-map.c (rich_location::rich_location): Initialize
-	m_escape_on_output.
-
-Signed-off-by: David Malcolm <dmalcolm@redhat.com>
-
-CVE: CVE-2021-42574
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bd5e882cf6e0def3dd1bc106075d59a303fe0d1e]
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
-
----
- gcc/c-family/c-lex.c                          |   6 +-
- gcc/common.opt                                |  13 +
- gcc/diagnostic-format-json.cc                 |   3 +
- gcc/diagnostic-show-locus.c                   | 580 +++++++++++++++---
- gcc/diagnostic.c                              |  10 +-
- gcc/diagnostic.h                              |  18 +
- gcc/doc/invoke.texi                           |  43 +-
- gcc/input.c                                   |  62 +-
- gcc/input.h                                   |   7 +-
- gcc/opts.c                                    |   4 +
- gcc/selftest.c                                |  15 +
- gcc/selftest.h                                |   2 +
- .../c-c++-common/diagnostic-format-json-1.c   |   1 +
- .../c-c++-common/diagnostic-format-json-2.c   |   1 +
- .../c-c++-common/diagnostic-format-json-3.c   |   1 +
- .../c-c++-common/diagnostic-format-json-4.c   |   2 +
- .../c-c++-common/diagnostic-format-json-5.c   |   1 +
- .../gcc.dg/cpp/warn-normalized-4-bytes.c      |  21 +
- .../gcc.dg/cpp/warn-normalized-4-unicode.c    |  19 +
- gcc/testsuite/gcc.dg/encoding-issues-bytes.c  | Bin 0 -> 595 bytes
- .../gcc.dg/encoding-issues-unicode.c          | Bin 0 -> 613 bytes
- .../gfortran.dg/diagnostic-format-json-1.F90  |   1 +
- .../gfortran.dg/diagnostic-format-json-2.F90  |   1 +
- .../gfortran.dg/diagnostic-format-json-3.F90  |   1 +
- libcpp/charset.c                              |  63 +-
- libcpp/errors.c                               |  82 ++-
- libcpp/include/cpplib.h                       |  76 ++-
- libcpp/include/line-map.h                     |  13 +
- libcpp/internal.h                             |  23 +
- libcpp/lex.c                                  |  38 +-
- libcpp/line-map.c                             |   3 +-
- 31 files changed, 942 insertions(+), 168 deletions(-)
- create mode 100644 gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c
- create mode 100644 gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c
- create mode 100644 gcc/testsuite/gcc.dg/encoding-issues-bytes.c
- create mode 100644 gcc/testsuite/gcc.dg/encoding-issues-unicode.c
-
-diff --git a/gcc/c-family/c-lex.c b/gcc/c-family/c-lex.c
---- a/gcc/c-family/c-lex.c	2021-07-27 23:55:06.980283060 -0700
-+++ b/gcc/c-family/c-lex.c	2021-12-14 01:16:01.541943272 -0800
-@@ -603,7 +603,11 @@ c_lex_with_flags (tree *value, location_
- 	else if (ISGRAPH (c))
- 	  error_at (*loc, "stray %qc in program", (int) c);
- 	else
--	  error_at (*loc, "stray %<\\%o%> in program", (int) c);
-+	  {
-+	    rich_location rich_loc (line_table, *loc);
-+	    rich_loc.set_escape_on_output (true);
-+	    error_at (&rich_loc, "stray %<\\%o%> in program", (int) c);
-+	  }
-       }
-       goto retry;
- 
-diff --git a/gcc/common.opt b/gcc/common.opt
---- a/gcc/common.opt	2021-12-13 22:08:44.939137107 -0800
-+++ b/gcc/common.opt	2021-12-14 01:16:01.541943272 -0800
-@@ -1348,6 +1348,10 @@ fdiagnostics-format=
- Common Joined RejectNegative Enum(diagnostics_output_format)
- -fdiagnostics-format=[text|json]	Select output format.
- 
-+fdiagnostics-escape-format=
-+Common Joined RejectNegative Enum(diagnostics_escape_format)
-+-fdiagnostics-escape-format=[unicode|bytes]	Select how to escape non-printable-ASCII bytes in the source for diagnostics that suggest it.
-+
- ; Required for these enum values.
- SourceInclude
- diagnostic.h
-@@ -1362,6 +1366,15 @@ EnumValue
- Enum(diagnostics_column_unit) String(byte) Value(DIAGNOSTICS_COLUMN_UNIT_BYTE)
- 
- Enum
-+Name(diagnostics_escape_format) Type(int)
-+
-+EnumValue
-+Enum(diagnostics_escape_format) String(unicode) Value(DIAGNOSTICS_ESCAPE_FORMAT_UNICODE)
-+
-+EnumValue
-+Enum(diagnostics_escape_format) String(bytes) Value(DIAGNOSTICS_ESCAPE_FORMAT_BYTES)
-+
-+Enum
- Name(diagnostics_output_format) Type(int)
- 
- EnumValue
-diff --git a/gcc/diagnostic.c b/gcc/diagnostic.c
---- a/gcc/diagnostic.c	2021-07-27 23:55:07.232286576 -0700
-+++ b/gcc/diagnostic.c	2021-12-14 01:16:01.545943202 -0800
-@@ -230,6 +230,7 @@ diagnostic_initialize (diagnostic_contex
-   context->column_unit = DIAGNOSTICS_COLUMN_UNIT_DISPLAY;
-   context->column_origin = 1;
-   context->tabstop = 8;
-+  context->escape_format = DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
-   context->edit_context_ptr = NULL;
-   context->diagnostic_group_nesting_depth = 0;
-   context->diagnostic_group_emission_count = 0;
-@@ -382,7 +383,10 @@ convert_column_unit (enum diagnostics_co
-       gcc_unreachable ();
- 
-     case DIAGNOSTICS_COLUMN_UNIT_DISPLAY:
--      return location_compute_display_column (s, tabstop);
-+      {
-+	cpp_char_column_policy policy (tabstop, cpp_wcwidth);
-+	return location_compute_display_column (s, policy);
-+      }
- 
-     case DIAGNOSTICS_COLUMN_UNIT_BYTE:
-       return s.column;
-@@ -2275,8 +2279,8 @@ test_diagnostic_get_location_text ()
-     const char *const content = "smile \xf0\x9f\x98\x82\n";
-     const int line_bytes = strlen (content) - 1;
-     const int def_tabstop = 8;
--    const int display_width = cpp_display_width (content, line_bytes,
--						 def_tabstop);
-+    const cpp_char_column_policy policy (def_tabstop, cpp_wcwidth);
-+    const int display_width = cpp_display_width (content, line_bytes, policy);
-     ASSERT_EQ (line_bytes - 2, display_width);
-     temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
-     const char *const fname = tmp.get_filename ();
-diff --git a/gcc/diagnostic-format-json.cc b/gcc/diagnostic-format-json.cc
---- a/gcc/diagnostic-format-json.cc	2021-07-27 23:55:07.232286576 -0700
-+++ b/gcc/diagnostic-format-json.cc	2021-12-14 01:16:01.541943272 -0800
-@@ -264,6 +264,9 @@ json_end_diagnostic (diagnostic_context
-       json::value *path_value = context->make_json_for_path (context, path);
-       diag_obj->set ("path", path_value);
-     }
-+
-+  diag_obj->set ("escape-source",
-+		 new json::literal (richloc->escape_on_output_p ()));
- }
- 
- /* No-op implementation of "begin_group_cb" for JSON output.  */
-diff --git a/gcc/diagnostic.h b/gcc/diagnostic.h
---- a/gcc/diagnostic.h	2021-07-27 23:55:07.236286632 -0700
-+++ b/gcc/diagnostic.h	2021-12-14 01:16:01.545943202 -0800
-@@ -38,6 +38,20 @@ enum diagnostics_column_unit
-   DIAGNOSTICS_COLUMN_UNIT_BYTE
- };
- 
-+/* An enum for controlling how to print non-ASCII characters/bytes when
-+   a diagnostic suggests escaping the source code on output.  */
-+
-+enum diagnostics_escape_format
-+{
-+  /* Escape non-ASCII Unicode characters in the form <U+XXXX> and
-+     non-UTF-8 bytes in the form <XX>.  */
-+  DIAGNOSTICS_ESCAPE_FORMAT_UNICODE,
-+
-+  /* Escape non-ASCII bytes in the form <XX> (thus showing the underlying
-+     encoding of non-ASCII Unicode characters).  */
-+  DIAGNOSTICS_ESCAPE_FORMAT_BYTES
-+};
-+
- /* Enum for overriding the standard output format.  */
- 
- enum diagnostics_output_format
-@@ -320,6 +334,10 @@ struct diagnostic_context
-   /* The size of the tabstop for tab expansion.  */
-   int tabstop;
- 
-+  /* How should non-ASCII/non-printable bytes be escaped when
-+     a diagnostic suggests escaping the source code on output.  */
-+  enum diagnostics_escape_format escape_format;
-+
-   /* If non-NULL, an edit_context to which fix-it hints should be
-      applied, for generating patches.  */
-   edit_context *edit_context_ptr;
-diff --git a/gcc/diagnostic-show-locus.c b/gcc/diagnostic-show-locus.c
---- a/gcc/diagnostic-show-locus.c	2021-07-27 23:55:07.232286576 -0700
-+++ b/gcc/diagnostic-show-locus.c	2021-12-14 01:16:01.545943202 -0800
-@@ -175,10 +175,26 @@ enum column_unit {
- class exploc_with_display_col : public expanded_location
- {
-  public:
--  exploc_with_display_col (const expanded_location &exploc, int tabstop)
--    : expanded_location (exploc),
--      m_display_col (location_compute_display_column (exploc, tabstop))
--  {}
-+  exploc_with_display_col (const expanded_location &exploc,
-+			   const cpp_char_column_policy &policy,
-+			   enum location_aspect aspect)
-+  : expanded_location (exploc),
-+    m_display_col (location_compute_display_column (exploc, policy))
-+  {
-+    if (exploc.column > 0)
-+      {
-+	/* m_display_col is now the final column of the byte.
-+	   If escaping has happened, we may want the first column instead.  */
-+	if (aspect != LOCATION_ASPECT_FINISH)
-+	  {
-+	    expanded_location prev_exploc (exploc);
-+	    prev_exploc.column--;
-+	    int prev_display_col
-+	      = (location_compute_display_column (prev_exploc, policy));
-+	    m_display_col = prev_display_col + 1;
-+	  }
-+      }
-+  }
- 
-   int m_display_col;
- };
-@@ -313,6 +329,31 @@ test_line_span ()
- 
- #endif /* #if CHECKING_P */
- 
-+/* A bundle of information containing how to print unicode
-+   characters and bytes when quoting source code.
-+
-+   Provides a unified place to support escaping some subset
-+   of characters to some format.
-+
-+   Extends char_column_policy; printing is split out to avoid
-+   libcpp having to know about pretty_printer.  */
-+
-+struct char_display_policy : public cpp_char_column_policy
-+{
-+ public:
-+  char_display_policy (int tabstop,
-+		       int (*width_cb) (cppchar_t c),
-+		       void (*print_cb) (pretty_printer *pp,
-+					 const cpp_decoded_char &cp))
-+  : cpp_char_column_policy (tabstop, width_cb),
-+    m_print_cb (print_cb)
-+  {
-+  }
-+
-+  void (*m_print_cb) (pretty_printer *pp,
-+		      const cpp_decoded_char &cp);
-+};
-+
- /* A class to control the overall layout when printing a diagnostic.
- 
-    The layout is determined within the constructor.
-@@ -345,6 +386,8 @@ class layout
- 
-   void print_line (linenum_type row);
- 
-+  void on_bad_codepoint (const char *ptr, cppchar_t ch, size_t ch_sz);
-+
-  private:
-   bool will_show_line_p (linenum_type row) const;
-   void print_leading_fixits (linenum_type row);
-@@ -386,6 +429,7 @@ class layout
-  private:
-   diagnostic_context *m_context;
-   pretty_printer *m_pp;
-+  char_display_policy m_policy;
-   location_t m_primary_loc;
-   exploc_with_display_col m_exploc;
-   colorizer m_colorizer;
-@@ -398,6 +442,7 @@ class layout
-   auto_vec <line_span> m_line_spans;
-   int m_linenum_width;
-   int m_x_offset_display;
-+  bool m_escape_on_output;
- };
- 
- /* Implementation of "class colorizer".  */
-@@ -646,6 +691,11 @@ layout_range::intersects_line_p (linenum
- /* Default for when we don't care what the tab expansion is set to.  */
- static const int def_tabstop = 8;
- 
-+static cpp_char_column_policy def_policy ()
-+{
-+  return cpp_char_column_policy (8, cpp_wcwidth);
-+}
-+
- /* Create some expanded locations for testing layout_range.  The filename
-    member of the explocs is set to the empty string.  This member will only be
-    inspected by the calls to location_compute_display_column() made from the
-@@ -662,10 +712,13 @@ make_range (int start_line, int start_co
-     = {"", start_line, start_col, NULL, false};
-   const expanded_location finish_exploc
-     = {"", end_line, end_col, NULL, false};
--  return layout_range (exploc_with_display_col (start_exploc, def_tabstop),
--		       exploc_with_display_col (finish_exploc, def_tabstop),
-+  return layout_range (exploc_with_display_col (start_exploc, def_policy (),
-+						LOCATION_ASPECT_START),
-+		       exploc_with_display_col (finish_exploc, def_policy (),
-+						LOCATION_ASPECT_FINISH),
- 		       SHOW_RANGE_WITHOUT_CARET,
--		       exploc_with_display_col (start_exploc, def_tabstop),
-+		       exploc_with_display_col (start_exploc, def_policy (),
-+						LOCATION_ASPECT_CARET),
- 		       0, NULL);
- }
- 
-@@ -959,6 +1012,164 @@ fixit_cmp (const void *p_a, const void *
-   return hint_a->get_start_loc () - hint_b->get_start_loc ();
- }
- 
-+/* Callbacks for use when not escaping the source.  */
-+
-+/* The default callback for char_column_policy::m_width_cb is cpp_wcwidth.  */
-+
-+/* Callback for char_display_policy::m_print_cb for printing source chars
-+   when not escaping the source.  */
-+
-+static void
-+default_print_decoded_ch (pretty_printer *pp,
-+			  const cpp_decoded_char &decoded_ch)
-+{
-+  for (const char *ptr = decoded_ch.m_start_byte;
-+       ptr != decoded_ch.m_next_byte; ptr++)
-+    {
-+      if (*ptr == '\0' || *ptr == '\r')
-+	{
-+	  pp_space (pp);
-+	  continue;
-+	}
-+
-+      pp_character (pp, *ptr);
-+    }
-+}
-+
-+/* Callbacks for use with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
-+
-+static const int width_per_escaped_byte = 4;
-+
-+/* Callback for char_column_policy::m_width_cb for determining the
-+   display width when escaping with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
-+
-+static int
-+escape_as_bytes_width (cppchar_t ch)
-+{
-+  if (ch < 0x80 && ISPRINT (ch))
-+    return cpp_wcwidth (ch);
-+  else
-+    {
-+      if (ch <=   0x7F) return 1 * width_per_escaped_byte;
-+      if (ch <=  0x7FF) return 2 * width_per_escaped_byte;
-+      if (ch <= 0xFFFF) return 3 * width_per_escaped_byte;
-+      return 4 * width_per_escaped_byte;
-+    }
-+}
-+
-+/* Callback for char_display_policy::m_print_cb for printing source chars
-+   when escaping with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
-+
-+static void
-+escape_as_bytes_print (pretty_printer *pp,
-+		       const cpp_decoded_char &decoded_ch)
-+{
-+  if (!decoded_ch.m_valid_ch)
-+    {
-+      for (const char *iter = decoded_ch.m_start_byte;
-+	   iter != decoded_ch.m_next_byte; ++iter)
-+	{
-+	  char buf[16];
-+	  sprintf (buf, "<%02x>", (unsigned char)*iter);
-+	  pp_string (pp, buf);
-+	}
-+      return;
-+    }
-+
-+  cppchar_t ch = decoded_ch.m_ch;
-+  if (ch < 0x80 && ISPRINT (ch))
-+    pp_character (pp, ch);
-+  else
-+    {
-+      for (const char *iter = decoded_ch.m_start_byte;
-+	   iter < decoded_ch.m_next_byte; ++iter)
-+	{
-+	  char buf[16];
-+	  sprintf (buf, "<%02x>", (unsigned char)*iter);
-+	  pp_string (pp, buf);
-+	}
-+    }
-+}
-+
-+/* Callbacks for use with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE.  */
-+
-+/* Callback for char_column_policy::m_width_cb for determining the
-+   display width when escaping with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE.  */
-+
-+static int
-+escape_as_unicode_width (cppchar_t ch)
-+{
-+  if (ch < 0x80 && ISPRINT (ch))
-+    return cpp_wcwidth (ch);
-+  else
-+    {
-+      // Width of "<U+%04x>"
-+      if (ch > 0xfffff)
-+	return 10;
-+      else if (ch > 0xffff)
-+	return 9;
-+      else
-+	return 8;
-+    }
-+}
-+
-+/* Callback for char_display_policy::m_print_cb for printing source chars
-+   when escaping with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE.  */
-+
-+static void
-+escape_as_unicode_print (pretty_printer *pp,
-+			 const cpp_decoded_char &decoded_ch)
-+{
-+  if (!decoded_ch.m_valid_ch)
-+    {
-+      escape_as_bytes_print (pp, decoded_ch);
-+      return;
-+    }
-+
-+  cppchar_t ch = decoded_ch.m_ch;
-+  if (ch < 0x80 && ISPRINT (ch))
-+    pp_character (pp, ch);
-+  else
-+    {
-+      char buf[16];
-+      sprintf (buf, "<U+%04X>", ch);
-+      pp_string (pp, buf);
-+    }
-+}
-+
-+/* Populate a char_display_policy based on DC and RICHLOC.  */
-+
-+static char_display_policy
-+make_policy (const diagnostic_context &dc,
-+	     const rich_location &richloc)
-+{
-+  /* The default is to not escape non-ASCII bytes.  */
-+  char_display_policy result
-+    (dc.tabstop, cpp_wcwidth, default_print_decoded_ch);
-+
-+  /* If the diagnostic suggests escaping non-ASCII bytes, then
-+     use policy from user-supplied options.  */
-+  if (richloc.escape_on_output_p ())
-+    {
-+      result.m_undecoded_byte_width = width_per_escaped_byte;
-+      switch (dc.escape_format)
-+	{
-+	default:
-+	  gcc_unreachable ();
-+	case DIAGNOSTICS_ESCAPE_FORMAT_UNICODE:
-+	  result.m_width_cb = escape_as_unicode_width;
-+	  result.m_print_cb = escape_as_unicode_print;
-+	  break;
-+	case DIAGNOSTICS_ESCAPE_FORMAT_BYTES:
-+	  result.m_width_cb = escape_as_bytes_width;
-+	  result.m_print_cb = escape_as_bytes_print;
-+	  break;
-+	}
-+    }
-+
-+  return result;
-+}
-+
- /* Implementation of class layout.  */
- 
- /* Constructor for class layout.
-@@ -975,8 +1186,10 @@ layout::layout (diagnostic_context * con
- 		diagnostic_t diagnostic_kind)
- : m_context (context),
-   m_pp (context->printer),
-+  m_policy (make_policy (*context, *richloc)),
-   m_primary_loc (richloc->get_range (0)->m_loc),
--  m_exploc (richloc->get_expanded_location (0), context->tabstop),
-+  m_exploc (richloc->get_expanded_location (0), m_policy,
-+	    LOCATION_ASPECT_CARET),
-   m_colorizer (context, diagnostic_kind),
-   m_colorize_source_p (context->colorize_source_p),
-   m_show_labels_p (context->show_labels_p),
-@@ -986,7 +1199,8 @@ layout::layout (diagnostic_context * con
-   m_fixit_hints (richloc->get_num_fixit_hints ()),
-   m_line_spans (1 + richloc->get_num_locations ()),
-   m_linenum_width (0),
--  m_x_offset_display (0)
-+  m_x_offset_display (0),
-+  m_escape_on_output (richloc->escape_on_output_p ())
- {
-   for (unsigned int idx = 0; idx < richloc->get_num_locations (); idx++)
-     {
-@@ -1072,10 +1286,13 @@ layout::maybe_add_location_range (const
- 
-   /* Everything is now known to be in the correct source file,
-      but it may require further sanitization.  */
--  layout_range ri (exploc_with_display_col (start, m_context->tabstop),
--		   exploc_with_display_col (finish, m_context->tabstop),
-+  layout_range ri (exploc_with_display_col (start, m_policy,
-+					    LOCATION_ASPECT_START),
-+		   exploc_with_display_col (finish, m_policy,
-+					    LOCATION_ASPECT_FINISH),
- 		   loc_range->m_range_display_kind,
--		   exploc_with_display_col (caret, m_context->tabstop),
-+		   exploc_with_display_col (caret, m_policy,
-+					    LOCATION_ASPECT_CARET),
- 		   original_idx, loc_range->m_label);
- 
-   /* If we have a range that finishes before it starts (perhaps
-@@ -1409,7 +1626,7 @@ layout::calculate_x_offset_display ()
-     = get_line_bytes_without_trailing_whitespace (line.get_buffer (),
- 						  line.length ());
-   int eol_display_column
--    = cpp_display_width (line.get_buffer (), line_bytes, m_context->tabstop);
-+    = cpp_display_width (line.get_buffer (), line_bytes, m_policy);
-   if (caret_display_column > eol_display_column
-       || !caret_display_column)
-     {
-@@ -1488,7 +1705,7 @@ layout::print_source_line (linenum_type
-   /* This object helps to keep track of which display column we are at, which is
-      necessary for computing the line bounds in display units, for doing
-      tab expansion, and for implementing m_x_offset_display.  */
--  cpp_display_width_computation dw (line, line_bytes, m_context->tabstop);
-+  cpp_display_width_computation dw (line, line_bytes, m_policy);
- 
-   /* Skip the first m_x_offset_display display columns.  In case the leading
-      portion that will be skipped ends with a character with wcwidth > 1, then
-@@ -1536,7 +1753,8 @@ layout::print_source_line (linenum_type
- 	 tabs and replacing some control bytes with spaces as necessary.  */
-       const char *c = dw.next_byte ();
-       const int start_disp_col = dw.display_cols_processed () + 1;
--      const int this_display_width = dw.process_next_codepoint ();
-+      cpp_decoded_char cp;
-+      const int this_display_width = dw.process_next_codepoint (&cp);
-       if (*c == '\t')
- 	{
- 	  /* The returned display width is the number of spaces into which the
-@@ -1545,15 +1763,6 @@ layout::print_source_line (linenum_type
- 	    pp_space (m_pp);
- 	  continue;
- 	}
--      if (*c == '\0' || *c == '\r')
--	{
--	  /* cpp_wcwidth() promises to return 1 for all control bytes, and we
--	     want to output these as a single space too, so this case is
--	     actually the same as the '\t' case.  */
--	  gcc_assert (this_display_width == 1);
--	  pp_space (m_pp);
--	  continue;
--	}
- 
-       /* We have a (possibly multibyte) character to output; update the line
- 	 bounds if it is not whitespace.  */
-@@ -1565,7 +1774,8 @@ layout::print_source_line (linenum_type
- 	}
- 
-       /* Output the character.  */
--      while (c != dw.next_byte ()) pp_character (m_pp, *c++);
-+      m_policy.m_print_cb (m_pp, cp);
-+      c = dw.next_byte ();
-     }
-   print_newline ();
-   return lbounds;
-@@ -1664,14 +1874,14 @@ layout::print_annotation_line (linenum_t
- class line_label
- {
- public:
--  line_label (diagnostic_context *context, int state_idx, int column,
-+  line_label (const cpp_char_column_policy &policy,
-+	      int state_idx, int column,
- 	      label_text text)
-   : m_state_idx (state_idx), m_column (column),
-     m_text (text), m_label_line (0), m_has_vbar (true)
-   {
-     const int bytes = strlen (text.m_buffer);
--    m_display_width
--      = cpp_display_width (text.m_buffer, bytes, context->tabstop);
-+    m_display_width = cpp_display_width (text.m_buffer, bytes, policy);
-   }
- 
-   /* Sorting is primarily by column, then by state index.  */
-@@ -1731,7 +1941,7 @@ layout::print_any_labels (linenum_type r
- 	if (text.m_buffer == NULL)
- 	  continue;
- 
--	labels.safe_push (line_label (m_context, i, disp_col, text));
-+	labels.safe_push (line_label (m_policy, i, disp_col, text));
-       }
-   }
- 
-@@ -2011,7 +2221,7 @@ public:
- 
- /* Get the range of bytes or display columns that HINT would affect.  */
- static column_range
--get_affected_range (diagnostic_context *context,
-+get_affected_range (const cpp_char_column_policy &policy,
- 		    const fixit_hint *hint, enum column_unit col_unit)
- {
-   expanded_location exploc_start = expand_location (hint->get_start_loc ());
-@@ -2022,13 +2232,11 @@ get_affected_range (diagnostic_context *
-   int finish_column;
-   if (col_unit == CU_DISPLAY_COLS)
-     {
--      start_column
--	= location_compute_display_column (exploc_start, context->tabstop);
-+      start_column = location_compute_display_column (exploc_start, policy);
-       if (hint->insertion_p ())
- 	finish_column = start_column - 1;
-       else
--	finish_column
--	  = location_compute_display_column (exploc_finish, context->tabstop);
-+	finish_column = location_compute_display_column (exploc_finish, policy);
-     }
-   else
-     {
-@@ -2041,12 +2249,13 @@ get_affected_range (diagnostic_context *
- /* Get the range of display columns that would be printed for HINT.  */
- 
- static column_range
--get_printed_columns (diagnostic_context *context, const fixit_hint *hint)
-+get_printed_columns (const cpp_char_column_policy &policy,
-+		     const fixit_hint *hint)
- {
-   expanded_location exploc = expand_location (hint->get_start_loc ());
--  int start_column = location_compute_display_column (exploc, context->tabstop);
-+  int start_column = location_compute_display_column (exploc, policy);
-   int hint_width = cpp_display_width (hint->get_string (), hint->get_length (),
--				      context->tabstop);
-+				      policy);
-   int final_hint_column = start_column + hint_width - 1;
-   if (hint->insertion_p ())
-     {
-@@ -2056,8 +2265,7 @@ get_printed_columns (diagnostic_context
-     {
-       exploc = expand_location (hint->get_next_loc ());
-       --exploc.column;
--      int finish_column
--	= location_compute_display_column (exploc, context->tabstop);
-+      int finish_column = location_compute_display_column (exploc, policy);
-       return column_range (start_column,
- 			   MAX (finish_column, final_hint_column));
-     }
-@@ -2075,13 +2283,13 @@ public:
- 	      column_range affected_columns,
- 	      column_range printed_columns,
- 	      const char *new_text, size_t new_text_len,
--	      int tabstop)
-+	      const cpp_char_column_policy &policy)
-   : m_affected_bytes (affected_bytes),
-     m_affected_columns (affected_columns),
-     m_printed_columns (printed_columns),
-     m_text (xstrdup (new_text)),
-     m_byte_length (new_text_len),
--    m_tabstop (tabstop),
-+    m_policy (policy),
-     m_alloc_sz (new_text_len + 1)
-   {
-     compute_display_cols ();
-@@ -2099,7 +2307,7 @@ public:
- 
-   void compute_display_cols ()
-   {
--    m_display_cols = cpp_display_width (m_text, m_byte_length, m_tabstop);
-+    m_display_cols = cpp_display_width (m_text, m_byte_length, m_policy);
-   }
- 
-   void overwrite (int dst_offset, const char_span &src_span)
-@@ -2127,7 +2335,7 @@ public:
-   char *m_text;
-   size_t m_byte_length; /* Not including null-terminator.  */
-   int m_display_cols;
--  int m_tabstop;
-+  const cpp_char_column_policy &m_policy;
-   size_t m_alloc_sz;
- };
- 
-@@ -2163,15 +2371,16 @@ correction::ensure_terminated ()
- class line_corrections
- {
- public:
--  line_corrections (diagnostic_context *context, const char *filename,
-+  line_corrections (const char_display_policy &policy,
-+		    const char *filename,
- 		    linenum_type row)
--    : m_context (context), m_filename (filename), m_row (row)
-+  : m_policy (policy), m_filename (filename), m_row (row)
-   {}
-   ~line_corrections ();
- 
-   void add_hint (const fixit_hint *hint);
- 
--  diagnostic_context *m_context;
-+  const char_display_policy &m_policy;
-   const char *m_filename;
-   linenum_type m_row;
-   auto_vec <correction *> m_corrections;
-@@ -2217,10 +2426,10 @@ source_line::source_line (const char *fi
- void
- line_corrections::add_hint (const fixit_hint *hint)
- {
--  column_range affected_bytes = get_affected_range (m_context, hint, CU_BYTES);
--  column_range affected_columns = get_affected_range (m_context, hint,
-+  column_range affected_bytes = get_affected_range (m_policy, hint, CU_BYTES);
-+  column_range affected_columns = get_affected_range (m_policy, hint,
- 						      CU_DISPLAY_COLS);
--  column_range printed_columns = get_printed_columns (m_context, hint);
-+  column_range printed_columns = get_printed_columns (m_policy, hint);
- 
-   /* Potentially consolidate.  */
-   if (!m_corrections.is_empty ())
-@@ -2289,7 +2498,7 @@ line_corrections::add_hint (const fixit_
- 					   printed_columns,
- 					   hint->get_string (),
- 					   hint->get_length (),
--					   m_context->tabstop));
-+					   m_policy));
- }
- 
- /* If there are any fixit hints on source line ROW, print them.
-@@ -2303,7 +2512,7 @@ layout::print_trailing_fixits (linenum_t
- {
-   /* Build a list of correction instances for the line,
-      potentially consolidating hints (for the sake of readability).  */
--  line_corrections corrections (m_context, m_exploc.file, row);
-+  line_corrections corrections (m_policy, m_exploc.file, row);
-   for (unsigned int i = 0; i < m_fixit_hints.length (); i++)
-     {
-       const fixit_hint *hint = m_fixit_hints[i];
-@@ -2646,6 +2855,59 @@ namespace selftest {
- 
- /* Selftests for diagnostic_show_locus.  */
- 
-+/* Verify that cpp_display_width correctly handles escaping.  */
-+
-+static void
-+test_display_widths ()
-+{
-+  gcc_rich_location richloc (UNKNOWN_LOCATION);
-+
-+  /* U+03C0 "GREEK SMALL LETTER PI".  */
-+  const char *pi = "\xCF\x80";
-+  /* U+1F642 "SLIGHTLY SMILING FACE".  */
-+  const char *emoji = "\xF0\x9F\x99\x82";
-+  /* Stray trailing byte of a UTF-8 character.  */
-+  const char *stray = "\xBF";
-+  /* U+10FFFF.  */
-+  const char *max_codepoint = "\xF4\x8F\xBF\xBF";
-+
-+  /* No escaping.  */
-+  {
-+    test_diagnostic_context dc;
-+    char_display_policy policy (make_policy (dc, richloc));
-+    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 1);
-+    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 2);
-+    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 1);
-+    /* Don't check width of U+10FFFF; it's in a private use plane.  */
-+  }
-+
-+  richloc.set_escape_on_output (true);
-+
-+  {
-+    test_diagnostic_context dc;
-+    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
-+    char_display_policy policy (make_policy (dc, richloc));
-+    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 8);
-+    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 9);
-+    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 4);
-+    ASSERT_EQ (cpp_display_width (max_codepoint, strlen (max_codepoint),
-+				  policy),
-+	       strlen ("<U+10FFFF>"));
-+  }
-+
-+  {
-+    test_diagnostic_context dc;
-+    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
-+    char_display_policy policy (make_policy (dc, richloc));
-+    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 8);
-+    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 16);
-+    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 4);
-+    ASSERT_EQ (cpp_display_width (max_codepoint, strlen (max_codepoint),
-+				  policy),
-+	       16);
-+  }
-+}
-+
- /* For precise tests of the layout, make clear where the source line will
-    start.  test_left_margin sets the total byte count from the left side of the
-    screen to the start of source lines, after the line number and the separator,
-@@ -2715,10 +2977,10 @@ test_layout_x_offset_display_utf8 (const
-   char_span lspan = location_get_source_line (tmp.get_filename (), 1);
-   ASSERT_EQ (line_display_cols,
- 	     cpp_display_width (lspan.get_buffer (), lspan.length (),
--				def_tabstop));
-+				def_policy ()));
-   ASSERT_EQ (line_display_cols,
- 	     location_compute_display_column (expand_location (line_end),
--					      def_tabstop));
-+					      def_policy ()));
-   ASSERT_EQ (0, memcmp (lspan.get_buffer () + (emoji_col - 1),
- 			"\xf0\x9f\x98\x82\xf0\x9f\x98\x82", 8));
- 
-@@ -2866,12 +3128,13 @@ test_layout_x_offset_display_tab (const
-   ASSERT_EQ ('\t', *(lspan.get_buffer () + (tab_col - 1)));
-   for (int tabstop = 1; tabstop != num_tabstops; ++tabstop)
-     {
-+      cpp_char_column_policy policy (tabstop, cpp_wcwidth);
-       ASSERT_EQ (line_bytes + extra_width[tabstop],
- 		 cpp_display_width (lspan.get_buffer (), lspan.length (),
--				    tabstop));
-+				    policy));
-       ASSERT_EQ (line_bytes + extra_width[tabstop],
- 		 location_compute_display_column (expand_location (line_end),
--						  tabstop));
-+						  policy));
-     }
- 
-   /* Check that the tab is expanded to the expected number of spaces.  */
-@@ -4003,6 +4266,43 @@ test_one_liner_labels_utf8 ()
- 			   " bb\xf0\x9f\x98\x82\xf0\x9f\x98\x82\n",
- 		  pp_formatted_text (dc.printer));
-   }
-+
-+  /* Example of escaping the source lines.  */
-+  {
-+    text_range_label label0 ("label 0\xf0\x9f\x98\x82");
-+    text_range_label label1 ("label 1\xcf\x80");
-+    text_range_label label2 ("label 2\xcf\x80");
-+    gcc_rich_location richloc (foo, &label0);
-+    richloc.add_range (bar, SHOW_RANGE_WITHOUT_CARET, &label1);
-+    richloc.add_range (field, SHOW_RANGE_WITHOUT_CARET, &label2);
-+    richloc.set_escape_on_output (true);
-+
-+    {
-+      test_diagnostic_context dc;
-+      dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
-+      diagnostic_show_locus (&dc, &richloc, DK_ERROR);
-+      ASSERT_STREQ (" <U+1F602>_foo = <U+03C0>_bar.<U+1F602>_field<U+03C0>;\n"
-+		    " ^~~~~~~~~~~~~   ~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~\n"
-+		    " |               |            |\n"
-+		    " |               |            label 2\xcf\x80\n"
-+		    " |               label 1\xcf\x80\n"
-+		    " label 0\xf0\x9f\x98\x82\n",
-+		    pp_formatted_text (dc.printer));
-+    }
-+    {
-+      test_diagnostic_context dc;
-+      dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
-+      diagnostic_show_locus (&dc, &richloc, DK_ERROR);
-+      ASSERT_STREQ
-+	(" <f0><9f><98><82>_foo = <cf><80>_bar.<f0><9f><98><82>_field<cf><80>;\n"
-+	 " ^~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
-+	 " |                      |            |\n"
-+	 " |                      |            label 2\xcf\x80\n"
-+	 " |                      label 1\xcf\x80\n"
-+	 " label 0\xf0\x9f\x98\x82\n",
-+	 pp_formatted_text (dc.printer));
-+    }
-+  }
- }
- 
- /* Make sure that colorization codes don't interrupt a multibyte
-@@ -4057,9 +4357,9 @@ test_diagnostic_show_locus_one_liner_utf
- 
-   char_span lspan = location_get_source_line (tmp.get_filename (), 1);
-   ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (), lspan.length (),
--				    def_tabstop));
-+				    def_policy ()));
-   ASSERT_EQ (25, location_compute_display_column (expand_location (line_end),
--						  def_tabstop));
-+						  def_policy ()));
- 
-   test_one_liner_simple_caret_utf8 ();
-   test_one_liner_caret_and_range_utf8 ();
-@@ -4445,30 +4745,31 @@ test_overlapped_fixit_printing (const li
- 		  pp_formatted_text (dc.printer));
- 
-     /* Unit-test the line_corrections machinery.  */
-+    char_display_policy policy (make_policy (dc, richloc));
-     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
-     const fixit_hint *hint_0 = richloc.get_fixit_hint (0);
-     ASSERT_EQ (column_range (12, 12),
--	       get_affected_range (&dc, hint_0, CU_BYTES));
-+	       get_affected_range (policy, hint_0, CU_BYTES));
-     ASSERT_EQ (column_range (12, 12),
--	       get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
--    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0));
-+	       get_affected_range (policy, hint_0, CU_DISPLAY_COLS));
-+    ASSERT_EQ (column_range (12, 22), get_printed_columns (policy, hint_0));
-     const fixit_hint *hint_1 = richloc.get_fixit_hint (1);
-     ASSERT_EQ (column_range (18, 18),
--	       get_affected_range (&dc, hint_1, CU_BYTES));
-+	       get_affected_range (policy, hint_1, CU_BYTES));
-     ASSERT_EQ (column_range (18, 18),
--	       get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
--    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1));
-+	       get_affected_range (policy, hint_1, CU_DISPLAY_COLS));
-+    ASSERT_EQ (column_range (18, 20), get_printed_columns (policy, hint_1));
-     const fixit_hint *hint_2 = richloc.get_fixit_hint (2);
-     ASSERT_EQ (column_range (29, 28),
--	       get_affected_range (&dc, hint_2, CU_BYTES));
-+	       get_affected_range (policy, hint_2, CU_BYTES));
-     ASSERT_EQ (column_range (29, 28),
--	       get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
--    ASSERT_EQ (column_range (29, 29), get_printed_columns (&dc, hint_2));
-+	       get_affected_range (policy, hint_2, CU_DISPLAY_COLS));
-+    ASSERT_EQ (column_range (29, 29), get_printed_columns (policy, hint_2));
- 
-     /* Add each hint in turn to a line_corrections instance,
-        and verify that they are consolidated into one correction instance
-        as expected.  */
--    line_corrections lc (&dc, tmp.get_filename (), 1);
-+    line_corrections lc (policy, tmp.get_filename (), 1);
- 
-     /* The first replace hint by itself.  */
-     lc.add_hint (hint_0);
-@@ -4660,30 +4961,31 @@ test_overlapped_fixit_printing_utf8 (con
- 		  pp_formatted_text (dc.printer));
- 
-     /* Unit-test the line_corrections machinery.  */
-+    char_display_policy policy (make_policy (dc, richloc));
-     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
-     const fixit_hint *hint_0 = richloc.get_fixit_hint (0);
-     ASSERT_EQ (column_range (14, 14),
--	       get_affected_range (&dc, hint_0, CU_BYTES));
-+	       get_affected_range (policy, hint_0, CU_BYTES));
-     ASSERT_EQ (column_range (12, 12),
--	       get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
--    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0));
-+	       get_affected_range (policy, hint_0, CU_DISPLAY_COLS));
-+    ASSERT_EQ (column_range (12, 22), get_printed_columns (policy, hint_0));
-     const fixit_hint *hint_1 = richloc.get_fixit_hint (1);
-     ASSERT_EQ (column_range (22, 22),
--	       get_affected_range (&dc, hint_1, CU_BYTES));
-+	       get_affected_range (policy, hint_1, CU_BYTES));
-     ASSERT_EQ (column_range (18, 18),
--	       get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
--    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1));
-+	       get_affected_range (policy, hint_1, CU_DISPLAY_COLS));
-+    ASSERT_EQ (column_range (18, 20), get_printed_columns (policy, hint_1));
-     const fixit_hint *hint_2 = richloc.get_fixit_hint (2);
-     ASSERT_EQ (column_range (35, 34),
--	       get_affected_range (&dc, hint_2, CU_BYTES));
-+	       get_affected_range (policy, hint_2, CU_BYTES));
-     ASSERT_EQ (column_range (30, 29),
--	       get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
--    ASSERT_EQ (column_range (30, 30), get_printed_columns (&dc, hint_2));
-+	       get_affected_range (policy, hint_2, CU_DISPLAY_COLS));
-+    ASSERT_EQ (column_range (30, 30), get_printed_columns (policy, hint_2));
- 
-     /* Add each hint in turn to a line_corrections instance,
-        and verify that they are consolidated into one correction instance
-        as expected.  */
--    line_corrections lc (&dc, tmp.get_filename (), 1);
-+    line_corrections lc (policy, tmp.get_filename (), 1);
- 
-     /* The first replace hint by itself.  */
-     lc.add_hint (hint_0);
-@@ -4877,15 +5179,16 @@ test_overlapped_fixit_printing_2 (const
-     richloc.add_fixit_insert_before (col_21, "}");
- 
-     /* These fixits should be accepted; they can't be consolidated.  */
-+    char_display_policy policy (make_policy (dc, richloc));
-     ASSERT_EQ (2, richloc.get_num_fixit_hints ());
-     const fixit_hint *hint_0 = richloc.get_fixit_hint (0);
-     ASSERT_EQ (column_range (23, 22),
--	       get_affected_range (&dc, hint_0, CU_BYTES));
--    ASSERT_EQ (column_range (23, 23), get_printed_columns (&dc, hint_0));
-+	       get_affected_range (policy, hint_0, CU_BYTES));
-+    ASSERT_EQ (column_range (23, 23), get_printed_columns (policy, hint_0));
-     const fixit_hint *hint_1 = richloc.get_fixit_hint (1);
-     ASSERT_EQ (column_range (21, 20),
--	       get_affected_range (&dc, hint_1, CU_BYTES));
--    ASSERT_EQ (column_range (21, 21), get_printed_columns (&dc, hint_1));
-+	       get_affected_range (policy, hint_1, CU_BYTES));
-+    ASSERT_EQ (column_range (21, 21), get_printed_columns (policy, hint_1));
- 
-     /* Verify that they're printed correctly.  */
-     diagnostic_show_locus (&dc, &richloc, DK_ERROR);
-@@ -5152,10 +5455,11 @@ test_tab_expansion (const line_table_cas
-      ....................123 45678901234 56789012345  columns  */
- 
-   const int tabstop = 8;
-+  cpp_char_column_policy policy (tabstop, cpp_wcwidth);
-   const int first_non_ws_byte_col = 7;
-   const int right_quote_byte_col = 15;
-   const int last_byte_col = 25;
--  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, tabstop));
-+  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, policy));
- 
-   temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
-   line_table_test ltt (case_);
-@@ -5198,6 +5502,114 @@ test_tab_expansion (const line_table_cas
-   }
- }
- 
-+/* Verify that the escaping machinery can cope with a variety of different
-+   invalid bytes.  */
-+
-+static void
-+test_escaping_bytes_1 (const line_table_case &case_)
-+{
-+  const char content[] = "before\0\1\2\3\r\x80\xff""after\n";
-+  const size_t sz = sizeof (content);
-+  temp_source_file tmp (SELFTEST_LOCATION, ".c", content, sz);
-+  line_table_test ltt (case_);
-+  const line_map_ordinary *ord_map = linemap_check_ordinary
-+    (linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 0));
-+  linemap_line_start (line_table, 1, 100);
-+
-+  location_t finish
-+    = linemap_position_for_line_and_column (line_table, ord_map, 1,
-+					    strlen (content));
-+
-+  if (finish > LINE_MAP_MAX_LOCATION_WITH_COLS)
-+    return;
-+
-+  /* Locations of the NUL and \r bytes.  */
-+  location_t nul_loc
-+    = linemap_position_for_line_and_column (line_table, ord_map, 1, 7);
-+  location_t r_loc
-+    = linemap_position_for_line_and_column (line_table, ord_map, 1, 11);
-+  gcc_rich_location richloc (nul_loc);
-+  richloc.add_range (r_loc);
-+
-+  {
-+    test_diagnostic_context dc;
-+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
-+    ASSERT_STREQ (" before \1\2\3 \x80\xff""after\n"
-+		  "       ^   ~\n",
-+		  pp_formatted_text (dc.printer));
-+  }
-+  richloc.set_escape_on_output (true);
-+  {
-+    test_diagnostic_context dc;
-+    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
-+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
-+    ASSERT_STREQ
-+      (" before<U+0000><U+0001><U+0002><U+0003><U+000D><80><ff>after\n"
-+       "       ^~~~~~~~                        ~~~~~~~~\n",
-+       pp_formatted_text (dc.printer));
-+  }
-+  {
-+    test_diagnostic_context dc;
-+    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
-+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
-+    ASSERT_STREQ (" before<00><01><02><03><0d><80><ff>after\n"
-+		  "       ^~~~            ~~~~\n",
-+		  pp_formatted_text (dc.printer));
-+  }
-+}
-+
-+/* As above, but verify that we handle the initial byte of a line
-+   correctly.  */
-+
-+static void
-+test_escaping_bytes_2 (const line_table_case &case_)
-+{
-+  const char content[]  = "\0after\n";
-+  const size_t sz = sizeof (content);
-+  temp_source_file tmp (SELFTEST_LOCATION, ".c", content, sz);
-+  line_table_test ltt (case_);
-+  const line_map_ordinary *ord_map = linemap_check_ordinary
-+    (linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 0));
-+  linemap_line_start (line_table, 1, 100);
-+
-+  location_t finish
-+    = linemap_position_for_line_and_column (line_table, ord_map, 1,
-+					    strlen (content));
-+
-+  if (finish > LINE_MAP_MAX_LOCATION_WITH_COLS)
-+    return;
-+
-+  /* Location of the NUL byte.  */
-+  location_t nul_loc
-+    = linemap_position_for_line_and_column (line_table, ord_map, 1, 1);
-+  gcc_rich_location richloc (nul_loc);
-+
-+  {
-+    test_diagnostic_context dc;
-+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
-+    ASSERT_STREQ ("  after\n"
-+		  " ^\n",
-+		  pp_formatted_text (dc.printer));
-+  }
-+  richloc.set_escape_on_output (true);
-+  {
-+    test_diagnostic_context dc;
-+    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
-+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
-+    ASSERT_STREQ (" <U+0000>after\n"
-+		  " ^~~~~~~~\n",
-+		  pp_formatted_text (dc.printer));
-+  }
-+  {
-+    test_diagnostic_context dc;
-+    dc.escape_format = DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
-+    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
-+    ASSERT_STREQ (" <00>after\n"
-+		  " ^~~~\n",
-+		  pp_formatted_text (dc.printer));
-+  }
-+}
-+
- /* Verify that line numbers are correctly printed for the case of
-    a multiline range in which the width of the line numbers changes
-    (e.g. from "9" to "10").  */
-@@ -5254,6 +5666,8 @@ diagnostic_show_locus_c_tests ()
-   test_layout_range_for_single_line ();
-   test_layout_range_for_multiple_lines ();
- 
-+  test_display_widths ();
-+
-   for_each_line_table_case (test_layout_x_offset_display_utf8);
-   for_each_line_table_case (test_layout_x_offset_display_tab);
- 
-@@ -5274,6 +5688,8 @@ diagnostic_show_locus_c_tests ()
-   for_each_line_table_case (test_fixit_replace_containing_newline);
-   for_each_line_table_case (test_fixit_deletion_affecting_newline);
-   for_each_line_table_case (test_tab_expansion);
-+  for_each_line_table_case (test_escaping_bytes_1);
-+  for_each_line_table_case (test_escaping_bytes_2);
- 
-   test_line_numbers_multiline_range ();
- }
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
---- a/gcc/doc/invoke.texi	2021-12-13 23:23:05.764437151 -0800
-+++ b/gcc/doc/invoke.texi	2021-12-14 01:16:01.553943061 -0800
-@@ -312,7 +312,8 @@ Objective-C and Objective-C++ Dialects}.
- -fdiagnostics-show-path-depths @gol
- -fno-show-column @gol
- -fdiagnostics-column-unit=@r{[}display@r{|}byte@r{]} @gol
---fdiagnostics-column-origin=@var{origin}}
-+-fdiagnostics-column-origin=@var{origin} @gol
-+-fdiagnostics-escape-format=@r{[}unicode@r{|}bytes@r{]}}
- 
- @item Warning Options
- @xref{Warning Options,,Options to Request or Suppress Warnings}.
-@@ -5083,6 +5084,38 @@ first column.  The default value of 1 co
- behavior and to the GNU style guide.  Some utilities may perform better with an
- origin of 0; any non-negative value may be specified.
- 
-+@item -fdiagnostics-escape-format=@var{FORMAT}
-+@opindex fdiagnostics-escape-format
-+When GCC prints pertinent source lines for a diagnostic it normally attempts
-+to print the source bytes directly.  However, some diagnostics relate to encoding
-+issues in the source file, such as malformed UTF-8, or issues with Unicode
-+normalization.  These diagnostics are flagged so that GCC will escape bytes
-+that are not printable ASCII when printing their pertinent source lines.
-+
-+This option controls how such bytes should be escaped.
-+
-+The default @var{FORMAT}, @samp{unicode} displays Unicode characters that
-+are not printable ASCII in the form @samp{<U+XXXX>}, and bytes that do not
-+correspond to a Unicode character validly-encoded in UTF-8-encoded will be
-+displayed as hexadecimal in the form @samp{<XX>}.
-+
-+For example, a source line containing the string @samp{before} followed by the
-+Unicode character U+03C0 (``GREEK SMALL LETTER PI'', with UTF-8 encoding
-+0xCF 0x80) followed by the byte 0xBF (a stray UTF-8 trailing byte), followed by
-+the string @samp{after} will be printed for such a diagnostic as:
-+
-+@smallexample
-+ before<U+03C0><BF>after
-+@end smallexample
-+
-+Setting @var{FORMAT} to @samp{bytes} will display all non-printable-ASCII bytes
-+in the form @samp{<XX>}, thus showing the underlying encoding of non-ASCII
-+Unicode characters.  For the example above, the following will be printed:
-+
-+@smallexample
-+ before<CF><80><BF>after
-+@end smallexample
-+
- @item -fdiagnostics-format=@var{FORMAT}
- @opindex fdiagnostics-format
- Select a different format for printing diagnostics.
-@@ -5150,9 +5183,11 @@ might be printed in JSON form (after for
-                         @}
-                     @}
-                 ],
-+                "escape-source": false,
-                 "message": "...this statement, but the latter is @dots{}"
-             @}
-         ]
-+	"escape-source": false,
- 	"column-origin": 1,
-     @},
-     @dots{}
-@@ -5239,6 +5274,7 @@ of the expression, which have labels.  I
-                 "label": "T @{aka struct t@}"
-             @}
-         ],
-+        "escape-source": false,
-         "message": "invalid operands to binary + @dots{}"
-     @}
- @end smallexample
-@@ -5292,6 +5328,7 @@ might be printed in JSON form as:
-                 @}
-             @}
-         ],
-+        "escape-source": false,
-         "message": "\u2018struct s\u2019 has no member named @dots{}"
-     @}
- @end smallexample
-@@ -5349,6 +5386,10 @@ For example, the intraprocedural example
-     ]
- @end smallexample
- 
-+Diagnostics have a boolean attribute @code{escape-source}, hinting whether
-+non-ASCII bytes should be escaped when printing the pertinent lines of
-+source code (@code{true} for diagnostics involving source encoding issues).
-+
- @end table
- 
- @node Warning Options
-diff --git a/gcc/input.c b/gcc/input.c
---- a/gcc/input.c	2021-07-27 23:55:07.328287915 -0700
-+++ b/gcc/input.c	2021-12-14 01:16:01.553943061 -0800
-@@ -913,7 +913,8 @@ make_location (location_t caret, source_
-    source line in order to calculate the display width.  If that cannot be done
-    for any reason, then returns the byte column as a fallback.  */
- int
--location_compute_display_column (expanded_location exploc, int tabstop)
-+location_compute_display_column (expanded_location exploc,
-+				 const cpp_char_column_policy &policy)
- {
-   if (!(exploc.file && *exploc.file && exploc.line && exploc.column))
-     return exploc.column;
-@@ -921,7 +922,7 @@ location_compute_display_column (expande
-   /* If line is NULL, this function returns exploc.column which is the
-      desired fallback.  */
-   return cpp_byte_column_to_display_column (line.get_buffer (), line.length (),
--					    exploc.column, tabstop);
-+					    exploc.column, policy);
- }
- 
- /* Dump statistics to stderr about the memory usage of the line_table
-@@ -3611,43 +3612,50 @@ test_line_offset_overflow ()
- void test_cpp_utf8 ()
- {
-   const int def_tabstop = 8;
-+  cpp_char_column_policy policy (def_tabstop, cpp_wcwidth);
-+
-   /* Verify that wcwidth of invalid UTF-8 or control bytes is 1.  */
-   {
--    int w_bad = cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, def_tabstop);
-+    int w_bad = cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, policy);
-     ASSERT_EQ (8, w_bad);
--    int w_ctrl = cpp_display_width ("\r\n\v\0\1", 5, def_tabstop);
-+    int w_ctrl = cpp_display_width ("\r\n\v\0\1", 5, policy);
-     ASSERT_EQ (5, w_ctrl);
-   }
- 
-   /* Verify that wcwidth of valid UTF-8 is as expected.  */
-   {
--    const int w_pi = cpp_display_width ("\xcf\x80", 2, def_tabstop);
-+    const int w_pi = cpp_display_width ("\xcf\x80", 2, policy);
-     ASSERT_EQ (1, w_pi);
--    const int w_emoji = cpp_display_width ("\xf0\x9f\x98\x82", 4, def_tabstop);
-+    const int w_emoji = cpp_display_width ("\xf0\x9f\x98\x82", 4, policy);
-     ASSERT_EQ (2, w_emoji);
-     const int w_umlaut_precomposed = cpp_display_width ("\xc3\xbf", 2,
--							def_tabstop);
-+							policy);
-     ASSERT_EQ (1, w_umlaut_precomposed);
-     const int w_umlaut_combining = cpp_display_width ("y\xcc\x88", 3,
--						      def_tabstop);
-+						      policy);
-     ASSERT_EQ (1, w_umlaut_combining);
--    const int w_han = cpp_display_width ("\xe4\xb8\xba", 3, def_tabstop);
-+    const int w_han = cpp_display_width ("\xe4\xb8\xba", 3, policy);
-     ASSERT_EQ (2, w_han);
--    const int w_ascii = cpp_display_width ("GCC", 3, def_tabstop);
-+    const int w_ascii = cpp_display_width ("GCC", 3, policy);
-     ASSERT_EQ (3, w_ascii);
-     const int w_mixed = cpp_display_width ("\xcf\x80 = 3.14 \xf0\x9f\x98\x82"
- 					   "\x9f! \xe4\xb8\xba y\xcc\x88",
--					   24, def_tabstop);
-+					   24, policy);
-     ASSERT_EQ (18, w_mixed);
-   }
- 
-   /* Verify that display width properly expands tabs.  */
-   {
-     const char *tstr = "\tabc\td";
--    ASSERT_EQ (6, cpp_display_width (tstr, 6, 1));
--    ASSERT_EQ (10, cpp_display_width (tstr, 6, 3));
--    ASSERT_EQ (17, cpp_display_width (tstr, 6, 8));
--    ASSERT_EQ (1, cpp_display_column_to_byte_column (tstr, 6, 7, 8));
-+    ASSERT_EQ (6, cpp_display_width (tstr, 6,
-+				     cpp_char_column_policy (1, cpp_wcwidth)));
-+    ASSERT_EQ (10, cpp_display_width (tstr, 6,
-+				      cpp_char_column_policy (3, cpp_wcwidth)));
-+    ASSERT_EQ (17, cpp_display_width (tstr, 6,
-+				      cpp_char_column_policy (8, cpp_wcwidth)));
-+    ASSERT_EQ (1,
-+	       cpp_display_column_to_byte_column
-+		 (tstr, 6, 7, cpp_char_column_policy (8, cpp_wcwidth)));
-   }
- 
-   /* Verify that cpp_byte_column_to_display_column can go past the end,
-@@ -3660,13 +3668,13 @@ void test_cpp_utf8 ()
-       /* 111122223456
- 	 Byte columns.  */
- 
--    ASSERT_EQ (5, cpp_display_width (str, 6, def_tabstop));
-+    ASSERT_EQ (5, cpp_display_width (str, 6, policy));
-     ASSERT_EQ (105,
--	       cpp_byte_column_to_display_column (str, 6, 106, def_tabstop));
-+	       cpp_byte_column_to_display_column (str, 6, 106, policy));
-     ASSERT_EQ (10000,
--	       cpp_byte_column_to_display_column (NULL, 0, 10000, def_tabstop));
-+	       cpp_byte_column_to_display_column (NULL, 0, 10000, policy));
-     ASSERT_EQ (0,
--	       cpp_byte_column_to_display_column (NULL, 10000, 0, def_tabstop));
-+	       cpp_byte_column_to_display_column (NULL, 10000, 0, policy));
-   }
- 
-   /* Verify that cpp_display_column_to_byte_column can go past the end,
-@@ -3680,25 +3688,25 @@ void test_cpp_utf8 ()
-       /* 000000000000000000000000000000000111111
- 	 111122223333444456666777788889999012345
- 	 Byte columns.  */
--    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2, def_tabstop));
-+    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2, policy));
-     ASSERT_EQ (15,
--	       cpp_display_column_to_byte_column (str, 15, 11, def_tabstop));
-+	       cpp_display_column_to_byte_column (str, 15, 11, policy));
-     ASSERT_EQ (115,
--	       cpp_display_column_to_byte_column (str, 15, 111, def_tabstop));
-+	       cpp_display_column_to_byte_column (str, 15, 111, policy));
-     ASSERT_EQ (10000,
--	       cpp_display_column_to_byte_column (NULL, 0, 10000, def_tabstop));
-+	       cpp_display_column_to_byte_column (NULL, 0, 10000, policy));
-     ASSERT_EQ (0,
--	       cpp_display_column_to_byte_column (NULL, 10000, 0, def_tabstop));
-+	       cpp_display_column_to_byte_column (NULL, 10000, 0, policy));
- 
-     /* Verify that we do not interrupt a UTF-8 sequence.  */
--    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, def_tabstop));
-+    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, policy));
- 
-     for (int byte_col = 1; byte_col <= 15; ++byte_col)
-       {
- 	const int disp_col
--	  = cpp_byte_column_to_display_column (str, 15, byte_col, def_tabstop);
-+	  = cpp_byte_column_to_display_column (str, 15, byte_col, policy);
- 	const int byte_col2
--	  = cpp_display_column_to_byte_column (str, 15, disp_col, def_tabstop);
-+	  = cpp_display_column_to_byte_column (str, 15, disp_col, policy);
- 
- 	/* If we ask for the display column in the middle of a UTF-8
- 	   sequence, it will return the length of the partial sequence,
-diff --git a/gcc/input.h b/gcc/input.h
---- a/gcc/input.h	2021-07-27 23:55:07.328287915 -0700
-+++ b/gcc/input.h	2021-12-14 01:16:01.553943061 -0800
-@@ -39,8 +39,11 @@ STATIC_ASSERT (BUILTINS_LOCATION < RESER
- extern bool is_location_from_builtin_token (location_t);
- extern expanded_location expand_location (location_t);
- 
--extern int location_compute_display_column (expanded_location exploc,
--					    int tabstop);
-+class cpp_char_column_policy;
-+
-+extern int
-+location_compute_display_column (expanded_location exploc,
-+				 const cpp_char_column_policy &policy);
- 
- /* A class capturing the bounds of a buffer, to allow for run-time
-    bounds-checking in a checked build.  */
-diff --git a/gcc/opts.c b/gcc/opts.c
---- a/gcc/opts.c	2021-07-27 23:55:07.364288417 -0700
-+++ b/gcc/opts.c	2021-12-14 01:16:01.553943061 -0800
-@@ -2573,6 +2573,10 @@ common_handle_option (struct gcc_options
-       dc->column_origin = value;
-       break;
- 
-+    case OPT_fdiagnostics_escape_format_:
-+      dc->escape_format = (enum diagnostics_escape_format)value;
-+      break;
-+
-     case OPT_fdiagnostics_show_cwe:
-       dc->show_cwe = value;
-       break;
-diff --git a/gcc/selftest.c b/gcc/selftest.c
---- a/gcc/selftest.c	2021-07-27 23:55:07.500290315 -0700
-+++ b/gcc/selftest.c	2021-12-14 01:16:01.557942991 -0800
-@@ -193,6 +193,21 @@ temp_source_file::temp_source_file (cons
-   fclose (out);
- }
- 
-+/* As above, but with a size, to allow for NUL bytes in CONTENT.  */
-+
-+temp_source_file::temp_source_file (const location &loc,
-+				    const char *suffix,
-+				    const char *content,
-+				    size_t sz)
-+: named_temp_file (suffix)
-+{
-+  FILE *out = fopen (get_filename (), "w");
-+  if (!out)
-+    fail_formatted (loc, "unable to open tempfile: %s", get_filename ());
-+  fwrite (content, sz, 1, out);
-+  fclose (out);
-+}
-+
- /* Avoid introducing locale-specific differences in the results
-    by hardcoding open_quote and close_quote.  */
- 
-diff --git a/gcc/selftest.h b/gcc/selftest.h
---- a/gcc/selftest.h	2021-07-27 23:55:07.500290315 -0700
-+++ b/gcc/selftest.h	2021-12-14 01:16:01.557942991 -0800
-@@ -112,6 +112,8 @@ class temp_source_file : public named_te
-  public:
-   temp_source_file (const location &loc, const char *suffix,
- 		    const char *content);
-+  temp_source_file (const location &loc, const char *suffix,
-+		    const char *content, size_t sz);
- };
- 
- /* RAII-style class for avoiding introducing locale-specific differences
-diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c b/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c
---- a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c	2021-07-27 23:55:07.596291654 -0700
-+++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c	2021-12-14 01:16:01.557942991 -0800
-@@ -9,6 +9,7 @@
- 
- /* { dg-regexp "\"kind\": \"error\"" } */
- /* { dg-regexp "\"column-origin\": 1" } */
-+/* { dg-regexp "\"escape-source\": false" } */
- /* { dg-regexp "\"message\": \"#error message\"" } */
- 
- /* { dg-regexp "\"caret\": \{" } */
-diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c b/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c
---- a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c	2021-07-27 23:55:07.596291654 -0700
-+++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c	2021-12-14 01:16:01.557942991 -0800
-@@ -9,6 +9,7 @@
- 
- /* { dg-regexp "\"kind\": \"warning\"" } */
- /* { dg-regexp "\"column-origin\": 1" } */
-+/* { dg-regexp "\"escape-source\": false" } */
- /* { dg-regexp "\"message\": \"#warning message\"" } */
- /* { dg-regexp "\"option\": \"-Wcpp\"" } */
- /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
-diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c b/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c
---- a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c	2021-07-27 23:55:07.596291654 -0700
-+++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c	2021-12-14 01:16:01.557942991 -0800
-@@ -9,6 +9,7 @@
- 
- /* { dg-regexp "\"kind\": \"error\"" } */
- /* { dg-regexp "\"column-origin\": 1" } */
-+/* { dg-regexp "\"escape-source\": false" } */
- /* { dg-regexp "\"message\": \"#warning message\"" } */
- /* { dg-regexp "\"option\": \"-Werror=cpp\"" } */
- /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
-diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c b/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c
---- a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c	2021-07-27 23:55:07.596291654 -0700
-+++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c	2021-12-14 01:16:01.557942991 -0800
-@@ -19,6 +19,7 @@ int test (void)
- 
- /* { dg-regexp "\"kind\": \"note\"" } */
- /* { dg-regexp "\"message\": \"...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'\"" } */
-+/* { dg-regexp "\"escape-source\": false" } */
- 
- /* { dg-regexp "\"caret\": \{" } */
- /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-4.c\"" } */
-@@ -39,6 +40,7 @@ int test (void)
- /* { dg-regexp "\"kind\": \"warning\"" } */
- /* { dg-regexp "\"column-origin\": 1" } */
- /* { dg-regexp "\"message\": \"this 'if' clause does not guard...\"" } */
-+/* { dg-regexp "\"escape-source\": false" } */
- /* { dg-regexp "\"option\": \"-Wmisleading-indentation\"" } */
- /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wmisleading-indentation\"" } */
- 
-diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c b/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c
---- a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c	2021-07-27 23:55:07.596291654 -0700
-+++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c	2021-12-14 01:16:01.557942991 -0800
-@@ -14,6 +14,7 @@ int test (struct s *ptr)
- 
- /* { dg-regexp "\"kind\": \"error\"" } */
- /* { dg-regexp "\"column-origin\": 1" } */
-+/* { dg-regexp "\"escape-source\": false" } */
- /* { dg-regexp "\"message\": \".*\"" } */
- 
- /* Verify fix-it hints.  */
-diff --git a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c
---- a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c	1969-12-31 16:00:00.000000000 -0800
-+++ b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c	2021-12-14 01:16:01.557942991 -0800
-@@ -0,0 +1,21 @@
-+// { dg-do preprocess }
-+// { dg-options "-std=gnu99 -Werror=normalized=nfc -fdiagnostics-show-caret -fdiagnostics-escape-format=bytes" }
-+/* { dg-message "some warnings being treated as errors" "" {target "*-*-*"} 0 } */
-+
-+/* à½ = U+0F43 TIBETAN LETTER GHA, which has decomposition "0F42 0FB7" i.e.
-+   U+0F42 TIBETAN LETTER GA: à½
-+   U+0FB7 TIBETAN SUBJOINED LETTER HA: à¾·
-+
-+   The UTF-8 encoding of U+0F43 TIBETAN LETTER GHA is: E0 BD 83.  */
-+
-+foo before_\u0F43_after bar // { dg-error "`before_.U00000f43_after' is not in NFC .-Werror=normalized=." }
-+/* { dg-begin-multiline-output "" }
-+ foo before_\u0F43_after bar
-+     ^~~~~~~~~~~~~~~~~~~
-+   { dg-end-multiline-output "" } */
-+
-+foo before_à½_after bar // { dg-error "`before_.U00000f43_after' is not in NFC .-Werror=normalized=." }
-+/* { dg-begin-multiline-output "" }
-+ foo before_<e0><bd><83>_after bar
-+     ^~~~~~~~~~~~~~~~~~~~~~~~~
-+   { dg-end-multiline-output "" } */
-diff --git a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c
---- a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c	1969-12-31 16:00:00.000000000 -0800
-+++ b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c	2021-12-14 01:16:01.557942991 -0800
-@@ -0,0 +1,19 @@
-+// { dg-do preprocess }
-+// { dg-options "-std=gnu99 -Werror=normalized=nfc -fdiagnostics-show-caret -fdiagnostics-escape-format=unicode" }
-+/* { dg-message "some warnings being treated as errors" "" {target "*-*-*"} 0 } */
-+
-+/* à½ = U+0F43 TIBETAN LETTER GHA, which has decomposition "0F42 0FB7" i.e.
-+   U+0F42 TIBETAN LETTER GA: à½
-+   U+0FB7 TIBETAN SUBJOINED LETTER HA: à¾·  */
-+
-+foo before_\u0F43_after bar  // { dg-error "`before_.U00000f43_after' is not in NFC .-Werror=normalized=." }
-+/* { dg-begin-multiline-output "" }
-+ foo before_\u0F43_after bar
-+     ^~~~~~~~~~~~~~~~~~~
-+   { dg-end-multiline-output "" } */
-+
-+foo before_à½_after bar // { dg-error "`before_.U00000f43_after' is not in NFC .-Werror=normalized=." }
-+/* { dg-begin-multiline-output "" }
-+ foo before_<U+0F43>_after bar
-+     ^~~~~~~~~~~~~~~~~~~~~
-+   { dg-end-multiline-output "" } */
-diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90 b/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90
---- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90	2021-07-27 23:55:08.472303878 -0700
-+++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90	2021-12-14 01:16:01.557942991 -0800
-@@ -9,6 +9,7 @@
- 
- ! { dg-regexp "\"kind\": \"error\"" }
- ! { dg-regexp "\"column-origin\": 1" }
-+! { dg-regexp "\"escape-source\": false" }
- ! { dg-regexp "\"message\": \"#error message\"" }
- 
- ! { dg-regexp "\"caret\": \{" }
-diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90 b/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90
---- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90	2021-07-27 23:55:08.472303878 -0700
-+++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90	2021-12-14 01:16:01.557942991 -0800
-@@ -9,6 +9,7 @@
- 
- ! { dg-regexp "\"kind\": \"warning\"" }
- ! { dg-regexp "\"column-origin\": 1" }
-+! { dg-regexp "\"escape-source\": false" }
- ! { dg-regexp "\"message\": \"#warning message\"" }
- ! { dg-regexp "\"option\": \"-Wcpp\"" }
- ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
-diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90 b/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90
---- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90	2021-07-27 23:55:08.472303878 -0700
-+++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90	2021-12-14 01:16:01.557942991 -0800
-@@ -9,6 +9,7 @@
- 
- ! { dg-regexp "\"kind\": \"error\"" }
- ! { dg-regexp "\"column-origin\": 1" }
-+! { dg-regexp "\"escape-source\": false" }
- ! { dg-regexp "\"message\": \"#warning message\"" }
- ! { dg-regexp "\"option\": \"-Werror=cpp\"" }
- ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
-diff --git a/libcpp/charset.c b/libcpp/charset.c
---- a/libcpp/charset.c	2021-07-27 23:55:08.712307227 -0700
-+++ b/libcpp/charset.c	2021-12-14 01:16:01.557942991 -0800
-@@ -1552,12 +1552,14 @@ convert_escape (cpp_reader *pfile, const
- 		   "unknown escape sequence: '\\%c'", (int) c);
-       else
- 	{
-+	  encoding_rich_location rich_loc (pfile);
-+
- 	  /* diagnostic.c does not support "%03o".  When it does, this
- 	     code can use %03o directly in the diagnostic again.  */
- 	  char buf[32];
- 	  sprintf(buf, "%03o", (int) c);
--	  cpp_error (pfile, CPP_DL_PEDWARN,
--		     "unknown escape sequence: '\\%s'", buf);
-+	  cpp_error_at (pfile, CPP_DL_PEDWARN, &rich_loc,
-+			"unknown escape sequence: '\\%s'", buf);
- 	}
-     }
- 
-@@ -2280,14 +2282,16 @@ cpp_string_location_reader::get_next ()
- }
- 
- cpp_display_width_computation::
--cpp_display_width_computation (const char *data, int data_length, int tabstop) :
-+cpp_display_width_computation (const char *data, int data_length,
-+			       const cpp_char_column_policy &policy) :
-   m_begin (data),
-   m_next (m_begin),
-   m_bytes_left (data_length),
--  m_tabstop (tabstop),
-+  m_policy (policy),
-   m_display_cols (0)
- {
--  gcc_assert (m_tabstop > 0);
-+  gcc_assert (policy.m_tabstop > 0);
-+  gcc_assert (policy.m_width_cb);
- }
- 
- 
-@@ -2299,19 +2303,28 @@ cpp_display_width_computation (const cha
-    point to a valid UTF-8-encoded sequence, then it will be treated as a single
-    byte with display width 1.  m_cur_display_col is the current display column,
-    relative to which tab stops should be expanded.  Returns the display width of
--   the codepoint just processed.  */
-+   the codepoint just processed.
-+   If OUT is non-NULL, it is populated.  */
- 
- int
--cpp_display_width_computation::process_next_codepoint ()
-+cpp_display_width_computation::process_next_codepoint (cpp_decoded_char *out)
- {
-   cppchar_t c;
-   int next_width;
- 
-+  if (out)
-+    out->m_start_byte = m_next;
-+
-   if (*m_next == '\t')
-     {
-       ++m_next;
-       --m_bytes_left;
--      next_width = m_tabstop - (m_display_cols % m_tabstop);
-+      next_width = m_policy.m_tabstop - (m_display_cols % m_policy.m_tabstop);
-+      if (out)
-+	{
-+	  out->m_ch = '\t';
-+	  out->m_valid_ch = true;
-+	}
-     }
-   else if (one_utf8_to_cppchar ((const uchar **) &m_next, &m_bytes_left, &c)
- 	   != 0)
-@@ -2321,14 +2334,24 @@ cpp_display_width_computation::process_n
- 	 of one.  */
-       ++m_next;
-       --m_bytes_left;
--      next_width = 1;
-+      next_width = m_policy.m_undecoded_byte_width;
-+      if (out)
-+	out->m_valid_ch = false;
-     }
-   else
-     {
-       /*  one_utf8_to_cppchar() has updated m_next and m_bytes_left for us.  */
--      next_width = cpp_wcwidth (c);
-+      next_width = m_policy.m_width_cb (c);
-+      if (out)
-+	{
-+	  out->m_ch = c;
-+	  out->m_valid_ch = true;
-+	}
-     }
- 
-+  if (out)
-+    out->m_next_byte = m_next;
-+
-   m_display_cols += next_width;
-   return next_width;
- }
-@@ -2344,7 +2367,7 @@ cpp_display_width_computation::advance_d
-   const int start = m_display_cols;
-   const int target = start + n;
-   while (m_display_cols < target && !done ())
--    process_next_codepoint ();
-+    process_next_codepoint (NULL);
-   return m_display_cols - start;
- }
- 
-@@ -2352,29 +2375,33 @@ cpp_display_width_computation::advance_d
-     how many display columns are occupied by the first COLUMN bytes.  COLUMN
-     may exceed DATA_LENGTH, in which case the phantom bytes at the end are
-     treated as if they have display width 1.  Tabs are expanded to the next tab
--    stop, relative to the start of DATA.  */
-+    stop, relative to the start of DATA, and non-printable-ASCII characters
-+    will be escaped as per POLICY.  */
- 
- int
- cpp_byte_column_to_display_column (const char *data, int data_length,
--				   int column, int tabstop)
-+				   int column,
-+				   const cpp_char_column_policy &policy)
- {
-   const int offset = MAX (0, column - data_length);
--  cpp_display_width_computation dw (data, column - offset, tabstop);
-+  cpp_display_width_computation dw (data, column - offset, policy);
-   while (!dw.done ())
--    dw.process_next_codepoint ();
-+    dw.process_next_codepoint (NULL);
-   return dw.display_cols_processed () + offset;
- }
- 
- /*  For the string of length DATA_LENGTH bytes that begins at DATA, compute
-     the least number of bytes that will result in at least DISPLAY_COL display
-     columns.  The return value may exceed DATA_LENGTH if the entire string does
--    not occupy enough display columns.  */
-+    not occupy enough display columns.  Non-printable-ASCII characters
-+    will be escaped as per POLICY.  */
- 
- int
- cpp_display_column_to_byte_column (const char *data, int data_length,
--				   int display_col, int tabstop)
-+				   int display_col,
-+				   const cpp_char_column_policy &policy)
- {
--  cpp_display_width_computation dw (data, data_length, tabstop);
-+  cpp_display_width_computation dw (data, data_length, policy);
-   const int avail_display = dw.advance_display_cols (display_col);
-   return dw.bytes_processed () + MAX (0, display_col - avail_display);
- }
-diff --git a/libcpp/errors.c b/libcpp/errors.c
---- a/libcpp/errors.c	2021-07-27 23:55:08.712307227 -0700
-+++ b/libcpp/errors.c	2021-12-14 01:16:01.557942991 -0800
-@@ -27,6 +27,31 @@ along with this program; see the file CO
- #include "cpplib.h"
- #include "internal.h"
- 
-+/* Get a location_t for the current location in PFILE,
-+   generally that of the previously lexed token.  */
-+
-+location_t
-+cpp_diagnostic_get_current_location (cpp_reader *pfile)
-+{
-+  if (CPP_OPTION (pfile, traditional))
-+    {
-+      if (pfile->state.in_directive)
-+	return pfile->directive_line;
-+      else
-+	return pfile->line_table->highest_line;
-+    }
-+  /* We don't want to refer to a token before the beginning of the
-+     current run -- that is invalid.  */
-+  else if (pfile->cur_token == pfile->cur_run->base)
-+    {
-+      return 0;
-+    }
-+  else
-+    {
-+      return pfile->cur_token[-1].src_loc;
-+    }
-+}
-+
- /* Print a diagnostic at the given location.  */
- 
- ATTRIBUTE_FPTR_PRINTF(5,0)
-@@ -52,25 +77,7 @@ cpp_diagnostic (cpp_reader * pfile, enum
- 		enum cpp_warning_reason reason,
- 		const char *msgid, va_list *ap)
- {
--  location_t src_loc;
--
--  if (CPP_OPTION (pfile, traditional))
--    {
--      if (pfile->state.in_directive)
--	src_loc = pfile->directive_line;
--      else
--	src_loc = pfile->line_table->highest_line;
--    }
--  /* We don't want to refer to a token before the beginning of the
--     current run -- that is invalid.  */
--  else if (pfile->cur_token == pfile->cur_run->base)
--    {
--      src_loc = 0;
--    }
--  else
--    {
--      src_loc = pfile->cur_token[-1].src_loc;
--    }
-+  location_t src_loc = cpp_diagnostic_get_current_location (pfile);
-   rich_location richloc (pfile->line_table, src_loc);
-   return cpp_diagnostic_at (pfile, level, reason, &richloc, msgid, ap);
- }
-@@ -142,6 +149,43 @@ cpp_warning_syshdr (cpp_reader * pfile,
- 
-   va_end (ap);
-   return ret;
-+}
-+
-+/* As cpp_warning above, but use RICHLOC as the location of the diagnostic.  */
-+
-+bool cpp_warning_at (cpp_reader *pfile, enum cpp_warning_reason reason,
-+		     rich_location *richloc, const char *msgid, ...)
-+{
-+  va_list ap;
-+  bool ret;
-+
-+  va_start (ap, msgid);
-+
-+  ret = cpp_diagnostic_at (pfile, CPP_DL_WARNING, reason, richloc,
-+			   msgid, &ap);
-+
-+  va_end (ap);
-+  return ret;
-+
-+}
-+
-+/* As cpp_pedwarning above, but use RICHLOC as the location of the
-+   diagnostic.  */
-+
-+bool
-+cpp_pedwarning_at (cpp_reader * pfile, enum cpp_warning_reason reason,
-+		   rich_location *richloc, const char *msgid, ...)
-+{
-+  va_list ap;
-+  bool ret;
-+
-+  va_start (ap, msgid);
-+
-+  ret = cpp_diagnostic_at (pfile, CPP_DL_PEDWARN, reason, richloc,
-+			   msgid, &ap);
-+
-+  va_end (ap);
-+  return ret;
- }
- 
- /* Print a diagnostic at a specific location.  */
-diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
---- a/libcpp/include/cpplib.h	2021-12-13 23:23:05.768437079 -0800
-+++ b/libcpp/include/cpplib.h	2021-12-14 01:20:16.189507386 -0800
-@@ -1275,6 +1275,14 @@ extern bool cpp_warning_syshdr (cpp_read
- 				const char *msgid, ...)
-   ATTRIBUTE_PRINTF_3;
- 
-+/* As their counterparts above, but use RICHLOC.  */
-+extern bool cpp_warning_at (cpp_reader *, enum cpp_warning_reason,
-+			    rich_location *richloc, const char *msgid, ...)
-+  ATTRIBUTE_PRINTF_4;
-+extern bool cpp_pedwarning_at (cpp_reader *, enum cpp_warning_reason,
-+			       rich_location *richloc, const char *msgid, ...)
-+  ATTRIBUTE_PRINTF_4;
-+
- /* Output a diagnostic with "MSGID: " preceding the
-    error string of errno.  No location is printed.  */
- extern bool cpp_errno (cpp_reader *, enum cpp_diagnostic_level,
-@@ -1435,42 +1443,95 @@ extern const char * cpp_get_userdef_suff
- 
- /* In charset.c */
- 
-+/* The result of attempting to decode a run of UTF-8 bytes.  */
-+
-+struct cpp_decoded_char
-+{
-+  const char *m_start_byte;
-+  const char *m_next_byte;
-+
-+  bool m_valid_ch;
-+  cppchar_t m_ch;
-+};
-+
-+/* Information for mapping between code points and display columns.
-+
-+   This is a tabstop value, along with a callback for getting the
-+   widths of characters.  Normally this callback is cpp_wcwidth, but we
-+   support other schemes for escaping non-ASCII unicode as a series of
-+   ASCII chars when printing the user's source code in diagnostic-show-locus.c
-+
-+   For example, consider:
-+   - the Unicode character U+03C0 "GREEK SMALL LETTER PI" (UTF-8: 0xCF 0x80)
-+   - the Unicode character U+1F642 "SLIGHTLY SMILING FACE"
-+     (UTF-8: 0xF0 0x9F 0x99 0x82)
-+   - the byte 0xBF (a stray trailing byte of a UTF-8 character)
-+   Normally U+03C0 would occupy one display column, U+1F642
-+   would occupy two display columns, and the stray byte would be
-+   printed verbatim as one display column.
-+
-+   However when escaping them as unicode code points as "<U+03C0>"
-+   and "<U+1F642>" they occupy 8 and 9 display columns respectively,
-+   and when escaping them as bytes as "<CF><80>" and "<F0><9F><99><82>"
-+   they occupy 8 and 16 display columns respectively.  In both cases
-+   the stray byte is escaped to <BF> as 4 display columns.  */
-+
-+struct cpp_char_column_policy
-+{
-+  cpp_char_column_policy (int tabstop,
-+			  int (*width_cb) (cppchar_t c))
-+  : m_tabstop (tabstop),
-+    m_undecoded_byte_width (1),
-+    m_width_cb (width_cb)
-+  {}
-+
-+  int m_tabstop;
-+  /* Width in display columns of a stray byte that isn't decodable
-+     as UTF-8.  */
-+  int m_undecoded_byte_width;
-+  int (*m_width_cb) (cppchar_t c);
-+};
-+
- /* A class to manage the state while converting a UTF-8 sequence to cppchar_t
-    and computing the display width one character at a time.  */
- class cpp_display_width_computation {
-  public:
-   cpp_display_width_computation (const char *data, int data_length,
--				 int tabstop);
-+				 const cpp_char_column_policy &policy);
-   const char *next_byte () const { return m_next; }
-   int bytes_processed () const { return m_next - m_begin; }
-   int bytes_left () const { return m_bytes_left; }
-   bool done () const { return !bytes_left (); }
-   int display_cols_processed () const { return m_display_cols; }
- 
--  int process_next_codepoint ();
-+  int process_next_codepoint (cpp_decoded_char *out);
-   int advance_display_cols (int n);
- 
-  private:
-   const char *const m_begin;
-   const char *m_next;
-   size_t m_bytes_left;
--  const int m_tabstop;
-+  const cpp_char_column_policy &m_policy;
-   int m_display_cols;
- };
- 
- /* Convenience functions that are simple use cases for class
-    cpp_display_width_computation.  Tab characters will be expanded to spaces
--   as determined by TABSTOP.  */
-+   as determined by POLICY.m_tabstop, and non-printable-ASCII characters
-+   will be escaped as per POLICY.  */
-+
- int cpp_byte_column_to_display_column (const char *data, int data_length,
--				       int column, int tabstop);
-+				       int column,
-+				       const cpp_char_column_policy &policy);
- inline int cpp_display_width (const char *data, int data_length,
--			      int tabstop)
-+			      const cpp_char_column_policy &policy)
- {
-   return cpp_byte_column_to_display_column (data, data_length, data_length,
--					    tabstop);
-+					    policy);
- }
- int cpp_display_column_to_byte_column (const char *data, int data_length,
--				       int display_col, int tabstop);
-+				       int display_col,
-+				       const cpp_char_column_policy &policy);
- int cpp_wcwidth (cppchar_t c);
- 
- #endif /* ! LIBCPP_CPPLIB_H */
-diff --git a/libcpp/include/line-map.h b/libcpp/include/line-map.h
---- a/libcpp/include/line-map.h	2021-07-27 23:55:08.716307283 -0700
-+++ b/libcpp/include/line-map.h	2021-12-14 01:16:01.557942991 -0800
-@@ -1781,6 +1781,18 @@ class rich_location
-   const diagnostic_path *get_path () const { return m_path; }
-   void set_path (const diagnostic_path *path) { m_path = path; }
- 
-+  /* A flag for hinting that the diagnostic involves character encoding
-+     issues, and thus that it will be helpful to the user if we show some
-+     representation of how the characters in the pertinent source lines
-+     are encoded.
-+     The default is false (i.e. do not escape).
-+     When set to true, non-ASCII bytes in the pertinent source lines will
-+     be escaped in a manner controlled by the user-supplied option
-+     -fdiagnostics-escape-format=, so that the user can better understand
-+     what's going on with the encoding in their source file.  */
-+  bool escape_on_output_p () const { return m_escape_on_output; }
-+  void set_escape_on_output (bool flag) { m_escape_on_output = flag; }
-+
- private:
-   bool reject_impossible_fixit (location_t where);
-   void stop_supporting_fixits ();
-@@ -1807,6 +1819,7 @@ protected:
-   bool m_fixits_cannot_be_auto_applied;
- 
-   const diagnostic_path *m_path;
-+  bool m_escape_on_output;
- };
- 
- /* A struct for the result of range_label::get_text: a NUL-terminated buffer
-diff --git a/libcpp/internal.h b/libcpp/internal.h
---- a/libcpp/internal.h	2021-12-13 23:23:05.768437079 -0800
-+++ b/libcpp/internal.h	2021-12-14 01:16:01.557942991 -0800
-@@ -776,6 +776,9 @@ extern void _cpp_do_file_change (cpp_rea
- extern void _cpp_pop_buffer (cpp_reader *);
- extern char *_cpp_bracket_include (cpp_reader *);
- 
-+/* In errors.c  */
-+extern location_t cpp_diagnostic_get_current_location (cpp_reader *);
-+
- /* In traditional.c.  */
- extern bool _cpp_scan_out_logical_line (cpp_reader *, cpp_macro *, bool);
- extern bool _cpp_read_logical_line_trad (cpp_reader *);
-@@ -942,6 +945,26 @@ int linemap_get_expansion_line (class li
- const char* linemap_get_expansion_filename (class line_maps *,
- 					    location_t);
- 
-+/* A subclass of rich_location for emitting a diagnostic
-+   at the current location of the reader, but flagging
-+   it with set_escape_on_output (true).  */
-+class encoding_rich_location : public rich_location
-+{
-+ public:
-+  encoding_rich_location (cpp_reader *pfile)
-+  : rich_location (pfile->line_table,
-+		   cpp_diagnostic_get_current_location (pfile))
-+  {
-+    set_escape_on_output (true);
-+  }
-+
-+  encoding_rich_location (cpp_reader *pfile, location_t loc)
-+  : rich_location (pfile->line_table, loc)
-+  {
-+    set_escape_on_output (true);
-+  }
-+};
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/libcpp/lex.c b/libcpp/lex.c
---- a/libcpp/lex.c	2021-12-14 01:14:48.435225968 -0800
-+++ b/libcpp/lex.c	2021-12-14 01:24:37.220995816 -0800
-@@ -1774,7 +1774,11 @@ skip_whitespace (cpp_reader *pfile, cppc
-   while (is_nvspace (c));
- 
-   if (saw_NUL)
--    cpp_error (pfile, CPP_DL_WARNING, "null character(s) ignored");
-+    {
-+      encoding_rich_location rich_loc (pfile);
-+      cpp_error_at (pfile, CPP_DL_WARNING, &rich_loc,
-+		    "null character(s) ignored");
-+    }
- 
-   buffer->cur--;
- }
-@@ -1803,6 +1807,28 @@ warn_about_normalization (cpp_reader *pf
-   if (CPP_OPTION (pfile, warn_normalize) < NORMALIZE_STATE_RESULT (s)
-       && !pfile->state.skipping)
-     {
-+      location_t loc = token->src_loc;
-+
-+      /* If possible, create a location range for the token.  */
-+      if (loc >= RESERVED_LOCATION_COUNT
-+	  && token->type != CPP_EOF
-+	  /* There must be no line notes to process.  */
-+	  && (!(pfile->buffer->cur
-+		>= pfile->buffer->notes[pfile->buffer->cur_note].pos
-+		&& !pfile->overlaid_buffer)))
-+	{
-+	  source_range tok_range;
-+	  tok_range.m_start = loc;
-+	  tok_range.m_finish
-+	    = linemap_position_for_column (pfile->line_table,
-+					   CPP_BUF_COLUMN (pfile->buffer,
-+							   pfile->buffer->cur));
-+	  loc = COMBINE_LOCATION_DATA (pfile->line_table,
-+				       loc, tok_range, NULL);
-+	}
-+
-+      encoding_rich_location rich_loc (pfile, loc);
-+
-       /* Make sure that the token is printed using UCNs, even
- 	 if we'd otherwise happily print UTF-8.  */
-       unsigned char *buf = XNEWVEC (unsigned char, cpp_token_len (token));
-@@ -1810,11 +1836,11 @@ warn_about_normalization (cpp_reader *pf
- 
-       sz = cpp_spell_token (pfile, token, buf, false) - buf;
-       if (NORMALIZE_STATE_RESULT (s) == normalized_C)
--	cpp_warning_with_line (pfile, CPP_W_NORMALIZE, token->src_loc, 0,
--			       "`%.*s' is not in NFKC", (int) sz, buf);
-+	cpp_warning_at (pfile, CPP_W_NORMALIZE, &rich_loc,
-+			"`%.*s' is not in NFKC", (int) sz, buf);
-       else
--	cpp_warning_with_line (pfile, CPP_W_NORMALIZE, token->src_loc, 0,
--			       "`%.*s' is not in NFC", (int) sz, buf);
-+	cpp_warning_at (pfile, CPP_W_NORMALIZE, &rich_loc,
-+			"`%.*s' is not in NFC", (int) sz, buf);
-       free (buf);
-     }
- }
-diff --git a/libcpp/line-map.c b/libcpp/line-map.c
---- a/libcpp/line-map.c	2021-07-27 23:55:08.716307283 -0700
-+++ b/libcpp/line-map.c	2021-12-14 01:16:01.561942921 -0800
-@@ -2086,7 +2086,8 @@ rich_location::rich_location (line_maps
-   m_fixit_hints (),
-   m_seen_impossible_fixit (false),
-   m_fixits_cannot_be_auto_applied (false),
--  m_path (NULL)
-+  m_path (NULL),
-+  m_escape_on_output (false)
- {
-   add_range (loc, SHOW_RANGE_WITH_CARET, label);
- }
diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch
deleted file mode 100644
index 7b3651c73eb..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From f10bec5ffa487ad3033ed5f38cfd0fc7d696deab Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Mon, 31 Jan 2022 14:28:42 +0000
-Subject: [PATCH] libiberty: Fix infinite recursion in rust demangler.
-
-libiberty/
-	PR demangler/98886
-	PR demangler/99935
-	* rust-demangle.c (struct rust_demangler): Add a recursion
-	counter.
-	(demangle_path): Increment/decrement the recursion counter upon
-	entry and exit.  Fail if the counter exceeds a fixed limit.
-	(demangle_type): Likewise.
-	(rust_demangle_callback): Initialise the recursion counter,
-	disabling if requested by the option flags.
-
-CVE: CVE-2021-46195
-Upstream-Status: Backport
-[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=f10bec5ffa487ad3033ed5f38cfd0fc7d696deab]
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
----
- libiberty/rust-demangle.c | 47 ++++++++++++++++++++++++++++++++++-----
- 1 file changed, 41 insertions(+), 6 deletions(-)
-
-diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
-index 18c760491bd..3b24d63892a 100644
---- a/libiberty/rust-demangle.c
-+++ b/libiberty/rust-demangle.c
-@@ -74,6 +74,12 @@ struct rust_demangler
-   /* Rust mangling version, with legacy mangling being -1. */
-   int version;
- 
-+  /* Recursion depth.  */
-+  unsigned int recursion;
-+  /* Maximum number of times demangle_path may be called recursively.  */
-+#define RUST_MAX_RECURSION_COUNT  1024
-+#define RUST_NO_RECURSION_LIMIT   ((unsigned int) -1)
-+
-   uint64_t bound_lifetime_depth;
- };
- 
-@@ -671,6 +677,15 @@ demangle_path (struct rust_demangler *rdm, int in_value)
-   if (rdm->errored)
-     return;
- 
-+  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
-+    {
-+      ++ rdm->recursion;
-+      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
-+	/* FIXME: There ought to be a way to report
-+	   that the recursion limit has been reached.  */
-+	goto fail_return;
-+    }
-+
-   switch (tag = next (rdm))
-     {
-     case 'C':
-@@ -688,10 +703,7 @@ demangle_path (struct rust_demangler *rdm, int in_value)
-     case 'N':
-       ns = next (rdm);
-       if (!ISLOWER (ns) && !ISUPPER (ns))
--        {
--          rdm->errored = 1;
--          return;
--        }
-+	goto fail_return;
- 
-       demangle_path (rdm, in_value);
- 
-@@ -776,9 +788,15 @@ demangle_path (struct rust_demangler *rdm, int in_value)
-         }
-       break;
-     default:
--      rdm->errored = 1;
--      return;
-+      goto fail_return;
-     }
-+  goto pass_return;
-+
-+ fail_return:
-+  rdm->errored = 1;
-+ pass_return:
-+  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
-+    -- rdm->recursion;
- }
- 
- static void
-@@ -870,6 +888,19 @@ demangle_type (struct rust_demangler *rdm)
-       return;
-     }
- 
-+   if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
-+    {
-+      ++ rdm->recursion;
-+      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
-+	/* FIXME: There ought to be a way to report
-+	   that the recursion limit has been reached.  */
-+	{
-+	  rdm->errored = 1;
-+	  -- rdm->recursion;
-+	  return;
-+	}
-+    }
-+
-   switch (tag)
-     {
-     case 'R':
-@@ -1030,6 +1061,9 @@ demangle_type (struct rust_demangler *rdm)
-       rdm->next--;
-       demangle_path (rdm, 0);
-     }
-+
-+  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
-+    -- rdm->recursion;
- }
- 
- /* A trait in a trait object may have some "existential projections"
-@@ -1320,6 +1354,7 @@ rust_demangle_callback (const char *mangled, int options,
-   rdm.skipping_printing = 0;
-   rdm.verbose = (options & DMGL_VERBOSE) != 0;
-   rdm.version = 0;
-+  rdm.recursion = (options & DMGL_NO_RECURSE_LIMIT) ? RUST_NO_RECURSION_LIMIT : 0;
-   rdm.bound_lifetime_depth = 0;
- 
-   /* Rust symbols always start with _R (v0) or _ZN (legacy). */
--- 
-2.27.0
-
diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 0bf8834bb25..66e582ca989 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 6badb97389cae4ff9a533d38dc7cceefe21b97a8 Mon Sep 17 00:00:00 2001
+From 31f94ef5b43a984a98f0eebd2dcf1b53aa1d7bce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index e218a19e333..45744e6e471 100755
+index 5dcaab14ae9..f76310a36bb 100755
 --- a/configure
 +++ b/configure
-@@ -9750,7 +9750,7 @@ fi
+@@ -10165,7 +10165,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index e218a19e333..45744e6e471 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index 7e8e628b325..bf66b51373c 100644
+index 85977482aee..8b9097c7a45 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3255,7 +3255,7 @@ fi
+@@ -3346,7 +3346,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
deleted file mode 100644
index 9bad81d4d04..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
+++ /dev/null
@@ -1,1765 +0,0 @@
-From 51c500269bf53749b107807d84271385fad35628 Mon Sep 17 00:00:00 2001
-From: Marek Polacek <polacek@redhat.com>
-Date: Wed, 6 Oct 2021 14:33:59 -0400
-Subject: [PATCH] libcpp: Implement -Wbidi-chars for CVE-2021-42574 [PR103026]
-
-From a link below:
-"An issue was discovered in the Bidirectional Algorithm in the Unicode
-Specification through 14.0. It permits the visual reordering of
-characters via control sequences, which can be used to craft source code
-that renders different logic than the logical ordering of tokens
-ingested by compilers and interpreters. Adversaries can leverage this to
-encode source code for compilers accepting Unicode such that targeted
-vulnerabilities are introduced invisibly to human reviewers."
-
-More info:
-https://nvd.nist.gov/vuln/detail/CVE-2021-42574
-https://trojansource.codes/
-
-This is not a compiler bug.  However, to mitigate the problem, this patch
-implements -Wbidi-chars=[none|unpaired|any] to warn about possibly
-misleading Unicode bidirectional control characters the preprocessor may
-encounter.
-
-The default is =unpaired, which warns about improperly terminated
-bidirectional control characters; e.g. a LRE without its corresponding PDF.
-The level =any warns about any use of bidirectional control characters.
-
-This patch handles both UCNs and UTF-8 characters.  UCNs designating
-bidi characters in identifiers are accepted since r204886.  Then r217144
-enabled -fextended-identifiers by default.  Extended characters in C/C++
-identifiers have been accepted since r275979.  However, this patch still
-warns about mixing UTF-8 and UCN bidi characters; there seems to be no
-good reason to allow mixing them.
-
-We warn in different contexts: comments (both C and C++-style), string
-literals, character constants, and identifiers.  Expectedly, UCNs are ignored
-in comments and raw string literals.  The bidirectional control characters
-can nest so this patch handles that as well.
-
-I have not included nor tested this at all with Fortran (which also has
-string literals and line comments).
-
-Dave M. posted patches improving diagnostic involving Unicode characters.
-This patch does not make use of this new infrastructure yet.
-
-	PR preprocessor/103026
-
-gcc/c-family/ChangeLog:
-
-	* c.opt (Wbidi-chars, Wbidi-chars=): New option.
-
-gcc/ChangeLog:
-
-	* doc/invoke.texi: Document -Wbidi-chars.
-
-libcpp/ChangeLog:
-
-	* include/cpplib.h (enum cpp_bidirectional_level): New.
-	(struct cpp_options): Add cpp_warn_bidirectional.
-	(enum cpp_warning_reason): Add CPP_W_BIDIRECTIONAL.
-	* internal.h (struct cpp_reader): Add warn_bidi_p member
-	function.
-	* init.c (cpp_create_reader): Set cpp_warn_bidirectional.
-	* lex.c (bidi): New namespace.
-	(get_bidi_utf8): New function.
-	(get_bidi_ucn): Likewise.
-	(maybe_warn_bidi_on_close): Likewise.
-	(maybe_warn_bidi_on_char): Likewise.
-	(_cpp_skip_block_comment): Implement warning about bidirectional
-	control characters.
-	(skip_line_comment): Likewise.
-	(forms_identifier_p): Likewise.
-	(lex_identifier): Likewise.
-	(lex_string): Likewise.
-	(lex_raw_string): Likewise.
-
-gcc/testsuite/ChangeLog:
-
-	* c-c++-common/Wbidi-chars-1.c: New test.
-	* c-c++-common/Wbidi-chars-2.c: New test.
-	* c-c++-common/Wbidi-chars-3.c: New test.
-	* c-c++-common/Wbidi-chars-4.c: New test.
-	* c-c++-common/Wbidi-chars-5.c: New test.
-	* c-c++-common/Wbidi-chars-6.c: New test.
-	* c-c++-common/Wbidi-chars-7.c: New test.
-	* c-c++-common/Wbidi-chars-8.c: New test.
-	* c-c++-common/Wbidi-chars-9.c: New test.
-	* c-c++-common/Wbidi-chars-10.c: New test.
-	* c-c++-common/Wbidi-chars-11.c: New test.
-	* c-c++-common/Wbidi-chars-12.c: New test.
-	* c-c++-common/Wbidi-chars-13.c: New test.
-	* c-c++-common/Wbidi-chars-14.c: New test.
-	* c-c++-common/Wbidi-chars-15.c: New test.
-	* c-c++-common/Wbidi-chars-16.c: New test.
-	* c-c++-common/Wbidi-chars-17.c: New test.
-
-CVE: CVE-2021-42574
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=51c500269bf53749b107807d84271385fad35628]
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
-
----
- gcc/c-family/c.opt                          |  24 ++
- gcc/doc/invoke.texi                         |  21 +-
- gcc/testsuite/c-c++-common/Wbidi-chars-1.c  |  12 +
- gcc/testsuite/c-c++-common/Wbidi-chars-10.c |  27 ++
- gcc/testsuite/c-c++-common/Wbidi-chars-11.c |  13 +
- gcc/testsuite/c-c++-common/Wbidi-chars-12.c |  19 +
- gcc/testsuite/c-c++-common/Wbidi-chars-13.c |  17 +
- gcc/testsuite/c-c++-common/Wbidi-chars-14.c |  38 ++
- gcc/testsuite/c-c++-common/Wbidi-chars-15.c |  59 +++
- gcc/testsuite/c-c++-common/Wbidi-chars-16.c |  26 ++
- gcc/testsuite/c-c++-common/Wbidi-chars-17.c |  30 ++
- gcc/testsuite/c-c++-common/Wbidi-chars-2.c  |   9 +
- gcc/testsuite/c-c++-common/Wbidi-chars-3.c  |  11 +
- gcc/testsuite/c-c++-common/Wbidi-chars-4.c  | 188 +++++++++
- gcc/testsuite/c-c++-common/Wbidi-chars-5.c  | 188 +++++++++
- gcc/testsuite/c-c++-common/Wbidi-chars-6.c  | 155 ++++++++
- gcc/testsuite/c-c++-common/Wbidi-chars-7.c  |   9 +
- gcc/testsuite/c-c++-common/Wbidi-chars-8.c  |  13 +
- gcc/testsuite/c-c++-common/Wbidi-chars-9.c  |  29 ++
- libcpp/include/cpplib.h                     |  18 +-
- libcpp/init.c                               |   1 +
- libcpp/internal.h                           |   7 +
- libcpp/lex.c                                | 408 +++++++++++++++++++-
- 23 files changed, 1315 insertions(+), 7 deletions(-)
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-1.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-10.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-11.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-12.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-13.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-14.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-15.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-16.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-17.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-2.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-3.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-4.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-5.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-6.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-7.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-8.c
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-9.c
-
-diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
-index 8a4cd634f77..3976fc368db 100644
---- a/gcc/c-family/c.opt
-+++ b/gcc/c-family/c.opt
-@@ -370,6 +370,30 @@ Wbad-function-cast
- C ObjC Var(warn_bad_function_cast) Warning
- Warn about casting functions to incompatible types.
- 
-+Wbidi-chars
-+C ObjC C++ ObjC++ Warning Alias(Wbidi-chars=,any,none)
-+;
-+
-+Wbidi-chars=
-+C ObjC C++ ObjC++ RejectNegative Joined Warning CPP(cpp_warn_bidirectional) CppReason(CPP_W_BIDIRECTIONAL) Var(warn_bidirectional) Init(bidirectional_unpaired) Enum(cpp_bidirectional_level)
-+-Wbidi-chars=[none|unpaired|any] Warn about UTF-8 bidirectional control characters.
-+
-+; Required for these enum values.
-+SourceInclude
-+cpplib.h
-+
-+Enum
-+Name(cpp_bidirectional_level) Type(int) UnknownError(argument %qs to %<-Wbidi-chars%> not recognized)
-+
-+EnumValue
-+Enum(cpp_bidirectional_level) String(none) Value(bidirectional_none)
-+
-+EnumValue
-+Enum(cpp_bidirectional_level) String(unpaired) Value(bidirectional_unpaired)
-+
-+EnumValue
-+Enum(cpp_bidirectional_level) String(any) Value(bidirectional_any)
-+
- Wbool-compare
- C ObjC C++ ObjC++ Var(warn_bool_compare) Warning LangEnabledBy(C ObjC C++ ObjC++,Wall)
- Warn about boolean expression compared with an integer value different from true/false.
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 6070288856c..a22758d18ee 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -326,7 +326,9 @@ Objective-C and Objective-C++ Dialects}.
- -Warith-conversion @gol
- -Warray-bounds  -Warray-bounds=@var{n} @gol
- -Wno-attributes  -Wattribute-alias=@var{n} -Wno-attribute-alias @gol
---Wno-attribute-warning  -Wbool-compare  -Wbool-operation @gol
-+-Wno-attribute-warning  @gol
-+-Wbidi-chars=@r{[}none@r{|}unpaired@r{|}any@r{]} @gol
-+-Wbool-compare  -Wbool-operation @gol
- -Wno-builtin-declaration-mismatch @gol
- -Wno-builtin-macro-redefined  -Wc90-c99-compat  -Wc99-c11-compat @gol
- -Wc11-c2x-compat @gol
-@@ -7559,6 +7561,23 @@ Attributes considered include @code{allo
- This is the default.  You can disable these warnings with either
- @option{-Wno-attribute-alias} or @option{-Wattribute-alias=0}.
- 
-+@item -Wbidi-chars=@r{[}none@r{|}unpaired@r{|}any@r{]}
-+@opindex Wbidi-chars=
-+@opindex Wbidi-chars
-+@opindex Wno-bidi-chars
-+Warn about possibly misleading UTF-8 bidirectional control characters in
-+comments, string literals, character constants, and identifiers.  Such
-+characters can change left-to-right writing direction into right-to-left
-+(and vice versa), which can cause confusion between the logical order and
-+visual order.  This may be dangerous; for instance, it may seem that a piece
-+of code is not commented out, whereas it in fact is.
-+
-+There are three levels of warning supported by GCC@.  The default is
-+@option{-Wbidi-chars=unpaired}, which warns about improperly terminated
-+bidi contexts.  @option{-Wbidi-chars=none} turns the warning off.
-+@option{-Wbidi-chars=any} warns about any use of bidirectional control
-+characters.
-+
- @item -Wbool-compare
- @opindex Wno-bool-compare
- @opindex Wbool-compare
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-10.c b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c
-new file mode 100644
-index 00000000000..34f5ac19271
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c
-@@ -0,0 +1,27 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=unpaired" } */
-+/* More nesting testing.  */
-+
-+/* RLEâ« LRIâ¦ PDFâ¬ PDIâ©*/
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int LRE_\u202a_PDF_\u202c;
-+int LRE_\u202a_PDF_\u202c_LRE_\u202a_PDF_\u202c;
-+int LRE_\u202a_LRI_\u2066_PDF_\u202c_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int RLE_\u202b_RLI_\u2067_PDF_\u202c_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int RLE_\u202b_RLI_\u2067_PDI_\u2069_PDF_\u202c;
-+int FSI_\u2068_LRO_\u202d_PDI_\u2069_PDF_\u202c;
-+int FSI_\u2068;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int FSI_\u2068_PDI_\u2069;
-+int FSI_\u2068_FSI_\u2068_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069;
-+int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDF_\u202c;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_FSI_\u2068_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-11.c b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c
-new file mode 100644
-index 00000000000..270ce2368a9
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c
-@@ -0,0 +1,13 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=unpaired" } */
-+/* Test that we warn when mixing UCN and UTF-8.  */
-+
-+int LRE_âª_PDF_\u202c;
-+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
-+int LRE_\u202a_PDF_â¬_;
-+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
-+const char *s1 = "LRE_âª_PDF_\u202c";
-+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
-+const char *s2 = "LRE_\u202a_PDF_â¬";
-+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-12.c b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c
-new file mode 100644
-index 00000000000..b07eec1da91
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c
-@@ -0,0 +1,19 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile { target { c || c++11 } } } */
-+/* { dg-options "-Wbidi-chars=any" } */
-+/* Test raw strings.  */
-+
-+const char *s1 = R"(a b c LREâª 1 2 3 PDFâ¬ x y z)";
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+const char *s2 = R"(a b c RLEâ« 1 2 3 PDFâ¬ x y z)";
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+const char *s3 = R"(a b c LROâ­ 1 2 3 PDFâ¬ x y z)";
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+const char *s4 = R"(a b c RLOâ® 1 2 3 PDFâ¬ x y z)";
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+const char *s7 = R"(a b c FSIâ¨ 1 2 3 PDIâ© x y) z";
-+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+const char *s8 = R"(a b c PDIâ© x y )z";
-+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
-+const char *s9 = R"(a b c PDFâ¬ x y z)";
-+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
-diff -uprN '-x*.orig' '-x*.rej' del/gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c
---- del/gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	1969-12-31 16:00:00.000000000 -0800
-+++ gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	2021-12-13 23:11:22.328439287 -0800
-@@ -0,0 +1,17 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile { target { c || c++11 } } } */
-+/* { dg-options "-Wbidi-chars=unpaired" } */
-+/* Test raw strings.  */
-+
-+const char *s1 = R"(a b c LREâª 1 2 3)";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s2 = R"(a b c RLEâ« 1 2 3)";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s3 = R"(a b c LROâ­ 1 2 3)";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s4 = R"(a b c FSIâ¨ 1 2 3)";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s5 = R"(a b c LRIâ¦ 1 2 3)";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s6 = R"(a b c RLIâ§ 1 2 3)";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-14.c b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c
-new file mode 100644
-index 00000000000..ba5f75d9553
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c
-@@ -0,0 +1,38 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=unpaired" } */
-+/* Test PDI handling, which also pops any subsequent LREs, RLEs, LROs,
-+   or RLOs.  */
-+
-+/* LRI_â¦_LRI_â¦_RLE_â«_RLE_â«_RLE_â«_PDI_â©*/
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// LRI_â¦_RLE_â«_RLE_â«_RLE_â«_PDI_â©
-+// LRI_â¦_RLO_â®_RLE_â«_RLE_â«_PDI_â©
-+// LRI_â¦_RLO_â®_RLE_â«_PDI_â©
-+// FSI_â¨_RLO_â®_PDI_â©
-+// FSI_â¨_FSI_â¨_RLO_â®_PDI_â©
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+
-+int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069_PDI_\u2069;
-+int LRI_\u2066_LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int PDI_\u2069;
-+int LRI_\u2066_PDI_\u2069;
-+int RLI_\u2067_PDI_\u2069;
-+int LRE_\u202a_LRI_\u2066_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int LRI_\u2066_LRE_\u202a_PDF_\u202c_PDI_\u2069;
-+int LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
-+int RLI_\u2067_LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int FSI_\u2068_LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int RLO_\u202e_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int RLI_\u2067_PDI_\u2069_RLI_\u2067;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int FSI_\u2068_PDF_\u202c_PDI_\u2069;
-+int FSI_\u2068_FSI_\u2068_PDF_\u202c_PDI_\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-15.c b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c
-new file mode 100644
-index 00000000000..a0ce8ff5e2c
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c
-@@ -0,0 +1,59 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=unpaired" } */
-+/* Test unpaired bidi control chars in multiline comments.  */
-+
-+/*
-+ * LREâª end
-+ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+/*
-+ * RLEâ« end
-+ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+/*
-+ * LROâ­ end
-+ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+/*
-+ * RLOâ® end
-+ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+/*
-+ * LRIâ¦ end
-+ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+/*
-+ * RLIâ§ end
-+ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+/*
-+ * FSIâ¨ end
-+ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+/* LREâª
-+   PDFâ¬ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+/* FSIâ¨
-+   PDIâ© */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+
-+/* LRE<âª>
-+ *
-+ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-3 } */
-+
-+/*
-+ * LRE<âª>
-+ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+
-+/*
-+ *
-+ * LRE<âª> */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+
-+/* RLI<â§> */ /* PDI<â©> */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* LRE<âª> */ /* PDF<â¬> */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-16.c b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c
-new file mode 100644
-index 00000000000..baa0159861c
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c
-@@ -0,0 +1,26 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=any" } */
-+/* Test LTR/RTL chars.  */
-+
-+/* LTR<â> */
-+/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
-+// LTR<â>
-+/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
-+/* RTL<â> */
-+/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
-+// RTL<â>
-+/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
-+
-+const char *s1 = "LTR<â>";
-+/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
-+const char *s2 = "LTR\u200e";
-+/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
-+const char *s3 = "LTR\u200E";
-+/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
-+const char *s4 = "RTL<â>";
-+/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
-+const char *s5 = "RTL\u200f";
-+/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
-+const char *s6 = "RTL\u200F";
-+/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-17.c b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c
-new file mode 100644
-index 00000000000..07cb4321f96
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c
-@@ -0,0 +1,30 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=unpaired" } */
-+/* Test LTR/RTL chars.  */
-+
-+/* LTR<â> */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// LTR<â>
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* RTL<â> */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// RTL<â>
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int ltr_\u200e;
-+/* { dg-error "universal character " "" { target *-*-* } .-1 } */
-+int rtl_\u200f;
-+/* { dg-error "universal character " "" { target *-*-* } .-1 } */
-+
-+const char *s1 = "LTR<â>";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+const char *s2 = "LTR\u200e";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+const char *s3 = "LTR\u200E";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+const char *s4 = "RTL<â>";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+const char *s5 = "RTL\u200f";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+const char *s6 = "RTL\u200F";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-1.c b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c
-new file mode 100644
-index 00000000000..2340374f276
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c
-@@ -0,0 +1,12 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+
-+int main() {
-+    int isAdmin = 0;
-+    /*â® } â¦if (isAdmin)â© â¦ begin admins only */
-+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
-+        __builtin_printf("You are an admin.\n");
-+    /* end admins only â® { â¦*/
-+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
-+    return 0;
-+}
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-2.c b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c
-new file mode 100644
-index 00000000000..2340374f276
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c
-@@ -0,0 +1,9 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+
-+int main() {
-+    /* Say hello; newlineâ§/*/ return 0 ;
-+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
-+    __builtin_printf("Hello world.\n");
-+    return 0;
-+}
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-3.c b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c
-new file mode 100644
-index 00000000000..9dc7edb6e64
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c
-@@ -0,0 +1,11 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+
-+int main() {
-+    const char* access_level = "user";
-+    if (__builtin_strcmp(access_level, "userâ® â¦// Check if adminâ© â¦")) {
-+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
-+        __builtin_printf("You are an admin.\n");
-+    }
-+    return 0;
-+}
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-4.c b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c
-new file mode 100644
-index 00000000000..639e5c62e88
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c
-@@ -0,0 +1,188 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=any -Wno-multichar -Wno-overflow" } */
-+/* Test all bidi chars in various contexts (identifiers, comments,
-+   string literals, character constants), both UCN and UTF-8.  The bidi
-+   chars here are properly terminated, except for the character constants.  */
-+
-+/* a b c LREâª 1 2 3 PDFâ¬ x y z */
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+/* a b c RLEâ« 1 2 3 PDFâ¬ x y z */
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+/* a b c LROâ­ 1 2 3 PDFâ¬ x y z */
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+/* a b c RLOâ® 1 2 3 PDFâ¬ x y z */
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+/* a b c LRIâ¦ 1 2 3 PDIâ© x y z */
-+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+/* a b c RLIâ§ 1 2 3 PDIâ© x y */
-+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+/* a b c FSIâ¨ 1 2 3 PDIâ© x y z */
-+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+
-+/* Same but C++ comments instead.  */
-+// a b c LREâª 1 2 3 PDFâ¬ x y z
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+// a b c RLEâ« 1 2 3 PDFâ¬ x y z
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+// a b c LROâ­ 1 2 3 PDFâ¬ x y z
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+// a b c RLOâ® 1 2 3 PDFâ¬ x y z
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+// a b c LRIâ¦ 1 2 3 PDIâ© x y z
-+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+// a b c RLIâ§ 1 2 3 PDIâ© x y
-+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+// a b c FSIâ¨ 1 2 3 PDIâ© x y z
-+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+
-+/* Here we're closing an unopened context, warn when =any.  */
-+/* a b c PDIâ© x y z */
-+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
-+/* a b c PDFâ¬ x y z */
-+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
-+// a b c PDIâ© x y z
-+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
-+// a b c PDFâ¬ x y z
-+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
-+
-+/* Multiline comments.  */
-+/* a b c PDIâ© x y z
-+   */
-+/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
-+/* a b c PDFâ¬ x y z
-+   */
-+/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
-+/* first
-+   a b c PDIâ© x y z
-+   */
-+/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
-+/* first
-+   a b c PDFâ¬ x y z
-+   */
-+/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
-+/* first
-+   a b c PDIâ© x y z */
-+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
-+/* first
-+   a b c PDFâ¬ x y z */
-+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
-+
-+void
-+g1 ()
-+{
-+  const char *s1 = "a b c LREâª 1 2 3 PDFâ¬ x y z";
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+  const char *s2 = "a b c RLEâ« 1 2 3 PDFâ¬ x y z";
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+  const char *s3 = "a b c LROâ­ 1 2 3 PDFâ¬ x y z";
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+  const char *s4 = "a b c RLOâ® 1 2 3 PDFâ¬ x y z";
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+  const char *s5 = "a b c LRIâ¦ 1 2 3 PDIâ© x y z";
-+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+  const char *s6 = "a b c RLIâ§ 1 2 3 PDIâ© x y z";
-+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+  const char *s7 = "a b c FSIâ¨ 1 2 3 PDIâ© x y z";
-+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+  const char *s8 = "a b c PDIâ© x y z";
-+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
-+  const char *s9 = "a b c PDFâ¬ x y z";
-+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
-+
-+  const char *s10 = "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+  const char *s11 = "a b c LRE\u202A 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+  const char *s12 = "a b c RLE\u202b 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+  const char *s13 = "a b c RLE\u202B 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+  const char *s14 = "a b c LRO\u202d 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+  const char *s15 = "a b c LRO\u202D 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+  const char *s16 = "a b c RLO\u202e 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+  const char *s17 = "a b c RLO\u202E 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+  const char *s18 = "a b c LRI\u2066 1 2 3 PDI\u2069 x y z";
-+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+  const char *s19 = "a b c RLI\u2067 1 2 3 PDI\u2069 x y z";
-+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+  const char *s20 = "a b c FSI\u2068 1 2 3 PDI\u2069 x y z";
-+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+}
-+
-+void
-+g2 ()
-+{
-+  const char c1 = '\u202a';
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+  const char c2 = '\u202A';
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+  const char c3 = '\u202b';
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+  const char c4 = '\u202B';
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+  const char c5 = '\u202d';
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+  const char c6 = '\u202D';
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+  const char c7 = '\u202e';
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+  const char c8 = '\u202E';
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+  const char c9 = '\u2066';
-+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+  const char c10 = '\u2067';
-+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+  const char c11 = '\u2068';
-+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+}
-+
-+int aâªbâ¬c;
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+int aâ«bâ¬c;
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+int aâ­bâ¬c;
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+int aâ®bâ¬c;
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+int aâ¦bâ©c;
-+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+int aâ§bâ©c;
-+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+int aâ¨bâ©c;
-+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+int Aâ¬X;
-+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
-+int A\u202cY;
-+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
-+int A\u202CY2;
-+/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
-+
-+int d\u202ae\u202cf;
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+int d\u202Ae\u202cf2;
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+int d\u202be\u202cf;
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+int d\u202Be\u202cf2;
-+/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+int d\u202de\u202cf;
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+int d\u202De\u202cf2;
-+/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+int d\u202ee\u202cf;
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+int d\u202Ee\u202cf2;
-+/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+int d\u2066e\u2069f;
-+/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+int d\u2067e\u2069f;
-+/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+int d\u2068e\u2069f;
-+/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+int X\u2069;
-+/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-5.c b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c
-new file mode 100644
-index 00000000000..68cb053144b
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c
-@@ -0,0 +1,188 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=unpaired -Wno-multichar -Wno-overflow" } */
-+/* Test all bidi chars in various contexts (identifiers, comments,
-+   string literals, character constants), both UCN and UTF-8.  The bidi
-+   chars here are properly terminated, except for the character constants.  */
-+
-+/* a b c LREâª 1 2 3 PDFâ¬ x y z */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLEâ« 1 2 3 PDFâ¬ x y z */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c LROâ­ 1 2 3 PDFâ¬ x y z */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLOâ® 1 2 3 PDFâ¬ x y z */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c LRIâ¦ 1 2 3 PDIâ© x y z */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLIâ§ 1 2 3 PDIâ© x y */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c FSIâ¨ 1 2 3 PDIâ© x y z */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+
-+/* Same but C++ comments instead.  */
-+// a b c LREâª 1 2 3 PDFâ¬ x y z
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLEâ« 1 2 3 PDFâ¬ x y z
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c LROâ­ 1 2 3 PDFâ¬ x y z
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLOâ® 1 2 3 PDFâ¬ x y z
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c LRIâ¦ 1 2 3 PDIâ© x y z
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLIâ§ 1 2 3 PDIâ© x y
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c FSIâ¨ 1 2 3 PDIâ© x y z
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+
-+/* Here we're closing an unopened context, warn when =any.  */
-+/* a b c PDIâ© x y z */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c PDFâ¬ x y z */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c PDIâ© x y z
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c PDFâ¬ x y z
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+
-+/* Multiline comments.  */
-+/* a b c PDIâ© x y z
-+   */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
-+/* a b c PDFâ¬ x y z
-+   */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
-+/* first
-+   a b c PDIâ© x y z
-+   */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
-+/* first
-+   a b c PDFâ¬ x y z
-+   */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
-+/* first
-+   a b c PDIâ© x y z */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* first
-+   a b c PDFâ¬ x y z */
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+
-+void
-+g1 ()
-+{
-+  const char *s1 = "a b c LREâª 1 2 3 PDFâ¬ x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s2 = "a b c RLEâ« 1 2 3 PDFâ¬ x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s3 = "a b c LROâ­ 1 2 3 PDFâ¬ x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s4 = "a b c RLOâ® 1 2 3 PDFâ¬ x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s5 = "a b c LRIâ¦ 1 2 3 PDIâ© x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s6 = "a b c RLIâ§ 1 2 3 PDIâ© x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s7 = "a b c FSIâ¨ 1 2 3 PDIâ© x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s8 = "a b c PDIâ© x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s9 = "a b c PDFâ¬ x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+
-+  const char *s10 = "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s11 = "a b c LRE\u202A 1 2 3 PDF\u202c x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s12 = "a b c RLE\u202b 1 2 3 PDF\u202c x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s13 = "a b c RLE\u202B 1 2 3 PDF\u202c x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s14 = "a b c LRO\u202d 1 2 3 PDF\u202c x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s15 = "a b c LRO\u202D 1 2 3 PDF\u202c x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s16 = "a b c RLO\u202e 1 2 3 PDF\u202c x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s17 = "a b c RLO\u202E 1 2 3 PDF\u202c x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s18 = "a b c LRI\u2066 1 2 3 PDI\u2069 x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s19 = "a b c RLI\u2067 1 2 3 PDI\u2069 x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s20 = "a b c FSI\u2068 1 2 3 PDI\u2069 x y z";
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+}
-+
-+void
-+g2 ()
-+{
-+  const char c1 = '\u202a';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char c2 = '\u202A';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char c3 = '\u202b';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char c4 = '\u202B';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char c5 = '\u202d';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char c6 = '\u202D';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char c7 = '\u202e';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char c8 = '\u202E';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char c9 = '\u2066';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char c10 = '\u2067';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char c11 = '\u2068';
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+}
-+
-+int aâªbâ¬c;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ«bâ¬c;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ­bâ¬c;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ®bâ¬c;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ¦bâ©c;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ§bâ©c;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ¨bâ©c;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int Aâ¬X;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int A\u202cY;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int A\u202CY2;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+
-+int d\u202ae\u202cf;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int d\u202Ae\u202cf2;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int d\u202be\u202cf;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int d\u202Be\u202cf2;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int d\u202de\u202cf;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int d\u202De\u202cf2;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int d\u202ee\u202cf;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int d\u202Ee\u202cf2;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int d\u2066e\u2069f;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int d\u2067e\u2069f;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int d\u2068e\u2069f;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int X\u2069;
-+/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-6.c b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c
-new file mode 100644
-index 00000000000..0ce6fff2dee
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c
-@@ -0,0 +1,155 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=unpaired" } */
-+/* Test nesting of bidi chars in various contexts.  */
-+
-+/* Terminated by the wrong char:  */
-+/* a b c LREâª 1 2 3 PDIâ© x y z */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLEâ« 1 2 3 PDIâ© x y  z*/
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c LROâ­ 1 2 3 PDIâ© x y z */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLOâ® 1 2 3 PDIâ© x y z */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c LRIâ¦ 1 2 3 PDFâ¬ x y z */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLIâ§ 1 2 3 PDFâ¬ x y z */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c FSIâ¨ 1 2 3 PDFâ¬ x y  z*/
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+
-+/* LREâª PDFâ¬ */
-+/* LREâª LREâª PDFâ¬ PDFâ¬ */
-+/* PDFâ¬ LREâª PDFâ¬ */
-+/* LREâª PDFâ¬ LREâª PDFâ¬ */
-+/* LREâª LREâª PDFâ¬ */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* PDFâ¬ LREâª */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+
-+// a b c LREâª 1 2 3 PDIâ© x y z
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLEâ« 1 2 3 PDIâ© x y  z*/
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c LROâ­ 1 2 3 PDIâ© x y z 
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLOâ® 1 2 3 PDIâ© x y z 
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c LRIâ¦ 1 2 3 PDFâ¬ x y z 
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLIâ§ 1 2 3 PDFâ¬ x y z 
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c FSIâ¨ 1 2 3 PDFâ¬ x y  z
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+
-+// LREâª PDFâ¬ 
-+// LREâª LREâª PDFâ¬ PDFâ¬
-+// PDFâ¬ LREâª PDFâ¬
-+// LREâª PDFâ¬ LREâª PDFâ¬
-+// LREâª LREâª PDFâ¬
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// PDFâ¬ LREâª
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+
-+void
-+g1 ()
-+{
-+  const char *s1 = "a b c LREâª 1 2 3 PDIâ© x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s2 = "a b c LRE\u202a 1 2 3 PDI\u2069 x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s3 = "a b c RLEâ« 1 2 3 PDIâ© x y ";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s4 = "a b c RLE\u202b 1 2 3 PDI\u2069 x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s5 = "a b c LROâ­ 1 2 3 PDIâ© x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s6 = "a b c LRO\u202d 1 2 3 PDI\u2069 x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s7 = "a b c RLOâ® 1 2 3 PDIâ© x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s8 = "a b c RLO\u202e 1 2 3 PDI\u2069 x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s9 = "a b c LRIâ¦ 1 2 3 PDFâ¬ x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s10 = "a b c LRI\u2066 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s11 = "a b c RLIâ§ 1 2 3 PDFâ¬ x y z\
-+    ";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+  const char *s12 = "a b c RLI\u2067 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s13 = "a b c FSIâ¨ 1 2 3 PDFâ¬ x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s14 = "a b c FSI\u2068 1 2 3 PDF\u202c x y z";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s15 = "PDFâ¬ LREâª";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s16 = "PDF\u202c LRE\u202a";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s17 = "LREâª PDFâ¬";
-+  const char *s18 = "LRE\u202a PDF\u202c";
-+  const char *s19 = "LREâª LREâª PDFâ¬ PDFâ¬";
-+  const char *s20 = "LRE\u202a LRE\u202a PDF\u202c PDF\u202c";
-+  const char *s21 = "PDFâ¬ LREâª PDFâ¬";
-+  const char *s22 = "PDF\u202c LRE\u202a PDF\u202c";
-+  const char *s23 = "LREâª LREâª PDFâ¬";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s24 = "LRE\u202a LRE\u202a PDF\u202c";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s25 = "PDFâ¬ LREâª";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s26 = "PDF\u202c LRE\u202a";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s27 = "PDFâ¬ LRE\u202a";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s28 = "PDF\u202c LREâª";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+}
-+
-+int aLREâªbPDIâ©;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int A\u202aB\u2069C;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aRLEâ«bPDIâ©;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int a\u202bB\u2069c;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aLROâ­bPDIâ©;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int a\u202db\u2069c2;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aRLOâ®bPDIâ©;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int a\u202eb\u2069;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aLRIâ¦bPDFâ¬;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int a\u2066b\u202c;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aRLIâ§bPDFâ¬c
-+;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+int a\u2067b\u202c;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aFSIâ¨bPDFâ¬;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int a\u2068b\u202c;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aFSIâ¨bPD\u202C;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aFSI\u2068bPDFâ¬_;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aLREâªbPDFâ¬b; 
-+int A\u202aB\u202c;
-+int a_LREâª_LREâª_b_PDFâ¬_PDFâ¬;
-+int A\u202aA\u202aB\u202cB\u202c;
-+int aPDFâ¬bLREadPDFâ¬;
-+int a_\u202C_\u202a_\u202c;
-+int a_LREâª_b_PDFâ¬_c_LREâª_PDFâ¬;
-+int a_\u202a_\u202c_\u202a_\u202c_;
-+int a_LREâª_b_PDFâ¬_c_LREâª;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int a_\u202a_\u202c_\u202a_;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-7.c b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c
-new file mode 100644
-index 00000000000..d012d420ec0
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c
-@@ -0,0 +1,9 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=any" } */
-+/* Test we ignore UCNs in comments.  */
-+
-+// a b c \u202a 1 2 3
-+// a b c \u202A 1 2 3
-+/* a b c \u202a 1 2 3 */
-+/* a b c \u202A 1 2 3 */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-8.c b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c
-new file mode 100644
-index 00000000000..4f54c5092ec
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c
-@@ -0,0 +1,13 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=any" } */
-+/* Test \u vs \U.  */
-+
-+int a_\u202A;
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+int a_\u202a_2;
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+int a_\U0000202A_3;
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+int a_\U0000202a_4;
-+/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-9.c b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c
-new file mode 100644
-index 00000000000..e2af1b1ca97
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c
-@@ -0,0 +1,29 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=unpaired" } */
-+/* Test that we properly separate bidi contexts (comment/identifier/character
-+   constant/string literal).  */
-+
-+/* LRE ->âª<- */ int pdf_\u202c_1;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* RLE ->â«<- */ int pdf_\u202c_2;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* LRO ->â­<- */ int pdf_\u202c_3;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* RLO ->â®<- */ int pdf_\u202c_4;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* LRI ->â¦<-*/ int pdi_\u2069_1;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* RLI ->â§<- */ int pdi_\u2069_12;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* FSI ->â¨<- */ int pdi_\u2069_3;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+
-+const char *s1 = "LRE\u202a"; /* PDF ->â¬<- */
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* LRE ->âª<- */ const char *s2 = "PDF\u202c";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s3 = "LRE\u202a"; int pdf_\u202c_5;
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int lre_\u202a; const char *s4 = "PDF\u202c";
-+/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
-index 176f8c5bbce..112b9c24751 100644
---- a/libcpp/include/cpplib.h
-+++ b/libcpp/include/cpplib.h
-@@ -318,6 +318,17 @@ enum cpp_main_search
-   CMS_system,  /* Search the system INCLUDE path.  */
- };
- 
-+/* The possible bidirectional control characters checking levels, from least
-+   restrictive to most.  */
-+enum cpp_bidirectional_level {
-+  /* No checking.  */
-+  bidirectional_none,
-+  /* Only detect unpaired uses of bidirectional control characters.  */
-+  bidirectional_unpaired,
-+  /* Detect any use of bidirectional control characters.  */
-+  bidirectional_any
-+};
-+
- /* This structure is nested inside struct cpp_reader, and
-    carries all the options visible to the command line.  */
- struct cpp_options
-@@ -531,6 +542,10 @@ struct cpp_options
-   /* True if warn about differences between C++98 and C++11.  */
-   bool cpp_warn_cxx11_compat;
- 
-+  /* Nonzero if bidirectional control characters checking is on.  See enum
-+     cpp_bidirectional_level.  */
-+  unsigned char cpp_warn_bidirectional;
-+
-   /* Dependency generation.  */
-   struct
-   {
-@@ -635,7 +650,8 @@ enum cpp_warning_reason {
-   CPP_W_C90_C99_COMPAT,
-   CPP_W_C11_C2X_COMPAT,
-   CPP_W_CXX11_COMPAT,
--  CPP_W_EXPANSION_TO_DEFINED
-+  CPP_W_EXPANSION_TO_DEFINED,
-+  CPP_W_BIDIRECTIONAL
- };
- 
- /* Callback for header lookup for HEADER, which is the name of a
-diff --git a/libcpp/init.c b/libcpp/init.c
-index 5a424e23553..f9a8f5f088f 100644
---- a/libcpp/init.c
-+++ b/libcpp/init.c
-@@ -219,6 +219,7 @@ cpp_create_reader (enum c_lang lang, cpp
-       = ENABLE_CANONICAL_SYSTEM_HEADERS;
-   CPP_OPTION (pfile, ext_numeric_literals) = 1;
-   CPP_OPTION (pfile, warn_date_time) = 0;
-+  CPP_OPTION (pfile, cpp_warn_bidirectional) = bidirectional_unpaired;
- 
-   /* Default CPP arithmetic to something sensible for the host for the
-      benefit of dumb users like fix-header.  */
-diff --git a/libcpp/internal.h b/libcpp/internal.h
-index 8577cab6c83..0ce0246c5a2 100644
---- a/libcpp/internal.h
-+++ b/libcpp/internal.h
-@@ -597,6 +597,13 @@ struct cpp_reader
-   /* Location identifying the main source file -- intended to be line
-      zero of said file.  */
-   location_t main_loc;
-+
-+  /* Returns true iff we should warn about UTF-8 bidirectional control
-+     characters.  */
-+  bool warn_bidi_p () const
-+  {
-+    return CPP_OPTION (this, cpp_warn_bidirectional) != bidirectional_none;
-+  }
- };
- 
- /* Character classes.  Based on the more primitive macros in safe-ctype.h.
-diff --git a/libcpp/lex.c b/libcpp/lex.c
-index fa2253d41c3..6a4fbce6030 100644
---- a/libcpp/lex.c
-+++ b/libcpp/lex.c
-@@ -1164,6 +1164,324 @@ _cpp_process_line_notes (cpp_reader *pfi
-     }
- }
- 
-+namespace bidi {
-+  enum class kind {
-+    NONE, LRE, RLE, LRO, RLO, LRI, RLI, FSI, PDF, PDI, LTR, RTL
-+  };
-+
-+  /* All the UTF-8 encodings of bidi characters start with E2.  */
-+  constexpr uchar utf8_start = 0xe2;
-+
-+  /* A vector holding currently open bidi contexts.  We use a char for
-+     each context, its LSB is 1 if it represents a PDF context, 0 if it
-+     represents a PDI context.  The next bit is 1 if this context was open
-+     by a bidi character written as a UCN, and 0 when it was UTF-8.  */
-+  semi_embedded_vec <unsigned char, 16> vec;
-+
-+  /* Close the whole comment/identifier/string literal/character constant
-+     context.  */
-+  void on_close ()
-+  {
-+    vec.truncate (0);
-+  }
-+
-+  /* Pop the last element in the vector.  */
-+  void pop ()
-+  {
-+    unsigned int len = vec.count ();
-+    gcc_checking_assert (len > 0);
-+    vec.truncate (len - 1);
-+  }
-+
-+  /* Return the context of the Ith element.  */
-+  kind ctx_at (unsigned int i)
-+  {
-+    return (vec[i] & 1) ? kind::PDF : kind::PDI;
-+  }
-+
-+  /* Return which context is currently opened.  */
-+  kind current_ctx ()
-+  {
-+    unsigned int len = vec.count ();
-+    if (len == 0)
-+      return kind::NONE;
-+    return ctx_at (len - 1);
-+  }
-+
-+  /* Return true if the current context comes from a UCN origin, that is,
-+     the bidi char which started this bidi context was written as a UCN.  */
-+  bool current_ctx_ucn_p ()
-+  {
-+    unsigned int len = vec.count ();
-+    gcc_checking_assert (len > 0);
-+    return (vec[len - 1] >> 1) & 1;
-+  }
-+
-+  /* We've read a bidi char, update the current vector as necessary.  */
-+  void on_char (kind k, bool ucn_p)
-+  {
-+    switch (k)
-+      {
-+      case kind::LRE:
-+      case kind::RLE:
-+      case kind::LRO:
-+      case kind::RLO:
-+	vec.push (ucn_p ? 3u : 1u);
-+	break;
-+      case kind::LRI:
-+      case kind::RLI:
-+      case kind::FSI:
-+	vec.push (ucn_p ? 2u : 0u);
-+	break;
-+      /* PDF terminates the scope of the last LRE, RLE, LRO, or RLO
-+	 whose scope has not yet been terminated.  */
-+      case kind::PDF:
-+	if (current_ctx () == kind::PDF)
-+	  pop ();
-+	break;
-+      /* PDI terminates the scope of the last LRI, RLI, or FSI whose
-+	 scope has not yet been terminated, as well as the scopes of
-+	 any subsequent LREs, RLEs, LROs, or RLOs whose scopes have not
-+	 yet been terminated.  */
-+      case kind::PDI:
-+	for (int i = vec.count () - 1; i >= 0; --i)
-+	  if (ctx_at (i) == kind::PDI)
-+	    {
-+	      vec.truncate (i);
-+	      break;
-+	    }
-+	break;
-+      case kind::LTR:
-+      case kind::RTL:
-+	/* These aren't popped by a PDF/PDI.  */
-+	break;
-+      [[likely]] case kind::NONE:
-+	break;
-+      default:
-+	abort ();
-+      }
-+  }
-+
-+  /* Return a descriptive string for K.  */
-+  const char *to_str (kind k)
-+  {
-+    switch (k)
-+      {
-+      case kind::LRE:
-+	return "U+202A (LEFT-TO-RIGHT EMBEDDING)";
-+      case kind::RLE:
-+	return "U+202B (RIGHT-TO-LEFT EMBEDDING)";
-+      case kind::LRO:
-+	return "U+202D (LEFT-TO-RIGHT OVERRIDE)";
-+      case kind::RLO:
-+	return "U+202E (RIGHT-TO-LEFT OVERRIDE)";
-+      case kind::LRI:
-+	return "U+2066 (LEFT-TO-RIGHT ISOLATE)";
-+      case kind::RLI:
-+	return "U+2067 (RIGHT-TO-LEFT ISOLATE)";
-+      case kind::FSI:
-+	return "U+2068 (FIRST STRONG ISOLATE)";
-+      case kind::PDF:
-+	return "U+202C (POP DIRECTIONAL FORMATTING)";
-+      case kind::PDI:
-+	return "U+2069 (POP DIRECTIONAL ISOLATE)";
-+      case kind::LTR:
-+	return "U+200E (LEFT-TO-RIGHT MARK)";
-+      case kind::RTL:
-+	return "U+200F (RIGHT-TO-LEFT MARK)";
-+      default:
-+	abort ();
-+      }
-+  }
-+}
-+
-+/* Parse a sequence of 3 bytes starting with P and return its bidi code.  */
-+
-+static bidi::kind
-+get_bidi_utf8 (const unsigned char *const p)
-+{
-+  gcc_checking_assert (p[0] == bidi::utf8_start);
-+
-+  if (p[1] == 0x80)
-+    switch (p[2])
-+      {
-+      case 0xaa:
-+	return bidi::kind::LRE;
-+      case 0xab:
-+	return bidi::kind::RLE;
-+      case 0xac:
-+	return bidi::kind::PDF;
-+      case 0xad:
-+	return bidi::kind::LRO;
-+      case 0xae:
-+	return bidi::kind::RLO;
-+      case 0x8e:
-+	return bidi::kind::LTR;
-+      case 0x8f:
-+	return bidi::kind::RTL;
-+      default:
-+	break;
-+      }
-+  else if (p[1] == 0x81)
-+    switch (p[2])
-+      {
-+      case 0xa6:
-+	return bidi::kind::LRI;
-+      case 0xa7:
-+	return bidi::kind::RLI;
-+      case 0xa8:
-+	return bidi::kind::FSI;
-+      case 0xa9:
-+	return bidi::kind::PDI;
-+      default:
-+	break;
-+      }
-+
-+  return bidi::kind::NONE;
-+}
-+
-+/* Parse a UCN where P points just past \u or \U and return its bidi code.  */
-+
-+static bidi::kind
-+get_bidi_ucn (const unsigned char *p, bool is_U)
-+{
-+  /* 6.4.3 Universal Character Names
-+      \u hex-quad
-+      \U hex-quad hex-quad
-+     where \unnnn means \U0000nnnn.  */
-+
-+  if (is_U)
-+    {
-+      if (p[0] != '0' || p[1] != '0' || p[2] != '0' || p[3] != '0')
-+	return bidi::kind::NONE;
-+      /* Skip 4B so we can treat \u and \U the same below.  */
-+      p += 4;
-+    }
-+
-+  /* All code points we are looking for start with 20xx.  */
-+  if (p[0] != '2' || p[1] != '0')
-+    return bidi::kind::NONE;
-+  else if (p[2] == '2')
-+    switch (p[3])
-+      {
-+      case 'a':
-+      case 'A':
-+	return bidi::kind::LRE;
-+      case 'b':
-+      case 'B':
-+	return bidi::kind::RLE;
-+      case 'c':
-+      case 'C':
-+	return bidi::kind::PDF;
-+      case 'd':
-+      case 'D':
-+	return bidi::kind::LRO;
-+      case 'e':
-+      case 'E':
-+	return bidi::kind::RLO;
-+      default:
-+	break;
-+      }
-+  else if (p[2] == '6')
-+    switch (p[3])
-+      {
-+      case '6':
-+	return bidi::kind::LRI;
-+      case '7':
-+	return bidi::kind::RLI;
-+      case '8':
-+	return bidi::kind::FSI;
-+      case '9':
-+	return bidi::kind::PDI;
-+      default:
-+	break;
-+      }
-+  else if (p[2] == '0')
-+    switch (p[3])
-+      {
-+      case 'e':
-+      case 'E':
-+	return bidi::kind::LTR;
-+      case 'f':
-+      case 'F':
-+	return bidi::kind::RTL;
-+      default:
-+	break;
-+      }
-+
-+  return bidi::kind::NONE;
-+}
-+
-+/* We're closing a bidi context, that is, we've encountered a newline,
-+   are closing a C-style comment, or are at the end of a string literal,
-+   character constant, or identifier.  Warn if this context was not
-+   properly terminated by a PDI or PDF.  P points to the last character
-+   in this context.  */
-+
-+static void
-+maybe_warn_bidi_on_close (cpp_reader *pfile, const uchar *p)
-+{
-+  if (CPP_OPTION (pfile, cpp_warn_bidirectional) == bidirectional_unpaired
-+      && bidi::vec.count () > 0)
-+    {
-+      const location_t loc
-+	= linemap_position_for_column (pfile->line_table,
-+				       CPP_BUF_COLUMN (pfile->buffer, p));
-+      cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
-+			     "unpaired UTF-8 bidirectional control character "
-+			     "detected");
-+    }
-+  /* We're done with this context.  */
-+  bidi::on_close ();
-+}
-+
-+/* We're at the beginning or in the middle of an identifier/comment/string
-+   literal/character constant.  Warn if we've encountered a bidi character.
-+   KIND says which bidi character it was; P points to it in the character
-+   stream.  UCN_P is true iff this bidi character was written as a UCN.  */
-+
-+static void
-+maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind kind,
-+			 bool ucn_p)
-+{
-+  if (__builtin_expect (kind == bidi::kind::NONE, 1))
-+    return;
-+
-+  const auto warn_bidi = CPP_OPTION (pfile, cpp_warn_bidirectional);
-+
-+  if (warn_bidi != bidirectional_none)
-+    {
-+      const location_t loc
-+	= linemap_position_for_column (pfile->line_table,
-+				       CPP_BUF_COLUMN (pfile->buffer, p));
-+      /* It seems excessive to warn about a PDI/PDF that is closing
-+	 an opened context because we've already warned about the
-+	 opening character.  Except warn when we have a UCN x UTF-8
-+	 mismatch.  */
-+      if (kind == bidi::current_ctx ())
-+	{
-+	  if (warn_bidi == bidirectional_unpaired
-+	      && bidi::current_ctx_ucn_p () != ucn_p)
-+	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
-+				   "UTF-8 vs UCN mismatch when closing "
-+				   "a context by \"%s\"", bidi::to_str (kind));
-+	}
-+      else if (warn_bidi == bidirectional_any)
-+	{
-+	  if (kind == bidi::kind::PDF || kind == bidi::kind::PDI)
-+	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
-+				   "\"%s\" is closing an unopened context",
-+				   bidi::to_str (kind));
-+	  else
-+	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
-+				   "found problematic Unicode character \"%s\"",
-+				   bidi::to_str (kind));
-+	}
-+    }
-+  /* We're done with this context.  */
-+  bidi::on_char (kind, ucn_p);
-+}
-+
- /* Skip a C-style block comment.  We find the end of the comment by
-    seeing if an asterisk is before every '/' we encounter.  Returns
-    nonzero if comment terminated by EOF, zero otherwise.
-@@ -1175,6 +1493,7 @@ _cpp_skip_block_comment (cpp_reader *pfi
-   cpp_buffer *buffer = pfile->buffer;
-   const uchar *cur = buffer->cur;
-   uchar c;
-+  const bool warn_bidi_p = pfile->warn_bidi_p ();
- 
-   cur++;
-   if (*cur == '/')
-@@ -1189,7 +1508,11 @@ _cpp_skip_block_comment (cpp_reader *pfi
-       if (c == '/')
- 	{
- 	  if (cur[-2] == '*')
--	    break;
-+	    {
-+	      if (warn_bidi_p)
-+		maybe_warn_bidi_on_close (pfile, cur);
-+	      break;
-+	    }
- 
- 	  /* Warn about potential nested comments, but not if the '/'
- 	     comes immediately before the true comment delimiter.
-@@ -1208,6 +1531,8 @@ _cpp_skip_block_comment (cpp_reader *pfi
- 	{
- 	  unsigned int cols;
- 	  buffer->cur = cur - 1;
-+	  if (warn_bidi_p)
-+	    maybe_warn_bidi_on_close (pfile, cur);
- 	  _cpp_process_line_notes (pfile, true);
- 	  if (buffer->next_line >= buffer->rlimit)
- 	    return true;
-@@ -1218,6 +1543,13 @@ _cpp_skip_block_comment (cpp_reader *pfi
- 
- 	  cur = buffer->cur;
- 	}
-+      /* If this is a beginning of a UTF-8 encoding, it might be
-+	 a bidirectional control character.  */
-+      else if (__builtin_expect (c == bidi::utf8_start, 0) && warn_bidi_p)
-+	{
-+	  bidi::kind kind = get_bidi_utf8 (cur - 1);
-+	  maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=*/false);
-+	}
-     }
- 
-   buffer->cur = cur;
-@@ -1233,9 +1565,31 @@ skip_line_comment (cpp_reader *pfile)
- {
-   cpp_buffer *buffer = pfile->buffer;
-   location_t orig_line = pfile->line_table->highest_line;
-+  const bool warn_bidi_p = pfile->warn_bidi_p ();
- 
--  while (*buffer->cur != '\n')
--    buffer->cur++;
-+  if (!warn_bidi_p)
-+    while (*buffer->cur != '\n')
-+      buffer->cur++;
-+  else
-+    {
-+      while (*buffer->cur != '\n'
-+	     && *buffer->cur != bidi::utf8_start)
-+	buffer->cur++;
-+      if (__builtin_expect (*buffer->cur == bidi::utf8_start, 0))
-+	{
-+	  while (*buffer->cur != '\n')
-+	    {
-+	      if (__builtin_expect (*buffer->cur == bidi::utf8_start, 0))
-+		{
-+		  bidi::kind kind = get_bidi_utf8 (buffer->cur);
-+		  maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
-+					   /*ucn_p=*/false);
-+		}
-+	      buffer->cur++;
-+	    }
-+	  maybe_warn_bidi_on_close (pfile, buffer->cur);
-+	}
-+    }
- 
-   _cpp_process_line_notes (pfile, true);
-   return orig_line != pfile->line_table->highest_line;
-@@ -1317,11 +1671,13 @@ static const cppchar_t utf8_signifier =
- 
- /* Returns TRUE if the sequence starting at buffer->cur is valid in
-    an identifier.  FIRST is TRUE if this starts an identifier.  */
-+
- static bool
- forms_identifier_p (cpp_reader *pfile, int first,
- 		    struct normalize_state *state)
- {
-   cpp_buffer *buffer = pfile->buffer;
-+  const bool warn_bidi_p = pfile->warn_bidi_p ();
- 
-   if (*buffer->cur == '$')
-     {
-@@ -1344,6 +1700,13 @@ forms_identifier_p (cpp_reader *pfile, i
-       cppchar_t s;
-       if (*buffer->cur >= utf8_signifier)
- 	{
-+	  if (__builtin_expect (*buffer->cur == bidi::utf8_start, 0)
-+	      && warn_bidi_p)
-+	    {
-+	      bidi::kind kind = get_bidi_utf8 (buffer->cur);
-+	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
-+				       /*ucn_p=*/false);
-+	    }
- 	  if (_cpp_valid_utf8 (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
- 			       state, &s))
- 	    return true;
-@@ -1352,6 +1715,13 @@ forms_identifier_p (cpp_reader *pfile, i
- 	       && (buffer->cur[1] == 'u' || buffer->cur[1] == 'U'))
- 	{
- 	  buffer->cur += 2;
-+	  if (warn_bidi_p)
-+	    {
-+	      bidi::kind kind = get_bidi_ucn (buffer->cur,
-+					      buffer->cur[-1] == 'U');
-+	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
-+				       /*ucn_p=*/true);
-+	    }
- 	  if (_cpp_valid_ucn (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
- 			      state, &s, NULL, NULL))
- 	    return true;
-@@ -1460,6 +1830,7 @@ lex_identifier (cpp_reader *pfile, const
-   const uchar *cur;
-   unsigned int len;
-   unsigned int hash = HT_HASHSTEP (0, *base);
-+  const bool warn_bidi_p = pfile->warn_bidi_p ();
- 
-   cur = pfile->buffer->cur;
-   if (! starts_ucn)
-@@ -1483,6 +1854,8 @@ lex_identifier (cpp_reader *pfile, const
- 	    pfile->buffer->cur++;
- 	  }
-       } while (forms_identifier_p (pfile, false, nst));
-+      if (warn_bidi_p)
-+	maybe_warn_bidi_on_close (pfile, pfile->buffer->cur);
-       result = _cpp_interpret_identifier (pfile, base,
- 					  pfile->buffer->cur - base);
-       *spelling = cpp_lookup (pfile, base, pfile->buffer->cur - base);
-@@ -1719,6 +2092,7 @@ static void
- lex_raw_string (cpp_reader *pfile, cpp_token *token, const uchar *base)
- {
-   const uchar *pos = base;
-+  const bool warn_bidi_p = pfile->warn_bidi_p ();
- 
-   /* 'tis a pity this information isn't passed down from the lexer's
-      initial categorization of the token.  */
-@@ -1955,8 +2329,15 @@ lex_raw_string (cpp_reader *pfile, cpp_t
- 	  pos = base = pfile->buffer->cur;
- 	  note = &pfile->buffer->notes[pfile->buffer->cur_note];
- 	}
-+      else if (__builtin_expect ((unsigned char) c == bidi::utf8_start, 0)
-+	       && warn_bidi_p)
-+	maybe_warn_bidi_on_char (pfile, pos - 1, get_bidi_utf8 (pos - 1),
-+				 /*ucn_p=*/false);
-     }
- 
-+  if (warn_bidi_p)
-+    maybe_warn_bidi_on_close (pfile, pos);
-+
-   if (CPP_OPTION (pfile, user_literals))
-     {
-       /* If a string format macro, say from inttypes.h, is placed touching
-@@ -2051,15 +2432,27 @@ lex_string (cpp_reader *pfile, cpp_token
-   else
-     terminator = '>', type = CPP_HEADER_NAME;
- 
-+  const bool warn_bidi_p = pfile->warn_bidi_p ();
-   for (;;)
-     {
-       cppchar_t c = *cur++;
- 
-       /* In #include-style directives, terminators are not escapable.  */
-       if (c == '\\' && !pfile->state.angled_headers && *cur != '\n')
--	cur++;
-+	{
-+	  if ((cur[0] == 'u' || cur[0] == 'U') && warn_bidi_p)
-+	    {
-+	      bidi::kind kind = get_bidi_ucn (cur + 1, cur[0] == 'U');
-+	      maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=*/true);
-+	    }
-+	  cur++;
-+	}
-       else if (c == terminator)
--	break;
-+	{
-+	  if (warn_bidi_p)
-+	    maybe_warn_bidi_on_close (pfile, cur - 1);
-+	  break;
-+	}
-       else if (c == '\n')
- 	{
- 	  cur--;
-@@ -2076,6 +2469,11 @@ lex_string (cpp_reader *pfile, cpp_token
- 	}
-       else if (c == '\0')
- 	saw_NUL = true;
-+      else if (__builtin_expect (c == bidi::utf8_start, 0) && warn_bidi_p)
-+	{
-+	  bidi::kind kind = get_bidi_utf8 (cur - 1);
-+	  maybe_warn_bidi_on_char (pfile, cur - 1, kind, /*ucn_p=*/false);
-+	}
-     }
- 
-   if (saw_NUL && !pfile->state.skipping)
diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index d19cefbdf92..5a51ae7d960 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From 863f1f9dc78839ecd021b2cb01d501e8c9e00ef7 Mon Sep 17 00:00:00 2001
+From e1dbdcd0ea667bab4b551294354e04c6fe288ab6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Mar 2021 16:04:20 -0800
 Subject: [PATCH] gcc: poison-system-directories
@@ -20,15 +20,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/configure       | 19 +++++++++++++++++++
  gcc/configure.ac    | 16 ++++++++++++++++
  gcc/doc/invoke.texi |  9 +++++++++
- gcc/gcc.c           |  9 +++++++--
- gcc/incpath.c       | 21 +++++++++++++++++++++
+ gcc/gcc.cc          |  9 +++++++--
+ gcc/incpath.cc      | 21 +++++++++++++++++++++
  7 files changed, 86 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index a75b44ee47e..d15105a73f3 100644
+index 8a0dafc522d..0357868e22c 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
-@@ -683,6 +683,10 @@ Wreturn-local-addr
+@@ -710,6 +710,10 @@ Wreturn-local-addr
  Common Var(warn_return_local_addr) Init(1) Warning
  Warn about returning a pointer/reference to a local or temporary variable.
  
@@ -40,7 +40,7 @@ index a75b44ee47e..d15105a73f3 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index 048bf52e8c2..4f973f7906a 100644
+index 64c27c9cfac..a693cb8a886 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
 @@ -230,6 +230,16 @@
@@ -61,10 +61,10 @@ index 048bf52e8c2..4f973f7906a 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 7218b0c331a..d7445339f9a 100755
+index 5ce0557719a..dc2d59701ad 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -1019,6 +1019,7 @@ enable_maintainer_mode
+@@ -1023,6 +1023,7 @@ enable_maintainer_mode
  enable_link_mutex
  enable_link_serialization
  enable_version_specific_runtime_libs
@@ -72,7 +72,7 @@ index 7218b0c331a..d7445339f9a 100755
  enable_plugin
  enable_host_shared
  enable_libquadmath_support
-@@ -1781,6 +1782,8 @@ Optional Features:
+@@ -1785,6 +1786,8 @@ Optional Features:
    --enable-version-specific-runtime-libs
                            specify that runtime libraries should be installed
                            in a compiler-specific directory
@@ -81,7 +81,7 @@ index 7218b0c331a..d7445339f9a 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -31932,6 +31935,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -31982,6 +31985,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -105,10 +105,10 @@ index 7218b0c331a..d7445339f9a 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 49f043ed29b..fe488f2232b 100644
+index 23bee7010a3..36ce78924de 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -7393,6 +7393,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -7421,6 +7421,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -132,10 +132,10 @@ index 49f043ed29b..fe488f2232b 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 35508efb4ef..40f798eac78 100644
+index 07b440190c3..b2de464798a 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -369,6 +369,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -379,6 +379,7 @@ Objective-C and Objective-C++ Dialects}.
  -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded @gol
  -Wparentheses  -Wno-pedantic-ms-format @gol
  -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
@@ -143,7 +143,7 @@ index 35508efb4ef..40f798eac78 100644
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
  -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
  -Wno-scalar-storage-order  -Wsequence-point @gol
-@@ -7728,6 +7729,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -8029,6 +8030,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -158,11 +158,11 @@ index 35508efb4ef..40f798eac78 100644
  @item -Wfloat-equal
  @opindex Wfloat-equal
  @opindex Wno-float-equal
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 0af888c7d78..b047fc31c2f 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1152,6 +1152,8 @@ proper position among the other output files.  */
+diff --git a/gcc/gcc.cc b/gcc/gcc.cc
+index bb07cc244e3..ce161d3c853 100644
+--- a/gcc/gcc.cc
++++ b/gcc/gcc.cc
+@@ -1159,6 +1159,8 @@ proper position among the other output files.  */
     "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
@@ -171,7 +171,7 @@ index 0af888c7d78..b047fc31c2f 100644
      %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
-@@ -1247,8 +1249,11 @@ static const char *cpp_unique_options =
+@@ -1254,8 +1256,11 @@ static const char *cpp_unique_options =
  static const char *cpp_options =
  "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} %{w}\
   %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
@@ -185,10 +185,10 @@ index 0af888c7d78..b047fc31c2f 100644
  
  /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
  
-diff --git a/gcc/incpath.c b/gcc/incpath.c
-index 446d280321d..fbfc0ce03b8 100644
---- a/gcc/incpath.c
-+++ b/gcc/incpath.c
+diff --git a/gcc/incpath.cc b/gcc/incpath.cc
+index bd2a97938eb..c80f100f476 100644
+--- a/gcc/incpath.cc
++++ b/gcc/incpath.cc
 @@ -26,6 +26,7 @@
  #include "intl.h"
  #include "incpath.h"
@@ -197,7 +197,7 @@ index 446d280321d..fbfc0ce03b8 100644
  
  /* Microsoft Windows does not natively support inodes.
     VMS has non-numeric inodes.  */
-@@ -395,6 +396,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+@@ -399,6 +400,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
  	}
        fprintf (stderr, _("End of search list.\n"));
      }
diff --git a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
index c0e8cbd4d9d..e83f05b8aa1 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From b87a3ac51df372128be2fda992238c5aab4a719a Mon Sep 17 00:00:00 2001
+From 34b861e7a4cfd7b1f0d2c0f8cf9bb0b0b81eb61a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack.
@@ -28,6 +28,7 @@ Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/config/aarch64/t-aarch64-linux |  8 ++++----
  gcc/config/arc/t-multilib-linux    |  4 ++--
@@ -38,7 +39,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  6 files changed, 17 insertions(+), 22 deletions(-)
 
 diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
-index 241b0ef20b6..a7dadb2d64f 100644
+index d0cd546002a..f4056d68372 100644
 --- a/gcc/config/aarch64/t-aarch64-linux
 +++ b/gcc/config/aarch64/t-aarch64-linux
 @@ -21,8 +21,8 @@
@@ -55,7 +56,7 @@ index 241b0ef20b6..a7dadb2d64f 100644
 -MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 +#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 diff --git a/gcc/config/arc/t-multilib-linux b/gcc/config/arc/t-multilib-linux
-index fc3fff640a2..d58e28f6df8 100644
+index ecb9ae6859f..12a164028d4 100644
 --- a/gcc/config/arc/t-multilib-linux
 +++ b/gcc/config/arc/t-multilib-linux
 @@ -16,9 +16,9 @@
@@ -71,7 +72,7 @@ index fc3fff640a2..d58e28f6df8 100644
  # Aliases:
  MULTILIB_MATCHES += mcpu?arc700=mA7
 diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
-index d288b093522..7b5980a9d21 100644
+index 5526ad0e6cc..fa51c88912b 100644
 --- a/gcc/config/i386/t-linux64
 +++ b/gcc/config/i386/t-linux64
 @@ -32,7 +32,5 @@
@@ -85,7 +86,7 @@ index d288b093522..7b5980a9d21 100644
 +MULTILIB_DIRNAMES = . .
 +MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
 diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
-index 130e1f04707..3b7eb6b2a2f 100644
+index 2fdd8e00407..04f2099250f 100644
 --- a/gcc/config/mips/t-linux64
 +++ b/gcc/config/mips/t-linux64
 @@ -17,10 +17,6 @@
@@ -115,7 +116,7 @@ index 216d2776a18..e4d817621fc 100644
 +#MULTILIB_OSDIRNAMES := $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
 +MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
 diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
-index e11a118cb5f..4eaffb416fe 100644
+index 47e0efd5764..05f5a3f188e 100644
 --- a/gcc/config/rs6000/t-linux64
 +++ b/gcc/config/rs6000/t-linux64
 @@ -26,10 +26,9 @@
@@ -129,5 +130,5 @@ index e11a118cb5f..4eaffb416fe 100644
 -MULTILIB_OSDIRNAMES += m32=$(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc-linux-gnu)
 +MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
  
- rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
+ rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.cc
  	$(COMPILE) $<
diff --git a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch b/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
deleted file mode 100644
index 2995a6fc613..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From 1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3 Mon Sep 17 00:00:00 2001
-From: David Malcolm <dmalcolm@redhat.com>
-Date: Tue, 2 Nov 2021 09:54:32 -0400
-Subject: [PATCH] libcpp: escape non-ASCII source bytes in -Wbidi-chars=
- [PR103026]
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-This flags rich_locations associated with -Wbidi-chars= so that
-non-ASCII bytes will be escaped when printing the source lines
-(using the diagnostics support I added in
-r12-4825-gbd5e882cf6e0def3dd1bc106075d59a303fe0d1e).
-
-In particular, this ensures that the printed source lines will
-be pure ASCII, and thus the visual ordering of the characters
-will be the same as the logical ordering.
-
-Before:
-
-  Wbidi-chars-1.c: In function âmainâ:
-  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
-      6 |     /*â® } â¦if (isAdmin)â© â¦ begin admins only */
-        |                                           ^
-  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
-      9 |     /* end admins only â® { â¦*/
-        |                            ^
-
-  Wbidi-chars-11.c:6:15: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
-      6 | int LRE_âª_PDF_\u202c;
-        |               ^
-  Wbidi-chars-11.c:8:19: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
-      8 | int LRE_\u202a_PDF_â¬_;
-        |                   ^
-  Wbidi-chars-11.c:10:28: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
-     10 | const char *s1 = "LRE_âª_PDF_\u202c";
-        |                            ^
-  Wbidi-chars-11.c:12:33: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
-     12 | const char *s2 = "LRE_\u202a_PDF_â¬";
-        |                                 ^
-
-After:
-
-  Wbidi-chars-1.c: In function âmainâ:
-  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
-      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins only */
-        |                                                                           ^
-  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
-      9 |     /* end admins only <U+202E> { <U+2066>*/
-        |                                            ^
-
-  Wbidi-chars-11.c:6:15: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
-      6 | int LRE_<U+202A>_PDF_\u202c;
-        |                       ^
-  Wbidi-chars-11.c:8:19: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
-      8 | int LRE_\u202a_PDF_<U+202C>_;
-        |                   ^
-  Wbidi-chars-11.c:10:28: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
-     10 | const char *s1 = "LRE_<U+202A>_PDF_\u202c";
-        |                                    ^
-  Wbidi-chars-11.c:12:33: warning: UTF-8 vs UCN mismatch when closing a context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=]
-     12 | const char *s2 = "LRE_\u202a_PDF_<U+202C>";
-        |                                 ^
-
-libcpp/ChangeLog:
-	PR preprocessor/103026
-	* lex.c (maybe_warn_bidi_on_close): Use a rich_location
-	and call set_escape_on_output (true) on it.
-	(maybe_warn_bidi_on_char): Likewise.
-
-Signed-off-by: David Malcolm <dmalcolm@redhat.com>
-
-CVE: CVE-2021-42574
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3]
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
-
----
- libcpp/lex.c | 29 +++++++++++++++++------------
- 1 file changed, 17 insertions(+), 12 deletions(-)
-
-diff --git a/libcpp/lex.c b/libcpp/lex.c
-index 8188e33b07d..2421d6c0f40 100644
---- a/libcpp/lex.c
-+++ b/libcpp/lex.c
-@@ -1427,9 +1427,11 @@ maybe_warn_bidi_on_close (cpp_reader *pfile, const uchar *p)
-       const location_t loc
- 	= linemap_position_for_column (pfile->line_table,
- 				       CPP_BUF_COLUMN (pfile->buffer, p));
--      cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
--			     "unpaired UTF-8 bidirectional control character "
--			     "detected");
-+      rich_location rich_loc (pfile->line_table, loc);
-+      rich_loc.set_escape_on_output (true);
-+      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
-+		      "unpaired UTF-8 bidirectional control character "
-+		      "detected");
-     }
-   /* We're done with this context.  */
-   bidi::on_close ();
-@@ -1454,6 +1456,9 @@ maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind kind,
-       const location_t loc
- 	= linemap_position_for_column (pfile->line_table,
- 				       CPP_BUF_COLUMN (pfile->buffer, p));
-+      rich_location rich_loc (pfile->line_table, loc);
-+      rich_loc.set_escape_on_output (true);
-+
-       /* It seems excessive to warn about a PDI/PDF that is closing
- 	 an opened context because we've already warned about the
- 	 opening character.  Except warn when we have a UCN x UTF-8
-@@ -1462,20 +1467,20 @@ maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind kind,
- 	{
- 	  if (warn_bidi == bidirectional_unpaired
- 	      && bidi::current_ctx_ucn_p () != ucn_p)
--	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
--				   "UTF-8 vs UCN mismatch when closing "
--				   "a context by \"%s\"", bidi::to_str (kind));
-+	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
-+			    "UTF-8 vs UCN mismatch when closing "
-+			    "a context by \"%s\"", bidi::to_str (kind));
- 	}
-       else if (warn_bidi == bidirectional_any)
- 	{
- 	  if (kind == bidi::kind::PDF || kind == bidi::kind::PDI)
--	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
--				   "\"%s\" is closing an unopened context",
--				   bidi::to_str (kind));
-+	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
-+			    "\"%s\" is closing an unopened context",
-+			    bidi::to_str (kind));
- 	  else
--	    cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
--				   "found problematic Unicode character \"%s\"",
--				   bidi::to_str (kind));
-+	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
-+			    "found problematic Unicode character \"%s\"",
-+			    bidi::to_str (kind));
- 	}
-     }
-   /* We're done with this context.  */
--- 
-2.27.0
-
diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
deleted file mode 100644
index 4999c71b641..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
+++ /dev/null
@@ -1,573 +0,0 @@
-From bef32d4a28595e933f24fef378cf052a30b674a7 Mon Sep 17 00:00:00 2001
-From: David Malcolm <dmalcolm@redhat.com>
-Date: Tue, 2 Nov 2021 15:45:22 -0400
-Subject: [PATCH] libcpp: capture and underline ranges in -Wbidi-chars=
- [PR103026]
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-This patch converts the bidi::vec to use a struct so that we can
-capture location_t values for the bidirectional control characters.
-
-Before:
-
-  Wbidi-chars-1.c: In function âmainâ:
-  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
-      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins only */
-        |                                                                           ^
-  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control character detected [-Wbidi-chars=]
-      9 |     /* end admins only <U+202E> { <U+2066>*/
-        |                                            ^
-
-After:
-
-  Wbidi-chars-1.c: In function âmainâ:
-  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control characters detected [-Wbidi-chars=]
-      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins only */
-        |       ~~~~~~~~                                ~~~~~~~~                    ^
-        |       |                                       |                           |
-        |       |                                       |                           end of bidirectional context
-        |       U+202E (RIGHT-TO-LEFT OVERRIDE)         U+2066 (LEFT-TO-RIGHT ISOLATE)
-  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control characters detected [-Wbidi-chars=]
-      9 |     /* end admins only <U+202E> { <U+2066>*/
-        |                        ~~~~~~~~   ~~~~~~~~ ^
-        |                        |          |        |
-        |                        |          |        end of bidirectional context
-        |                        |          U+2066 (LEFT-TO-RIGHT ISOLATE)
-        |                        U+202E (RIGHT-TO-LEFT OVERRIDE)
-
-Signed-off-by: David Malcolm <dmalcolm@redhat.com>
-
-gcc/testsuite/ChangeLog:
-	PR preprocessor/103026
-	* c-c++-common/Wbidi-chars-ranges.c: New test.
-
-libcpp/ChangeLog:
-	PR preprocessor/103026
-	* lex.c (struct bidi::context): New.
-	(bidi::vec): Convert to a vec of context rather than unsigned
-	char.
-	(bidi::ctx_at): Rename to...
-	(bidi::pop_kind_at): ...this and reimplement for above change.
-	(bidi::current_ctx): Update for change to vec.
-	(bidi::current_ctx_ucn_p): Likewise.
-	(bidi::current_ctx_loc): New.
-	(bidi::on_char): Update for usage of context struct.  Add "loc"
-	param and pass it when pushing contexts.
-	(get_location_for_byte_range_in_cur_line): New.
-	(get_bidi_utf8): Rename to...
-	(get_bidi_utf8_1): ...this, reintroducing...
-	(get_bidi_utf8): ...as a wrapper, setting *OUT when the result is
-	not NONE.
-	(get_bidi_ucn): Rename to...
-	(get_bidi_ucn_1): ...this, reintroducing...
-	(get_bidi_ucn): ...as a wrapper, setting *OUT when the result is
-	not NONE.
-	(class unpaired_bidi_rich_location): New.
-	(maybe_warn_bidi_on_close): Use unpaired_bidi_rich_location when
-	reporting on unpaired bidi chars.  Split into singular vs plural
-	spellings.
-	(maybe_warn_bidi_on_char): Pass in a location_t rather than a
-	const uchar * and use it when emitting warnings, and when calling
-	bidi::on_char.
-	(_cpp_skip_block_comment): Capture location when kind is not NONE
-	and pass it to maybe_warn_bidi_on_char.
-	(skip_line_comment): Likewise.
-	(forms_identifier_p): Likewise.
-	(lex_raw_string): Likewise.
-	(lex_string): Likewise.
-
-Signed-off-by: David Malcolm <dmalcolm@redhat.com>
-
-CVE: CVE-2021-42574
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bef32d4a28595e933f24fef378cf052a30b674a7]
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
-
----
- .../c-c++-common/Wbidi-chars-ranges.c         |  54 ++++
- libcpp/lex.c                                  | 251 ++++++++++++++----
- 2 files changed, 257 insertions(+), 48 deletions(-)
- create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
-
-diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
-new file mode 100644
-index 00000000000..298750a2a64
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
-@@ -0,0 +1,54 @@
-+/* PR preprocessor/103026 */
-+/* { dg-do compile } */
-+/* { dg-options "-Wbidi-chars=unpaired -fdiagnostics-show-caret" } */
-+/* Verify that we escape and underline pertinent bidirectional
-+   control characters when quoting the source.  */
-+
-+int test_unpaired_bidi () {
-+    int isAdmin = 0;
-+    /*â® } â¦if (isAdmin)â© â¦ begin admins only */
-+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
-+#if 0
-+   { dg-begin-multiline-output "" }
-+     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins only */
-+       ~~~~~~~~                                ~~~~~~~~                    ^
-+       |                                       |                           |
-+       |                                       |                           end of bidirectional context
-+       U+202E (RIGHT-TO-LEFT OVERRIDE)         U+2066 (LEFT-TO-RIGHT ISOLATE)
-+   { dg-end-multiline-output "" }
-+#endif
-+
-+        __builtin_printf("You are an admin.\n");
-+    /* end admins only â® { â¦*/
-+/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
-+#if 0
-+   { dg-begin-multiline-output "" }
-+     /* end admins only <U+202E> { <U+2066>*/
-+                        ~~~~~~~~   ~~~~~~~~ ^
-+                        |          |        |
-+                        |          |        end of bidirectional context
-+                        |          U+2066 (LEFT-TO-RIGHT ISOLATE)
-+                        U+202E (RIGHT-TO-LEFT OVERRIDE)
-+   { dg-end-multiline-output "" }
-+#endif
-+
-+    return 0;
-+}
-+
-+int LRE_âª_PDF_\u202c;
-+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
-+#if 0
-+   { dg-begin-multiline-output "" }
-+ int LRE_<U+202A>_PDF_\u202c;
-+         ~~~~~~~~     ^~~~~~
-+   { dg-end-multiline-output "" }
-+#endif
-+
-+const char *s1 = "LRE_âª_PDF_\u202c";
-+/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
-+#if 0
-+   { dg-begin-multiline-output "" }
-+ const char *s1 = "LRE_<U+202A>_PDF_\u202c";
-+                       ~~~~~~~~     ^~~~~~
-+   { dg-end-multiline-output "" }
-+#endif
-diff --git a/libcpp/lex.c b/libcpp/lex.c
-index 2421d6c0f40..94c36f0d014 100644
---- a/libcpp/lex.c
-+++ b/libcpp/lex.c
-@@ -1172,11 +1172,34 @@ namespace bidi {
-   /* All the UTF-8 encodings of bidi characters start with E2.  */
-   constexpr uchar utf8_start = 0xe2;
- 
-+  struct context
-+  {
-+    context () {}
-+    context (location_t loc, kind k, bool pdf, bool ucn)
-+    : m_loc (loc), m_kind (k), m_pdf (pdf), m_ucn (ucn)
-+    {
-+    }
-+
-+    kind get_pop_kind () const
-+    {
-+      return m_pdf ? kind::PDF : kind::PDI;
-+    }
-+    bool ucn_p () const
-+    {
-+      return m_ucn;
-+    }
-+
-+    location_t m_loc;
-+    kind m_kind;
-+    unsigned m_pdf : 1;
-+    unsigned m_ucn : 1;
-+  };
-+
-   /* A vector holding currently open bidi contexts.  We use a char for
-      each context, its LSB is 1 if it represents a PDF context, 0 if it
-      represents a PDI context.  The next bit is 1 if this context was open
-      by a bidi character written as a UCN, and 0 when it was UTF-8.  */
--  semi_embedded_vec <unsigned char, 16> vec;
-+  semi_embedded_vec <context, 16> vec;
- 
-   /* Close the whole comment/identifier/string literal/character constant
-      context.  */
-@@ -1193,19 +1216,19 @@ namespace bidi {
-     vec.truncate (len - 1);
-   }
- 
--  /* Return the context of the Ith element.  */
--  kind ctx_at (unsigned int i)
-+  /* Return the pop kind of the context of the Ith element.  */
-+  kind pop_kind_at (unsigned int i)
-   {
--    return (vec[i] & 1) ? kind::PDF : kind::PDI;
-+    return vec[i].get_pop_kind ();
-   }
- 
--  /* Return which context is currently opened.  */
-+  /* Return the pop kind of the context that is currently opened.  */
-   kind current_ctx ()
-   {
-     unsigned int len = vec.count ();
-     if (len == 0)
-       return kind::NONE;
--    return ctx_at (len - 1);
-+    return vec[len - 1].get_pop_kind ();
-   }
- 
-   /* Return true if the current context comes from a UCN origin, that is,
-@@ -1214,11 +1237,19 @@ namespace bidi {
-   {
-     unsigned int len = vec.count ();
-     gcc_checking_assert (len > 0);
--    return (vec[len - 1] >> 1) & 1;
-+    return vec[len - 1].m_ucn;
-   }
- 
--  /* We've read a bidi char, update the current vector as necessary.  */
--  void on_char (kind k, bool ucn_p)
-+  location_t current_ctx_loc ()
-+  {
-+    unsigned int len = vec.count ();
-+    gcc_checking_assert (len > 0);
-+    return vec[len - 1].m_loc;
-+  }
-+
-+  /* We've read a bidi char, update the current vector as necessary.
-+     LOC is only valid when K is not kind::NONE.  */
-+  void on_char (kind k, bool ucn_p, location_t loc)
-   {
-     switch (k)
-       {
-@@ -1226,12 +1257,12 @@ namespace bidi {
-       case kind::RLE:
-       case kind::LRO:
-       case kind::RLO:
--	vec.push (ucn_p ? 3u : 1u);
-+	vec.push (context (loc, k, true, ucn_p));
- 	break;
-       case kind::LRI:
-       case kind::RLI:
-       case kind::FSI:
--	vec.push (ucn_p ? 2u : 0u);
-+	vec.push (context (loc, k, false, ucn_p));
- 	break;
-       /* PDF terminates the scope of the last LRE, RLE, LRO, or RLO
- 	 whose scope has not yet been terminated.  */
-@@ -1245,7 +1276,7 @@ namespace bidi {
- 	 yet been terminated.  */
-       case kind::PDI:
- 	for (int i = vec.count () - 1; i >= 0; --i)
--	  if (ctx_at (i) == kind::PDI)
-+	  if (pop_kind_at (i) == kind::PDI)
- 	    {
- 	      vec.truncate (i);
- 	      break;
-@@ -1295,10 +1326,47 @@ namespace bidi {
-   }
- }
- 
-+/* Get location_t for the range of bytes [START, START + NUM_BYTES)
-+   within the current line in FILE, with the caret at START.  */
-+
-+static location_t
-+get_location_for_byte_range_in_cur_line (cpp_reader *pfile,
-+					 const unsigned char *const start,
-+					 size_t num_bytes)
-+{
-+  gcc_checking_assert (num_bytes > 0);
-+
-+  /* CPP_BUF_COLUMN and linemap_position_for_column both refer
-+     to offsets in bytes, but CPP_BUF_COLUMN is 0-based,
-+     whereas linemap_position_for_column is 1-based.  */
-+
-+  /* Get 0-based offsets within the line.  */
-+  size_t start_offset = CPP_BUF_COLUMN (pfile->buffer, start);
-+  size_t end_offset = start_offset + num_bytes - 1;
-+
-+  /* Now convert to location_t, where "columns" are 1-based byte offsets.  */
-+  location_t start_loc = linemap_position_for_column (pfile->line_table,
-+						      start_offset + 1);
-+  location_t end_loc = linemap_position_for_column (pfile->line_table,
-+						     end_offset + 1);
-+
-+  if (start_loc == end_loc)
-+    return start_loc;
-+
-+  source_range src_range;
-+  src_range.m_start = start_loc;
-+  src_range.m_finish = end_loc;
-+  location_t combined_loc = COMBINE_LOCATION_DATA (pfile->line_table,
-+						   start_loc,
-+						   src_range,
-+						   NULL);
-+  return combined_loc;
-+}
-+
- /* Parse a sequence of 3 bytes starting with P and return its bidi code.  */
- 
- static bidi::kind
--get_bidi_utf8 (const unsigned char *const p)
-+get_bidi_utf8_1 (const unsigned char *const p)
- {
-   gcc_checking_assert (p[0] == bidi::utf8_start);
- 
-@@ -1340,10 +1408,25 @@ get_bidi_utf8 (const unsigned char *cons
-   return bidi::kind::NONE;
- }
- 
-+/* Parse a sequence of 3 bytes starting with P and return its bidi code.
-+   If the kind is not NONE, write the location to *OUT.*/
-+
-+static bidi::kind
-+get_bidi_utf8 (cpp_reader *pfile, const unsigned char *const p, location_t *out)
-+{
-+  bidi::kind result = get_bidi_utf8_1 (p);
-+  if (result != bidi::kind::NONE)
-+    {
-+      /* We have a sequence of 3 bytes starting at P.  */
-+      *out = get_location_for_byte_range_in_cur_line (pfile, p, 3);
-+    }
-+  return result;
-+}
-+
- /* Parse a UCN where P points just past \u or \U and return its bidi code.  */
- 
- static bidi::kind
--get_bidi_ucn (const unsigned char *p, bool is_U)
-+get_bidi_ucn_1 (const unsigned char *p, bool is_U)
- {
-   /* 6.4.3 Universal Character Names
-       \u hex-quad
-@@ -1412,6 +1495,62 @@ get_bidi_ucn (const unsigned char *p, bo
-   return bidi::kind::NONE;
- }
- 
-+/* Parse a UCN where P points just past \u or \U and return its bidi code.
-+   If the kind is not NONE, write the location to *OUT.*/
-+
-+static bidi::kind
-+get_bidi_ucn (cpp_reader *pfile,  const unsigned char *p, bool is_U,
-+	      location_t *out)
-+{
-+  bidi::kind result = get_bidi_ucn_1 (p, is_U);
-+  if (result != bidi::kind::NONE)
-+    {
-+      const unsigned char *start = p - 2;
-+      size_t num_bytes = 2 + (is_U ? 8 : 4);
-+      *out = get_location_for_byte_range_in_cur_line (pfile, start, num_bytes);
-+    }
-+  return result;
-+}
-+
-+/* Subclass of rich_location for reporting on unpaired UTF-8
-+   bidirectional control character(s).
-+   Escape the source lines on output, and show all unclosed
-+   bidi context, labelling everything.  */
-+
-+class unpaired_bidi_rich_location : public rich_location
-+{
-+ public:
-+  class custom_range_label : public range_label
-+  {
-+   public:
-+     label_text get_text (unsigned range_idx) const FINAL OVERRIDE
-+     {
-+       /* range 0 is the primary location; each subsequent range i + 1
-+	  is for bidi::vec[i].  */
-+       if (range_idx > 0)
-+	 {
-+	   const bidi::context &ctxt (bidi::vec[range_idx - 1]);
-+	   return label_text::borrow (bidi::to_str (ctxt.m_kind));
-+	 }
-+       else
-+	 return label_text::borrow (_("end of bidirectional context"));
-+     }
-+  };
-+
-+  unpaired_bidi_rich_location (cpp_reader *pfile, location_t loc)
-+  : rich_location (pfile->line_table, loc, &m_custom_label)
-+  {
-+    set_escape_on_output (true);
-+    for (unsigned i = 0; i < bidi::vec.count (); i++)
-+      add_range (bidi::vec[i].m_loc,
-+		 SHOW_RANGE_WITHOUT_CARET,
-+		 &m_custom_label);
-+  }
-+
-+ private:
-+   custom_range_label m_custom_label;
-+};
-+
- /* We're closing a bidi context, that is, we've encountered a newline,
-    are closing a C-style comment, or are at the end of a string literal,
-    character constant, or identifier.  Warn if this context was not
-@@ -1427,11 +1566,17 @@ maybe_warn_bidi_on_close (cpp_reader *pf
-       const location_t loc
- 	= linemap_position_for_column (pfile->line_table,
- 				       CPP_BUF_COLUMN (pfile->buffer, p));
--      rich_location rich_loc (pfile->line_table, loc);
--      rich_loc.set_escape_on_output (true);
--      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
--		      "unpaired UTF-8 bidirectional control character "
--		      "detected");
-+      unpaired_bidi_rich_location rich_loc (pfile, loc);
-+      /* cpp_callbacks doesn't yet have a way to handle singular vs plural
-+	 forms of a diagnostic, so fake it for now.  */
-+      if (bidi::vec.count () > 1)
-+	cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
-+			"unpaired UTF-8 bidirectional control characters "
-+			"detected");
-+      else
-+	cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
-+			"unpaired UTF-8 bidirectional control character "
-+			"detected");
-     }
-   /* We're done with this context.  */
-   bidi::on_close ();
-@@ -1439,12 +1584,13 @@ maybe_warn_bidi_on_close (cpp_reader *pf
- 
- /* We're at the beginning or in the middle of an identifier/comment/string
-    literal/character constant.  Warn if we've encountered a bidi character.
--   KIND says which bidi character it was; P points to it in the character
--   stream.  UCN_P is true iff this bidi character was written as a UCN.  */
-+   KIND says which bidi control character it was; UCN_P is true iff this bidi
-+   control character was written as a UCN.  LOC is the location of the
-+   character, but is only valid if KIND != bidi::kind::NONE.  */
- 
- static void
--maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind kind,
--			 bool ucn_p)
-+maybe_warn_bidi_on_char (cpp_reader *pfile, bidi::kind kind,
-+			 bool ucn_p, location_t loc)
- {
-   if (__builtin_expect (kind == bidi::kind::NONE, 1))
-     return;
-@@ -1453,9 +1599,6 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
- 
-   if (warn_bidi != bidirectional_none)
-     {
--      const location_t loc
--	= linemap_position_for_column (pfile->line_table,
--				       CPP_BUF_COLUMN (pfile->buffer, p));
-       rich_location rich_loc (pfile->line_table, loc);
-       rich_loc.set_escape_on_output (true);
- 
-@@ -1467,9 +1610,12 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
- 	{
- 	  if (warn_bidi == bidirectional_unpaired
- 	      && bidi::current_ctx_ucn_p () != ucn_p)
--	    cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
--			    "UTF-8 vs UCN mismatch when closing "
--			    "a context by \"%s\"", bidi::to_str (kind));
-+	    {
-+	      rich_loc.add_range (bidi::current_ctx_loc ());
-+	      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
-+			      "UTF-8 vs UCN mismatch when closing "
-+			      "a context by \"%s\"", bidi::to_str (kind));
-+	    }
- 	}
-       else if (warn_bidi == bidirectional_any)
- 	{
-@@ -1484,7 +1630,7 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
- 	}
-     }
-   /* We're done with this context.  */
--  bidi::on_char (kind, ucn_p);
-+  bidi::on_char (kind, ucn_p, loc);
- }
- 
- /* Skip a C-style block comment.  We find the end of the comment by
-@@ -1552,8 +1698,9 @@ _cpp_skip_block_comment (cpp_reader *pfi
- 	 a bidirectional control character.  */
-       else if (__builtin_expect (c == bidi::utf8_start, 0) && warn_bidi_p)
- 	{
--	  bidi::kind kind = get_bidi_utf8 (cur - 1);
--	  maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=*/false);
-+	  location_t loc;
-+	  bidi::kind kind = get_bidi_utf8 (pfile, cur - 1, &loc);
-+	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/false, loc);
- 	}
-     }
- 
-@@ -1586,9 +1733,9 @@ skip_line_comment (cpp_reader *pfile)
- 	    {
- 	      if (__builtin_expect (*buffer->cur == bidi::utf8_start, 0))
- 		{
--		  bidi::kind kind = get_bidi_utf8 (buffer->cur);
--		  maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
--					   /*ucn_p=*/false);
-+		  location_t loc;
-+		  bidi::kind kind = get_bidi_utf8 (pfile, buffer->cur, &loc);
-+		  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/false, loc);
- 		}
- 	      buffer->cur++;
- 	    }
-@@ -1708,9 +1855,9 @@ forms_identifier_p (cpp_reader *pfile, i
- 	  if (__builtin_expect (*buffer->cur == bidi::utf8_start, 0)
- 	      && warn_bidi_p)
- 	    {
--	      bidi::kind kind = get_bidi_utf8 (buffer->cur);
--	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
--				       /*ucn_p=*/false);
-+	      location_t loc;
-+	      bidi::kind kind = get_bidi_utf8 (pfile, buffer->cur, &loc);
-+	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/false, loc);
- 	    }
- 	  if (_cpp_valid_utf8 (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
- 			       state, &s))
-@@ -1722,10 +1869,12 @@ forms_identifier_p (cpp_reader *pfile, i
- 	  buffer->cur += 2;
- 	  if (warn_bidi_p)
- 	    {
--	      bidi::kind kind = get_bidi_ucn (buffer->cur,
--					      buffer->cur[-1] == 'U');
--	      maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
--				       /*ucn_p=*/true);
-+	      location_t loc;
-+	      bidi::kind kind = get_bidi_ucn (pfile,
-+					      buffer->cur,
-+					      buffer->cur[-1] == 'U',
-+					      &loc);
-+	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/true, loc);
- 	    }
- 	  if (_cpp_valid_ucn (pfile, &buffer->cur, buffer->rlimit, 1 + !first,
- 			      state, &s, NULL, NULL))
-@@ -2336,8 +2485,11 @@ lex_raw_string (cpp_reader *pfile, cpp_t
- 	}
-       else if (__builtin_expect ((unsigned char) c == bidi::utf8_start, 0)
- 	       && warn_bidi_p)
--	maybe_warn_bidi_on_char (pfile, pos - 1, get_bidi_utf8 (pos - 1),
--				 /*ucn_p=*/false);
-+	{
-+	  location_t loc;
-+	  bidi::kind kind = get_bidi_utf8 (pfile, pos - 1, &loc);
-+	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/false, loc);
-+	}
-     }
- 
-   if (warn_bidi_p)
-@@ -2447,8 +2599,10 @@ lex_string (cpp_reader *pfile, cpp_token
- 	{
- 	  if ((cur[0] == 'u' || cur[0] == 'U') && warn_bidi_p)
- 	    {
--	      bidi::kind kind = get_bidi_ucn (cur + 1, cur[0] == 'U');
--	      maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=*/true);
-+	      location_t loc;
-+	      bidi::kind kind = get_bidi_ucn (pfile, cur + 1, cur[0] == 'U',
-+					      &loc);
-+	      maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/true, loc);
- 	    }
- 	  cur++;
- 	}
-@@ -2476,8 +2630,9 @@ lex_string (cpp_reader *pfile, cpp_token
- 	saw_NUL = true;
-       else if (__builtin_expect (c == bidi::utf8_start, 0) && warn_bidi_p)
- 	{
--	  bidi::kind kind = get_bidi_utf8 (cur - 1);
--	  maybe_warn_bidi_on_char (pfile, cur - 1, kind, /*ucn_p=*/false);
-+	  location_t loc;
-+	  bidi::kind kind = get_bidi_utf8 (pfile, cur - 1, &loc);
-+	  maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=*/false, loc);
- 	}
-     }
- 
diff --git a/meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
rename to meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
index 7f807a991c0..e8f21634769 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
@@ -1,10 +1,10 @@
-From 2c2a92573598ddbc33c023fe5d499191491fb523 Mon Sep 17 00:00:00 2001
+From 7f40f8321fb999e9b34d948724517d3fb0d26820 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 28 Oct 2021 11:33:40 +0100
-Subject: [PATCH] If CXXFLAGS contains something unsupported by the build CXX,
- we see build failures (e.g. using -fmacro-prefix-map for the target).
+Subject: [PATCH] Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these
+ errors.
 
-Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these errors.
+If CXXFLAGS contains something unsupported by the build CXX, we see build failures (e.g. using -fmacro-prefix-map for the target).
 
 2021-10-28 Richard Purdie <richard.purdie@linuxfoundation.org>
 
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 4 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 33476d53327..b949dffee0e 100644
+index 593495e1650..1d9c83cc566 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -176,6 +176,7 @@ BUILD_EXPORTS = \
@@ -43,7 +43,7 @@ index 33476d53327..b949dffee0e 100644
  	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
  	LD="$(LD)"; export LD; \
 diff --git a/Makefile.tpl b/Makefile.tpl
-index e39d85d1109..d8520cbb164 100644
+index ef58fac2b9a..bab04f335c2 100644
 --- a/Makefile.tpl
 +++ b/Makefile.tpl
 @@ -179,6 +179,7 @@ BUILD_EXPORTS = \
diff --git a/meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 55a58851dca..e34eb2cf3fb 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From 1766cf28fd7d917df510b1c262c47211b9ea70fa Mon Sep 17 00:00:00 2001
+From 5455fc1de74897a27c1199dc5611ec02243e24af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
@@ -26,10 +26,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 7bfd6ce653f..95962ae37b6 100644
+index 31ff95500c9..a8277254696 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -552,7 +552,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+@@ -553,7 +553,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
  TARGET_SYSTEM_ROOT_DEFINE = @TARGET_SYSTEM_ROOT_DEFINE@
  
  xmake_file=@xmake_file@
@@ -39,10 +39,10 @@ index 7bfd6ce653f..95962ae37b6 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index d7445339f9a..f5b99d1cf7d 100755
+index dc2d59701ad..3fc0e2f5813 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -13131,8 +13131,8 @@ for f in $tm_file; do
+@@ -13381,8 +13381,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -54,10 +54,10 @@ index d7445339f9a..f5b99d1cf7d 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index fe488f2232b..29005f6d18f 100644
+index 36ce78924de..46de496b256 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2294,8 +2294,8 @@ for f in $tm_file; do
+@@ -2332,8 +2332,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -69,7 +69,7 @@ index fe488f2232b..29005f6d18f 100644
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
-index c49acd8f7e4..a0a657bdbb9 100644
+index 91cc43f69ff..8de33713cd8 100644
 --- a/gcc/mkconfig.sh
 +++ b/gcc/mkconfig.sh
 @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
diff --git a/meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
similarity index 82%
rename from meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
index f2883fe074f..b08aecc736d 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From e6a820a19c4cd115d8af7c235c5f9700c7a24730 Mon Sep 17 00:00:00 2001
+From abc3b82ab24169277f2090e9df1ceac3573142be Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
 Subject: [PATCH] cpp: honor sysroot.
@@ -19,14 +19,14 @@ RP 2012/04/13
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582725.html]
+Upstream-Status: Pending
 ---
  gcc/cp/lang-specs.h | 2 +-
- gcc/gcc.c           | 2 +-
+ gcc/gcc.cc          | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
-index 8902ae1d2ed..e99e2fcd6ad 100644
+index f35c9fab76b..19ddc98ce7f 100644
 --- a/gcc/cp/lang-specs.h
 +++ b/gcc/cp/lang-specs.h
 @@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -38,11 +38,11 @@ index 8902ae1d2ed..e99e2fcd6ad 100644
        "  %{!fsyntax-only:"
        "    %{fmodule-only:%{!S:-o %g.s%V}}"
        "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index b047fc31c2f..bdee2671532 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1469,7 +1469,7 @@ static const struct compiler default_compilers[] =
+diff --git a/gcc/gcc.cc b/gcc/gcc.cc
+index ce161d3c853..aa4cf92fb78 100644
+--- a/gcc/gcc.cc
++++ b/gcc/gcc.cc
+@@ -1476,7 +1476,7 @@ static const struct compiler default_compilers[] =
  					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
    {".i", "@cpp-output", 0, 0, 0},
    {"@cpp-output",
diff --git a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 58%
rename from meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index ef19eef8225..b59eed57e9e 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 84dd8ea4c982fc2c82af642293d29e9c1880de5b Mon Sep 17 00:00:00 2001
+From 4de00af67b57b5440bdf61ab364ad959ad0aeee7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -12,26 +12,33 @@ SH, sparc, alpha for possible future support (if any)
 
 Removes the do_headerfix task in metadata
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Upstream-Status: Inappropriate [OE configuration]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/config/aarch64/aarch64-linux.h |  4 ++--
  gcc/config/alpha/linux-elf.h       |  4 ++--
- gcc/config/arm/linux-eabi.h        |  4 ++--
+ gcc/config/arm/linux-eabi.h        |  6 +++---
  gcc/config/arm/linux-elf.h         |  2 +-
- gcc/config/i386/linux.h            |  2 +-
- gcc/config/i386/linux64.h          |  6 +++---
+ gcc/config/i386/linux.h            |  4 ++--
+ gcc/config/i386/linux64.h          | 12 ++++++------
  gcc/config/linux.h                 |  8 ++++----
- gcc/config/mips/linux.h            | 12 ++++++------
- gcc/config/riscv/linux.h           |  2 +-
+ gcc/config/loongarch/gnu-user.h    |  4 ++--
+ gcc/config/microblaze/linux.h      |  4 ++--
+ gcc/config/mips/linux.h            | 18 +++++++++---------
+ gcc/config/nios2/linux.h           |  4 ++--
+ gcc/config/riscv/linux.h           |  4 ++--
  gcc/config/rs6000/linux64.h        | 15 +++++----------
- gcc/config/sh/linux.h              |  2 +-
+ gcc/config/rs6000/sysv4.h          |  4 ++--
+ gcc/config/s390/linux.h            |  8 ++++----
+ gcc/config/sh/linux.h              |  4 ++--
  gcc/config/sparc/linux.h           |  2 +-
  gcc/config/sparc/linux64.h         |  4 ++--
- 13 files changed, 31 insertions(+), 36 deletions(-)
+ 18 files changed, 53 insertions(+), 58 deletions(-)
 
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index 7f2529a2a1d..4bcae7f3110 100644
+index 5e4553d79f5..877e8841eb2 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,10 +21,10 @@
@@ -48,7 +55,7 @@ index 7f2529a2a1d..4bcae7f3110 100644
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
 diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
-index c1dae8ca2cf..3ce2b76c1a4 100644
+index 17f16a55910..0a7be38fa63 100644
 --- a/gcc/config/alpha/linux-elf.h
 +++ b/gcc/config/alpha/linux-elf.h
 @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
@@ -63,7 +70,7 @@ index c1dae8ca2cf..3ce2b76c1a4 100644
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
 diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 85d0136e76e..6bd95855827 100644
+index 50cc0bc6d08..17c18b27145 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
 @@ -65,8 +65,8 @@
@@ -77,8 +84,17 @@ index 85d0136e76e..6bd95855827 100644
  #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
  
  #define GLIBC_DYNAMIC_LINKER \
+@@ -89,7 +89,7 @@
+ #define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
+ #endif
+ #define MUSL_DYNAMIC_LINKER \
+-  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
+ 
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
 diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index 0c1c4e70b6b..6bd643ade11 100644
+index df3da67c4f0..37456e9d5a4 100644
 --- a/gcc/config/arm/linux-elf.h
 +++ b/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
@@ -91,7 +107,7 @@ index 0c1c4e70b6b..6bd643ade11 100644
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
 diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
-index 04b274f1654..7aafcf3ac2d 100644
+index 5d99ee56d5b..a76022c9ccc 100644
 --- a/gcc/config/i386/linux.h
 +++ b/gcc/config/i386/linux.h
 @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -102,12 +118,13 @@ index 04b274f1654..7aafcf3ac2d 100644
 +#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
  
  #undef MUSL_DYNAMIC_LINKER
- #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
+-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
 diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
-index b3822ced528..92d303e80d6 100644
+index 8681e36f10d..ddce49b6b60 100644
 --- a/gcc/config/i386/linux64.h
 +++ b/gcc/config/i386/linux64.h
-@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
  #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
  
@@ -119,12 +136,19 @@ index b3822ced528..92d303e80d6 100644
 +#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
  
  #undef MUSL_DYNAMIC_LINKER32
- #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
+-#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-i386.so.1"
+ #undef MUSL_DYNAMIC_LINKER64
+-#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-x86_64.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-x86_64.so.1"
+ #undef MUSL_DYNAMIC_LINKERX32
+-#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
++#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 4e1db60fced..87efc5f69fe 100644
+index 74f70793d90..4ce173384ef 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+@@ -99,10 +99,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
     GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
     GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
     supporting both 32-bit and 64-bit compilation.  */
@@ -139,11 +163,51 @@ index 4e1db60fced..87efc5f69fe 100644
  #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
+diff --git a/gcc/config/loongarch/gnu-user.h b/gcc/config/loongarch/gnu-user.h
+index 664dc9206ad..082bd7cfc6f 100644
+--- a/gcc/config/loongarch/gnu-user.h
++++ b/gcc/config/loongarch/gnu-user.h
+@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.  If not see
+ 
+ #undef GLIBC_DYNAMIC_LINKER
+ #define GLIBC_DYNAMIC_LINKER \
+-  "/lib" ABI_GRLEN_SPEC "/ld-linux-loongarch-" ABI_SPEC ".so.1"
++  SYSTEMLIBS_DIR "ld-linux-loongarch-" ABI_SPEC ".so.1"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER \
+-  "/lib" ABI_GRLEN_SPEC "/ld-musl-loongarch-" ABI_SPEC ".so.1"
++  SYSTEMLIBS_DIR "ld-musl-loongarch-" ABI_SPEC ".so.1"
+ 
+ #undef GNU_USER_TARGET_LINK_SPEC
+ #define GNU_USER_TARGET_LINK_SPEC \
+diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux.h
+index 5b1a365eda4..2e63df1ae9c 100644
+--- a/gcc/config/microblaze/linux.h
++++ b/gcc/config/microblaze/linux.h
+@@ -28,7 +28,7 @@
+ #undef TLS_NEEDS_GOT
+ #define TLS_NEEDS_GOT 1
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "/ld.so.1"
+ #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+ 
+ #if TARGET_BIG_ENDIAN_DEFAULT == 0 /* LE */
+@@ -38,7 +38,7 @@
+ #endif
+ 
+ #undef MUSL_DYNAMIC_LINKER
+-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
+ 
+ #undef  SUBTARGET_EXTRA_SPECS
+ #define SUBTARGET_EXTRA_SPECS \
 diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index 44a85e410d9..8d41b5574f6 100644
+index 230b7789bb8..d96d134bfcf 100644
 --- a/gcc/config/mips/linux.h
 +++ b/gcc/config/mips/linux.h
-@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
+@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.  If not see
  #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
  
  #define GLIBC_DYNAMIC_LINKER32 \
@@ -170,8 +234,35 @@ index 44a85e410d9..8d41b5574f6 100644
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
+-  "/lib/ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
+ #undef MUSL_DYNAMIC_LINKER64
+ #define MUSL_DYNAMIC_LINKER64 \
+-  "/lib/ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
+ #define MUSL_DYNAMIC_LINKERN32 \
+-  "/lib/ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
+ 
+ #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
+ #define GNU_USER_DYNAMIC_LINKERN32 \
+diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
+index f5dd813acad..7a13e1c9799 100644
+--- a/gcc/config/nios2/linux.h
++++ b/gcc/config/nios2/linux.h
+@@ -29,8 +29,8 @@
+ #undef CPP_SPEC
+ #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
+-#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-nios2.so.1"
++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-nios2.so.1"
+ 
+ #undef LINK_SPEC
+ #define LINK_SPEC LINK_SPEC_ENDIAN \
 diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index fce5b896e6e..03aa55cb5ab 100644
+index 38803723ba9..d5ef8a96a19 100644
 --- a/gcc/config/riscv/linux.h
 +++ b/gcc/config/riscv/linux.h
 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -183,11 +274,20 @@ index fce5b896e6e..03aa55cb5ab 100644
  
  #define MUSL_ABI_SUFFIX \
    "%{mabi=ilp32:-sf}" \
+@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.  If not see
+   "%{mabi=lp64d:}"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-riscv" XLEN_SPEC MUSL_ABI_SUFFIX ".so.1"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-riscv" XLEN_SPEC MUSL_ABI_SUFFIX ".so.1"
+ 
+ /* Because RISC-V only has word-sized atomics, it requries libatomic where
+    others do not.  So link libatomic by default, as needed.  */
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index e3f2cd254f6..a11e01faa3d 100644
+index b2a7afabc73..364c1a5b155 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -336,24 +336,19 @@ extern int dot_symbols;
+@@ -339,24 +339,19 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
  
@@ -217,12 +317,55 @@ index e3f2cd254f6..a11e01faa3d 100644
  
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
+diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
+index 7e2519de5d4..a73954d9de5 100644
+--- a/gcc/config/rs6000/sysv4.h
++++ b/gcc/config/rs6000/sysv4.h
+@@ -779,10 +779,10 @@ GNU_USER_TARGET_CC1_SPEC
+ 
+ #define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","")
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER \
+-  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
+ 
+ #ifndef GNU_USER_DYNAMIC_LINKER
+ #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
+diff --git a/gcc/config/s390/linux.h b/gcc/config/s390/linux.h
+index d7b7e7a7b02..0139b4d06ca 100644
+--- a/gcc/config/s390/linux.h
++++ b/gcc/config/s390/linux.h
+@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.  If not see
+ #define MULTILIB_DEFAULTS { "m31" }
+ #endif
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib/ld64.so.1"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64.so.1"
+ 
+ #undef MUSL_DYNAMIC_LINKER32
+-#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-s390.so.1"
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-s390.so.1"
+ #undef MUSL_DYNAMIC_LINKER64
+-#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-s390x.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-s390x.so.1"
+ 
+ #undef  LINK_SPEC
+ #define LINK_SPEC \
 diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index 7558d2f7195..3aaa6c3a078 100644
+index d96d077c99e..7d27f9893ee 100644
 --- a/gcc/config/sh/linux.h
 +++ b/gcc/config/sh/linux.h
-@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
-   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
+@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.  If not see
+ 
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER \
+-  "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
++  SYSTEMLIBS_DIR "ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
    "%{mfdpic:-fdpic}.so.1"
  
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
@@ -231,7 +374,7 @@ index 7558d2f7195..3aaa6c3a078 100644
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
 diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 2550d7ee8f0..a94f4cd8ba2 100644
+index 6a809e9092d..60603765ad6 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
 @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
@@ -244,7 +387,7 @@ index 2550d7ee8f0..a94f4cd8ba2 100644
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
 diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index 95af8afa9b5..63127afb074 100644
+index d08a2ef96fe..e6955da0a5b 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
 @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
diff --git a/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
deleted file mode 100644
index 9f9f8cc8561..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 768e9075e88d811b00207d991123438bb996e4ea Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:26:37 +0400
-Subject: [PATCH] gcc: Fix argument list too long error.
-
-There would be an "Argument list too long" error when the
-build directory is longer than 200, this is caused by:
-
-headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
-
-The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
-it, use the $(sort list) of GNU make which can handle the too long list
-would fix the problem, the header would be short enough after sorted.
-The "tr ' ' '\012'" was used for translating the space to "\n", the
-$(sort list) doesn't need this.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-RP: gcc then added *.h and *.def additions to this list, breaking the original
-fix. Add the sort to the original gcc code, leaving the tr+sort to fix the original
-issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=66e157188bd2f789809e17e85f917534c9381599]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 95962ae37b6..d1d4512bba3 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -3671,7 +3671,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
- # We keep the directory structure for files in config, common/config or
- # c-family and .def files. All other files are flattened to a single directory.
- 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
--	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
-+	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
- 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
- 	for file in $$headers; do \
- 	  if [ -f $$file ] ; then \
diff --git a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
index 358e1d7b3cd..c9bc38ccf08 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
@@ -1,4 +1,4 @@
-From b19700ef0103f9414416b9a779a64d6138c58b1f Mon Sep 17 00:00:00 2001
+From 5117519c1897a49b09fe7fff213b9c2ea15d37f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index ac139542f15..dd67b115f01 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From 10d23d93697167396e223711bf6210e1642ee926 Mon Sep 17 00:00:00 2001
+From 32129f9682d0d27fc67af10f077ad2768935cbe6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
@@ -19,12 +19,12 @@ Upstream-Status: Pending
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 6bd95855827..77befab5da8 100644
+index 17c18b27145..8eacb099317 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
 @@ -91,10 +91,14 @@
  #define MUSL_DYNAMIC_LINKER \
-   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
+   SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
  
 +/* For armv4 we pass --fix-v4bx to linker to support EABI */
 +#undef TARGET_FIX_V4BX_SPEC
diff --git a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index 4912fa9dcef..45edc62eb50 100644
--- a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 5970fb3fadccd8c43f7f7030e6ff51e0295731ef Mon Sep 17 00:00:00 2001
+From bf85b8bbcb4b77725d4c22c1bb25a29f6ff21038 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index f5b99d1cf7d..ec3c24482df 100755
+index 3fc0e2f5813..2f0f0e057a9 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -13111,10 +13111,20 @@ done
+@@ -13361,10 +13361,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index f5b99d1cf7d..ec3c24482df 100755
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -13125,6 +13135,10 @@ tm_file_list="options.h"
+@@ -13375,6 +13385,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index f5b99d1cf7d..ec3c24482df 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 29005f6d18f..ea794cd1763 100644
+index 46de496b256..6155b83a732 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2274,10 +2274,20 @@ done
+@@ -2312,10 +2312,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -86,7 +86,7 @@ index 29005f6d18f..ea794cd1763 100644
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -2288,6 +2298,10 @@ tm_file_list="options.h"
+@@ -2326,6 +2336,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
diff --git a/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index e3e35942e63..352c6eec29b 100644
--- a/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From 2af537b9ff0018945a27a7f89efad736a0f647d4 Mon Sep 17 00:00:00 2001
+From e5463727ff028cee5e452da38f5b4c44d52e412e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch b/meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch
new file mode 100644
index 00000000000..7e1ebef463a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch
@@ -0,0 +1,50 @@
+From 20afebc61199cd74481b0b831c1b56465cd37fa0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 09:40:59 +0000
+Subject: [PATCH] export CPP
+
+The OE environment sets and exports CPP as being the target gcc. When
+building gcc-cross-canadian for a mingw targetted sdk, the following can be found
+in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libiberty/config.log:
+
+configure:3641: checking for _FILE_OFFSET_BITS value needed for large files
+configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
+configure:3666: $? = 0
+configure:3698: result: no
+configure:3786: checking how to run the C preprocessor
+configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
+configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
+configure:3876: $? = 0
+
+Note this is a *build* target (in build-x86_64-linux) so it should be
+using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw32
+headers are very different, using the wrong cpp is a real problem. It is leaking
+into configure through the CPP variable. Ultimately this leads to build
+failures related to not being able to include a process.h file for pem-unix.c.
+
+The fix is to ensure we export a sane CPP value into the build
+environment when using build targets. We could define a CPP_FOR_BUILD value which may be
+the version which needs to be upstreamed but for now, this fix is good enough to
+avoid the problem.
+
+RP 22/08/2013
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index 1d9c83cc566..11819667751 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -152,6 +152,7 @@ BUILD_EXPORTS = \
+ 	AR="$(AR_FOR_BUILD)"; export AR; \
+ 	AS="$(AS_FOR_BUILD)"; export AS; \
+ 	CC="$(CC_FOR_BUILD)"; export CC; \
++	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+ 	CPP="$(CPP_FOR_BUILD)"; export CPP; \
diff --git a/meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
index d33925eb403..61e61ecc6ed 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 9427c6cedf88e15f747c48cb4fcf9eda6f5c4555 Mon Sep 17 00:00:00 2001
+From 612801d426e75ff997cfabda380dbe52c2cbc532 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -21,14 +21,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/Makefile.in           | 2 ++
  gcc/config/linux.h        | 8 ++++++++
  gcc/config/rs6000/sysv4.h | 8 ++++++++
- gcc/cppdefault.c          | 4 ++++
+ gcc/cppdefault.cc         | 4 ++++
  4 files changed, 22 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index d1d4512bba3..06eb0d27a28 100644
+index a8277254696..07fa63b6640 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -630,6 +630,7 @@ libexecdir = @libexecdir@
+@@ -632,6 +632,7 @@ libexecdir = @libexecdir@
  
  # Directory in which the compiler finds libraries etc.
  libsubdir = $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
@@ -36,7 +36,7 @@ index d1d4512bba3..06eb0d27a28 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -3009,6 +3010,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -3024,6 +3025,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
@@ -45,10 +45,10 @@ index d1d4512bba3..06eb0d27a28 100644
    -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
    -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 87efc5f69fe..b525bcd56b3 100644
+index 4ce173384ef..8a3cd4f2d34 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -165,6 +165,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+@@ -170,6 +170,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  #define INCLUDE_DEFAULTS_MUSL_TOOL
  #endif
  
@@ -62,7 +62,7 @@ index 87efc5f69fe..b525bcd56b3 100644
  #ifdef NATIVE_SYSTEM_HEADER_DIR
  #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
      { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
-@@ -191,6 +198,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+@@ -196,6 +203,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
      INCLUDE_DEFAULTS_MUSL_PREFIX			\
      INCLUDE_DEFAULTS_MUSL_CROSS				\
      INCLUDE_DEFAULTS_MUSL_TOOL				\
@@ -71,10 +71,10 @@ index 87efc5f69fe..b525bcd56b3 100644
      { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
 diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index 510abe169c5..0c2bba5ea32 100644
+index a73954d9de5..e5dd6538358 100644
 --- a/gcc/config/rs6000/sysv4.h
 +++ b/gcc/config/rs6000/sysv4.h
-@@ -995,6 +995,13 @@ ncrtn.o%s"
+@@ -994,6 +994,13 @@ ncrtn.o%s"
  #define INCLUDE_DEFAULTS_MUSL_TOOL
  #endif
  
@@ -88,7 +88,7 @@ index 510abe169c5..0c2bba5ea32 100644
  #ifdef NATIVE_SYSTEM_HEADER_DIR
  #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
      { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
-@@ -1021,6 +1028,7 @@ ncrtn.o%s"
+@@ -1020,6 +1027,7 @@ ncrtn.o%s"
      INCLUDE_DEFAULTS_MUSL_PREFIX			\
      INCLUDE_DEFAULTS_MUSL_CROSS				\
      INCLUDE_DEFAULTS_MUSL_TOOL				\
@@ -96,10 +96,10 @@ index 510abe169c5..0c2bba5ea32 100644
      INCLUDE_DEFAULTS_MUSL_NATIVE			\
      { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
-diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
-index c503d14fc3f..d54d6ce0076 100644
---- a/gcc/cppdefault.c
-+++ b/gcc/cppdefault.c
+diff --git a/gcc/cppdefault.cc b/gcc/cppdefault.cc
+index 7888300f277..52cf14e92f8 100644
+--- a/gcc/cppdefault.cc
++++ b/gcc/cppdefault.cc
 @@ -64,6 +64,10 @@ const struct default_include cpp_include_defaults[]
      /* This is the dir for gcc's private headers.  */
      { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index 5b5d229effe..94308b2aca5 100644
--- a/meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From ab6e6af5deca6f4b35b089a6b197776df38780e6 Mon Sep 17 00:00:00 2001
+From 9ae49e7b88c208ab79ec9c2fc4a2fa8a3f1e85bb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
diff --git a/meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch b/meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
deleted file mode 100644
index 45953f861d5..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-From 667b302f637be0a4b6ef714b5eb0026c54425386 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Sun, 31 Oct 2021 17:40:12 -0700
-Subject: [PATCH] Makefile.in: Ensure build CPP/CPPFLAGS is used for build
- targets
-
-During cross compiling, CPP is being set to the target compiler even for
-build targets. As an example, when building a cross compiler targetting
-mingw, the config.log for libiberty in
-build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libiberty/config.log
-shows:
-
-configure:3786: checking how to run the C preprocessor
-configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=[sysroot]/x86_64-nativesdk-mingw32-pokysdk-mingw32
-configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=[sysroot]/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
-configure:3876: $? = 0
-
-This is libiberty being built for the build environment, not the target one
-(i.e. in build-x86_64-linux). As such it should be using the build environment's
-gcc and not the target one. In the mingw case the system headers are quite
-different leading to build failures related to not being able to include a
-process.h file for pem-unix.c.
-
-Further analysis shows the same issue occuring for CPPFLAGS too.
-
-Fix this by adding support for CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD which
-for example, avoids mixing the mingw headers for host binaries on linux
-systems.
-
-2021-10-27 Richard Purdie <richard.purdie@linuxfoundation.org>
-
-ChangeLog:
-
-    * Makefile.tpl: Add CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD support
-    * Makefile.in: Regenerate.
-    * configure: Regenerate.
-    * configure.ac: Add CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD support
-
-gcc/ChangeLog:
-
-    * configure: Regenerate.
-    * configure.ac: Use CPPFLAGS_FOR_BUILD for GMPINC
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582727.html]
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=84401ce5fb4ecab55decb472b168100e7593e01f]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.in      | 6 ++++++
- Makefile.tpl     | 6 ++++++
- configure        | 4 ++++
- configure.ac     | 4 ++++
- gcc/configure    | 2 +-
- gcc/configure.ac | 2 +-
- 6 files changed, 22 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 20cbbe2906d..33476d53327 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -154,6 +154,8 @@ BUILD_EXPORTS = \
- 	CC="$(CC_FOR_BUILD)"; export CC; \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-+	CPP="$(CPP_FOR_BUILD)"; export CPP; \
-+	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
- 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
- 	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
-@@ -202,6 +204,8 @@ HOST_EXPORTS = \
- 	AR="$(AR)"; export AR; \
- 	AS="$(AS)"; export AS; \
- 	CC_FOR_BUILD="$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
-+	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
-+	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
- 	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
- 	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
- 	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
-@@ -360,6 +364,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
- AS_FOR_BUILD = @AS_FOR_BUILD@
- CC_FOR_BUILD = @CC_FOR_BUILD@
- CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
-+CPP_FOR_BUILD = @CPP_FOR_BUILD@
-+CPPFLAGS_FOR_BUILD = @CPPFLAGS_FOR_BUILD@
- CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
- CXX_FOR_BUILD = @CXX_FOR_BUILD@
- DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
-diff --git a/Makefile.tpl b/Makefile.tpl
-index 9adf4f94728..e39d85d1109 100644
---- a/Makefile.tpl
-+++ b/Makefile.tpl
-@@ -157,6 +157,8 @@ BUILD_EXPORTS = \
- 	CC="$(CC_FOR_BUILD)"; export CC; \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-+	CPP="$(CPP_FOR_BUILD)"; export CPP; \
-+	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
- 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
- 	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
-@@ -205,6 +207,8 @@ HOST_EXPORTS = \
- 	AR="$(AR)"; export AR; \
- 	AS="$(AS)"; export AS; \
- 	CC_FOR_BUILD="$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
-+	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
-+	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
- 	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
- 	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
- 	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
-@@ -363,6 +367,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
- AS_FOR_BUILD = @AS_FOR_BUILD@
- CC_FOR_BUILD = @CC_FOR_BUILD@
- CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
-+CPP_FOR_BUILD = @CPP_FOR_BUILD@
-+CPPFLAGS_FOR_BUILD = @CPPFLAGS_FOR_BUILD@
- CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
- CXX_FOR_BUILD = @CXX_FOR_BUILD@
- DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
-diff --git a/configure b/configure
-index 45744e6e471..ff0de8a68b4 100755
---- a/configure
-+++ b/configure
-@@ -655,6 +655,8 @@ DSYMUTIL_FOR_BUILD
- DLLTOOL_FOR_BUILD
- CXX_FOR_BUILD
- CXXFLAGS_FOR_BUILD
-+CPPFLAGS_FOR_BUILD
-+CPP_FOR_BUILD
- CFLAGS_FOR_BUILD
- CC_FOR_BUILD
- AS_FOR_BUILD
-@@ -4100,6 +4102,7 @@ if test "${build}" != "${host}" ; then
-   AR_FOR_BUILD=${AR_FOR_BUILD-ar}
-   AS_FOR_BUILD=${AS_FOR_BUILD-as}
-   CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
-+  CPP_FOR_BUILD="${CPP_FOR_BUILD-\$(CPP)}"
-   CXX_FOR_BUILD=${CXX_FOR_BUILD-g++}
-   DSYMUTIL_FOR_BUILD=${DSYMUTIL_FOR_BUILD-dsymutil}
-   GFORTRAN_FOR_BUILD=${GFORTRAN_FOR_BUILD-gfortran}
-@@ -9831,6 +9834,7 @@ esac
- # our build compiler if desired.
- if test x"${build}" = x"${host}" ; then
-   CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
-+  CPPFLAGS_FOR_BUILD=${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
-   CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
-   LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
- fi
-diff --git a/configure.ac b/configure.ac
-index bf66b51373c..09fa3896dc7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1347,6 +1347,7 @@ if test "${build}" != "${host}" ; then
-   AR_FOR_BUILD=${AR_FOR_BUILD-ar}
-   AS_FOR_BUILD=${AS_FOR_BUILD-as}
-   CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
-+  CPP_FOR_BUILD="${CPP_FOR_BUILD-\$(CPP)}"
-   CXX_FOR_BUILD=${CXX_FOR_BUILD-g++}
-   DSYMUTIL_FOR_BUILD=${DSYMUTIL_FOR_BUILD-dsymutil}
-   GFORTRAN_FOR_BUILD=${GFORTRAN_FOR_BUILD-gfortran}
-@@ -3336,6 +3337,7 @@ esac
- # our build compiler if desired.
- if test x"${build}" = x"${host}" ; then
-   CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
-+  CPPFLAGS_FOR_BUILD=${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
-   CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
-   LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
- fi
-@@ -3402,6 +3404,8 @@ AC_SUBST(AR_FOR_BUILD)
- AC_SUBST(AS_FOR_BUILD)
- AC_SUBST(CC_FOR_BUILD)
- AC_SUBST(CFLAGS_FOR_BUILD)
-+AC_SUBST(CPP_FOR_BUILD)
-+AC_SUBST(CPPFLAGS_FOR_BUILD)
- AC_SUBST(CXXFLAGS_FOR_BUILD)
- AC_SUBST(CXX_FOR_BUILD)
- AC_SUBST(DLLTOOL_FOR_BUILD)
-diff --git a/gcc/configure b/gcc/configure
-index ec3c24482df..31a460dc9d0 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -12740,7 +12740,7 @@ else
- 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
- 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
- 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
--	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
-+	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
- 	${realsrcdir}/configure \
- 		--enable-languages=${enable_languages-all} \
- 		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index ea794cd1763..b965eb036bc 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -2054,7 +2054,7 @@ else
- 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
- 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
- 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
--	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
-+	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
- 	${realsrcdir}/configure \
- 		--enable-languages=${enable_languages-all} \
- 		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
diff --git a/meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index b82277cc4bc..ce9635ce4dd 100644
--- a/meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From fd862c8c112067d8613d921ae89c99056aca54a1 Mon Sep 17 00:00:00 2001
+From bf918db7117f41d3c04162095641165ca241707d Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
@@ -20,10 +20,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index 3b75e7d9290..d3a4c4f9ddf 100644
+index 6e3a34ff7e2..3f3f6391aba 100644
 --- a/libcc1/Makefile.am
 +++ b/libcc1/Makefile.am
-@@ -41,8 +41,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+@@ -40,8 +40,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
  	    $(Wc)$(libiberty_normal)))
  libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
  
@@ -35,10 +35,10 @@ index 3b75e7d9290..d3a4c4f9ddf 100644
  if ENABLE_PLUGIN
  plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
 diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
-index 07fa9d94c83..a9f737d78f2 100644
+index f8f590d71e9..56462492045 100644
 --- a/libcc1/Makefile.in
 +++ b/libcc1/Makefile.in
-@@ -398,8 +398,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+@@ -396,8 +396,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
  	    $(Wc)$(libiberty_normal)))
  
  libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
diff --git a/meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 90%
rename from meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
index 5d86e4c12d7..3b54719536f 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 68802ca536b01ab21cfa58e11ef332e30d9a3c5e Mon Sep 17 00:00:00 2001
+From 4fbbd40d7db89cdbeaf93df1e1da692b1f80a5bc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -35,21 +35,21 @@ implementation.)
 
 Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
 ---
- gcc/c-family/c-opts.c     |  4 +--
+ gcc/c-family/c-opts.cc    |  4 +--
  gcc/config/linux.h        | 24 +++++++--------
  gcc/config/rs6000/sysv4.h | 24 +++++++--------
- gcc/cppdefault.c          | 63 ++++++++++++++++++++++++---------------
+ gcc/cppdefault.cc         | 63 ++++++++++++++++++++++++---------------
  gcc/cppdefault.h          | 13 ++++----
- gcc/gcc.c                 | 20 +++++++++----
- gcc/incpath.c             | 12 ++++----
- gcc/prefix.c              |  6 ++--
+ gcc/gcc.cc                | 20 +++++++++----
+ gcc/incpath.cc            | 12 ++++----
+ gcc/prefix.cc             |  6 ++--
  8 files changed, 94 insertions(+), 72 deletions(-)
 
-diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
-index 6f001e0bb6c..55ab07c278f 100644
---- a/gcc/c-family/c-opts.c
-+++ b/gcc/c-family/c-opts.c
-@@ -1438,8 +1438,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
+diff --git a/gcc/c-family/c-opts.cc b/gcc/c-family/c-opts.cc
+index a341a061758..83b0bef4dbb 100644
+--- a/gcc/c-family/c-opts.cc
++++ b/gcc/c-family/c-opts.cc
+@@ -1458,8 +1458,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
    size_t prefix_len, suffix_len;
  
    suffix_len = strlen (suffix);
@@ -61,11 +61,11 @@ index 6f001e0bb6c..55ab07c278f 100644
    path = (char *) xmalloc (prefix_len + suffix_len + 1);
    memcpy (path, prefix, prefix_len);
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index b525bcd56b3..ba02c013e30 100644
+index 8a3cd4f2d34..58143dff731 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -129,53 +129,53 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
-  * Unfortunately, this is mostly duplicated from cppdefault.c */
+@@ -134,53 +134,53 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+  * Unfortunately, this is mostly duplicated from cppdefault.cc */
  #if DEFAULT_LIBC == LIBC_MUSL
  #define INCLUDE_DEFAULTS_MUSL_GPP			\
 -    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,		\
@@ -129,7 +129,7 @@ index b525bcd56b3..ba02c013e30 100644
  #else
  #define INCLUDE_DEFAULTS_MUSL_NATIVE
  #endif
-@@ -200,7 +200,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+@@ -205,7 +205,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
      INCLUDE_DEFAULTS_MUSL_TOOL				\
      INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
      INCLUDE_DEFAULTS_MUSL_NATIVE			\
@@ -139,10 +139,10 @@ index b525bcd56b3..ba02c013e30 100644
    }
  #endif
 diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index 0c2bba5ea32..313a8de4417 100644
+index e5dd6538358..b496849b792 100644
 --- a/gcc/config/rs6000/sysv4.h
 +++ b/gcc/config/rs6000/sysv4.h
-@@ -959,53 +959,53 @@ ncrtn.o%s"
+@@ -958,53 +958,53 @@ ncrtn.o%s"
  /* Include order changes for musl, same as in generic linux.h.  */
  #if DEFAULT_LIBC == LIBC_MUSL
  #define INCLUDE_DEFAULTS_MUSL_GPP			\
@@ -207,7 +207,7 @@ index 0c2bba5ea32..313a8de4417 100644
  #else
  #define INCLUDE_DEFAULTS_MUSL_NATIVE
  #endif
-@@ -1030,7 +1030,7 @@ ncrtn.o%s"
+@@ -1029,7 +1029,7 @@ ncrtn.o%s"
      INCLUDE_DEFAULTS_MUSL_TOOL				\
      INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
      INCLUDE_DEFAULTS_MUSL_NATIVE			\
@@ -216,10 +216,10 @@ index 0c2bba5ea32..313a8de4417 100644
      { 0, 0, 0, 0, 0, 0 }				\
    }
  #endif
-diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
-index d54d6ce0076..784a92a0c24 100644
---- a/gcc/cppdefault.c
-+++ b/gcc/cppdefault.c
+diff --git a/gcc/cppdefault.cc b/gcc/cppdefault.cc
+index 52cf14e92f8..d8977afc05e 100644
+--- a/gcc/cppdefault.cc
++++ b/gcc/cppdefault.cc
 @@ -35,6 +35,30 @@
  # undef CROSS_INCLUDE_DIR
  #endif
@@ -343,7 +343,7 @@ index d54d6ce0076..784a92a0c24 100644
  /* This value is set by cpp_relocated at runtime */
  const char *gcc_exec_prefix;
 diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
-index fd3c655db1c..20669ac427d 100644
+index fb97c0b5814..6267150facc 100644
 --- a/gcc/cppdefault.h
 +++ b/gcc/cppdefault.h
 @@ -33,7 +33,8 @@
@@ -354,7 +354,7 @@ index fd3c655db1c..20669ac427d 100644
 +  const char *fname;     /* The name of the directory.  */
 +
    const char *const component;	/* The component containing the directory
- 				   (see update_path in prefix.c) */
+ 				   (see update_path in prefix.cc) */
    const char cplusplus;		/* When this is non-zero, we should only
 @@ -55,17 +56,13 @@ struct default_include
  };
@@ -377,10 +377,10 @@ index fd3c655db1c..20669ac427d 100644
  /* The run-time execution prefix.  This is typically the lib/gcc
     subdirectory of the actual installation.  */
  extern const char *gcc_exec_prefix;
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index bdee2671532..36e8af38630 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
+diff --git a/gcc/gcc.cc b/gcc/gcc.cc
+index aa4cf92fb78..5569a39a14a 100644
+--- a/gcc/gcc.cc
++++ b/gcc/gcc.cc
 @@ -252,6 +252,8 @@ FILE *report_times_to_file = NULL;
  #endif
  static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
@@ -390,7 +390,7 @@ index bdee2671532..36e8af38630 100644
  /* Nonzero means pass the updated target_system_root to the compiler.  */
  
  static int target_system_root_changed;
-@@ -568,6 +570,7 @@ or with constant text in a single argument.
+@@ -575,6 +577,7 @@ or with constant text in a single argument.
   %G     process LIBGCC_SPEC as a spec.
   %R     Output the concatenation of target_system_root and
          target_sysroot_suffix.
@@ -398,7 +398,7 @@ index bdee2671532..36e8af38630 100644
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
   %C     process CPP_SPEC as a spec.
-@@ -1620,10 +1623,10 @@ static const char *gcc_libexec_prefix;
+@@ -1627,10 +1630,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -413,7 +413,7 @@ index bdee2671532..36e8af38630 100644
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1631,9 +1634,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+@@ -1638,9 +1641,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -425,7 +425,7 @@ index bdee2671532..36e8af38630 100644
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -6570,6 +6573,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+@@ -6676,6 +6679,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
@@ -437,11 +437,11 @@ index bdee2671532..36e8af38630 100644
  	  case 'S':
  	    value = do_spec_1 (startfile_spec, 0, NULL);
  	    if (value != 0)
-diff --git a/gcc/incpath.c b/gcc/incpath.c
-index fbfc0ce03b8..a82e543428b 100644
---- a/gcc/incpath.c
-+++ b/gcc/incpath.c
-@@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+diff --git a/gcc/incpath.cc b/gcc/incpath.cc
+index c80f100f476..5ac03c08693 100644
+--- a/gcc/incpath.cc
++++ b/gcc/incpath.cc
+@@ -135,7 +135,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
    int relocated = cpp_relocated ();
    size_t len;
  
@@ -450,7 +450,7 @@ index fbfc0ce03b8..a82e543428b 100644
      {
        /* Look for directories that start with the standard prefix.
  	 "Translate" them, i.e. replace /usr/local/lib/gcc... with
-@@ -146,7 +146,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+@@ -150,7 +150,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
  		 now.  */
  	      if (sysroot && p->add_sysroot)
  		continue;
@@ -459,7 +459,7 @@ index fbfc0ce03b8..a82e543428b 100644
  		{
  		  char *str = concat (iprefix, p->fname + len, NULL);
  		  if (p->multilib == 1 && imultilib)
-@@ -187,7 +187,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+@@ -191,7 +191,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
  	      free (sysroot_no_trailing_dir_separator);
  	    }
  	  else if (!p->add_sysroot && relocated
@@ -468,7 +468,7 @@ index fbfc0ce03b8..a82e543428b 100644
  	    {
   	      static const char *relocated_prefix;
  	      char *ostr;
-@@ -204,12 +204,12 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+@@ -208,12 +208,12 @@ add_standard_paths (const char *sysroot, const char *iprefix,
  		  dummy = concat (gcc_exec_prefix, "dummy", NULL);
  		  relocated_prefix
  		    = make_relative_prefix (dummy,
@@ -484,10 +484,10 @@ index fbfc0ce03b8..a82e543428b 100644
  			     NULL);
  	      str = update_path (ostr, p->component);
  	      free (ostr);
-diff --git a/gcc/prefix.c b/gcc/prefix.c
-index 747c09de638..f728638dc65 100644
---- a/gcc/prefix.c
-+++ b/gcc/prefix.c
+diff --git a/gcc/prefix.cc b/gcc/prefix.cc
+index 096ed5afa3d..2526f0ecc39 100644
+--- a/gcc/prefix.cc
++++ b/gcc/prefix.cc
 @@ -72,7 +72,9 @@ License along with GCC; see the file COPYING3.  If not see
  #include "prefix.h"
  #include "common/common-target.h"
diff --git a/meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index 0f43e985cf3..9b05da64a70 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From 14291076874b133e7fb67ef1714b768a2c48ea44 Mon Sep 17 00:00:00 2001
+From 33a1f07a4417247dc24819d4e583ca09f56d5a7b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
@@ -47,14 +47,14 @@ RP 2015/7/31
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
+ gcc/gcc.cc | 29 ++++++++++++++++++++++++++++-
  1 file changed, 28 insertions(+), 1 deletion(-)
 
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 36e8af38630..d1faa788d60 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -2810,7 +2810,7 @@ for_each_path (const struct path_prefix *paths,
+diff --git a/gcc/gcc.cc b/gcc/gcc.cc
+index 5569a39a14a..4598f6cd7c9 100644
+--- a/gcc/gcc.cc
++++ b/gcc/gcc.cc
+@@ -2817,7 +2817,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -63,7 +63,7 @@ index 36e8af38630..d1faa788d60 100644
  	  path = XNEWVEC (char, len);
  	}
  
-@@ -2822,6 +2822,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2829,6 +2829,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
diff --git a/meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index b82fa445378..56793e03a3d 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From af72a47a677ce98c08cb73444bdd741ca8e28422 Mon Sep 17 00:00:00 2001
+From d7dc2861840e88a4592817a398a054a886c3f3ee Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
@@ -23,10 +23,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 27 insertions(+)
 
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index ba02c013e30..8fcaa0c9faf 100644
+index 58143dff731..d2409ccac26 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+@@ -208,6 +208,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
      { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
    }
@@ -41,10 +41,10 @@ index ba02c013e30..8fcaa0c9faf 100644
  
  #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
 diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
-index 47c9d9ac0b6..d065f88b377 100644
+index 8c9039ac1e5..259cd485973 100644
 --- a/gcc/config/rs6000/linux.h
 +++ b/gcc/config/rs6000/linux.h
-@@ -94,6 +94,16 @@
+@@ -99,6 +99,16 @@
  					 " -m elf32ppclinux")
  #endif
  
@@ -62,10 +62,10 @@ index 47c9d9ac0b6..d065f88b377 100644
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index a11e01faa3d..ce464f3626b 100644
+index 364c1a5b155..e33d9ae98e0 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -369,6 +369,16 @@ extern int dot_symbols;
+@@ -372,6 +372,16 @@ extern int dot_symbols;
  					   " -m elf64ppc")
  #endif
  
diff --git a/meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandline-options.patch
rename to meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
index 23cf02a6e44..bb1699be25a 100644
--- a/meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From ca73043041c3c7aa86af9a3d4f316abc87eb3254 Mon Sep 17 00:00:00 2001
+From bf0d7c463e1fab62804556099b56319fe94be1eb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+)
 
 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index 6b0a3e27529..1bd2e356ac9 100644
+index 4931d781c4e..3fb87b6f7d5 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
-@@ -352,6 +352,19 @@ mdebug=
+@@ -348,6 +348,19 @@ mdebug=
  Target RejectNegative Joined
  -mdebug=	Enable debug output.
  
diff --git a/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
deleted file mode 100644
index 76ebfd7f77d..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 9ec4db8e910d9a51ae43f6b20d4bf1dac2d8cca8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Feb 2016 10:26:10 -0800
-Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e5ddbbf992b909d8e38851bd3179d29389e6ac97]
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/nios2/linux.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
-index 08edf1521f6..15696d86241 100644
---- a/gcc/config/nios2/linux.h
-+++ b/gcc/config/nios2/linux.h
-@@ -30,6 +30,7 @@
- #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
-+#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
- 
- #undef LINK_SPEC
- #define LINK_SPEC LINK_SPEC_ENDIAN \
diff --git a/meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 76%
rename from meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index f915f284eaf..f37092089f7 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From b3957bc1fd52ec427a1b71b10055905cab4bbc7c Mon Sep 17 00:00:00 2001
+From a32c75b37209d6836eaaa943dc6b1207acba5d27 Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -33,30 +33,30 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gcc/config/i386/i386-expand.c | 4 ++--
- libgcc/config/i386/cpuinfo.c  | 6 +++---
- libgcc/config/i386/t-linux    | 2 +-
+ gcc/config/i386/i386-expand.cc | 4 ++--
+ libgcc/config/i386/cpuinfo.c   | 6 +++---
+ libgcc/config/i386/t-linux     | 2 +-
  3 files changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand.c
-index 31eae75d277..ec7e858ec83 100644
---- a/gcc/config/i386/i386-expand.c
-+++ b/gcc/config/i386/i386-expand.c
-@@ -11066,10 +11066,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+diff --git a/gcc/config/i386/i386-expand.cc b/gcc/config/i386/i386-expand.cc
+index 68978ef8dc2..0c71f36b572 100644
+--- a/gcc/config/i386/i386-expand.cc
++++ b/gcc/config/i386/i386-expand.cc
+@@ -12321,10 +12321,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
--	/* Make it call __cpu_indicator_init in libgcc. */
-+	/* Make it call __cpu_indicator_init_local in libgcc.a. */
+-	/* Make it call __cpu_indicator_init in libgcc.  */
++	/* Make it call __cpu_indicator_init_local in libgcc.a.  */
  	tree call_expr, fndecl, type;
-         type = build_function_type_list (integer_type_node, NULL_TREE); 
+ 	type = build_function_type_list (integer_type_node, NULL_TREE);
 -	fndecl = build_fn_decl ("__cpu_indicator_init", type);
 +	fndecl = build_fn_decl ("__cpu_indicator_init_local", type);
- 	call_expr = build_call_expr (fndecl, 0); 
+ 	call_expr = build_call_expr (fndecl, 0);
  	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
        }
 diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index ef463848f9d..1a3de052c80 100644
+index dab1d98060f..cf824b4114a 100644
 --- a/libgcc/config/i386/cpuinfo.c
 +++ b/libgcc/config/i386/cpuinfo.c
 @@ -63,7 +63,7 @@ __cpu_indicator_init (void)
diff --git a/meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
deleted file mode 100644
index 9b7c5c5642f..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 79a568dec47baa264eb6290fed3df3244450a92e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 4 May 2016 21:11:34 -0700
-Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
-
-Upstream-Status: Pending
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libgcc/config/t-slibgcc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
-index c59b43b7b69..ca4c141f526 100644
---- a/libgcc/config/t-slibgcc
-+++ b/libgcc/config/t-slibgcc
-@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
- 	$(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
- 
- SHLIB_LINK = $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
--	$(SHLIB_LDFLAGS) \
-+	$(LDFLAGS) $(SHLIB_LDFLAGS) \
- 	-o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
- 	$(SHLIB_OBJS) $(SHLIB_LC) && \
- 	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
similarity index 75%
rename from meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
rename to meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index f33193ebcfd..f5f04ae314a 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From 5fd90d243ae14034a4699443110070dafc0d4d30 Mon Sep 17 00:00:00 2001
+From 4efc42b99c96b026f560b0918de7e237ac3dc8d1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
@@ -12,15 +12,15 @@ Upstream-Status: Inappropriate [OE Reproducibility specific]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gcc/gengtype.c |  6 +++---
- gcc/genmodes.c | 32 ++++++++++++++++----------------
+ gcc/gengtype.cc |  6 +++---
+ gcc/genmodes.cc | 32 ++++++++++++++++----------------
  2 files changed, 19 insertions(+), 19 deletions(-)
 
-diff --git a/gcc/gengtype.c b/gcc/gengtype.c
-index 98d4626f87e..f602da8b501 100644
---- a/gcc/gengtype.c
-+++ b/gcc/gengtype.c
-@@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const char *name, options_p opt,
+diff --git a/gcc/gengtype.cc b/gcc/gengtype.cc
+index 386ae1b0506..9762e914296 100644
+--- a/gcc/gengtype.cc
++++ b/gcc/gengtype.cc
+@@ -1006,7 +1006,7 @@ create_field_at (pair_p next, type_p type, const char *name, options_p opt,
  /* Create a fake field with the given type and name.  NEXT is the next
     field in the chain.  */
  #define create_field(next,type,name) \
@@ -29,7 +29,7 @@ index 98d4626f87e..f602da8b501 100644
  
  /* Like create_field, but the field is only valid when condition COND
     is true.  */
-@@ -1024,7 +1024,7 @@ create_optional_field_ (pair_p next, type_p type, const char *name,
+@@ -1039,7 +1039,7 @@ create_optional_field_ (pair_p next, type_p type, const char *name,
  }
  
  #define create_optional_field(next,type,name,cond)	\
@@ -38,7 +38,7 @@ index 98d4626f87e..f602da8b501 100644
  
  /* Reverse a linked list of 'struct pair's in place.  */
  pair_p
-@@ -5189,7 +5189,7 @@ main (int argc, char **argv)
+@@ -5238,7 +5238,7 @@ main (int argc, char **argv)
        /* These types are set up with #define or else outside of where
           we can see them.  We should initialize them before calling
           read_input_list.  */
@@ -47,11 +47,11 @@ index 98d4626f87e..f602da8b501 100644
  	Call;} while (0)
        POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
        POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
-diff --git a/gcc/genmodes.c b/gcc/genmodes.c
-index c268ebc4c6e..4361f3f1563 100644
---- a/gcc/genmodes.c
-+++ b/gcc/genmodes.c
-@@ -438,7 +438,7 @@ complete_all_modes (void)
+diff --git a/gcc/genmodes.cc b/gcc/genmodes.cc
+index 59850bb070a..e187f8542a1 100644
+--- a/gcc/genmodes.cc
++++ b/gcc/genmodes.cc
+@@ -440,7 +440,7 @@ complete_all_modes (void)
  }
  
  /* For each mode in class CLASS, construct a corresponding complex mode.  */
@@ -60,7 +60,7 @@ index c268ebc4c6e..4361f3f1563 100644
  static void
  make_complex_modes (enum mode_class cl,
  		    const char *file, unsigned int line)
-@@ -497,7 +497,7 @@ make_complex_modes (enum mode_class cl,
+@@ -499,7 +499,7 @@ make_complex_modes (enum mode_class cl,
     having as many components as necessary.  ORDER is the sorting order
     of the mode, with smaller numbers indicating a higher priority.  */
  #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W, ORDER) \
@@ -69,16 +69,16 @@ index c268ebc4c6e..4361f3f1563 100644
  #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W, 0)
  static void ATTRIBUTE_UNUSED
  make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
-@@ -549,7 +549,7 @@ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
- /* Create a vector of booleans called NAME with COUNT elements and
+@@ -552,7 +552,7 @@ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
     BYTESIZE bytes in total.  */
- #define VECTOR_BOOL_MODE(NAME, COUNT, BYTESIZE) \
--  make_vector_bool_mode (#NAME, COUNT, BYTESIZE, __FILE__, __LINE__)
-+  make_vector_bool_mode (#NAME, COUNT, BYTESIZE, __FILE__, 0)
+ #define VECTOR_BOOL_MODE(NAME, COUNT, COMPONENT, BYTESIZE)		\
+   make_vector_bool_mode (#NAME, COUNT, #COMPONENT, BYTESIZE,		\
+-			 __FILE__, __LINE__)
++			 __FILE__, 0)
  static void ATTRIBUTE_UNUSED
  make_vector_bool_mode (const char *name, unsigned int count,
- 		       unsigned int bytesize, const char *file,
-@@ -571,7 +571,7 @@ make_vector_bool_mode (const char *name, unsigned int count,
+ 		       const char *component, unsigned int bytesize,
+@@ -574,7 +574,7 @@ make_vector_bool_mode (const char *name, unsigned int count,
  /* Input.  */
  
  #define _SPECIAL_MODE(C, N) \
@@ -87,7 +87,7 @@ index c268ebc4c6e..4361f3f1563 100644
  #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
  #define CC_MODE(N) _SPECIAL_MODE (CC, N)
  
-@@ -584,7 +584,7 @@ make_special_mode (enum mode_class cl, const char *name,
+@@ -587,7 +587,7 @@ make_special_mode (enum mode_class cl, const char *name,
  
  #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
  #define FRACTIONAL_INT_MODE(N, B, Y) \
@@ -96,7 +96,7 @@ index c268ebc4c6e..4361f3f1563 100644
  
  static void
  make_int_mode (const char *name,
-@@ -611,16 +611,16 @@ make_opaque_mode (const char *name,
+@@ -628,16 +628,16 @@ make_opaque_mode (const char *name,
  }
  
  #define FRACT_MODE(N, Y, F) \
@@ -117,7 +117,7 @@ index c268ebc4c6e..4361f3f1563 100644
  
  /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBIT,
     FILE, and LINE.  */
-@@ -641,7 +641,7 @@ make_fixed_point_mode (enum mode_class cl,
+@@ -658,7 +658,7 @@ make_fixed_point_mode (enum mode_class cl,
  
  #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U, Y, F)
  #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
@@ -126,7 +126,7 @@ index c268ebc4c6e..4361f3f1563 100644
  
  static void
  make_float_mode (const char *name,
-@@ -658,7 +658,7 @@ make_float_mode (const char *name,
+@@ -675,7 +675,7 @@ make_float_mode (const char *name,
  #define DECIMAL_FLOAT_MODE(N, Y, F)	\
  	FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
  #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)	\
@@ -135,7 +135,7 @@ index c268ebc4c6e..4361f3f1563 100644
  
  static void
  make_decimal_float_mode (const char *name,
-@@ -673,7 +673,7 @@ make_decimal_float_mode (const char *name,
+@@ -690,7 +690,7 @@ make_decimal_float_mode (const char *name,
  }
  
  #define RESET_FLOAT_FORMAT(N, F) \
@@ -144,7 +144,7 @@ index c268ebc4c6e..4361f3f1563 100644
  static void ATTRIBUTE_UNUSED
  reset_float_format (const char *name, const char *format,
  		    const char *file, unsigned int line)
-@@ -694,7 +694,7 @@ reset_float_format (const char *name, const char *format,
+@@ -711,7 +711,7 @@ reset_float_format (const char *name, const char *format,
  
  /* __intN support.  */
  #define INT_N(M,PREC)				\
@@ -153,7 +153,7 @@ index c268ebc4c6e..4361f3f1563 100644
  static void ATTRIBUTE_UNUSED
  make_int_n (const char *m, int bitsize,
              const char *file, unsigned int line)
-@@ -723,7 +723,7 @@ make_int_n (const char *m, int bitsize,
+@@ -740,7 +740,7 @@ make_int_n (const char *m, int bitsize,
  /* Partial integer modes are specified by relation to a full integer
     mode.  */
  #define PARTIAL_INT_MODE(M,PREC,NAME)				\
@@ -162,16 +162,16 @@ index c268ebc4c6e..4361f3f1563 100644
  static void ATTRIBUTE_UNUSED
  make_partial_integer_mode (const char *base, const char *name,
  			   unsigned int precision,
-@@ -750,7 +750,7 @@ make_partial_integer_mode (const char *base, const char *name,
+@@ -767,7 +767,7 @@ make_partial_integer_mode (const char *base, const char *name,
  /* A single vector mode can be specified by naming its component
     mode and the number of components.  */
- #define VECTOR_MODE(C, M, N) \
--  make_vector_mode (MODE_##C, #M, N, __FILE__, __LINE__);
-+  make_vector_mode (MODE_##C, #M, N, __FILE__, 0);
+ #define VECTOR_MODE_WITH_PREFIX(PREFIX, C, M, N, ORDER) \
+-  make_vector_mode (MODE_##C, #PREFIX, #M, N, ORDER, __FILE__, __LINE__);
++  make_vector_mode (MODE_##C, #PREFIX, #M, N, ORDER, __FILE__, 0);
+ #define VECTOR_MODE(C, M, N) VECTOR_MODE_WITH_PREFIX(V, C, M, N, 0);
  static void ATTRIBUTE_UNUSED
  make_vector_mode (enum mode_class bclass,
- 		  const char *base,
-@@ -793,7 +793,7 @@ make_vector_mode (enum mode_class bclass,
+@@ -814,7 +814,7 @@ make_vector_mode (enum mode_class bclass,
  
  /* Adjustability.  */
  #define _ADD_ADJUST(A, M, X, C1, C2) \
diff --git a/meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_not_supported.patch b/meta/recipes-devtools/gcc/gcc/0022-mingw32-Enable-operation_not_supported.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_not_supported.patch
rename to meta/recipes-devtools/gcc/gcc/0022-mingw32-Enable-operation_not_supported.patch
index b46bde1eda7..f88ad51ee8a 100644
--- a/meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_not_supported.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-mingw32-Enable-operation_not_supported.patch
@@ -1,4 +1,4 @@
-From 7bc34769f0b055e25286576e4ba6d211e8159834 Mon Sep 17 00:00:00 2001
+From 061cf79e7b6e89fdf0f2630ddaebbf1d7b271ac3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 12 May 2020 10:39:09 -0700
 Subject: [PATCH] mingw32: Enable operation_not_supported
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libstdc++-v3/config/os/mingw32/error_constants.h b/libstdc++-v3/config/os/mingw32/error_constants.h
-index eca06a97014..933cfab49cf 100644
+index da5f4c2ac85..e855c86267c 100644
 --- a/libstdc++-v3/config/os/mingw32/error_constants.h
 +++ b/libstdc++-v3/config/os/mingw32/error_constants.h
 @@ -107,7 +107,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
diff --git a/meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.patch
deleted file mode 100644
index 86fb22ffd35..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 07a06aa8e8285c1bb06d0bebeaa9ad04eb76f2e2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Feb 2017 12:56:00 -0800
-Subject: [PATCH] sync gcc stddef.h with musl
-
-musl defines ptrdiff_t size_t and wchar_t
-so dont define them here if musl is definining them
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=85a438fc78dd12249ca854a3e5c577fefeb1a5cd]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/ginclude/stddef.h | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
-index 66619fe43b1..3f843d6f365 100644
---- a/gcc/ginclude/stddef.h
-+++ b/gcc/ginclude/stddef.h
-@@ -128,6 +128,7 @@ _TYPE_wchar_t;
- #ifndef ___int_ptrdiff_t_h
- #ifndef _GCC_PTRDIFF_T
- #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
-+#ifndef __DEFINED_ptrdiff_t /* musl */
- #define _PTRDIFF_T
- #define _T_PTRDIFF_
- #define _T_PTRDIFF
-@@ -137,10 +138,12 @@ _TYPE_wchar_t;
- #define ___int_ptrdiff_t_h
- #define _GCC_PTRDIFF_T
- #define _PTRDIFF_T_DECLARED
-+#define __DEFINED_ptrdiff_t /* musl */
- #ifndef __PTRDIFF_TYPE__
- #define __PTRDIFF_TYPE__ long int
- #endif
- typedef __PTRDIFF_TYPE__ ptrdiff_t;
-+#endif /* __DEFINED_ptrdiff_t */
- #endif /* _PTRDIFF_T_DECLARED */
- #endif /* _GCC_PTRDIFF_T */
- #endif /* ___int_ptrdiff_t_h */
-@@ -178,6 +181,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
- #ifndef _GCC_SIZE_T
- #ifndef _SIZET_
- #ifndef __size_t
-+#ifndef __DEFINED_size_t /* musl */
- #define __size_t__	/* BeOS */
- #define __SIZE_T__	/* Cray Unicos/Mk */
- #define _SIZE_T
-@@ -194,6 +198,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
- #define ___int_size_t_h
- #define _GCC_SIZE_T
- #define _SIZET_
-+#define __DEFINED_size_t /* musl */
- #if defined (__FreeBSD__) \
-   || defined(__DragonFly__) \
-   || defined(__FreeBSD_kernel__) \
-@@ -228,6 +233,7 @@ typedef long ssize_t;
- #endif /* _SIZE_T */
- #endif /* __SIZE_T__ */
- #endif /* __size_t__ */
-+#endif /* __DEFINED_size_t */
- #undef	__need_size_t
- #endif /* _STDDEF_H or __need_size_t.  */
- 
-@@ -257,6 +263,7 @@ typedef long ssize_t;
- #ifndef ___int_wchar_t_h
- #ifndef __INT_WCHAR_T_H
- #ifndef _GCC_WCHAR_T
-+#ifndef __DEFINED_wchar_t /* musl */
- #define __wchar_t__	/* BeOS */
- #define __WCHAR_T__	/* Cray Unicos/Mk */
- #define _WCHAR_T
-@@ -272,6 +279,7 @@ typedef long ssize_t;
- #define __INT_WCHAR_T_H
- #define _GCC_WCHAR_T
- #define _WCHAR_T_DECLARED
-+#define __DEFINED_wchar_t /* musl */
- 
- /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
-    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
-@@ -337,6 +345,7 @@ typedef __WCHAR_TYPE__ wchar_t;
- #endif
- #endif /* __WCHAR_T__ */
- #endif /* __wchar_t__ */
-+#endif /* __DEFINED_wchar_t musl */
- #undef	__need_wchar_t
- #endif /* _STDDEF_H or __need_wchar_t.  */
- 
diff --git a/meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0023-libatomic-Do-not-enforce-march-on-aarch64.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
rename to meta/recipes-devtools/gcc/gcc/0023-libatomic-Do-not-enforce-march-on-aarch64.patch
index 85b12514823..2f016598470 100644
--- a/meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0023-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From df1c63bbd7a520e8c6d0d0692b4d8bff56952394 Mon Sep 17 00:00:00 2001
+From 52931ec7a708b58d68e69ce9eb99001ae9f099dd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 deletions(-)
 
 diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index ab8c2da24a1..f614a46b34d 100644
+index d88515e4a03..e0e2f8b442a 100644
 --- a/libatomic/Makefile.am
 +++ b/libatomic/Makefile.am
 @@ -125,7 +125,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix _$(s)_.lo,$(SIZEOBJS)))
diff --git a/meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux64.h.patch b/meta/recipes-devtools/gcc/gcc/0024-Fix-install-path-of-linux64.h.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux64.h.patch
rename to meta/recipes-devtools/gcc/gcc/0024-Fix-install-path-of-linux64.h.patch
index d7e156e7a33..555be62328e 100644
--- a/meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux64.h.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-Fix-install-path-of-linux64.h.patch
@@ -1,4 +1,4 @@
-From 8a62cc0a64670e39f462c1dbbf82e04d2f03b89e Mon Sep 17 00:00:00 2001
+From 3e67c9c77e46132c252911bf1e5e4222dfd3aa34 Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei.gherzan@huawei.com>
 Date: Wed, 22 Dec 2021 12:49:25 +0100
 Subject: [PATCH] Fix install path of linux64.h
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 06eb0d27a28..a8678ca24ed 100644
+index 07fa63b6640..0def7394454 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3686,6 +3686,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -3706,6 +3706,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  	  "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
  	  | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
  	    base=`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
diff --git a/meta/recipes-devtools/gcc/gcc/0025-Move-sched.h-include-ahead-of-user-headers.patch b/meta/recipes-devtools/gcc/gcc/0025-Move-sched.h-include-ahead-of-user-headers.patch
new file mode 100644
index 00000000000..d4aeacfed51
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0025-Move-sched.h-include-ahead-of-user-headers.patch
@@ -0,0 +1,56 @@
+From 7422adfb471f4b4f2ec870124064632d55f72e50 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 11 Apr 2022 15:46:18 -0700
+Subject: [PATCH] Move sched.h include ahead of user headers
+
+Fix attempt to use poisoned calloc error, this moves the sched.h before
+using system.h from gcc headers which includes #pragma GCC poison calloc
+
+Fixes
+In file included from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/pthread.h:30,
+                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/aarch64-yoe-linux-musl/bits/gthr-default.h:35,
+                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/aarch64-yoe-linux-musl/bits/gthr.h:148,
+                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/ext/atomicity.h:35,
+                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/bits/shared_ptr_base.h:61,
+                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/bits/shared_ptr.h:53,
+                 from /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/c++/12.0.1/memory:77,
+                 from ../../../../../../../work-shared/gcc-12.0.1-r0/gcc-12-20220410/libcc1/deleter.hh:23,
+                 from ../../../../../../../work-shared/gcc-12.0.1-r0/gcc-12-20220410/libcc1/rpc.hh:25,
+                 from ../../../../../../../work-shared/gcc-12.0.1-r0/gcc-12-20220410/libcc1/libcc1plugin.cc:67:
+/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/sched.h:84:7: error: attempt to use poisoned "calloc"
+   84 | void *calloc(size_t, size_t);
+      |       ^
+/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/gcc/12.0.1-r0/recipe-sysroot/usr/include/sched.h:124:36: error: attempt to use poisoned "calloc"
+  124 | #define CPU_ALLOC(n) ((cpu_set_t *)calloc(1,CPU_ALLOC_SIZE(n)))
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcc1/libcc1plugin.cc | 1 +
+ libcc1/libcp1plugin.cc | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libcc1/libcc1plugin.cc b/libcc1/libcc1plugin.cc
+index 12ab5a57c8d..fff9bfab18b 100644
+--- a/libcc1/libcc1plugin.cc
++++ b/libcc1/libcc1plugin.cc
+@@ -17,6 +17,7 @@
+    along with GCC; see the file COPYING3.  If not see
+    <http://www.gnu.org/licenses/>.  */
+ 
++#include <sched.h>
+ #include <cc1plugin-config.h>
+ 
+ #undef PACKAGE_NAME
+diff --git a/libcc1/libcp1plugin.cc b/libcc1/libcp1plugin.cc
+index 83dab7f58b1..0b83ce7a09d 100644
+--- a/libcc1/libcp1plugin.cc
++++ b/libcc1/libcp1plugin.cc
+@@ -18,6 +18,7 @@
+    along with GCC; see the file COPYING3.  If not see
+    <http://www.gnu.org/licenses/>.  */
+ 
++#include <sched.h>
+ #include <cc1plugin-config.h>
+ 
+ #undef PACKAGE_NAME
diff --git a/meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch b/meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
deleted file mode 100644
index de06793482a..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 49008eeedc97014f44e12afe179d3785e4438372 Mon Sep 17 00:00:00 2001
-From: Richard Biener <rguenther@suse.de>
-Date: Tue, 20 Jul 2021 11:00:33 +0200
-Subject: [PATCH] debug/101473 - apply debug prefix maps before checksumming
- DIEs
-
-The following makes sure to apply the debug prefix maps to filenames
-before checksumming DIEs to create the global symbol for the CU DIE
-used by LTO to link the late debug to the early debug.  This avoids
-binary differences (in said symbol) when compiling with toolchains
-installed under a different path and that compensated with appropriate
--fdebug-prefix-map options.
-
-The easiest and most scalable way is to record both the unmapped
-and the remapped filename in the dwarf_file_data so the remapping
-process takes place at a single point and only once (otherwise it
-creates GC garbage at each point doing that).
-
-2021-07-20  Richard Biener  <rguenther@suse.de>
-
-	PR debug/101473
-	* dwarf2out.h (dwarf_file_data): Add key member.
-	* dwarf2out.c (dwarf_file_hasher::equal): Compare key.
-	(dwarf_file_hasher::hash): Hash key.
-	(lookup_filename): Remap the filename and store it in the
-	filename member of dwarf_file_data when creating a new
-	dwarf_file_data.
-	(file_name_acquire): Do not remap the filename again.
-	(maybe_emit_file): Likewise.
-
-[YOCTO #14481]
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=7cc2df084b7977653a9b59cbc34a9ad500ae619c]
-
-The upstream patch was modified to compensate for the definition of
-"struct dwarf_file_data" being in dwarf2out.c rather than dwarf2out.h in
-this version of gcc.
-
-Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/dwarf2out.c | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
-index e5d3ce4966d..41ac3008507 100644
---- a/gcc/dwarf2out.c
-+++ b/gcc/dwarf2out.c
-@@ -1283,6 +1283,7 @@ dwarf2out_switch_text_section (void)
- 
- /* Data about a single source file.  */
- struct GTY((for_user)) dwarf_file_data {
-+  const char * key;
-   const char * filename;
-   int emitted_number;
- };
-@@ -12335,7 +12336,7 @@ file_name_acquire (dwarf_file_data **slot, file_name_acquire_data *fnad)
- 
-   fi = fnad->files + fnad->used_files++;
- 
--  f = remap_debug_filename (d->filename);
-+  f = d->filename;
- 
-   /* Skip all leading "./".  */
-   while (f[0] == '.' && IS_DIR_SEPARATOR (f[1]))
-@@ -27259,13 +27260,13 @@ dwarf2out_ignore_block (const_tree block)
- bool
- dwarf_file_hasher::equal (dwarf_file_data *p1, const char *p2)
- {
--  return filename_cmp (p1->filename, p2) == 0;
-+  return filename_cmp (p1->key, p2) == 0;
- }
- 
- hashval_t
- dwarf_file_hasher::hash (dwarf_file_data *p)
- {
--  return htab_hash_string (p->filename);
-+  return htab_hash_string (p->key);
- }
- 
- /* Lookup FILE_NAME (in the list of filenames that we know about here in
-@@ -27295,7 +27296,8 @@ lookup_filename (const char *file_name)
-     return *slot;
- 
-   created = ggc_alloc<dwarf_file_data> ();
--  created->filename = file_name;
-+  created->key = file_name;
-+  created->filename = remap_debug_filename (file_name);
-   created->emitted_number = 0;
-   *slot = created;
-   return created;
-@@ -27321,8 +27323,7 @@ maybe_emit_file (struct dwarf_file_data * fd)
-       if (output_asm_line_debug_info ())
- 	{
- 	  fprintf (asm_out_file, "\t.file %u ", fd->emitted_number);
--	  output_quoted_string (asm_out_file,
--				remap_debug_filename (fd->filename));
-+	  output_quoted_string (asm_out_file, fd->filename);
- 	  fputc ('\n', asm_out_file);
- 	}
-     }
diff --git a/meta/recipes-devtools/gcc/gcc_11.3.bb b/meta/recipes-devtools/gcc/gcc_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_11.3.bb
rename to meta/recipes-devtools/gcc/gcc_12.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.3.bb b/meta/recipes-devtools/gcc/libgcc-initial_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_11.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_12.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_11.3.bb b/meta/recipes-devtools/gcc/libgcc_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_11.3.bb
rename to meta/recipes-devtools/gcc/libgcc_12.1.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_11.3.bb b/meta/recipes-devtools/gcc/libgfortran_12.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_11.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_12.1.bb
-- 
2.36.1

