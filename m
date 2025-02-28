Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0079C19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 06:14:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.9944.1740723268962278689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 22:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=grjlAdgB;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223378e2b0dso26787395ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 22:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740723268; x=1741328068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tB2AoQg/eG6I5uGTTnojyl8xh6T6exIpbdRUpXIkFMo=;
        b=grjlAdgBgC80g9kSxlPyV+wJd4HJ4ppJfVwZgR5myRcCtJx2R3HN8ynUg/dC7zSHl7
         bBTTa4zPMsb++jfinlaB1abhwyE9FXZdTrtSU25uXit/rnUmS/BV2KOxhz7Ar14RPESM
         zIG3gr+DiTzsQuzLfukAZglc7myTW4XpZYnR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740723268; x=1741328068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tB2AoQg/eG6I5uGTTnojyl8xh6T6exIpbdRUpXIkFMo=;
        b=kFMDR6oRllYr+Wu6QC3ZZv12pQglOStz8VeCHXTKTOGNuXgY8E8TgjBYczR5b/1MFi
         Ki244zNSyMvVn9qYD8BeeCDywE6KhpZSJAgFW8RnWr65HbgIGAimTRymWLih6ZVuBapc
         u8vg3ipoiKdlFFQdUha/TW9PwYSMxJ7FVUmDORj5NAATuslomAhsLNBT5hZ0vPKxcSzv
         VBDUV+DXxSDp4D9ZeTnDsVpQZ5YdISR5m0LCAI+5UMQMiS8u2i7BZ6Ezv7aHAx0uc7EK
         arLcbKsVZfYxo17qKl3wQcIi0tL08L4lmrP2vE/XJBjjo+lCBYPo2I4mqqez/osUMN3x
         BquQ==
X-Gm-Message-State: AOJu0YzDfjNTqBt1n4EDw3iCH1zpCLUT2St+AKEVUSqs3trQ87XEhUA6
	G8jfwcm+bmqE/IVqAPPgTvZ5CpC5G9xNV5Vn53e4KSE60SNZ1yUgR54EeZZ35hLnb6mXUNttm2B
	I
X-Gm-Gg: ASbGncs0sVgJktA2xZg94HXP3FOJui5Du6vlVI79yxZNRCimZA4jeq2IUv0Jk9JEJiq
	9k/FCOnEXmID2WhpmRCQGTUsj8TWAVl4NrhnR4t50R5WT5kpBOHXRvdsupYCT2hXFFJGlt8gFR2
	X4RP/GiQlicfndDdqKKKbE9+sp32e/tBiHYtAyGvFpjyEWquqbL5u7SKB3H4BXjdWY5nqHsom7+
	dUTpmJ/ewq5atqsFNWXoeURJq4yMKJdwgFuOGUxOrOHFUmFJwjOAiGQG7D11PMbMaqffq8e+VYk
	8oN/Va7ySkp/ZEXGgGihMNBbcUOFteF3LWviSNzu
X-Google-Smtp-Source: AGHT+IGZ4k73Jfhu1IoEUOHsjsHHYKwymqDJA4rndJm/fuhbFjSbKqwwrNfx+qQOmBUs7lqqHSEwHg==
X-Received: by 2002:a05:6a00:2e03:b0:730:9567:c3d5 with SMTP id d2e1a72fcca58-734ac3385ddmr4083204b3a.4.1740723267868;
        Thu, 27 Feb 2025 22:14:27 -0800 (PST)
Received: from MVIN00016.mvista.com ([103.250.136.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734ec1da824sm601715b3a.170.2025.02.27.22.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 22:14:27 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] elfutils: Fix multiple CVEs
Date: Fri, 28 Feb 2025 11:44:11 +0530
Message-Id: <20250228061411.182828-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 06:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212051

Backport fixes for:

* CVE-2025-1352 - Upstream-Status: Backport from https://sourceware.org/git/?p=elfutils.git;a=commit;h=2636426a091bd6c6f7f02e49ab20d4cdc6bfc753
* CVE-2025-1372 - Upstream-Status: Backport from https://sourceware.org/git/?p=elfutils.git;a=commit;h=73db9d2021cab9e23fd734b0a76a612d52a6f1db

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../elfutils/elfutils_0.186.bb                |   2 +
 .../elfutils/files/CVE-2025-1352.patch        | 153 ++++++++++++++++++
 .../elfutils/files/CVE-2025-1372.patch        |  50 ++++++
 3 files changed, 205 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.186.bb b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
index d742a2e14e..b945766b75 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.186.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
@@ -23,6 +23,8 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-debuginfod-fix-compilation-on-platforms-without-erro.patch \
            file://0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch \
+           file://CVE-2025-1352.patch \
+           file://CVE-2025-1372.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
new file mode 100644
index 0000000000..ac56a3d2a5
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
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=2636426a091bd6c6f7f02e49ab20d4cdc6bfc753]
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
+index 13bee49..b19edfe 100644
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
+@@ -84,12 +85,7 @@ __libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu, Dwarf_Off offset,
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
+@@ -182,5 +178,5 @@ dwarf_getabbrev (Dwarf_Die *die, Dwarf_Off offset, size_t *lengthp)
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
+index 64d1689..829cc21 100644
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
+index 360ad01..05b8364 100644
+--- a/libdw/libdwP.h
++++ b/libdw/libdwP.h
+@@ -673,8 +673,7 @@ extern Dwarf_Abbrev *__libdw_findabbrev (struct Dwarf_CU *cu,
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
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch
new file mode 100644
index 0000000000..b60eba4201
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
+index 256165d..48eee26 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -12719,7 +12719,7 @@ dump_data_section (Elf_Scn *scn, const GElf_Shdr *shdr, const char *name)
+ 			_("Couldn't uncompress section"),
+ 			elf_ndxscn (scn));
+ 	    }
+-	  else if (startswith (name, ".zdebug"))
++	  else if (name && startswith (name, ".zdebug"))
+ 	    {
+ 	      if (elf_compress_gnu (scn, 0, 0) < 0)
+ 		printf ("WARNING: %s [%zd]\n",
+@@ -12770,7 +12770,7 @@ print_string_section (Elf_Scn *scn, const GElf_Shdr *shdr, const char *name)
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
2.25.1


