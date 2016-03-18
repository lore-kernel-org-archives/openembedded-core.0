Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9D26FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:02:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2I9274c015013
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Mar 2016 02:02:08 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 18 Mar 2016 02:02:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>
Date: Fri, 18 Mar 2016 05:01:43 -0400
Message-ID: <438ae66b205d7901a9954cec8ece1622d8388e93.1458282563.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458282563.git.hongxu.jia@windriver.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/18] gcc-5.3/gcc-4.9:replace build path with target path in __FILE__
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
X-List-Received-Date: Fri, 18 Mar 2016 09:02:11 -0000
Content-Type: text/plain

Similar -fdebug-prefix-map, add option -ffile-prefix-map to map one
directory name (old) to another (new) in __FILE__, __BASE_FILE__and
__builtin_FILE ().

With this patch, it fixes build path issue which caused by __FILE__.
We do not need to use relative path to compile any more.

[YOCTO #7058]

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 .../gcc-4.9/0072-support-ffile-prefix-map.patch    | 284 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
 .../gcc-5.3/0054-support-ffile-prefix-map.patch    | 284 +++++++++++++++++++++
 4 files changed, 570 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0072-support-ffile-prefix-map.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0054-support-ffile-prefix-map.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 6412490..22783b2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -87,6 +87,7 @@ SRC_URI = "\
     file://0069-musl-no-fixincludes.patch \
     file://0070-libstdc-musl.patch \
     file://0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch \
+    file://0072-support-ffile-prefix-map.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0072-support-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-4.9/0072-support-ffile-prefix-map.patch
new file mode 100644
index 0000000..9809a6a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0072-support-ffile-prefix-map.patch
@@ -0,0 +1,284 @@
+From e863be798ed13312a0faf0b961275f211a8123ab Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 17 Mar 2016 00:32:17 -0400
+Subject: [PATCH] gcc/libcpp: support -ffile-prefix-map=<old>=<new>
+
+Similar -fdebug-prefix-map, add option -ffile-prefix-map to map one
+directory name (old) to another (new) in __FILE__, __BASE_FILE__ and
+__builtin_FILE ().
+
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268
+
+Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/c-family/c-opts.c     |  6 ++++
+ gcc/c-family/c.opt        |  4 +++
+ gcc/dwarf2out.c           |  1 +
+ gcc/gimplify.c            |  2 ++
+ libcpp/Makefile.in        | 10 +++---
+ libcpp/file-map.c         | 92 +++++++++++++++++++++++++++++++++++++++++++++++
+ libcpp/include/file-map.h | 30 ++++++++++++++++
+ libcpp/macro.c            |  2 ++
+ 8 files changed, 142 insertions(+), 5 deletions(-)
+ create mode 100644 libcpp/file-map.c
+ create mode 100644 libcpp/include/file-map.h
+
+diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
+index dd5fd23..9c004a1 100644
+--- a/gcc/c-family/c-opts.c
++++ b/gcc/c-family/c-opts.c
+@@ -36,6 +36,7 @@ along with GCC; see the file COPYING3.  If not see
+ #include "options.h"
+ #include "plugin.h"		/* For PLUGIN_INCLUDE_FILE event.  */
+ #include "mkdeps.h"
++#include "file-map.h"
+ #include "c-target.h"
+ #include "tm.h"			/* For BYTES_BIG_ENDIAN,
+ 				   DOLLARS_IN_IDENTIFIERS,
+@@ -553,6 +554,11 @@ c_common_handle_option (size_t scode, const char *arg, int value,
+       cpp_opts->narrow_charset = arg;
+       break;
+ 
++    case OPT_ffile_prefix_map_:
++      if (add_file_prefix_map (arg) < 0)
++        error ("invalid argument %qs to -ffile-prefix-map", arg);
++      break;
++
+     case OPT_fwide_exec_charset_:
+       cpp_opts->wide_charset = arg;
+       break;
+diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
+index f295805..3a99662 100644
+--- a/gcc/c-family/c.opt
++++ b/gcc/c-family/c.opt
+@@ -928,6 +928,10 @@ fexec-charset=
+ C ObjC C++ ObjC++ Joined RejectNegative
+ -fexec-charset=<cset>	Convert all strings and character constants to character set <cset>
+ 
++ffile-prefix-map=
++C ObjC C++ ObjC++ Joined RejectNegative
++-ffile-prefix-map=<old=new>	Map one directory name to another in __FILE__, __BASE_FILE__ and __builtin_FILE ()
++
+ fextended-identifiers
+ C ObjC C++ ObjC++
+ Permit universal character names (\\u and \\U) in identifiers
+diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+index 99bf6e2..3e58cfd 100644
+--- a/gcc/dwarf2out.c
++++ b/gcc/dwarf2out.c
+@@ -19199,6 +19199,7 @@ gen_producer_string (void)
+       case OPT_fltrans_output_list_:
+       case OPT_fresolution_:
+       case OPT_fdebug_prefix_map_:
++      case OPT_ffile_prefix_map_:
+ 	/* Ignore these.  */
+ 	continue;
+       default:
+diff --git a/gcc/gimplify.c b/gcc/gimplify.c
+index 89e7334..a7a97c0 100644
+--- a/gcc/gimplify.c
++++ b/gcc/gimplify.c
+@@ -59,6 +59,7 @@ along with GCC; see the file COPYING3.  If not see
+ #include "omp-low.h"
+ #include "gimple-low.h"
+ #include "cilk.h"
++#include "file-map.h"
+ 
+ #include "langhooks-def.h"	/* FIXME: for lhd_set_decl_assembler_name */
+ #include "tree-pass.h"		/* FIXME: only for PROP_gimple_any */
+@@ -2288,6 +2289,7 @@ gimplify_call_expr (tree *expr_p, gimple_seq *pre_p, bool want_value)
+       case BUILT_IN_FILE:
+ 	{
+ 	  expanded_location loc = expand_location (EXPR_LOCATION (*expr_p));
++	  loc.file = remap_file_filename (loc.file);
+ 	  *expr_p = build_string_literal (strlen (loc.file) + 1, loc.file);
+ 	  return GS_OK;
+ 	}
+diff --git a/libcpp/Makefile.in b/libcpp/Makefile.in
+index 5561c97..5017256 100644
+--- a/libcpp/Makefile.in
++++ b/libcpp/Makefile.in
+@@ -84,12 +84,12 @@ DEPMODE = $(CXXDEPMODE)
+ 
+ 
+ libcpp_a_OBJS = charset.o directives.o directives-only.o errors.o \
+-	expr.o files.o identifiers.o init.o lex.o line-map.o macro.o \
+-	mkdeps.o pch.o symtab.o traditional.o
++	expr.o file-map.o files.o identifiers.o init.o lex.o line-map.o \
++	macro.o mkdeps.o pch.o symtab.o traditional.o
+ 
+ libcpp_a_SOURCES = charset.c directives.c directives-only.c errors.c \
+-	expr.c files.c identifiers.c init.c lex.c line-map.c macro.c \
+-	mkdeps.c pch.c symtab.c traditional.c
++	expr.c file-map.c files.c identifiers.c init.c lex.c line-map.c \
++	macro.c mkdeps.c pch.c symtab.c traditional.c
+ 
+ all: libcpp.a $(USED_CATALOGS)
+ 
+@@ -263,7 +263,7 @@ po/$(PACKAGE).pot: $(libcpp_a_SOURCES)
+ 
+ TAGS_SOURCES = $(libcpp_a_SOURCES) internal.h ucnid.h \
+     include/line-map.h include/symtab.h include/cpp-id-data.h \
+-    include/cpplib.h include/mkdeps.h system.h
++    include/cpplib.h include/mkdeps.h system.h include/file-map.h
+ 
+ TAGS: $(TAGS_SOURCES)
+ 	cd $(srcdir) && etags $(TAGS_SOURCES)
+diff --git a/libcpp/file-map.c b/libcpp/file-map.c
+new file mode 100644
+index 0000000..04e851b
+--- /dev/null
++++ b/libcpp/file-map.c
+@@ -0,0 +1,92 @@
++/* Map one directory name to another in __FILE__, __BASE_FILE__
++   and __builtin_FILE ().
++   Copyright (C) 2001-2016 Free Software Foundation, Inc.
++
++This program is free software; you can redistribute it and/or modify it
++under the terms of the GNU General Public License as published by the
++Free Software Foundation; either version 3, or (at your option) any
++later version.
++
++This program is distributed in the hope that it will be useful,
++but WITHOUT ANY WARRANTY; without even the implied warranty of
++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++GNU General Public License for more details.
++
++You should have received a copy of the GNU General Public License
++along with this program; see the file COPYING3.  If not see
++<http://www.gnu.org/licenses/>.
++
++ In other words, you are welcome to use, share and improve this program.
++ You are forbidden to forbid anyone else to use, share and improve
++ what you give them.   Help stamp out software-hoarding!  */
++
++#include "config.h"
++#include "system.h"
++#include "file-map.h"
++
++/* Structure recording the mapping from source file and directory
++   names at compile time to __FILE__ */
++typedef struct file_prefix_map
++{
++  const char *old_prefix;
++  const char *new_prefix;
++  size_t old_len;
++  size_t new_len;
++  struct file_prefix_map *next;
++} file_prefix_map;
++
++/* Linked list of such structures.  */
++static file_prefix_map *file_prefix_maps;
++
++/* Record prefix mapping of __FILE__.  ARG is the argument to
++   -ffile-prefix-map and must be of the form OLD=NEW.  */
++int
++add_file_prefix_map (const char *arg)
++{
++  file_prefix_map *map;
++  const char *p;
++
++  p = strchr (arg, '=');
++  if (!p)
++  {
++      fprintf(stderr, "invalid argument %qs to -ffile-prefix-map", arg);
++      return -1;
++  }
++  map = XNEW (file_prefix_map);
++  map->old_prefix = xstrndup (arg, p - arg);
++  map->old_len = p - arg;
++  p++;
++  map->new_prefix = xstrdup (p);
++  map->new_len = strlen (p);
++  map->next = file_prefix_maps;
++  file_prefix_maps = map;
++
++  return 0;
++}
++
++/* Perform user-specified mapping of __FILE__ prefixes.  Return
++   the new name corresponding to filename.  */
++
++const char *
++remap_file_filename (const char *filename)
++{
++  file_prefix_map *map;
++  char *s;
++  const char *name;
++  size_t name_len;
++
++  for (map = file_prefix_maps; map; map = map->next)
++    if (filename_ncmp (filename, map->old_prefix, map->old_len) == 0)
++      break;
++  if (!map)
++    return filename;
++  name = filename + map->old_len;
++  name_len = strlen (name) + 1;
++  s = (char *) alloca (name_len + map->new_len);
++  memcpy (s, map->new_prefix, map->new_len);
++  memcpy (s + map->new_len, name, name_len);
++
++  return xstrdup (s);
++}
++
++
+diff --git a/libcpp/include/file-map.h b/libcpp/include/file-map.h
+new file mode 100644
+index 0000000..e6f8cbf
+--- /dev/null
++++ b/libcpp/include/file-map.h
+@@ -0,0 +1,30 @@
++/* Map one directory name to another in __FILE__, __BASE_FILE__
++   and __builtin_FILE ().
++   Copyright (C) 2001-2016 Free Software Foundation, Inc.
++
++This program is free software; you can redistribute it and/or modify it
++under the terms of the GNU General Public License as published by the
++Free Software Foundation; either version 3, or (at your option) any
++later version.
++
++This program is distributed in the hope that it will be useful,
++but WITHOUT ANY WARRANTY; without even the implied warranty of
++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++GNU General Public License for more details.
++
++You should have received a copy of the GNU General Public License
++along with this program; see the file COPYING3.  If not see
++<http://www.gnu.org/licenses/>.
++
++ In other words, you are welcome to use, share and improve this program.
++ You are forbidden to forbid anyone else to use, share and improve
++ what you give them.   Help stamp out software-hoarding!  */
++
++#ifndef LIBCPP_FILE_MAP_H
++#define LIBCPP_FILE_MAP_H
++
++const char * remap_file_filename (const char *filename);
++
++int add_file_prefix_map (const char *arg);
++
++#endif /* !LIBCPP_FILE_MAP_H  */
+diff --git a/libcpp/macro.c b/libcpp/macro.c
+index 11e50f4..5c6f90e 100644
+--- a/libcpp/macro.c
++++ b/libcpp/macro.c
+@@ -26,6 +26,7 @@ along with this program; see the file COPYING3.  If not see
+ #include "system.h"
+ #include "cpplib.h"
+ #include "internal.h"
++#include "file-map.h"
+ 
+ typedef struct macro_arg macro_arg;
+ /* This structure represents the tokens of a macro argument.  These
+@@ -288,6 +289,7 @@ _cpp_builtin_macro_text (cpp_reader *pfile, cpp_hashnode *node)
+ 	    if (!name)
+ 	      abort ();
+ 	  }
++	name = remap_file_filename (name);
+ 	len = strlen (name);
+ 	buf = _cpp_unaligned_alloc (pfile, len * 2 + 3);
+ 	result = buf;
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 0bf9f55..4861cfc 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -83,6 +83,7 @@ SRC_URI = "\
            file://0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch \
            file://0052-nios2-use-ret-with-r31.patch \
            file://0053-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch \
+           file://0054-support-ffile-prefix-map.patch \
 "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0054-support-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-5.3/0054-support-ffile-prefix-map.patch
new file mode 100644
index 0000000..da16879
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0054-support-ffile-prefix-map.patch
@@ -0,0 +1,284 @@
+From ef7c2bda6b4c88f8007ed663b1108cd4651598c8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 16 Mar 2016 02:27:43 -0400
+Subject: [PATCH] gcc/libcpp: support -ffile-prefix-map=<old>=<new>
+
+Similar -fdebug-prefix-map, add option -ffile-prefix-map to map one
+directory name (old) to another (new) in __FILE__, __BASE_FILE__ and
+__builtin_FILE ().
+
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268
+
+Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/c-family/c-opts.c     |  6 ++++
+ gcc/c-family/c.opt        |  4 +++
+ gcc/dwarf2out.c           |  1 +
+ gcc/gimplify.c            |  2 ++
+ libcpp/Makefile.in        | 10 +++---
+ libcpp/file-map.c         | 92 +++++++++++++++++++++++++++++++++++++++++++++++
+ libcpp/include/file-map.h | 30 ++++++++++++++++
+ libcpp/macro.c            |  2 ++
+ 8 files changed, 142 insertions(+), 5 deletions(-)
+ create mode 100644 libcpp/file-map.c
+ create mode 100644 libcpp/include/file-map.h
+
+diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
+index 718a052..3f93c56 100644
+--- a/gcc/c-family/c-opts.c
++++ b/gcc/c-family/c-opts.c
+@@ -46,6 +46,7 @@ along with GCC; see the file COPYING3.  If not see
+ #include "opts.h"
+ #include "plugin.h"		/* For PLUGIN_INCLUDE_FILE event.  */
+ #include "mkdeps.h"
++#include "file-map.h"
+ #include "c-target.h"
+ #include "tm.h"			/* For BYTES_BIG_ENDIAN,
+ 				   DOLLARS_IN_IDENTIFIERS,
+@@ -510,6 +511,11 @@ c_common_handle_option (size_t scode, const char *arg, int value,
+       cpp_opts->narrow_charset = arg;
+       break;
+ 
++    case OPT_ffile_prefix_map_:
++      if (add_file_prefix_map (arg) < 0)
++        error ("invalid argument %qs to -ffile-prefix-map", arg);
++      break;
++
+     case OPT_fwide_exec_charset_:
+       cpp_opts->wide_charset = arg;
+       break;
+diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
+index 453ec8e..30ad053 100644
+--- a/gcc/c-family/c.opt
++++ b/gcc/c-family/c.opt
+@@ -1117,6 +1117,10 @@ fexec-charset=
+ C ObjC C++ ObjC++ Joined RejectNegative
+ -fexec-charset=<cset>	Convert all strings and character constants to character set <cset>
+ 
++ffile-prefix-map=
++C ObjC C++ ObjC++ Joined RejectNegative
++-ffile-prefix-map=<old=new>	Map one directory name to another in __FILE__, __BASE_FILE__ and __builtin_FILE ()
++
+ fextended-identifiers
+ C ObjC C++ ObjC++
+ Permit universal character names (\\u and \\U) in identifiers
+diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+index 526f114..438a475 100644
+--- a/gcc/dwarf2out.c
++++ b/gcc/dwarf2out.c
+@@ -19671,6 +19671,7 @@ gen_producer_string (void)
+       case OPT_fltrans_output_list_:
+       case OPT_fresolution_:
+       case OPT_fdebug_prefix_map_:
++      case OPT_ffile_prefix_map_:
+ 	/* Ignore these.  */
+ 	continue;
+       default:
+diff --git a/gcc/gimplify.c b/gcc/gimplify.c
+index c85f83a..1ffe1e1 100644
+--- a/gcc/gimplify.c
++++ b/gcc/gimplify.c
+@@ -87,6 +87,7 @@ along with GCC; see the file COPYING3.  If not see
+ #include "gimple-low.h"
+ #include "cilk.h"
+ #include "gomp-constants.h"
++#include "file-map.h"
+ 
+ #include "langhooks-def.h"	/* FIXME: for lhd_set_decl_assembler_name */
+ #include "tree-pass.h"		/* FIXME: only for PROP_gimple_any */
+@@ -2370,6 +2371,7 @@ gimplify_call_expr (tree *expr_p, gimple_seq *pre_p, bool want_value)
+       case BUILT_IN_FILE:
+ 	{
+ 	  const char *locfile = LOCATION_FILE (EXPR_LOCATION (*expr_p));
++	  locfile = remap_file_filename (locfile);
+ 	  *expr_p = build_string_literal (strlen (locfile) + 1, locfile);
+ 	  return GS_OK;
+ 	}
+diff --git a/libcpp/Makefile.in b/libcpp/Makefile.in
+index ad35563..c210ff9 100644
+--- a/libcpp/Makefile.in
++++ b/libcpp/Makefile.in
+@@ -84,12 +84,12 @@ DEPMODE = $(CXXDEPMODE)
+ 
+ 
+ libcpp_a_OBJS = charset.o directives.o directives-only.o errors.o \
+-	expr.o files.o identifiers.o init.o lex.o line-map.o macro.o \
+-	mkdeps.o pch.o symtab.o traditional.o
++	expr.o file-map.o files.o identifiers.o init.o lex.o line-map.o \
++	macro.o mkdeps.o pch.o symtab.o traditional.o
+ 
+ libcpp_a_SOURCES = charset.c directives.c directives-only.c errors.c \
+-	expr.c files.c identifiers.c init.c lex.c line-map.c macro.c \
+-	mkdeps.c pch.c symtab.c traditional.c
++	expr.c file-map.c files.c identifiers.c init.c lex.c line-map.c \
++	macro.c mkdeps.c pch.c symtab.c traditional.c
+ 
+ all: libcpp.a $(USED_CATALOGS)
+ 
+@@ -263,7 +263,7 @@ po/$(PACKAGE).pot: $(libcpp_a_SOURCES)
+ 
+ TAGS_SOURCES = $(libcpp_a_SOURCES) internal.h ucnid.h \
+     include/line-map.h include/symtab.h include/cpp-id-data.h \
+-    include/cpplib.h include/mkdeps.h system.h
++    include/cpplib.h include/mkdeps.h system.h include/file-map.h
+ 
+ TAGS: $(TAGS_SOURCES)
+ 	cd $(srcdir) && etags $(TAGS_SOURCES)
+diff --git a/libcpp/file-map.c b/libcpp/file-map.c
+new file mode 100644
+index 0000000..04e851b
+--- /dev/null
++++ b/libcpp/file-map.c
+@@ -0,0 +1,92 @@
++/* Map one directory name to another in __FILE__, __BASE_FILE__
++   and __builtin_FILE ().
++   Copyright (C) 2001-2016 Free Software Foundation, Inc.
++
++This program is free software; you can redistribute it and/or modify it
++under the terms of the GNU General Public License as published by the
++Free Software Foundation; either version 3, or (at your option) any
++later version.
++
++This program is distributed in the hope that it will be useful,
++but WITHOUT ANY WARRANTY; without even the implied warranty of
++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++GNU General Public License for more details.
++
++You should have received a copy of the GNU General Public License
++along with this program; see the file COPYING3.  If not see
++<http://www.gnu.org/licenses/>.
++
++ In other words, you are welcome to use, share and improve this program.
++ You are forbidden to forbid anyone else to use, share and improve
++ what you give them.   Help stamp out software-hoarding!  */
++
++#include "config.h"
++#include "system.h"
++#include "file-map.h"
++
++/* Structure recording the mapping from source file and directory
++   names at compile time to __FILE__ */
++typedef struct file_prefix_map
++{
++  const char *old_prefix;
++  const char *new_prefix;
++  size_t old_len;
++  size_t new_len;
++  struct file_prefix_map *next;
++} file_prefix_map;
++
++/* Linked list of such structures.  */
++static file_prefix_map *file_prefix_maps;
++
++/* Record prefix mapping of __FILE__.  ARG is the argument to
++   -ffile-prefix-map and must be of the form OLD=NEW.  */
++int
++add_file_prefix_map (const char *arg)
++{
++  file_prefix_map *map;
++  const char *p;
++
++  p = strchr (arg, '=');
++  if (!p)
++  {
++      fprintf(stderr, "invalid argument %qs to -ffile-prefix-map", arg);
++      return -1;
++  }
++  map = XNEW (file_prefix_map);
++  map->old_prefix = xstrndup (arg, p - arg);
++  map->old_len = p - arg;
++  p++;
++  map->new_prefix = xstrdup (p);
++  map->new_len = strlen (p);
++  map->next = file_prefix_maps;
++  file_prefix_maps = map;
++
++  return 0;
++}
++
++/* Perform user-specified mapping of __FILE__ prefixes.  Return
++   the new name corresponding to filename.  */
++
++const char *
++remap_file_filename (const char *filename)
++{
++  file_prefix_map *map;
++  char *s;
++  const char *name;
++  size_t name_len;
++
++  for (map = file_prefix_maps; map; map = map->next)
++    if (filename_ncmp (filename, map->old_prefix, map->old_len) == 0)
++      break;
++  if (!map)
++    return filename;
++  name = filename + map->old_len;
++  name_len = strlen (name) + 1;
++  s = (char *) alloca (name_len + map->new_len);
++  memcpy (s, map->new_prefix, map->new_len);
++  memcpy (s + map->new_len, name, name_len);
++
++  return xstrdup (s);
++}
++
++
+diff --git a/libcpp/include/file-map.h b/libcpp/include/file-map.h
+new file mode 100644
+index 0000000..e6f8cbf
+--- /dev/null
++++ b/libcpp/include/file-map.h
+@@ -0,0 +1,30 @@
++/* Map one directory name to another in __FILE__, __BASE_FILE__
++   and __builtin_FILE ().
++   Copyright (C) 2001-2016 Free Software Foundation, Inc.
++
++This program is free software; you can redistribute it and/or modify it
++under the terms of the GNU General Public License as published by the
++Free Software Foundation; either version 3, or (at your option) any
++later version.
++
++This program is distributed in the hope that it will be useful,
++but WITHOUT ANY WARRANTY; without even the implied warranty of
++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++GNU General Public License for more details.
++
++You should have received a copy of the GNU General Public License
++along with this program; see the file COPYING3.  If not see
++<http://www.gnu.org/licenses/>.
++
++ In other words, you are welcome to use, share and improve this program.
++ You are forbidden to forbid anyone else to use, share and improve
++ what you give them.   Help stamp out software-hoarding!  */
++
++#ifndef LIBCPP_FILE_MAP_H
++#define LIBCPP_FILE_MAP_H
++
++const char * remap_file_filename (const char *filename);
++
++int add_file_prefix_map (const char *arg);
++
++#endif /* !LIBCPP_FILE_MAP_H  */
+diff --git a/libcpp/macro.c b/libcpp/macro.c
+index 1e0a0b5..c3d330c 100644
+--- a/libcpp/macro.c
++++ b/libcpp/macro.c
+@@ -26,6 +26,7 @@ along with this program; see the file COPYING3.  If not see
+ #include "system.h"
+ #include "cpplib.h"
+ #include "internal.h"
++#include "file-map.h"
+ 
+ typedef struct macro_arg macro_arg;
+ /* This structure represents the tokens of a macro argument.  These
+@@ -297,6 +298,7 @@ _cpp_builtin_macro_text (cpp_reader *pfile, cpp_hashnode *node)
+ 	    if (!name)
+ 	      abort ();
+ 	  }
++	name = remap_file_filename (name);
+ 	len = strlen (name);
+ 	buf = _cpp_unaligned_alloc (pfile, len * 2 + 3);
+ 	result = buf;
+-- 
+1.9.1
+
-- 
1.9.1


