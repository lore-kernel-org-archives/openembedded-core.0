Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCE76FF56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7EvTi013840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:57 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:21 -0800
Message-ID: <36c50bbe6592040e984af989e9841f0d38b8a1d1.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/40] glibc: Backported a patch to fix glibc's bug(18589)
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:56 -0000
Content-Type: text/plain

From: Li Xin <lixin.fnst@cn.fujitsu.com>

Also Fix LSB NG cases:
 * /tset/ANSI.os/locale/setlocale/T.setlocale 1 2 4 5 15
 * /tset/ANSI.os/string/strcoll_X/T.strcoll_X 1
 * /tset/LI18NUX2K.L1/base/wcscoll/T.wcscoll 1
 * /tset/LI18NUX2K.L1/utils/localedef/T.localedef 7
 * /tset/LI18NUX2K.L1/utils/sort/T.sort 1 3 17 19 33 35
 * /tset/LI18NUX2K.L1/utils/comm/T.comm 1 2
 * /tset/LI18NUX2K.L1/utils/ls-fh/T.ls-fh 2

This patch is backported from
https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=6c84109cfa26f35c3dfed3acb97d347361bd5849

(From OE-Core master rev: e88fe8f4c0ea70fb271d3a11e1a3bfcac4c92626)

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ove-incorrect-STRDIFF-based-optimization-.patch |  323 ++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |    1 +
 2 files changed, 324 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch

diff --git a/meta/recipes-core/glibc/glibc/strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch b/meta/recipes-core/glibc/glibc/strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch
new file mode 100644
index 0000000..8ce255f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch
@@ -0,0 +1,323 @@
+Upstream-Status: Backport
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+
+From https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=6c84109cfa26f35c3dfed3acb97d347361bd5849
+Author: Carlos O'Donell <carlos@systemhalted.org>
+Date:   Thu Oct 8 16:34:53 2015 -0400
+
+    strcoll: Remove incorrect STRDIFF-based optimization (Bug 18589).
+
+    The optimization introduced in commit
+    f13c2a8dff2329c6692a80176262ceaaf8a6f74e, causes regressions in
+    sorting for languages that have digraphs that change sort order, like
+    cs_CZ which sorts ch between h and i.
+
+    My analysis shows the fast-forwarding optimization in STRCOLL advances
+    through a digraph while possibly stopping in the middle which results
+    in a subsequent skipping of the digraph and incorrect sorting. The
+    optimization is incorrect as implemented and because of that I'm
+    removing it for 2.23, and I will also commit this fix for 2.22 where
+    it was originally introduced.
+
+    This patch reverts the optimization, introduces a new bug-strcoll2.c
+    regression test that tests both cs_CZ.UTF-8 and da_DK.ISO-8859-1 and
+    ensures they sort one digraph each correctly. The optimization can't be
+    applied without regressing this test.
+
+    Checked on x86_64, bug-strcoll2.c fails without this patch and passes
+    after. This will also get a fix on 2.22 which has the same bug.
+
+    (cherry picked from commit 87701a58e291bd7ac3b407d10a829dac52c9c16e)
+---
+ locale/C-collate.c           |  4 +-
+ locale/categories.def        |  1 -
+ locale/langinfo.h            |  1 -
+ locale/localeinfo.h          |  7 ----
+ locale/programs/ld-collate.c |  9 -----
+ string/bug-strcoll2.c        | 95 ++++++++++++++++++++++++++++++++++++++++++++
+ string/strcoll_l.c           | 39 +-----------------
+ wcsmbs/wcscoll_l.c           |  1 -
+ 8 files changed, 98 insertions(+), 59 deletions(-)
+ create mode 100644 string/bug-strcoll2.c
+
+diff --git a/locale/C-collate.c b/locale/C-collate.c
+index d7f3c55..06dfdfa 100644
+--- a/locale/C-collate.c
++++ b/locale/C-collate.c
+@@ -144,8 +144,6 @@ const struct __locale_data _nl_C_LC_COLLATE attribute_hidden =
+     /* _NL_COLLATE_COLLSEQWC */
+     { .string = (const char *) collseqwc },
+     /* _NL_COLLATE_CODESET */
+-    { .string = _nl_C_codeset },
+-    /* _NL_COLLATE_ENCODING_TYPE */
+-    { .word = __cet_8bit }
++    { .string = _nl_C_codeset }
+   }
+ };
+diff --git a/locale/categories.def b/locale/categories.def
+index 045489d..a8dda53 100644
+--- a/locale/categories.def
++++ b/locale/categories.def
+@@ -58,7 +58,6 @@ DEFINE_CATEGORY
+   DEFINE_ELEMENT (_NL_COLLATE_COLLSEQMB,        "collate-collseqmb",        std, wstring)
+   DEFINE_ELEMENT (_NL_COLLATE_COLLSEQWC,        "collate-collseqwc",        std, wstring)
+   DEFINE_ELEMENT (_NL_COLLATE_CODESET,		"collate-codeset",	    std, string)
+-  DEFINE_ELEMENT (_NL_COLLATE_ENCODING_TYPE,   "collate-encoding-type",    std, word)
+   ), NO_POSTLOAD)
+ 
+ 
+diff --git a/locale/langinfo.h b/locale/langinfo.h
+index ffc5c7f..a565d9d 100644
+--- a/locale/langinfo.h
++++ b/locale/langinfo.h
+@@ -255,7 +255,6 @@ enum
+   _NL_COLLATE_COLLSEQMB,
+   _NL_COLLATE_COLLSEQWC,
+   _NL_COLLATE_CODESET,
+-  _NL_COLLATE_ENCODING_TYPE,
+   _NL_NUM_LC_COLLATE,
+ 
+   /* LC_CTYPE category: character classification.
+diff --git a/locale/localeinfo.h b/locale/localeinfo.h
+index a7516c0..c076d8e 100644
+--- a/locale/localeinfo.h
++++ b/locale/localeinfo.h
+@@ -110,13 +110,6 @@ enum coll_sort_rule
+   sort_mask
+ };
+ 
+-/* Collation encoding type.  */
+-enum collation_encoding_type
+-{
+-  __cet_other,
+-  __cet_8bit,
+-  __cet_utf8
+-};
+ 
+ /* We can map the types of the entries into a few categories.  */
+ enum value_type
+diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
+index 16e9039..3c88c6d 100644
+--- a/locale/programs/ld-collate.c
++++ b/locale/programs/ld-collate.c
+@@ -32,7 +32,6 @@
+ #include "linereader.h"
+ #include "locfile.h"
+ #include "elem-hash.h"
+-#include "../localeinfo.h"
+ 
+ /* Uncomment the following line in the production version.  */
+ /* #define NDEBUG 1 */
+@@ -2130,8 +2129,6 @@ collate_output (struct localedef_t *locale, const struct charmap_t *charmap,
+ 	  /* The words have to be handled specially.  */
+ 	  if (idx == _NL_ITEM_INDEX (_NL_COLLATE_SYMB_HASH_SIZEMB))
+ 	    add_locale_uint32 (&file, 0);
+-	  else if (idx == _NL_ITEM_INDEX (_NL_COLLATE_ENCODING_TYPE))
+-	    add_locale_uint32 (&file, __cet_other);
+ 	  else
+ 	    add_locale_empty (&file);
+ 	}
+@@ -2495,12 +2492,6 @@ collate_output (struct localedef_t *locale, const struct charmap_t *charmap,
+   add_locale_raw_data (&file, collate->mbseqorder, 256);
+   add_locale_collseq_table (&file, &collate->wcseqorder);
+   add_locale_string (&file, charmap->code_set_name);
+-  if (strcmp (charmap->code_set_name, "UTF-8") == 0)
+-    add_locale_uint32 (&file, __cet_utf8);
+-  else if (charmap->mb_cur_max == 1)
+-    add_locale_uint32 (&file, __cet_8bit);
+-  else
+-    add_locale_uint32 (&file, __cet_other);
+   write_locale_data (output_path, LC_COLLATE, "LC_COLLATE", &file);
+ 
+   obstack_free (&weightpool, NULL);
+diff --git a/string/bug-strcoll2.c b/string/bug-strcoll2.c
+new file mode 100644
+index 0000000..950b090
+--- /dev/null
++++ b/string/bug-strcoll2.c
+@@ -0,0 +1,95 @@
++/* Bug 18589: sort-test.sh fails at random.
++ * Copyright (C) 1998-2015 Free Software Foundation, Inc.
++ * This file is part of the GNU C Library.
++ * Contributed by Ulrich Drepper <drepper@cygnus.com>, 1998.
++ *
++ * The GNU C Library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2.1 of the License, or (at your option) any later version.
++ *
++ * The GNU C Library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with the GNU C Library; if not, see
++ * <http://www.gnu.org/licenses/>.  */
++
++#include <stdio.h>
++#include <string.h>
++#include <locale.h>
++
++/* An incorrect strcoll optimization resulted in incorrect
++ *    results from strcoll for cs_CZ and da_DK.  */
++
++int
++test_cs_CZ (void)
++{
++  const char t1[] = "config";
++  const char t2[] = "choose";
++  if (setlocale (LC_ALL, "cs_CZ.UTF-8") == NULL)
++    {
++      perror ("setlocale");
++      return 1;
++    }
++  /* In Czech the digraph ch sorts after c, therefore we expect
++ *      config to sort before choose.  */
++  int a = strcoll (t1, t2);
++  int b = strcoll (t2, t1);
++  printf ("strcoll (\"%s\", \"%s\") = %d\n", t1, t2, a);
++  printf ("strcoll (\"%s\", \"%s\") = %d\n", t2, t1, b);
++  if (a < 0 && b > 0)
++    {
++      puts ("PASS: config < choose");
++      return 0;
++    }
++  else
++    {
++      puts ("FAIL: Wrong sorting in cz_CZ.UTF-8.");
++      return 1;
++    }
++}
++
++int
++test_da_DK (void)
++{
++  const char t1[] = "AS";
++  const char t2[] = "AA";
++  if (setlocale (LC_ALL, "da_DK.ISO-8859-1") == NULL)
++    {
++      perror ("setlocale");
++      return 1;
++    }
++  /* AA should be treated as the last letter of the Danish alphabet,
++ *      hence sorting after AS.  */
++  int a = strcoll (t1, t2);
++  int b = strcoll (t2, t1);
++  printf ("strcoll (\"%s\", \"%s\") = %d\n", t1, t2, a);
++  printf ("strcoll (\"%s\", \"%s\") = %d\n", t2, t1, b);
++  if (a < 0 && b > 0)
++    {
++      puts ("PASS: AS < AA");
++      return 0;
++    }
++  else
++    {
++      puts ("FAIL: Wrong sorting in da_DK.ISO-8859-1");
++      return 1;
++    }
++}
++
++static int
++do_test (void)
++{
++  int err = 0;
++  err |= test_cs_CZ ();
++  err |= test_da_DK ();
++  return err;
++}
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
++
++
+diff --git a/string/strcoll_l.c b/string/strcoll_l.c
+index b36b18c..a18b65e 100644
+--- a/string/strcoll_l.c
++++ b/string/strcoll_l.c
+@@ -30,7 +30,6 @@
+ # define STRING_TYPE char
+ # define USTRING_TYPE unsigned char
+ # define STRCOLL __strcoll_l
+-# define STRDIFF __strdiff
+ # define STRCMP strcmp
+ # define WEIGHT_H "../locale/weight.h"
+ # define SUFFIX	MB
+@@ -43,19 +42,6 @@
+ #include "../locale/localeinfo.h"
+ #include WEIGHT_H
+ 
+-#define MASK_UTF8_7BIT  (1 << 7)
+-#define MASK_UTF8_START (3 << 6)
+-
+-size_t
+-STRDIFF (const STRING_TYPE *s, const STRING_TYPE *t)
+-{
+-  size_t n;
+-
+-  for (n = 0; *s != '\0' && *s++ == *t++; ++n)
+-    continue;
+-
+-  return n;
+-}
+ 
+ /* Track status while looking for sequences in a string.  */
+ typedef struct
+@@ -274,29 +260,9 @@ STRCOLL (const STRING_TYPE *s1, const STRING_TYPE *s2, __locale_t l)
+   const USTRING_TYPE *extra;
+   const int32_t *indirect;
+ 
+-  /* In case there is no locale specific sort order (C / POSIX).  */
+   if (nrules == 0)
+     return STRCMP (s1, s2);
+ 
+-  /* Fast forward to the position of the first difference.  Needs to be
+-     encoding aware as the byte-by-byte comparison can stop in the middle
+-     of a char sequence for multibyte encodings like UTF-8.  */
+-  uint_fast32_t encoding =
+-    current->values[_NL_ITEM_INDEX (_NL_COLLATE_ENCODING_TYPE)].word;
+-  if (encoding != __cet_other)
+-    {
+-      size_t diff = STRDIFF (s1, s2);
+-      if (diff > 0)
+-	{
+-	  if (encoding == __cet_utf8 && (*(s1 + diff) & MASK_UTF8_7BIT) != 0)
+-	    do
+-	      diff--;
+-	    while (diff > 0 && (*(s1 + diff) & MASK_UTF8_START) != MASK_UTF8_START);
+-	  s1 += diff;
+-	  s2 += diff;
+-	}
+-    }
+-
+   /* Catch empty strings.  */
+   if (__glibc_unlikely (*s1 == '\0') || __glibc_unlikely (*s2 == '\0'))
+     return (*s1 != '\0') - (*s2 != '\0');
+@@ -363,9 +329,8 @@ STRCOLL (const STRING_TYPE *s1, const STRING_TYPE *s2, __locale_t l)
+ 		     byte-level comparison to ensure that we don't waste time
+ 		     going through multiple passes for totally equal strings
+ 		     before proceeding to subsequent passes.  */
+-		  if (pass == 0 && encoding == __cet_other &&
+-		      STRCMP (s1, s2) == 0)
+-		    return result;
++		  if (pass == 0 && STRCMP (s1, s2) == 0)
++                    return result;
+ 		  else
+ 		    break;
+ 	        }
+diff --git a/wcsmbs/wcscoll_l.c b/wcsmbs/wcscoll_l.c
+index 6d9384a..87f240d 100644
+--- a/wcsmbs/wcscoll_l.c
++++ b/wcsmbs/wcscoll_l.c
+@@ -23,7 +23,6 @@
+ #define STRING_TYPE wchar_t
+ #define USTRING_TYPE wint_t
+ #define STRCOLL __wcscoll_l
+-#define STRDIFF __wcsdiff
+ #define STRCMP __wcscmp
+ #define WEIGHT_H "../locale/weightwc.h"
+ #define SUFFIX	WC
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index 2494ad7..71ff824 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -39,6 +39,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch \
            file://0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch \
            file://nscd-no-bash.patch \
+           file://strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch \
 "
 
 SRC_URI += "\
-- 
1.7.9.5


