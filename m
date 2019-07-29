Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0707D41E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 03:20:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2019 20:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,321,1559545200"; d="scan'208";a="173059327"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2019 20:20:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 11:20:26 +0800
Message-Id: <1564370426-60448-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564370426-60448-1-git-send-email-anuj.mittal@intel.com>
References: <1564370426-60448-1-git-send-email-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] grub: upgrade 2.02 -> 2.04
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
X-List-Received-Date: Mon, 29 Jul 2019 03:20:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* For changes in this version, see:
http://git.savannah.gnu.org/cgit/grub.git/tree/NEWS?h=grub-2.04

* Remove backported patches and refresh others.

* Remove the musl patch as it's no longer needed.

* Use configure option --disable-werror instead of passing through CFLAGS.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-mfpmath-sse-as-well-when-SSE-is-disabled.patch | 13 ++--
 ...need_charset_alias-when-building-for-musl.patch | 30 ---------
 .../0001-grub-setup-Debug-message-cleanup.patch    | 34 ----------
 ...1-grub.d-10_linux.in-add-oe-s-kernel-name.patch | 16 ++---
 ...-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch | 76 ----------------------
 .../grub/files/autogen.sh-exclude-pc.patch         | 15 +++--
 meta/recipes-bsp/grub/files/gcc8.patch             | 74 ---------------------
 ...-explicitly-keeps-symbole-.module_license.patch | 21 +++---
 .../grub/{grub-efi_2.02.bb => grub-efi_2.04.bb}    |  0
 meta/recipes-bsp/grub/grub2.inc                    | 13 ++--
 .../grub/{grub_2.02.bb => grub_2.04.bb}            |  0
 11 files changed, 35 insertions(+), 257 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-grub-setup-Debug-message-cleanup.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch
 delete mode 100644 meta/recipes-bsp/grub/files/gcc8.patch
 rename meta/recipes-bsp/grub/{grub-efi_2.02.bb => grub-efi_2.04.bb} (100%)
 rename meta/recipes-bsp/grub/{grub_2.02.bb => grub_2.04.bb} (100%)

diff --git a/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch b/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
index ce3238f..6b73878 100644
--- a/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
+++ b/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
@@ -1,4 +1,4 @@
-From fb7b827a56b1f92f882d0f5ef130acc968b23293 Mon Sep 17 00:00:00 2001
+From 96d9aa55d29b24e2490d5647a9efc66940fc400f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jan 2016 19:17:31 +0000
 Subject: [PATCH] Disable -mfpmath=sse as well when SSE is disabled
@@ -22,17 +22,17 @@ cc1: all warnings being treated as errors
 
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
 
+Upstream-Status: Pending
+---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 26d2f33..9ce56de 100644
+index 7656f24..0868ea9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -783,7 +783,7 @@ fi
+@@ -824,7 +824,7 @@ fi
  if ( test "x$target_cpu" = xi386 || test "x$target_cpu" = xx86_64 ) && test "x$platform" != xemu; then
    # Some toolchains enable these features by default, but they need
    # registers that aren't set up properly in GRUB.
@@ -41,6 +41,3 @@ index 26d2f33..9ce56de 100644
  fi
  
  # GRUB doesn't use float or doubles at all. Yet some toolchains may decide
--- 
-2.7.0
-
diff --git a/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index 67dc115..0000000
--- a/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: grub-2.00/grub-core/gnulib/Makefile.am
-===================================================================
---- grub-2.00.orig/grub-core/gnulib/Makefile.am
-+++ grub-2.00/grub-core/gnulib/Makefile.am
-@@ -410,7 +410,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-bsp/grub/files/0001-grub-setup-Debug-message-cleanup.patch b/meta/recipes-bsp/grub/files/0001-grub-setup-Debug-message-cleanup.patch
deleted file mode 100644
index e01fcdf..0000000
--- a/meta/recipes-bsp/grub/files/0001-grub-setup-Debug-message-cleanup.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4e9d9358e0cda6d01020005eb6343e3b69f7201a Mon Sep 17 00:00:00 2001
-From: Cao jin <caoj.fnst@cn.fujitsu.com>
-Date: Tue, 3 Jul 2018 18:51:13 +0800
-Subject: [PATCH] grub-setup: Debug message cleanup
-
-Variable "root" is initialized after root device probing and is null in
-current place, so, drop it.
-
-Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
----
-Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/grub.git/commit/?id=4e9d9358e0cda6d01020005eb6343e3b69f7201a]
-
- util/setup.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/util/setup.c b/util/setup.c
-index 80363075d..9c1e1b7da 100644
---- a/util/setup.c
-+++ b/util/setup.c
-@@ -305,9 +305,8 @@ SETUP (const char *dir,
-   bl.first_block = (struct grub_boot_blocklist *) (core_img
- 						   + GRUB_DISK_SECTOR_SIZE
- 						   - sizeof (*bl.block));
--  grub_util_info ("root is `%s', dest is `%s'", root, dest);
- 
--  grub_util_info ("Opening dest");
-+  grub_util_info ("Opening dest `%s'", dest);
-   dest_dev = grub_device_open (dest);
-   if (! dest_dev)
-     grub_util_error ("%s", grub_errmsg);
--- 
-2.17.2 (Apple Git-113)
-
diff --git a/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch b/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
index d5bfaa1..69b04aa 100644
--- a/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
+++ b/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
@@ -1,4 +1,4 @@
-From b512c77222a8b133d7dd71a0dcef081a921d97d4 Mon Sep 17 00:00:00 2001
+From 8f47ed4aaefba087b6ca76e59c9f832b6a0702bc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jan 2016 19:28:00 +0000
 Subject: [PATCH] grub.d/10_linux.in: add oe's kernel name
@@ -11,18 +11,19 @@ to util/grub.d/20_linux_xen.in to keep compatibility.
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
+
 Upstream-Status: Inappropriate [OE specific]
 
+---
  util/grub.d/10_linux.in     | 6 +++---
  util/grub.d/20_linux_xen.in | 2 +-
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/util/grub.d/10_linux.in b/util/grub.d/10_linux.in
-index 859b608..946be5d 100644
+index 4532266..cba2617 100644
 --- a/util/grub.d/10_linux.in
 +++ b/util/grub.d/10_linux.in
-@@ -148,12 +148,12 @@ machine=`uname -m`
+@@ -164,12 +164,12 @@ machine=`uname -m`
  case "x$machine" in
      xi?86 | xx86_64)
  	list=
@@ -39,10 +40,10 @@ index 859b608..946be5d 100644
  	done ;;
  esac
 diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
-index f532fb9..1994244 100644
+index 96179ea..98d16ae 100644
 --- a/util/grub.d/20_linux_xen.in
 +++ b/util/grub.d/20_linux_xen.in
-@@ -138,7 +138,7 @@ EOF
+@@ -154,7 +154,7 @@ EOF
  }
  
  linux_list=
@@ -51,6 +52,3 @@ index f532fb9..1994244 100644
      if grub_file_is_not_garbage "$i"; then
      	basename=$(basename $i)
  	version=$(echo $basename | sed -e "s,^[^0-9]*-,,g")
--- 
-2.7.0
-
diff --git a/meta/recipes-bsp/grub/files/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch b/meta/recipes-bsp/grub/files/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch
deleted file mode 100644
index 61d58c4..0000000
--- a/meta/recipes-bsp/grub/files/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 842c390469e2c2e10b5aa36700324cd3bde25875 Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Sat, 17 Feb 2018 06:47:28 -0800
-Subject: [PATCH] x86-64: Treat R_X86_64_PLT32 as R_X86_64_PC32
-
-Starting from binutils commit bd7ab16b4537788ad53521c45469a1bdae84ad4a:
-
-https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=bd7ab16b4537788ad53521c45469a1bdae84ad4a
-
-x86-64 assembler generates R_X86_64_PLT32, instead of R_X86_64_PC32, for
-32-bit PC-relative branches.  Grub2 should treat R_X86_64_PLT32 as
-R_X86_64_PC32.
-
-Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
----
- grub-core/efiemu/i386/loadcore64.c | 1 +
- grub-core/kern/x86_64/dl.c         | 1 +
- util/grub-mkimagexx.c              | 1 +
- util/grub-module-verifier.c        | 1 +
- 4 files changed, 4 insertions(+)
-
-diff --git a/grub-core/efiemu/i386/loadcore64.c b/grub-core/efiemu/i386/loadcore64.c
-index e49d0b6ff..18facf47f 100644
---- a/grub-core/efiemu/i386/loadcore64.c
-+++ b/grub-core/efiemu/i386/loadcore64.c
-@@ -98,6 +98,7 @@ grub_arch_efiemu_relocate_symbols64 (grub_efiemu_segment_t segs,
- 		    break;
- 
- 		  case R_X86_64_PC32:
-+		  case R_X86_64_PLT32:
- 		    err = grub_efiemu_write_value (addr,
- 						   *addr32 + rel->r_addend
- 						   + sym.off
-diff --git a/grub-core/kern/x86_64/dl.c b/grub-core/kern/x86_64/dl.c
-index 440690673..3a73e6e6c 100644
---- a/grub-core/kern/x86_64/dl.c
-+++ b/grub-core/kern/x86_64/dl.c
-@@ -70,6 +70,7 @@ grub_arch_dl_relocate_symbols (grub_dl_t mod, void *ehdr,
- 	  break;
- 
- 	case R_X86_64_PC32:
-+	case R_X86_64_PLT32:
- 	  {
- 	    grub_int64_t value;
- 	    value = ((grub_int32_t) *addr32) + rel->r_addend + sym->st_value -
-diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
-index a2bb05439..39d7efb91 100644
---- a/util/grub-mkimagexx.c
-+++ b/util/grub-mkimagexx.c
-@@ -841,6 +841,7 @@ SUFFIX (relocate_addresses) (Elf_Ehdr *e, Elf_Shdr *sections,
- 		  break;
- 
- 		case R_X86_64_PC32:
-+		case R_X86_64_PLT32:
- 		  {
- 		    grub_uint32_t *t32 = (grub_uint32_t *) target;
- 		    *t32 = grub_host_to_target64 (grub_target_to_host32 (*t32)
-diff --git a/util/grub-module-verifier.c b/util/grub-module-verifier.c
-index 9179285a5..a79271f66 100644
---- a/util/grub-module-verifier.c
-+++ b/util/grub-module-verifier.c
-@@ -19,6 +19,7 @@ struct grub_module_verifier_arch archs[] = {
-       -1
-     }, (int[]){
-       R_X86_64_PC32,
-+      R_X86_64_PLT32,
-       -1
-     }
-   },
--- 
-2.11.0
-
diff --git a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
index fc5aa4e..faa7fde 100644
--- a/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
+++ b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
@@ -1,4 +1,4 @@
-From ff8f68cc48fd3c30d55e1d570d51f2e0952c968e Mon Sep 17 00:00:00 2001
+From 72c30928d3d461e0e2d20c5ff33bd96b6991d585 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sat, 25 Jan 2014 23:49:44 -0500
 Subject: [PATCH] autogen.sh: exclude .pc from po/POTFILES.in
@@ -12,23 +12,24 @@ try to read it.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
- autogen.sh |    2 +-
+ autogen.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 7424428..843619e 100755
+index ef43270..a7067a7 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -5,7 +5,7 @@ set -e
+@@ -13,7 +13,7 @@ fi
  export LC_COLLATE=C
  unset LC_ALL
  
--find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*' ! -ipath './build-aux/*' ! -ipath './grub-core/lib/libgcrypt/src/misc.c' ! -ipath './grub-core/lib/libgcrypt/src/global.c' ! -ipath './grub-core/lib/libgcrypt/src/secmem.c'  ! -ipath './util/grub-gen-widthspec.c' ! -ipath './util/grub-gen-asciih.c' |sort > po/POTFILES.in
-+find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*' ! -ipath './build-aux/*' ! -ipath './grub-core/lib/libgcrypt/src/misc.c' ! -ipath './grub-core/lib/libgcrypt/src/global.c' ! -ipath './grub-core/lib/libgcrypt/src/secmem.c'  ! -ipath './util/grub-gen-widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -path './.pc/*' | sort > po/POTFILES.in
+-find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*' ! -ipath './build-aux/*' ! -ipath './grub-core/lib/libgcrypt/src/misc.c' ! -ipath './grub-core/lib/libgcrypt/src/global.c' ! -ipath './grub-core/lib/libgcrypt/src/secmem.c'  ! -ipath './util/grub-gen-widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -ipath './gnulib/*' ! -iname './grub-core/lib/gnulib/*' |sort > po/POTFILES.in
++find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*' ! -ipath './build-aux/*' ! -ipath './grub-core/lib/libgcrypt/src/misc.c' ! -ipath './grub-core/lib/libgcrypt/src/global.c' ! -ipath './grub-core/lib/libgcrypt/src/secmem.c'  ! -ipath './util/grub-gen-widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -ipath './gnulib/*' ! -iname './grub-core/lib/gnulib/*' ! -path './.pc/*' |sort > po/POTFILES.in
  find util -iname '*.in' ! -name Makefile.in  |sort > po/POTFILES-shell.in
  
  echo "Importing unicode..."
 -- 
-1.7.10.4
+2.7.4
 
diff --git a/meta/recipes-bsp/grub/files/gcc8.patch b/meta/recipes-bsp/grub/files/gcc8.patch
deleted file mode 100644
index fa7331f..0000000
--- a/meta/recipes-bsp/grub/files/gcc8.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 563b1da6e6ae7af46cc8354cadb5dab416989f0a Mon Sep 17 00:00:00 2001
-From: Michael Chang <mchang@suse.com>
-Date: Mon, 26 Mar 2018 16:52:34 +0800
-Subject: Fix packed-not-aligned error on GCC 8
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When building with GCC 8, there are several errors regarding packed-not-aligned.
-
-./include/grub/gpt_partition.h:79:1: error: alignment 1 of ‘struct grub_gpt_partentry’ is less than 8 [-Werror=packed-not-aligned]
-
-This patch fixes the build error by cleaning up the ambiguity of placing
-aligned structure in a packed one. In "struct grub_btrfs_time" and "struct
-grub_gpt_part_type", the aligned attribute seems to be superfluous, and also
-has to be packed, to ensure the structure is bit-to-bit mapped to the format
-laid on disk. I think we could blame to copy and paste error here for the
-mistake. In "struct efi_variable", we have to use grub_efi_packed_guid_t, as
-the name suggests. :)
-
-Signed-off-by: Michael Chang <mchang@suse.com>
-Tested-by: Michael Chang <mchang@suse.com>
-Tested-by: Paul Menzel <paulepanter@users.sourceforge.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-
-Upstream-Status: Backport http://git.savannah.gnu.org/cgit/grub.git/commit/?id=563b1da6e6ae7af46cc8354cadb5dab416989f0a
----
- grub-core/fs/btrfs.c          | 2 +-
- include/grub/efiemu/runtime.h | 2 +-
- include/grub/gpt_partition.h  | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
-index 4849c1c..be19544 100644
---- a/grub-core/fs/btrfs.c
-+++ b/grub-core/fs/btrfs.c
-@@ -175,7 +175,7 @@ struct grub_btrfs_time
- {
-   grub_int64_t sec;
-   grub_uint32_t nanosec;
--} __attribute__ ((aligned (4)));
-+} GRUB_PACKED;
- 
- struct grub_btrfs_inode
- {
-diff --git a/include/grub/efiemu/runtime.h b/include/grub/efiemu/runtime.h
-index 9b6b729..36d2ded 100644
---- a/include/grub/efiemu/runtime.h
-+++ b/include/grub/efiemu/runtime.h
-@@ -29,7 +29,7 @@ struct grub_efiemu_ptv_rel
- 
- struct efi_variable
- {
--  grub_efi_guid_t guid;
-+  grub_efi_packed_guid_t guid;
-   grub_uint32_t namelen;
-   grub_uint32_t size;
-   grub_efi_uint32_t attributes;
-diff --git a/include/grub/gpt_partition.h b/include/grub/gpt_partition.h
-index 1b32f67..9668a68 100644
---- a/include/grub/gpt_partition.h
-+++ b/include/grub/gpt_partition.h
-@@ -28,7 +28,7 @@ struct grub_gpt_part_type
-   grub_uint16_t data2;
-   grub_uint16_t data3;
-   grub_uint8_t data4[8];
--} __attribute__ ((aligned(8)));
-+} GRUB_PACKED;
- typedef struct grub_gpt_part_type grub_gpt_part_type_t;
- 
- #define GRUB_GPT_PARTITION_TYPE_EMPTY \
--- 
-cgit v1.0-41-gc330
-
diff --git a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
index ffc2d40..2689026 100644
--- a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
+++ b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
@@ -1,13 +1,14 @@
-From 7461a3de38b66edbe2f5593f9bdab9f2704d32bc Mon Sep 17 00:00:00 2001
+From 917133acc701dbc4636165d3b08d15dc5829a06f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Aug 2016 04:06:34 -0400
 Subject: [PATCH] grub module explicitly keeps symbole .module_license
 
 While using oe-core toolchain to strip grub module 'all_video.mod',
 it stripped symbol table:
---------------
-root@localhost:~# objdump -t all_video.mod
 
+---------------
+root@localhost:~# objdump -t all_video.mod
+ 
 all_video.mod:     file format elf64-x86-64
 
 SYMBOL TABLE:
@@ -43,16 +44,16 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  grub-core/genmod.sh.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: grub-2.02/grub-core/genmod.sh.in
-===================================================================
---- grub-2.02.orig/grub-core/genmod.sh.in
-+++ grub-2.02/grub-core/genmod.sh.in
-@@ -56,7 +56,7 @@ if test x@TARGET_APPLE_LINKER@ != x1; th
+diff --git a/grub-core/genmod.sh.in b/grub-core/genmod.sh.in
+index 1250589..dd14308 100644
+--- a/grub-core/genmod.sh.in
++++ b/grub-core/genmod.sh.in
+@@ -56,7 +56,7 @@ if test x@TARGET_APPLE_LINKER@ != x1; then
  	if test x@platform@ != xemu; then
  	    @TARGET_STRIP@ --strip-unneeded \
  		-K grub_mod_init -K grub_mod_fini \
 -		-K _grub_mod_init -K _grub_mod_fini \
 +		-K _grub_mod_init -K _grub_mod_fini -K .module_license \
  		-R .note.gnu.gold-version -R .note.GNU-stack \
- 		-R .note -R .comment -R .ARM.exidx $tmpfile || exit 1
- 	fi
+ 		-R .gnu.build.attributes \
+ 		-R .rel.gnu.build.attributes \
diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
similarity index 100%
rename from meta/recipes-bsp/grub/grub-efi_2.02.bb
rename to meta/recipes-bsp/grub/grub-efi_2.04.bb
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index c5ff10e..13e21d7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -13,18 +13,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
-           file://gcc8.patch \
-           file://0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch \
-           file://0001-grub-setup-Debug-message-cleanup.patch \
 "
-SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
-SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
+SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
+SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
 
-DEPENDS = "flex-native bison-native"
+DEPENDS = "flex-native bison-native gettext-native"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST_armv7a = 'null'
@@ -45,6 +41,7 @@ EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --enable-liblzma=no \
                 --enable-libzfs=no \
                 --enable-largefile \
+                --disable-werror \
 "
 
 PACKAGECONFIG ??= ""
@@ -62,8 +59,6 @@ BUILD_LDFLAGS = ""
 
 export PYTHON = "python3"
 
-CFLAGS_append = " -Wno-error"
-
 do_configure_prepend() {
 	( cd ${S}
 	${S}/autogen.sh )
diff --git a/meta/recipes-bsp/grub/grub_2.02.bb b/meta/recipes-bsp/grub/grub_2.04.bb
similarity index 100%
rename from meta/recipes-bsp/grub/grub_2.02.bb
rename to meta/recipes-bsp/grub/grub_2.04.bb
-- 
2.7.4


