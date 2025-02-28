Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4812BC282C1
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 14:43:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17293.1740753820015550693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 06:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MxiRuzzP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22339936bbfso34157005ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 06:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740753819; x=1741358619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Anzw26hT0btYJggRdJNF9oeU+K3ey8K6PU2A/mhNB3Y=;
        b=MxiRuzzPdkZAj9gTU3hozvESIR8AnR6Z3Y3umC8jNCIs9FyfmsF8dmxF4jkF/FhT2Y
         apeAcrHyVHV7XtSGfqK+wC6txmpijt05Ei1bkNXYcuRVf6b8Ezu2PaazRYcd7nJYc7Xp
         QzpABvLaMD6b42FfPLDo/OW/rFDhDCkteYbMcC8dBBr1Ez7glzMDKa5wa0chKIGIh2sf
         /cWfWcYYCFnJ5TicghSyjhzV6hr1gWEH8hv1A+SDFkG99OSb8s4KnkEVvx37mGFPbRSH
         +wOxd/KbmpJQBepU1u8cs+cbRgabiAFpmUNlZN7VlF8OPHA3mETVUiMOJsxqBOJUnaxh
         zPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740753819; x=1741358619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Anzw26hT0btYJggRdJNF9oeU+K3ey8K6PU2A/mhNB3Y=;
        b=LHofQ5T6XdQNmNDq/6nOKUL98KeE1F+KRXCh5vW2zL5yGEdmGL1HyNXNfw7gL6c6zr
         +JTKhwiV37x9GJ/qFIhonNat3nhJb9enLbYPszmCzsRyUQiWWfbULa9+lxzMwvTzLyuz
         p2/JyHu//awmVdC7NSLEZJ8u183CcCAFJERWy+EXQRJ9MwZ9Os4vzzHVP9hs4WqYgJW3
         uDINhUKg14G94zFKlGKMuwJWvu8pA2zLHHUsJglwWA+J5HKB44F909trMJYGSuV3pVZZ
         yox50uQDwtjUqkm1VLydAZGY28qx4U51hxOv6mWVl9z6bSoCFx1z+2XVmYqpYd97Hdli
         9UCQ==
X-Gm-Message-State: AOJu0Yw8AMEcEiMNSFcnNuYchx3Hn1N2pjcOzZrVovJWPjScmsN11Vek
	QF9dhtaxp5OZhXkg4DVvI1IL6shLeKkJHNe2NFRUM2TfQIzLfthOi5AEKKf1fMDclM8Xo12CTQC
	4
X-Gm-Gg: ASbGncsojgbjFQPjacgH6DFKtDZQ4mF2FmJ74DciGLvOAzwoK5HsB/MVirT6NNBadnn
	J5THpEEQFCYuT1z8q2xCEAe/2hrZxBVIrU6+EQr6bT9SItwNLaiq9AnIi3gPETwY6gUpLZltjzQ
	0JcFIXqcFLd9t4Y6EvnnVZqtr2yUo8tEdWj74aiPpF7B3J4jY1cBvCBrEqFcNYmcqb5QwOfnhmD
	sBLXweDbTwKGOHpzWcci0mGfxz0VDtjPVwcKChsVdf2S+t3dhrL1ipCKZiHCg1X02vyvA2eaXj4
	RcRp+aj3jWPXZqw=
X-Google-Smtp-Source: AGHT+IH/trhP3+UHv0CB8PkEzBsCiztt8cxJCifrQ0IN7wrEY8CjT6PIEerOItzQhBeToJlCwbkT5g==
X-Received: by 2002:aa7:8888:0:b0:730:9659:ff4b with SMTP id d2e1a72fcca58-734ac401ecdmr6397505b3a.19.1740753818962;
        Fri, 28 Feb 2025 06:43:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe6cd66sm3806559b3a.74.2025.02.28.06.43.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:43:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/4] elfutils: Fix multiple CVEs
Date: Fri, 28 Feb 2025 06:42:57 -0800
Message-ID: <938676089fb5da383b7daf6c5e6348079ecf5674.1740753632.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740753632.git.steve@sakoman.com>
References: <cover.1740753632.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 14:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212061

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:

* CVE-2025-1352 - Upstream-Status: Backport from https://sourceware.org/git/?p=elfutils.git;a=commit;h=2636426a091bd6c6f7f02e49ab20d4cdc6bfc753
* CVE-2025-1365 - Upstream-Status: Backport from https://sourceware.org/git/?p=elfutils.git;a=commit;h=5e5c0394d82c53e97750fe7b18023e6f84157b81
* CVE-2025-1372 - Upstream-Status: Backport from https://sourceware.org/git/?p=elfutils.git;a=commit;h=73db9d2021cab9e23fd734b0a76a612d52a6f1db

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.191.bb                |   3 +
 .../elfutils/files/CVE-2025-1352.patch        | 153 ++++++++++++++++++
 .../elfutils/files/CVE-2025-1365.patch        | 151 +++++++++++++++++
 .../elfutils/files/CVE-2025-1372.patch        |  50 ++++++
 4 files changed, 357 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index c4d872430b..85e024179b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -23,6 +23,9 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-debuginfod-Remove-unused-variable.patch \
            file://0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch \
+           file://CVE-2025-1352.patch \
+           file://CVE-2025-1365.patch \
+           file://CVE-2025-1372.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
new file mode 100644
index 0000000000..5710905449
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
@@ -0,0 +1,153 @@
+From 2636426a091bd6c6f7f02e49ab20d4cdc6bfc753 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sat, 8 Feb 2025 20:00:12 +0100
+Subject: [PATCH] libdw: Simplify __libdw_getabbrev and fix dwarf_offabbrev
+ issue
+
+__libdw_getabbrev could crash on reading a bad abbrev by trying to
+deallocate memory it didn't allocate itself. This could happen because
+dwarf_offabbrev would supply its own memory when calling
+__libdw_getabbrev. No other caller did this.
+
+Simplify the __libdw_getabbrev common code by not taking external
+memory to put the abbrev result in (this would also not work correctly
+if the abbrev was already cached). And make dwarf_offabbrev explicitly
+copy the result (if there was no error or end of abbrev).
+
+     * libdw/dwarf_getabbrev.c (__libdw_getabbrev): Don't take
+     Dwarf_Abbrev result argument. Always just allocate abb when
+     abbrev not found in cache.
+     (dwarf_getabbrev): Don't pass NULL as last argument to
+     __libdw_getabbrev.
+    * libdw/dwarf_tag.c (__libdw_findabbrev): Likewise.
+    * libdw/dwarf_offabbrev.c (dwarf_offabbrev): Likewise. And copy
+    abbrev into abbrevp on success.
+    * libdw/libdw.h (dwarf_offabbrev): Document return values.
+    * libdw/libdwP.h (__libdw_getabbrev): Don't take Dwarf_Abbrev
+    result argument.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32650
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=2636426a091bd6c6f7f02e49ab20d4cdc6bfc753]
+CVE: CVE-2025-1352
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libdw/dwarf_getabbrev.c | 12 ++++--------
+ libdw/dwarf_offabbrev.c | 10 +++++++---
+ libdw/dwarf_tag.c       |  3 +--
+ libdw/libdw.h           |  4 +++-
+ libdw/libdwP.h          |  3 +--
+ 5 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/libdw/dwarf_getabbrev.c b/libdw/dwarf_getabbrev.c
+index 5b02333..d9a6c02 100644
+--- a/libdw/dwarf_getabbrev.c
++++ b/libdw/dwarf_getabbrev.c
+@@ -1,5 +1,6 @@
+ /* Get abbreviation at given offset.
+    Copyright (C) 2003, 2004, 2005, 2006, 2014, 2017 Red Hat, Inc.
++   Copyright (C) 2025 Mark J. Wielaard <mark@klomp.org>
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2003.
+ 
+@@ -38,7 +39,7 @@
+ Dwarf_Abbrev *
+ internal_function
+ __libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu, Dwarf_Off offset,
+-		   size_t *lengthp, Dwarf_Abbrev *result)
++		   size_t *lengthp)
+ {
+   /* Don't fail if there is not .debug_abbrev section.  */
+   if (dbg->sectiondata[IDX_debug_abbrev] == NULL)
+@@ -85,12 +86,7 @@ __libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu, Dwarf_Off offset,
+   Dwarf_Abbrev *abb = NULL;
+   if (cu == NULL
+       || (abb = Dwarf_Abbrev_Hash_find (&cu->abbrev_hash, code)) == NULL)
+-    {
+-      if (result == NULL)
+-	abb = libdw_typed_alloc (dbg, Dwarf_Abbrev);
+-      else
+-	abb = result;
+-    }
++    abb = libdw_typed_alloc (dbg, Dwarf_Abbrev);
+   else
+     {
+       foundit = true;
+@@ -183,5 +179,5 @@ dwarf_getabbrev (Dwarf_Die *die, Dwarf_Off offset, size_t *lengthp)
+       return NULL;
+     }
+ 
+-  return __libdw_getabbrev (dbg, cu, abbrev_offset + offset, lengthp, NULL);
++  return __libdw_getabbrev (dbg, cu, abbrev_offset + offset, lengthp);
+ }
+diff --git a/libdw/dwarf_offabbrev.c b/libdw/dwarf_offabbrev.c
+index 27cdad6..41df69b 100644
+--- a/libdw/dwarf_offabbrev.c
++++ b/libdw/dwarf_offabbrev.c
+@@ -41,11 +41,15 @@ dwarf_offabbrev (Dwarf *dbg, Dwarf_Off offset, size_t *lengthp,
+   if (dbg == NULL)
+     return -1;
+ 
+-  Dwarf_Abbrev *abbrev = __libdw_getabbrev (dbg, NULL, offset, lengthp,
+-					    abbrevp);
++  Dwarf_Abbrev *abbrev = __libdw_getabbrev (dbg, NULL, offset, lengthp);
+ 
+   if (abbrev == NULL)
+     return -1;
+ 
+-  return abbrev == DWARF_END_ABBREV ? 1 : 0;
++  if (abbrev == DWARF_END_ABBREV)
++    return 1;
++
++  *abbrevp = *abbrev;
++
++  return 0;
+ }
+diff --git a/libdw/dwarf_tag.c b/libdw/dwarf_tag.c
+index d784970..218382a 100644
+--- a/libdw/dwarf_tag.c
++++ b/libdw/dwarf_tag.c
+@@ -53,8 +53,7 @@ __libdw_findabbrev (struct Dwarf_CU *cu, unsigned int code)
+ 
+ 	/* Find the next entry.  It gets automatically added to the
+ 	   hash table.  */
+-	abb = __libdw_getabbrev (cu->dbg, cu, cu->last_abbrev_offset, &length,
+-				 NULL);
++	abb = __libdw_getabbrev (cu->dbg, cu, cu->last_abbrev_offset, &length);
+ 	if (abb == NULL || abb == DWARF_END_ABBREV)
+ 	  {
+ 	    /* Make sure we do not try to search for it again.  */
+diff --git a/libdw/libdw.h b/libdw/libdw.h
+index d53dc78..ec4713a 100644
+--- a/libdw/libdw.h
++++ b/libdw/libdw.h
+@@ -587,7 +587,9 @@ extern int dwarf_srclang (Dwarf_Die *die);
+ extern Dwarf_Abbrev *dwarf_getabbrev (Dwarf_Die *die, Dwarf_Off offset,
+ 				      size_t *lengthp);
+ 
+-/* Get abbreviation at given offset in .debug_abbrev section.  */
++/* Get abbreviation at given offset in .debug_abbrev section.  On
++   success return zero and fills in ABBREVP.  When there is no (more)
++   abbrev at offset returns one.  On error returns a negative value.  */
+ extern int dwarf_offabbrev (Dwarf *dbg, Dwarf_Off offset, size_t *lengthp,
+ 			    Dwarf_Abbrev *abbrevp)
+      __nonnull_attribute__ (4);
+diff --git a/libdw/libdwP.h b/libdw/libdwP.h
+index 8b2f06f..f0f4b78 100644
+--- a/libdw/libdwP.h
++++ b/libdw/libdwP.h
+@@ -783,8 +783,7 @@ extern Dwarf_Abbrev *__libdw_findabbrev (struct Dwarf_CU *cu,
+ 
+ /* Get abbreviation at given offset.  */
+ extern Dwarf_Abbrev *__libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu,
+-					Dwarf_Off offset, size_t *lengthp,
+-					Dwarf_Abbrev *result)
++					Dwarf_Off offset, size_t *lengthp)
+      __nonnull_attribute__ (1) internal_function;
+ 
+ /* Get abbreviation of given DIE, and optionally set *READP to the DIE memory
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch
new file mode 100644
index 0000000000..002ce334a3
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch
@@ -0,0 +1,151 @@
+From 5e5c0394d82c53e97750fe7b18023e6f84157b81 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sat, 8 Feb 2025 21:44:56 +0100
+Subject: [PATCH] libelf, readelf: Use validate_str also to check dynamic
+ symstr data
+
+When dynsym/str was read through eu-readelf --dynamic by readelf
+process_symtab the string data was not validated, possibly printing
+unallocated memory past the end of the symstr data. Fix this by
+turning the elf_strptr validate_str function into a generic
+lib/system.h helper function and use it in readelf to validate the
+strings before use.
+
+	* libelf/elf_strptr.c (validate_str): Remove to...
+	* lib/system.h (validate_str): ... here. Make inline, simplify
+	check and document.
+	* src/readelf.c (process_symtab): Use validate_str on symstr_data.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32654
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=5e5c0394d82c53e97750fe7b18023e6f84157b81]
+CVE: CVE-2025-1365
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/system.h        | 27 +++++++++++++++++++++++++++
+ libelf/elf_strptr.c | 18 ------------------
+ src/readelf.c       | 18 +++++++++++++++---
+ 3 files changed, 42 insertions(+), 21 deletions(-)
+
+diff --git a/lib/system.h b/lib/system.h
+index 0db12d9..0698e5f 100644
+--- a/lib/system.h
++++ b/lib/system.h
+@@ -34,6 +34,7 @@
+ #include <config.h>
+ 
+ #include <errno.h>
++#include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <string.h>
+@@ -117,6 +118,32 @@ startswith (const char *str, const char *prefix)
+   return strncmp (str, prefix, strlen (prefix)) == 0;
+ }
+ 
++/* Return TRUE if STR[FROM] is a valid string with a zero terminator
++   at or before STR[TO - 1].  Note FROM is an index into the STR
++   array, while TO is the maximum size of the STR array.  This
++   function returns FALSE when TO is zero or FROM >= TO.  */
++static inline bool
++validate_str (const char *str, size_t from, size_t to)
++{
++#if HAVE_DECL_MEMRCHR
++  // Check end first, which is likely a zero terminator,
++  // to prevent function call
++  return (to > 0
++	  && (str[to - 1] == '\0'
++	      || (to > from
++		  && memrchr (&str[from], '\0', to - from - 1) != NULL)));
++#else
++  do {
++    if (to <= from)
++      return false;
++
++    to--;
++  } while (str[to]);
++
++  return true;
++#endif
++}
++
+ /* A special gettext function we use if the strings are too short.  */
+ #define sgettext(Str) \
+   ({ const char *__res = strrchr (_(Str), '|');			      \
+diff --git a/libelf/elf_strptr.c b/libelf/elf_strptr.c
+index 79a24d2..c5a94f8 100644
+--- a/libelf/elf_strptr.c
++++ b/libelf/elf_strptr.c
+@@ -53,24 +53,6 @@ get_zdata (Elf_Scn *strscn)
+   return zdata;
+ }
+ 
+-static bool validate_str (const char *str, size_t from, size_t to)
+-{
+-#if HAVE_DECL_MEMRCHR
+-  // Check end first, which is likely a zero terminator, to prevent function call
+-  return ((to > 0 && str[to - 1]  == '\0')
+-	  || (to - from > 0 && memrchr (&str[from], '\0', to - from - 1) != NULL));
+-#else
+-  do {
+-    if (to <= from)
+-      return false;
+-
+-    to--;
+-  } while (str[to]);
+-
+-  return true;
+-#endif
+-}
+-
+ char *
+ elf_strptr (Elf *elf, size_t idx, size_t offset)
+ {
+diff --git a/src/readelf.c b/src/readelf.c
+index 0e93118..63eb548 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -2639,6 +2639,7 @@ process_symtab (Ebl *ebl, unsigned int nsyms, Elf64_Word idx,
+       char typebuf[64];
+       char bindbuf[64];
+       char scnbuf[64];
++      const char *sym_name;
+       Elf32_Word xndx;
+       GElf_Sym sym_mem;
+       GElf_Sym *sym
+@@ -2650,6 +2651,19 @@ process_symtab (Ebl *ebl, unsigned int nsyms, Elf64_Word idx,
+       /* Determine the real section index.  */
+       if (likely (sym->st_shndx != SHN_XINDEX))
+         xndx = sym->st_shndx;
++      if (use_dynamic_segment == true)
++	{
++	  if (validate_str (symstr_data->d_buf, sym->st_name,
++			    symstr_data->d_size))
++	    sym_name = (char *)symstr_data->d_buf + sym->st_name;
++	  else
++	    sym_name = NULL;
++	}
++      else
++	sym_name = elf_strptr (ebl->elf, idx, sym->st_name);
++
++      if (sym_name == NULL)
++	sym_name = "???";
+ 
+       printf (_ ("\
+ %5u: %0*" PRIx64 " %6" PRId64 " %-7s %-6s %-9s %6s %s"),
+@@ -2662,9 +2676,7 @@ process_symtab (Ebl *ebl, unsigned int nsyms, Elf64_Word idx,
+               get_visibility_type (GELF_ST_VISIBILITY (sym->st_other)),
+               ebl_section_name (ebl, sym->st_shndx, xndx, scnbuf,
+                                 sizeof (scnbuf), NULL, shnum),
+-              use_dynamic_segment == true
+-                  ? (char *)symstr_data->d_buf + sym->st_name
+-                  : elf_strptr (ebl->elf, idx, sym->st_name));
++              sym_name);
+ 
+       if (versym_data != NULL)
+         {
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch
new file mode 100644
index 0000000000..812a098447
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch
@@ -0,0 +1,50 @@
+From 73db9d2021cab9e23fd734b0a76a612d52a6f1db Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sun, 9 Feb 2025 00:07:39 +0100
+Subject: [PATCH] readelf: Skip trying to uncompress sections without a name
+
+When combining eu-readelf -z with -x or -p to dump the data or strings
+in an (corrupted ELF) unnamed numbered section eu-readelf could crash
+trying to check whether the section name starts with .zdebug. Fix this
+by skipping sections without a name.
+
+   * src/readelf.c (dump_data_section): Don't try to gnu decompress a
+   section without a name.
+   (print_string_section): Likewise.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32656
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=73db9d2021cab9e23fd734b0a76a612d52a6f1db]
+CVE: CVE-2025-1372
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/readelf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/readelf.c b/src/readelf.c
+index 63eb548..fc04556 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -13327,7 +13327,7 @@ dump_data_section (Elf_Scn *scn, const GElf_Shdr *shdr, const char *name)
+ 			_("Couldn't uncompress section"),
+ 			elf_ndxscn (scn));
+ 	    }
+-	  else if (startswith (name, ".zdebug"))
++	  else if (name && startswith (name, ".zdebug"))
+ 	    {
+ 	      if (elf_compress_gnu (scn, 0, 0) < 0)
+ 		printf ("WARNING: %s [%zd]\n",
+@@ -13378,7 +13378,7 @@ print_string_section (Elf_Scn *scn, const GElf_Shdr *shdr, const char *name)
+ 			_("Couldn't uncompress section"),
+ 			elf_ndxscn (scn));
+ 	    }
+-	  else if (startswith (name, ".zdebug"))
++	  else if (name && startswith (name, ".zdebug"))
+ 	    {
+ 	      if (elf_compress_gnu (scn, 0, 0) < 0)
+ 		printf ("WARNING: %s [%zd]\n",
+-- 
+2.25.1
+
-- 
2.43.0


