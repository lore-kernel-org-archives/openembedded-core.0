Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9856C494
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:27:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2018 07:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,257,1539673200"; d="scan'208";a="87365216"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.31.112])
	by fmsmga007.fm.intel.com with ESMTP; 20 Nov 2018 07:27:25 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 16:27:04 +0100
Message-Id: <20181120152704.71151-4-raphael.kubo.da.costa@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120152704.71151-3-raphael.kubo.da.costa@intel.com>
References: <20181120152704.71151-1-raphael.kubo.da.costa@intel.com>
	<20181120152704.71151-2-raphael.kubo.da.costa@intel.com>
	<20181120152704.71151-3-raphael.kubo.da.costa@intel.com>
MIME-Version: 1.0
Subject: [rocko][PATCH 3/3] elfutils: Fix gcc compile time alignment errors
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
X-List-Received-Date: Tue, 20 Nov 2018 15:27:24 -0000
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Allow devtool to organize the SRC_URI

(From OE-Core rev: 49aae1d75ff1c6a9643c30a8cc5776a2ffa83dd3)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../elfutils/elfutils_0.170.bb                |  40 +++--
 ...ed-structs-follow-the-gcc-memory-lay.patch |  34 +++++
 ...ternatives-for-glibc-assumptions-hel.patch | 144 +++++++++---------
 3 files changed, 124 insertions(+), 94 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-Ensure-that-packed-structs-follow-the-gcc-memory-lay.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.170.bb b/meta/recipes-devtools/elfutils/elfutils_0.170.bb
index 9242aea26b..54d341d190 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.170.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.170.bb
@@ -5,35 +5,33 @@ LICENSE = "(GPLv3 & Elfutils-Exception)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
-SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2"
+SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
+           file://0001-dso-link-change.patch \
+           file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
+           file://0003-fixheadercheck.patch \
+           file://0004-Disable-the-test-to-convert-euc-jp.patch \
+           file://0005-fix-a-stack-usage-warning.patch \
+           file://0006-Fix-build-on-aarch64-musl.patch \
+           file://0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch \
+           file://0001-libasm-may-link-with-libbz2-if-found.patch \
+           file://debian/hppa_backend.diff \
+           file://debian/arm_backend.diff \
+           file://debian/mips_backend.patch \
+           file://debian/mips_readelf_w.patch \
+           file://debian/0001-Ignore-differences-between-mips-machine-identifiers.patch \
+           file://debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
+           file://debian/0003-Add-mips-n64-relocation-format-hack.patch \
+           file://0001-Use-fallthrough-attribute.patch \
+           file://0001-Ensure-that-packed-structs-follow-the-gcc-memory-lay.patch \
+           "
 SRC_URI[md5sum] = "03599aee98c9b726c7a732a2dd0245d5"
 SRC_URI[sha256sum] = "1f844775576b79bdc9f9c717a50058d08620323c1e935458223a12f249c9e066"
 
-SRC_URI += "\
-        file://0001-dso-link-change.patch \
-        file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
-        file://0003-fixheadercheck.patch \
-        file://0004-Disable-the-test-to-convert-euc-jp.patch \
-        file://0005-fix-a-stack-usage-warning.patch \
-        file://0006-Fix-build-on-aarch64-musl.patch \
-        file://0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch \
-        file://0001-libasm-may-link-with-libbz2-if-found.patch \
-"
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
 # Pick patches from debian
 # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.168-0.2.debian.tar.xz
-SRC_URI += "\
-        file://debian/hppa_backend.diff \
-        file://debian/arm_backend.diff \
-        file://debian/mips_backend.patch \
-        file://debian/mips_readelf_w.patch \
-        file://debian/0001-Ignore-differences-between-mips-machine-identifiers.patch \
-        file://debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
-        file://debian/0003-Add-mips-n64-relocation-format-hack.patch \
-"
 # Fix fallthrough with GCC7
-SRC_URI += "file://0001-Use-fallthrough-attribute.patch"
 
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
diff --git a/meta/recipes-devtools/elfutils/files/0001-Ensure-that-packed-structs-follow-the-gcc-memory-lay.patch b/meta/recipes-devtools/elfutils/files/0001-Ensure-that-packed-structs-follow-the-gcc-memory-lay.patch
new file mode 100644
index 0000000000..cf4d1dfe75
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-Ensure-that-packed-structs-follow-the-gcc-memory-lay.patch
@@ -0,0 +1,34 @@
+From 732913a8c35c7b25c0cbf6903cab1ad6b602b525 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 22 Mar 2018 22:44:03 -0700
+Subject: [PATCH] Ensure that packed structs follow the gcc memory layout
+
+Partial backport of
+https://sourceware.org/git/?p=elfutils.git;a=commit;h=17d7194d291bf91d130b78e06cbe27b290e0376d
+
+Helps fixing alignment errors e.g.
+linux-core-note.c:116:1: error: alignment 2 of 'struct m68k_prstatus
+' is less than 4 [-Werror=packed-not-aligned]
+ ;
+ ^
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=17d7194d291bf91d130b78e06cbe27b290e0376d]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ backends/linux-core-note.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/backends/linux-core-note.c b/backends/linux-core-note.c
+index 5f06c896..9faae4c3 100644
+--- a/backends/linux-core-note.c
++++ b/backends/linux-core-note.c
+@@ -111,7 +111,7 @@ struct EBLHOOK(prstatus)
+   FIELD (INT, pr_fpvalid);
+ }
+ #ifdef ALIGN_PRSTATUS
+-  __attribute__ ((packed, aligned (ALIGN_PRSTATUS)))
++  attribute_packed __attribute__ ((aligned (ALIGN_PRSTATUS)))
+ #endif
+ ;
+ 
diff --git a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
index 8864d44369..a42ce7b358 100644
--- a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+++ b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
@@ -1,4 +1,4 @@
-From 010b0c57e748440eb1ceb3d977875f2488d2b4ce Mon Sep 17 00:00:00 2001
+From ef0981744669149a00dd0439a54dac30de7b56a7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 16 Aug 2017 10:06:26 +0800
 Subject: [PATCH] build: Provide alternatives for glibc assumptions helps
@@ -10,6 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Rebase to 0.170
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  Makefile.am                      |  2 +-
  lib/color.c                      |  3 ++-
@@ -83,7 +84,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  69 files changed, 95 insertions(+), 64 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 2ff444e..41f77df 100644
+index 2ff444e7..41f77df8 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -28,7 +28,7 @@ pkginclude_HEADERS = version.h
@@ -96,7 +97,7 @@ index 2ff444e..41f77df 100644
  EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
  	     COPYING COPYING-GPLV2 COPYING-LGPLV3
 diff --git a/lib/color.c b/lib/color.c
-index f62389d..a2a84b4 100644
+index f62389d5..a2a84b46 100644
 --- a/lib/color.c
 +++ b/lib/color.c
 @@ -32,13 +32,14 @@
@@ -116,7 +117,7 @@ index f62389d..a2a84b4 100644
  /* Prototype for option handler.  */
  static error_t parse_opt (int key, char *arg, struct argp_state *state);
 diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h
-index dac2a5f..43016fc 100644
+index dac2a5f5..43016fc3 100644
 --- a/lib/fixedsizehash.h
 +++ b/lib/fixedsizehash.h
 @@ -30,7 +30,6 @@
@@ -128,7 +129,7 @@ index dac2a5f..43016fc 100644
  #include <system.h>
  
 diff --git a/lib/system.h b/lib/system.h
-index 9203335..1a60131 100644
+index 92033355..1a601319 100644
 --- a/lib/system.h
 +++ b/lib/system.h
 @@ -50,6 +50,16 @@
@@ -149,7 +150,7 @@ index 9203335..1a60131 100644
  #ifndef MAX
  #define MAX(m, n) ((m) < (n) ? (n) : (m))
 diff --git a/lib/xmalloc.c b/lib/xmalloc.c
-index 0cde384..217b054 100644
+index 0cde384f..217b0541 100644
 --- a/lib/xmalloc.c
 +++ b/lib/xmalloc.c
 @@ -30,7 +30,7 @@
@@ -162,7 +163,7 @@ index 0cde384..217b054 100644
  #include <stddef.h>
  #include <stdlib.h>
 diff --git a/libasm/asm_end.c b/libasm/asm_end.c
-index ced24f5..4ad918c 100644
+index ced24f50..4ad918c4 100644
 --- a/libasm/asm_end.c
 +++ b/libasm/asm_end.c
 @@ -32,7 +32,7 @@
@@ -175,7 +176,7 @@ index ced24f5..4ad918c 100644
  #include <stdio.h>
  #include <stdlib.h>
 diff --git a/libasm/asm_newscn.c b/libasm/asm_newscn.c
-index ddbb25d..74a598d 100644
+index ddbb25df..74a598d9 100644
 --- a/libasm/asm_newscn.c
 +++ b/libasm/asm_newscn.c
 @@ -32,7 +32,7 @@
@@ -188,7 +189,7 @@ index ddbb25d..74a598d 100644
  #include <stdlib.h>
  #include <string.h>
 diff --git a/libcpu/i386_gendis.c b/libcpu/i386_gendis.c
-index aae5eae..6d76016 100644
+index aae5eae6..6d760165 100644
 --- a/libcpu/i386_gendis.c
 +++ b/libcpu/i386_gendis.c
 @@ -31,7 +31,7 @@
@@ -201,7 +202,7 @@ index aae5eae..6d76016 100644
  #include <stdio.h>
  #include <stdlib.h>
 diff --git a/libcpu/i386_lex.c b/libcpu/i386_lex.c
-index ba5f4aa..b1e4191 100644
+index ba5f4aa5..b1e41916 100644
 --- a/libcpu/i386_lex.c
 +++ b/libcpu/i386_lex.c
 @@ -577,7 +577,7 @@ char *i386_text;
@@ -214,7 +215,7 @@ index ba5f4aa..b1e4191 100644
  
  #include <libeu.h>
 diff --git a/libcpu/i386_parse.c b/libcpu/i386_parse.c
-index ef1ac35..48f2e64 100644
+index 6fa7ce3d..bb270061 100644
 --- a/libcpu/i386_parse.c
 +++ b/libcpu/i386_parse.c
 @@ -107,7 +107,7 @@
@@ -227,7 +228,7 @@ index ef1ac35..48f2e64 100644
  #include <libintl.h>
  #include <math.h>
 diff --git a/libdw/Makefile.am b/libdw/Makefile.am
-index ff8c291..89e792a 100644
+index ff8c291e..89e792aa 100644
 --- a/libdw/Makefile.am
 +++ b/libdw/Makefile.am
 @@ -105,7 +105,8 @@ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
@@ -241,7 +242,7 @@ index ff8c291..89e792a 100644
  libdw.so$(EXEEXT): $(srcdir)/libdw.map $(libdw_so_LIBS) $(libdw_so_DEPS)
  # The rpath is necessary for libebl because its $ORIGIN use will
 diff --git a/libdw/libdw_alloc.c b/libdw/libdw_alloc.c
-index 28a8cf6..29aeb3f 100644
+index 28a8cf6e..29aeb3f7 100644
 --- a/libdw/libdw_alloc.c
 +++ b/libdw/libdw_alloc.c
 @@ -31,7 +31,7 @@
@@ -254,7 +255,7 @@ index 28a8cf6..29aeb3f 100644
  #include <stdlib.h>
  #include "libdwP.h"
 diff --git a/libdwfl/dwfl_build_id_find_elf.c b/libdwfl/dwfl_build_id_find_elf.c
-index ee0c164..b06ab59 100644
+index ee0c1646..b06ab596 100644
 --- a/libdwfl/dwfl_build_id_find_elf.c
 +++ b/libdwfl/dwfl_build_id_find_elf.c
 @@ -31,6 +31,7 @@
@@ -275,7 +276,7 @@ index ee0c164..b06ab59 100644
  	    {
  	      *file_name = name;
 diff --git a/libdwfl/dwfl_error.c b/libdwfl/dwfl_error.c
-index 7bcf61c..c345797 100644
+index 7bcf61cc..c345797a 100644
 --- a/libdwfl/dwfl_error.c
 +++ b/libdwfl/dwfl_error.c
 @@ -140,6 +140,7 @@ __libdwfl_seterrno (Dwfl_Error error)
@@ -297,7 +298,7 @@ index 7bcf61c..c345797 100644
        return elf_errmsg (error & 0xffff);
      case OTHER_ERROR (LIBDW):
 diff --git a/libdwfl/dwfl_module_getdwarf.c b/libdwfl/dwfl_module_getdwarf.c
-index 9775ace..511c4a6 100644
+index 9775aced..511c4a6a 100644
 --- a/libdwfl/dwfl_module_getdwarf.c
 +++ b/libdwfl/dwfl_module_getdwarf.c
 @@ -35,6 +35,7 @@
@@ -309,7 +310,7 @@ index 9775ace..511c4a6 100644
  #include "../libelf/libelfP.h"
  #include "system.h"
 diff --git a/libdwfl/find-debuginfo.c b/libdwfl/find-debuginfo.c
-index 6d5a42a..9267788 100644
+index 6d5a42a6..9267788d 100644
 --- a/libdwfl/find-debuginfo.c
 +++ b/libdwfl/find-debuginfo.c
 @@ -389,7 +389,7 @@ dwfl_standard_find_debuginfo (Dwfl_Module *mod,
@@ -322,7 +323,7 @@ index 6d5a42a..9267788 100644
  	fd = find_debuginfo_in_path (mod, canon,
  				     debuglink_file, debuglink_crc,
 diff --git a/libdwfl/libdwfl_crc32_file.c b/libdwfl/libdwfl_crc32_file.c
-index f849128..6f0aca1 100644
+index f849128d..6f0aca1b 100644
 --- a/libdwfl/libdwfl_crc32_file.c
 +++ b/libdwfl/libdwfl_crc32_file.c
 @@ -29,6 +29,15 @@
@@ -342,7 +343,7 @@ index f849128..6f0aca1 100644
  #define crc32 __libdwfl_crc32
  #include <libdwflP.h>
 diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
-index 9d0fef2..9fc09b8 100644
+index 9d0fef2c..9fc09b88 100644
 --- a/libdwfl/linux-kernel-modules.c
 +++ b/libdwfl/linux-kernel-modules.c
 @@ -40,6 +40,7 @@
@@ -354,7 +355,7 @@ index 9d0fef2..9fc09b8 100644
  #include <errno.h>
  #include <stdio.h>
 diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
-index 5371396..2e66dfd 100644
+index 53713963..2e66dfdd 100644
 --- a/libebl/eblopenbackend.c
 +++ b/libebl/eblopenbackend.c
 @@ -32,7 +32,7 @@
@@ -367,7 +368,7 @@ index 5371396..2e66dfd 100644
  #include <dwarf.h>
  #include <stdlib.h>
 diff --git a/libelf/elf.h b/libelf/elf.h
-index 5cf2b93..990b3af 100644
+index 5cf2b934..990b3afb 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
 @@ -21,7 +21,9 @@
@@ -392,7 +393,7 @@ index 5cf2b93..990b3af 100644
  
  #endif	/* elf.h */
 diff --git a/libelf/libelf.h b/libelf/libelf.h
-index 547c0f5..dd78799 100644
+index 547c0f50..dd78799e 100644
 --- a/libelf/libelf.h
 +++ b/libelf/libelf.h
 @@ -29,6 +29,7 @@
@@ -404,7 +405,7 @@ index 547c0f5..dd78799 100644
  #include <sys/types.h>
  
 diff --git a/libelf/libelfP.h b/libelf/libelfP.h
-index 7ee6625..5840899 100644
+index 7ee6625a..58408997 100644
 --- a/libelf/libelfP.h
 +++ b/libelf/libelfP.h
 @@ -32,6 +32,7 @@
@@ -416,7 +417,7 @@ index 7ee6625..5840899 100644
  #include <errno.h>
  #include <stdbool.h>
 diff --git a/src/addr2line.c b/src/addr2line.c
-index ba414a7..04b7116 100644
+index 444ee52c..9596fa67 100644
 --- a/src/addr2line.c
 +++ b/src/addr2line.c
 @@ -23,7 +23,7 @@
@@ -429,7 +430,7 @@ index ba414a7..04b7116 100644
  #include <inttypes.h>
  #include <libdwfl.h>
 diff --git a/src/ar.c b/src/ar.c
-index ec32cee..4efd729 100644
+index ec32cee5..4efd729c 100644
 --- a/src/ar.c
 +++ b/src/ar.c
 @@ -22,7 +22,7 @@
@@ -442,7 +443,7 @@ index ec32cee..4efd729 100644
  #include <gelf.h>
  #include <libintl.h>
 diff --git a/src/arlib.c b/src/arlib.c
-index e0839aa..1143658 100644
+index e0839aab..1143658f 100644
 --- a/src/arlib.c
 +++ b/src/arlib.c
 @@ -21,7 +21,7 @@
@@ -455,7 +456,7 @@ index e0839aa..1143658 100644
  #include <inttypes.h>
  #include <libintl.h>
 diff --git a/src/arlib2.c b/src/arlib2.c
-index 553fc57..46443d0 100644
+index 553fc57b..46443d0e 100644
 --- a/src/arlib2.c
 +++ b/src/arlib2.c
 @@ -20,7 +20,7 @@
@@ -468,7 +469,7 @@ index 553fc57..46443d0 100644
  #include <limits.h>
  #include <string.h>
 diff --git a/src/elfcmp.c b/src/elfcmp.c
-index 5046420..cff183f 100644
+index 50464207..cff183fa 100644
 --- a/src/elfcmp.c
 +++ b/src/elfcmp.c
 @@ -23,7 +23,7 @@
@@ -481,7 +482,7 @@ index 5046420..cff183f 100644
  #include <locale.h>
  #include <libintl.h>
 diff --git a/src/elflint.c b/src/elflint.c
-index 51e53c2..da0b0dc 100644
+index df1b3a03..67d8d134 100644
 --- a/src/elflint.c
 +++ b/src/elflint.c
 @@ -24,7 +24,7 @@
@@ -494,7 +495,7 @@ index 51e53c2..da0b0dc 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/findtextrel.c b/src/findtextrel.c
-index 8f1e239..71463af 100644
+index 8f1e239a..71463af3 100644
 --- a/src/findtextrel.c
 +++ b/src/findtextrel.c
 @@ -23,7 +23,7 @@
@@ -507,7 +508,7 @@ index 8f1e239..71463af 100644
  #include <gelf.h>
  #include <libdw.h>
 diff --git a/src/nm.c b/src/nm.c
-index 969c6d3..3113c04 100644
+index 969c6d35..3113c04c 100644
 --- a/src/nm.c
 +++ b/src/nm.c
 @@ -26,7 +26,7 @@
@@ -520,7 +521,7 @@ index 969c6d3..3113c04 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/objdump.c b/src/objdump.c
-index 860cfac..61e67bf 100644
+index 0dd9a6aa..9c8bf149 100644
 --- a/src/objdump.c
 +++ b/src/objdump.c
 @@ -21,7 +21,7 @@
@@ -533,7 +534,7 @@ index 860cfac..61e67bf 100644
  #include <inttypes.h>
  #include <libintl.h>
 diff --git a/src/ranlib.c b/src/ranlib.c
-index cc0ee23..ae851e4 100644
+index cc0ee233..ae851e40 100644
 --- a/src/ranlib.c
 +++ b/src/ranlib.c
 @@ -24,7 +24,7 @@
@@ -546,7 +547,7 @@ index cc0ee23..ae851e4 100644
  #include <gelf.h>
  #include <libintl.h>
 diff --git a/src/readelf.c b/src/readelf.c
-index 346eccd..c831aa8 100644
+index 6a27e7e0..4759a965 100644
 --- a/src/readelf.c
 +++ b/src/readelf.c
 @@ -25,7 +25,7 @@
@@ -559,7 +560,7 @@ index 346eccd..c831aa8 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/size.c b/src/size.c
-index ad8dbcb..fd83be0 100644
+index ad8dbcbb..fd83be06 100644
 --- a/src/size.c
 +++ b/src/size.c
 @@ -21,7 +21,7 @@
@@ -572,7 +573,7 @@ index ad8dbcb..fd83be0 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/stack.c b/src/stack.c
-index 6f2ff69..6da0243 100644
+index 6f2ff69f..6da0243d 100644
 --- a/src/stack.c
 +++ b/src/stack.c
 @@ -18,7 +18,7 @@
@@ -585,7 +586,7 @@ index 6f2ff69..6da0243 100644
  #include <inttypes.h>
  #include <stdio.h>
 diff --git a/src/strings.c b/src/strings.c
-index d214356..76cb26b 100644
+index 03d0f133..5c311cbd 100644
 --- a/src/strings.c
 +++ b/src/strings.c
 @@ -25,7 +25,7 @@
@@ -598,7 +599,7 @@ index d214356..76cb26b 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/src/strip.c b/src/strip.c
-index c7830ec..0d7f148 100644
+index c7830ec6..0d7f148d 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -24,7 +24,7 @@
@@ -611,7 +612,7 @@ index c7830ec..0d7f148 100644
  #include <fnmatch.h>
  #include <gelf.h>
 diff --git a/src/unstrip.c b/src/unstrip.c
-index 5074909..3d4f952 100644
+index 50749093..3d4f9525 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -31,7 +31,7 @@
@@ -624,7 +625,7 @@ index 5074909..3d4f952 100644
  #include <fnmatch.h>
  #include <libintl.h>
 diff --git a/tests/addrscopes.c b/tests/addrscopes.c
-index 791569f..54f4311 100644
+index 791569f5..54f4311b 100644
 --- a/tests/addrscopes.c
 +++ b/tests/addrscopes.c
 @@ -25,7 +25,7 @@
@@ -637,7 +638,7 @@ index 791569f..54f4311 100644
  
  
 diff --git a/tests/allregs.c b/tests/allregs.c
-index 286f7e3..c9de089 100644
+index 286f7e3c..c9de0897 100644
 --- a/tests/allregs.c
 +++ b/tests/allregs.c
 @@ -21,7 +21,7 @@
@@ -650,7 +651,7 @@ index 286f7e3..c9de089 100644
  #include <argp.h>
  #include <assert.h>
 diff --git a/tests/backtrace-data.c b/tests/backtrace-data.c
-index a387d8f..955c27d 100644
+index a387d8ff..955c27d1 100644
 --- a/tests/backtrace-data.c
 +++ b/tests/backtrace-data.c
 @@ -27,7 +27,7 @@
@@ -663,7 +664,7 @@ index a387d8f..955c27d 100644
  #include <dwarf.h>
  #if defined(__x86_64__) && defined(__linux__)
 diff --git a/tests/backtrace-dwarf.c b/tests/backtrace-dwarf.c
-index 2dc8a9a..24ca7fb 100644
+index 2dc8a9a2..24ca7fb0 100644
 --- a/tests/backtrace-dwarf.c
 +++ b/tests/backtrace-dwarf.c
 @@ -22,7 +22,7 @@
@@ -676,7 +677,7 @@ index 2dc8a9a..24ca7fb 100644
  #include <sys/types.h>
  #include <sys/wait.h>
 diff --git a/tests/backtrace.c b/tests/backtrace.c
-index 21abe8a..d733248 100644
+index f5dd761f..a93a8f03 100644
 --- a/tests/backtrace.c
 +++ b/tests/backtrace.c
 @@ -24,7 +24,7 @@
@@ -689,7 +690,7 @@ index 21abe8a..d733248 100644
  #include <dwarf.h>
  #ifdef __linux__
 diff --git a/tests/buildid.c b/tests/buildid.c
-index 87c1877..2953e6b 100644
+index 87c18773..2953e6bb 100644
 --- a/tests/buildid.c
 +++ b/tests/buildid.c
 @@ -23,7 +23,7 @@
@@ -702,7 +703,7 @@ index 87c1877..2953e6b 100644
  #include <stdlib.h>
  #include <sys/types.h>
 diff --git a/tests/debugaltlink.c b/tests/debugaltlink.c
-index 6d97d50..ee7e559 100644
+index 6d97d500..ee7e559e 100644
 --- a/tests/debugaltlink.c
 +++ b/tests/debugaltlink.c
 @@ -23,7 +23,7 @@
@@ -715,7 +716,7 @@ index 6d97d50..ee7e559 100644
  #include <stdlib.h>
  #include <sys/types.h>
 diff --git a/tests/debuglink.c b/tests/debuglink.c
-index 935d102..741cb81 100644
+index 935d1029..741cb814 100644
 --- a/tests/debuglink.c
 +++ b/tests/debuglink.c
 @@ -21,7 +21,7 @@
@@ -728,7 +729,7 @@ index 935d102..741cb81 100644
  #include <stdlib.h>
  #include <sys/types.h>
 diff --git a/tests/deleted.c b/tests/deleted.c
-index 6be35bc..0190711 100644
+index 6be35bc2..01907113 100644
 --- a/tests/deleted.c
 +++ b/tests/deleted.c
 @@ -21,7 +21,7 @@
@@ -741,7 +742,7 @@ index 6be35bc..0190711 100644
  #ifdef __linux__
  #include <sys/prctl.h>
 diff --git a/tests/dwfl-addr-sect.c b/tests/dwfl-addr-sect.c
-index 21e470a..1ea1e3b 100644
+index 21e470a3..1ea1e3b2 100644
 --- a/tests/dwfl-addr-sect.c
 +++ b/tests/dwfl-addr-sect.c
 @@ -23,7 +23,7 @@
@@ -754,7 +755,7 @@ index 21e470a..1ea1e3b 100644
  #include <argp.h>
  #include ELFUTILS_HEADER(dwfl)
 diff --git a/tests/dwfl-bug-addr-overflow.c b/tests/dwfl-bug-addr-overflow.c
-index aa8030e..02c8bef 100644
+index aa8030e1..02c8bef9 100644
 --- a/tests/dwfl-bug-addr-overflow.c
 +++ b/tests/dwfl-bug-addr-overflow.c
 @@ -20,7 +20,7 @@
@@ -767,7 +768,7 @@ index aa8030e..02c8bef 100644
  #include ELFUTILS_HEADER(dwfl)
  
 diff --git a/tests/dwfl-bug-fd-leak.c b/tests/dwfl-bug-fd-leak.c
-index 689cdd7..5973da3 100644
+index 689cdd79..5973da39 100644
 --- a/tests/dwfl-bug-fd-leak.c
 +++ b/tests/dwfl-bug-fd-leak.c
 @@ -24,7 +24,7 @@
@@ -780,7 +781,7 @@ index 689cdd7..5973da3 100644
  #include <dwarf.h>
  
 diff --git a/tests/dwfl-bug-getmodules.c b/tests/dwfl-bug-getmodules.c
-index 1ee989f..fd62e65 100644
+index 1ee989f8..fd62e653 100644
 --- a/tests/dwfl-bug-getmodules.c
 +++ b/tests/dwfl-bug-getmodules.c
 @@ -18,7 +18,7 @@
@@ -793,7 +794,7 @@ index 1ee989f..fd62e65 100644
  static const Dwfl_Callbacks callbacks =
    {
 diff --git a/tests/dwfl-report-elf-align.c b/tests/dwfl-report-elf-align.c
-index a4e97d3..f471587 100644
+index a4e97d3c..f471587c 100644
 --- a/tests/dwfl-report-elf-align.c
 +++ b/tests/dwfl-report-elf-align.c
 @@ -20,7 +20,7 @@
@@ -806,7 +807,7 @@ index a4e97d3..f471587 100644
  #include <string.h>
  #include <stdlib.h>
 diff --git a/tests/dwfllines.c b/tests/dwfllines.c
-index 90379dd..cbdf6c4 100644
+index 90379dd2..cbdf6c4c 100644
 --- a/tests/dwfllines.c
 +++ b/tests/dwfllines.c
 @@ -27,7 +27,7 @@
@@ -819,7 +820,7 @@ index 90379dd..cbdf6c4 100644
  int
  main (int argc, char *argv[])
 diff --git a/tests/dwflmodtest.c b/tests/dwflmodtest.c
-index 0027f96..e68d3bc 100644
+index 0027f96b..e68d3bca 100644
 --- a/tests/dwflmodtest.c
 +++ b/tests/dwflmodtest.c
 @@ -23,7 +23,7 @@
@@ -832,7 +833,7 @@ index 0027f96..e68d3bc 100644
  #include <argp.h>
  #include ELFUTILS_HEADER(dwfl)
 diff --git a/tests/dwflsyms.c b/tests/dwflsyms.c
-index 49ac334..cf07830 100644
+index 49ac3346..cf078301 100644
 --- a/tests/dwflsyms.c
 +++ b/tests/dwflsyms.c
 @@ -25,7 +25,7 @@
@@ -845,7 +846,7 @@ index 49ac334..cf07830 100644
  
  static const char *
 diff --git a/tests/early-offscn.c b/tests/early-offscn.c
-index 924cb9e..6f60d5a 100644
+index 924cb9ef..6f60d5a3 100644
 --- a/tests/early-offscn.c
 +++ b/tests/early-offscn.c
 @@ -19,7 +19,7 @@
@@ -858,7 +859,7 @@ index 924cb9e..6f60d5a 100644
  #include <gelf.h>
  #include <stdio.h>
 diff --git a/tests/ecp.c b/tests/ecp.c
-index 38a6859..743cea5 100644
+index 38a6859e..743cea5d 100644
 --- a/tests/ecp.c
 +++ b/tests/ecp.c
 @@ -20,7 +20,7 @@
@@ -871,7 +872,7 @@ index 38a6859..743cea5 100644
  #include <gelf.h>
  #include <stdlib.h>
 diff --git a/tests/find-prologues.c b/tests/find-prologues.c
-index ba8ae37..76f5f04 100644
+index ba8ae371..76f5f047 100644
 --- a/tests/find-prologues.c
 +++ b/tests/find-prologues.c
 @@ -25,7 +25,7 @@
@@ -884,7 +885,7 @@ index ba8ae37..76f5f04 100644
  #include <fnmatch.h>
  
 diff --git a/tests/funcretval.c b/tests/funcretval.c
-index 8d19d11..c8aaa93 100644
+index 8d19d117..c8aaa93d 100644
 --- a/tests/funcretval.c
 +++ b/tests/funcretval.c
 @@ -25,7 +25,7 @@
@@ -897,7 +898,7 @@ index 8d19d11..c8aaa93 100644
  #include <fnmatch.h>
  
 diff --git a/tests/funcscopes.c b/tests/funcscopes.c
-index 9c90185..dbccb89 100644
+index 9c901858..dbccb89e 100644
 --- a/tests/funcscopes.c
 +++ b/tests/funcscopes.c
 @@ -25,7 +25,7 @@
@@ -910,7 +911,7 @@ index 9c90185..dbccb89 100644
  #include <fnmatch.h>
  
 diff --git a/tests/getsrc_die.c b/tests/getsrc_die.c
-index 055aede..9c394dd 100644
+index 055aede0..9c394dd0 100644
 --- a/tests/getsrc_die.c
 +++ b/tests/getsrc_die.c
 @@ -19,7 +19,7 @@
@@ -923,7 +924,7 @@ index 055aede..9c394dd 100644
  #include <inttypes.h>
  #include <libelf.h>
 diff --git a/tests/line2addr.c b/tests/line2addr.c
-index e0d65d3..9bf0023 100644
+index e0d65d3d..9bf0023b 100644
 --- a/tests/line2addr.c
 +++ b/tests/line2addr.c
 @@ -26,7 +26,7 @@
@@ -936,7 +937,7 @@ index e0d65d3..9bf0023 100644
  
  static void
 diff --git a/tests/low_high_pc.c b/tests/low_high_pc.c
-index d0f4302..8da4fbd 100644
+index d0f43023..8da4fbdf 100644
 --- a/tests/low_high_pc.c
 +++ b/tests/low_high_pc.c
 @@ -25,7 +25,7 @@
@@ -949,7 +950,7 @@ index d0f4302..8da4fbd 100644
  #include <fnmatch.h>
  
 diff --git a/tests/md5-sha1-test.c b/tests/md5-sha1-test.c
-index d50355e..3c41f40 100644
+index d50355e9..3c41f40b 100644
 --- a/tests/md5-sha1-test.c
 +++ b/tests/md5-sha1-test.c
 @@ -19,7 +19,7 @@
@@ -962,7 +963,7 @@ index d50355e..3c41f40 100644
  #include "md5.h"
  #include "sha1.h"
 diff --git a/tests/rdwrmmap.c b/tests/rdwrmmap.c
-index 6f027df..1ce5e6e 100644
+index 6f027dfe..1ce5e6ed 100644
 --- a/tests/rdwrmmap.c
 +++ b/tests/rdwrmmap.c
 @@ -19,7 +19,7 @@
@@ -975,7 +976,7 @@ index 6f027df..1ce5e6e 100644
  #include <fcntl.h>
  #include <unistd.h>
 diff --git a/tests/saridx.c b/tests/saridx.c
-index 8a450d8..b387801 100644
+index 8a450d82..b3878013 100644
 --- a/tests/saridx.c
 +++ b/tests/saridx.c
 @@ -17,7 +17,7 @@
@@ -988,7 +989,7 @@ index 8a450d8..b387801 100644
  #include <gelf.h>
  #include <stdio.h>
 diff --git a/tests/sectiondump.c b/tests/sectiondump.c
-index 3033fed..8e888db 100644
+index 3033fedc..8e888db3 100644
 --- a/tests/sectiondump.c
 +++ b/tests/sectiondump.c
 @@ -18,7 +18,7 @@
@@ -1001,7 +1002,7 @@ index 3033fed..8e888db 100644
  #include <gelf.h>
  #include <inttypes.h>
 diff --git a/tests/varlocs.c b/tests/varlocs.c
-index c3fba89..e043ea2 100644
+index c3fba89e..e043ea2c 100644
 --- a/tests/varlocs.c
 +++ b/tests/varlocs.c
 @@ -25,7 +25,7 @@
@@ -1014,7 +1015,7 @@ index c3fba89..e043ea2 100644
  #include <sys/types.h>
  #include <sys/stat.h>
 diff --git a/tests/vdsosyms.c b/tests/vdsosyms.c
-index b876c10..afb2823 100644
+index b876c10b..afb28232 100644
 --- a/tests/vdsosyms.c
 +++ b/tests/vdsosyms.c
 @@ -18,7 +18,7 @@
@@ -1026,6 +1027,3 @@ index b876c10..afb2823 100644
  #include <inttypes.h>
  #include <stdio.h>
  #include <string.h>
--- 
-1.8.3.1
-
-- 
2.19.1


