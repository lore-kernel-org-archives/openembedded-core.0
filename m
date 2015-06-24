Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7351175AF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:55:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O8tRTX016053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:55:27 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Jun 2015 01:55:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 01:55:20 -0700
Message-ID: <17d045887ba6d08b0decb808bab1d98aaa14c1c3.1435135356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435135356.git.liezhi.yang@windriver.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] elfutils: 0.161 -> 0.162
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
X-List-Received-Date: Wed, 24 Jun 2015 08:55:29 -0000
Content-Type: text/plain

* Remove backport patch 0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch.
* Update:
  - arm_func_value.patch
  - fixheadercheck.patch
  - redhat-portability.diff

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...f-Fix-dir-traversal-vuln-in-ar-extraction.patch |   59 ----
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
 .../0001-remove-the-unneed-checking.patch          |    0
 .../arm_backend.diff                               |    0
 .../arm_func_value.patch                           |   39 ++-
 .../arm_unwind_ret_mask.patch                      |    0
 .../fixheadercheck.patch                           |   13 +-
 .../hppa_backend.diff                              |    0
 .../m68k_backend.diff                              |    0
 .../mips_backend.diff                              |    0
 .../mips_readelf_w.patch                           |    0
 .../non_linux.patch                                |    0
 .../redhat-portability.diff                        |  282 +++++++++-----------
 .../scanf-format.patch                             |    0
 .../testsuite-ignore-elflint.diff                  |    0
 .../uclibc-support-for-elfutils-0.161.patch        |    0
 .../{elfutils_0.161.bb => elfutils_0.162.bb}       |    7 +-
 17 files changed, 152 insertions(+), 248 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/0001-remove-the-unneed-checking.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/arm_func_value.patch (88%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/arm_unwind_ret_mask.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/fixheadercheck.patch (60%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/m68k_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/mips_readelf_w.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/non_linux.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/redhat-portability.diff (84%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/scanf-format.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/uclibc-support-for-elfutils-0.161.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.161.bb => elfutils_0.162.bb} (93%)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch
deleted file mode 100644
index 7e4e492..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 147018e729e7c22eeabf15b82d26e4bf68a0d18e Mon Sep 17 00:00:00 2001
-From: Alexander Cherepanov <cherepan@mccme.ru>
-Date: Sun, 28 Dec 2014 19:57:19 +0300
-Subject: [PATCH] libelf: Fix dir traversal vuln in ar extraction.
-
-Upstream-Status: Backport
-
-read_long_names terminates names at the first '/' found but then skips
-one character without checking (it's supposed to be '\n'). Hence the
-next name could start with any character including '/'. This leads to
-a directory traversal vulnerability at the time the contents of the
-archive is extracted.
-
-The danger is mitigated by the fact that only one '/' is possible in a
-resulting filename and only in the leading position. Hence only files
-in the root directory can be written via this vuln and only when ar is
-executed as root.
-
-The fix for the vuln is to not skip any characters while looking
-for '/'.
-
-Signed-off-by: Alexander Cherepanov <cherepan@mccme.ru>
----
- libelf/ChangeLog   | 5 +++++
- libelf/elf_begin.c | 5 +----
- 2 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/libelf/ChangeLog b/libelf/ChangeLog
-index 3b88d03..447c354 100644
---- a/libelf/ChangeLog
-+++ b/libelf/ChangeLog
-@@ -1,3 +1,8 @@
-+2014-12-28  Alexander Cherepanov  <cherepan@mccme.ru>
-+
-+	* elf_begin.c (read_long_names): Don't miss '/' right after
-+	another '/'. Fixes a dir traversal vuln in ar extraction.
-+
- 2014-12-18  Ulrich Drepper  <drepper@gmail.com>
- 
- 	* Makefile.am: Suppress output of textrel_check command.
-diff --git a/libelf/elf_begin.c b/libelf/elf_begin.c
-index 30abe0b..cd3756c 100644
---- a/libelf/elf_begin.c
-+++ b/libelf/elf_begin.c
-@@ -749,10 +749,7 @@ read_long_names (Elf *elf)
- 	    }
- 
- 	  /* NUL-terminate the string.  */
--	  *runp = '\0';
--
--	  /* Skip the NUL byte and the \012.  */
--	  runp += 2;
-+	  *runp++ = '\0';
- 
- 	  /* A sanity check.  Somebody might have generated invalid
- 	     archive.  */
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/elfutils/elfutils-0.162/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.162/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-remove-the-unneed-checking.patch b/meta/recipes-devtools/elfutils/elfutils-0.162/0001-remove-the-unneed-checking.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/0001-remove-the-unneed-checking.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.162/0001-remove-the-unneed-checking.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.162/arm_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.162/arm_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/arm_func_value.patch b/meta/recipes-devtools/elfutils/elfutils-0.162/arm_func_value.patch
similarity index 88%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/arm_func_value.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.162/arm_func_value.patch
index eeb2063..2fe4df6 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.161/arm_func_value.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.162/arm_func_value.patch
@@ -12,18 +12,17 @@ can be used from dwfl_module_getsym and elflint.
 Rebase arm_func_value.patch from 0.159 to 0.160
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- backends/arm_init.c          |  1 +
- backends/arm_symbol.c        |  8 ++++++++
- libdwfl/dwfl_module_getsym.c |  2 +-
- libebl/Makefile.am           |  3 ++-
- libebl/ebl-hooks.h           |  3 +++
- libebl/eblsymfuncval.c       | 43 +++++++++++++++++++++++++++++++++++++++++++
- libebl/libebl.h              | 11 +++++++++++
+ backends/arm_init.c          |    1 +
+ backends/arm_symbol.c        |    8 ++++++++
+ libdwfl/dwfl_module_getsym.c |    2 +-
+ libebl/Makefile.am           |    3 ++-
+ libebl/ebl-hooks.h           |    3 +++
+ libebl/eblsymfuncval.c       |   43 ++++++++++++++++++++++++++++++++++++++++++
+ libebl/libebl.h              |   11 +++++++++++
  7 files changed, 69 insertions(+), 2 deletions(-)
- create mode 100644 libebl/eblsymfuncval.c
 
 diff --git a/backends/arm_init.c b/backends/arm_init.c
-index 8b57d3f..2266829 100644
+index 7171186..9f03630 100644
 --- a/backends/arm_init.c
 +++ b/backends/arm_init.c
 @@ -78,6 +78,7 @@ arm_init (elf, machine, eh, ehlen)
@@ -31,18 +30,17 @@ index 8b57d3f..2266829 100644
    HOOK (eh, abi_cfi);
    HOOK (eh, check_reloc_target_type);
 +  HOOK (eh, sym_func_value);
+   HOOK (eh, symbol_type_name);
  
    /* We only unwind the core integer registers.  */
-   eh->frame_nregs = 16;
 diff --git a/backends/arm_symbol.c b/backends/arm_symbol.c
-index cd467ff..49fca55 100644
+index da4a50a..ccea03b 100644
 --- a/backends/arm_symbol.c
 +++ b/backends/arm_symbol.c
-@@ -129,3 +129,11 @@ arm_check_reloc_target_type (Ebl *ebl __attribute__ ((unused)), Elf64_Word sh_ty
- {
+@@ -130,6 +130,14 @@ arm_check_reloc_target_type (Ebl *ebl __attribute__ ((unused)), Elf64_Word sh_ty
    return sh_type == SHT_ARM_EXIDX;
  }
-+
+ 
 +/* ARM EABI says that the low bit indicates whether the function
 +   symbol value is a THUMB function or not.  Mask it off.  */
 +GElf_Addr
@@ -50,6 +48,10 @@ index cd467ff..49fca55 100644
 +{
 +  return val & ~(GElf_Addr)1;
 +}
++
+ const char *
+ arm_symbol_type_name (int type,
+ 		      char *buf __attribute__ ((unused)),
 diff --git a/libdwfl/dwfl_module_getsym.c b/libdwfl/dwfl_module_getsym.c
 index 42d2b67..fb192d7 100644
 --- a/libdwfl/dwfl_module_getsym.c
@@ -78,7 +80,7 @@ index ec4477b..889c21b 100644
  libebl_a_SOURCES = $(gen_SOURCES)
  
 diff --git a/libebl/ebl-hooks.h b/libebl/ebl-hooks.h
-index e1186f8..160a821 100644
+index 2e31446..9df945d 100644
 --- a/libebl/ebl-hooks.h
 +++ b/libebl/ebl-hooks.h
 @@ -191,5 +191,8 @@ bool EBLHOOK(unwind) (Ebl *ebl, Dwarf_Addr pc, ebl_tid_registers_t *setfunc,
@@ -140,10 +142,10 @@ index 0000000..c0b322f
 +  return ebl->sym_func_value (ebl, val);
 +}
 diff --git a/libebl/libebl.h b/libebl/libebl.h
-index bb993bf..40cf635 100644
+index 7dbf460..96c076b 100644
 --- a/libebl/libebl.h
 +++ b/libebl/libebl.h
-@@ -459,6 +459,17 @@ extern bool ebl_unwind (Ebl *ebl, Dwarf_Addr pc, ebl_tid_registers_t *setfunc,
+@@ -472,6 +472,17 @@ extern bool ebl_unwind (Ebl *ebl, Dwarf_Addr pc, ebl_tid_registers_t *setfunc,
  extern bool ebl_resolve_sym_value (Ebl *ebl, GElf_Addr *addr)
     __nonnull_attribute__ (2);
  
@@ -161,6 +163,3 @@ index bb993bf..40cf635 100644
  #ifdef __cplusplus
  }
  #endif
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/arm_unwind_ret_mask.patch b/meta/recipes-devtools/elfutils/elfutils-0.162/arm_unwind_ret_mask.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/arm_unwind_ret_mask.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.162/arm_unwind_ret_mask.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.162/fixheadercheck.patch
similarity index 60%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/fixheadercheck.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.162/fixheadercheck.patch
index 8796e9a..5de3b24 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.161/fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.162/fixheadercheck.patch
@@ -7,18 +7,17 @@ RP 2014/6/11
 
 Upstream-Status: Pending
 
-Index: elfutils-0.158/libelf/elf32_updatenull.c
-===================================================================
---- elfutils-0.158.orig/libelf/elf32_updatenull.c	2012-12-14 22:40:48.000000000 +0000
-+++ elfutils-0.158/libelf/elf32_updatenull.c	2014-06-11 16:35:43.417386291 +0000
-@@ -327,8 +327,8 @@
+diff --git a/libelf/elf32_updatenull.c b/libelf/elf32_updatenull.c
+--- a/libelf/elf32_updatenull.c
++++ b/libelf/elf32_updatenull.c
+@@ -339,8 +339,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
  		     we test for the alignment of the section being large
  		     enough for the largest alignment required by a data
  		     block.  */
 -		  if (unlikely (! powerof2 (shdr->sh_addralign))
--		      || unlikely (shdr->sh_addralign < sh_align))
+-		      || unlikely ((shdr->sh_addralign ?: 1) < sh_align))
 +		  if (shdr->sh_size && (unlikely (! powerof2 (shdr->sh_addralign))
-+		      || unlikely (shdr->sh_addralign < sh_align)))
++		      || unlikely ((shdr->sh_addralign ?: 1) < sh_align)))
  		    {
  		      __libelf_seterrno (ELF_E_INVALID_ALIGN);
  		      return -1;
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.162/hppa_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.162/hppa_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.162/m68k_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/m68k_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.162/m68k_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.162/mips_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.162/mips_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/elfutils-0.162/mips_readelf_w.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.162/mips_readelf_w.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/non_linux.patch b/meta/recipes-devtools/elfutils/elfutils-0.162/non_linux.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/non_linux.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.162/non_linux.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.162/redhat-portability.diff
similarity index 84%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/redhat-portability.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.162/redhat-portability.diff
index 08f25a5..a0ff07d 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.161/redhat-portability.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.162/redhat-portability.diff
@@ -1,47 +1,47 @@
-Rebase to 1.161
+Rebase to 1.162
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- ChangeLog                   | 30 +++++++++++++++++++++++
- backends/ChangeLog          | 12 +++++++++
- backends/Makefile.am        |  2 +-
- config/ChangeLog            |  4 +++
- config/eu.am                | 14 ++++++++---
- configure.ac                | 60 +++++++++++++++++++++++++++++++++++++++++++--
- lib/ChangeLog               |  8 ++++++
- lib/eu-config.h             | 11 +++++++++
- libasm/ChangeLog            |  5 ++++
- libcpu/ChangeLog            |  8 ++++++
- libcpu/i386_disasm.c        |  1 +
- libdw/ChangeLog             | 13 ++++++++++
- libdw/dwarf_begin_elf.c     |  8 ++++++
- libdw/libdw.h               |  2 +-
- libdwfl/ChangeLog           | 20 +++++++++++++++
- libdwfl/linux-core-attach.c | 29 ++++++++++++++++++++++
- libdwfl/linux-pid-attach.c  | 14 +++++++++++
- libebl/ChangeLog            |  5 ++++
- libelf/ChangeLog            | 10 ++++++++
- libelf/common.h             |  4 +--
- libelf/gnuhash_xlate.h      |  6 +++--
- src/ChangeLog               | 30 +++++++++++++++++++++++
- src/Makefile.am             |  5 ++++
- src/addr2line.c             |  4 +--
- src/findtextrel.c           |  6 ++++-
- src/ld.h                    |  2 ++
- src/readelf.c               | 15 ++++++++----
- src/strings.c               | 11 +++++++++
- src/strip.c                 | 20 +++++++++++++--
- tests/ChangeLog             | 14 +++++++++++
- tests/Makefile.am           |  1 +
- tests/backtrace.c           |  1 +
- tests/line2addr.c           |  2 +-
- 33 files changed, 355 insertions(+), 22 deletions(-)
+ ChangeLog                   |   30 +++++++++++++++++++++
+ backends/ChangeLog          |   12 +++++++++
+ backends/Makefile.am        |    2 +-
+ config/ChangeLog            |    4 +++
+ config/eu.am                |   14 +++++++---
+ configure.ac                |   61 +++++++++++++++++++++++++++++++++++++++++--
+ lib/ChangeLog               |    8 ++++++
+ lib/eu-config.h             |   10 +++++++
+ libasm/ChangeLog            |    5 ++++
+ libcpu/ChangeLog            |    8 ++++++
+ libcpu/i386_disasm.c        |    1 +
+ libdw/ChangeLog             |   13 +++++++++
+ libdw/dwarf_begin_elf.c     |    8 ++++++
+ libdw/libdw.h               |    2 +-
+ libdwfl/ChangeLog           |   20 ++++++++++++++
+ libdwfl/linux-core-attach.c |   29 ++++++++++++++++++++
+ libdwfl/linux-pid-attach.c  |   14 ++++++++++
+ libebl/ChangeLog            |    5 ++++
+ libelf/ChangeLog            |   10 +++++++
+ libelf/common.h             |    4 +--
+ libelf/gnuhash_xlate.h      |    6 +++--
+ src/ChangeLog               |   30 +++++++++++++++++++++
+ src/Makefile.am             |    5 ++++
+ src/addr2line.c             |    4 +--
+ src/findtextrel.c           |    6 ++++-
+ src/ld.h                    |    2 ++
+ src/readelf.c               |   15 +++++++----
+ src/strings.c               |   11 ++++++++
+ src/strip.c                 |    6 +++++
+ tests/ChangeLog             |   14 ++++++++++
+ tests/Makefile.am           |    1 +
+ tests/backtrace.c           |    1 +
+ tests/line2addr.c           |    2 +-
+ 33 files changed, 343 insertions(+), 20 deletions(-)
 
 diff --git a/ChangeLog b/ChangeLog
-index f81b302..3f9eaf1 100644
+index d829783..89bfd24 100644
 --- a/ChangeLog
 +++ b/ChangeLog
-@@ -187,6 +187,8 @@
+@@ -253,6 +253,8 @@
  
  2012-01-24  Mark Wielaard  <mjw@redhat.com>
  
@@ -50,7 +50,7 @@ index f81b302..3f9eaf1 100644
  	* COPYING: Fix address. Updated version from gnulib.
  
  2012-01-23  Mark Wielaard  <mjw@redhat.com>
-@@ -205,6 +207,9 @@
+@@ -271,6 +273,9 @@
  
  2011-10-08  Mike Frysinger  <vapier@gentoo.org>
  
@@ -60,7 +60,7 @@ index f81b302..3f9eaf1 100644
  	* configure.ac: Fix use of AC_ARG_ENABLE to handle $enableval correctly.
  
  2011-10-02  Ulrich Drepper  <drepper@gmail.com>
-@@ -226,6 +231,10 @@
+@@ -292,6 +297,10 @@
  
  	* configure.ac (LOCALEDIR, DATADIRNAME): Removed.
  
@@ -71,7 +71,7 @@ index f81b302..3f9eaf1 100644
  2009-09-21  Ulrich Drepper  <drepper@redhat.com>
  
  	* configure.ac: Update for more modern autoconf.
-@@ -234,6 +243,10 @@
+@@ -300,6 +309,10 @@
  
  	* configure.ac (zip_LIBS): Check for liblzma too.
  
@@ -82,7 +82,7 @@ index f81b302..3f9eaf1 100644
  2009-04-19  Roland McGrath  <roland@redhat.com>
  
  	* configure.ac (eu_version): Round down here, not in version.h macros.
-@@ -245,6 +258,8 @@
+@@ -311,6 +324,8 @@
  
  2009-01-23  Roland McGrath  <roland@redhat.com>
  
@@ -91,7 +91,7 @@ index f81b302..3f9eaf1 100644
  	* configure.ac (zlib check): Check for gzdirect, need zlib >= 1.2.2.3.
  
  	* configure.ac (__thread check): Use AC_LINK_IFELSE, in case of
-@@ -325,6 +340,10 @@
+@@ -391,6 +406,10 @@
  	* configure.ac: Add dummy automake conditional to get dependencies
  	for non-generic linker right.  See src/Makefile.am.
  
@@ -102,7 +102,7 @@ index f81b302..3f9eaf1 100644
  2005-11-18  Roland McGrath  <roland@redhat.com>
  
  	* Makefile.am (DISTCHECK_CONFIGURE_FLAGS): New variable.
-@@ -372,6 +391,17 @@
+@@ -438,6 +457,17 @@
  	* Makefile.am (all_SUBDIRS): Add libdwfl.
  	* configure.ac: Write libdwfl/Makefile.
  
@@ -121,10 +121,10 @@ index f81b302..3f9eaf1 100644
  
  	* configure.ac [AH_BOTTOM] (INTDECL, _INTDECL): New macros.
 diff --git a/backends/ChangeLog b/backends/ChangeLog
-index e800d16..6a86248 100644
+index fe61d9c..9599623 100644
 --- a/backends/ChangeLog
 +++ b/backends/ChangeLog
-@@ -433,6 +433,10 @@
+@@ -498,6 +498,10 @@
  	* ppc_attrs.c (ppc_check_object_attribute): Handle tag
  	GNU_Power_ABI_Struct_Return.
  
@@ -135,7 +135,7 @@ index e800d16..6a86248 100644
  2008-10-04  Ulrich Drepper  <drepper@redhat.com>
  
  	* i386_reloc.def: Fix entries for TLS_GOTDESC, TLS_DESC_CALL, and
-@@ -760,6 +764,11 @@
+@@ -825,6 +829,11 @@
  	* sparc_init.c: Likewise.
  	* x86_64_init.c: Likewise.
  
@@ -147,7 +147,7 @@ index e800d16..6a86248 100644
  2005-11-19  Roland McGrath  <roland@redhat.com>
  
  	* ppc64_reloc.def: REL30 -> ADDR30.
-@@ -782,6 +791,9 @@
+@@ -847,6 +856,9 @@
  	* Makefile.am (uninstall): Don't try to remove $(pkgincludedir).
  	(CLEANFILES): Add libebl_$(m).so.
  
@@ -158,10 +158,10 @@ index e800d16..6a86248 100644
  	* ppc64_reloc.def: Likewise.
  
 diff --git a/backends/Makefile.am b/backends/Makefile.am
-index 4d15a5d..507c9df 100644
+index 21d7bd2..fe920c9 100644
 --- a/backends/Makefile.am
 +++ b/backends/Makefile.am
-@@ -131,7 +131,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+@@ -119,7 +119,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
  	$(LINK) -shared -o $(@:.map=.so) \
  		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
  		-Wl,--version-script,$(@:.so=.map) \
@@ -171,10 +171,10 @@ index 4d15a5d..507c9df 100644
  
  libebl_i386.so: $(cpu_i386)
 diff --git a/config/ChangeLog b/config/ChangeLog
-index 1b4e896..058dd88 100644
+index 64b58e1..63b3e90 100644
 --- a/config/ChangeLog
 +++ b/config/ChangeLog
-@@ -71,6 +71,10 @@
+@@ -106,6 +106,10 @@
  
  	* known-dwarf.awk: Use gawk.
  
@@ -186,7 +186,7 @@ index 1b4e896..058dd88 100644
  
  	* elfutils.spec.in: Add more BuildRequires.
 diff --git a/config/eu.am b/config/eu.am
-index faf8add..6ca36a5 100644
+index 70d32de..65af085 100644
 --- a/config/eu.am
 +++ b/config/eu.am
 @@ -1,6 +1,6 @@
@@ -197,7 +197,7 @@ index faf8add..6ca36a5 100644
  ##
  ## This file is part of elfutils.
  ##
-@@ -29,13 +29,21 @@
+@@ -29,6 +29,9 @@
  ## not, see <http://www.gnu.org/licenses/>.
  ##
  
@@ -206,12 +206,18 @@ index faf8add..6ca36a5 100644
 +
  DEFS = -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"${localedir}"'
  AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
+ 
+@@ -38,12 +41,17 @@ STACK_USAGE_WARNING=-Wstack-usage=262144
+ else
+ STACK_USAGE_WARNING=
+ endif
 -AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
 +AM_CFLAGS = -std=gnu99 -Wall -Wshadow \
  	    $(if $($(*F)_no_Werror),,-Werror) \
 -	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
 +	    $(if $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) \
 +	    $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
+ 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
  	    $($(*F)_CFLAGS)
  
 +if BUILD_WERROR
@@ -220,14 +226,14 @@ index faf8add..6ca36a5 100644
 +
  COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage, $(COMPILE))
  
- %.os: %.c %.o
+ DEFS.os = -DPIC -DSHARED
 diff --git a/configure.ac b/configure.ac
-index 0e67a79..a1ad6db 100644
+index bc9ff56..27a1ef3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -89,6 +89,54 @@ CFLAGS="$old_CFLAGS"])
+@@ -106,6 +106,55 @@ CFLAGS="$old_CFLAGS"])
  AS_IF([test "x$ac_cv_c99" != xyes],
-       AC_MSG_ERROR([gcc with C99 support required]))
+       AC_MSG_ERROR([gcc with GNU99 support required]))
  
 +AC_CACHE_CHECK([for -Wextra option to $CC], ac_cv_cc_wextra, [dnl
 +old_CFLAGS="$CFLAGS"
@@ -277,10 +283,11 @@ index 0e67a79..a1ad6db 100644
 +AS_IF([test "x$ac_cv_popcount" = xyes],
 +      [AC_DEFINE([HAVE_BUILTIN_POPCOUNT], [1], [Have __builtin_popcount.])])
 +
++
  AC_CACHE_CHECK([for __thread support], ac_cv_tls, [dnl
  # Use the same flags that we use for our DSOs, so the test is representative.
  # Some old compiler/linker/libc combinations fail some ways and not others.
-@@ -104,7 +152,10 @@ static __thread int a; int foo (int b) { return a + b; }]],
+@@ -122,7 +171,10 @@ static __thread int a; int foo (int b) { return a + b; }]],
  CFLAGS="$save_CFLAGS"
  LDFLAGS="$save_LDFLAGS"])
  AS_IF([test "x$ac_cv_tls" != xyes],
@@ -292,7 +299,7 @@ index 0e67a79..a1ad6db 100644
  
  dnl This test must come as early as possible after the compiler configuration
  dnl tests, because the choice of the file model can (in principle) affect
-@@ -183,6 +234,11 @@ AM_CONDITIONAL(USE_VALGRIND, test "$use_valgrind" = yes)
+@@ -224,6 +276,11 @@ AM_CONDITIONAL(USE_VALGRIND, test "$use_valgrind" = yes)
  AM_CONDITIONAL(BUILD_STATIC, [dnl
  test "$use_gprof" = yes -o "$use_gcov" = yes])
  
@@ -304,20 +311,20 @@ index 0e67a79..a1ad6db 100644
  AC_ARG_ENABLE([tests-rpath],
  AS_HELP_STRING([--enable-tests-rpath],[build $ORIGIN-using rpath into tests]),
  	       [tests_use_rpath=$enableval], [tests_use_rpath=no])
-@@ -302,7 +358,7 @@ case "$eu_version" in
+@@ -388,7 +445,7 @@ case "$eu_version" in
  esac
  
  # Round up to the next release API (x.y) version.
 -eu_version=$(( (eu_version + 999) / 1000 ))
 +eu_version=`expr \( $eu_version + 999 \) / 1000`
  
- AC_CHECK_SIZEOF(long)
- 
+ dnl Unique ID for this build.
+ MODVERSION="Build for ${LIBEBL_SUBDIR} ${eu_version} ${ac_cv_build}"
 diff --git a/lib/ChangeLog b/lib/ChangeLog
-index 4415213..4911cc1 100644
+index d04bf17..720c98d 100644
 --- a/lib/ChangeLog
 +++ b/lib/ChangeLog
-@@ -65,6 +65,9 @@
+@@ -73,6 +73,9 @@
  
  2009-01-23  Roland McGrath  <roland@redhat.com>
  
@@ -327,7 +334,7 @@ index 4415213..4911cc1 100644
  	* eu-config.h: Add multiple inclusion protection.
  
  2009-01-17  Ulrich Drepper  <drepper@redhat.com>
-@@ -121,6 +124,11 @@
+@@ -129,6 +132,11 @@
  	* Makefile.am (libeu_a_SOURCES): Add it.
  	* system.h: Declare crc32_file.
  
@@ -340,10 +347,10 @@ index 4415213..4911cc1 100644
  
  	* Makefile.am: Use -ffunction-sections for xmalloc.c.
 diff --git a/lib/eu-config.h b/lib/eu-config.h
-index 3afff26..d89f3a8 100644
+index 400cdc6..872f6bc 100644
 --- a/lib/eu-config.h
 +++ b/lib/eu-config.h
-@@ -162,6 +162,17 @@ asm (".section predict_data, \"aw\"; .previous\n"
+@@ -163,6 +163,16 @@ asm (".section predict_data, \"aw\"; .previous\n"
  /* This macro is used by the tests conditionalize for standalone building.  */
  #define ELFUTILS_HEADER(name) <lib##name.h>
  
@@ -357,9 +364,8 @@ index 3afff26..d89f3a8 100644
 +  return ((n + (n >> 3)) & 030707070707) % 63;
 +}
 +#endif	/* HAVE_BUILTIN_POPCOUNT */
-+
  
- #ifdef SHARED
+ #ifdef SYMBOL_VERSIONING
  # define OLD_VERSION(name, version) \
 diff --git a/libasm/ChangeLog b/libasm/ChangeLog
 index 9b25af9..32b9fd0 100644
@@ -416,10 +422,10 @@ index 832241f..c7a0df0 100644
  		    }
  		  else
 diff --git a/libdw/ChangeLog b/libdw/ChangeLog
-index abc2d71..a9ee0b0 100644
+index 487e34a..06c737b 100644
 --- a/libdw/ChangeLog
 +++ b/libdw/ChangeLog
-@@ -717,6 +717,10 @@
+@@ -889,6 +889,10 @@
  
  	* Makefile.am (known-dwarf.h): Run gawk on config/known-dwarf.awk.
  
@@ -430,7 +436,7 @@ index abc2d71..a9ee0b0 100644
  2011-07-14  Mark Wielaard  <mjw@redhat.com>
  
  	* libdw.h (dwarf_offdie): Fix documentation to mention .debug_info.
-@@ -1076,6 +1080,10 @@
+@@ -1248,6 +1252,10 @@
  
  	* dwarf_hasattr_integrate.c: Integrate DW_AT_specification too.
  
@@ -441,7 +447,7 @@ index abc2d71..a9ee0b0 100644
  2009-08-10  Roland McGrath  <roland@redhat.com>
  
  	* dwarf_getscopevar.c: Use dwarf_diename.
-@@ -1844,6 +1852,11 @@
+@@ -2016,6 +2024,11 @@
  
  2005-05-31  Roland McGrath  <roland@redhat.com>
  
@@ -454,7 +460,7 @@ index abc2d71..a9ee0b0 100644
  	formref offset.
  
 diff --git a/libdw/dwarf_begin_elf.c b/libdw/dwarf_begin_elf.c
-index 4c49ce2..7ea1430 100644
+index 4e0d590..a6616a1 100644
 --- a/libdw/dwarf_begin_elf.c
 +++ b/libdw/dwarf_begin_elf.c
 @@ -47,6 +47,14 @@
@@ -473,10 +479,10 @@ index 4c49ce2..7ea1430 100644
  # undef crc32
  #endif
 diff --git a/libdw/libdw.h b/libdw/libdw.h
-index b2b2282..722c589 100644
+index 473e1a2..5a511cd 100644
 --- a/libdw/libdw.h
 +++ b/libdw/libdw.h
-@@ -1003,7 +1003,7 @@ extern Dwarf_OOM dwarf_new_oom_handler (Dwarf *dbg, Dwarf_OOM handler);
+@@ -1004,7 +1004,7 @@ extern Dwarf_OOM dwarf_new_oom_handler (Dwarf *dbg, Dwarf_OOM handler);
  
  
  /* Inline optimizations.  */
@@ -486,10 +492,10 @@ index b2b2282..722c589 100644
  __libdw_extern_inline unsigned int
  dwarf_whatattr (Dwarf_Attribute *attr)
 diff --git a/libdwfl/ChangeLog b/libdwfl/ChangeLog
-index 69e59a6..15c2987 100644
+index a5253e2..59abfac 100644
 --- a/libdwfl/ChangeLog
 +++ b/libdwfl/ChangeLog
-@@ -571,6 +571,21 @@
+@@ -704,6 +704,21 @@
  	(dwfl_module_addrsym) (i_to_symfile): New function.
  	(dwfl_module_addrsym) (search_table): Use it.
  
@@ -511,7 +517,7 @@ index 69e59a6..15c2987 100644
  2013-11-07  Jan Kratochvil  <jan.kratochvil@redhat.com>
  	    Mark Wielaard  <mjw@redhat.com>
  
-@@ -2336,6 +2351,11 @@
+@@ -2469,6 +2484,11 @@
  
  2005-07-21  Roland McGrath  <roland@redhat.com>
  
@@ -564,7 +570,7 @@ index 5a7b3b3..d05ac7e 100644
  #include "../libdw/memory-access.h"
  
 diff --git a/libdwfl/linux-pid-attach.c b/libdwfl/linux-pid-attach.c
-index efbcf03..ae5af38 100644
+index ae71702..076b2c3 100644
 --- a/libdwfl/linux-pid-attach.c
 +++ b/libdwfl/linux-pid-attach.c
 @@ -255,6 +255,11 @@ void
@@ -596,10 +602,10 @@ index efbcf03..ae5af38 100644
  
  static void
 diff --git a/libebl/ChangeLog b/libebl/ChangeLog
-index 5e635f2..998544f 100644
+index 51ae60f..aee0217 100644
 --- a/libebl/ChangeLog
 +++ b/libebl/ChangeLog
-@@ -765,6 +765,11 @@
+@@ -780,6 +780,11 @@
  	* Makefile.am (libebl_*_so_SOURCES): Set to $(*_SRCS) so dependency
  	tracking works right.
  
@@ -612,10 +618,10 @@ index 5e635f2..998544f 100644
  
  	* libebl_x86_64.map: Add x86_64_core_note.
 diff --git a/libelf/ChangeLog b/libelf/ChangeLog
-index 3b88d03..cb6cad5 100644
+index 30017cd..9ca9c73 100644
 --- a/libelf/ChangeLog
 +++ b/libelf/ChangeLog
-@@ -244,6 +244,11 @@
+@@ -398,6 +398,11 @@
  
  	* elf-knowledge.h (SECTION_STRIP_P): Remove < SHT_NUM check.
  
@@ -627,7 +633,7 @@ index 3b88d03..cb6cad5 100644
  2011-02-26  Mark Wielaard  <mjw@redhat.com>
  
  	* elf_end.c (elf_end): Call rwlock_unlock before rwlock_fini.
-@@ -921,6 +926,11 @@
+@@ -1075,6 +1080,11 @@
  
  	* elf.h: Update from glibc.
  
@@ -684,10 +690,10 @@ index 04d9ca1..3e25936 100644
      }
  }
 diff --git a/src/ChangeLog b/src/ChangeLog
-index 0ae863e..1162f6e 100644
+index 15e6fae..78535c8 100644
 --- a/src/ChangeLog
 +++ b/src/ChangeLog
-@@ -1371,8 +1371,16 @@
+@@ -1598,8 +1598,16 @@
  	* readelf.c (attr_callback): Use print_block only when we don't use
  	print_ops.
  
@@ -704,7 +710,7 @@ index 0ae863e..1162f6e 100644
  	* ar.c (do_oper_extract): Use pathconf instead of statfs.
  
  2009-08-01  Ulrich Drepper  <drepper@redhat.com>
-@@ -1536,6 +1544,8 @@
+@@ -1763,6 +1771,8 @@
  	* readelf.c (print_debug_frame_section): Use t instead of j formats
  	for ptrdiff_t OFFSET.
  
@@ -713,7 +719,7 @@ index 0ae863e..1162f6e 100644
  2009-01-21  Ulrich Drepper  <drepper@redhat.com>
  
  	* elflint.c (check_program_header): Fix typo in .eh_frame_hdr section
-@@ -1719,6 +1729,11 @@
+@@ -1946,6 +1956,11 @@
  	that matches its PT_LOAD's p_flags &~ PF_W.  On sparc, PF_X really
  	is valid in RELRO.
  
@@ -725,7 +731,7 @@ index 0ae863e..1162f6e 100644
  2008-02-29  Roland McGrath  <roland@redhat.com>
  
  	* readelf.c (print_attributes): Add a cast.
-@@ -1970,6 +1985,8 @@
+@@ -2197,6 +2212,8 @@
  
  	* readelf.c (hex_dump): Fix rounding error in whitespace calculation.
  
@@ -734,7 +740,7 @@ index 0ae863e..1162f6e 100644
  2007-10-15  Roland McGrath  <roland@redhat.com>
  
  	* make-debug-archive.in: New file.
-@@ -2409,6 +2426,10 @@
+@@ -2636,6 +2653,10 @@
  	* elflint.c (valid_e_machine): Add EM_ALPHA.
  	Reported by Christian Aichinger <Greek0@gmx.net>.
  
@@ -745,7 +751,7 @@ index 0ae863e..1162f6e 100644
  2006-08-08  Ulrich Drepper  <drepper@redhat.com>
  
  	* elflint.c (check_dynamic): Don't require DT_HASH for DT_SYMTAB.
-@@ -2485,6 +2506,10 @@
+@@ -2712,6 +2733,10 @@
  	* Makefile.am: Add hacks to create dependency files for non-generic
  	linker.
  
@@ -756,7 +762,7 @@ index 0ae863e..1162f6e 100644
  2006-06-12  Ulrich Drepper  <drepper@redhat.com>
  
  	* ldgeneric.c (ld_generic_generate_sections): Don't create .interp
-@@ -2833,6 +2858,11 @@
+@@ -3060,6 +3085,11 @@
  	* readelf.c (print_debug_loc_section): Fix indentation for larger
  	address size.
  
@@ -769,26 +775,26 @@ index 0ae863e..1162f6e 100644
  
  	* readelf.c (print_debug_line_section): Print section offset of each
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 4f198da..a612cf6 100644
+index dbac3eb..9028aa1 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -89,6 +89,11 @@ endif
- # XXX While the file is not finished, don't warn about this
+@@ -90,6 +90,11 @@ endif
  ldgeneric_no_Wunused = yes
+ ldgeneric_no_Wstack_usage = yes
  
 +# Buggy old compilers or libc headers.
 +readelf_no_Werror = yes
 +strings_no_Werror = yes
 +addr2line_no_Wformat = yes
 +
- readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl
- nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl \
- 	   $(demanglelib)
+ # Bad, bad stack usage...
+ readelf_no_Wstack_usage = yes
+ nm_no_Wstack_usage = yes
 diff --git a/src/addr2line.c b/src/addr2line.c
-index de80294..e982982 100644
+index 0ce854f..d2d0c8c 100644
 --- a/src/addr2line.c
 +++ b/src/addr2line.c
-@@ -540,10 +540,10 @@ handle_address (const char *string, Dwfl *dwfl)
+@@ -622,10 +622,10 @@ handle_address (const char *string, Dwfl *dwfl)
        bool parsed = false;
        int i, j;
        char *name = NULL;
@@ -838,10 +844,10 @@ index 29f4031..8695c31 100644
  
  #endif	/* ld.h */
 diff --git a/src/readelf.c b/src/readelf.c
-index d49544f..15dbe62 100644
+index b4cb3a8..606d220 100644
 --- a/src/readelf.c
 +++ b/src/readelf.c
-@@ -4368,10 +4368,12 @@ listptr_base (struct listptr *p)
+@@ -4364,10 +4364,12 @@ listptr_base (struct listptr *p)
    return base;
  }
  
@@ -856,7 +862,7 @@ index d49544f..15dbe62 100644
    struct listptr *p1 = (void *) a;
    struct listptr *p2 = (void *) b;
  
-@@ -4467,8 +4469,11 @@ static void
+@@ -4463,8 +4465,11 @@ static void
  sort_listptr (struct listptr_table *table, const char *name)
  {
    if (table->n > 0)
@@ -870,7 +876,7 @@ index d49544f..15dbe62 100644
  }
  
  static bool
-@@ -9540,7 +9545,7 @@ dump_archive_index (Elf *elf, const char *fname)
+@@ -9561,7 +9566,7 @@ dump_archive_index (Elf *elf, const char *fname)
  	  if (unlikely (elf_rand (elf, as_off) == 0)
  	      || unlikely ((subelf = elf_begin (-1, ELF_C_READ_MMAP, elf))
  			   == NULL))
@@ -880,7 +886,7 @@ index d49544f..15dbe62 100644
  #endif
  	      error (EXIT_FAILURE, 0,
 diff --git a/src/strings.c b/src/strings.c
-index f60e4b4..dae6ab2 100644
+index b2bce7b..fe0ab6c 100644
 --- a/src/strings.c
 +++ b/src/strings.c
 @@ -43,6 +43,10 @@
@@ -921,10 +927,10 @@ index f60e4b4..dae6ab2 100644
  
    if (unlikely (elfmap == MAP_FAILED))
 diff --git a/src/strip.c b/src/strip.c
-index 2b21799..1b34eee 100644
+index 5e69334..8bd1790 100644
 --- a/src/strip.c
 +++ b/src/strip.c
-@@ -45,6 +45,12 @@
+@@ -44,6 +44,12 @@
  #include <libebl.h>
  #include <system.h>
  
@@ -937,48 +943,11 @@ index 2b21799..1b34eee 100644
  typedef uint8_t GElf_Byte;
  
  /* Name and version of program.  */
-@@ -318,8 +324,18 @@ process_file (const char *fname)
- 
-       /* If we have to preserve the timestamp, we need it in the
- 	 format utimes() understands.  */
-+#ifdef HAVE_STRUCT_STAT_ST_ATIM
-       TIMESPEC_TO_TIMEVAL (&tv[0], &pre_st.st_atim);
-+#else
-+      tv[0].tv_sec = pre_st.st_atime;
-+      tv[0].tv_usec = 0;
-+#endif
-+#ifdef HAVE_STRUCT_STAT_ST_MTIM
-       TIMESPEC_TO_TIMEVAL (&tv[1], &pre_st.st_mtim);
-+#else
-+      tv[1].tv_sec = pre_st.st_atime;
-+      tv[1].tv_usec = 0;
-+#endif
-     }
- 
-   /* Open the file.  */
-@@ -2091,7 +2107,7 @@ while computing checksum for debug information"));
-   /* If requested, preserve the timestamp.  */
-   if (tvp != NULL)
-     {
--      if (futimes (fd, tvp) != 0)
-+      if (FUTIMES (fd, output_fname, tvp) != 0)
- 	{
- 	  error (0, errno, gettext ("\
- cannot set access and modification date of '%s'"),
-@@ -2148,7 +2164,7 @@ handle_ar (int fd, Elf *elf, const char *prefix, const char *fname,
- 
-   if (tvp != NULL)
-     {
--      if (unlikely (futimes (fd, tvp) != 0))
-+      if (unlikely (FUTIMES (fd, fname, tvp) != 0))
- 	{
- 	  error (0, errno, gettext ("\
- cannot set access and modification date of '%s'"), fname);
 diff --git a/tests/ChangeLog b/tests/ChangeLog
-index 59048f6..02eccfc 100644
+index 19878ac..6815028 100644
 --- a/tests/ChangeLog
 +++ b/tests/ChangeLog
-@@ -421,6 +421,13 @@
+@@ -609,6 +609,13 @@
  
  2013-12-02  Jan Kratochvil  <jan.kratochvil@redhat.com>
  
@@ -992,7 +961,7 @@ index 59048f6..02eccfc 100644
  	* Makefile.am (check_PROGRAMS): Add backtrace, backtrace-child,
  	backtrace-data and backtrace-dwarf.
  	(BUILT_SOURCES, clean-local, backtrace-child-biarch): New.
-@@ -1285,6 +1292,8 @@
+@@ -1473,6 +1480,8 @@
  
  2008-01-21  Roland McGrath  <roland@redhat.com>
  
@@ -1001,7 +970,7 @@ index 59048f6..02eccfc 100644
  	* testfile45.S.bz2: Add tests for cltq, cqto.
  	* testfile45.expect.bz2: Adjust.
  
-@@ -1993,6 +2002,11 @@
+@@ -2181,6 +2190,11 @@
  	* Makefile.am (TESTS): Add run-elflint-test.sh.
  	(EXTRA_DIST): Add run-elflint-test.sh and testfile18.bz2.
  
@@ -1014,19 +983,19 @@ index 59048f6..02eccfc 100644
  
  	* get-files.c (main): Use correct format specifier.
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index f32e4d0..2652fb8 100644
+index 425f8cd..69760a4 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -365,6 +365,7 @@ get_lines_LDADD = $(libdw) $(libelf)
+@@ -382,6 +382,7 @@ get_lines_LDADD = $(libdw) $(libelf)
  get_files_LDADD = $(libdw) $(libelf)
  get_aranges_LDADD = $(libdw) $(libelf)
  allfcts_LDADD = $(libdw) $(libelf)
 +line2addr_no_Wformat = yes
- line2addr_LDADD = $(libdw)
- addrscopes_LDADD = $(libdw)
- funcscopes_LDADD = $(libdw)
+ line2addr_LDADD = $(libdw) $(argp_LDADD)
+ addrscopes_LDADD = $(libdw) $(argp_LDADD)
+ funcscopes_LDADD = $(libdw) $(argp_LDADD)
 diff --git a/tests/backtrace.c b/tests/backtrace.c
-index 331ba0f..46af9b5 100644
+index abd56ab..6a7c661 100644
 --- a/tests/backtrace.c
 +++ b/tests/backtrace.c
 @@ -36,6 +36,7 @@
@@ -1050,6 +1019,3 @@ index e0d65d3..7c171b9 100644
  	{
  	default:
  	case 0:
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/scanf-format.patch b/meta/recipes-devtools/elfutils/elfutils-0.162/scanf-format.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/scanf-format.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.162/scanf-format.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.162/testsuite-ignore-elflint.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.162/testsuite-ignore-elflint.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/uclibc-support-for-elfutils-0.161.patch b/meta/recipes-devtools/elfutils/elfutils-0.162/uclibc-support-for-elfutils-0.161.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.161/uclibc-support-for-elfutils-0.161.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.162/uclibc-support-for-elfutils-0.161.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.161.bb b/meta/recipes-devtools/elfutils/elfutils_0.162.bb
similarity index 93%
rename from meta/recipes-devtools/elfutils/elfutils_0.161.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.162.bb
index 70a3c16..f6ace7e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.161.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.162.bb
@@ -5,10 +5,10 @@ LICENSE = "(GPLv3 & Elfutils-Exception)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
-SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/elfutils-${PV}.tar.bz2"
+SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "e1b9847c9a6a1ad340de8d47a863ec52"
-SRC_URI[sha256sum] = "570c91a1783fa5386aaa2dfdd08dda1de777c2b63bf3b9c1437d635ffdd7a070"
+SRC_URI[md5sum] = "9334cbcc0df7669b7bf07cf7fc3ad52c"
+SRC_URI[sha256sum] = "526106bc6be898b3b3281a66b83d64993aa0ef1b55b0416766868ad53d0a1951"
 
 SRC_URI += "\
         file://mempcpy.patch \
@@ -16,7 +16,6 @@ SRC_URI += "\
         file://Fix_elf_cvt_gunhash.patch \
         file://fixheadercheck.patch \
         file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch \
-        file://0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch \
         file://0001-remove-the-unneed-checking.patch \
 "
 
-- 
1.7.9.5


