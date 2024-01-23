Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B88EC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:47:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.7672.1705999670319786182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=CWXkFmHW;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705999669; x=1737535669;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HMhEK/hsyrbjb7pXrhLl5W/wihwY5XWniyH/f7da3jA=;
  b=CWXkFmHWMSsJvEc4XZbfez3IVGP47juv6FheDyZCwC8m5HXTvGelkTmn
   mAfHXVlgosu8qpTHQfyrI0FN5W7Go/FG/cuX2v4kXSVcksmseB7DxVcEh
   6DhYZPAu0ZPSubBe3YKEcqkr6XrD3QVxU8C/64mPdGodRf8SyiIWVoY9g
   GJfKsvYNHEJp9u8Fj8Oq7SMTVMxN2U+nU934aHGhCJSuywiKrLOF4XWfH
   mHZ++DNaqP4jL8IGcadOtsgUONMMZ3CRrZrrtmRiyDtYuZQz1M/q4DdXY
   /CBKlwZ615vdlfl7erVXGqXwHsodXe5aFZNjBxRk6a+0LtaxKfZ5LMmWm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432617084"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="432617084"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 00:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="820013023"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="820013023"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.153.8])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 00:47:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] grub2: upgrade 2.06 -> 2.12
Date: Tue, 23 Jan 2024 16:47:34 +0800
Message-ID: <20240123084734.223154-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123084734.223154-1-anuj.mittal@intel.com>
References: <20240123084734.223154-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194217

Drop patches that have been upstreamed. Refresh others.

This version dropped extra_deps.lst from the tarball [1] and that leads
to build failures. Restore it in do_configure for now.

[1] https://git.savannah.gnu.org/cgit/grub.git/commit/?id=b835601c7639ed1890f2d3db91900a8506011a8e

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ath-sse-as-well-when-SSE-is-disabled.patch |   9 +-
 ...1-RISC-V-Restore-the-typcast-to-long.patch |  10 +-
 ...-obsoleted-malign-jumps-loops-functi.patch |  48 --
 ...-_zicsr_zifencei-extentions-on-riscv.patch |  47 --
 ...erflow-in-grub_font_get_glyph_intern.patch | 115 ---
 ...gnore-checksum-seed-incompat-feature.patch |  66 --
 ...1-fs-fat-Don-t-error-when-mtime-is-0.patch |  70 --
 ...b.d-10_linux.in-add-oe-s-kernel-name.patch |  10 +-
 ...risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch |  48 --
 ...for-falign-jumps-1-beside-falign-loo.patch |  59 --
 ...g-Drop-greyscale-support-to-fix-heap.patch | 179 -----
 ...ng-Avoid-heap-OOB-R-W-inserting-huff.patch |  50 --
 ...peg-Block-int-underflow-wild-pointer.patch |  84 ---
 ...onfig-Restore-umask-for-the-grub.cfg.patch |  49 --
 .../grub/files/CVE-2022-2601.patch            |  85 ---
 ...3-net-ip-Do-IP-fragment-maths-safely.patch |  63 --
 ...or-out-on-headers-with-LF-without-CR.patch |  58 --
 ...Fix-OOB-write-for-split-http-headers.patch |  56 --
 ...ct-non-kernel-files-in-the-shim_lock.patch | 111 ---
 ...i-chainloader-Use-grub_loader_set_ex.patch |  86 ---
 .../grub/files/CVE-2022-3775.patch            |  95 ---
 .../grub/files/CVE-2023-4692.patch            |  98 ---
 .../grub/files/CVE-2023-4693.patch            |  63 --
 .../grub/files/autogen.sh-exclude-pc.patch    |  10 +-
 ...ot-Add-API-to-pass-context-to-loader.patch | 168 -----
 meta/recipes-bsp/grub/files/determinism.patch |  68 --
 ...icitly-keeps-symbole-.module_license.patch |   7 +-
 ...hainloader-Simplify-the-loader-state.patch | 129 ----
 .../video-Remove-trailing-whitespaces.patch   | 693 ------------------
 ...eg-Abort-sooner-if-a-read-operation-.patch | 264 -------
 ...eg-Refuse-to-handle-multiple-start-o.patch |  53 --
 .../{grub-efi_2.06.bb => grub-efi_2.12.bb}    |   0
 meta/recipes-bsp/grub/grub2.inc               |  33 +-
 .../grub/{grub_2.06.bb => grub_2.12.bb}       |   0
 34 files changed, 28 insertions(+), 2956 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2022-2601.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2022-3775.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
 delete mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch
 delete mode 100644 meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
 delete mode 100644 meta/recipes-bsp/grub/files/determinism.patch
 delete mode 100644 meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch
 delete mode 100644 meta/recipes-bsp/grub/files/video-Remove-trailing-whitespaces.patch
 delete mode 100644 meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch
 delete mode 100644 meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch
 rename meta/recipes-bsp/grub/{grub-efi_2.06.bb => grub-efi_2.12.bb} (100%)
 rename meta/recipes-bsp/grub/{grub_2.06.bb => grub_2.12.bb} (100%)

diff --git a/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch b/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
index 6b73878cc0c..05a4697a734 100644
--- a/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
+++ b/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
@@ -1,4 +1,4 @@
-From 96d9aa55d29b24e2490d5647a9efc66940fc400f Mon Sep 17 00:00:00 2001
+From 006799e9c4babe8a8340a24501b253e759614a2d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jan 2016 19:17:31 +0000
 Subject: [PATCH] Disable -mfpmath=sse as well when SSE is disabled
@@ -24,15 +24,16 @@ Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
+
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7656f24..0868ea9 100644
+index cd667a2..8263876 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -824,7 +824,7 @@ fi
+@@ -846,7 +846,7 @@ fi
  if ( test "x$target_cpu" = xi386 || test "x$target_cpu" = xx86_64 ) && test "x$platform" != xemu; then
    # Some toolchains enable these features by default, but they need
    # registers that aren't set up properly in GRUB.
@@ -40,4 +41,4 @@ index 7656f24..0868ea9 100644
 +  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-sse3 -mno-3dnow -mfpmath=387"
  fi
  
- # GRUB doesn't use float or doubles at all. Yet some toolchains may decide
+ if ( test "x$target_cpu" = xi386 || test "x$target_cpu" = xx86_64 ); then
diff --git a/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch b/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
index 2f15a91f684..cafa7117318 100644
--- a/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
+++ b/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
@@ -1,4 +1,4 @@
-From e4c41db74b8972285cbdfe614c95c1ffd97d70e1 Mon Sep 17 00:00:00 2001
+From b47029e8e582d17c6874d2622fe1a5b834377dbb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 26 Mar 2021 11:59:43 -0700
 Subject: [PATCH] RISC-V: Restore the typcast to 64bit type
@@ -17,15 +17,16 @@ Cc: Daniel Kiper <daniel.kiper@oracle.com>
 Cc: Chester Lin <clin@suse.com>
 Cc: Nikita Ermakov <arei@altlinux.org>
 Cc: Alistair Francis <alistair.francis@wdc.com>
+
 ---
  util/grub-mkimagexx.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
-index 00f49ccaa..ac677d03d 100644
+index e50b295..2f09255 100644
 --- a/util/grub-mkimagexx.c
 +++ b/util/grub-mkimagexx.c
-@@ -1242,7 +1242,7 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
+@@ -1310,7 +1310,7 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
  		  */
  
  		 sym_addr += addend;
@@ -34,6 +35,3 @@ index 00f49ccaa..ac677d03d 100644
  
  		 switch (ELF_R_TYPE (info))
  		   {
--- 
-2.31.1
-
diff --git a/meta/recipes-bsp/grub/files/0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch b/meta/recipes-bsp/grub/files/0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch
deleted file mode 100644
index 98142a7b60a..00000000000
--- a/meta/recipes-bsp/grub/files/0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From eb486898dac8cbc29b2cc39f911b657c3417ae34 Mon Sep 17 00:00:00 2001
-From: Fangrui Song via Grub-devel <grub-devel@gnu.org>
-Date: Thu, 26 Aug 2021 09:02:31 -0700
-Subject: [PATCH 1/2] configure: Remove obsoleted -malign-{jumps, loops,
- functions}
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The GCC warns "cc1: warning: ‘-malign-loops’ is obsolete, use ‘-falign-loops’".
-The Clang silently ignores -malign-{jumps,loops,functions}.
-
-The preferred -falign-* forms have been supported since GCC 3.2. So, just
-remove -malign-{jumps,loops,functions}.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=eb486898dac8cbc29b2cc39f911b657c3417ae34]
-Signed-off-by: Fangrui Song <maskray@google.com>
-Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
----
- configure.ac | 9 ---------
- 1 file changed, 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index bee28dbeb..9a12151bd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -805,17 +805,8 @@ if test "x$target_cpu" = xi386; then
- 	[grub_cv_cc_falign_loop=no])
-   ])
- 
--  AC_CACHE_CHECK([whether -malign-loops works], [grub_cv_cc_malign_loop], [
--    CFLAGS="$TARGET_CFLAGS -malign-loops=1 -Werror"
--    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
--        [grub_cv_cc_malign_loop=yes],
--	[grub_cv_cc_malign_loop=no])
--  ])
--
-   if test "x$grub_cv_cc_falign_loop" = xyes; then
-     TARGET_CFLAGS="$TARGET_CFLAGS -falign-jumps=1 -falign-loops=1 -falign-functions=1"
--  elif test "x$grub_cv_cc_malign_loop" = xyes; then
--    TARGET_CFLAGS="$TARGET_CFLAGS -malign-jumps=1 -malign-loops=1 -malign-functions=1"
-   fi
- fi
- 
--- 
-2.37.3
-
diff --git a/meta/recipes-bsp/grub/files/0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch b/meta/recipes-bsp/grub/files/0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch
deleted file mode 100644
index c575a311612..00000000000
--- a/meta/recipes-bsp/grub/files/0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From f1217c803cec90813eb834dde7829f4961b2a2e4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 17 Feb 2022 15:07:02 -0800
-Subject: [PATCH] configure.ac: Use _zicsr_zifencei extentions on riscv
-
-From version 2.38, binutils defaults to ISA spec version 20191213. This
-means that the csr read/write (csrr*/csrw*) instructions and fence.i
-instruction has separated from the `I` extension, become two standalone
-extensions: Zicsr and Zifencei.
-
-The fix is to specify those extensions explicitely in -march. Since we
-are now using binutils 2.38+ in OE this is ok, a more upstreamable fix for
-grub will be to detect these extentions, however thats not easy to
-implement
-
-Upstream-Status: Inappropriate [OE specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c7fc55a..072f2c9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -849,14 +849,14 @@ if test x"$platform" != xemu ; then
- 		         [grub_cv_target_cc_soft_float="-mgeneral-regs-only"], [])
-     fi
-     if test "x$target_cpu" = xriscv32; then
--       CFLAGS="$TARGET_CFLAGS -march=rv32imac -mabi=ilp32 -Werror"
-+       CFLAGS="$TARGET_CFLAGS -march=rv32imac_zicsr_zifencei -mabi=ilp32 -Werror"
-        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
--		         [grub_cv_target_cc_soft_float="-march=rv32imac -mabi=ilp32"], [])
-+		         [grub_cv_target_cc_soft_float="-march=rv32imac_zicsr_zifencei -mabi=ilp32"], [])
-     fi
-     if test "x$target_cpu" = xriscv64; then
--       CFLAGS="$TARGET_CFLAGS -march=rv64imac -mabi=lp64 -Werror"
-+       CFLAGS="$TARGET_CFLAGS -march=rv64imac_zicsr_zifencei -mabi=lp64 -Werror"
-        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
--		         [grub_cv_target_cc_soft_float="-march=rv64imac -mabi=lp64"], [])
-+		         [grub_cv_target_cc_soft_float="-march=rv64imac_zicsr_zifencei -mabi=lp64"], [])
-     fi
-     if test "x$target_cpu" = xia64; then
-        CFLAGS="$TARGET_CFLAGS -mno-inline-float-divide -mno-inline-sqrt -Werror"
--- 
-2.35.1
-
diff --git a/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch b/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
deleted file mode 100644
index efa00a3c6ca..00000000000
--- a/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 1f511ae054fe42dce7aedfbfe0f234fa1e0a7a3e Mon Sep 17 00:00:00 2001
-From: Zhang Boyang <zhangboyang.id@gmail.com>
-Date: Fri, 5 Aug 2022 00:51:20 +0800
-Subject: [PATCH] font: Fix size overflow in grub_font_get_glyph_internal()
-
-The length of memory allocation and file read may overflow. This patch
-fixes the problem by using safemath macros.
-
-There is a lot of code repetition like "(x * y + 7) / 8". It is unsafe
-if overflow happens. This patch introduces grub_video_bitmap_calc_1bpp_bufsz().
-It is safe replacement for such code. It has safemath-like prototype.
-
-This patch also introduces grub_cast(value, pointer), it casts value to
-typeof(*pointer) then store the value to *pointer. It returns true when
-overflow occurs or false if there is no overflow. The semantics of arguments
-and return value are designed to be consistent with other safemath macros.
-
-Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport from
-[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c76ec09ae08155df27cd237eaea150b4f02f532]
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
-
----
- grub-core/font/font.c   | 17 +++++++++++++----
- include/grub/bitmap.h   | 18 ++++++++++++++++++
- include/grub/safemath.h |  2 ++
- 3 files changed, 33 insertions(+), 4 deletions(-)
-
-diff --git a/grub-core/font/font.c b/grub-core/font/font.c
-index d09bb38..876b5b6 100644
---- a/grub-core/font/font.c
-+++ b/grub-core/font/font.c
-@@ -739,7 +739,8 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
-       grub_int16_t xoff;
-       grub_int16_t yoff;
-       grub_int16_t dwidth;
--      int len;
-+      grub_ssize_t len;
-+      grub_size_t sz;
- 
-       if (index_entry->glyph)
- 	/* Return cached glyph.  */
-@@ -766,9 +767,17 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
- 	  return 0;
- 	}
- 
--      len = (width * height + 7) / 8;
--      glyph = grub_malloc (sizeof (struct grub_font_glyph) + len);
--      if (!glyph)
-+      /* Calculate real struct size of current glyph. */
-+      if (grub_video_bitmap_calc_1bpp_bufsz (width, height, &len) ||
-+	  grub_add (sizeof (struct grub_font_glyph), len, &sz))
-+	{
-+	  remove_font (font);
-+	  return 0;
-+	}
-+
-+      /* Allocate and initialize the glyph struct. */
-+      glyph = grub_malloc (sz);
-+      if (glyph == NULL)
- 	{
- 	  remove_font (font);
- 	  return 0;
-diff --git a/include/grub/bitmap.h b/include/grub/bitmap.h
-index 5728f8c..0d9603f 100644
---- a/include/grub/bitmap.h
-+++ b/include/grub/bitmap.h
-@@ -23,6 +23,7 @@
- #include <grub/symbol.h>
- #include <grub/types.h>
- #include <grub/video.h>
-+#include <grub/safemath.h>
- 
- struct grub_video_bitmap
- {
-@@ -79,6 +80,23 @@ grub_video_bitmap_get_height (struct grub_video_bitmap *bitmap)
-   return bitmap->mode_info.height;
- }
- 
-+/*
-+ * Calculate and store the size of data buffer of 1bit bitmap in result.
-+ * Equivalent to "*result = (width * height + 7) / 8" if no overflow occurs.
-+ * Return true when overflow occurs or false if there is no overflow.
-+ * This function is intentionally implemented as a macro instead of
-+ * an inline function. Although a bit awkward, it preserves data types for
-+ * safemath macros and reduces macro side effects as much as possible.
-+ *
-+ * XXX: Will report false overflow if width * height > UINT64_MAX.
-+ */
-+#define grub_video_bitmap_calc_1bpp_bufsz(width, height, result) \
-+({ \
-+  grub_uint64_t _bitmap_pixels; \
-+  grub_mul ((width), (height), &_bitmap_pixels) ? 1 : \
-+    grub_cast (_bitmap_pixels / GRUB_CHAR_BIT + !!(_bitmap_pixels % GRUB_CHAR_BIT), (result)); \
-+})
-+
- void EXPORT_FUNC (grub_video_bitmap_get_mode_info) (struct grub_video_bitmap *bitmap,
- 						    struct grub_video_mode_info *mode_info);
- 
-diff --git a/include/grub/safemath.h b/include/grub/safemath.h
-index c17b89b..bb0f826 100644
---- a/include/grub/safemath.h
-+++ b/include/grub/safemath.h
-@@ -30,6 +30,8 @@
- #define grub_sub(a, b, res)	__builtin_sub_overflow(a, b, res)
- #define grub_mul(a, b, res)	__builtin_mul_overflow(a, b, res)
- 
-+#define grub_cast(a, res)	grub_add ((a), 0, (res))
-+
- #else
- #error gcc 5.1 or newer or clang 3.8 or newer is required
- #endif
diff --git a/meta/recipes-bsp/grub/files/0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch b/meta/recipes-bsp/grub/files/0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
deleted file mode 100644
index a44d1393751..00000000000
--- a/meta/recipes-bsp/grub/files/0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-It enable the metadata_csum_seed feature by default in e2fsprogs 1.47.0 and
-causes grub doesn't work. Backport patch to make grub support this feature.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7fd5fef]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 7fd5feff97c4b1f446f8fcf6d37aca0c64e7c763 Mon Sep 17 00:00:00 2001
-From: Javier Martinez Canillas <javierm@redhat.com>
-Date: Fri, 11 Jun 2021 21:36:16 +0200
-Subject: [PATCH] fs/ext2: Ignore checksum seed incompat feature
-
-This incompat feature is used to denote that the filesystem stored its
-metadata checksum seed in the superblock. This is used to allow tune2fs
-changing the UUID on a mounted metdata_csum filesystem without having
-to rewrite all the disk metadata. However, the GRUB doesn't use the
-metadata checksum at all. So, it can just ignore this feature if it
-is enabled. This is consistent with the GRUB filesystem code in general
-which just does a best effort to access the filesystem's data.
-
-The checksum seed incompat feature has to be removed from the ignore
-list if the support for metadata checksum verification is added to the
-GRUB ext2 driver later.
-
-Suggested-by: Eric Sandeen <esandeen@redhat.com>
-Suggested-by: Lukas Czerner <lczerner@redhat.com>
-Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
-Reviewed-by: Lukas Czerner <lczerner@redhat.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
----
- grub-core/fs/ext2.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
-index e7dd78e66..4953a1591 100644
---- a/grub-core/fs/ext2.c
-+++ b/grub-core/fs/ext2.c
-@@ -103,6 +103,7 @@ GRUB_MOD_LICENSE ("GPLv3+");
- #define EXT4_FEATURE_INCOMPAT_64BIT		0x0080
- #define EXT4_FEATURE_INCOMPAT_MMP		0x0100
- #define EXT4_FEATURE_INCOMPAT_FLEX_BG		0x0200
-+#define EXT4_FEATURE_INCOMPAT_CSUM_SEED		0x2000
- #define EXT4_FEATURE_INCOMPAT_ENCRYPT          0x10000
- 
- /* The set of back-incompatible features this driver DOES support. Add (OR)
-@@ -123,10 +124,15 @@ GRUB_MOD_LICENSE ("GPLv3+");
-  * mmp:            Not really back-incompatible - was added as such to
-  *                 avoid multiple read-write mounts. Safe to ignore for this
-  *                 RO driver.
-+ * checksum seed:  Not really back-incompatible - was added to allow tools
-+ *                 such as tune2fs to change the UUID on a mounted metadata
-+ *                 checksummed filesystem. Safe to ignore for now since the
-+ *                 driver doesn't support checksum verification. However, it
-+ *                 has to be removed from this list if the support is added later.
-  */
- #define EXT2_DRIVER_IGNORED_INCOMPAT ( EXT3_FEATURE_INCOMPAT_RECOVER \
--				     | EXT4_FEATURE_INCOMPAT_MMP)
--
-+				     | EXT4_FEATURE_INCOMPAT_MMP \
-+				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED)
- 
- #define EXT3_JOURNAL_MAGIC_NUMBER	0xc03b3998U
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
deleted file mode 100644
index a5fbd58f468..00000000000
--- a/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From e43f3d93b28cce852c110c7a8e40d8311bcd8bb1 Mon Sep 17 00:00:00 2001
-From: Robbie Harwood <rharwood@redhat.com>
-Date: Fri, 15 Jul 2022 16:13:02 -0400
-Subject: [PATCH] fs/fat: Don't error when mtime is 0
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In the wild, we occasionally see valid ESPs where some file modification
-times are 0. For instance:
-
-    ├── [Dec 31  1979]  EFI
-    │   ├── [Dec 31  1979]  BOOT
-    │   │   ├── [Dec 31  1979]  BOOTX64.EFI
-    │   │   └── [Dec 31  1979]  fbx64.efi
-    │   └── [Jun 27 02:41]  fedora
-    │       ├── [Dec 31  1979]  BOOTX64.CSV
-    │       ├── [Dec 31  1979]  fonts
-    │       ├── [Mar 14 03:35]  fw
-    │       │   ├── [Mar 14 03:35]  fwupd-359c1169-abd6-4a0d-8bce-e4d4713335c1.cap
-    │       │   ├── [Mar 14 03:34]  fwupd-9d255c4b-2d88-4861-860d-7ee52ade9463.cap
-    │       │   └── [Mar 14 03:34]  fwupd-b36438d8-9128-49d2-b280-487be02d948b.cap
-    │       ├── [Dec 31  1979]  fwupdx64.efi
-    │       ├── [May 10 10:47]  grub.cfg
-    │       ├── [Jun  3 12:38]  grub.cfg.new.new
-    │       ├── [May 10 10:41]  grub.cfg.old
-    │       ├── [Jun 27 02:41]  grubenv
-    │       ├── [Dec 31  1979]  grubx64.efi
-    │       ├── [Dec 31  1979]  mmx64.efi
-    │       ├── [Dec 31  1979]  shim.efi
-    │       ├── [Dec 31  1979]  shimx64.efi
-    │       └── [Dec 31  1979]  shimx64-fedora.efi
-    └── [Dec 31  1979]  FSCK0000.REC
-
-    5 directories, 17 files
-
-This causes grub-probe failure, which in turn causes grub-mkconfig
-failure. They are valid filesystems that appear intact, and the Linux
-FAT stack is able to mount and manipulate them without complaint.
-
-The check for mtime of 0 has been present since
-20def1a3c3952982395cd7c3ea7e78638527962b (fat: support file
-modification times).
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e43f3d93b28cce852c110c7a8e40d8311bcd8bb1]
-
-Signed-off-by: Robbie Harwood <rharwood@redhat.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- grub-core/fs/fat.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/grub-core/fs/fat.c b/grub-core/fs/fat.c
-index 0951b2e63..c5efed724 100644
---- a/grub-core/fs/fat.c
-+++ b/grub-core/fs/fat.c
-@@ -1027,9 +1027,6 @@ grub_fat_dir (grub_device_t device, const char *path, grub_fs_dir_hook_t hook,
- 					  grub_le_to_cpu16 (ctxt.dir.w_date),
- 					  &info.mtime);
- #endif
--      if (info.mtimeset == 0)
--	grub_error (GRUB_ERR_OUT_OF_RANGE,
--		    "invalid modification timestamp for %s", path);
- 
-       if (hook (ctxt.filename, &info, hook_data))
- 	break;
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch b/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
index 69b04aa56fb..69dec7695a6 100644
--- a/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
+++ b/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
@@ -1,4 +1,4 @@
-From 8f47ed4aaefba087b6ca76e59c9f832b6a0702bc Mon Sep 17 00:00:00 2001
+From a80592e20f6c4b928a22862f52f268ab9d9908b2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jan 2016 19:28:00 +0000
 Subject: [PATCH] grub.d/10_linux.in: add oe's kernel name
@@ -20,10 +20,10 @@ Upstream-Status: Inappropriate [OE specific]
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/util/grub.d/10_linux.in b/util/grub.d/10_linux.in
-index 4532266..cba2617 100644
+index cc393be..8545cb6 100644
 --- a/util/grub.d/10_linux.in
 +++ b/util/grub.d/10_linux.in
-@@ -164,12 +164,12 @@ machine=`uname -m`
+@@ -166,12 +166,12 @@ machine=`uname -m`
  case "x$machine" in
      xi?86 | xx86_64)
  	list=
@@ -40,10 +40,10 @@ index 4532266..cba2617 100644
  	done ;;
  esac
 diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
-index 96179ea..98d16ae 100644
+index 94dd8be..36cd554 100644
 --- a/util/grub.d/20_linux_xen.in
 +++ b/util/grub.d/20_linux_xen.in
-@@ -154,7 +154,7 @@ EOF
+@@ -181,7 +181,7 @@ EOF
  }
  
  linux_list=
diff --git a/meta/recipes-bsp/grub/files/0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch b/meta/recipes-bsp/grub/files/0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch
deleted file mode 100644
index f3f12b6f0e7..00000000000
--- a/meta/recipes-bsp/grub/files/0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 64be669638e198bc0c7c1a344547265dfacd2470 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Jan 2023 15:29:02 -0800
-Subject: [PATCH] risc-v: Handle R_RISCV_CALL_PLT reloc
-
-GNU assembler starting 2.40 release always generates R_RISCV_CALL_PLT
-reloc for call in assembler [1], similarly llvm does not make
-distinction between R_RISCV_CALL_PLT and R_RISCV_CALL [2]
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/grub-devel/2023-02/msg00143.html]
-
-[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=70f35d72ef04cd23771875c1661c9975044a749c
-[2] https://reviews.llvm.org/D132530
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- grub-core/kern/riscv/dl.c | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/grub-core/kern/riscv/dl.c
-+++ b/grub-core/kern/riscv/dl.c
-@@ -188,6 +188,7 @@ grub_arch_dl_relocate_symbols (grub_dl_t
- 	  break;
- 
- 	case R_RISCV_CALL:
-+	case R_RISCV_CALL_PLT:
- 	  {
- 	    grub_uint32_t *abs_place = place;
- 	    grub_ssize_t off = sym_addr - (grub_addr_t) place;
---- a/util/grub-mkimagexx.c
-+++ b/util/grub-mkimagexx.c
-@@ -1294,6 +1294,7 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, st
- 		     }
- 		     break;
- 		   case R_RISCV_CALL:
-+		   case R_RISCV_CALL_PLT:
- 		     {
- 		       grub_uint32_t hi20, lo12;
- 
-@@ -1725,6 +1726,7 @@ translate_relocation_pe (struct translat
- 	case R_RISCV_BRANCH:
- 	case R_RISCV_JAL:
- 	case R_RISCV_CALL:
-+	case R_RISCV_CALL_PLT:
- 	case R_RISCV_PCREL_HI20:
- 	case R_RISCV_PCREL_LO12_I:
- 	case R_RISCV_PCREL_LO12_S:
diff --git a/meta/recipes-bsp/grub/files/0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch b/meta/recipes-bsp/grub/files/0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch
deleted file mode 100644
index 437e5b29b22..00000000000
--- a/meta/recipes-bsp/grub/files/0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From e372dcb0d4541ee9b9682cde088ec87a7b238ca2 Mon Sep 17 00:00:00 2001
-From: Fangrui Song via Grub-devel <grub-devel@gnu.org>
-Date: Thu, 26 Aug 2021 09:02:32 -0700
-Subject: [PATCH 2/2] configure: Check for -falign-jumps=1 beside
- -falign-loops=1
-
-The Clang does not support -falign-jumps and only recently gained support
-for -falign-loops. The -falign-jumps=1 should be tested beside
--fliang-loops=1 to avoid passing unrecognized options to the Clang:
-
-  clang-14: error: optimization flag '-falign-jumps=1' is not supported [-Werror,-Wignored-optimization-argument]
-
-The -falign-functions=1 is supported by GCC 5.1.0/Clang 3.8.0. So, just
-add the option unconditionally.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e372dcb0d4541ee9b9682cde088ec87a7b238ca2]
-Signed-off-by: Fangrui Song <maskray@google.com>
-Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
----
- configure.ac | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9a12151bd..eeb5d2211 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -798,6 +798,8 @@ fi
- 
- # Force no alignment to save space on i386.
- if test "x$target_cpu" = xi386; then
-+  TARGET_CFLAGS="$TARGET_CFLAGS -falign-functions=1"
-+
-   AC_CACHE_CHECK([whether -falign-loops works], [grub_cv_cc_falign_loop], [
-     CFLAGS="$TARGET_CFLAGS -falign-loops=1 -Werror"
-     AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
-@@ -806,7 +808,18 @@ if test "x$target_cpu" = xi386; then
-   ])
- 
-   if test "x$grub_cv_cc_falign_loop" = xyes; then
--    TARGET_CFLAGS="$TARGET_CFLAGS -falign-jumps=1 -falign-loops=1 -falign-functions=1"
-+    TARGET_CFLAGS="$TARGET_CFLAGS -falign-loops=1"
-+  fi
-+
-+  AC_CACHE_CHECK([whether -falign-jumps works], [grub_cv_cc_falign_jumps], [
-+    CFLAGS="$TARGET_CFLAGS -falign-jumps=1 -Werror"
-+    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
-+        [grub_cv_cc_falign_jumps=yes],
-+        [grub_cv_cc_falign_jumps=no])
-+  ])
-+
-+  if test "x$grub_cv_cc_falign_jumps" = xyes; then
-+    TARGET_CFLAGS="$TARGET_CFLAGS -falign-jumps=1"
-   fi
- fi
- 
--- 
-2.37.3
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch b/meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
deleted file mode 100644
index 7f7bb1acfe7..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-From e623866d9286410156e8b9d2c82d6253a1b22d08 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 6 Jul 2021 18:51:35 +1000
-Subject: [PATCH] video/readers/png: Drop greyscale support to fix heap
- out-of-bounds write
-
-A 16-bit greyscale PNG without alpha is processed in the following loop:
-
-      for (i = 0; i < (data->image_width * data->image_height);
-	   i++, d1 += 4, d2 += 2)
-	{
-	  d1[R3] = d2[1];
-	  d1[G3] = d2[1];
-	  d1[B3] = d2[1];
-	}
-
-The increment of d1 is wrong. d1 is incremented by 4 bytes per iteration,
-but there are only 3 bytes allocated for storage. This means that image
-data will overwrite somewhat-attacker-controlled parts of memory - 3 bytes
-out of every 4 following the end of the image.
-
-This has existed since greyscale support was added in 2013 in commit
-3ccf16dff98f (grub-core/video/readers/png.c: Support grayscale).
-
-Saving starfield.png as a 16-bit greyscale image without alpha in the gimp
-and attempting to load it causes grub-emu to crash - I don't think this code
-has ever worked.
-
-Delete all PNG greyscale support.
-
-Fixes: CVE-2021-3695
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-CVE: CVE-2021-3695
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e623866d9286410156e8b9d2c82d6253a1b22d08
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- grub-core/video/readers/png.c | 87 +++--------------------------------
- 1 file changed, 7 insertions(+), 80 deletions(-)
-
-diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
-index 35ae553c8..a3161e25b 100644
---- a/grub-core/video/readers/png.c
-+++ b/grub-core/video/readers/png.c
-@@ -100,7 +100,7 @@ struct grub_png_data
- 
-   unsigned image_width, image_height;
-   int bpp, is_16bit;
--  int raw_bytes, is_gray, is_alpha, is_palette;
-+  int raw_bytes, is_alpha, is_palette;
-   int row_bytes, color_bits;
-   grub_uint8_t *image_data;
- 
-@@ -296,13 +296,13 @@ grub_png_decode_image_header (struct grub_png_data *data)
-     data->bpp = 3;
-   else
-     {
--      data->is_gray = 1;
--      data->bpp = 1;
-+      return grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+			 "png: color type not supported");
-     }
- 
-   if ((color_bits != 8) && (color_bits != 16)
-       && (color_bits != 4
--	  || !(data->is_gray || data->is_palette)))
-+	  || !data->is_palette))
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
-                        "png: bit depth must be 8 or 16");
- 
-@@ -331,7 +331,7 @@ grub_png_decode_image_header (struct grub_png_data *data)
-     }
- 
- #ifndef GRUB_CPU_WORDS_BIGENDIAN
--  if (data->is_16bit || data->is_gray || data->is_palette)
-+  if (data->is_16bit || data->is_palette)
- #endif
-     {
-       data->image_data = grub_calloc (data->image_height, data->row_bytes);
-@@ -899,27 +899,8 @@ grub_png_convert_image (struct grub_png_data *data)
-       int shift;
-       int mask = (1 << data->color_bits) - 1;
-       unsigned j;
--      if (data->is_gray)
--	{
--	  /* Generic formula is
--	     (0xff * i) / ((1U << data->color_bits) - 1)
--	     but for allowed bit depth of 1, 2 and for it's
--	     equivalent to
--	     (0xff / ((1U << data->color_bits) - 1)) * i
--	     Precompute the multipliers to avoid division.
--	  */
--
--	  const grub_uint8_t multipliers[5] = { 0xff, 0xff, 0x55, 0x24, 0x11 };
--	  for (i = 0; i < (1U << data->color_bits); i++)
--	    {
--	      grub_uint8_t col = multipliers[data->color_bits] * i;
--	      palette[i][0] = col;
--	      palette[i][1] = col;
--	      palette[i][2] = col;
--	    }
--	}
--      else
--	grub_memcpy (palette, data->palette, 3 << data->color_bits);
-+
-+      grub_memcpy (palette, data->palette, 3 << data->color_bits);
-       d1c = d1;
-       d2c = d2;
-       for (j = 0; j < data->image_height; j++, d1c += data->image_width * 3,
-@@ -957,60 +938,6 @@ grub_png_convert_image (struct grub_png_data *data)
-       return;
-     }
- 
--  if (data->is_gray)
--    {
--      switch (data->bpp)
--	{
--	case 4:
--	  /* 16-bit gray with alpha.  */
--	  for (i = 0; i < (data->image_width * data->image_height);
--	       i++, d1 += 4, d2 += 4)
--	    {
--	      d1[R4] = d2[3];
--	      d1[G4] = d2[3];
--	      d1[B4] = d2[3];
--	      d1[A4] = d2[1];
--	    }
--	  break;
--	case 2:
--	  if (data->is_16bit)
--	    /* 16-bit gray without alpha.  */
--	    {
--	      for (i = 0; i < (data->image_width * data->image_height);
--		   i++, d1 += 4, d2 += 2)
--		{
--		  d1[R3] = d2[1];
--		  d1[G3] = d2[1];
--		  d1[B3] = d2[1];
--		}
--	    }
--	  else
--	    /* 8-bit gray with alpha.  */
--	    {
--	      for (i = 0; i < (data->image_width * data->image_height);
--		   i++, d1 += 4, d2 += 2)
--		{
--		  d1[R4] = d2[1];
--		  d1[G4] = d2[1];
--		  d1[B4] = d2[1];
--		  d1[A4] = d2[0];
--		}
--	    }
--	  break;
--	  /* 8-bit gray without alpha.  */
--	case 1:
--	  for (i = 0; i < (data->image_width * data->image_height);
--	       i++, d1 += 3, d2++)
--	    {
--	      d1[R3] = d2[0];
--	      d1[G3] = d2[0];
--	      d1[B3] = d2[0];
--	    }
--	  break;
--	}
--      return;
--    }
--
-     {
-   /* Only copy the upper 8 bit.  */
- #ifndef GRUB_CPU_WORDS_BIGENDIAN
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch b/meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch
deleted file mode 100644
index f06514e6657..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 210245129c932dc9e1c2748d9d35524fb95b5042 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 6 Jul 2021 23:25:07 +1000
-Subject: [PATCH] video/readers/png: Avoid heap OOB R/W inserting huff table
- items
-
-In fuzzing we observed crashes where a code would attempt to be inserted
-into a huffman table before the start, leading to a set of heap OOB reads
-and writes as table entries with negative indices were shifted around and
-the new code written in.
-
-Catch the case where we would underflow the array and bail.
-
-Fixes: CVE-2021-3696
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-CVE: CVE-2021-3696
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=210245129c932dc9e1c2748d9d35524fb95b5042
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- grub-core/video/readers/png.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
-index a3161e25b..d7ed5aa6c 100644
---- a/grub-core/video/readers/png.c
-+++ b/grub-core/video/readers/png.c
-@@ -438,6 +438,13 @@ grub_png_insert_huff_item (struct huff_table *ht, int code, int len)
-   for (i = len; i < ht->max_length; i++)
-     n += ht->maxval[i];
- 
-+  if (n > ht->num_values)
-+    {
-+      grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+		  "png: out of range inserting huffman table item");
-+      return;
-+    }
-+
-   for (i = 0; i < n; i++)
-     ht->values[ht->num_values - i] = ht->values[ht->num_values - i - 1];
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch b/meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch
deleted file mode 100644
index e9fc52df86d..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 22a3f97d39f6a10b08ad7fd1cc47c4dcd10413f6 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Wed, 7 Jul 2021 15:38:19 +1000
-Subject: [PATCH] video/readers/jpeg: Block int underflow -> wild pointer write
-
-Certain 1 px wide images caused a wild pointer write in
-grub_jpeg_ycrcb_to_rgb(). This was caused because in grub_jpeg_decode_data(),
-we have the following loop:
-
-for (; data->r1 < nr1 && (!data->dri || rst);
-     data->r1++, data->bitmap_ptr += (vb * data->image_width - hb * nc1) * 3)
-
-We did not check if vb * width >= hb * nc1.
-
-On a 64-bit platform, if that turns out to be negative, it will underflow,
-be interpreted as unsigned 64-bit, then be added to the 64-bit pointer, so
-we see data->bitmap_ptr jump, e.g.:
-
-0x6180_0000_0480 to
-0x6181_0000_0498
-     ^
-     ~--- carry has occurred and this pointer is now far away from
-          any object.
-
-On a 32-bit platform, it will decrement the pointer, creating a pointer
-that won't crash but will overwrite random data.
-
-Catch the underflow and error out.
-
-Fixes: CVE-2021-3697
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-CVE: CVE-2021-3697
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=22a3f97d39f6a10b08ad7fd1cc47c4dcd10413f6
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- grub-core/video/readers/jpeg.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
-index 579bbe8a4..09596fbf5 100644
---- a/grub-core/video/readers/jpeg.c
-+++ b/grub-core/video/readers/jpeg.c
-@@ -23,6 +23,7 @@
- #include <grub/mm.h>
- #include <grub/misc.h>
- #include <grub/bufio.h>
-+#include <grub/safemath.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -699,6 +700,7 @@ static grub_err_t
- grub_jpeg_decode_data (struct grub_jpeg_data *data)
- {
-   unsigned c1, vb, hb, nr1, nc1;
-+  unsigned stride_a, stride_b, stride;
-   int rst = data->dri;
-   grub_err_t err = GRUB_ERR_NONE;
- 
-@@ -711,8 +713,14 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
- 		       "jpeg: attempted to decode data before start of stream");
- 
-+  if (grub_mul(vb, data->image_width, &stride_a) ||
-+      grub_mul(hb, nc1, &stride_b) ||
-+      grub_sub(stride_a, stride_b, &stride))
-+    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+		       "jpeg: cannot decode image with these dimensions");
-+
-   for (; data->r1 < nr1 && (!data->dri || rst);
--       data->r1++, data->bitmap_ptr += (vb * data->image_width - hb * nc1) * 3)
-+       data->r1++, data->bitmap_ptr += stride * 3)
-     for (c1 = 0;  c1 < nc1 && (!data->dri || rst);
- 	c1++, rst--, data->bitmap_ptr += hb * 3)
-       {
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch b/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
deleted file mode 100644
index dae26fd8bb8..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 0adec29674561034771c13e446069b41ef41e4d4 Mon Sep 17 00:00:00 2001
-From: Michael Chang <mchang@suse.com>
-Date: Fri, 3 Dec 2021 16:13:28 +0800
-Subject: [PATCH] grub-mkconfig: Restore umask for the grub.cfg
-
-The commit ab2e53c8a (grub-mkconfig: Honor a symlink when generating
-configuration by grub-mkconfig) has inadvertently discarded umask for
-creating grub.cfg in the process of running grub-mkconfig. The resulting
-wrong permission (0644) would allow unprivileged users to read GRUB
-configuration file content. This presents a low confidentiality risk
-as grub.cfg may contain non-secured plain-text passwords.
-
-This patch restores the missing umask and sets the creation file mode
-to 0600 preventing unprivileged access.
-
-Fixes: CVE-2021-3981
-
-Signed-off-by: Michael Chang <mchang@suse.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-CVE: CVE-2021-3981
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0adec29674561034771c13e446069b41ef41e4d4
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- util/grub-mkconfig.in | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
-index c3ea7612e..62335d027 100644
---- a/util/grub-mkconfig.in
-+++ b/util/grub-mkconfig.in
-@@ -301,7 +301,10 @@ and /etc/grub.d/* files or please file a bug report with
-     exit 1
-   else
-     # none of the children aborted with error, install the new grub.cfg
-+    oldumask=$(umask)
-+    umask 077
-     cat ${grub_cfg}.new > ${grub_cfg}
-+    umask $oldumask
-     rm -f ${grub_cfg}.new
-   fi
- fi
--- 
-2.31.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-2601.patch b/meta/recipes-bsp/grub/files/CVE-2022-2601.patch
deleted file mode 100644
index 727c509694c..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2022-2601.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From e8060722acf0bcca037982d7fb29472363ccdfd4 Mon Sep 17 00:00:00 2001
-From: Zhang Boyang <zhangboyang.id@gmail.com>
-Date: Fri, 5 Aug 2022 01:58:27 +0800
-Subject: [PATCH] font: Fix several integer overflows in
- grub_font_construct_glyph()
-
-This patch fixes several integer overflows in grub_font_construct_glyph().
-Glyphs of invalid size, zero or leading to an overflow, are rejected.
-The inconsistency between "glyph" and "max_glyph_size" when grub_malloc()
-returns NULL is fixed too.
-
-Fixes: CVE-2022-2601
-
-Reported-by: Zhang Boyang <zhangboyang.id@gmail.com>
-Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport from
-[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=768e1ef2fc159f6e14e7246e4be09363708ac39e]
-CVE: CVE-2022-2601
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
-
----
- grub-core/font/font.c | 29 +++++++++++++++++------------
- 1 file changed, 17 insertions(+), 12 deletions(-)
-
-diff --git a/grub-core/font/font.c b/grub-core/font/font.c
-index 876b5b6..0ff5525 100644
---- a/grub-core/font/font.c
-+++ b/grub-core/font/font.c
-@@ -1515,6 +1515,7 @@ grub_font_construct_glyph (grub_font_t hinted_font,
-   struct grub_video_signed_rect bounds;
-   static struct grub_font_glyph *glyph = 0;
-   static grub_size_t max_glyph_size = 0;
-+  grub_size_t cur_glyph_size;
- 
-   ensure_comb_space (glyph_id);
- 
-@@ -1531,29 +1532,33 @@ grub_font_construct_glyph (grub_font_t hinted_font,
-   if (!glyph_id->ncomb && !glyph_id->attributes)
-     return main_glyph;
- 
--  if (max_glyph_size < sizeof (*glyph) + (bounds.width * bounds.height + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT)
-+  if (grub_video_bitmap_calc_1bpp_bufsz (bounds.width, bounds.height, &cur_glyph_size) ||
-+      grub_add (sizeof (*glyph), cur_glyph_size, &cur_glyph_size))
-+    return main_glyph;
-+
-+  if (max_glyph_size < cur_glyph_size)
-     {
-       grub_free (glyph);
--      max_glyph_size = (sizeof (*glyph) + (bounds.width * bounds.height + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT) * 2;
--      if (max_glyph_size < 8)
--	max_glyph_size = 8;
--      glyph = grub_malloc (max_glyph_size);
-+      if (grub_mul (cur_glyph_size, 2, &max_glyph_size))
-+	max_glyph_size = 0;
-+      glyph = max_glyph_size > 0 ? grub_malloc (max_glyph_size) : NULL;
-     }
-   if (!glyph)
-     {
-+      max_glyph_size = 0;
-       grub_errno = GRUB_ERR_NONE;
-       return main_glyph;
-     }
- 
--  grub_memset (glyph, 0, sizeof (*glyph)
--	       + (bounds.width * bounds.height
--		  + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT);
-+  grub_memset (glyph, 0, cur_glyph_size);
- 
-   glyph->font = main_glyph->font;
--  glyph->width = bounds.width;
--  glyph->height = bounds.height;
--  glyph->offset_x = bounds.x;
--  glyph->offset_y = bounds.y;
-+  if (bounds.width == 0 || bounds.height == 0 ||
-+      grub_cast (bounds.width, &glyph->width) ||
-+      grub_cast (bounds.height, &glyph->height) ||
-+      grub_cast (bounds.x, &glyph->offset_x) ||
-+      grub_cast (bounds.y, &glyph->offset_y))
-+    return main_glyph;
- 
-   if (glyph_id->attributes & GRUB_UNICODE_GLYPH_ATTRIBUTE_MIRROR)
-     grub_font_blit_glyph_mirror (glyph, main_glyph,
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch b/meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch
deleted file mode 100644
index 8bf9090f944..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 3e4817538de828319ba6d59ced2fbb9b5ca13287 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Mon, 20 Dec 2021 19:41:21 +1100
-Subject: [PATCH] net/ip: Do IP fragment maths safely
-
-We can receive packets with invalid IP fragmentation information. This
-can lead to rsm->total_len underflowing and becoming very large.
-
-Then, in grub_netbuff_alloc(), we add to this very large number, which can
-cause it to overflow and wrap back around to a small positive number.
-The allocation then succeeds, but the resulting buffer is too small and
-subsequent operations can write past the end of the buffer.
-
-Catch the underflow here.
-
-Fixes: CVE-2022-28733
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-CVE: CVE-2022-28733
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3e4817538de828319ba6d59ced2fbb9b5ca13287
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
-
----
- grub-core/net/ip.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/grub-core/net/ip.c b/grub-core/net/ip.c
-index e3d62e97f..3c3d0be0e 100644
---- a/grub-core/net/ip.c
-+++ b/grub-core/net/ip.c
-@@ -25,6 +25,7 @@
- #include <grub/net/netbuff.h>
- #include <grub/mm.h>
- #include <grub/priority_queue.h>
-+#include <grub/safemath.h>
- #include <grub/time.h>
- 
- struct iphdr {
-@@ -512,7 +513,14 @@ grub_net_recv_ip4_packets (struct grub_net_buff *nb,
-     {
-       rsm->total_len = (8 * (grub_be_to_cpu16 (iph->frags) & OFFSET_MASK)
- 			+ (nb->tail - nb->data));
--      rsm->total_len -= ((iph->verhdrlen & 0xf) * sizeof (grub_uint32_t));
-+
-+      if (grub_sub (rsm->total_len, (iph->verhdrlen & 0xf) * sizeof (grub_uint32_t),
-+		    &rsm->total_len))
-+	{
-+	  grub_dprintf ("net", "IP reassembly size underflow\n");
-+	  return GRUB_ERR_NONE;
-+	}
-+
-       rsm->asm_netbuff = grub_netbuff_alloc (rsm->total_len);
-       if (!rsm->asm_netbuff)
- 	{
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch b/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch
deleted file mode 100644
index f31167d315c..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From b26b4c08e7119281ff30d0fb4a6169bd2afa8fe4 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 8 Mar 2022 19:04:40 +1100
-Subject: [PATCH] net/http: Error out on headers with LF without CR
-
-In a similar vein to the previous patch, parse_line() would write
-a NUL byte past the end of the buffer if there was an HTTP header
-with a LF rather than a CRLF.
-
-RFC-2616 says:
-
-  Many HTTP/1.1 header field values consist of words separated by LWS
-  or special characters. These special characters MUST be in a quoted
-  string to be used within a parameter value (as defined in section 3.6).
-
-We don't support quoted sections or continuation lines, etc.
-
-If we see an LF that's not part of a CRLF, bail out.
-
-Fixes: CVE-2022-28734
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-CVE: CVE-2022-28734
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=b26b4c08e7119281ff30d0fb4a6169bd2afa8fe4
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- grub-core/net/http.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/grub-core/net/http.c b/grub-core/net/http.c
-index 33a0a28c4..9291a13e2 100644
---- a/grub-core/net/http.c
-+++ b/grub-core/net/http.c
-@@ -68,7 +68,15 @@ parse_line (grub_file_t file, http_data_t data, char *ptr, grub_size_t len)
-   char *end = ptr + len;
-   while (end > ptr && *(end - 1) == '\r')
-     end--;
-+
-+  /* LF without CR. */
-+  if (end == ptr + len)
-+    {
-+      data->errmsg = grub_strdup (_("invalid HTTP header - LF without CR"));
-+      return GRUB_ERR_NONE;
-+    }
-   *end = 0;
-+
-   /* Trailing CRLF.  */
-   if (data->in_chunk_len == 1)
-     {
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch b/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch
deleted file mode 100644
index e0ca1eec446..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ec6bfd3237394c1c7dbf2fd73417173318d22f4b Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 8 Mar 2022 18:17:03 +1100
-Subject: [PATCH] net/http: Fix OOB write for split http headers
-
-GRUB has special code for handling an http header that is split
-across two packets.
-
-The code tracks the end of line by looking for a "\n" byte. The
-code for split headers has always advanced the pointer just past the
-end of the line, whereas the code that handles unsplit headers does
-not advance the pointer. This extra advance causes the length to be
-one greater, which breaks an assumption in parse_line(), leading to
-it writing a NUL byte one byte past the end of the buffer where we
-reconstruct the line from the two packets.
-
-It's conceivable that an attacker controlled set of packets could
-cause this to zero out the first byte of the "next" pointer of the
-grub_mm_region structure following the current_line buffer.
-
-Do not advance the pointer in the split header case.
-
-Fixes: CVE-2022-28734
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-CVE: CVE-2022-28734
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=ec6bfd3237394c1c7dbf2fd73417173318d22f4b
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- grub-core/net/http.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/grub-core/net/http.c b/grub-core/net/http.c
-index f8d7bf0cd..33a0a28c4 100644
---- a/grub-core/net/http.c
-+++ b/grub-core/net/http.c
-@@ -190,9 +190,7 @@ http_receive (grub_net_tcp_socket_t sock __attribute__ ((unused)),
- 	  int have_line = 1;
- 	  char *t;
- 	  ptr = grub_memchr (nb->data, '\n', nb->tail - nb->data);
--	  if (ptr)
--	    ptr++;
--	  else
-+	  if (ptr == NULL)
- 	    {
- 	      have_line = 0;
- 	      ptr = (char *) nb->tail;
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch b/meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
deleted file mode 100644
index 7a59f10bfbb..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 6fe755c5c07bb386fda58306bfd19e4a1c974c53 Mon Sep 17 00:00:00 2001
-From: Julian Andres Klode <julian.klode@canonical.com>
-Date: Thu, 2 Dec 2021 15:03:53 +0100
-Subject: [PATCH] kern/efi/sb: Reject non-kernel files in the shim_lock
- verifier
-
-We must not allow other verifiers to pass things like the GRUB modules.
-Instead of maintaining a blocklist, maintain an allowlist of things
-that we do not care about.
-
-This allowlist really should be made reusable, and shared by the
-lockdown verifier, but this is the minimal patch addressing
-security concerns where the TPM verifier was able to mark modules
-as verified (or the OpenPGP verifier for that matter), when it
-should not do so on shim-powered secure boot systems.
-
-Fixes: CVE-2022-28735
-
-Signed-off-by: Julian Andres Klode <julian.klode@canonical.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-CVE:CVE-2022-28735
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=6fe755c5c07bb386fda58306bfd19e4a1c974c53
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- grub-core/kern/efi/sb.c | 39 ++++++++++++++++++++++++++++++++++++---
- include/grub/verify.h   |  1 +
- 2 files changed, 37 insertions(+), 3 deletions(-)
-
-diff --git a/grub-core/kern/efi/sb.c b/grub-core/kern/efi/sb.c
-index c52ec6226..89c4bb3fd 100644
---- a/grub-core/kern/efi/sb.c
-+++ b/grub-core/kern/efi/sb.c
-@@ -119,10 +119,11 @@ shim_lock_verifier_init (grub_file_t io __attribute__ ((unused)),
- 			 void **context __attribute__ ((unused)),
- 			 enum grub_verify_flags *flags)
- {
--  *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
-+  *flags = GRUB_VERIFY_FLAGS_NONE;
- 
-   switch (type & GRUB_FILE_TYPE_MASK)
-     {
-+    /* Files we check. */
-     case GRUB_FILE_TYPE_LINUX_KERNEL:
-     case GRUB_FILE_TYPE_MULTIBOOT_KERNEL:
-     case GRUB_FILE_TYPE_BSD_KERNEL:
-@@ -130,11 +131,43 @@ shim_lock_verifier_init (grub_file_t io __attribute__ ((unused)),
-     case GRUB_FILE_TYPE_PLAN9_KERNEL:
-     case GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE:
-       *flags = GRUB_VERIFY_FLAGS_SINGLE_CHUNK;
-+      return GRUB_ERR_NONE;
- 
--      /* Fall through. */
-+    /* Files that do not affect secureboot state. */
-+    case GRUB_FILE_TYPE_NONE:
-+    case GRUB_FILE_TYPE_LOOPBACK:
-+    case GRUB_FILE_TYPE_LINUX_INITRD:
-+    case GRUB_FILE_TYPE_OPENBSD_RAMDISK:
-+    case GRUB_FILE_TYPE_XNU_RAMDISK:
-+    case GRUB_FILE_TYPE_SIGNATURE:
-+    case GRUB_FILE_TYPE_PUBLIC_KEY:
-+    case GRUB_FILE_TYPE_PUBLIC_KEY_TRUST:
-+    case GRUB_FILE_TYPE_PRINT_BLOCKLIST:
-+    case GRUB_FILE_TYPE_TESTLOAD:
-+    case GRUB_FILE_TYPE_GET_SIZE:
-+    case GRUB_FILE_TYPE_FONT:
-+    case GRUB_FILE_TYPE_ZFS_ENCRYPTION_KEY:
-+    case GRUB_FILE_TYPE_CAT:
-+    case GRUB_FILE_TYPE_HEXCAT:
-+    case GRUB_FILE_TYPE_CMP:
-+    case GRUB_FILE_TYPE_HASHLIST:
-+    case GRUB_FILE_TYPE_TO_HASH:
-+    case GRUB_FILE_TYPE_KEYBOARD_LAYOUT:
-+    case GRUB_FILE_TYPE_PIXMAP:
-+    case GRUB_FILE_TYPE_GRUB_MODULE_LIST:
-+    case GRUB_FILE_TYPE_CONFIG:
-+    case GRUB_FILE_TYPE_THEME:
-+    case GRUB_FILE_TYPE_GETTEXT_CATALOG:
-+    case GRUB_FILE_TYPE_FS_SEARCH:
-+    case GRUB_FILE_TYPE_LOADENV:
-+    case GRUB_FILE_TYPE_SAVEENV:
-+    case GRUB_FILE_TYPE_VERIFY_SIGNATURE:
-+      *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
-+      return GRUB_ERR_NONE;
- 
-+    /* Other files. */
-     default:
--      return GRUB_ERR_NONE;
-+      return grub_error (GRUB_ERR_ACCESS_DENIED, N_("prohibited by secure boot policy"));
-     }
- }
- 
-diff --git a/include/grub/verify.h b/include/grub/verify.h
-index cd129c398..672ae1692 100644
---- a/include/grub/verify.h
-+++ b/include/grub/verify.h
-@@ -24,6 +24,7 @@
- 
- enum grub_verify_flags
-   {
-+    GRUB_VERIFY_FLAGS_NONE		= 0,
-     GRUB_VERIFY_FLAGS_SKIP_VERIFICATION	= 1,
-     GRUB_VERIFY_FLAGS_SINGLE_CHUNK	= 2,
-     /* Defer verification to another authority. */
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch b/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
deleted file mode 100644
index 5741e53f42b..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 04c86e0bb7b58fc2f913f798cdb18934933e532d Mon Sep 17 00:00:00 2001
-From: Chris Coulson <chris.coulson@canonical.com>
-Date: Tue, 5 Apr 2022 11:48:58 +0100
-Subject: [PATCH] loader/efi/chainloader: Use grub_loader_set_ex()
-
-This ports the EFI chainloader to use grub_loader_set_ex() in order to fix
-a use-after-free bug that occurs when grub_cmd_chainloader() is executed
-more than once before a boot attempt is performed.
-
-Fixes: CVE-2022-28736
-
-Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-CVE: CVE-2022-28736
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=04c86e0bb7b58fc2f913f798cdb18934933e532d
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- grub-core/loader/efi/chainloader.c | 16 +++++++---------
- 1 file changed, 7 insertions(+), 9 deletions(-)
-
-diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
-index d1602c89b..7557eb269 100644
---- a/grub-core/loader/efi/chainloader.c
-+++ b/grub-core/loader/efi/chainloader.c
-@@ -44,11 +44,10 @@ GRUB_MOD_LICENSE ("GPLv3+");
- 
- static grub_dl_t my_mod;
- 
--static grub_efi_handle_t image_handle;
--
- static grub_err_t
--grub_chainloader_unload (void)
-+grub_chainloader_unload (void *context)
- {
-+  grub_efi_handle_t image_handle = (grub_efi_handle_t) context;
-   grub_efi_loaded_image_t *loaded_image;
-   grub_efi_boot_services_t *b;
- 
-@@ -64,8 +63,9 @@ grub_chainloader_unload (void)
- }
- 
- static grub_err_t
--grub_chainloader_boot (void)
-+grub_chainloader_boot (void *context)
- {
-+  grub_efi_handle_t image_handle = (grub_efi_handle_t) context;
-   grub_efi_boot_services_t *b;
-   grub_efi_status_t status;
-   grub_efi_uintn_t exit_data_size;
-@@ -225,6 +225,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-   grub_efi_physical_address_t address = 0;
-   grub_efi_uintn_t pages = 0;
-   grub_efi_char16_t *cmdline = NULL;
-+  grub_efi_handle_t image_handle = NULL;
- 
-   if (argc == 0)
-     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
-@@ -405,7 +406,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-   efi_call_2 (b->free_pages, address, pages);
-   grub_free (file_path);
- 
--  grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
-+  grub_loader_set_ex (grub_chainloader_boot, grub_chainloader_unload, image_handle, 0);
-   return 0;
- 
-  fail:
-@@ -423,10 +424,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-     efi_call_2 (b->free_pages, address, pages);
- 
-   if (image_handle != NULL)
--    {
--      efi_call_1 (b->unload_image, image_handle);
--      image_handle = NULL;
--    }
-+    efi_call_1 (b->unload_image, image_handle);
- 
-   grub_dl_unref (my_mod);
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-3775.patch b/meta/recipes-bsp/grub/files/CVE-2022-3775.patch
deleted file mode 100644
index 853efd0486b..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2022-3775.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From fdbe7209152ad6f09a1166f64f162017f2145ba3 Mon Sep 17 00:00:00 2001
-From: Zhang Boyang <zhangboyang.id@gmail.com>
-Date: Mon, 24 Oct 2022 08:05:35 +0800
-Subject: [PATCH] font: Fix an integer underflow in blit_comb()
-
-The expression (ctx.bounds.height - combining_glyphs[i]->height) / 2 may
-evaluate to a very big invalid value even if both ctx.bounds.height and
-combining_glyphs[i]->height are small integers. For example, if
-ctx.bounds.height is 10 and combining_glyphs[i]->height is 12, this
-expression evaluates to 2147483647 (expected -1). This is because
-coordinates are allowed to be negative but ctx.bounds.height is an
-unsigned int. So, the subtraction operates on unsigned ints and
-underflows to a very big value. The division makes things even worse.
-The quotient is still an invalid value even if converted back to int.
-
-This patch fixes the problem by casting ctx.bounds.height to int. As
-a result the subtraction will operate on int and grub_uint16_t which
-will be promoted to an int. So, the underflow will no longer happen. Other
-uses of ctx.bounds.height (and ctx.bounds.width) are also casted to int,
-to ensure coordinates are always calculated on signed integers.
-
-Fixes: CVE-2022-3775
-
-Reported-by: Daniel Axtens <dja@axtens.net>
-Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport from
-[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=992c06191babc1e109caf40d6a07ec6fdef427af]
-CVE: CVE-2022-3775
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
-
----
- grub-core/font/font.c | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/grub-core/font/font.c b/grub-core/font/font.c
-index 0ff5525..7b1cbde 100644
---- a/grub-core/font/font.c
-+++ b/grub-core/font/font.c
-@@ -1206,12 +1206,12 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
-   ctx.bounds.height = main_glyph->height;
- 
-   above_rightx = main_glyph->offset_x + main_glyph->width;
--  above_righty = ctx.bounds.y + ctx.bounds.height;
-+  above_righty = ctx.bounds.y + (int) ctx.bounds.height;
- 
-   above_leftx = main_glyph->offset_x;
--  above_lefty = ctx.bounds.y + ctx.bounds.height;
-+  above_lefty = ctx.bounds.y + (int) ctx.bounds.height;
- 
--  below_rightx = ctx.bounds.x + ctx.bounds.width;
-+  below_rightx = ctx.bounds.x + (int) ctx.bounds.width;
-   below_righty = ctx.bounds.y;
- 
-   comb = grub_unicode_get_comb (glyph_id);
-@@ -1224,7 +1224,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
- 
-       if (!combining_glyphs[i])
- 	continue;
--      targetx = (ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
-+      targetx = ((int) ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
-       /* CGJ is to avoid diacritics reordering. */
-       if (comb[i].code
- 	  == GRUB_UNICODE_COMBINING_GRAPHEME_JOINER)
-@@ -1234,8 +1234,8 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
- 	case GRUB_UNICODE_COMB_OVERLAY:
- 	  do_blit (combining_glyphs[i],
- 		   targetx,
--		   (ctx.bounds.height - combining_glyphs[i]->height) / 2
--		   - (ctx.bounds.height + ctx.bounds.y), &ctx);
-+		   ((int) ctx.bounds.height - combining_glyphs[i]->height) / 2
-+		   - ((int) ctx.bounds.height + ctx.bounds.y), &ctx);
- 	  if (min_devwidth < combining_glyphs[i]->width)
- 	    min_devwidth = combining_glyphs[i]->width;
- 	  break;
-@@ -1308,7 +1308,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
- 	  /* Fallthrough.  */
- 	case GRUB_UNICODE_STACK_ATTACHED_ABOVE:
- 	  do_blit (combining_glyphs[i], targetx,
--		   -(ctx.bounds.height + ctx.bounds.y + space
-+		   -((int) ctx.bounds.height + ctx.bounds.y + space
- 		     + combining_glyphs[i]->height), &ctx);
- 	  if (min_devwidth < combining_glyphs[i]->width)
- 	    min_devwidth = combining_glyphs[i]->width;
-@@ -1316,7 +1316,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
- 
- 	case GRUB_UNICODE_COMB_HEBREW_DAGESH:
- 	  do_blit (combining_glyphs[i], targetx,
--		   -(ctx.bounds.height / 2 + ctx.bounds.y
-+		   -((int) ctx.bounds.height / 2 + ctx.bounds.y
- 		     + combining_glyphs[i]->height / 2), &ctx);
- 	  if (min_devwidth < combining_glyphs[i]->width)
- 	    min_devwidth = combining_glyphs[i]->width;
diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4692.patch b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
deleted file mode 100644
index 305fcc93d89..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 43651027d24e62a7a463254165e1e46e42aecdea Mon Sep 17 00:00:00 2001
-From: Maxim Suhanov <dfirblog@gmail.com>
-Date: Mon, 28 Aug 2023 16:31:57 +0300
-Subject: [PATCH] fs/ntfs: Fix an OOB write when parsing the $ATTRIBUTE_LIST attribute
- for the $MFT file
-
-When parsing an extremely fragmented $MFT file, i.e., the file described
-using the $ATTRIBUTE_LIST attribute, current NTFS code will reuse a buffer
-containing bytes read from the underlying drive to store sector numbers,
-which are consumed later to read data from these sectors into another buffer.
-
-These sectors numbers, two 32-bit integers, are always stored at predefined
-offsets, 0x10 and 0x14, relative to first byte of the selected entry within
-the $ATTRIBUTE_LIST attribute. Usually, this won't cause any problem.
-
-However, when parsing a specially-crafted file system image, this may cause
-the NTFS code to write these integers beyond the buffer boundary, likely
-causing the GRUB memory allocator to misbehave or fail. These integers contain
-values which are controlled by on-disk structures of the NTFS file system.
-
-Such modification and resulting misbehavior may touch a memory range not
-assigned to the GRUB and owned by firmware or another EFI application/driver.
-
-This fix introduces checks to ensure that these sector numbers are never
-written beyond the boundary.
-
-Fixes: CVE-2023-4692
-
-Upstream-Status: Backport from 
-[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=43651027d24e62a7a463254165e1e46e42aecdea]
-CVE: CVE-2023-4692
-
-Reported-by: Maxim Suhanov <dfirblog@gmail.com>
-Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- grub-core/fs/ntfs.c | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
-index bbdbe24..c3c4db1 100644
---- a/grub-core/fs/ntfs.c
-+++ b/grub-core/fs/ntfs.c
-@@ -184,7 +184,7 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
-     }
-   if (at->attr_end)
-     {
--      grub_uint8_t *pa;
-+      grub_uint8_t *pa, *pa_end;
- 
-       at->emft_buf = grub_malloc (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
-       if (at->emft_buf == NULL)
-@@ -209,11 +209,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
- 	    }
- 	  at->attr_nxt = at->edat_buf;
- 	  at->attr_end = at->edat_buf + u32at (pa, 0x30);
-+	  pa_end = at->edat_buf + n;
- 	}
-       else
- 	{
- 	  at->attr_nxt = at->attr_end + u16at (pa, 0x14);
- 	  at->attr_end = at->attr_end + u32at (pa, 4);
-+	  pa_end = at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
- 	}
-       at->flags |= GRUB_NTFS_AF_ALST;
-       while (at->attr_nxt < at->attr_end)
-@@ -230,6 +232,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
- 	  at->flags |= GRUB_NTFS_AF_GPOS;
- 	  at->attr_cur = at->attr_nxt;
- 	  pa = at->attr_cur;
-+
-+	  if ((pa >= pa_end) || (pa_end - pa < 0x18))
-+	    {
-+	      grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
-+	      return NULL;
-+	    }
-+
- 	  grub_set_unaligned32 ((char *) pa + 0x10,
- 				grub_cpu_to_le32 (at->mft->data->mft_start));
- 	  grub_set_unaligned32 ((char *) pa + 0x14,
-@@ -240,6 +249,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
- 	    {
- 	      if (*pa != attr)
- 		break;
-+
-+              if ((pa >= pa_end) || (pa_end - pa < 0x18))
-+                {
-+	          grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
-+	          return NULL;
-+	        }
-+
- 	      if (read_attr
- 		  (at, pa + 0x10,
- 		   u32at (pa, 0x10) * (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR),
--- 
-cgit v1.1
-
diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4693.patch b/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
deleted file mode 100644
index 420fe92ac38..00000000000
--- a/meta/recipes-bsp/grub/files/CVE-2023-4693.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 0ed2458cc4eff6d9a9199527e2a0b6d445802f94 Mon Sep 17 00:00:00 2001
-From: Maxim Suhanov <dfirblog@...>
-Date: Mon, 28 Aug 2023 16:32:33 +0300
-Subject: fs/ntfs: Fix an OOB read when reading data from the resident $DATA
- attribute
-
-When reading a file containing resident data, i.e., the file data is stored in
-the $DATA attribute within the NTFS file record, not in external clusters,
-there are no checks that this resident data actually fits the corresponding
-file record segment.
-
-When parsing a specially-crafted file system image, the current NTFS code will
-read the file data from an arbitrary, attacker-chosen memory offset and of
-arbitrary, attacker-chosen length.
-
-This allows an attacker to display arbitrary chunks of memory, which could
-contain sensitive information like password hashes or even plain-text,
-obfuscated passwords from BS EFI variables.
-
-This fix implements a check to ensure that resident data is read from the
-corresponding file record segment only.
-
-Fixes: CVE-2023-4693
-
-Upstream-Status: Backport from 
-[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0ed2458cc4eff6d9a9199527e2a0b6d445802f94]
-CVE: CVE-2023-4693
-
-Reported-by: Maxim Suhanov <dfirblog@...>
-Signed-off-by: Maxim Suhanov <dfirblog@...>
-Reviewed-by: Daniel Kiper <daniel.kiper@...>
-Signed-off-by: Xiangyu Chen <xiangyu.chen@...>
----
- grub-core/fs/ntfs.c | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
-index c3c4db1..a68e173 100644
---- a/grub-core/fs/ntfs.c
-+++ b/grub-core/fs/ntfs.c
-@@ -401,7 +401,18 @@ read_data (struct grub_ntfs_attr *at, grub_uint8_t *pa, grub_uint8_t *dest,
-     {
-       if (ofs + len > u32at (pa, 0x10))
- 	return grub_error (GRUB_ERR_BAD_FS, "read out of range");
--      grub_memcpy (dest, pa + u32at (pa, 0x14) + ofs, len);
-+
-+      if (u32at (pa, 0x10) > (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR))
-+	return grub_error (GRUB_ERR_BAD_FS, "resident attribute too large");
-+
-+      if (pa >= at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR))
-+	return grub_error (GRUB_ERR_BAD_FS, "resident attribute out of range");
-+
-+      if (u16at (pa, 0x14) + u32at (pa, 0x10) >
-+	  (grub_addr_t) at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR) - (grub_addr_t) pa)
-+	return grub_error (GRUB_ERR_BAD_FS, "resident attribute out of range");
-+
-+      grub_memcpy (dest, pa + u16at (pa, 0x14) + ofs, len);
-       return 0;
-     }
- 
--- 
-cgit v1.1
-
diff --git a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
index 1323a54a593..f8dfda90abb 100644
--- a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
+++ b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
@@ -1,4 +1,4 @@
-From 8790aa8bea736f52341a0430ff3e317d3be0f99b Mon Sep 17 00:00:00 2001
+From 14c1d0459fb3561e627d3a5f6e91a0d2f7b4aa45 Mon Sep 17 00:00:00 2001
 From: Naveen Saini <naveen.kumar.saini@intel.com>
 Date: Mon, 15 Mar 2021 14:44:15 +0800
 Subject: [PATCH] autogen.sh: exclude .pc from po/POTFILES.in
@@ -14,15 +14,16 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+
 ---
  autogen.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 31b0ced7e..c63ae766c 100755
+index 195daa5..773b7b4 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -13,7 +13,7 @@ fi
+@@ -26,7 +26,7 @@ fi
  export LC_COLLATE=C
  unset LC_ALL
  
@@ -31,6 +32,3 @@ index 31b0ced7e..c63ae766c 100755
  find util -iname '*.in' ! -name Makefile.in  |sort > po/POTFILES-shell.in
  
  echo "Importing unicode..."
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch b/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
deleted file mode 100644
index a2c0530f04c..00000000000
--- a/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
+++ /dev/null
@@ -1,168 +0,0 @@
-From 14ceb3b3ff6db664649138442b6562c114dcf56e Mon Sep 17 00:00:00 2001
-From: Chris Coulson <chris.coulson@canonical.com>
-Date: Tue, 5 Apr 2022 10:58:28 +0100
-Subject: [PATCH] commands/boot: Add API to pass context to loader
-
-Loaders rely on global variables for saving context which is consumed
-in the boot hook and freed in the unload hook. In the case where a loader
-command is executed twice, calling grub_loader_set() a second time executes
-the unload hook, but in some cases this runs when the loader's global
-context has already been updated, resulting in the updated context being
-freed and potential use-after-free bugs when the boot hook is subsequently
-called.
-
-This adds a new API, grub_loader_set_ex(), which allows a loader to specify
-context that is passed to its boot and unload hooks. This is an alternative
-to requiring that loaders call grub_loader_unset() before mutating their
-global context.
-
-Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=14ceb3b3ff6db664649138442b6562c114dcf56e
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- grub-core/commands/boot.c | 66 ++++++++++++++++++++++++++++++++++-----
- include/grub/loader.h     |  5 +++
- 2 files changed, 63 insertions(+), 8 deletions(-)
-
-diff --git a/grub-core/commands/boot.c b/grub-core/commands/boot.c
-index bbca81e94..61514788e 100644
---- a/grub-core/commands/boot.c
-+++ b/grub-core/commands/boot.c
-@@ -27,10 +27,20 @@
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
--static grub_err_t (*grub_loader_boot_func) (void);
--static grub_err_t (*grub_loader_unload_func) (void);
-+static grub_err_t (*grub_loader_boot_func) (void *context);
-+static grub_err_t (*grub_loader_unload_func) (void *context);
-+static void *grub_loader_context;
- static int grub_loader_flags;
- 
-+struct grub_simple_loader_hooks
-+{
-+  grub_err_t (*boot) (void);
-+  grub_err_t (*unload) (void);
-+};
-+
-+/* Don't heap allocate this to avoid making grub_loader_set() fallible. */
-+static struct grub_simple_loader_hooks simple_loader_hooks;
-+
- struct grub_preboot
- {
-   grub_err_t (*preboot_func) (int);
-@@ -44,6 +54,29 @@ static int grub_loader_loaded;
- static struct grub_preboot *preboots_head = 0,
-   *preboots_tail = 0;
- 
-+static grub_err_t
-+grub_simple_boot_hook (void *context)
-+{
-+  struct grub_simple_loader_hooks *hooks;
-+
-+  hooks = (struct grub_simple_loader_hooks *) context;
-+  return hooks->boot ();
-+}
-+
-+static grub_err_t
-+grub_simple_unload_hook (void *context)
-+{
-+  struct grub_simple_loader_hooks *hooks;
-+  grub_err_t ret;
-+
-+  hooks = (struct grub_simple_loader_hooks *) context;
-+
-+  ret = hooks->unload ();
-+  grub_memset (hooks, 0, sizeof (*hooks));
-+
-+  return ret;
-+}
-+
- int
- grub_loader_is_loaded (void)
- {
-@@ -110,28 +143,45 @@ grub_loader_unregister_preboot_hook (struct grub_preboot *hnd)
- }
- 
- void
--grub_loader_set (grub_err_t (*boot) (void),
--		 grub_err_t (*unload) (void),
--		 int flags)
-+grub_loader_set_ex (grub_err_t (*boot) (void *context),
-+		    grub_err_t (*unload) (void *context),
-+		    void *context,
-+		    int flags)
- {
-   if (grub_loader_loaded && grub_loader_unload_func)
--    grub_loader_unload_func ();
-+    grub_loader_unload_func (grub_loader_context);
- 
-   grub_loader_boot_func = boot;
-   grub_loader_unload_func = unload;
-+  grub_loader_context = context;
-   grub_loader_flags = flags;
- 
-   grub_loader_loaded = 1;
- }
- 
-+void
-+grub_loader_set (grub_err_t (*boot) (void),
-+		 grub_err_t (*unload) (void),
-+		 int flags)
-+{
-+  grub_loader_set_ex (grub_simple_boot_hook,
-+		      grub_simple_unload_hook,
-+		      &simple_loader_hooks,
-+		      flags);
-+
-+  simple_loader_hooks.boot = boot;
-+  simple_loader_hooks.unload = unload;
-+}
-+
- void
- grub_loader_unset(void)
- {
-   if (grub_loader_loaded && grub_loader_unload_func)
--    grub_loader_unload_func ();
-+    grub_loader_unload_func (grub_loader_context);
- 
-   grub_loader_boot_func = 0;
-   grub_loader_unload_func = 0;
-+  grub_loader_context = 0;
- 
-   grub_loader_loaded = 0;
- }
-@@ -158,7 +208,7 @@ grub_loader_boot (void)
- 	  return err;
- 	}
-     }
--  err = (grub_loader_boot_func) ();
-+  err = (grub_loader_boot_func) (grub_loader_context);
- 
-   for (cur = preboots_tail; cur; cur = cur->prev)
-     if (! err)
-diff --git a/include/grub/loader.h b/include/grub/loader.h
-index b20864282..97f231054 100644
---- a/include/grub/loader.h
-+++ b/include/grub/loader.h
-@@ -40,6 +40,11 @@ void EXPORT_FUNC (grub_loader_set) (grub_err_t (*boot) (void),
- 				    grub_err_t (*unload) (void),
- 				    int flags);
- 
-+void EXPORT_FUNC (grub_loader_set_ex) (grub_err_t (*boot) (void *context),
-+				       grub_err_t (*unload) (void *context),
-+				       void *context,
-+				       int flags);
-+
- /* Unset current loader, if any.  */
- void EXPORT_FUNC (grub_loader_unset) (void);
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
deleted file mode 100644
index 852b95a856c..00000000000
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From b6f9b3f6fa782807c4a7ec16ee8ef868cdfbf468 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 15 Mar 2021 14:56:18 +0800
-Subject: [PATCH] The output in moddep.lst generated from syminfo.lst using
- genmoddep.awk is not deterministic since the order of the dependencies on
- each line can vary depending on how awk sorts the values in the array.
-
-Be deterministic in the output by sorting the dependencies on each line.
-
-Also, the output of the SOURCES lines in grub-core/Makefile.core.am, generated
-from grub-core/Makefile.core.def with gentpl.py is not deterministic due to
-missing sorting of the list used to generate it. Add such a sort.
-
-Also ensure the generated unidata.c file is deterministic by sorting the
-keys of the dict.
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/grub-devel/2023-06/index.html]
-Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- gentpl.py               | 1 +
- grub-core/genmoddep.awk | 4 +++-
- util/import_unicode.py  | 2 +-
- 3 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/gentpl.py b/gentpl.py
-index c86550d4f..589285192 100644
---- a/gentpl.py
-+++ b/gentpl.py
-@@ -568,6 +568,7 @@ def foreach_platform_value(defn, platform, suffix, closure):
-     for group in RMAP[platform]:
-         for value in defn.find_all(group + suffix):
-             r.append(closure(value))
-+    r.sort()
-     return ''.join(r)
- 
- def platform_conditional(platform, closure):
-diff --git a/grub-core/genmoddep.awk b/grub-core/genmoddep.awk
-index 04c2863e5..247436392 100644
---- a/grub-core/genmoddep.awk
-+++ b/grub-core/genmoddep.awk
-@@ -59,7 +59,9 @@ END {
-     }
-     modlist = ""
-     depcount[mod] = 0
--    for (depmod in uniqmods) {
-+    n = asorti(uniqmods, w)
-+    for (i = 1; i <= n; i++) {
-+      depmod = w[i]
-       modlist = modlist " " depmod;
-       inverse_dependencies[depmod] = inverse_dependencies[depmod] " " mod
-       depcount[mod]++
-diff --git a/util/import_unicode.py b/util/import_unicode.py
-index 08f80591e..1f434a069 100644
---- a/util/import_unicode.py
-+++ b/util/import_unicode.py
-@@ -174,7 +174,7 @@ infile.close ()
- 
- outfile.write ("struct grub_unicode_arabic_shape grub_unicode_arabic_shapes[] = {\n ")
- 
--for x in arabicsubst:
-+for x in sorted(arabicsubst):
-     try:
-         if arabicsubst[x]['join'] == "DUAL":
-             outfile.write ("{0x%x, 0x%x, 0x%x, 0x%x, 0x%x},\n " % (arabicsubst[x][0], arabicsubst[x][1], arabicsubst[x][2], arabicsubst[x][3], arabicsubst[x][4]))
--- 
-2.17.1
-
diff --git a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
index 26890261b70..d9012d1dd63 100644
--- a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
+++ b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
@@ -1,4 +1,4 @@
-From 917133acc701dbc4636165d3b08d15dc5829a06f Mon Sep 17 00:00:00 2001
+From b316ed326bd492106006d78f5bfcd767b49a4f2e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Aug 2016 04:06:34 -0400
 Subject: [PATCH] grub module explicitly keeps symbole .module_license
@@ -8,7 +8,7 @@ it stripped symbol table:
 
 ---------------
 root@localhost:~# objdump -t all_video.mod
- 
+
 all_video.mod:     file format elf64-x86-64
 
 SYMBOL TABLE:
@@ -40,12 +40,13 @@ SYMBOL TABLE:
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  grub-core/genmod.sh.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/grub-core/genmod.sh.in b/grub-core/genmod.sh.in
-index 1250589..dd14308 100644
+index e57c4d9..42bb1ba 100644
 --- a/grub-core/genmod.sh.in
 +++ b/grub-core/genmod.sh.in
 @@ -56,7 +56,7 @@ if test x@TARGET_APPLE_LINKER@ != x1; then
diff --git a/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch b/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch
deleted file mode 100644
index a43025d4259..00000000000
--- a/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 1469983ebb9674753ad333d37087fb8cb20e1dce Mon Sep 17 00:00:00 2001
-From: Chris Coulson <chris.coulson@canonical.com>
-Date: Tue, 5 Apr 2022 10:02:04 +0100
-Subject: [PATCH] loader/efi/chainloader: Simplify the loader state
-
-The chainloader command retains the source buffer and device path passed
-to LoadImage(), requiring the unload hook passed to grub_loader_set() to
-free them. It isn't required to retain this state though - they aren't
-required by StartImage() or anything else in the boot hook, so clean them
-up before grub_cmd_chainloader() finishes.
-
-Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=1469983ebb9674753ad333d37087fb8cb20e1dce
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- grub-core/loader/efi/chainloader.c | 38 +++++++++++++++++-------------
- 1 file changed, 21 insertions(+), 17 deletions(-)
-
-diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
-index 2bd80f4db..d1602c89b 100644
---- a/grub-core/loader/efi/chainloader.c
-+++ b/grub-core/loader/efi/chainloader.c
-@@ -44,25 +44,20 @@ GRUB_MOD_LICENSE ("GPLv3+");
- 
- static grub_dl_t my_mod;
- 
--static grub_efi_physical_address_t address;
--static grub_efi_uintn_t pages;
--static grub_efi_device_path_t *file_path;
- static grub_efi_handle_t image_handle;
--static grub_efi_char16_t *cmdline;
- 
- static grub_err_t
- grub_chainloader_unload (void)
- {
-+  grub_efi_loaded_image_t *loaded_image;
-   grub_efi_boot_services_t *b;
- 
-+  loaded_image = grub_efi_get_loaded_image (image_handle);
-+  if (loaded_image != NULL)
-+    grub_free (loaded_image->load_options);
-+
-   b = grub_efi_system_table->boot_services;
-   efi_call_1 (b->unload_image, image_handle);
--  efi_call_2 (b->free_pages, address, pages);
--
--  grub_free (file_path);
--  grub_free (cmdline);
--  cmdline = 0;
--  file_path = 0;
- 
-   grub_dl_unref (my_mod);
-   return GRUB_ERR_NONE;
-@@ -140,7 +135,7 @@ make_file_path (grub_efi_device_path_t *dp, const char *filename)
-   char *dir_start;
-   char *dir_end;
-   grub_size_t size;
--  grub_efi_device_path_t *d;
-+  grub_efi_device_path_t *d, *file_path;
- 
-   dir_start = grub_strchr (filename, ')');
-   if (! dir_start)
-@@ -222,11 +217,14 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-   grub_efi_status_t status;
-   grub_efi_boot_services_t *b;
-   grub_device_t dev = 0;
--  grub_efi_device_path_t *dp = 0;
-+  grub_efi_device_path_t *dp = NULL, *file_path = NULL;
-   grub_efi_loaded_image_t *loaded_image;
-   char *filename;
-   void *boot_image = 0;
-   grub_efi_handle_t dev_handle = 0;
-+  grub_efi_physical_address_t address = 0;
-+  grub_efi_uintn_t pages = 0;
-+  grub_efi_char16_t *cmdline = NULL;
- 
-   if (argc == 0)
-     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
-@@ -234,11 +232,6 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
- 
-   grub_dl_ref (my_mod);
- 
--  /* Initialize some global variables.  */
--  address = 0;
--  image_handle = 0;
--  file_path = 0;
--
-   b = grub_efi_system_table->boot_services;
- 
-   file = grub_file_open (filename, GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE);
-@@ -408,6 +401,10 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-   grub_file_close (file);
-   grub_device_close (dev);
- 
-+  /* We're finished with the source image buffer and file path now. */
-+  efi_call_2 (b->free_pages, address, pages);
-+  grub_free (file_path);
-+
-   grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
-   return 0;
- 
-@@ -419,11 +416,18 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-   if (file)
-     grub_file_close (file);
- 
-+  grub_free (cmdline);
-   grub_free (file_path);
- 
-   if (address)
-     efi_call_2 (b->free_pages, address, pages);
- 
-+  if (image_handle != NULL)
-+    {
-+      efi_call_1 (b->unload_image, image_handle);
-+      image_handle = NULL;
-+    }
-+
-   grub_dl_unref (my_mod);
- 
-   return grub_errno;
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/video-Remove-trailing-whitespaces.patch b/meta/recipes-bsp/grub/files/video-Remove-trailing-whitespaces.patch
deleted file mode 100644
index 2db9bcbbc57..00000000000
--- a/meta/recipes-bsp/grub/files/video-Remove-trailing-whitespaces.patch
+++ /dev/null
@@ -1,693 +0,0 @@
-From 1f48917d8ddb490dcdc70176e0f58136b7f7811a Mon Sep 17 00:00:00 2001
-From: Elyes Haouas <ehaouas@noos.fr>
-Date: Fri, 4 Mar 2022 07:42:13 +0100
-Subject: [PATCH] video: Remove trailing whitespaces
-
-Signed-off-by: Elyes Haouas <ehaouas@noos.fr>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=1f48917d8ddb490dcdc70176e0f58136b7f7811a
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- grub-core/video/bochs.c             |  2 +-
- grub-core/video/capture.c           |  2 +-
- grub-core/video/cirrus.c            |  4 ++--
- grub-core/video/coreboot/cbfb.c     |  2 +-
- grub-core/video/efi_gop.c           | 22 +++++++++----------
- grub-core/video/fb/fbblit.c         |  8 +++----
- grub-core/video/fb/video_fb.c       | 10 ++++-----
- grub-core/video/i386/pc/vbe.c       | 34 ++++++++++++++---------------
- grub-core/video/i386/pc/vga.c       |  6 ++---
- grub-core/video/ieee1275.c          |  4 ++--
- grub-core/video/radeon_fuloong2e.c  |  6 ++---
- grub-core/video/radeon_yeeloong3a.c |  6 ++---
- grub-core/video/readers/png.c       |  2 +-
- grub-core/video/readers/tga.c       |  2 +-
- grub-core/video/sis315_init.c       |  2 +-
- grub-core/video/sis315pro.c         |  8 +++----
- grub-core/video/sm712.c             | 10 ++++-----
- grub-core/video/video.c             |  8 +++----
- 18 files changed, 69 insertions(+), 69 deletions(-)
-
-diff --git a/grub-core/video/bochs.c b/grub-core/video/bochs.c
-index 30ea1bd82..edc651697 100644
---- a/grub-core/video/bochs.c
-+++ b/grub-core/video/bochs.c
-@@ -212,7 +212,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
- 
-   if (((class >> 16) & 0xffff) != 0x0300 || pciid != 0x11111234)
-     return 0;
--  
-+
-   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
-   framebuffer.base = grub_pci_read (addr) & GRUB_PCI_ADDR_MEM_MASK;
-   if (!framebuffer.base)
-diff --git a/grub-core/video/capture.c b/grub-core/video/capture.c
-index 4d3195e01..c653d89f9 100644
---- a/grub-core/video/capture.c
-+++ b/grub-core/video/capture.c
-@@ -92,7 +92,7 @@ grub_video_capture_start (const struct grub_video_mode_info *mode_info,
-   framebuffer.ptr = grub_calloc (framebuffer.mode_info.height, framebuffer.mode_info.pitch);
-   if (!framebuffer.ptr)
-     return grub_errno;
--  
-+
-   err = grub_video_fb_create_render_target_from_pointer (&framebuffer.render_target,
- 							 &framebuffer.mode_info,
- 							 framebuffer.ptr);
-diff --git a/grub-core/video/cirrus.c b/grub-core/video/cirrus.c
-index e2149e8ce..f5542ccdc 100644
---- a/grub-core/video/cirrus.c
-+++ b/grub-core/video/cirrus.c
-@@ -354,11 +354,11 @@ grub_video_cirrus_setup (unsigned int width, unsigned int height,
-     grub_uint8_t sr_ext = 0, hidden_dac = 0;
- 
-     grub_vga_set_geometry (&config, grub_vga_cr_write);
--    
-+
-     grub_vga_gr_write (GRUB_VGA_GR_MODE_256_COLOR | GRUB_VGA_GR_MODE_READ_MODE1,
- 		       GRUB_VGA_GR_MODE);
-     grub_vga_gr_write (GRUB_VGA_GR_GR6_GRAPHICS_MODE, GRUB_VGA_GR_GR6);
--    
-+
-     grub_vga_sr_write (GRUB_VGA_SR_MEMORY_MODE_NORMAL, GRUB_VGA_SR_MEMORY_MODE);
- 
-     grub_vga_cr_write ((config.pitch >> CIRRUS_CR_EXTENDED_DISPLAY_PITCH_SHIFT)
-diff --git a/grub-core/video/coreboot/cbfb.c b/grub-core/video/coreboot/cbfb.c
-index 9af81fa5b..986003c51 100644
---- a/grub-core/video/coreboot/cbfb.c
-+++ b/grub-core/video/coreboot/cbfb.c
-@@ -106,7 +106,7 @@ grub_video_cbfb_setup (unsigned int width, unsigned int height,
- 
-   grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
- 			     grub_video_fbstd_colors);
--    
-+
-   return err;
- }
- 
-diff --git a/grub-core/video/efi_gop.c b/grub-core/video/efi_gop.c
-index b7590dc6c..7a5054631 100644
---- a/grub-core/video/efi_gop.c
-+++ b/grub-core/video/efi_gop.c
-@@ -273,7 +273,7 @@ grub_video_gop_iterate (int (*hook) (const struct grub_video_mode_info *info, vo
-       grub_efi_status_t status;
-       struct grub_efi_gop_mode_info *info = NULL;
-       struct grub_video_mode_info mode_info;
--	 
-+
-       status = efi_call_4 (gop->query_mode, gop, mode, &size, &info);
- 
-       if (status)
-@@ -390,7 +390,7 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
- 	  found = 1;
- 	}
-     }
-- 
-+
-   if (!found)
-     {
-       unsigned mode;
-@@ -399,7 +399,7 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
- 	{
- 	  grub_efi_uintn_t size;
- 	  grub_efi_status_t status;
--	 
-+
- 	  status = efi_call_4 (gop->query_mode, gop, mode, &size, &info);
- 	  if (status)
- 	    {
-@@ -472,11 +472,11 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
-   framebuffer.ptr = (void *) (grub_addr_t) gop->mode->fb_base;
-   framebuffer.offscreen
-     = grub_malloc (framebuffer.mode_info.height
--		   * framebuffer.mode_info.width 
-+		   * framebuffer.mode_info.width
- 		   * sizeof (struct grub_efi_gop_blt_pixel));
- 
-   buffer = framebuffer.offscreen;
--      
-+
-   if (!buffer)
-     {
-       grub_dprintf ("video", "GOP: couldn't allocate shadow\n");
-@@ -485,11 +485,11 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
- 				     &framebuffer.mode_info);
-       buffer = framebuffer.ptr;
-     }
--    
-+
-   grub_dprintf ("video", "GOP: initialising FB @ %p %dx%dx%d\n",
- 		framebuffer.ptr, framebuffer.mode_info.width,
- 		framebuffer.mode_info.height, framebuffer.mode_info.bpp);
-- 
-+
-   err = grub_video_fb_create_render_target_from_pointer
-     (&framebuffer.render_target, &framebuffer.mode_info, buffer);
- 
-@@ -498,15 +498,15 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
-       grub_dprintf ("video", "GOP: Couldn't create FB target\n");
-       return err;
-     }
-- 
-+
-   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
-- 
-+
-   if (err)
-     {
-       grub_dprintf ("video", "GOP: Couldn't set FB target\n");
-       return err;
-     }
-- 
-+
-   err = grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
- 				   grub_video_fbstd_colors);
- 
-@@ -514,7 +514,7 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
-     grub_dprintf ("video", "GOP: Couldn't set palette\n");
-   else
-     grub_dprintf ("video", "GOP: Success\n");
-- 
-+
-   return err;
- }
- 
-diff --git a/grub-core/video/fb/fbblit.c b/grub-core/video/fb/fbblit.c
-index d55924837..1010ef393 100644
---- a/grub-core/video/fb/fbblit.c
-+++ b/grub-core/video/fb/fbblit.c
-@@ -466,7 +466,7 @@ grub_video_fbblit_replace_24bit_indexa (struct grub_video_fbblit_info *dst,
-       for (i = 0; i < width; i++)
-         {
- 	  register grub_uint32_t col;
--	  if (*srcptr == 0xf0)	      
-+	  if (*srcptr == 0xf0)
- 	    col = palette[16];
- 	  else
- 	    col = palette[*srcptr & 0xf];
-@@ -478,7 +478,7 @@ grub_video_fbblit_replace_24bit_indexa (struct grub_video_fbblit_info *dst,
- 	  *dstptr++ = col >> 0;
- 	  *dstptr++ = col >> 8;
- 	  *dstptr++ = col >> 16;
--#endif	  
-+#endif
- 	  srcptr++;
-         }
- 
-@@ -651,7 +651,7 @@ grub_video_fbblit_blend_24bit_indexa (struct grub_video_fbblit_info *dst,
-       for (i = 0; i < width; i++)
-         {
- 	  register grub_uint32_t col;
--	  if (*srcptr != 0xf0)	      
-+	  if (*srcptr != 0xf0)
- 	    {
- 	      col = palette[*srcptr & 0xf];
- #ifdef GRUB_CPU_WORDS_BIGENDIAN
-@@ -662,7 +662,7 @@ grub_video_fbblit_blend_24bit_indexa (struct grub_video_fbblit_info *dst,
- 	      *dstptr++ = col >> 0;
- 	      *dstptr++ = col >> 8;
- 	      *dstptr++ = col >> 16;
--#endif	  
-+#endif
- 	    }
- 	  else
- 	    dstptr += 3;
-diff --git a/grub-core/video/fb/video_fb.c b/grub-core/video/fb/video_fb.c
-index ae6b89f9a..fa4ebde26 100644
---- a/grub-core/video/fb/video_fb.c
-+++ b/grub-core/video/fb/video_fb.c
-@@ -754,7 +754,7 @@ grub_video_fb_unmap_color_int (struct grub_video_fbblit_info * source,
-           *alpha = 0;
-           return;
-         }
--	
-+
-       /* If we have an out-of-bounds color, return transparent black.  */
-       if (color > 255)
-         {
-@@ -1141,7 +1141,7 @@ grub_video_fb_scroll (grub_video_color_t color, int dx, int dy)
-       /* If everything is aligned on 32-bit use 32-bit copy.  */
-       if ((grub_addr_t) grub_video_fb_get_video_ptr (&target, src_x, src_y)
- 	  % sizeof (grub_uint32_t) == 0
--	  && (grub_addr_t) grub_video_fb_get_video_ptr (&target, dst_x, dst_y) 
-+	  && (grub_addr_t) grub_video_fb_get_video_ptr (&target, dst_x, dst_y)
- 	  % sizeof (grub_uint32_t) == 0
- 	  && linelen % sizeof (grub_uint32_t) == 0
- 	  && linedelta % sizeof (grub_uint32_t) == 0)
-@@ -1155,7 +1155,7 @@ grub_video_fb_scroll (grub_video_color_t color, int dx, int dy)
-       else if ((grub_addr_t) grub_video_fb_get_video_ptr (&target, src_x, src_y)
- 	       % sizeof (grub_uint16_t) == 0
- 	       && (grub_addr_t) grub_video_fb_get_video_ptr (&target,
--							     dst_x, dst_y) 
-+							     dst_x, dst_y)
- 	       % sizeof (grub_uint16_t) == 0
- 	       && linelen % sizeof (grub_uint16_t) == 0
- 	       && linedelta % sizeof (grub_uint16_t) == 0)
-@@ -1170,7 +1170,7 @@ grub_video_fb_scroll (grub_video_color_t color, int dx, int dy)
- 	{
- 	  grub_uint8_t *src, *dst;
- 	  DO_SCROLL
--	}	
-+	}
-     }
- 
-   /* 4. Fill empty space with specified color.  In this implementation
-@@ -1615,7 +1615,7 @@ grub_video_fb_setup (unsigned int mode_type, unsigned int mode_mask,
- 	  framebuffer.render_target = framebuffer.back_target;
- 	  return GRUB_ERR_NONE;
- 	}
--      
-+
-       mode_info->mode_type &= ~(GRUB_VIDEO_MODE_TYPE_DOUBLE_BUFFERED
- 				| GRUB_VIDEO_MODE_TYPE_UPDATING_SWAP);
- 
-diff --git a/grub-core/video/i386/pc/vbe.c b/grub-core/video/i386/pc/vbe.c
-index b7f911926..0e65b5206 100644
---- a/grub-core/video/i386/pc/vbe.c
-+++ b/grub-core/video/i386/pc/vbe.c
-@@ -219,7 +219,7 @@ grub_vbe_disable_mtrr (int mtrr)
- }
- 
- /* Call VESA BIOS 0x4f09 to set palette data, return status.  */
--static grub_vbe_status_t 
-+static grub_vbe_status_t
- grub_vbe_bios_set_palette_data (grub_uint32_t color_count,
- 				grub_uint32_t start_index,
- 				struct grub_vbe_palette_data *palette_data)
-@@ -237,7 +237,7 @@ grub_vbe_bios_set_palette_data (grub_uint32_t color_count,
- }
- 
- /* Call VESA BIOS 0x4f00 to get VBE Controller Information, return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_controller_info (struct grub_vbe_info_block *ci)
- {
-   struct grub_bios_int_registers regs;
-@@ -251,7 +251,7 @@ grub_vbe_bios_get_controller_info (struct grub_vbe_info_block *ci)
- }
- 
- /* Call VESA BIOS 0x4f01 to get VBE Mode Information, return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_mode_info (grub_uint32_t mode,
- 			     struct grub_vbe_mode_info_block *mode_info)
- {
-@@ -285,7 +285,7 @@ grub_vbe_bios_set_mode (grub_uint32_t mode,
- }
- 
- /* Call VESA BIOS 0x4f03 to return current VBE Mode, return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_mode (grub_uint32_t *mode)
- {
-   struct grub_bios_int_registers regs;
-@@ -298,7 +298,7 @@ grub_vbe_bios_get_mode (grub_uint32_t *mode)
-   return regs.eax & 0xffff;
- }
- 
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_getset_dac_palette_width (int set, int *dac_mask_size)
- {
-   struct grub_bios_int_registers regs;
-@@ -346,7 +346,7 @@ grub_vbe_bios_get_memory_window (grub_uint32_t window,
- }
- 
- /* Call VESA BIOS 0x4f06 to set scanline length (in bytes), return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_set_scanline_length (grub_uint32_t length)
- {
-   struct grub_bios_int_registers regs;
-@@ -354,14 +354,14 @@ grub_vbe_bios_set_scanline_length (grub_uint32_t length)
-   regs.ecx = length;
-   regs.eax = 0x4f06;
-   /* BL = 2, Set Scan Line in Bytes.  */
--  regs.ebx = 0x0002;	
-+  regs.ebx = 0x0002;
-   regs.flags = GRUB_CPU_INT_FLAGS_DEFAULT;
-   grub_bios_interrupt (0x10, &regs);
-   return regs.eax & 0xffff;
- }
- 
- /* Call VESA BIOS 0x4f06 to return scanline length (in bytes), return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_scanline_length (grub_uint32_t *length)
- {
-   struct grub_bios_int_registers regs;
-@@ -377,7 +377,7 @@ grub_vbe_bios_get_scanline_length (grub_uint32_t *length)
- }
- 
- /* Call VESA BIOS 0x4f07 to set display start, return status.  */
--static grub_vbe_status_t 
-+static grub_vbe_status_t
- grub_vbe_bios_set_display_start (grub_uint32_t x, grub_uint32_t y)
- {
-   struct grub_bios_int_registers regs;
-@@ -390,7 +390,7 @@ grub_vbe_bios_set_display_start (grub_uint32_t x, grub_uint32_t y)
-   regs.edx = y;
-   regs.eax = 0x4f07;
-   /* BL = 80h, Set Display Start during Vertical Retrace.  */
--  regs.ebx = 0x0080;	
-+  regs.ebx = 0x0080;
-   regs.flags = GRUB_CPU_INT_FLAGS_DEFAULT;
-   grub_bios_interrupt (0x10, &regs);
- 
-@@ -401,7 +401,7 @@ grub_vbe_bios_set_display_start (grub_uint32_t x, grub_uint32_t y)
- }
- 
- /* Call VESA BIOS 0x4f07 to get display start, return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_display_start (grub_uint32_t *x,
- 				 grub_uint32_t *y)
- {
-@@ -419,7 +419,7 @@ grub_vbe_bios_get_display_start (grub_uint32_t *x,
- }
- 
- /* Call VESA BIOS 0x4f0a.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_pm_interface (grub_uint16_t *segment, grub_uint16_t *offset,
- 				grub_uint16_t *length)
- {
-@@ -896,7 +896,7 @@ vbe2videoinfo (grub_uint32_t mode,
-     case GRUB_VBE_MEMORY_MODEL_YUV:
-       mode_info->mode_type |= GRUB_VIDEO_MODE_TYPE_YUV;
-       break;
--      
-+
-     case GRUB_VBE_MEMORY_MODEL_DIRECT_COLOR:
-       mode_info->mode_type |= GRUB_VIDEO_MODE_TYPE_RGB;
-       break;
-@@ -923,10 +923,10 @@ vbe2videoinfo (grub_uint32_t mode,
-       break;
-     case 8:
-       mode_info->bytes_per_pixel = 1;
--      break;  
-+      break;
-     case 4:
-       mode_info->bytes_per_pixel = 0;
--      break;  
-+      break;
-     }
- 
-   if (controller_info.version >= 0x300)
-@@ -976,7 +976,7 @@ grub_video_vbe_iterate (int (*hook) (const struct grub_video_mode_info *info, vo
- 
- static grub_err_t
- grub_video_vbe_setup (unsigned int width, unsigned int height,
--                      grub_video_mode_type_t mode_type, 
-+                      grub_video_mode_type_t mode_type,
- 		      grub_video_mode_type_t mode_mask)
- {
-   grub_uint16_t *p;
-@@ -1193,7 +1193,7 @@ grub_video_vbe_print_adapter_specific_info (void)
- 		controller_info.version & 0xFF,
- 		controller_info.oem_software_rev >> 8,
- 		controller_info.oem_software_rev & 0xFF);
--  
-+
-   /* The total_memory field is in 64 KiB units.  */
-   grub_printf_ (N_("              total memory: %d KiB\n"),
- 		(controller_info.total_memory << 6));
-diff --git a/grub-core/video/i386/pc/vga.c b/grub-core/video/i386/pc/vga.c
-index b2f776c99..50d0b5e02 100644
---- a/grub-core/video/i386/pc/vga.c
-+++ b/grub-core/video/i386/pc/vga.c
-@@ -48,7 +48,7 @@ static struct
-   int back_page;
- } framebuffer;
- 
--static unsigned char 
-+static unsigned char
- grub_vga_set_mode (unsigned char mode)
- {
-   struct grub_bios_int_registers regs;
-@@ -182,10 +182,10 @@ grub_video_vga_setup (unsigned int width, unsigned int height,
- 
-   is_target = 1;
-   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
-- 
-+
-   if (err)
-     return err;
-- 
-+
-   err = grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
- 				   grub_video_fbstd_colors);
- 
-diff --git a/grub-core/video/ieee1275.c b/grub-core/video/ieee1275.c
-index f437fb0df..ca3d3c3b2 100644
---- a/grub-core/video/ieee1275.c
-+++ b/grub-core/video/ieee1275.c
-@@ -233,7 +233,7 @@ grub_video_ieee1275_setup (unsigned int width, unsigned int height,
-       /* TODO. */
-       return grub_error (GRUB_ERR_IO, "can't set mode %dx%d", width, height);
-     }
--  
-+
-   err = grub_video_ieee1275_fill_mode_info (dev, &framebuffer.mode_info);
-   if (err)
-     {
-@@ -260,7 +260,7 @@ grub_video_ieee1275_setup (unsigned int width, unsigned int height,
- 
-   grub_video_ieee1275_set_palette (0, framebuffer.mode_info.number_of_colors,
- 				   grub_video_fbstd_colors);
--    
-+
-   return err;
- }
- 
-diff --git a/grub-core/video/radeon_fuloong2e.c b/grub-core/video/radeon_fuloong2e.c
-index b4da34b5e..40917acb7 100644
---- a/grub-core/video/radeon_fuloong2e.c
-+++ b/grub-core/video/radeon_fuloong2e.c
-@@ -75,7 +75,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
-   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
-       || pciid != 0x515a1002)
-     return 0;
--  
-+
-   *found = 1;
- 
-   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
-@@ -139,7 +139,7 @@ grub_video_radeon_fuloong2e_setup (unsigned int width, unsigned int height,
-   framebuffer.mapped = 1;
- 
-   /* Prevent garbage from appearing on the screen.  */
--  grub_memset (framebuffer.ptr, 0x55, 
-+  grub_memset (framebuffer.ptr, 0x55,
- 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
- 
- #ifndef TEST
-@@ -152,7 +152,7 @@ grub_video_radeon_fuloong2e_setup (unsigned int width, unsigned int height,
-     return err;
- 
-   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
--  
-+
-   if (err)
-     return err;
- 
-diff --git a/grub-core/video/radeon_yeeloong3a.c b/grub-core/video/radeon_yeeloong3a.c
-index 52614feb6..48631c181 100644
---- a/grub-core/video/radeon_yeeloong3a.c
-+++ b/grub-core/video/radeon_yeeloong3a.c
-@@ -74,7 +74,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
-   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
-       || pciid != 0x96151002)
-     return 0;
--  
-+
-   *found = 1;
- 
-   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
-@@ -137,7 +137,7 @@ grub_video_radeon_yeeloong3a_setup (unsigned int width, unsigned int height,
- #endif
- 
-   /* Prevent garbage from appearing on the screen.  */
--  grub_memset (framebuffer.ptr, 0, 
-+  grub_memset (framebuffer.ptr, 0,
- 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
- 
- #ifndef TEST
-@@ -150,7 +150,7 @@ grub_video_radeon_yeeloong3a_setup (unsigned int width, unsigned int height,
-     return err;
- 
-   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
--  
-+
-   if (err)
-     return err;
- 
-diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
-index 0157ff742..54dfedf43 100644
---- a/grub-core/video/readers/png.c
-+++ b/grub-core/video/readers/png.c
-@@ -916,7 +916,7 @@ grub_png_convert_image (struct grub_png_data *data)
- 	}
-       return;
-     }
--  
-+
-   if (data->is_gray)
-     {
-       switch (data->bpp)
-diff --git a/grub-core/video/readers/tga.c b/grub-core/video/readers/tga.c
-index 7cb9d1d2a..a9ec3a1b6 100644
---- a/grub-core/video/readers/tga.c
-+++ b/grub-core/video/readers/tga.c
-@@ -127,7 +127,7 @@ tga_load_palette (struct tga_data *data)
- 
-   if (len > sizeof (data->palette))
-     len = sizeof (data->palette);
--  
-+
-   if (grub_file_read (data->file, &data->palette, len)
-       != (grub_ssize_t) len)
-     return grub_errno;
-diff --git a/grub-core/video/sis315_init.c b/grub-core/video/sis315_init.c
-index ae5c1419c..09c3c7bbe 100644
---- a/grub-core/video/sis315_init.c
-+++ b/grub-core/video/sis315_init.c
-@@ -1,4 +1,4 @@
--static const struct { grub_uint8_t reg; grub_uint8_t val; } sr_dump [] = 
-+static const struct { grub_uint8_t reg; grub_uint8_t val; } sr_dump [] =
- {
-   { 0x28, 0x81 },
-   { 0x2a, 0x00 },
-diff --git a/grub-core/video/sis315pro.c b/grub-core/video/sis315pro.c
-index 22a0c85a6..4d2f9999a 100644
---- a/grub-core/video/sis315pro.c
-+++ b/grub-core/video/sis315pro.c
-@@ -103,7 +103,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
-   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
-       || pciid != GRUB_SIS315PRO_PCIID)
-     return 0;
--  
-+
-   *found = 1;
- 
-   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
-@@ -218,7 +218,7 @@ grub_video_sis315pro_setup (unsigned int width, unsigned int height,
- 
- #ifndef TEST
-   /* Prevent garbage from appearing on the screen.  */
--  grub_memset (framebuffer.ptr, 0, 
-+  grub_memset (framebuffer.ptr, 0,
- 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
-   grub_arch_sync_dma_caches (framebuffer.ptr,
- 			     framebuffer.mode_info.height
-@@ -231,7 +231,7 @@ grub_video_sis315pro_setup (unsigned int width, unsigned int height,
- 	     | GRUB_VGA_IO_MISC_EXTERNAL_CLOCK_0
- 	     | GRUB_VGA_IO_MISC_28MHZ
- 	     | GRUB_VGA_IO_MISC_ENABLE_VRAM_ACCESS
--	     | GRUB_VGA_IO_MISC_COLOR, 
-+	     | GRUB_VGA_IO_MISC_COLOR,
- 	     GRUB_VGA_IO_MISC_WRITE + GRUB_MACHINE_PCI_IO_BASE);
- 
-   grub_vga_sr_write (0x86, 5);
-@@ -335,7 +335,7 @@ grub_video_sis315pro_setup (unsigned int width, unsigned int height,
-   {
-     if (read_sis_cmd (0x5) != 0xa1)
-       write_sis_cmd (0x86, 0x5);
--    
-+
-     write_sis_cmd (read_sis_cmd (0x20) | 0xa1, 0x20);
-     write_sis_cmd (read_sis_cmd (0x1e) | 0xda, 0x1e);
- 
-diff --git a/grub-core/video/sm712.c b/grub-core/video/sm712.c
-index 10c46eb65..65f59f84b 100644
---- a/grub-core/video/sm712.c
-+++ b/grub-core/video/sm712.c
-@@ -167,7 +167,7 @@ enum
-     GRUB_SM712_CR_SHADOW_VGA_VBLANK_START = 0x46,
-     GRUB_SM712_CR_SHADOW_VGA_VBLANK_END = 0x47,
-     GRUB_SM712_CR_SHADOW_VGA_VRETRACE_START = 0x48,
--    GRUB_SM712_CR_SHADOW_VGA_VRETRACE_END = 0x49,    
-+    GRUB_SM712_CR_SHADOW_VGA_VRETRACE_END = 0x49,
-     GRUB_SM712_CR_SHADOW_VGA_OVERFLOW = 0x4a,
-     GRUB_SM712_CR_SHADOW_VGA_CELL_HEIGHT = 0x4b,
-     GRUB_SM712_CR_SHADOW_VGA_HDISPLAY_END = 0x4c,
-@@ -375,7 +375,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
-   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
-       || pciid != GRUB_SM712_PCIID)
-     return 0;
--  
-+
-   *found = 1;
- 
-   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
-@@ -471,7 +471,7 @@ grub_video_sm712_setup (unsigned int width, unsigned int height,
- 
- #if !defined (TEST) && !defined(GENINIT)
-   /* Prevent garbage from appearing on the screen.  */
--  grub_memset ((void *) framebuffer.cached_ptr, 0, 
-+  grub_memset ((void *) framebuffer.cached_ptr, 0,
- 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
- #endif
- 
-@@ -482,7 +482,7 @@ grub_video_sm712_setup (unsigned int width, unsigned int height,
-   grub_sm712_sr_write (0x2, 0x6b);
-   grub_sm712_write_reg (0, GRUB_VGA_IO_PIXEL_MASK);
-   grub_sm712_sr_write (GRUB_VGA_SR_RESET_ASYNC, GRUB_VGA_SR_RESET);
--  grub_sm712_write_reg (GRUB_VGA_IO_MISC_NEGATIVE_VERT_POLARITY 
-+  grub_sm712_write_reg (GRUB_VGA_IO_MISC_NEGATIVE_VERT_POLARITY
- 			| GRUB_VGA_IO_MISC_NEGATIVE_HORIZ_POLARITY
- 			| GRUB_VGA_IO_MISC_UPPER_64K
- 			| GRUB_VGA_IO_MISC_EXTERNAL_CLOCK_0
-@@ -694,7 +694,7 @@ grub_video_sm712_setup (unsigned int width, unsigned int height,
-   for (i = 0; i < ARRAY_SIZE (dda_lookups); i++)
-     grub_sm712_write_dda_lookup (i, dda_lookups[i].compare, dda_lookups[i].dda,
- 				 dda_lookups[i].vcentering);
--  
-+
-   /* Undocumented  */
-   grub_sm712_cr_write (0, 0x9c);
-   grub_sm712_cr_write (0, 0x9d);
-diff --git a/grub-core/video/video.c b/grub-core/video/video.c
-index 983424107..8937da745 100644
---- a/grub-core/video/video.c
-+++ b/grub-core/video/video.c
-@@ -491,13 +491,13 @@ parse_modespec (const char *current_mode, int *width, int *height, int *depth)
- 		       current_mode);
- 
-   param++;
--  
-+
-   *width = grub_strtoul (value, 0, 0);
-   if (grub_errno != GRUB_ERR_NONE)
-       return grub_error (GRUB_ERR_BAD_ARGUMENT,
- 			 N_("invalid video mode specification `%s'"),
- 			 current_mode);
--  
-+
-   /* Find height value.  */
-   value = param;
-   param = grub_strchr(param, 'x');
-@@ -513,13 +513,13 @@ parse_modespec (const char *current_mode, int *width, int *height, int *depth)
-     {
-       /* We have optional color depth value.  */
-       param++;
--      
-+
-       *height = grub_strtoul (value, 0, 0);
-       if (grub_errno != GRUB_ERR_NONE)
- 	return grub_error (GRUB_ERR_BAD_ARGUMENT,
- 			   N_("invalid video mode specification `%s'"),
- 			   current_mode);
--      
-+
-       /* Convert color depth value.  */
-       value = param;
-       *depth = grub_strtoul (value, 0, 0);
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch b/meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch
deleted file mode 100644
index 0c7deae8582..00000000000
--- a/meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch
+++ /dev/null
@@ -1,264 +0,0 @@
-From d5caac8ab79d068ad9a41030c772d03a4d4fbd7b Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Mon, 28 Jun 2021 14:16:14 +1000
-Subject: [PATCH] video/readers/jpeg: Abort sooner if a read operation fails
-
-Fuzzing revealed some inputs that were taking a long time, potentially
-forever, because they did not bail quickly upon encountering an I/O error.
-
-Try to catch I/O errors sooner and bail out.
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=d5caac8ab79d068ad9a41030c772d03a4d4fbd7b
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- grub-core/video/readers/jpeg.c | 86 +++++++++++++++++++++++++++-------
- 1 file changed, 70 insertions(+), 16 deletions(-)
-
-diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
-index c47ffd651..806c56c78 100644
---- a/grub-core/video/readers/jpeg.c
-+++ b/grub-core/video/readers/jpeg.c
-@@ -109,9 +109,17 @@ static grub_uint8_t
- grub_jpeg_get_byte (struct grub_jpeg_data *data)
- {
-   grub_uint8_t r;
-+  grub_ssize_t bytes_read;
- 
-   r = 0;
--  grub_file_read (data->file, &r, 1);
-+  bytes_read = grub_file_read (data->file, &r, 1);
-+
-+  if (bytes_read != 1)
-+    {
-+      grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+		  "jpeg: unexpected end of data");
-+      return 0;
-+    }
- 
-   return r;
- }
-@@ -120,9 +128,17 @@ static grub_uint16_t
- grub_jpeg_get_word (struct grub_jpeg_data *data)
- {
-   grub_uint16_t r;
-+  grub_ssize_t bytes_read;
- 
-   r = 0;
--  grub_file_read (data->file, &r, sizeof (grub_uint16_t));
-+  bytes_read = grub_file_read (data->file, &r, sizeof (grub_uint16_t));
-+
-+  if (bytes_read != sizeof (grub_uint16_t))
-+    {
-+      grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+		  "jpeg: unexpected end of data");
-+      return 0;
-+    }
- 
-   return grub_be_to_cpu16 (r);
- }
-@@ -135,6 +151,11 @@ grub_jpeg_get_bit (struct grub_jpeg_data *data)
-   if (data->bit_mask == 0)
-     {
-       data->bit_save = grub_jpeg_get_byte (data);
-+      if (grub_errno != GRUB_ERR_NONE) {
-+	grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+		    "jpeg: file read error");
-+	return 0;
-+      }
-       if (data->bit_save == JPEG_ESC_CHAR)
- 	{
- 	  if (grub_jpeg_get_byte (data) != 0)
-@@ -143,6 +164,11 @@ grub_jpeg_get_bit (struct grub_jpeg_data *data)
- 			  "jpeg: invalid 0xFF in data stream");
- 	      return 0;
- 	    }
-+	  if (grub_errno != GRUB_ERR_NONE)
-+	    {
-+	      grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: file read error");
-+	      return 0;
-+	    }
- 	}
-       data->bit_mask = 0x80;
-     }
-@@ -161,7 +187,7 @@ grub_jpeg_get_number (struct grub_jpeg_data *data, int num)
-     return 0;
- 
-   msb = value = grub_jpeg_get_bit (data);
--  for (i = 1; i < num; i++)
-+  for (i = 1; i < num && grub_errno == GRUB_ERR_NONE; i++)
-     value = (value << 1) + (grub_jpeg_get_bit (data) != 0);
-   if (!msb)
-     value += 1 - (1 << num);
-@@ -208,6 +234,8 @@ grub_jpeg_decode_huff_table (struct grub_jpeg_data *data)
-   while (data->file->offset + sizeof (count) + 1 <= next_marker)
-     {
-       id = grub_jpeg_get_byte (data);
-+      if (grub_errno != GRUB_ERR_NONE)
-+	return grub_errno;
-       ac = (id >> 4) & 1;
-       id &= 0xF;
-       if (id > 1)
-@@ -258,6 +286,8 @@ grub_jpeg_decode_quan_table (struct grub_jpeg_data *data)
- 
-   next_marker = data->file->offset;
-   next_marker += grub_jpeg_get_word (data);
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
- 
-   if (next_marker > data->file->size)
-     {
-@@ -269,6 +299,8 @@ grub_jpeg_decode_quan_table (struct grub_jpeg_data *data)
- 	 <= next_marker)
-     {
-       id = grub_jpeg_get_byte (data);
-+      if (grub_errno != GRUB_ERR_NONE)
-+        return grub_errno;
-       if (id >= 0x10)		/* Upper 4-bit is precision.  */
- 	return grub_error (GRUB_ERR_BAD_FILE_TYPE,
- 			   "jpeg: only 8-bit precision is supported");
-@@ -300,6 +332,9 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
-   next_marker = data->file->offset;
-   next_marker += grub_jpeg_get_word (data);
- 
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
-+
-   if (grub_jpeg_get_byte (data) != 8)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
- 		       "jpeg: only 8-bit precision is supported");
-@@ -325,6 +360,8 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
- 	return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: invalid index");
- 
-       ss = grub_jpeg_get_byte (data);	/* Sampling factor.  */
-+      if (grub_errno != GRUB_ERR_NONE)
-+	return grub_errno;
-       if (!id)
- 	{
- 	  grub_uint8_t vs, hs;
-@@ -504,7 +541,7 @@ grub_jpeg_idct_transform (jpeg_data_unit_t du)
-     }
- }
- 
--static void
-+static grub_err_t
- grub_jpeg_decode_du (struct grub_jpeg_data *data, int id, jpeg_data_unit_t du)
- {
-   int h1, h2, qt;
-@@ -519,6 +556,9 @@ grub_jpeg_decode_du (struct grub_jpeg_data *data, int id, jpeg_data_unit_t du)
-   data->dc_value[id] +=
-     grub_jpeg_get_number (data, grub_jpeg_get_huff_code (data, h1));
- 
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
-+
-   du[0] = data->dc_value[id] * (int) data->quan_table[qt][0];
-   pos = 1;
-   while (pos < ARRAY_SIZE (data->quan_table[qt]))
-@@ -533,11 +573,13 @@ grub_jpeg_decode_du (struct grub_jpeg_data *data, int id, jpeg_data_unit_t du)
-       num >>= 4;
-       pos += num;
- 
-+      if (grub_errno != GRUB_ERR_NONE)
-+        return grub_errno;
-+
-       if (pos >= ARRAY_SIZE (jpeg_zigzag_order))
- 	{
--	  grub_error (GRUB_ERR_BAD_FILE_TYPE,
--		      "jpeg: invalid position in zigzag order!?");
--	  return;
-+	  return grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+			     "jpeg: invalid position in zigzag order!?");
- 	}
- 
-       du[jpeg_zigzag_order[pos]] = val * (int) data->quan_table[qt][pos];
-@@ -545,6 +587,7 @@ grub_jpeg_decode_du (struct grub_jpeg_data *data, int id, jpeg_data_unit_t du)
-     }
- 
-   grub_jpeg_idct_transform (du);
-+  return GRUB_ERR_NONE;
- }
- 
- static void
-@@ -603,7 +646,8 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
-   data_offset += grub_jpeg_get_word (data);
- 
-   cc = grub_jpeg_get_byte (data);
--
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
-   if (cc != 3 && cc != 1)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
- 		       "jpeg: component count must be 1 or 3");
-@@ -616,7 +660,8 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
-       id = grub_jpeg_get_byte (data) - 1;
-       if ((id < 0) || (id >= 3))
- 	return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: invalid index");
--
-+      if (grub_errno != GRUB_ERR_NONE)
-+	return grub_errno;
-       ht = grub_jpeg_get_byte (data);
-       data->comp_index[id][1] = (ht >> 4);
-       data->comp_index[id][2] = (ht & 0xF) + 2;
-@@ -624,11 +669,14 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
-       if ((data->comp_index[id][1] < 0) || (data->comp_index[id][1] > 3) ||
- 	  (data->comp_index[id][2] < 0) || (data->comp_index[id][2] > 3))
- 	return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: invalid hufftable index");
-+      if (grub_errno != GRUB_ERR_NONE)
-+	return grub_errno;
-     }
- 
-   grub_jpeg_get_byte (data);	/* Skip 3 unused bytes.  */
-   grub_jpeg_get_word (data);
--
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
-   if (data->file->offset != data_offset)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: extra byte in sos");
- 
-@@ -646,6 +694,7 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
- {
-   unsigned c1, vb, hb, nr1, nc1;
-   int rst = data->dri;
-+  grub_err_t err = GRUB_ERR_NONE;
- 
-   vb = 8 << data->log_vs;
-   hb = 8 << data->log_hs;
-@@ -666,17 +715,22 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
- 
- 	for (r2 = 0; r2 < (1U << data->log_vs); r2++)
- 	  for (c2 = 0; c2 < (1U << data->log_hs); c2++)
--	    grub_jpeg_decode_du (data, 0, data->ydu[r2 * 2 + c2]);
-+            {
-+              err = grub_jpeg_decode_du (data, 0, data->ydu[r2 * 2 + c2]);
-+              if (err != GRUB_ERR_NONE)
-+                return err;
-+            }
- 
- 	if (data->color_components >= 3)
- 	  {
--	    grub_jpeg_decode_du (data, 1, data->cbdu);
--	    grub_jpeg_decode_du (data, 2, data->crdu);
-+	    err = grub_jpeg_decode_du (data, 1, data->cbdu);
-+	    if (err != GRUB_ERR_NONE)
-+	      return err;
-+	    err = grub_jpeg_decode_du (data, 2, data->crdu);
-+	    if (err != GRUB_ERR_NONE)
-+	      return err;
- 	  }
- 
--	if (grub_errno)
--	  return grub_errno;
--
- 	nr2 = (data->r1 == nr1 - 1) ? (data->image_height - data->r1 * vb) : vb;
- 	nc2 = (c1 == nc1 - 1) ? (data->image_width - c1 * hb) : hb;
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch b/meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch
deleted file mode 100644
index 91ecaad98a6..00000000000
--- a/meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 166a4d61448f74745afe1dac2f2cfb85d04909bf Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Mon, 28 Jun 2021 14:25:17 +1000
-Subject: [PATCH] video/readers/jpeg: Refuse to handle multiple start of
- streams
-
-An invalid file could contain multiple start of stream blocks, which
-would cause us to reallocate and leak our bitmap. Refuse to handle
-multiple start of streams.
-
-Additionally, fix a grub_error() call formatting.
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport
-
-Reference to upstream patch:
-https://git.savannah.gnu.org/cgit/grub.git/commit/?id=166a4d61448f74745afe1dac2f2cfb85d04909bf
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- grub-core/video/readers/jpeg.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
-index 2284a6c06..579bbe8a4 100644
---- a/grub-core/video/readers/jpeg.c
-+++ b/grub-core/video/readers/jpeg.c
-@@ -683,6 +683,9 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
-   if (data->file->offset != data_offset)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: extra byte in sos");
- 
-+  if (*data->bitmap)
-+    return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: too many start of scan blocks");
-+
-   if (grub_video_bitmap_create (data->bitmap, data->image_width,
- 				data->image_height,
- 				GRUB_VIDEO_BLIT_FORMAT_RGB_888))
-@@ -705,8 +708,8 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
-   nc1 = (data->image_width + hb - 1)  >> (3 + data->log_hs);
- 
-   if (data->bitmap_ptr == NULL)
--    return grub_error(GRUB_ERR_BAD_FILE_TYPE,
--		      "jpeg: attempted to decode data before start of stream");
-+    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+		       "jpeg: attempted to decode data before start of stream");
- 
-   for (; data->r1 < nr1 && (!data->dri || rst);
-        data->r1++, data->bitmap_ptr += (vb * data->image_width - hb * nc1) * 3)
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/grub/grub-efi_2.06.bb b/meta/recipes-bsp/grub/grub-efi_2.12.bb
similarity index 100%
rename from meta/recipes-bsp/grub/grub-efi_2.06.bb
rename to meta/recipes-bsp/grub/grub-efi_2.12.bb
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1215b24668a..5685cae0ab4 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -18,36 +18,10 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
-           file://determinism.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
-           file://CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch \
-           file://0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch \
-           file://video-Remove-trailing-whitespaces.patch \
-           file://CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch \
-           file://CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch \
-           file://video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch \
-           file://video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch \
-           file://CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch \
-           file://CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch \
-           file://CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch \
-           file://CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch \
-           file://CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch \
-           file://0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch \
-           file://0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch \
-           file://loader-efi-chainloader-Simplify-the-loader-state.patch \
-           file://commands-boot-Add-API-to-pass-context-to-loader.patch \
-           file://CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch\
-           file://0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch \
-           file://CVE-2022-2601.patch \
-           file://CVE-2022-3775.patch \
-           file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
-           file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
-           file://CVE-2023-4692.patch \
-           file://CVE-2023-4693.patch \
-           file://0001-fs-fat-Don-t-error-when-mtime-is-0.patch \
 "
 
-SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
+SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
 
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
 CVE_STATUS[CVE-2021-46705] = "not-applicable-platform: Applies only to SUSE"
@@ -101,6 +75,11 @@ export PYTHON = "python3"
 
 do_configure:prepend() {
 	cd ${S}
+
+	# Remove in next version.
+	# See: https://git.savannah.gnu.org/cgit/grub.git/commit/?id=b835601c7639ed1890f2d3db91900a8506011a8e
+	echo "depends bli part_gpt" > ${S}/grub-core/extra_deps.lst
+
 	FROM_BOOTSTRAP=1 ${S}/autogen.sh
 	cd ${B}
 }
diff --git a/meta/recipes-bsp/grub/grub_2.06.bb b/meta/recipes-bsp/grub/grub_2.12.bb
similarity index 100%
rename from meta/recipes-bsp/grub/grub_2.06.bb
rename to meta/recipes-bsp/grub/grub_2.12.bb
-- 
2.43.0


