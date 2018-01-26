Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E16877FED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 23:25:23 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0QNPMGp025719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 26 Jan 2018 23:25:23 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1efDN4-0002lM-4U; Fri, 26 Jan 2018 23:25:22 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jan 2018 23:25:20 +0000
Message-Id: <1517009120-10582-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] gcc: Upgrade 7.2 -> 7.3
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
X-List-Received-Date: Fri, 26 Jan 2018 23:25:25 -0000

The static PIE patch was updated by Juro Bystricky <juro.bystricky@intel.com>
to work with gcc 7.3.

This update from the stable gcc 7 branch includes the retpoline
functionality which is useful to assist with recent security issues.

Two backported patches were dropped as they're included in 7.3.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gcc-7.2/0001-PR-rtl-optimization-81803.patch   |  52 ------
 .../gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch   |  37 ----
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch | 194 ---------------------
 .../gcc/{gcc-7.2.inc => gcc-7.3.inc}               |  13 +-
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   0
 .../{gcc-7.2 => gcc-7.3}/0008-c99-snprintf.patch   |   0
 .../0009-gcc-poison-system-directories.patch       |   6 +-
 .../0010-gcc-poison-dir-extend.patch               |   0
 .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
 .../0012-64-bit-multilib-hack.patch                |   0
 .../0013-optional-libstdc.patch                    |   0
 ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   0
 .../0015-COLLECT_GCC_OPTIONS.patch                 |   0
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
 .../0017-fortran-cross-compile-hack.patch          |   0
 .../0018-cpp-honor-sysroot.patch                   |   0
 .../0019-MIPS64-Default-to-N64-ABI.patch           |   0
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
 ...0021-gcc-Fix-argument-list-too-long-error.patch |   0
 .../{gcc-7.2 => gcc-7.3}/0022-Disable-sdt.patch    |   0
 .../gcc/{gcc-7.2 => gcc-7.3}/0023-libtool.patch    |   0
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   0
 ...tilib-config-files-from-B-instead-of-usin.patch |   0
 ...-libdir-from-.la-which-usually-points-to-.patch |   0
 .../gcc/{gcc-7.2 => gcc-7.3}/0027-export-CPP.patch |   0
 ...AltiVec-generation-on-powepc-linux-target.patch |   0
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   0
 ...Ensure-target-gcc-headers-can-be-included.patch |   0
 ...-t-build-with-disable-dependency-tracking.patch |   0
 ...h-host-directory-during-relink-if-inst_pr.patch |   0
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   0
 .../0034-aarch64-Add-support-for-musl-ldso.patch   |   0
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   0
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |   0
 ...et-sysroot-gcc-version-specific-dirs-with.patch |   0
 ...-various-_FOR_BUILD-and-related-variables.patch |   0
 .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |   0
 ...shared-to-link-commandline-for-musl-targe.patch |   0
 ...c-libcpp-support-ffile-prefix-map-old-new.patch |   0
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   0
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |   0
 ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |   0
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
 ...e-alias-for-__cpu_indicator_init-instead-.patch |   0
 .../0047-sync-gcc-stddef.h-with-musl.patch         |   0
 .../gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch   |  46 +++++
 ...le-non-legitimate-address-in-riscv_legiti.patch |   0
 .../fix-segmentation-fault-precompiled-hdr.patch   |   0
 meta/recipes-devtools/gcc/gcc-common.inc           |   1 +
 ...s-canadian_7.2.bb => gcc-cross-canadian_7.3.bb} |   0
 ...oss-initial_7.2.bb => gcc-cross-initial_7.3.bb} |   0
 .../gcc/{gcc-cross_7.2.bb => gcc-cross_7.3.bb}     |   0
 ...-initial_7.2.bb => gcc-crosssdk-initial_7.3.bb} |   0
 .../{gcc-crosssdk_7.2.bb => gcc-crosssdk_7.3.bb}   |   0
 .../gcc/{gcc-runtime_7.2.bb => gcc-runtime_7.3.bb} |   0
 ...gcc-sanitizers_7.2.bb => gcc-sanitizers_7.3.bb} |   0
 .../gcc/{gcc-source_7.2.bb => gcc-source_7.3.bb}   |   0
 .../gcc/{gcc_7.2.bb => gcc_7.3.bb}                 |   0
 ...libgcc-initial_7.2.bb => libgcc-initial_7.3.bb} |   0
 .../gcc/{libgcc_7.2.bb => libgcc_7.3.bb}           |   0
 .../gcc/{libgfortran_7.2.bb => libgfortran_7.3.bb} |   0
 61 files changed, 56 insertions(+), 293 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
 rename meta/recipes-devtools/gcc/{gcc-7.2.inc => gcc-7.3.inc} (92%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0008-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0009-gcc-poison-system-directories.patch (97%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0010-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0012-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0013-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0015-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0017-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0018-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0019-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0021-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0022-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0023-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0027-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0030-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0034-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0036-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0038-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0047-sync-gcc-stddef.h-with-musl.patch (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/fix-segmentation-fault-precompiled-hdr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_7.2.bb => gcc-cross-canadian_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_7.2.bb => gcc-cross-initial_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_7.2.bb => gcc-cross_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_7.2.bb => gcc-crosssdk-initial_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_7.2.bb => gcc-crosssdk_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_7.2.bb => gcc-runtime_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_7.2.bb => gcc-sanitizers_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_7.2.bb => gcc-source_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_7.2.bb => gcc_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_7.2.bb => libgcc-initial_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_7.2.bb => libgcc_7.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_7.2.bb => libgfortran_7.3.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch b/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch
deleted file mode 100644
index 292e734..0000000
--- a/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 5cbb8e6b1122092b3eaabd4270b2f316aa40407c Mon Sep 17 00:00:00 2001
-From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 31 Oct 2017 18:27:52 +0000
-Subject: [PATCH] 	PR rtl-optimization/81803 	* lra-constraints.c
- (curr_insn_transform): Also reload the whole 	register for a strict subreg
- no wider than a word if this is for 	a WORD_REGISTER_OPERATIONS target.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@254275 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-
-This patch removes changes to Changelog from the original patch upstream. This is
-because we are backporting a patch to a stable version, making changes to Changelog,
-especially up '* GCC 7.2.0 released.', feels a little weird.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- gcc/lra-constraints.c | 11 ++++++++---
- 2 files changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
-index a423f069836..3758409bb9c 100644
---- a/gcc/lra-constraints.c
-+++ b/gcc/lra-constraints.c
-@@ -4207,8 +4207,9 @@ curr_insn_transform (bool check_only_p)
- 	      reg = SUBREG_REG (*loc);
- 	      byte = SUBREG_BYTE (*loc);
- 	      if (REG_P (reg)
--		  /* Strict_low_part requires reload the register not
--		     the sub-register.	*/
-+		  /* Strict_low_part requires reloading the register and not
-+		     just the subreg.  Likewise for a strict subreg no wider
-+		     than a word for WORD_REGISTER_OPERATIONS targets.  */
- 		  && (curr_static_id->operand[i].strict_low
- 		      || (!paradoxical_subreg_p (mode, GET_MODE (reg))
- 			  && (hard_regno
-@@ -4219,7 +4220,11 @@ curr_insn_transform (bool check_only_p)
- 			  && (goal_alt[i] == NO_REGS
- 			      || (simplify_subreg_regno
- 				  (ira_class_hard_regs[goal_alt[i]][0],
--				   GET_MODE (reg), byte, mode) >= 0)))))
-+				   GET_MODE (reg), byte, mode) >= 0)))
-+		      || (GET_MODE_PRECISION (mode)
-+			  < GET_MODE_PRECISION (GET_MODE (reg))
-+			  && GET_MODE_SIZE (GET_MODE (reg)) <= UNITS_PER_WORD
-+			  && WORD_REGISTER_OPERATIONS)))
- 		{
- 		  /* An OP_INOUT is required when reloading a subreg of a
- 		     mode wider than a word to ensure that data beyond the
--- 
-2.13.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch b/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
deleted file mode 100644
index 879e360..0000000
--- a/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 44ef80688b56beea85c0070840dea1e2a4e34aed Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 13 Jun 2017 12:12:52 -0700
-Subject: [PATCH 49/49] gcc: Enable static PIE
-
-Static PIE support in GCC
-see
-https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/gnu-user.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/config/gnu-user.h b/gcc/config/gnu-user.h
-index 2787a3d16be..ee7b781319e 100644
---- a/gcc/config/gnu-user.h
-+++ b/gcc/config/gnu-user.h
-@@ -51,10 +51,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- #if defined HAVE_LD_PIE
- #define GNU_USER_TARGET_STARTFILE_SPEC \
-   "%{!shared: %{pg|p|profile:gcrt1.o%s;: \
--    %{" PIE_SPEC ":Scrt1.o%s} %{" NO_PIE_SPEC ":crt1.o%s}}} \
--   crti.o%s %{static:crtbeginT.o%s;: %{shared:crtbeginS.o%s} \
-+    %{" PIE_SPEC ":%{static:rcrt1.o%s;:Scrt1.o%s}} %{" NO_PIE_SPEC ":crt1.o%s}}} \
-+   crti.o%s %{shared:crtbeginS.o%s;: \
- 	      %{" PIE_SPEC ":crtbeginS.o%s} \
--	      %{" NO_PIE_SPEC ":crtbegin.o%s}} \
-+	      %{" NO_PIE_SPEC ":%{static:crtbeginT.o%s;:crtbegin.o%s}}} \
-    %{fvtable-verify=none:%s; \
-      fvtable-verify=preinit:vtv_start_preinit.o%s; \
-      fvtable-verify=std:vtv_start.o%s} \
--- 
-2.13.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch b/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
deleted file mode 100644
index 0212507..0000000
--- a/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From 8c18b422211878ba02503462cb22a2cc25a0a325 Mon Sep 17 00:00:00 2001
-From: rearnsha <rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 19 Oct 2017 13:14:55 +0000
-Subject: [PATCH] [ARM] PR 82445 - suppress 32-bit aligned ldrd/strd peepholing
- with -mno-unaligned-access
-
-Peephole patterns exist in the arm backend to spot load/store
-operations to adjacent memory operations in order to convert them into
-ldrd/strd instructions.  However, when we have strict alignment
-enforced, then we can only do this if the accesses are known to be
-64-bit aligned; this is unlikely to be the case for most loads.  The
-patch adds some alignment checking to the code that validates the
-addresses for use in the peephole patterns.  This should also fix
-incorrect generation of ldrd/strd with unaligned accesses that could
-previously have occurred on ARMv5e where all such operations must be
-64-bit aligned.
-
-I've added some new tests as well.  In doing so I discovered that the
-ldrd/strd peephole tests could never fail since they would match the
-source file name in the scanned assembly as well as any instructions
-of the intended type.  I've fixed those by tightening the scan results
-slightly.
-
-gcc:
-
-* config/arm/arm.c (align_ok_ldrd_strd): New function.
-(mem_ok_for_ldrd_strd): New parameter align.  Extract the alignment of the
-mem into it.
-(gen_operands_ldrd_strd): Validate the alignment of the accesses.
-
-testsuite:
-
-* gcc.target/arm/peep-ldrd-1.c: Tighten test scan pattern.
-* gcc.target/arm/peep-strd-1.c: Likewise.
-* gcc.target/arm/peep-ldrd-2.c: New test.
-* gcc.target/arm/peep-strd-2.c: New test.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@253891 138bc75d-0d04-0410-961f-82ee72b054a4
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gcc/ChangeLog                                      |  8 +++++++
- gcc/config/arm/arm.c                               | 27 ++++++++++++++++++----
- gcc/testsuite/ChangeLog                            |  8 +++++++
- gcc/testsuite/gcc.target/arm/peep-ldrd-1.c         |  2 +-
- .../arm/{peep-ldrd-1.c => peep-ldrd-2.c}           |  4 ++--
- gcc/testsuite/gcc.target/arm/peep-strd-1.c         |  2 +-
- .../arm/{peep-strd-1.c => peep-strd-2.c}           |  4 ++--
- 7 files changed, 44 insertions(+), 11 deletions(-)
- copy gcc/testsuite/gcc.target/arm/{peep-ldrd-1.c => peep-ldrd-2.c} (63%)
- copy gcc/testsuite/gcc.target/arm/{peep-strd-1.c => peep-strd-2.c} (58%)
-
-diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
-index 1ded0d2a17d..989957f048e 100644
---- a/gcc/config/arm/arm.c
-+++ b/gcc/config/arm/arm.c
-@@ -15199,12 +15199,23 @@ operands_ok_ldrd_strd (rtx rt, rtx rt2, rtx rn, HOST_WIDE_INT offset,
-   return true;
- }
- 
-+/* Return true if a 64-bit access with alignment ALIGN and with a
-+   constant offset OFFSET from the base pointer is permitted on this
-+   architecture.  */
-+static bool
-+align_ok_ldrd_strd (HOST_WIDE_INT align, HOST_WIDE_INT offset)
-+{
-+  return (unaligned_access
-+	  ? (align >= BITS_PER_WORD && (offset & 3) == 0)
-+	  : (align >= 2 * BITS_PER_WORD && (offset & 7) == 0));
-+}
-+
- /* Helper for gen_operands_ldrd_strd.  Returns true iff the memory
-    operand MEM's address contains an immediate offset from the base
--   register and has no side effects, in which case it sets BASE and
--   OFFSET accordingly.  */
-+   register and has no side effects, in which case it sets BASE,
-+   OFFSET and ALIGN accordingly.  */
- static bool
--mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
-+mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset, HOST_WIDE_INT *align)
- {
-   rtx addr;
- 
-@@ -15223,6 +15234,7 @@ mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
-   gcc_assert (MEM_P (mem));
- 
-   *offset = const0_rtx;
-+  *align = MEM_ALIGN (mem);
- 
-   addr = XEXP (mem, 0);
- 
-@@ -15263,7 +15275,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
-                         bool const_store, bool commute)
- {
-   int nops = 2;
--  HOST_WIDE_INT offsets[2], offset;
-+  HOST_WIDE_INT offsets[2], offset, align[2];
-   rtx base = NULL_RTX;
-   rtx cur_base, cur_offset, tmp;
-   int i, gap;
-@@ -15275,7 +15287,8 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
-      registers, and the corresponding memory offsets.  */
-   for (i = 0; i < nops; i++)
-     {
--      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base, &cur_offset))
-+      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base, &cur_offset,
-+				 &align[i]))
-         return false;
- 
-       if (i == 0)
-@@ -15389,6 +15402,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
-       /* Swap the instructions such that lower memory is accessed first.  */
-       std::swap (operands[0], operands[1]);
-       std::swap (operands[2], operands[3]);
-+      std::swap (align[0], align[1]);
-       if (const_store)
-         std::swap (operands[4], operands[5]);
-     }
-@@ -15402,6 +15416,9 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
-   if (gap != 4)
-     return false;
- 
-+  if (!align_ok_ldrd_strd (align[0], offset))
-+    return false;
-+
-   /* Make sure we generate legal instructions.  */
-   if (operands_ok_ldrd_strd (operands[0], operands[1], base, offset,
-                              false, load))
-diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
-index eb2b86ee7b6..d49eff6b87e 100644
---- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
-+++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
-@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
-   *p = a;
-   return a;
- }
--/* { dg-final { scan-assembler "ldrd" } } */
-+/* { dg-final { scan-assembler "ldrd\\t" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
-similarity index 63%
-copy from gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
-copy to gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
-index eb2b86ee7b6..6822c2b1454 100644
---- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
-+++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
-@@ -1,6 +1,6 @@
- /* { dg-do compile } */
- /* { dg-require-effective-target arm_prefer_ldrd_strd } */
--/* { dg-options "-O2" }  */
-+/* { dg-options "-O2 -mno-unaligned-access" }  */
- int foo(int a, int b, int* p, int *q)
- {
-   a = p[2] + p[3];
-@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
-   *p = a;
-   return a;
- }
--/* { dg-final { scan-assembler "ldrd" } } */
-+/* { dg-final { scan-assembler-not "ldrd\\t" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
-index bd330769599..fe1beac7229 100644
---- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
-+++ b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
-@@ -6,4 +6,4 @@ void foo(int a, int b, int* p)
-   p[2] = a;
-   p[3] = b;
- }
--/* { dg-final { scan-assembler "strd" } } */
-+/* { dg-final { scan-assembler "strd\\t" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
-similarity index 58%
-copy from gcc/testsuite/gcc.target/arm/peep-strd-1.c
-copy to gcc/testsuite/gcc.target/arm/peep-strd-2.c
-index bd330769599..bfc5ebe9eec 100644
---- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
-+++ b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
-@@ -1,9 +1,9 @@
- /* { dg-do compile } */
- /* { dg-require-effective-target arm_prefer_ldrd_strd } */
--/* { dg-options "-O2" }  */
-+/* { dg-options "-O2 -mno-unaligned-access" }  */
- void foo(int a, int b, int* p)
- {
-   p[2] = a;
-   p[3] = b;
- }
--/* { dg-final { scan-assembler "strd" } } */
-+/* { dg-final { scan-assembler-not "strd\\t" } } */
--- 
-2.15.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-7.2.inc
rename to meta/recipes-devtools/gcc/gcc-7.3.inc
index f3d8a5e..efa62ea 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "7.2.0"
+PV = "7.3.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "7.2.0"
+BINV = "7.3.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-7.2/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.3:${FILE_DIRNAME}/gcc-7.3/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
@@ -78,11 +78,10 @@ SRC_URI = "\
            ${BACKPORTS} \
 "
 BACKPORTS = "\
-           file://0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch \
-           file://0001-PR-rtl-optimization-81803.patch \
 "
-SRC_URI[md5sum] = "ff370482573133a7fcdd96cd2f552292"
-SRC_URI[sha256sum] = "1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a"
+
+SRC_URI[md5sum] = "be2da21680f27624f3a87055c4ba5af2"
+SRC_URI[sha256sum] = "832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-directories.patch
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-directories.patch
index 4d4e987..fe13ed6 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-directories.patch
@@ -138,16 +138,16 @@ index 68a558e9992..060cd7169c6 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 120c5c0792a..6315aa0dd16 100644
+index c48178f..f63d53d 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1035,6 +1035,8 @@ proper position among the other output files.  */
+@@ -1029,6 +1029,8 @@ proper position among the other output files.  */
     "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} \
 +    %{Wno-poison-system-directories:--no-poison-system-directories} \
 +    %{Werror=poison-system-directories:--error-poison-system-directories} \
-     %{static:} %{L*} %(mfwrap) %(link_libgcc) " \
+     %{static|no-pie:} %{L*} %(mfwrap) %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o " CHKP_SPEC " \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
 diff --git a/gcc/incpath.c b/gcc/incpath.c
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison-dir-extend.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison-dir-extend.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-7.3/0013-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0013-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-7.3/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cross-compile-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cross-compile-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Default-to-N64-ABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Default-to-N64-ABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-7.3/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-argument-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-argument-list-too-long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-7.3/0022-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0022-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch b/meta/recipes-devtools/gcc/gcc-7.3/0023-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0023-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-7.3/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-7.3/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-7.3/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-7.3/0027-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0027-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-7.3/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-7.3/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-headers-can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-7.3/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-7.3/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-7.3/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Add-support-for-musl-ldso.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Add-support-for-musl-ldso.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-7.3/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-7.3/0036-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0036-handle-sysroot-support-for-nativesdk-gcc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-7.3/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-7.3/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-7.3/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-7.3/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-7.3/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-7.3/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-7.3/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-7.3/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-stddef.h-with-musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-stddef.h-with-musl.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch b/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch
new file mode 100644
index 0000000..a96e913
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch
@@ -0,0 +1,46 @@
+From 44ef80688b56beea85c0070840dea1e2a4e34aed Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 13 Jun 2017 12:12:52 -0700
+Subject: [PATCH 49/49] gcc: Enable static PIE
+
+Static PIE support in GCC
+see
+https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html
+
+startfiles before patch:
+ -static -> crt1.o crti.o crtbeginT.o
+ -static -PIE -> crt1.o crti.o crtbeginT.o
+ 
+after patch:
+ -static -> crt1.o crti.o crtbeginT.o
+ -static -PIE -> rcrt1.o crti.o crtbeginS.o
+ 
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+---
+ gcc/config/gnu-user.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/config/gnu-user.h b/gcc/config/gnu-user.h
+index de605b0..b035bbe 100644
+--- a/gcc/config/gnu-user.h
++++ b/gcc/config/gnu-user.h
+@@ -52,11 +52,11 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ #define GNU_USER_TARGET_STARTFILE_SPEC \
+   "%{shared:; \
+      pg|p|profile:gcrt1.o%s; \
+-     static:crt1.o%s; \
++     static: %{" PIE_SPEC ": rcrt1.o%s; :crt1.o%s}; \
+      " PIE_SPEC ":Scrt1.o%s; \
+      :crt1.o%s} \
+    crti.o%s \
+-   %{static:crtbeginT.o%s; \
++   %{static: %{" PIE_SPEC ": crtbeginS.o%s; :crtbeginT.o%s}; \
+      shared|" PIE_SPEC ":crtbeginS.o%s; \
+      :crtbegin.o%s} \
+    %{fvtable-verify=none:%s; \
+
+2.13.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch b/meta/recipes-devtools/gcc/gcc-7.3/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-precompiled-hdr.patch b/meta/recipes-devtools/gcc/gcc-7.3/fix-segmentation-fault-precompiled-hdr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-precompiled-hdr.patch
rename to meta/recipes-devtools/gcc/gcc-7.3/fix-segmentation-fault-precompiled-hdr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index b5975b5..aa3b53e 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -105,6 +105,7 @@ gcclibdir = "${libdir}/gcc"
 BINV = "${PV}"
 #S = "${WORKDIR}/gcc-${PV}"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 target_includedir ?= "${includedir}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_7.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_7.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_7.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_7.2.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-initial_7.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-initial_7.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_7.2.bb b/meta/recipes-devtools/gcc/gcc-cross_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_7.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_7.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_7.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_7.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_7.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_7.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_7.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_7.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_7.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_7.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_7.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_7.2.bb b/meta/recipes-devtools/gcc/gcc-source_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_7.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_7.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc_7.2.bb b/meta/recipes-devtools/gcc/gcc_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_7.2.bb
rename to meta/recipes-devtools/gcc/gcc_7.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_7.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_7.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_7.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_7.2.bb b/meta/recipes-devtools/gcc/libgcc_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_7.2.bb
rename to meta/recipes-devtools/gcc/libgcc_7.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_7.2.bb b/meta/recipes-devtools/gcc/libgfortran_7.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_7.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_7.3.bb
-- 
2.7.4


