Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6E9ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 17:39:33 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.9476.1663781964992232180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 10:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PiYQCLIv;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id b21so6369699plz.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=mkS8tCR3uXgsJelqB3yf6sPnVvr+1jnJ+KGg2L5gNXk=;
        b=PiYQCLIvMWwcWK7f0iER34maNPhLZq1CoHdhgf+xBI2aF2bE+d3vdxHTGPdtBvHHMe
         16ofnmS5ZLYEsWqzZ3kIjCBi+CjhG5Zn5iKvcWjQBP6BEmL5PxGHYB9juio77gr9NURd
         cASFYFxRcVBnx4L5qnVF+/Y1ir1J9mMpiY6yimRMT+kr7OHgoqgetLS0Syf4Cbpqtysh
         zQ1b8yg6acKkaGZwSEmFxr6BkkRe3u79P8cbWvY+Em9IwxiVNIKRD48vzHwhEgrUV7EY
         nGLCVHNxA9i+WkHWlpVI8ZCFPa8ph0wlTik5fV5rl9GjI2rD/LIOkSnwBiT8fr6nIk04
         3eOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=mkS8tCR3uXgsJelqB3yf6sPnVvr+1jnJ+KGg2L5gNXk=;
        b=FeQonnVmdVrNvytf80xVBVy3MiVY1y0o3CHFg62gk2bMyKm/KKlaTgtJTE+Dh1QEr8
         sBcGk3VRDnqIHuNxO8RHxeEgT77qpzitF+RbQUnCrlNeFbXKgIG6hBgaGwHHAojExMmc
         nOY3xwZqQUFFCPLI6JcsdUNHdqPk5XLj52Rw6dX1ISRWYr0THbAHX0T1+AWoBpUQ5wK4
         6/6URHWGb62bqG4D4anG7hwoexs+ODaEY6O7G4YVBWbbSxoTvJtN4Gjomej+MVbLCm2N
         mPTCmN0OwgQdIznFzlT31mfQy45Du5JDd7Sr3buGg4RYM7JA3snzxZKEdvyahNEU1uOa
         v9ew==
X-Gm-Message-State: ACrzQf1RALzA5PMhChEpSUCcQ6vb+ooGmqtt5BH5ESN5moGNfL6SbaZ8
	V4wegwsA1boYJSuCWgQNtL4Vc9TUEVE=
X-Google-Smtp-Source: 
 AMsMyM4UgUALd3T8fFR7K64j8NBAMHzG2Ju2mCymnpG8dywulkieTVIatyLhDevtZGaaTYVV9X5kvQ==
X-Received: by 2002:a17:902:7596:b0:178:b625:4084 with SMTP id
 j22-20020a170902759600b00178b6254084mr5677970pll.170.1663781963588;
        Wed, 21 Sep 2022 10:39:23 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 z2-20020a17090a1fc200b001f262f6f717sm2265988pjz.3.2022.09.21.10.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 10:39:23 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] binutils : Fix CVE-2022-38128
Date: Wed, 21 Sep 2022 23:09:17 +0530
Message-Id: <20220921173917.962548-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 17:39:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170957

From: pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f07c08e115e27cddf5a0030dc6332bbee1bd9c6a]
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=175b91507b83ad42607d2f6dadaf55b7b511bdbe]
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=695c6dfe7e85006b98c8b746f3fd5f913c94ebff]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../binutils/binutils-2.39.inc                |   3 +
 .../binutils/0014-CVE-2022-38128-1.patch      | 350 ++++++++++++
 .../binutils/0014-CVE-2022-38128-2.patch      | 536 ++++++++++++++++++
 .../binutils/0014-CVE-2022-38128-3.patch      |  95 ++++
 4 files changed, 984 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-3.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.39.inc b/meta/recipes-devtools/binutils/binutils-2.39.inc
index e4fdb73243..b040e57037 100644
--- a/meta/recipes-devtools/binutils/binutils-2.39.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.39.inc
@@ -32,6 +32,9 @@ SRC_URI = "\
      file://0011-Check-for-clang-before-checking-gcc-version.patch \
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-CVE-2022-38533.patch \
+     file://0014-CVE-2022-38128-1.patch \
+     file://0014-CVE-2022-38128-2.patch \
+     file://0014-CVE-2022-38128-3.patch \
 "
 S  = "${WORKDIR}/git"
 # Already in 2.39 branch
diff --git a/meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-1.patch b/meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-1.patch
new file mode 100644
index 0000000000..0a490d86b3
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-1.patch
@@ -0,0 +1,350 @@
+From f07c08e115e27cddf5a0030dc6332bbee1bd9c6a Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 21 Jul 2022 08:38:14 +0930
+Subject: [PATCH] binutils/dwarf.c: abbrev caching
+
+I'm inclined to think that abbrev caching is counter-productive.  The
+time taken to search the list of abbrevs converted to internal form is
+non-zero, and it's easy to decode the raw abbrevs.  It's especially
+silly to cache empty lists of decoded abbrevs (happens with zero
+padding in .debug_abbrev), or abbrevs as they are displayed when there
+is no further use of those abbrevs.  This patch stops caching in those
+cases.
+
+	* dwarf.c (record_abbrev_list_for_cu): Add free_list param.
+	Put abbrevs on abbrev_lists here.
+	(new_abbrev_list): Delete function.
+	(process_abbrev_set): Return newly allocated list.  Move
+	abbrev base, offset and size checking to..
+	(find_and_process_abbrev_set): ..here, new function.  Handle
+	lookup of cached abbrevs here, and calculate start and end
+	for process_abbrev_set.  Return free_list if newly alloc'd.
+	(process_debug_info): Consolidate cached list lookup, new list
+	alloc and processing into find_and_process_abbrev_set call.
+	Free list when not cached.
+	(display_debug_abbrev): Similarly.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f07c08e115e27cddf5a0030dc6332bbee1bd9c6a]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ binutils/dwarf.c | 208 +++++++++++++++++++++++++----------------------
+ 1 file changed, 110 insertions(+), 98 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 267ed3bb382..2fc352f74c5 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -882,8 +882,15 @@ static unsigned long  next_free_abbrev_m
+ #define ABBREV_MAP_ENTRIES_INCREMENT   8
+ 
+ static void
+-record_abbrev_list_for_cu (dwarf_vma start, dwarf_vma end, abbrev_list * list)
++record_abbrev_list_for_cu (dwarf_vma start, dwarf_vma end,
++			   abbrev_list *list, abbrev_list *free_list)
+ {
++  if (free_list != NULL)
++    {
++      list->next = abbrev_lists;
++      abbrev_lists = list;
++    }
++
+   if (cu_abbrev_map == NULL)
+     {
+       num_abbrev_map_entries = INITIAL_NUM_ABBREV_MAP_ENTRIES;
+@@ -936,20 +943,6 @@ free_all_abbrevs (void)
+ }
+ 
+ static abbrev_list *
+-new_abbrev_list (dwarf_vma abbrev_base, dwarf_vma abbrev_offset)
+-{
+-  abbrev_list * list = (abbrev_list *) xcalloc (sizeof * list, 1);
+-
+-  list->abbrev_base = abbrev_base;
+-  list->abbrev_offset = abbrev_offset;
+-
+-  list->next = abbrev_lists;
+-  abbrev_lists = list;
+-
+-  return list;
+-}
+-
+-static abbrev_list *
+ find_abbrev_list_by_abbrev_offset (dwarf_vma abbrev_base,
+ 				   dwarf_vma abbrev_offset)
+ {
+@@ -966,7 +959,7 @@ find_abbrev_list_by_abbrev_offset (dwarf
+ /* Find the abbreviation map for the CU that includes OFFSET.
+    OFFSET is an absolute offset from the start of the .debug_info section.  */
+ /* FIXME: This function is going to slow down readelf & objdump.
+-   Consider using a better algorithm to mitigate this effect.  */
++   Not caching abbrevs is likely the answer.  */
+ 
+ static  abbrev_map *
+ find_abbrev_map_by_offset (dwarf_vma offset)
+@@ -1033,40 +1026,18 @@ add_abbrev_attr (unsigned long    attrib
+   list->last_abbrev->last_attr = attr;
+ }
+ 
+-/* Processes the (partial) contents of a .debug_abbrev section.
+-   Returns NULL if the end of the section was encountered.
+-   Returns the address after the last byte read if the end of
+-   an abbreviation set was found.  */
++/* Return processed (partial) contents of a .debug_abbrev section.
++   Returns NULL on errors.  */
+ 
+-static unsigned char *
++static abbrev_list *
+ process_abbrev_set (struct dwarf_section *section,
+-		    dwarf_vma abbrev_base,
+-		    dwarf_vma abbrev_size,
+-		    dwarf_vma abbrev_offset,
+-		    abbrev_list *list)
++		    unsigned char *start,
++		    unsigned char *end)
+ {
+-  if (abbrev_base >= section->size
+-      || abbrev_size > section->size - abbrev_base)
+-    {
+-      /* PR 17531: file:4bcd9ce9.  */
+-      warn (_("Debug info is corrupted, abbrev size (%lx) is larger than "
+-	      "abbrev section size (%lx)\n"),
+-	      (unsigned long) (abbrev_base + abbrev_size),
+-	      (unsigned long) section->size);
+-      return NULL;
+-    }
+-  if (abbrev_offset >= abbrev_size)
+-    {
+-      warn (_("Debug info is corrupted, abbrev offset (%lx) is larger than "
+-	      "abbrev section size (%lx)\n"),
+-	    (unsigned long) abbrev_offset,
+-	    (unsigned long) abbrev_size);
+-      return NULL;
+-    }
++  abbrev_list *list = xmalloc (sizeof (*list));
++  list->first_abbrev = NULL;
++  list->last_abbrev = NULL;
+ 
+-  unsigned char *start = section->start + abbrev_base;
+-  unsigned char *end = start + abbrev_size;
+-  start += abbrev_offset;
+   while (start < end)
+     {
+       unsigned long entry;
+@@ -1079,14 +1050,18 @@ process_abbrev_set (struct dwarf_section
+       /* A single zero is supposed to end the set according
+ 	 to the standard.  If there's more, then signal that to
+ 	 the caller.  */
+-      if (start == end)
+-	return NULL;
+-      if (entry == 0)
+-	return start;
++      if (start == end || entry == 0)
++	{
++	  list->start_of_next_abbrevs = start != end ? start : NULL;
++	  return list;
++	}
+ 
+       READ_ULEB (tag, start, end);
+       if (start == end)
+-	return NULL;
++	{
++	  free (list);
++	  return NULL;
++	}
+ 
+       children = *start++;
+ 
+@@ -1121,9 +1096,67 @@ process_abbrev_set (struct dwarf_section
+   /* Report the missing single zero which ends the section.  */
+   error (_(".debug_abbrev section not zero terminated\n"));
+ 
++  free (list);
+   return NULL;
+ }
+ 
++/* Return a sequence of abbrevs in SECTION starting at ABBREV_BASE
++   plus ABBREV_OFFSET and finishing at ABBREV_BASE + ABBREV_SIZE.
++   If FREE_LIST is non-NULL search the already decoded abbrevs on
++   abbrev_lists first and if found set *FREE_LIST to NULL.  If
++   searching doesn't find a matching abbrev, set *FREE_LIST to the
++   newly allocated list.  If FREE_LIST is NULL, no search is done and
++   the returned abbrev_list is always newly allocated.  */
++
++static abbrev_list *
++find_and_process_abbrev_set (struct dwarf_section *section,
++			     dwarf_vma abbrev_base,
++			     dwarf_vma abbrev_size,
++			     dwarf_vma abbrev_offset,
++			     abbrev_list **free_list)
++{
++  if (free_list)
++    *free_list = NULL;
++
++  if (abbrev_base >= section->size
++      || abbrev_size > section->size - abbrev_base)
++    {
++      /* PR 17531: file:4bcd9ce9.  */
++      warn (_("Debug info is corrupted, abbrev size (%lx) is larger than "
++	      "abbrev section size (%lx)\n"),
++	      (unsigned long) (abbrev_base + abbrev_size),
++	      (unsigned long) section->size);
++      return NULL;
++    }
++  if (abbrev_offset >= abbrev_size)
++    {
++      warn (_("Debug info is corrupted, abbrev offset (%lx) is larger than "
++	      "abbrev section size (%lx)\n"),
++	    (unsigned long) abbrev_offset,
++	    (unsigned long) abbrev_size);
++      return NULL;
++    }
++
++  unsigned char *start = section->start + abbrev_base + abbrev_offset;
++  unsigned char *end = section->start + abbrev_base + abbrev_size;
++  abbrev_list *list = NULL;
++  if (free_list)
++    list = find_abbrev_list_by_abbrev_offset (abbrev_base, abbrev_offset);
++  if (list == NULL)
++    {
++      list = process_abbrev_set (section, start, end);
++      if (list)
++	{
++	  list->abbrev_base = abbrev_base;
++	  list->abbrev_offset = abbrev_offset;
++	  list->next = NULL;
++	}
++      if (free_list)
++	*free_list = list;
++    }
++  return list;
++}
++
+ static const char *
+ get_TAG_name (unsigned long tag)
+ {
+@@ -3670,7 +3703,6 @@ process_debug_info (struct dwarf_section
+       dwarf_vma                 cu_offset;
+       unsigned int              offset_size;
+       struct cu_tu_set *        this_set;
+-      abbrev_list *             list;
+       unsigned char *end_cu;
+ 
+       hdrptr = start;
+@@ -3726,22 +3758,18 @@ process_debug_info (struct dwarf_section
+ 	  abbrev_size = this_set->section_sizes [DW_SECT_ABBREV];
+ 	}
+ 
+-      list = find_abbrev_list_by_abbrev_offset (abbrev_base,
+-						compunit.cu_abbrev_offset);
+-      if (list == NULL)
+-	{
+-	  unsigned char *  next;
+-
+-	  list = new_abbrev_list (abbrev_base,
+-				  compunit.cu_abbrev_offset);
+-	  next = process_abbrev_set (&debug_displays[abbrev_sec].section,
+-				     abbrev_base, abbrev_size,
+-				     compunit.cu_abbrev_offset, list);
+-	  list->start_of_next_abbrevs = next;
+-	}
+-
++      abbrev_list *list;
++      abbrev_list *free_list;
++      list = find_and_process_abbrev_set (&debug_displays[abbrev_sec].section,
++					  abbrev_base, abbrev_size,
++					  compunit.cu_abbrev_offset,
++					  &free_list);
+       start = end_cu;
+-      record_abbrev_list_for_cu (cu_offset, start - section_begin, list);
++      if (list != NULL && list->first_abbrev != NULL)
++	record_abbrev_list_for_cu (cu_offset, start - section_begin,
++				   list, free_list);
++      else if (free_list != NULL)
++	free_abbrev_list (free_list);
+     }
+ 
+   for (start = section_begin, unit = 0; start < end; unit++)
+@@ -3757,7 +3785,6 @@ process_debug_info (struct dwarf_section
+       struct cu_tu_set *this_set;
+       dwarf_vma abbrev_base;
+       size_t abbrev_size;
+-      abbrev_list * list = NULL;
+       unsigned char *end_cu;
+ 
+       hdrptr = start;
+@@ -3936,20 +3963,10 @@ process_debug_info (struct dwarf_section
+ 	}
+ 
+       /* Process the abbrevs used by this compilation unit.  */
+-      list = find_abbrev_list_by_abbrev_offset (abbrev_base,
+-						compunit.cu_abbrev_offset);
+-      if (list == NULL)
+-	{
+-	  unsigned char *next;
+-
+-	  list = new_abbrev_list (abbrev_base,
+-				  compunit.cu_abbrev_offset);
+-	  next = process_abbrev_set (&debug_displays[abbrev_sec].section,
+-				     abbrev_base, abbrev_size,
+-				     compunit.cu_abbrev_offset, list);
+-	  list->start_of_next_abbrevs = next;
+-	}
+-
++      abbrev_list *list;
++      list = find_and_process_abbrev_set (&debug_displays[abbrev_sec].section,
++					  abbrev_base, abbrev_size,
++					  compunit.cu_abbrev_offset, NULL);
+       level = 0;
+       last_level = level;
+       saved_level = -1;
+@@ -4128,6 +4145,8 @@ process_debug_info (struct dwarf_section
+ 	  if (entry->children)
+ 	    ++level;
+ 	}
++      if (list != NULL)
++	free_abbrev_list (list);
+     }
+ 
+   /* Set num_debug_info_entries here so that it can be used to check if
+@@ -6353,24 +6372,15 @@ display_debug_abbrev (struct dwarf_secti
+ 
+   do
+     {
+-      abbrev_list *    list;
+-      dwarf_vma        offset;
+-
+-      offset = start - section->start;
+-      list = find_abbrev_list_by_abbrev_offset (0, offset);
++      dwarf_vma offset = start - section->start;
++      abbrev_list *list = find_and_process_abbrev_set (section, 0,
++						       section->size, offset,
++						       NULL);
+       if (list == NULL)
+-	{
+-	  list = new_abbrev_list (0, offset);
+-	  start = process_abbrev_set (section, 0, section->size, offset, list);
+-	  list->start_of_next_abbrevs = start;
+-	}
+-      else
+-	start = list->start_of_next_abbrevs;
+-
+-      if (list->first_abbrev == NULL)
+-	continue;
++	break;
+ 
+-      printf (_("  Number TAG (0x%lx)\n"), (long) offset);
++      if (list->first_abbrev)
++	printf (_("  Number TAG (0x%lx)\n"), (long) offset);
+ 
+       for (entry = list->first_abbrev; entry; entry = entry->next)
+ 	{
+@@ -6391,6 +6401,8 @@ display_debug_abbrev (struct dwarf_secti
+ 	      putchar ('\n');
+ 	    }
+ 	}
++      start = list->start_of_next_abbrevs;
++      free_abbrev_list (list);
+     }
+   while (start);
+ 
diff --git a/meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-2.patch b/meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-2.patch
new file mode 100644
index 0000000000..e30b4d86e1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-2.patch
@@ -0,0 +1,536 @@
+From 175b91507b83ad42607d2f6dadaf55b7b511bdbe Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 20 Jul 2022 18:28:50 +0930
+Subject: [PATCH] miscellaneous dwarf.c tidies
+
+	* dwarf.c: Leading and trailing whitespace fixes.
+	(free_abbrev_list): New function.
+	(free_all_abbrevs): Use the above.  Free cu_abbrev_map here too.
+	(process_abbrev_set): Print actual section name on error.
+	(get_type_abbrev_from_form): Add overflow check.
+	(free_debug_memory): Don't free cu_abbrev_map here..
+	(process_debug_info): ..or here.  Warn on another case of not
+	finding a neeeded abbrev.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=175b91507b83ad42607d2f6dadaf55b7b511bdbe]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ binutils/dwarf.c | 216 +++++++++++++++++++++++------------------------
+ 1 file changed, 106 insertions(+), 110 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 2b1eec49422..267ed3bb382 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -806,7 +806,7 @@ fetch_indexed_value (dwarf_vma idx,
+       pointer_size = 4;
+       bias = 12;
+     }
+- 
++
+   dwarf_vma offset = idx * pointer_size;
+ 
+   /* Offsets are biased by the size of the section header
+@@ -908,38 +908,41 @@ record_abbrev_list_for_cu (dwarf_vma sta
+   next_free_abbrev_map_entry ++;
+ }
+ 
+-static void
+-free_all_abbrevs (void)
++static abbrev_list *
++free_abbrev_list (abbrev_list *list)
+ {
+-  abbrev_list *  list;
++  abbrev_entry *abbrv = list->first_abbrev;
+ 
+-  for (list = abbrev_lists; list != NULL;)
++  while (abbrv)
+     {
+-      abbrev_list *   next = list->next;
+-      abbrev_entry *  abbrv;
++      abbrev_attr *attr = abbrv->first_attr;
+ 
+-      for (abbrv = list->first_abbrev; abbrv != NULL;)
++      while (attr)
+ 	{
+-	  abbrev_entry *  next_abbrev = abbrv->next;
+-	  abbrev_attr *   attr;
+-
+-	  for (attr = abbrv->first_attr; attr;)
+-	    {
+-	      abbrev_attr *next_attr = attr->next;
+-
+-	      free (attr);
+-	      attr = next_attr;
+-	    }
+-
+-	  free (abbrv);
+-	  abbrv = next_abbrev;
++	  abbrev_attr *next_attr = attr->next;
++	  free (attr);
++	  attr = next_attr;
+ 	}
+ 
+-      free (list);
+-      list = next;
++      abbrev_entry *next_abbrev = abbrv->next;
++      free (abbrv);
++      abbrv = next_abbrev;
+     }
+ 
+-  abbrev_lists = NULL;
++  abbrev_list *next = list->next;
++  free (list);
++  return next;
++}
++
++static void
++free_all_abbrevs (void)
++{
++  while (abbrev_lists)
++    abbrev_lists = free_abbrev_list (abbrev_lists);
++
++  free (cu_abbrev_map);
++  cu_abbrev_map = NULL;
++  next_free_abbrev_map_entry = 0;
+ }
+ 
+ static abbrev_list *
+@@ -971,7 +974,7 @@ find_abbrev_map_by_offset (dwarf_vma off
+ 	&& cu_abbrev_map[i].end > offset)
+       return cu_abbrev_map + i;
+ 
+-  return NULL;	
++  return NULL;
+ }
+ 
+ static void
+@@ -1094,7 +1097,7 @@ process_abbrev_set (struct dwarf_section
+     }
+ 
+   /* Report the missing single zero which ends the section.  */
+-  error (_(".debug_abbrev section not zero terminated\n"));
++  error (_("%s section not zero terminated\n"), section->name);
+ 
+   free (list);
+   return NULL;
+@@ -1875,7 +1878,7 @@ fetch_alt_indirect_string (dwarf_vma off
+ 	dwarf_vmatoa ("x", offset));
+   return _("<offset is too big>");
+ }
+-	
++
+ static const char *
+ get_AT_name (unsigned long attribute)
+ {
+@@ -2157,7 +2160,8 @@ get_type_abbrev_from_form (unsigned long
+     case DW_FORM_ref4:
+     case DW_FORM_ref8:
+     case DW_FORM_ref_udata:
+-      if (uvalue + cu_offset > (size_t) (cu_end - section->start))
++      if (uvalue + cu_offset < uvalue
++	  || uvalue + cu_offset > (size_t) (cu_end - section->start))
+ 	{
+ 	  warn (_("Unable to resolve ref form: uvalue %lx + cu_offset %lx > CU size %lx\n"),
+ 		uvalue, (long) cu_offset, (long) (cu_end - section->start));
+@@ -2194,7 +2198,7 @@ get_type_abbrev_from_form (unsigned long
+       else
+ 	*map_return = NULL;
+     }
+-	
++
+   READ_ULEB (abbrev_number, data, section->start + section->size);
+ 
+   for (entry = map->list->first_abbrev; entry != NULL; entry = entry->next)
+@@ -2783,10 +2787,10 @@ read_and_display_attr_value (unsigned lo
+ 	  if (form == DW_FORM_loclistx)
+ 	    {
+ 	      if (dwo)
+-	        {
+-	          index = fetch_indexed_value (uvalue, loclists_dwo, 0);
+-	          index += (offset_size == 8) ? 20 : 12;
+-	        }
++		{
++		  index = fetch_indexed_value (uvalue, loclists_dwo, 0);
++		  index += (offset_size == 8) ? 20 : 12;
++		}
+ 	      else if (debug_info_p == NULL)
+ 		{
+ 		  index = fetch_indexed_value (uvalue, loclists, 0);
+@@ -2804,21 +2808,21 @@ read_and_display_attr_value (unsigned lo
+ 	  else if (form == DW_FORM_rnglistx)
+ 	    {
+ 	      if (dwo)
+-	        {
+-	          index = fetch_indexed_value (uvalue, rnglists_dwo, 0);
+-	          index += (offset_size == 8) ? 20 : 12;
+-	        }
++		{
++		  index = fetch_indexed_value (uvalue, rnglists_dwo, 0);
++		  index += (offset_size == 8) ? 20 : 12;
++		}
+ 	      else
+-	        {
+-	          if (debug_info_p == NULL)
+-	            base = 0;
+-	          else
+-	            base = debug_info_p->rnglists_base;
+-	          /* We do not have a cached value this time, so we perform the
+-	             computation manually.  */
+-	          index = fetch_indexed_value (uvalue, rnglists, base);
+-	          index += base;
+-	        }
++		{
++		  if (debug_info_p == NULL)
++		    base = 0;
++		  else
++		    base = debug_info_p->rnglists_base;
++		  /* We do not have a cached value this time, so we perform the
++		     computation manually.  */
++		  index = fetch_indexed_value (uvalue, rnglists, base);
++		  index += base;
++		}
+ 	    }
+ 	  else
+ 	    {
+@@ -2844,7 +2848,7 @@ read_and_display_attr_value (unsigned lo
+       if (!do_loc)
+ 	printf ("%c<0x%s>", delimiter, dwarf_vmatoa ("x", uvalue + cu_offset));
+       break;
+-      
++
+     default:
+       warn (_("Unrecognized form: 0x%lx\n"), form);
+       /* What to do?  Consume a byte maybe?  */
+@@ -2869,9 +2873,9 @@ read_and_display_attr_value (unsigned lo
+ 	case DW_AT_rnglists_base:
+ 	  if (debug_info_p->rnglists_base)
+ 	    warn (_("CU @ 0x%s has multiple rnglists_base values (0x%s and 0x%s)"),
+-	          dwarf_vmatoa ("x", debug_info_p->cu_offset),
+-	          dwarf_vmatoa ("x", debug_info_p->rnglists_base),
+-	          dwarf_vmatoa ("x", uvalue));
++		  dwarf_vmatoa ("x", debug_info_p->cu_offset),
++		  dwarf_vmatoa ("x", debug_info_p->rnglists_base),
++		  dwarf_vmatoa ("x", uvalue));
+ 	  debug_info_p->rnglists_base = uvalue;
+ 	  break;
+ 	case DW_AT_str_offsets_base:
+@@ -3021,7 +3025,7 @@ read_and_display_attr_value (unsigned lo
+ 	      case DW_FORM_strx3:
+ 	      case DW_FORM_strx4:
+ 		add_dwo_name (fetch_indexed_string (uvalue, this_set, offset_size, false,
+-		                                    debug_info_p->str_offsets_base),
++						    debug_info_p->str_offsets_base),
+ 			      cu_offset);
+ 		break;
+ 	      case DW_FORM_string:
+@@ -3055,7 +3059,7 @@ read_and_display_attr_value (unsigned lo
+ 	      case DW_FORM_strx3:
+ 	      case DW_FORM_strx4:
+ 		add_dwo_dir (fetch_indexed_string (uvalue, this_set, offset_size, false,
+-		                                   debug_info_p->str_offsets_base),
++						   debug_info_p->str_offsets_base),
+ 			     cu_offset);
+ 		break;
+ 	      case DW_FORM_string:
+@@ -3686,11 +3690,8 @@ process_debug_info (struct dwarf_section
+     introduce (section, false);
+ 
+   free_all_abbrevs ();
+-  free (cu_abbrev_map);
+-  cu_abbrev_map = NULL;
+-  next_free_abbrev_map_entry = 0;
+ 
+-  /* In order to be able to resolve DW_FORM_ref_attr forms we need
++  /* In order to be able to resolve DW_FORM_ref_addr forms we need
+      to load *all* of the abbrevs for all CUs in this .debug_info
+      section.  This does effectively mean that we (partially) read
+      every CU header twice.  */
+@@ -4045,12 +4046,11 @@ process_debug_info (struct dwarf_section
+ 
+ 	  /* Scan through the abbreviation list until we reach the
+ 	     correct entry.  */
+-	  if (list == NULL)
+-	    continue;
+-
+-	  for (entry = list->first_abbrev; entry != NULL; entry = entry->next)
+-	    if (entry->number == abbrev_number)
+-	      break;
++	  entry = NULL;
++	  if (list != NULL)
++	    for (entry = list->first_abbrev; entry != NULL; entry = entry->next)
++	      if (entry->number == abbrev_number)
++		break;
+ 
+ 	  if (entry == NULL)
+ 	    {
+@@ -4074,7 +4074,7 @@ process_debug_info (struct dwarf_section
+ 	      break;
+ 	    case DW_TAG_compile_unit:
+ 	    case DW_TAG_skeleton_unit:
+-	      need_base_address = 1;	
++	      need_base_address = 1;
+ 	      need_dwo_info = do_loc;
+ 	      break;
+ 	    case DW_TAG_entry_point:
+@@ -4459,7 +4459,7 @@ display_debug_sup (struct dwarf_section
+ 
+   SAFE_BYTE_GET_AND_INC (is_supplementary, start, 1, end);
+   if (is_supplementary != 0 && is_supplementary != 1)
+-    warn (_("corrupt .debug_sup section: is_supplementary not 0 or 1\n"));    
++    warn (_("corrupt .debug_sup section: is_supplementary not 0 or 1\n"));
+ 
+   sup_filename = start;
+   if (is_supplementary && sup_filename[0] != 0)
+@@ -5638,7 +5638,7 @@ display_debug_lines_decoded (struct dwar
+ 			printf ("%s  %11d  %#18" DWARF_VMA_FMT "x",
+ 				newFileName, state_machine_regs.line,
+ 				state_machine_regs.address);
+-		    }			
++		    }
+ 		  else
+ 		    {
+ 		      if (xop == -DW_LNE_end_sequence)
+@@ -6092,7 +6092,7 @@ display_debug_macro (struct dwarf_sectio
+   load_debug_section_with_follow (str, file);
+   load_debug_section_with_follow (line, file);
+   load_debug_section_with_follow (str_index, file);
+-  
++
+   introduce (section, false);
+ 
+   while (curr < end)
+@@ -6537,7 +6537,7 @@ display_loc_list (struct dwarf_section *
+ 
+       /* Check base address specifiers.  */
+       if (is_max_address (begin, pointer_size)
+-          && !is_max_address (end, pointer_size))
++	  && !is_max_address (end, pointer_size))
+ 	{
+ 	  base_address = end;
+ 	  print_dwarf_vma (begin, pointer_size);
+@@ -6715,7 +6715,7 @@ display_loclists_list (struct dwarf_sect
+ 	case DW_LLE_default_location:
+ 	  begin = end = 0;
+ 	  break;
+-	  
++
+ 	case DW_LLE_offset_pair:
+ 	  READ_ULEB (begin, start, section_end);
+ 	  begin += base_address;
+@@ -7011,7 +7011,7 @@ display_offset_entry_loclists (struct dw
+   unsigned char *  start = section->start;
+   unsigned char * const end = start + section->size;
+ 
+-  introduce (section, false);  
++  introduce (section, false);
+ 
+   do
+     {
+@@ -7060,14 +7060,14 @@ display_offset_entry_loclists (struct dw
+ 		section->name, segment_selector_size);
+ 	  return 0;
+ 	}
+-      
++
+       if (offset_entry_count == 0)
+ 	{
+ 	  warn (_("The %s section contains a table without offset\n"),
+ 		section->name);
+ 	  return 0;
+ 	}
+-  
++
+       printf (_("\n   Offset Entries starting at 0x%lx:\n"),
+ 	      (long)(start - section->start));
+ 
+@@ -8229,7 +8229,7 @@ display_debug_rnglists (struct dwarf_sec
+ 	  start = display_debug_rnglists_list
+ 	    (start, end, address_size, offset, 0, offset_size);
+ 	  if (start >= end)
+-	    break;	  
++	    break;
+ 	}
+ 
+       start = end;
+@@ -8347,12 +8347,12 @@ display_debug_ranges (struct dwarf_secti
+       next = section_begin + offset + debug_info_p->rnglists_base;
+ 
+       /* If multiple DWARF entities reference the same range then we will
+-         have multiple entries in the `range_entries' list for the same
+-         offset.  Thanks to the sort above these will all be consecutive in
+-         the `range_entries' list, so we can easily ignore duplicates
+-         here.  */
++	 have multiple entries in the `range_entries' list for the same
++	 offset.  Thanks to the sort above these will all be consecutive in
++	 the `range_entries' list, so we can easily ignore duplicates
++	 here.  */
+       if (i > 0 && last_offset == offset)
+-        continue;
++	continue;
+       last_offset = offset;
+ 
+       if (dwarf_check != 0 && i > 0)
+@@ -10286,7 +10286,7 @@ display_debug_names (struct dwarf_sectio
+ 	  printf (_("Out of %lu items there are %zu bucket clashes"
+ 		    " (longest of %zu entries).\n"),
+ 		  (unsigned long) name_count, hash_clash_count, longest_clash);
+-	  
++
+ 	  if (name_count != buckets_filled + hash_clash_count)
+ 	    warn (_("The name_count (%lu) is not the same as the used bucket_count (%lu) + the hash clash count (%lu)"),
+ 		  (unsigned long) name_count,
+@@ -10390,7 +10390,7 @@ display_debug_names (struct dwarf_sectio
+ 		break;
+ 	      if (tagno >= 0)
+ 		printf ("%s<%lu>",
+-		        (tagno == 0 && second_abbrev_tag == 0 ? " " : "\n\t"),
++			(tagno == 0 && second_abbrev_tag == 0 ? " " : "\n\t"),
+ 			(unsigned long) abbrev_tag);
+ 
+ 	      for (entry = abbrev_lookup;
+@@ -10919,7 +10919,7 @@ process_cu_tu_index (struct dwarf_sectio
+ 	 Check for integer overflow (can occur when size_t is 32-bit)
+ 	 with overlarge ncols or nused values.  */
+       if (nused == -1u
+-	  || _mul_overflow ((size_t) ncols, 4, &temp)	  
++	  || _mul_overflow ((size_t) ncols, 4, &temp)
+ 	  || _mul_overflow ((size_t) nused + 1, temp, &total)
+ 	  || total > (size_t) (limit - ppool))
+ 	{
+@@ -10927,7 +10927,7 @@ process_cu_tu_index (struct dwarf_sectio
+ 		section->name);
+ 	  return 0;
+ 	}
+-      
++
+       if (do_display)
+ 	{
+ 	  printf (_("  Offset table\n"));
+@@ -11431,8 +11431,8 @@ add_separate_debug_file (const char * fi
+ 
+ static bool
+ debuginfod_fetch_separate_debug_info (struct dwarf_section * section,
+-                                      char ** filename,
+-                                      void * file)
++				      char ** filename,
++				      void * file)
+ {
+   size_t build_id_len;
+   unsigned char * build_id;
+@@ -11450,14 +11450,14 @@ debuginfod_fetch_separate_debug_info (st
+ 
+       filelen = strnlen ((const char *)section->start, section->size);
+       if (filelen == section->size)
+-        /* Corrupt debugaltlink.  */
+-        return false;
++	/* Corrupt debugaltlink.  */
++	return false;
+ 
+       build_id = section->start + filelen + 1;
+       build_id_len = section->size - (filelen + 1);
+ 
+       if (build_id_len == 0)
+-        return false;
++	return false;
+     }
+   else
+     return false;
+@@ -11469,25 +11469,25 @@ debuginfod_fetch_separate_debug_info (st
+ 
+       client = debuginfod_begin ();
+       if (client == NULL)
+-        return false;
++	return false;
+ 
+       /* Query debuginfod servers for the target file. If found its path
+-         will be stored in filename.  */
++	 will be stored in filename.  */
+       fd = debuginfod_find_debuginfo (client, build_id, build_id_len, filename);
+       debuginfod_end (client);
+ 
+       /* Only free build_id if we allocated space for a hex string
+-         in get_build_id ().  */
++	 in get_build_id ().  */
+       if (build_id_len == 0)
+-        free (build_id);
++	free (build_id);
+ 
+       if (fd >= 0)
+-        {
+-          /* File successfully retrieved. Close fd since we want to
+-             use open_debug_file () on filename instead.  */
+-          close (fd);
+-          return true;
+-        }
++	{
++	  /* File successfully retrieved. Close fd since we want to
++	     use open_debug_file () on filename instead.  */
++	  close (fd);
++	  return true;
++	}
+     }
+ 
+   return false;
+@@ -11500,7 +11500,7 @@ load_separate_debug_info (const char *
+ 			  parse_func_type         parse_func,
+ 			  check_func_type         check_func,
+ 			  void *                  func_data,
+-                          void *                  file ATTRIBUTE_UNUSED)
++			  void *                  file ATTRIBUTE_UNUSED)
+ {
+   const char *   separate_filename;
+   char *         debug_filename;
+@@ -11616,11 +11616,11 @@ load_separate_debug_info (const char *
+ 						 & tmp_filename,
+ 						 file))
+       {
+-        /* File successfully downloaded from server, replace
+-           debug_filename with the file's path.  */
+-        free (debug_filename);
+-        debug_filename = tmp_filename;
+-        goto found;
++	/* File successfully downloaded from server, replace
++	   debug_filename with the file's path.  */
++	free (debug_filename);
++	debug_filename = tmp_filename;
++	goto found;
+       }
+   }
+ #endif
+@@ -11787,12 +11787,12 @@ load_build_id_debug_file (const char * m
+   /* In theory we should extract the contents of the section into
+      a note structure and then check the fields.  For now though
+      just use hard coded offsets instead:
+-     
++
+        Field  Bytes    Contents
+ 	NSize  0...3   4
+ 	DSize  4...7   8+
+ 	Type   8..11   3  (NT_GNU_BUILD_ID)
+-        Name   12.15   GNU\0
++	Name   12.15   GNU\0
+ 	Data   16....   */
+ 
+   /* FIXME: Check the name size, name and type fields.  */
+@@ -11804,7 +11804,7 @@ load_build_id_debug_file (const char * m
+       warn (_(".note.gnu.build-id data size is too small\n"));
+       return;
+     }
+-  
++
+   if (build_id_size > (section->size - 16))
+     {
+       warn (_(".note.gnu.build-id data size is too bug\n"));
+@@ -12100,10 +12100,6 @@ free_debug_memory (void)
+ 
+   free_all_abbrevs ();
+ 
+-  free (cu_abbrev_map);
+-  cu_abbrev_map = NULL;
+-  next_free_abbrev_map_entry = 0;
+-
+   free (shndx_pool);
+   shndx_pool = NULL;
+   shndx_pool_size = 0;
diff --git a/meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-3.patch b/meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-3.patch
new file mode 100644
index 0000000000..04d06ed6b6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-3.patch
@@ -0,0 +1,95 @@
+From 695c6dfe7e85006b98c8b746f3fd5f913c94ebff Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 21 Jul 2022 09:56:15 +0930
+Subject: [PATCH] PR29370, infinite loop in display_debug_abbrev
+
+The PR29370 testcase is a fuzzed object file with multiple
+.trace_abbrev sections.  Multiple .trace_abbrev or .debug_abbrev
+sections are not a violation of the DWARF standard.  The DWARF5
+standard even gives an example of multiple .debug_abbrev sections
+contained in groups.  Caching and lookup of processed abbrevs thus
+needs to be done by section and offset rather than base and offset.
+(Why base anyway?)  Or, since section contents are kept, by a pointer
+into the contents.
+
+	PR 29370
+	* dwarf.c (struct abbrev_list): Replace abbrev_base and
+	abbrev_offset with raw field.
+	(find_abbrev_list_by_abbrev_offset): Delete.
+	(find_abbrev_list_by_raw_abbrev): New function.
+	(process_abbrev_set): Set list->raw and list->next.
+	(find_and_process_abbrev_set): Replace abbrev list lookup with
+	new function.  Don't set list abbrev_base, abbrev_offset or next.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=695c6dfe7e85006b98c8b746f3fd5f913c94ebff]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ binutils/dwarf.c | 19 ++++++-------------
+ 1 file changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 2fc352f74c5..99fb3566994 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -856,8 +856,7 @@ typedef struct abbrev_list
+ {
+   abbrev_entry *        first_abbrev;
+   abbrev_entry *        last_abbrev;
+-  dwarf_vma             abbrev_base;
+-  dwarf_vma             abbrev_offset;
++  unsigned char *       raw;
+   struct abbrev_list *  next;
+   unsigned char *       start_of_next_abbrevs;
+ }
+@@ -946,14 +945,12 @@ free_all_abbrevs (void)
+ }
+ 
+ static abbrev_list *
+-find_abbrev_list_by_abbrev_offset (dwarf_vma abbrev_base,
+-				   dwarf_vma abbrev_offset)
++find_abbrev_list_by_raw_abbrev (unsigned char *raw)
+ {
+   abbrev_list * list;
+ 
+   for (list = abbrev_lists; list != NULL; list = list->next)
+-    if (list->abbrev_base == abbrev_base
+-	&& list->abbrev_offset == abbrev_offset)
++    if (list->raw == raw)
+       return list;
+ 
+   return NULL;
+@@ -1040,6 +1037,7 @@ process_abbrev_set (struct dwarf_section
+   abbrev_list *list = xmalloc (sizeof (*list));
+   list->first_abbrev = NULL;
+   list->last_abbrev = NULL;
++  list->raw = start;
+ 
+   while (start < end)
+     {
+@@ -1055,6 +1053,7 @@ process_abbrev_set (struct dwarf_section
+ 	 the caller.  */
+       if (start == end || entry == 0)
+ 	{
++	  list->next = NULL;
+ 	  list->start_of_next_abbrevs = start != end ? start : NULL;
+ 	  return list;
+ 	}
+@@ -1144,16 +1143,10 @@ find_and_process_abbrev_set (struct dwar
+   unsigned char *end = section->start + abbrev_base + abbrev_size;
+   abbrev_list *list = NULL;
+   if (free_list)
+-    list = find_abbrev_list_by_abbrev_offset (abbrev_base, abbrev_offset);
++    list = find_abbrev_list_by_raw_abbrev (start);
+   if (list == NULL)
+     {
+       list = process_abbrev_set (section, start, end);
+-      if (list)
+-	{
+-	  list->abbrev_base = abbrev_base;
+-	  list->abbrev_offset = abbrev_offset;
+-	  list->next = NULL;
+-	}
+       if (free_list)
+ 	*free_list = list;
+     }
-- 
2.25.1


