Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2AB6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 09:42:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA29gPTe000715
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Nov 2018 02:42:25 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 2 Nov 2018 02:42:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 2 Nov 2018 17:52:50 +0800
Message-ID: <1541152371-10525-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [1/2 PATCH] elfutils: 0.173 -> 0.174
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
X-List-Received-Date: Fri, 02 Nov 2018 09:42:25 -0000
Content-Type: text/plain

- Drop backport fixes
  CVE-2018-16062.patch
  0001-libdw-Check-end-of-attributes-list-consistently.patch
  0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch

- Rebase 0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{elfutils_0.173.bb => elfutils_0.174.bb}       |   7 +-
 ...Check-end-of-attributes-list-consistently.patch |  84 ---
 ...rn-error-if-elf_compress_gnu-is-used-on-S.patch |  59 --
 ...de-alternatives-for-glibc-assumptions-hel.patch | 808 +--------------------
 .../elfutils/files/CVE-2018-16062.patch            |  79 --
 5 files changed, 22 insertions(+), 1015 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.173.bb => elfutils_0.174.bb} (90%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libdw-Check-end-of-attributes-list-consistently.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/CVE-2018-16062.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.173.bb b/meta/recipes-devtools/elfutils/elfutils_0.174.bb
similarity index 90%
rename from meta/recipes-devtools/elfutils/elfutils_0.173.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.174.bb
index 00dab65..88add7b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.173.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.174.bb
@@ -28,14 +28,11 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/ignore_strmerge.diff \
            file://debian/0001-fix-gcc7-ftbfs.patch \
            file://debian/0001-disable_werror.patch \
-           file://CVE-2018-16062.patch \
-           file://0001-libdw-Check-end-of-attributes-list-consistently.patch \
-           file://0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
-SRC_URI[md5sum] = "35decb1ebfb90d565e4c411bee4185cc"
-SRC_URI[sha256sum] = "b76d8c133f68dad46250f5c223482c8299d454a69430d9aa5c19123345a000ff"
+SRC_URI[md5sum] = "48bec24c0c8b2c16820326956dff9378"
+SRC_URI[sha256sum] = "cdf27e70076e10a29539d89e367101d516bc4aa11b0d7777fe52139e3fcad08a"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-libdw-Check-end-of-attributes-list-consistently.patch b/meta/recipes-devtools/elfutils/files/0001-libdw-Check-end-of-attributes-list-consistently.patch
deleted file mode 100644
index fb7f8b1..0000000
--- a/meta/recipes-devtools/elfutils/files/0001-libdw-Check-end-of-attributes-list-consistently.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 146456c537de5ac7c80608f88babbba026cca03b Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Sat, 18 Aug 2018 19:51:27 +0200
-Subject: [PATCH 1/2] libdw: Check end of attributes list consistently.
-
-dwarf_child (__libdw_find_attr), dwarf_getabbrevattr[_data] and
-dwarf_getattrs all assume the end of the attribute list is when
-both the name (code) and form of the attribute are zero.
-
-dwarf_getabbrev (__libdw_getabbrev) and dwarf_hasattr assume the
-end of the attribute list is when either the name (code) or the
-form of the attribute is zero.
-
-The DWARF spec says: "The series of attribute specifications ends
-with an entry containing 0 for the name and 0 for the form." So
-the first check is correct.
-
-Make sure dwarf_getabbrev and dwarf_hasattr use the same check.
-This is important since all other functions expect dwarf_getabbrev
-(__libdw_getabbrev) to have done a data sanity check of the attribute.
-So if the ending condition is different it could cause a crash.
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=23529
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=6983e59b727458a6c64d9659c85f08218bc4fcda]
-CVE: CVE-2018-16403
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- libdw/ChangeLog         | 7 +++++++
- libdw/dwarf_getabbrev.c | 2 +-
- libdw/dwarf_hasattr.c   | 4 ++--
- 3 files changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/libdw/ChangeLog b/libdw/ChangeLog
-index 9e43ea9..f3cf5d3 100644
---- a/libdw/ChangeLog
-+++ b/libdw/ChangeLog
-@@ -1,5 +1,12 @@
- 2018-08-18  Mark Wielaard  <mark@klomp.org>
- 
-+	* dwarf_getabbrev.c (__libdw_getabbrev): Continue until both name
-+	and form are zero.
-+	* dwarf_hasattr.c (dwarf_hasattr): Stop when both name and form
-+	are zero.
-+
-+2018-08-18  Mark Wielaard  <mark@klomp.org>
-+
- 	* dwarf_getaranges.c (dwarf_getaranges.c): Make sure there is enough
- 	data to read the address and segment size.
- 
-diff --git a/libdw/dwarf_getabbrev.c b/libdw/dwarf_getabbrev.c
-index 988d12c..6a7e981 100644
---- a/libdw/dwarf_getabbrev.c
-+++ b/libdw/dwarf_getabbrev.c
-@@ -140,7 +140,7 @@ __libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu, Dwarf_Off offset,
- 	  get_sleb128 (formval, abbrevp, end);
- 	}
-     }
--  while (attrname != 0 && attrform != 0);
-+  while (attrname != 0 || attrform != 0);
- 
-   /* Return the length to the caller if she asked for it.  */
-   if (lengthp != NULL)
-diff --git a/libdw/dwarf_hasattr.c b/libdw/dwarf_hasattr.c
-index 90053b1..eca0839 100644
---- a/libdw/dwarf_hasattr.c
-+++ b/libdw/dwarf_hasattr.c
-@@ -60,8 +60,8 @@ dwarf_hasattr (Dwarf_Die *die, unsigned int search_name)
-       unsigned int attr_form;
-       get_uleb128_unchecked (attr_form, attrp);
- 
--      /* We can stop if we found the attribute with value zero.  */
--      if (attr_name == 0 || attr_form == 0)
-+      /* We can stop if we found the end of the attribute list.  */
-+      if (attr_name == 0 && attr_form == 0)
- 	return 0;
- 
-       if (attr_name == search_name)
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch b/meta/recipes-devtools/elfutils/files/0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch
deleted file mode 100644
index 2465924..0000000
--- a/meta/recipes-devtools/elfutils/files/0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From d08572f7c9692c335afdb6f8dde48d77731209c3 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Fri, 28 Sep 2018 10:45:56 +0800
-Subject: [PATCH 2/2] libelf: Return error if elf_compress_gnu is used on
- SHF_COMPRESSED section.
-
-Compressing a section that is already compressed is fine, but useless.
-But it isn't possible to gnu compress (or decompress) a SHF_COMPRESSED
-section since there is no state kept that would tell if the section was
-first GNU compressed or first gabi compressed. Calling elf_compress_gnu
-on a section and then calling elf_compress on it to decompress it twice
-could cause a crash (the other way around is fine). Just disallow it.
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=23528
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=56b18521fb8d46d40fc090c0de9d11a08bc982fa]
-CVE: CVE-2018-16402
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- libelf/elf_compress_gnu.c | 4 +++-
- libelf/libelf.h           | 5 +++++
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/libelf/elf_compress_gnu.c b/libelf/elf_compress_gnu.c
-index c35dc39..dfa7c57 100644
---- a/libelf/elf_compress_gnu.c
-+++ b/libelf/elf_compress_gnu.c
-@@ -80,7 +80,9 @@ elf_compress_gnu (Elf_Scn *scn, int inflate, unsigned int flags)
-       sh_addralign = shdr->sh_addralign;
-     }
- 
--  if ((sh_flags & SHF_ALLOC) != 0)
-+  /* Allocated sections, or sections that are already are compressed
-+     cannot (also) be GNU compressed.  */
-+  if ((sh_flags & SHF_ALLOC) != 0 || (sh_flags & SHF_COMPRESSED))
-     {
-       __libelf_seterrno (ELF_E_INVALID_SECTION_FLAGS);
-       return -1;
-diff --git a/libelf/libelf.h b/libelf/libelf.h
-index 547c0f5..fa568f7 100644
---- a/libelf/libelf.h
-+++ b/libelf/libelf.h
-@@ -366,6 +366,11 @@ extern Elf64_Chdr *elf64_getchdr (Elf_Scn *__scn);
-    It is an error to request compression for a section that already
-    has SHF_COMPRESSED set, or (for elf_compress) to request
-    decompression for an section that doesn't have SHF_COMPRESSED set.
-+   If a section has SHF_COMPRESSED set then calling elf_compress_gnu
-+   will result in an error.  The section has to be decompressed first
-+   using elf_compress.  Calling elf_compress on a section compressed
-+   with elf_compress_gnu is fine, but probably useless.
-+
-    It is always an error to call these functions on SHT_NOBITS
-    sections or if the section has the SHF_ALLOC flag set.
-    elf_compress_gnu will not check whether the section name starts
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
index e88f2c0..0f01a32 100644
--- a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+++ b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
@@ -7,78 +7,23 @@ Subject: [PATCH] build: Provide alternatives for glibc assumptions helps
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Rebase to 0.172
+Rebase to 0.174
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  Makefile.am                      |  2 +-
- lib/color.c                      |  3 ++-
  lib/fixedsizehash.h              |  1 -
- lib/system.h                     | 10 ++++++++++
- lib/xmalloc.c                    |  2 +-
- libasm/asm_end.c                 |  2 +-
- libasm/asm_newscn.c              |  2 +-
- libcpu/i386_gendis.c             |  2 +-
- libcpu/i386_lex.c                |  2 +-
- libcpu/i386_parse.c              |  2 +-
+ lib/system.h                     | 12 +++++++++++-
  libdw/Makefile.am                |  3 ++-
- libdw/libdw_alloc.c              |  2 +-
  libdwfl/dwfl_build_id_find_elf.c |  1 +
  libdwfl/dwfl_error.c             |  4 +++-
  libdwfl/dwfl_module_getdwarf.c   |  1 +
  libdwfl/libdwfl_crc32_file.c     |  9 +++++++++
  libdwfl/linux-kernel-modules.c   |  1 +
- libebl/eblopenbackend.c          |  2 +-
  libelf/elf.h                     |  8 ++++++--
  libelf/libelf.h                  |  1 +
  libelf/libelfP.h                 |  1 +
- src/addr2line.c                  |  2 +-
- src/ar.c                         |  2 +-
- src/arlib.c                      |  2 +-
- src/arlib2.c                     |  2 +-
- src/elfcmp.c                     |  2 +-
- src/elflint.c                    |  2 +-
- src/findtextrel.c                |  2 +-
- src/nm.c                         |  2 +-
- src/objdump.c                    |  2 +-
- src/ranlib.c                     |  2 +-
- src/readelf.c                    |  2 +-
- src/size.c                       |  2 +-
- src/stack.c                      |  2 +-
- src/strings.c                    |  2 +-
- src/strip.c                      |  2 +-
- src/unstrip.c                    |  2 +-
- tests/addrscopes.c               |  2 +-
- tests/allregs.c                  |  2 +-
- tests/backtrace-data.c           |  2 +-
- tests/backtrace-dwarf.c          |  2 +-
- tests/backtrace.c                |  2 +-
- tests/buildid.c                  |  2 +-
- tests/debugaltlink.c             |  2 +-
- tests/debuglink.c                |  2 +-
- tests/deleted.c                  |  2 +-
- tests/dwfl-addr-sect.c           |  2 +-
- tests/dwfl-bug-addr-overflow.c   |  2 +-
- tests/dwfl-bug-fd-leak.c         |  2 +-
- tests/dwfl-bug-getmodules.c      |  2 +-
- tests/dwfl-report-elf-align.c    |  2 +-
- tests/dwfllines.c                |  2 +-
- tests/dwflmodtest.c              |  2 +-
- tests/dwflsyms.c                 |  2 +-
- tests/early-offscn.c             |  2 +-
- tests/ecp.c                      |  2 +-
- tests/find-prologues.c           |  2 +-
- tests/funcretval.c               |  2 +-
- tests/funcscopes.c               |  2 +-
- tests/getsrc_die.c               |  2 +-
- tests/line2addr.c                |  2 +-
- tests/low_high_pc.c              |  2 +-
- tests/rdwrmmap.c                 |  2 +-
- tests/saridx.c                   |  2 +-
- tests/sectiondump.c              |  2 +-
- tests/varlocs.c                  |  2 +-
- tests/vdsosyms.c                 |  2 +-
- 67 files changed, 92 insertions(+), 61 deletions(-)
+ 12 files changed, 37 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
 index 2ff444e..41f77df 100644
@@ -93,26 +38,6 @@ index 2ff444e..41f77df 100644
  
  EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
  	     COPYING COPYING-GPLV2 COPYING-LGPLV3
-diff --git a/lib/color.c b/lib/color.c
-index f62389d..a2a84b4 100644
---- a/lib/color.c
-+++ b/lib/color.c
-@@ -32,13 +32,14 @@
- #endif
- 
- #include <argp.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
- #include "libeu.h"
- #include "color.h"
-+#include "system.h"
- 
- /* Prototype for option handler.  */
- static error_t parse_opt (int key, char *arg, struct argp_state *state);
 diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h
 index dac2a5f..43016fc 100644
 --- a/lib/fixedsizehash.h
@@ -126,10 +51,19 @@ index dac2a5f..43016fc 100644
  #include <system.h>
  
 diff --git a/lib/system.h b/lib/system.h
-index 9203335..1a60131 100644
+index 292082b..308a762 100644
 --- a/lib/system.h
 +++ b/lib/system.h
-@@ -50,6 +50,16 @@
+@@ -30,7 +30,7 @@
+ #define LIB_SYSTEM_H	1
+ 
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <sys/param.h>
+@@ -51,6 +51,16 @@
  #else
  # error "Unknown byte order"
  #endif
@@ -146,89 +80,11 @@ index 9203335..1a60131 100644
  
  #ifndef MAX
  #define MAX(m, n) ((m) < (n) ? (n) : (m))
-diff --git a/lib/xmalloc.c b/lib/xmalloc.c
-index 0cde384..217b054 100644
---- a/lib/xmalloc.c
-+++ b/lib/xmalloc.c
-@@ -30,7 +30,7 @@
- # include <config.h>
- #endif
- 
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stddef.h>
- #include <stdlib.h>
-diff --git a/libasm/asm_end.c b/libasm/asm_end.c
-index ced24f5..4ad918c 100644
---- a/libasm/asm_end.c
-+++ b/libasm/asm_end.c
-@@ -32,7 +32,7 @@
- #endif
- 
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stdio.h>
- #include <stdlib.h>
-diff --git a/libasm/asm_newscn.c b/libasm/asm_newscn.c
-index ddbb25d..74a598d 100644
---- a/libasm/asm_newscn.c
-+++ b/libasm/asm_newscn.c
-@@ -32,7 +32,7 @@
- #endif
- 
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/libcpu/i386_gendis.c b/libcpu/i386_gendis.c
-index aae5eae..6d76016 100644
---- a/libcpu/i386_gendis.c
-+++ b/libcpu/i386_gendis.c
-@@ -31,7 +31,7 @@
- # include <config.h>
- #endif
- 
--#include <error.h>
-+#include <err.h>
- #include <errno.h>
- #include <stdio.h>
- #include <stdlib.h>
-diff --git a/libcpu/i386_lex.c b/libcpu/i386_lex.c
-index facdf71..f13842f 100644
---- a/libcpu/i386_lex.c
-+++ b/libcpu/i386_lex.c
-@@ -571,7 +571,7 @@ char *i386_text;
- #endif
- 
- #include <ctype.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- 
- #include <libeu.h>
-diff --git a/libcpu/i386_parse.c b/libcpu/i386_parse.c
-index 3c5058a..bf402d6 100644
---- a/libcpu/i386_parse.c
-+++ b/libcpu/i386_parse.c
-@@ -107,7 +107,7 @@
- #include <assert.h>
- #include <ctype.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <inttypes.h>
- #include <libintl.h>
- #include <math.h>
 diff --git a/libdw/Makefile.am b/libdw/Makefile.am
-index 41df4f3..e6b275f 100644
+index 7a3d532..7ac1241 100644
 --- a/libdw/Makefile.am
 +++ b/libdw/Makefile.am
-@@ -107,7 +107,8 @@ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
+@@ -108,7 +108,8 @@ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
  libdw_so_LIBS = libdw_pic.a ../libdwelf/libdwelf_pic.a \
  	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a
  libdw_so_DEPS = ../lib/libeu.a ../libelf/libelf.so
@@ -238,19 +94,6 @@ index 41df4f3..e6b275f 100644
  libdw_so_SOURCES =
  libdw.so$(EXEEXT): $(srcdir)/libdw.map $(libdw_so_LIBS) $(libdw_so_DEPS)
  # The rpath is necessary for libebl because its $ORIGIN use will
-diff --git a/libdw/libdw_alloc.c b/libdw/libdw_alloc.c
-index d6af23a..deb724c 100644
---- a/libdw/libdw_alloc.c
-+++ b/libdw/libdw_alloc.c
-@@ -31,7 +31,7 @@
- # include <config.h>
- #endif
- 
--#include <error.h>
-+#include <err.h>
- #include <errno.h>
- #include <stdlib.h>
- #include "libdwP.h"
 diff --git a/libdwfl/dwfl_build_id_find_elf.c b/libdwfl/dwfl_build_id_find_elf.c
 index cc6c3f6..b06ab59 100644
 --- a/libdwfl/dwfl_build_id_find_elf.c
@@ -329,21 +172,8 @@ index 9d0fef2..9fc09b8 100644
  #include <inttypes.h>
  #include <errno.h>
  #include <stdio.h>
-diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
-index 8b063f4..9bdeead 100644
---- a/libebl/eblopenbackend.c
-+++ b/libebl/eblopenbackend.c
-@@ -32,7 +32,7 @@
- 
- #include <assert.h>
- #include <dlfcn.h>
--#include <error.h>
-+#include <err.h>
- #include <libelfP.h>
- #include <dwarf.h>
- #include <stdlib.h>
 diff --git a/libelf/elf.h b/libelf/elf.h
-index f774898..be277d0 100644
+index 5dc632b..14da1b7 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
 @@ -21,7 +21,9 @@
@@ -357,7 +187,7 @@ index f774898..be277d0 100644
  
  /* Standard ELF types.  */
  
-@@ -3912,6 +3914,8 @@ enum
+@@ -3937,6 +3939,8 @@ enum
  #define R_METAG_TLS_LE_HI16	60
  #define R_METAG_TLS_LE_LO16	61
  
@@ -368,7 +198,7 @@ index f774898..be277d0 100644
  
  #endif	/* elf.h */
 diff --git a/libelf/libelf.h b/libelf/libelf.h
-index 547c0f5..dd78799 100644
+index d11358c..4cf9272 100644
 --- a/libelf/libelf.h
 +++ b/libelf/libelf.h
 @@ -29,6 +29,7 @@
@@ -380,7 +210,7 @@ index 547c0f5..dd78799 100644
  #include <sys/types.h>
  
 diff --git a/libelf/libelfP.h b/libelf/libelfP.h
-index ca805ac..47f25c2 100644
+index ed216c8..415e6f6 100644
 --- a/libelf/libelfP.h
 +++ b/libelf/libelfP.h
 @@ -32,6 +32,7 @@
@@ -391,604 +221,6 @@ index ca805ac..47f25c2 100644
  
  #include <errno.h>
  #include <stdbool.h>
-diff --git a/src/addr2line.c b/src/addr2line.c
-index 5acafa0..a4920b3 100644
---- a/src/addr2line.c
-+++ b/src/addr2line.c
-@@ -23,7 +23,7 @@
- #include <argp.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <inttypes.h>
- #include <libdwfl.h>
-diff --git a/src/ar.c b/src/ar.c
-index 818115b..2166f1b 100644
---- a/src/ar.c
-+++ b/src/ar.c
-@@ -22,7 +22,7 @@
- 
- #include <argp.h>
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <libintl.h>
-diff --git a/src/arlib.c b/src/arlib.c
-index e0839aa..1143658 100644
---- a/src/arlib.c
-+++ b/src/arlib.c
-@@ -21,7 +21,7 @@
- #endif
- 
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <gelf.h>
- #include <inttypes.h>
- #include <libintl.h>
-diff --git a/src/arlib2.c b/src/arlib2.c
-index 553fc57..46443d0 100644
---- a/src/arlib2.c
-+++ b/src/arlib2.c
-@@ -20,7 +20,7 @@
- # include <config.h>
- #endif
- 
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <limits.h>
- #include <string.h>
-diff --git a/src/elfcmp.c b/src/elfcmp.c
-index 5046420..cff183f 100644
---- a/src/elfcmp.c
-+++ b/src/elfcmp.c
-@@ -23,7 +23,7 @@
- #include <argp.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <locale.h>
- #include <libintl.h>
-diff --git a/src/elflint.c b/src/elflint.c
-index 0a26d97..e45fb39 100644
---- a/src/elflint.c
-+++ b/src/elflint.c
-@@ -24,7 +24,7 @@
- #include <assert.h>
- #include <byteswap.h>
- #include <endian.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-diff --git a/src/findtextrel.c b/src/findtextrel.c
-index 8f1e239..71463af 100644
---- a/src/findtextrel.c
-+++ b/src/findtextrel.c
-@@ -23,7 +23,7 @@
- #include <argp.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <libdw.h>
-diff --git a/src/nm.c b/src/nm.c
-index 969c6d3..3113c04 100644
---- a/src/nm.c
-+++ b/src/nm.c
-@@ -26,7 +26,7 @@
- #include <ctype.h>
- #include <dwarf.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-diff --git a/src/objdump.c b/src/objdump.c
-index 0dd9a6a..9c8bf14 100644
---- a/src/objdump.c
-+++ b/src/objdump.c
-@@ -21,7 +21,7 @@
- #endif
- 
- #include <argp.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <inttypes.h>
- #include <libintl.h>
-diff --git a/src/ranlib.c b/src/ranlib.c
-index cc0ee23..ae851e4 100644
---- a/src/ranlib.c
-+++ b/src/ranlib.c
-@@ -24,7 +24,7 @@
- #include <argp.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <libintl.h>
-diff --git a/src/readelf.c b/src/readelf.c
-index f185897..6623e93 100644
---- a/src/readelf.c
-+++ b/src/readelf.c
-@@ -24,7 +24,7 @@
- #include <ctype.h>
- #include <dwarf.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-diff --git a/src/size.c b/src/size.c
-index ad8dbcb..fd83be0 100644
---- a/src/size.c
-+++ b/src/size.c
-@@ -21,7 +21,7 @@
- #endif
- 
- #include <argp.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-diff --git a/src/stack.c b/src/stack.c
-index 52ae3a8..0fda285 100644
---- a/src/stack.c
-+++ b/src/stack.c
-@@ -18,7 +18,7 @@
- #include <config.h>
- #include <assert.h>
- #include <argp.h>
--#include <error.h>
-+#include <err.h>
- #include <stdlib.h>
- #include <inttypes.h>
- #include <stdio.h>
-diff --git a/src/strings.c b/src/strings.c
-index 03d0f13..5c311cb 100644
---- a/src/strings.c
-+++ b/src/strings.c
-@@ -25,7 +25,7 @@
- #include <ctype.h>
- #include <endian.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-diff --git a/src/strip.c b/src/strip.c
-index 773ed54..ff05f46 100644
---- a/src/strip.c
-+++ b/src/strip.c
-@@ -24,7 +24,7 @@
- #include <assert.h>
- #include <byteswap.h>
- #include <endian.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <fnmatch.h>
- #include <gelf.h>
-diff --git a/src/unstrip.c b/src/unstrip.c
-index f368e69..5ca83d0 100644
---- a/src/unstrip.c
-+++ b/src/unstrip.c
-@@ -31,7 +31,7 @@
- #include <argp.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <fnmatch.h>
- #include <libintl.h>
-diff --git a/tests/addrscopes.c b/tests/addrscopes.c
-index 791569f..54f4311 100644
---- a/tests/addrscopes.c
-+++ b/tests/addrscopes.c
-@@ -25,7 +25,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- 
- 
-diff --git a/tests/allregs.c b/tests/allregs.c
-index 286f7e3..c9de089 100644
---- a/tests/allregs.c
-+++ b/tests/allregs.c
-@@ -21,7 +21,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- #include <locale.h>
- #include <argp.h>
- #include <assert.h>
-diff --git a/tests/backtrace-data.c b/tests/backtrace-data.c
-index a387d8f..955c27d 100644
---- a/tests/backtrace-data.c
-+++ b/tests/backtrace-data.c
-@@ -27,7 +27,7 @@
- #include <dirent.h>
- #include <stdlib.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <unistd.h>
- #include <dwarf.h>
- #if defined(__x86_64__) && defined(__linux__)
-diff --git a/tests/backtrace-dwarf.c b/tests/backtrace-dwarf.c
-index 7ff826c..246650b 100644
---- a/tests/backtrace-dwarf.c
-+++ b/tests/backtrace-dwarf.c
-@@ -21,7 +21,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <unistd.h>
- #include <sys/types.h>
- #include ELFUTILS_HEADER(dwfl)
-diff --git a/tests/backtrace.c b/tests/backtrace.c
-index f5dd761..a93a8f0 100644
---- a/tests/backtrace.c
-+++ b/tests/backtrace.c
-@@ -24,7 +24,7 @@
- #include <dirent.h>
- #include <stdlib.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <unistd.h>
- #include <dwarf.h>
- #ifdef __linux__
-diff --git a/tests/buildid.c b/tests/buildid.c
-index 87c1877..2953e6b 100644
---- a/tests/buildid.c
-+++ b/tests/buildid.c
-@@ -23,7 +23,7 @@
- #include ELFUTILS_HEADER(elf)
- #include ELFUTILS_HEADER(dwelf)
- #include <stdio.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <stdlib.h>
- #include <sys/types.h>
-diff --git a/tests/debugaltlink.c b/tests/debugaltlink.c
-index 6d97d50..ee7e559 100644
---- a/tests/debugaltlink.c
-+++ b/tests/debugaltlink.c
-@@ -23,7 +23,7 @@
- #include ELFUTILS_HEADER(dw)
- #include ELFUTILS_HEADER(dwelf)
- #include <stdio.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <stdlib.h>
- #include <sys/types.h>
-diff --git a/tests/debuglink.c b/tests/debuglink.c
-index 935d102..741cb81 100644
---- a/tests/debuglink.c
-+++ b/tests/debuglink.c
-@@ -21,7 +21,7 @@
- #include <errno.h>
- #include ELFUTILS_HEADER(dwelf)
- #include <stdio.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <stdlib.h>
- #include <sys/types.h>
-diff --git a/tests/deleted.c b/tests/deleted.c
-index 6be35bc..0190711 100644
---- a/tests/deleted.c
-+++ b/tests/deleted.c
-@@ -21,7 +21,7 @@
- #include <unistd.h>
- #include <assert.h>
- #include <stdio.h>
--#include <error.h>
-+#include <err.h>
- #include <errno.h>
- #ifdef __linux__
- #include <sys/prctl.h>
-diff --git a/tests/dwfl-addr-sect.c b/tests/dwfl-addr-sect.c
-index 21e470a..1ea1e3b 100644
---- a/tests/dwfl-addr-sect.c
-+++ b/tests/dwfl-addr-sect.c
-@@ -23,7 +23,7 @@
- #include <stdio_ext.h>
- #include <stdlib.h>
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- #include <locale.h>
- #include <argp.h>
- #include ELFUTILS_HEADER(dwfl)
-diff --git a/tests/dwfl-bug-addr-overflow.c b/tests/dwfl-bug-addr-overflow.c
-index aa8030e..02c8bef 100644
---- a/tests/dwfl-bug-addr-overflow.c
-+++ b/tests/dwfl-bug-addr-overflow.c
-@@ -20,7 +20,7 @@
- #include <inttypes.h>
- #include <stdio.h>
- #include <stdio_ext.h>
--#include <error.h>
-+#include <err.h>
- #include <locale.h>
- #include ELFUTILS_HEADER(dwfl)
- 
-diff --git a/tests/dwfl-bug-fd-leak.c b/tests/dwfl-bug-fd-leak.c
-index 689cdd7..5973da3 100644
---- a/tests/dwfl-bug-fd-leak.c
-+++ b/tests/dwfl-bug-fd-leak.c
-@@ -24,7 +24,7 @@
- #include <dirent.h>
- #include <stdlib.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <unistd.h>
- #include <dwarf.h>
- 
-diff --git a/tests/dwfl-bug-getmodules.c b/tests/dwfl-bug-getmodules.c
-index 1ee989f..fd62e65 100644
---- a/tests/dwfl-bug-getmodules.c
-+++ b/tests/dwfl-bug-getmodules.c
-@@ -18,7 +18,7 @@
- #include <config.h>
- #include ELFUTILS_HEADER(dwfl)
- 
--#include <error.h>
-+#include <err.h>
- 
- static const Dwfl_Callbacks callbacks =
-   {
-diff --git a/tests/dwfl-report-elf-align.c b/tests/dwfl-report-elf-align.c
-index a4e97d3..f471587 100644
---- a/tests/dwfl-report-elf-align.c
-+++ b/tests/dwfl-report-elf-align.c
-@@ -20,7 +20,7 @@
- #include <inttypes.h>
- #include <stdio.h>
- #include <stdio_ext.h>
--#include <error.h>
-+#include <err.h>
- #include <locale.h>
- #include <string.h>
- #include <stdlib.h>
-diff --git a/tests/dwfllines.c b/tests/dwfllines.c
-index 90379dd..cbdf6c4 100644
---- a/tests/dwfllines.c
-+++ b/tests/dwfllines.c
-@@ -27,7 +27,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- 
- int
- main (int argc, char *argv[])
-diff --git a/tests/dwflmodtest.c b/tests/dwflmodtest.c
-index 0027f96..e68d3bc 100644
---- a/tests/dwflmodtest.c
-+++ b/tests/dwflmodtest.c
-@@ -23,7 +23,7 @@
- #include <stdio_ext.h>
- #include <stdlib.h>
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- #include <locale.h>
- #include <argp.h>
- #include ELFUTILS_HEADER(dwfl)
-diff --git a/tests/dwflsyms.c b/tests/dwflsyms.c
-index 49ac334..cf07830 100644
---- a/tests/dwflsyms.c
-+++ b/tests/dwflsyms.c
-@@ -25,7 +25,7 @@
- #include <stdio.h>
- #include <stdio_ext.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- 
- static const char *
-diff --git a/tests/early-offscn.c b/tests/early-offscn.c
-index 924cb9e..6f60d5a 100644
---- a/tests/early-offscn.c
-+++ b/tests/early-offscn.c
-@@ -19,7 +19,7 @@
- #endif
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <stdio.h>
-diff --git a/tests/ecp.c b/tests/ecp.c
-index 38a6859..743cea5 100644
---- a/tests/ecp.c
-+++ b/tests/ecp.c
-@@ -20,7 +20,7 @@
- #endif
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <stdlib.h>
-diff --git a/tests/find-prologues.c b/tests/find-prologues.c
-index ba8ae37..76f5f04 100644
---- a/tests/find-prologues.c
-+++ b/tests/find-prologues.c
-@@ -25,7 +25,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <fnmatch.h>
- 
-diff --git a/tests/funcretval.c b/tests/funcretval.c
-index 8d19d11..c8aaa93 100644
---- a/tests/funcretval.c
-+++ b/tests/funcretval.c
-@@ -25,7 +25,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <fnmatch.h>
- 
-diff --git a/tests/funcscopes.c b/tests/funcscopes.c
-index 9c90185..dbccb89 100644
---- a/tests/funcscopes.c
-+++ b/tests/funcscopes.c
-@@ -25,7 +25,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <fnmatch.h>
- 
-diff --git a/tests/getsrc_die.c b/tests/getsrc_die.c
-index 055aede..9c394dd 100644
---- a/tests/getsrc_die.c
-+++ b/tests/getsrc_die.c
-@@ -19,7 +19,7 @@
- #endif
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <inttypes.h>
- #include <libelf.h>
-diff --git a/tests/line2addr.c b/tests/line2addr.c
-index e0d65d3..9bf0023 100644
---- a/tests/line2addr.c
-+++ b/tests/line2addr.c
-@@ -26,7 +26,7 @@
- #include <locale.h>
- #include <stdlib.h>
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- 
- 
- static void
-diff --git a/tests/low_high_pc.c b/tests/low_high_pc.c
-index 5c6b343..fa0c158 100644
---- a/tests/low_high_pc.c
-+++ b/tests/low_high_pc.c
-@@ -25,7 +25,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <fnmatch.h>
- 
-diff --git a/tests/rdwrmmap.c b/tests/rdwrmmap.c
-index 6f027df..1ce5e6e 100644
---- a/tests/rdwrmmap.c
-+++ b/tests/rdwrmmap.c
-@@ -19,7 +19,7 @@
- #endif
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <stdio.h>
- #include <fcntl.h>
- #include <unistd.h>
-diff --git a/tests/saridx.c b/tests/saridx.c
-index 8a450d8..b387801 100644
---- a/tests/saridx.c
-+++ b/tests/saridx.c
-@@ -17,7 +17,7 @@
- 
- #include <config.h>
- 
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <stdio.h>
-diff --git a/tests/sectiondump.c b/tests/sectiondump.c
-index 3033fed..8e888db 100644
---- a/tests/sectiondump.c
-+++ b/tests/sectiondump.c
-@@ -18,7 +18,7 @@
- #include <config.h>
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-diff --git a/tests/varlocs.c b/tests/varlocs.c
-index f4a711c..1d89a61 100644
---- a/tests/varlocs.c
-+++ b/tests/varlocs.c
-@@ -25,7 +25,7 @@
- #include <dwarf.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-diff --git a/tests/vdsosyms.c b/tests/vdsosyms.c
-index b876c10..afb2823 100644
---- a/tests/vdsosyms.c
-+++ b/tests/vdsosyms.c
-@@ -18,7 +18,7 @@
- #include <config.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <inttypes.h>
- #include <stdio.h>
- #include <string.h>
 -- 
 2.7.4
 
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2018-16062.patch b/meta/recipes-devtools/elfutils/files/CVE-2018-16062.patch
deleted file mode 100644
index cfeb1ca..0000000
--- a/meta/recipes-devtools/elfutils/files/CVE-2018-16062.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 29e31978ba51c1051743a503ee325b5ebc03d7e9 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Sat, 18 Aug 2018 13:27:48 +0200
-Subject: [PATCH] libdw, readelf: Make sure there is enough data to read full
- aranges header.
-
-dwarf_getaranges didn't check if there was enough data left to read both
-the address and segment size. readelf didn't check there was enough data
-left to read the segment size.
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=23541
-
-CVE: CVE-2018-16062
-Upstream-Status: Backport
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
----
- libdw/ChangeLog          | 5 +++++
- libdw/dwarf_getaranges.c | 4 ++++
- src/ChangeLog            | 5 +++++
- src/readelf.c            | 2 ++
- 4 files changed, 16 insertions(+)
-
-diff --git a/libdw/ChangeLog b/libdw/ChangeLog
-index cb4f34e..472d922 100644
---- a/libdw/ChangeLog
-+++ b/libdw/ChangeLog
-@@ -1,3 +1,8 @@
-+2018-08-18  Mark Wielaard  <mark@klomp.org>
-+
-+	* dwarf_getaranges.c (dwarf_getaranges.c): Make sure there is enough
-+	data to read the address and segment size.
-+
- 2018-06-28  Mark Wielaard  <mark@klomp.org>
- 
- 	* dwarf_next_cfi.c (dwarf_next_cfi): Check whether length is zero.
-diff --git a/libdw/dwarf_getaranges.c b/libdw/dwarf_getaranges.c
-index bff9c86..de5b81b 100644
---- a/libdw/dwarf_getaranges.c
-+++ b/libdw/dwarf_getaranges.c
-@@ -148,6 +148,10 @@ dwarf_getaranges (Dwarf *dbg, Dwarf_Aranges **aranges, size_t *naranges)
- 				   length_bytes, &offset, IDX_debug_info, 4))
- 	goto fail;
- 
-+      /* Next up two bytes for address and segment size.  */
-+      if (readp + 2 > readendp)
-+	goto invalid;
-+
-       unsigned int address_size = *readp++;
-       if (unlikely (address_size != 4 && address_size != 8))
- 	goto invalid;
-diff --git a/src/ChangeLog b/src/ChangeLog
-index 8c89f83..2f9f774 100644
---- a/src/ChangeLog
-+++ b/src/ChangeLog
-@@ -1,3 +1,8 @@
-+2018-08-18  Mark Wielaard  <mark@klomp.org>
-+
-+	* readelf.c (print_debug_aranges_section): Make sure there is enough
-+	data to read the header segment size.
-+
- 2018-06-25  Mark Wielaard  <mark@klomp.org>
- 
- 	* readelf.c (print_decoded_line_section): Use dwarf_next_lines
-diff --git a/src/readelf.c b/src/readelf.c
-index 7b5707f..7b488ac 100644
---- a/src/readelf.c
-+++ b/src/readelf.c
-@@ -5447,6 +5447,8 @@ print_debug_aranges_section (Dwfl_Module *dwflmod __attribute__ ((unused)),
- 	  goto next_table;
- 	}
- 
-+      if (readp + 1 > readendp)
-+	goto invalid_data;
-       unsigned int segment_size = *readp++;
-       printf (gettext (" Segment size:  %6" PRIu64 "\n\n"),
- 	      (uint64_t) segment_size);
--- 
-2.9.3
-- 
2.7.4


