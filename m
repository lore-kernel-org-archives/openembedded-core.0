Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C27C54E64
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.15009.1709739725969607855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xj7/pnO7;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso887897166b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739724; x=1710344524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QNc/WwLvu3dw2BsRPQvo0P9qLUqtdCVA8QhKuPtAKQ=;
        b=Xj7/pnO749qyJsRCtu4Sq2H2OT6PgoHtX3lKT6SciR1Hq0CZDHzPj0uuC9zt8oPYlo
         FIPXs3qurvCbEJwCRVCPhm2P233RfwAPMTOGoOC+R86A/ErMDELek1CggnJXbQKjNYid
         N3IKsCisnU60GBAxaPYZFoTxRgoF9W3TgmHlle5KSI+8R5/2HUTuCxL1eIgZcICAtDYd
         ceJj092zNB93opyqJnrvUlZgh5iXjiGt6CK7pfsmrWVq7vrPj1ya/MIuzZZd5uQAgqcw
         oTf6HLTOsMOo5V6w1DqJU5H98f7ZYWNSh9vQfBfO5dXxDkItwhy2+ZQh1lcVSW+BLkl5
         jLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739724; x=1710344524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QNc/WwLvu3dw2BsRPQvo0P9qLUqtdCVA8QhKuPtAKQ=;
        b=syS0bzVvKH8cJsLetaA4jmqYwWUxL5ARu+SEBPkxMDG4/Aig24BBAEXP9UeQ7e4vOT
         DE/EEX/5NIuhHb/E6B4EgH/Qa0hIBjaGryGFYZnvc3jC0ExzosT3H15lJxy0AUUb328/
         82awhu94T+a6cHAmWhcqHY3fJ54eFWSFw/GMbT9dD9+URbI7j+2Zk6p2Hy4Q295pcVLP
         asowcGgRv3VZnd3dL1suhNc9RwMW6CvfWqh8nXSyc+MygkoYgbQawk6MPXMFKzHutJR9
         UqBx3cVHKRsEf4sarAoBASd25jvhvwmip5hJ85tbF3KrD3MK9/nV9yH8tn7GQPPTWuqT
         dgPA==
X-Gm-Message-State: AOJu0YwlBNB9xenUbOQWqhGPgFoUEsbSXfsUmZOW03LhWZrVe4NCOQPU
	jxYN5y1fkC9qbrxBEuyvasGzeOiedg7ix2ieAJ2g9JX3SV6KNM/iWST/Pl4T
X-Google-Smtp-Source: AGHT+IF2AW/78TSX7Vt/g7YJ3Y+jYiEVmEbhA3Ke2EEwoUewnodKzBbVJkL/gm3LQcNYQ+mLJ+3g4A==
X-Received: by 2002:a17:906:3642:b0:a45:122b:5637 with SMTP id r2-20020a170906364200b00a45122b5637mr7373929ejb.41.1709739724077;
        Wed, 06 Mar 2024 07:42:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/47] elfutils: upgrade 0.189 -> 0.191
Date: Wed,  6 Mar 2024 16:41:12 +0100
Message-Id: <20240306154151.3741709-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196691

Drop backports:
0001-Add-helper-function-for-basename.patch
0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{elfutils_0.189.bb => elfutils_0.191.bb}  |   7 +-
 ...001-Add-helper-function-for-basename.patch | 404 ------------------
 .../elfutils/files/0001-dso-link-change.patch |  19 +-
 ...libasm-may-link-with-libbz2-if-found.patch |  15 +-
 ...-check-data_list.data.d.d_buf-before.patch |   7 +-
 ...-skip-the-test-when-gcc-not-deployed.patch |   3 +-
 ...m-compile-test_nlist-with-standard-C.patch |   7 +-
 ...against-upcoming-gcc-14-Werror-callo.patch |  39 --
 ...cvt_gunhash-if-dest-and-src-are-same.patch |   9 +-
 .../elfutils/files/0003-fixheadercheck.patch  |   7 +-
 .../elfutils/files/0003-musl-utils.patch      |   9 +-
 .../0006-Fix-build-on-aarch64-musl.patch      |   3 +-
 .../elfutils/files/ptest.patch                |  11 +-
 13 files changed, 45 insertions(+), 495 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.189.bb => elfutils_0.191.bb} (96%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
similarity index 96%
rename from meta/recipes-devtools/elfutils/elfutils_0.189.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.191.bb
index 076ba473580..b3b2476f0f3 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -21,13 +21,11 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-Add-helper-function-for-basename.patch \
-           file://0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "39bd8f1a338e2b7cd4abc3ff11a0eddc6e690f69578a57478d8179b4148708c8"
+SRC_URI[sha256sum] = "df76db71366d1d708365fc7a6c60ca48398f14367eb2b8954efc8897147ad871"
 
 inherit autotools gettext ptest pkgconfig
 
@@ -69,7 +67,7 @@ PTEST_PARALLEL_MAKE = ""
 do_install_ptest() {
 	if [ ${PTEST_ENABLED} = "1" ]; then
 		# copy the files which needed by the cases
-		TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip"
+		TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip srcfiles"
 		install -d -m 755                       ${D}${PTEST_PATH}/src
 		install -d -m 755                       ${D}${PTEST_PATH}/lib
 		install -d -m 755                       ${D}${PTEST_PATH}/libelf
@@ -166,6 +164,7 @@ INHIBIT_PACKAGE_STRIP_FILES = "\
     ${PKGD}${PTEST_PATH}/src/elfclassify \
     ${PKGD}${PTEST_PATH}/src/stack \
     ${PKGD}${PTEST_PATH}/src/unstrip \
+    ${PKGD}${PTEST_PATH}/src/srcfiles \
     ${PKGD}${PTEST_PATH}/libelf/libelf.so \
     ${PKGD}${PTEST_PATH}/libdw/libdw.so \
     ${PKGD}${PTEST_PATH}/libasm/libasm.so \
diff --git a/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch b/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
deleted file mode 100644
index 3e6033fd753..00000000000
--- a/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
+++ /dev/null
@@ -1,404 +0,0 @@
-From 666372a5d8d5a23203c70d583904097c9e49c5a0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Dec 2023 18:23:03 -0800
-Subject: [PATCH] Add helper function for basename
-
-musl does not provide GNU version of basename and lately have removed
-the definiton from string.h [1] which exposes this problem. It can be
-made to work by providing a local implementation of basename which
-implements the GNU basename behavior, this makes it work across C
-libraries which have POSIX implementation only.
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2023q4/006727.html]
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/Makefile.am                      |  2 +-
- lib/libeu.h                          |  1 +
- lib/{libeu.h => xbasename.c}         | 31 ++++++++++------------------
- libdw/dwarf_getsrc_file.c            |  3 ++-
- libdwfl/core-file.c                  |  3 ++-
- libdwfl/dwfl_module_getsrc_file.c    |  3 ++-
- libdwfl/dwfl_segment_report_module.c |  3 ++-
- libdwfl/find-debuginfo.c             |  7 ++++---
- libdwfl/link_map.c                   |  3 ++-
- libdwfl/linux-kernel-modules.c       |  3 ++-
- src/addr2line.c                      |  5 +++--
- src/ar.c                             |  5 +++--
- src/nm.c                             |  4 ++--
- src/stack.c                          |  3 ++-
- src/strip.c                          |  2 +-
- tests/show-die-info.c                |  2 +-
- tests/varlocs.c                      |  2 +-
- 17 files changed, 42 insertions(+), 40 deletions(-)
- copy lib/{libeu.h => xbasename.c} (57%)
-
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -33,7 +33,7 @@ AM_CPPFLAGS += -I$(srcdir)/../libelf
- 
- noinst_LIBRARIES = libeu.a
- 
--libeu_a_SOURCES = xasprintf.c xstrdup.c xstrndup.c xmalloc.c next_prime.c \
-+libeu_a_SOURCES = xasprintf.c xbasename.c xstrdup.c xstrndup.c xmalloc.c next_prime.c \
- 		  crc32.c crc32_file.c \
- 		  color.c error.c printversion.c
- 
---- a/lib/libeu.h
-+++ b/lib/libeu.h
-@@ -42,6 +42,7 @@ extern char *xstrndup (const char *, siz
- extern char *xasprintf(const char *fmt, ...)
- 	__attribute__ ((format (printf, 1, 2))) __attribute__ ((__malloc__));
- 
-+extern const char *xbasename(const char *s);
- extern uint32_t crc32 (uint32_t crc, unsigned char *buf, size_t len);
- extern int crc32_file (int fd, uint32_t *resp);
- 
---- /dev/null
-+++ b/lib/xbasename.c
-@@ -0,0 +1,39 @@
-+/* Convenience function for basename extraction.
-+   Copyright (C) 2023 Khem Raj.
-+   This file is part of elfutils.
-+
-+   This file is free software; you can redistribute it and/or modify
-+   it under the terms of either
-+
-+     * the GNU Lesser General Public License as published by the Free
-+       Software Foundation; either version 3 of the License, or (at
-+       your option) any later version
-+
-+   or
-+
-+     * the GNU General Public License as published by the Free
-+       Software Foundation; either version 2 of the License, or (at
-+       your option) any later version
-+
-+   or both in parallel, as here.
-+
-+   elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received copies of the GNU General Public License and
-+   the GNU Lesser General Public License along with this program.  If
-+   not, see <http://www.gnu.org/licenses/>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <string.h>
-+
-+const char *
-+xbasename(const char *s) {
-+    const char *p = strrchr(s, '/');
-+    return p ? p+1 : s;
-+}
---- a/libdw/dwarf_getsrc_file.c
-+++ b/libdw/dwarf_getsrc_file.c
-@@ -37,6 +37,7 @@
- #include <string.h>
- 
- #include "libdwP.h"
-+#include "libeu.h"
- 
- 
- int
-@@ -98,7 +99,7 @@ dwarf_getsrc_file (Dwarf *dbg, const cha
- 	      /* Match the name with the name the user provided.  */
- 	      const char *fname2 = line->files->info[lastfile].name;
- 	      if (is_basename)
--		lastmatch = strcmp (basename (fname2), fname) == 0;
-+		lastmatch = strcmp (xbasename (fname2), fname) == 0;
- 	      else
- 		lastmatch = strcmp (fname2, fname) == 0;
- 	    }
---- a/libdwfl/core-file.c
-+++ b/libdwfl/core-file.c
-@@ -29,6 +29,7 @@
- 
- #include <config.h>
- #include "libelfP.h"	/* For NOTE_ALIGN.  */
-+#include "libeu.h"
- #include "libdwflP.h"
- #include <gelf.h>
- 
-@@ -595,7 +596,7 @@ dwfl_core_file_report (Dwfl *dwfl, Elf *
-       if (! __libdwfl_dynamic_vaddr_get (module->elf, &file_dynamic_vaddr))
- 	continue;
-       Dwfl_Module *mod;
--      mod = __libdwfl_report_elf (dwfl, basename (module->name), module->name,
-+      mod = __libdwfl_report_elf (dwfl, xbasename (module->name), module->name,
- 				  module->fd, module->elf,
- 				  module->l_ld - file_dynamic_vaddr,
- 				  true, true);
---- a/libdwfl/dwfl_module_getsrc_file.c
-+++ b/libdwfl/dwfl_module_getsrc_file.c
-@@ -31,6 +31,7 @@
- #endif
- 
- #include "libdwflP.h"
-+#include "libeu.h"
- #include "libdwP.h"
- 
- 
-@@ -103,7 +104,7 @@ dwfl_module_getsrc_file (Dwfl_Module *mo
- 		{
- 		  /* Match the name with the name the user provided.  */
- 		  lastfile = file;
--		  lastmatch = !strcmp (is_basename ? basename (file) : file,
-+		  lastmatch = !strcmp (is_basename ? xbasename (file) : file,
- 				       fname);
- 		}
- 	    }
---- a/libdwfl/dwfl_segment_report_module.c
-+++ b/libdwfl/dwfl_segment_report_module.c
-@@ -29,6 +29,7 @@
- 
- #include <config.h>
- #include "libelfP.h"	/* For NOTE_ALIGN4 and NOTE_ALIGN8.  */
-+#include "libeu.h"
- #include "libdwflP.h"
- #include "common.h"
- 
-@@ -718,7 +719,7 @@ dwfl_segment_report_module (Dwfl *dwfl,
- 	      bias += fixup;
- 	      if (module->name[0] != '\0')
- 		{
--		  name = basename (module->name);
-+		  name = xbasename (module->name);
- 		  name_is_final = true;
- 		}
- 	      break;
---- a/libdwfl/find-debuginfo.c
-+++ b/libdwfl/find-debuginfo.c
-@@ -31,6 +31,7 @@
- #endif
- 
- #include "libdwflP.h"
-+#include "libeu.h"
- #include <stdio.h>
- #include <fcntl.h>
- #include <sys/stat.h>
-@@ -164,7 +165,7 @@ find_debuginfo_in_path (Dwfl_Module *mod
- {
-   bool cancheck = debuglink_crc != (GElf_Word) 0;
- 
--  const char *file_basename = file_name == NULL ? NULL : basename (file_name);
-+  const char *file_basename = file_name == NULL ? NULL : xbasename (file_name);
-   char *localname = NULL;
- 
-   /* We invent a debuglink .debug name if NULL, but then want to try the
-@@ -278,7 +279,7 @@ find_debuginfo_in_path (Dwfl_Module *mod
- 	  else
- 	    {
- 	      subdir = NULL;
--	      file = basename (debuglink_file);
-+	      file = xbasename (debuglink_file);
- 	    }
- 	  try_file_basename = debuglink_null;
- 	  break;
-@@ -306,7 +307,7 @@ find_debuginfo_in_path (Dwfl_Module *mod
- 	    if (mod->dw != NULL && (p[0] == '\0' || p[0] == '/'))
- 	      {
- 		fd = try_open (&main_stat, dir, ".dwz",
--			       basename (file), &fname);
-+			       xbasename (file), &fname);
- 		if (fd < 0)
- 		  {
- 		    if (errno != ENOENT && errno != ENOTDIR)
---- a/libdwfl/link_map.c
-+++ b/libdwfl/link_map.c
-@@ -29,6 +29,7 @@
- 
- #include <config.h>
- #include "libdwflP.h"
-+#include "libeu.h"
- #include "memory-access.h"
- #include "system.h"
- 
-@@ -469,7 +470,7 @@ report_r_debug (uint_fast8_t elfclass, u
- 		      if (r_debug_info_module == NULL)
- 			{
- 			  // XXX hook for sysroot
--			  mod = __libdwfl_report_elf (dwfl, basename (name),
-+			  mod = __libdwfl_report_elf (dwfl, xbasename (name),
- 						      name, fd, elf, base,
- 						      true, true);
- 			  if (mod != NULL)
---- a/libdwfl/linux-kernel-modules.c
-+++ b/libdwfl/linux-kernel-modules.c
-@@ -40,6 +40,7 @@
- #include <system.h>
- 
- #include "libelfP.h"
-+#include "libeu.h"
- #include "libdwflP.h"
- #include <inttypes.h>
- #include <errno.h>
-@@ -116,7 +117,7 @@ try_kernel_name (Dwfl *dwfl, char **fnam
- 	/* Try the file's unadorned basename as DEBUGLINK_FILE,
- 	   to look only for "vmlinux" files.  */
- 	fd = INTUSE(dwfl_standard_find_debuginfo) (&fakemod, NULL, NULL, 0,
--						   *fname, basename (*fname),
-+						   *fname, xbasename (*fname),
- 						   0, &fakemod.debug.name);
- 
-       if (fakemod.debug.name != NULL)
---- a/src/addr2line.c
-+++ b/src/addr2line.c
-@@ -38,6 +38,7 @@
- 
- #include <system.h>
- #include <printversion.h>
-+#include "libeu.h"
- 
- 
- /* Name and version of program.  */
-@@ -385,7 +386,7 @@ print_dwarf_function (Dwfl_Module *mod,
- 		  if (file == NULL)
- 		    file = "???";
- 		  else if (only_basenames)
--		    file = basename (file);
-+		    file = xbasename (file);
- 		  else if (use_comp_dir && file[0] != '/')
- 		    {
- 		      const char *const *dirs;
-@@ -568,7 +569,7 @@ print_src (const char *src, int lineno,
-   const char *comp_dir_sep = "";
- 
-   if (only_basenames)
--    src = basename (src);
-+    src = xbasename (src);
-   else if (use_comp_dir && src[0] != '/')
-     {
-       Dwarf_Attribute attr;
---- a/src/ar.c
-+++ b/src/ar.c
-@@ -42,6 +42,7 @@
- #include <printversion.h>
- 
- #include "arlib.h"
-+#include "libeu.h"
- 
- 
- /* Name and version of program.  */
-@@ -1133,7 +1134,7 @@ do_oper_insert (int oper, const char *ar
-       for (int cnt = 0; cnt < argc; ++cnt)
- 	{
- 	  ENTRY entry;
--	  entry.key = full_path ? argv[cnt] : basename (argv[cnt]);
-+	  entry.key = full_path ? argv[cnt] : (char*)xbasename (argv[cnt]);
- 	  entry.data = &argv[cnt];
- 	  if (hsearch (entry, ENTER) == NULL)
- 	    error_exit (errno, _("cannot insert into hash table"));
-@@ -1242,7 +1243,7 @@ do_oper_insert (int oper, const char *ar
-       /* Open all the new files, get their sizes and add all symbols.  */
-       for (int cnt = 0; cnt < argc; ++cnt)
- 	{
--	  const char *bname = basename (argv[cnt]);
-+	  const char *bname = xbasename (argv[cnt]);
- 	  size_t bnamelen = strlen (bname);
- 	  if (found[cnt] == NULL)
- 	    {
---- a/src/nm.c
-+++ b/src/nm.c
-@@ -1417,7 +1417,7 @@ show_symbols (int fd, Ebl *ebl, GElf_Ehd
- 			  int lineno;
- 			  (void) dwarf_lineno (line, &lineno);
- 			  const char *file = dwarf_linesrc (line, NULL, NULL);
--			  file = (file != NULL) ? basename (file) : "???";
-+			  file = (file != NULL) ? xbasename (file) : "???";
- 			  int n;
- 			  n = obstack_printf (&whereob, "%s:%d%c", file,
- 					      lineno, '\0');
-@@ -1448,7 +1448,7 @@ show_symbols (int fd, Ebl *ebl, GElf_Ehd
- 		{
- 		  /* We found the line.  */
- 		  int n = obstack_printf (&whereob, "%s:%" PRIu64 "%c",
--					  basename ((*found)->file),
-+					  xbasename ((*found)->file),
- 					  (*found)->lineno,
- 					  '\0');
- 		  sym_mem[nentries_used].where = obstack_finish (&whereob);
---- a/src/stack.c
-+++ b/src/stack.c
-@@ -31,6 +31,7 @@
- #include <system.h>
- #include <printversion.h>
- 
-+#include "libeu.h"
- /* Name and version of program.  */
- ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
- 
-@@ -152,7 +153,7 @@ module_callback (Dwfl_Module *mod, void
- 
-   int width = get_addr_width (mod);
-   printf ("0x%0*" PRIx64 "-0x%0*" PRIx64 " %s\n",
--	  width, start, width, end, basename (name));
-+	  width, start, width, end, xbasename (name));
- 
-   const unsigned char *id;
-   GElf_Addr id_vaddr;
---- a/src/strip.c
-+++ b/src/strip.c
-@@ -1807,7 +1807,7 @@ handle_elf (int fd, Elf *elf, const char
- 		      elf_errmsg (-1));
- 	}
- 
--      char *debug_basename = basename (debug_fname_embed ?: debug_fname);
-+      const char *debug_basename = xbasename (debug_fname_embed ?: debug_fname);
-       off_t crc_offset = strlen (debug_basename) + 1;
-       /* Align to 4 byte boundary */
-       crc_offset = ((crc_offset - 1) & ~3) + 4;
---- a/tests/show-die-info.c
-+++ b/tests/show-die-info.c
-@@ -26,6 +26,7 @@
- #include <string.h>
- #include <unistd.h>
- 
-+#include "../lib/libeu.h"
- #include "../libdw/known-dwarf.h"
- 
- static const char *
-@@ -318,7 +319,7 @@ main (int argc, char *argv[])
-       int fd = open (argv[cnt], O_RDONLY);
-       Dwarf *dbg;
- 
--      printf ("file: %s\n", basename (argv[cnt]));
-+      printf ("file: %s\n", xbasename (argv[cnt]));
- 
-       dbg = dwarf_begin (fd, DWARF_C_READ);
-       if (dbg == NULL)
---- a/tests/varlocs.c
-+++ b/tests/varlocs.c
-@@ -33,6 +33,7 @@
- 
- #include "system.h"
- #include "../libdw/known-dwarf.h"
-+#include "../lib/libeu.h"
- 
- // The Dwarf, Dwarf_CFIs and address bias of
- // cfi table to adjust DWARF addresses against.
-@@ -1120,7 +1121,7 @@ main (int argc, char *argv[])
- 
- 	  const char *name = (modname[0] != '\0'
- 			      ? modname
--			      :  basename (mainfile));
-+			      :  xbasename (mainfile));
- 	  printf ("module '%s'\n", name);
- 	  print_die (&cudie, "CU", 0);
- 
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -692,7 +692,7 @@ update1_LDADD = $(libelf)
- update2_LDADD = $(libelf)
- update3_LDADD = $(libdw) $(libelf)
- update4_LDADD = $(libdw) $(libelf)
--show_die_info_LDADD = $(libdw) $(libelf)
-+show_die_info_LDADD = $(libeu) $(libdw) $(libelf)
- get_pubnames_LDADD = $(libdw) $(libelf)
- show_abbrev_LDADD = $(libdw) $(libelf)
- get_lines_LDADD = $(libdw) $(libelf)
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
index 6acc0364066..4f7539bef2c 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,4 +1,4 @@
-From c5fb59ac0819b5b6d8244c613cbcf92cb09840c1 Mon Sep 17 00:00:00 2001
+From 63070df4b0dc7af37a720915b5e6494204463c9a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:10:57 +0800
 Subject: [PATCH] dso link change
@@ -16,31 +16,30 @@ more details.
 Rebase to 0.170
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  src/Makefile.am   | 2 +-
  tests/Makefile.am | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 88d0ac8..c28d81f 100644
+index 1d592d4..853eda4 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -45,7 +45,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+@@ -50,7 +50,7 @@ libdebuginfod =
+ endif
  else
  libasm = ../libasm/libasm.so
 -libdw = ../libdw/libdw.so
 +libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
  libelf = ../libelf/libelf.so
- endif
- libebl = ../libebl/libebl.a ../backends/libebl_backends.a ../libcpu/libcpu.a
+ if LIBDEBUGINFOD
+ libdebuginfod = ../debuginfod/libdebuginfod.so
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index c145720..72afd0e 100644
+index 9141074..ee49d07 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -554,7 +554,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+@@ -694,7 +694,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  libasm = ../libasm/libasm.a
  else
 -libdw = ../libdw/libdw.so
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
index 09c9d3ea24a..a9f5e030fc0 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -1,4 +1,4 @@
-From ed1975deeaa47f98d212fd144c8bda075b1a5d36 Mon Sep 17 00:00:00 2001
+From 46d9d889a07fc9f9f089f800e5c0e895889c44ae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 Oct 2017 22:30:46 -0700
 Subject: [PATCH] libasm may link with libbz2 if found
@@ -11,26 +11,29 @@ where indirect libraries may be not found by linker
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index c28d81f..951e978 100644
+index 853eda4..da7f3b4 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -40,11 +40,11 @@ EXTRA_DIST += make-debug-archive.in
+@@ -40,7 +40,7 @@ EXTRA_DIST += make-debug-archive.in
  CLEANFILES += make-debug-archive
  
  if BUILD_STATIC
 -libasm = ../libasm/libasm.a
 +libasm = ../libasm/libasm.a $(zip_LIBS)
  libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
+ if LIBDEBUGINFOD
+@@ -49,7 +49,7 @@ else
+ libdebuginfod =
+ endif
  else
 -libasm = ../libasm/libasm.so
 +libasm = ../libasm/libasm.so $(zip_LIBS)
  libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
  libelf = ../libelf/libelf.so
- endif
+ if LIBDEBUGINFOD
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index c8d55d583a4..57e4b3890ab 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From f40cbd43acdb1fefef4fa53a6034296d83cbff7d Mon Sep 17 00:00:00 2001
+From 19d9e9d838e74e4a0a22f08ae03167380f8aa490 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
@@ -14,16 +14,15 @@ The segmentation fault happens when prelink call elf_end().
 Upstream-Status: Submitted [https://sourceware.org/ml/elfutils-devel/2018-q3/msg00085.html]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
 ---
  libelf/elf_end.c | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf_end.c b/libelf/elf_end.c
-index 160f0b8..5280a70 100644
+index 80f4d13..b103959 100644
 --- a/libelf/elf_end.c
 +++ b/libelf/elf_end.c
-@@ -160,14 +160,16 @@ elf_end (Elf *elf)
+@@ -169,14 +169,16 @@ elf_end (Elf *elf)
  		   architecture doesn't require overly stringent
  		   alignment the raw data buffer is the same as the
  		   one used for presenting to the caller.  */
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
index 0e6bf5573cc..096361e2150 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,4 +1,4 @@
-From 2fa52d61b1abdf4a3f3b153c771fb2081666430c Mon Sep 17 00:00:00 2001
+From f9ab54454000fd210dbaa92cf516084d05060f9d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
 Subject: [PATCH] skip the test when gcc not deployed
@@ -9,7 +9,6 @@ gcc not deployed.
 Upstream-Status: Submitted [https://sourceware.org/ml/elfutils-devel/2019-q2/msg00091.html]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
-
 ---
  tests/run-disasm-x86-64.sh | 2 ++
  tests/run-disasm-x86.sh    | 2 ++
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index a2c0b902277..d410eb13d81 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From e355ca3b8ddcc6e73ee140f53d25634afdaec0da Mon Sep 17 00:00:00 2001
+From 2d4dfb814dda02193e49c9203147cf73e6d3f8b7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
@@ -8,16 +8,15 @@ be reproducible.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  tests/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 2ade5d9..f85cdba 100644
+index 3bd8e58..370c6a8 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -98,7 +98,7 @@ endif
+@@ -103,7 +103,7 @@ endif
  test-nlist$(EXEEXT): test-nlist.c
  	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
  	  $(AM_CPPFLAGS) $(CPPFLAGS) \
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch b/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch
deleted file mode 100644
index 5e0c7e97664..00000000000
--- a/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 901c6a8c78c3c4eee244b9d5298cbd7b9aa713d1 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Thu, 21 Dec 2023 09:23:30 +0000
-Subject: [PATCH] tests: fix build against upcoming `gcc-14`
- (`-Werror=calloc-transposed-args`)
-
-`gcc-14` added a new `-Wcalloc-transposed-args` warning recently. It
-detected minor infelicity in `calloc()` API usage in `elfutils`:
-
-    elfstrmerge.c: In function 'main':
-    elfstrmerge.c:450:32: error:
-      'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
-      450 |   newscnbufs = calloc (sizeof (void *), newshnums);
-          |                                ^~~~
-    elfstrmerge.c:450:32: note: earlier argument should specify number of elements, later size of each element
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=ae580d48278b9924da7503886b37be34378e1b04]
-Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/elfstrmerge.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/elfstrmerge.c b/tests/elfstrmerge.c
-index 56350bb..4eb58bb 100644
---- a/tests/elfstrmerge.c
-+++ b/tests/elfstrmerge.c
-@@ -447,7 +447,7 @@ main (int argc, char **argv)
-     }
- 
-   newshnums = shdrnum - 1;
--  newscnbufs = calloc (sizeof (void *), newshnums);
-+  newscnbufs = calloc (newshnums, sizeof (void *));
-   if (newscnbufs == NULL)
-     fail_errno ("Couldn't allocate memory for new section buffers", NULL);
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index be48ef010bf..fa2282b8dd9 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From 1643d793761216252bb654e28aaa5b8eb1536bca Mon Sep 17 00:00:00 2001
+From d8f07a23d608b744dcc0592f9f32f258b186a77c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
@@ -12,16 +12,15 @@ Signed-off-by: Baoshan Pang <BaoShan.Pang@windriver.com>
 
 Rebase to 0.170
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  libelf/gnuhash_xlate.h | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libelf/gnuhash_xlate.h b/libelf/gnuhash_xlate.h
-index 6faf113..04d9ca1 100644
+index 3a00ae0..40468fc 100644
 --- a/libelf/gnuhash_xlate.h
 +++ b/libelf/gnuhash_xlate.h
-@@ -40,6 +40,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
+@@ -42,6 +42,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
       words.  We must detangle them here.   */
    Elf32_Word *dest32 = dest;
    const Elf32_Word *src32 = src;
@@ -29,7 +28,7 @@ index 6faf113..04d9ca1 100644
  
    /* First four control words, 32 bits.  */
    for (unsigned int cnt = 0; cnt < 4; ++cnt)
-@@ -50,7 +51,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
+@@ -52,7 +53,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
        len -= 4;
      }
  
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index 212b358dc22..e8b986e4ba4 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 7e1f91c42ef5b0bf10afefec10dd08588df3ab1f Mon Sep 17 00:00:00 2001
+From 614f062b22e6da108643f8644a3e92a1108f2b9b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
@@ -16,16 +16,15 @@ Upstream-Status: Pending
 
 Rebase to 0.170
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  libelf/elf32_updatenull.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf32_updatenull.c b/libelf/elf32_updatenull.c
-index d0d4d1e..4ecf5a5 100644
+index 3594e8b..a3314e5 100644
 --- a/libelf/elf32_updatenull.c
 +++ b/libelf/elf32_updatenull.c
-@@ -354,8 +354,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
+@@ -355,8 +355,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
  		     we test for the alignment of the section being large
  		     enough for the largest alignment required by a data
  		     block.  */
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 93f5bdcd00e..230ea88f418 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 262ac90394e36e0b4e86042d9c5385703f5b6536 Mon Sep 17 00:00:00 2001
+From aab5985a29bd7ab6e0b06eaab190b42a04e10f70 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -13,7 +13,6 @@ Upstream-Status: Inappropriate [workaround for musl]
 
 Rebase to 0.177
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  src/arlib.h       | 6 ++++++
  src/elfcompress.c | 7 +++++++
@@ -39,7 +38,7 @@ index d4a4221..f6336d9 100644
  /* State of -D/-U flags.  */
  extern bool arlib_deterministic_output;
 diff --git a/src/elfcompress.c b/src/elfcompress.c
-index 18ade66..a6ed4e1 100644
+index f771b92..263de62 100644
 --- a/src/elfcompress.c
 +++ b/src/elfcompress.c
 @@ -37,6 +37,13 @@
@@ -57,7 +56,7 @@ index 18ade66..a6ed4e1 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/strip.c b/src/strip.c
-index 2a2cc80..8e9f773 100644
+index 6436443..1608496 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -45,6 +45,13 @@
@@ -75,7 +74,7 @@ index 2a2cc80..8e9f773 100644
  
  /* Name and version of program.  */
 diff --git a/src/unstrip.c b/src/unstrip.c
-index d5bd182..d797823 100644
+index d70053d..b8a6ff3 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -51,6 +51,15 @@
diff --git a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
index 8942ad7828b..149e0e6a7b9 100644
--- a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
@@ -1,4 +1,4 @@
-From 2396fd67d81e54e18fbad67a5ff67d5684a01013 Mon Sep 17 00:00:00 2001
+From 4409f128c81a9d76b9360b002a1d76043c77b53e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:27:30 +0800
 Subject: [PATCH] Fix build on aarch64/musl
@@ -16,7 +16,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Rebase to 0.170
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  backends/aarch64_initreg.c | 4 ++--
  backends/arm_initreg.c     | 2 +-
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index fe6f272a83c..2152875d63d 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From bfbf393e7d5b1b41df85ce1c37e887776c45d529 Mon Sep 17 00:00:00 2001
+From d49f6a135762ec1f1831d0e80b8df2a4269b0a66 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 16:37:48 +0100
 Subject: [PATCH] Changes to allow ptest to run standalone on target:
@@ -14,7 +14,6 @@ d) Add an oecheck make target which we can use to build the test binaries we nee
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Inappropriate [oe specific]
-
 ---
  configure.ac       | 2 +-
  tests/Makefile.am  | 2 ++
@@ -22,10 +21,10 @@ Upstream-Status: Inappropriate [oe specific]
  3 files changed, 3 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d345495..67933d1 100644
+index bbe8673..488712b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -48,7 +48,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2021 The elfutils developers.])
+@@ -49,7 +49,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2024 The elfutils developers.])
  AC_PREREQ(2.63)			dnl Minimum Autoconf version required.
  
  dnl We use GNU make extensions; automake 1.10 defaults to -Wportability.
@@ -35,10 +34,10 @@ index d345495..67933d1 100644
  
  AM_SILENT_RULES([yes])
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 72afd0e..a2dfd43 100644
+index ee49d07..3bd8e58 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -698,3 +698,5 @@ check: check-am coverage
+@@ -852,3 +852,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif
-- 
2.39.2


