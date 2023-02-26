Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CD4C6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 10:24:34 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.63175.1677407065099183168
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 02:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c8orxYgj;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: yashinde145@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id gi3-20020a17090b110300b0023762f642dcso3405777pjb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677407064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1V4AgtC2MxuorsZiw1JpzZLCqMS5xxfHGvF4QgU08s=;
        b=c8orxYgjFJSTWwUPFR9i8S2LTHDVxaKtKJlpKS6XjHjDZel9em6dYrtUdBbAchinf6
         6mwxI8GGkasJtv+A8pNLUAOT3d8GS6VqNI4xRallPFdM6fyWGbC+c1gAx2VYig80NUM+
         +FxK12zdJ5v/SLRxtQ9E03Jg/cS7no1hfEkf07raCzh0bB9daMbgnBj2hgNIrrZSuHAM
         SnVAkcFxY1o9MrOjC8sp6/cY5cJSljnKJCHyzvFypKwvBNSlOzmutBCJSQRTxx7o/LNT
         3ye1GFmgrkhNiIK0nHi7+AFL9Qz2P9BhEUNSFVmExJGgT3lnQJv1uCGOzVA6aQAqW6Xw
         WeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677407064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1V4AgtC2MxuorsZiw1JpzZLCqMS5xxfHGvF4QgU08s=;
        b=HP6EZt1FHQqiybpNvW6Z/U87wSuRCp7nP5DdzxV0cb904ri43DLfaYyqw6EIUegthQ
         xrnzdeWdXiOzV7j/GMztoOHD7IgT25fU7reZZCcH4BhvuQs4G1k8PmhBnRvbZt30aiIB
         4jjIhHB7LBj1E02eeQCTja/JnPbIMDM4ayZ/hAtvh22ZXo8wdeqodQqgfhT3RF+L+XqE
         5yecLs2W/y7NG2eeovivpOxhTu4S7vAWj7NWlbuSLc+FdZcKlsJcdTDwhr6Q+06fHAdQ
         oCn0K0mEsEimd94OA6D6dW9Gjaa6FeAABumcya3RDV0B8D2ixOsYpW6dmIeV887IEmUA
         AGJA==
X-Gm-Message-State: AO0yUKXMFo5+kPnJAbr5pDfHBfiotCtlKAq47uMZMxFqUm27xhIfZ+Hb
	6IRyohIdzIrR0pYJBj5q3jd1DcJ2I5Q=
X-Google-Smtp-Source: AK7set+HEdEwaakR3ogwGXrqDoHOmI77l/fpHqLQM6jqEMXn6hWtDRMGkNhS+eQPenVrnNCrvGT3wg==
X-Received: by 2002:a17:90b:33c3:b0:237:8c42:27bc with SMTP id lk3-20020a17090b33c300b002378c4227bcmr9469844pjb.13.1677407063656;
        Sun, 26 Feb 2023 02:24:23 -0800 (PST)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id d17-20020a17090ab31100b002340d317f3esm2372320pjr.52.2023.02.26.02.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 02:24:23 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [kirkstone][PATCH] binutils : Fix CVE-2023-22608
Date: Sun, 26 Feb 2023 15:54:09 +0530
Message-Id: <20230226102409.3037829-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 10:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177729

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=8af23b30edbaedf009bc9b243cd4dfa10ae1ac09]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.38.inc                |   3 +
 .../binutils/0020-CVE-2023-22608-1.patch      | 506 ++++++++++++++++++
 .../binutils/0020-CVE-2023-22608-2.patch      | 210 ++++++++
 .../binutils/0020-CVE-2023-22608-3.patch      |  32 ++
 4 files changed, 751 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 0a4a0d7bc1..30a34d7ba4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -43,5 +43,8 @@ SRC_URI = "\
      file://0018-CVE-2022-38128-2.patch \
      file://0018-CVE-2022-38128-3.patch \
      file://0019-CVE-2022-4285.patch \
+     file://0020-CVE-2023-22608-1.patch \
+     file://0020-CVE-2023-22608-2.patch \
+     file://0020-CVE-2023-22608-3.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.patch
new file mode 100644
index 0000000000..18d4ac5f9d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.patch
@@ -0,0 +1,506 @@
+From 116aac1447ee92df25599859293752648e3c6ea0 Mon Sep 17 00:00:00 2001
+From: "Steinar H. Gunderson" <sesse@google.com>
+Date: Fri, 20 May 2022 16:10:34 +0200
+Subject: [PATCH] add a trie to map quickly from address range to compilation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ unit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When using perf to profile large binaries, _bfd_dwarf2_find_nearest_line()
+becomes a hotspot, as perf wants to get line number information
+(for inline-detection purposes) for each and every sample. In Chromium
+in particular (the content_shell binary), this entails going through
+475k address ranges, which takes a long time when done repeatedly.
+
+Add a radix-256 trie over the address space to quickly map address to
+compilation unit spaces; for content_shell, which is 1.6 GB when some
+(but not full) debug information turned is on, we go from 6 ms to
+0.006 ms (6 µs) for each lookup from address to compilation unit, a 1000x
+speedup.
+
+There is a modest RAM increase of 180 MB in this binary (the existing
+linked list over ranges uses about 10 MB, and the entire perf job uses
+between 2-3 GB for a medium-size profile); for smaller binaries with few
+ranges, there should be hardly any extra RAM usage at all.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=b43771b045fb5616da3964f2994eefbe8ae70d32]
+
+CVE: CVE-2023-22608
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+---
+ bfd/dwarf2.c | 326 ++++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 312 insertions(+), 14 deletions(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index fdf071c3..0ae50a37 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -82,6 +82,77 @@ struct adjusted_section
+   bfd_vma adj_vma;
+ };
+ 
++/* A trie to map quickly from address range to compilation unit.
++
++   This is a fairly standard radix-256 trie, used to quickly locate which
++   compilation unit any given address belongs to.  Given that each compilation
++   unit may register hundreds of very small and unaligned ranges (which may
++   potentially overlap, due to inlining and other concerns), and a large
++   program may end up containing hundreds of thousands of such ranges, we cannot
++   scan through them linearly without undue slowdown.
++
++   We use a hybrid trie to avoid memory explosion: There are two types of trie
++   nodes, leaves and interior nodes.  (Almost all nodes are leaves, so they
++   take up the bulk of the memory usage.) Leaves contain a simple array of
++   ranges (high/low address) and which compilation unit contains those ranges,
++   and when we get to a leaf, we scan through it linearly.  Interior nodes
++   contain pointers to 256 other nodes, keyed by the next byte of the address.
++   So for a 64-bit address like 0x1234567abcd, we would start at the root and go
++   down child[0x00]->child[0x00]->child[0x01]->child[0x23]->child[0x45] etc.,
++   until we hit a leaf.  (Nodes are, in general, leaves until they exceed the
++   default allocation of 16 elements, at which point they are converted to
++   interior node if possible.) This gives us near-constant lookup times;
++   the only thing that can be costly is if there are lots of overlapping ranges
++   within a single 256-byte segment of the binary, in which case we have to
++   scan through them all to find the best match.
++
++   For a binary with few ranges, we will in practice only have a single leaf
++   node at the root, containing a simple array.  Thus, the scheme is efficient
++   for both small and large binaries.
++ */
++
++/* Experiments have shown 16 to be a memory-efficient default leaf size.
++   The only case where a leaf will hold more memory than this, is at the
++   bottomost level (covering 256 bytes in the binary), where we'll expand
++   the leaf to be able to hold more ranges if needed.
++ */
++#define TRIE_LEAF_SIZE 16
++
++/* All trie_node pointers will really be trie_leaf or trie_interior,
++   but they have this common head.  */
++struct trie_node
++{
++  /* If zero, we are an interior node.
++     Otherwise, how many ranges we have room for in this leaf.  */
++  unsigned int num_room_in_leaf;
++};
++
++struct trie_leaf
++{
++  struct trie_node head;
++  unsigned int num_stored_in_leaf;
++  struct {
++    struct comp_unit *unit;
++    bfd_vma low_pc, high_pc;
++  } ranges[TRIE_LEAF_SIZE];
++};
++
++struct trie_interior
++{
++  struct trie_node head;
++  struct trie_node *children[256];
++};
++
++static struct trie_node *alloc_trie_leaf (bfd *abfd)
++{
++  struct trie_leaf *leaf =
++    bfd_zalloc (abfd, sizeof (struct trie_leaf));
++  if (leaf == NULL)
++    return NULL;
++  leaf->head.num_room_in_leaf = TRIE_LEAF_SIZE;
++  return &leaf->head;
++}
++
+ struct dwarf2_debug_file
+ {
+   /* The actual bfd from which debug info was loaded.  Might be
+@@ -139,6 +210,9 @@ struct dwarf2_debug_file
+   /* A list of all previously read comp_units.  */
+   struct comp_unit *all_comp_units;
+ 
++  /* A list of all previously read comp_units with no ranges (yet).  */
++  struct comp_unit *all_comp_units_without_ranges;
++
+   /* Last comp unit in list above.  */
+   struct comp_unit *last_comp_unit;
+ 
+@@ -147,6 +221,9 @@ struct dwarf2_debug_file
+ 
+   /* Hash table to map offsets to decoded abbrevs.  */
+   htab_t abbrev_offsets;
++
++  /* Root of a trie to map addresses to compilation units.  */
++  struct trie_node *trie_root;
+ };
+ 
+ struct dwarf2_debug
+@@ -220,6 +297,11 @@ struct comp_unit
+   /* Chain the previously read compilation units.  */
+   struct comp_unit *next_unit;
+ 
++  /* Chain the previously read compilation units that have no ranges yet.
++     We scan these separately when we have a trie over the ranges.
++     Unused if arange.high != 0. */
++  struct comp_unit *next_unit_without_ranges;
++
+   /* Likewise, chain the compilation unit read after this one.
+      The comp units are stored in reversed reading order.  */
+   struct comp_unit *prev_unit;
+@@ -296,6 +378,10 @@ struct comp_unit
+ 
+   /* TRUE if symbols are cached in hash table for faster lookup by name.  */
+   bool cached;
++
++  /* Used when iterating over trie leaves to know which units we have
++     already seen in this iteration.  */
++  bool mark;
+ };
+ 
+ /* This data structure holds the information of an abbrev.  */
+@@ -1766,9 +1852,189 @@ concat_filename (struct line_info_table *table, unsigned int file)
+   return strdup (filename);
+ }
+ 
++/* Number of bits in a bfd_vma.  */
++#define VMA_BITS (8 * sizeof (bfd_vma))
++
++/* Check whether [low1, high1) can be combined with [low2, high2),
++   i.e., they touch or overlap.  */
++static bool ranges_overlap (bfd_vma low1,
++			    bfd_vma high1,
++			    bfd_vma low2,
++			    bfd_vma high2)
++{
++  if (low1 == low2 || high1 == high2)
++    return true;
++
++  /* Sort so that low1 is below low2. */
++  if (low1 > low2)
++    {
++      bfd_vma tmp;
++
++      tmp = low1;
++      low1 = low2;
++      low2 = tmp;
++
++      tmp = high1;
++      high1 = high2;
++      high2 = tmp;
++    }
++
++  /* We touch iff low2 == high1.
++     We overlap iff low2 is within [low1, high1). */
++  return (low2 <= high1);
++}
++
++/* Insert an address range in the trie mapping addresses to compilation units.
++   Will return the new trie node (usually the same as is being sent in, but
++   in case of a leaf-to-interior conversion, or expansion of a leaf, it may be
++   different), or NULL on failure.
++ */
++static struct trie_node *insert_arange_in_trie(bfd *abfd,
++					       struct trie_node *trie,
++					       bfd_vma trie_pc,
++					       unsigned int trie_pc_bits,
++					       struct comp_unit *unit,
++					       bfd_vma low_pc,
++					       bfd_vma high_pc)
++{
++  bfd_vma clamped_low_pc, clamped_high_pc;
++  int ch, from_ch, to_ch;
++  bool is_full_leaf = false;
++
++  /* See if we can extend any of the existing ranges.  This merging
++     isn't perfect (if merging opens up the possibility of merging two existing
++     ranges, we won't find them), but it takes the majority of the cases.  */
++  if (trie->num_room_in_leaf > 0)
++    {
++      struct trie_leaf *leaf = (struct trie_leaf *) trie;
++      unsigned int i;
++
++      for (i = 0; i < leaf->num_stored_in_leaf; ++i)
++	{
++	  if (leaf->ranges[i].unit == unit &&
++	      ranges_overlap(low_pc, high_pc,
++			     leaf->ranges[i].low_pc, leaf->ranges[i].high_pc))
++	    {
++	      if (low_pc < leaf->ranges[i].low_pc)
++		leaf->ranges[i].low_pc = low_pc;
++	      if (high_pc > leaf->ranges[i].high_pc)
++		leaf->ranges[i].high_pc = high_pc;
++	      return trie;
++	    }
++	}
++
++      is_full_leaf = leaf->num_stored_in_leaf == trie->num_room_in_leaf;
++    }
++
++  /* If we're a leaf with no more room and we're _not_ at the bottom,
++     convert to an interior node.  */
++  if (is_full_leaf && trie_pc_bits < VMA_BITS)
++    {
++      const struct trie_leaf *leaf = (struct trie_leaf *) trie;
++      unsigned int i;
++
++      trie = bfd_zalloc (abfd, sizeof (struct trie_interior));
++      if (!trie)
++	return NULL;
++      is_full_leaf = false;
++
++      /* TODO: If we wanted to save a little more memory at the cost of
++	 complexity, we could have reused the old leaf node as one of the
++	 children of the new interior node, instead of throwing it away.  */
++      for (i = 0; i < leaf->num_stored_in_leaf; ++i)
++        {
++	  if (!insert_arange_in_trie (abfd, trie, trie_pc, trie_pc_bits,
++				      leaf->ranges[i].unit, leaf->ranges[i].low_pc,
++				      leaf->ranges[i].high_pc))
++	    return NULL;
++	}
++    }
++
++  /* If we're a leaf with no more room and we _are_ at the bottom,
++     we have no choice but to just make it larger. */
++  if (is_full_leaf)
++    {
++      const struct trie_leaf *leaf = (struct trie_leaf *) trie;
++      unsigned int new_room_in_leaf = trie->num_room_in_leaf * 2;
++      struct trie_leaf *new_leaf;
++
++      new_leaf = bfd_zalloc (abfd,
++	sizeof (struct trie_leaf) +
++	  (new_room_in_leaf - TRIE_LEAF_SIZE) * sizeof (leaf->ranges[0]));
++      new_leaf->head.num_room_in_leaf = new_room_in_leaf;
++      new_leaf->num_stored_in_leaf = leaf->num_stored_in_leaf;
++
++      memcpy (new_leaf->ranges,
++	      leaf->ranges,
++	      leaf->num_stored_in_leaf * sizeof (leaf->ranges[0]));
++      trie = &new_leaf->head;
++      is_full_leaf = false;
++
++      /* Now the insert below will go through.  */
++    }
++
++  /* If we're a leaf (now with room), we can just insert at the end.  */
++  if (trie->num_room_in_leaf > 0)
++    {
++      struct trie_leaf *leaf = (struct trie_leaf *) trie;
++
++      unsigned int i = leaf->num_stored_in_leaf++;
++      leaf->ranges[i].unit = unit;
++      leaf->ranges[i].low_pc = low_pc;
++      leaf->ranges[i].high_pc = high_pc;
++      return trie;
++    }
++
++  /* Now we are definitely an interior node, so recurse into all
++     the relevant buckets.  */
++
++  /* Clamp the range to the current trie bucket.  */
++  clamped_low_pc = low_pc;
++  clamped_high_pc = high_pc;
++  if (trie_pc_bits > 0)
++    {
++      bfd_vma bucket_high_pc =
++	trie_pc + ((bfd_vma)-1 >> trie_pc_bits);  /* Inclusive.  */
++      if (clamped_low_pc < trie_pc)
++	clamped_low_pc = trie_pc;
++      if (clamped_high_pc > bucket_high_pc)
++	clamped_high_pc = bucket_high_pc;
++    }
++
++  /* Insert the ranges in all buckets that it spans.  */
++  from_ch = (clamped_low_pc >> (VMA_BITS - trie_pc_bits - 8)) & 0xff;
++  to_ch = ((clamped_high_pc - 1) >> (VMA_BITS - trie_pc_bits - 8)) & 0xff;
++  for (ch = from_ch; ch <= to_ch; ++ch)
++    {
++      struct trie_interior *interior = (struct trie_interior *) trie;
++      struct trie_node *child = interior->children[ch];
++
++      if (child == NULL)
++        {
++	  child = alloc_trie_leaf (abfd);
++	  if (!child)
++	    return NULL;
++	}
++      child = insert_arange_in_trie (abfd,
++				     child,
++				     trie_pc + ((bfd_vma)ch << (VMA_BITS - trie_pc_bits - 8)),
++				     trie_pc_bits + 8,
++				     unit,
++				     low_pc,
++				     high_pc);
++      if (!child)
++	return NULL;
++
++      interior->children[ch] = child;
++    }
++
++    return trie;
++}
++
++
+ static bool
+-arange_add (const struct comp_unit *unit, struct arange *first_arange,
+-	    bfd_vma low_pc, bfd_vma high_pc)
++arange_add (struct comp_unit *unit, struct arange *first_arange,
++	    struct trie_node **trie_root, bfd_vma low_pc, bfd_vma high_pc)
+ {
+   struct arange *arange;
+ 
+@@ -1776,6 +2042,19 @@ arange_add (const struct comp_unit *unit, struct arange *first_arange,
+   if (low_pc == high_pc)
+     return true;
+ 
++  if (trie_root != NULL)
++    {
++      *trie_root = insert_arange_in_trie (unit->file->bfd_ptr,
++					  *trie_root,
++					  0,
++					  0,
++					  unit,
++					  low_pc,
++					  high_pc);
++      if (*trie_root == NULL)
++	return false;
++    }
++
+   /* If the first arange is empty, use it.  */
+   if (first_arange->high == 0)
+     {
+@@ -2410,7 +2689,8 @@ decode_line_info (struct comp_unit *unit)
+ 		    low_pc = address;
+ 		  if (address > high_pc)
+ 		    high_pc = address;
+-		  if (!arange_add (unit, &unit->arange, low_pc, high_pc))
++		  if (!arange_add (unit, &unit->arange, &unit->file->trie_root,
++				   low_pc, high_pc))
+ 		    goto line_fail;
+ 		  break;
+ 		case DW_LNE_set_address:
+@@ -3134,7 +3414,7 @@ find_abstract_instance (struct comp_unit *unit,
+ 
+ static bool
+ read_ranges (struct comp_unit *unit, struct arange *arange,
+-	     bfd_uint64_t offset)
++	     struct trie_node **trie_root, bfd_uint64_t offset)
+ {
+   bfd_byte *ranges_ptr;
+   bfd_byte *ranges_end;
+@@ -3169,7 +3449,7 @@ read_ranges (struct comp_unit *unit, struct arange *arange,
+ 	base_address = high_pc;
+       else
+ 	{
+-	  if (!arange_add (unit, arange,
++	  if (!arange_add (unit, arange, trie_root,
+ 			   base_address + low_pc, base_address + high_pc))
+ 	    return false;
+ 	}
+@@ -3179,7 +3459,7 @@ read_ranges (struct comp_unit *unit, struct arange *arange,
+ 
+ static bool
+ read_rnglists (struct comp_unit *unit, struct arange *arange,
+-	       bfd_uint64_t offset)
++	       struct trie_node **trie_root, bfd_uint64_t offset)
+ {
+   bfd_byte *rngs_ptr;
+   bfd_byte *rngs_end;
+@@ -3253,19 +3533,19 @@ read_rnglists (struct comp_unit *unit, struct arange *arange,
+ 	  return false;
+ 	}
+ 
+-      if (!arange_add (unit, arange, low_pc, high_pc))
++      if (!arange_add (unit, arange, trie_root, low_pc, high_pc))
+ 	return false;
+     }
+ }
+ 
+ static bool
+ read_rangelist (struct comp_unit *unit, struct arange *arange,
+-		bfd_uint64_t offset)
++		struct trie_node **trie_root, bfd_uint64_t offset)
+ {
+   if (unit->version <= 4)
+-    return read_ranges (unit, arange, offset);
++    return read_ranges (unit, arange, trie_root, offset);
+   else
+-    return read_rnglists (unit, arange, offset);
++    return read_rnglists (unit, arange, trie_root, offset);
+ }
+ 
+ static struct funcinfo *
+@@ -3563,7 +3843,8 @@ scan_unit_for_symbols (struct comp_unit *unit)
+ 
+ 		case DW_AT_ranges:
+ 		  if (is_int_form (&attr)
+-		      && !read_rangelist (unit, &func->arange, attr.u.val))
++		      && !read_rangelist (unit, &func->arange,
++					  &unit->file->trie_root, attr.u.val))
+ 		    goto fail;
+ 		  break;
+ 
+@@ -3679,7 +3960,8 @@ scan_unit_for_symbols (struct comp_unit *unit)
+ 
+       if (func && high_pc != 0)
+ 	{
+-	  if (!arange_add (unit, &func->arange, low_pc, high_pc))
++	  if (!arange_add (unit, &func->arange, &unit->file->trie_root,
++			   low_pc, high_pc))
+ 	    goto fail;
+ 	}
+     }
+@@ -3874,7 +4156,8 @@ parse_comp_unit (struct dwarf2_debug *stash,
+ 
+ 	case DW_AT_ranges:
+ 	  if (is_int_form (&attr)
+-	      && !read_rangelist (unit, &unit->arange, attr.u.val))
++	      && !read_rangelist (unit, &unit->arange,
++				  &unit->file->trie_root, attr.u.val))
+ 	    return NULL;
+ 	  break;
+ 
+@@ -3916,7 +4199,8 @@ parse_comp_unit (struct dwarf2_debug *stash,
+     high_pc += low_pc;
+   if (high_pc != 0)
+     {
+-      if (!arange_add (unit, &unit->arange, low_pc, high_pc))
++      if (!arange_add (unit, &unit->arange, &unit->file->trie_root,
++		       low_pc, high_pc))
+ 	return NULL;
+     }
+ 
+@@ -4747,6 +5031,14 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd, bfd *debug_bfd,
+   if (!stash->alt.abbrev_offsets)
+     return false;
+ 
++  stash->f.trie_root = alloc_trie_leaf (abfd);
++  if (!stash->f.trie_root)
++    return false;
++
++  stash->alt.trie_root = alloc_trie_leaf (abfd);
++  if (!stash->alt.trie_root)
++    return false;
++
+   *pinfo = stash;
+ 
+   if (debug_bfd == NULL)
+@@ -4918,6 +5210,12 @@ stash_comp_unit (struct dwarf2_debug *stash, struct dwarf2_debug_file *file)
+ 	  each->next_unit = file->all_comp_units;
+ 	  file->all_comp_units = each;
+ 
++	  if (each->arange.high == 0)
++	    {
++	      each->next_unit_without_ranges = file->all_comp_units_without_ranges;
++	      file->all_comp_units_without_ranges = each->next_unit_without_ranges;
++	    }
++
+ 	  file->info_ptr += length;
+ 	  return each;
+ 	}
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.patch
new file mode 100644
index 0000000000..a58b8dccdc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.patch
@@ -0,0 +1,210 @@
+From 1e716c1b160d56c2ab8711e199cad5b4db47cedf Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 30 Aug 2022 16:01:20 +0100
+Subject: [PATCH] BFD library: Use entry 0 in directory and filename tables of
+
+ DWARF-5 debug info.
+
+	PR 29529
+	* dwarf2.c (struct line_info_table): Add new field:
+	use_dir_and_file_0.
+	(concat_filename): Use new field to help select the correct table
+	slot.
+	(read_formatted_entries): Do not skip entry 0.
+	(decode_line_info): Set new field depending upon the version of
+	DWARF being parsed.  Initialise filename based upon the setting of
+	the new field.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=37833b966576c5d25e797ea3b6c33d0459a71892]
+CVE: CVE-2023-22608
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+---
+ bfd/dwarf2.c                       | 86 ++++++++++++++++++++----------
+ ld/testsuite/ld-x86-64/pr27587.err |  2 +-
+ 2 files changed, 59 insertions(+), 29 deletions(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 0ae50a37..b7839ad6 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -1571,6 +1571,7 @@ struct line_info_table
+   unsigned int		num_files;
+   unsigned int		num_dirs;
+   unsigned int		num_sequences;
++  bool                  use_dir_and_file_0;
+   char *		comp_dir;
+   char **		dirs;
+   struct fileinfo*	files;
+@@ -1791,16 +1792,30 @@ concat_filename (struct line_info_table *table, unsigned int file)
+ {
+   char *filename;
+ 
+-  if (table == NULL || file - 1 >= table->num_files)
++  /* Pre DWARF-5 entry 0 in the directory and filename tables was not used.
++     So in order to save space in the tables used here the info for, eg
++     directory 1 is stored in slot 0 of the directory table, directory 2
++     in slot 1 and so on.
++
++     Starting with DWARF-5 the 0'th entry is used so there is a one to one
++     mapping between DWARF slots and internal table entries.  */
++  if (! table->use_dir_and_file_0)
+     {
+-      /* FILE == 0 means unknown.  */
+-      if (file)
+-	_bfd_error_handler
+-	  (_("DWARF error: mangled line number section (bad file number)"));
++      /* Pre DWARF-5, FILE == 0 means unknown.  */
++      if (file == 0)
++	return strdup ("<unknown>");
++      -- file;
++    }
++
++  if (table == NULL || file >= table->num_files)
++    {
++      _bfd_error_handler
++	(_("DWARF error: mangled line number section (bad file number)"));
+       return strdup ("<unknown>");
+     }
+ 
+-  filename = table->files[file - 1].name;
++  filename = table->files[file].name;
++
+   if (filename == NULL)
+     return strdup ("<unknown>");
+ 
+@@ -1811,12 +1826,17 @@ concat_filename (struct line_info_table *table, unsigned int file)
+       char *name;
+       size_t len;
+ 
+-      if (table->files[file - 1].dir
++      if (table->files[file].dir
+ 	  /* PR 17512: file: 0317e960.  */
+-	  && table->files[file - 1].dir <= table->num_dirs
++	  && table->files[file].dir <= table->num_dirs
+ 	  /* PR 17512: file: 7f3d2e4b.  */
+ 	  && table->dirs != NULL)
+-	subdir_name = table->dirs[table->files[file - 1].dir - 1];
++	{
++	  if (table->use_dir_and_file_0)
++	    subdir_name = table->dirs[table->files[file].dir];
++	  else
++	    subdir_name = table->dirs[table->files[file].dir - 1];
++	}
+ 
+       if (!subdir_name || !IS_ABSOLUTE_PATH (subdir_name))
+ 	dir_name = table->comp_dir;
+@@ -1857,10 +1877,12 @@ concat_filename (struct line_info_table *table, unsigned int file)
+ 
+ /* Check whether [low1, high1) can be combined with [low2, high2),
+    i.e., they touch or overlap.  */
+-static bool ranges_overlap (bfd_vma low1,
+-			    bfd_vma high1,
+-			    bfd_vma low2,
+-			    bfd_vma high2)
++
++static bool
++ranges_overlap (bfd_vma low1,
++		bfd_vma high1,
++		bfd_vma low2,
++		bfd_vma high2)
+ {
+   if (low1 == low2 || high1 == high2)
+     return true;
+@@ -1887,15 +1909,16 @@ static bool ranges_overlap (bfd_vma low1,
+ /* Insert an address range in the trie mapping addresses to compilation units.
+    Will return the new trie node (usually the same as is being sent in, but
+    in case of a leaf-to-interior conversion, or expansion of a leaf, it may be
+-   different), or NULL on failure.
+- */
+-static struct trie_node *insert_arange_in_trie(bfd *abfd,
+-					       struct trie_node *trie,
+-					       bfd_vma trie_pc,
+-					       unsigned int trie_pc_bits,
+-					       struct comp_unit *unit,
+-					       bfd_vma low_pc,
+-					       bfd_vma high_pc)
++   different), or NULL on failure.  */
++
++static struct trie_node *
++insert_arange_in_trie (bfd *abfd,
++		       struct trie_node *trie,
++		       bfd_vma trie_pc,
++		       unsigned int trie_pc_bits,
++		       struct comp_unit *unit,
++		       bfd_vma low_pc,
++		       bfd_vma high_pc)
+ {
+   bfd_vma clamped_low_pc, clamped_high_pc;
+   int ch, from_ch, to_ch;
+@@ -2031,7 +2054,6 @@ static struct trie_node *insert_arange_in_trie(bfd *abfd,
+     return trie;
+ }
+ 
+-
+ static bool
+ arange_add (struct comp_unit *unit, struct arange *first_arange,
+ 	    struct trie_node **trie_root, bfd_vma low_pc, bfd_vma high_pc)
+@@ -2412,10 +2434,8 @@ read_formatted_entries (struct comp_unit *unit, bfd_byte **bufp,
+ 	    }
+ 	}
+ 
+-      /* Skip the first "zero entry", which is the compilation dir/file.  */
+-      if (datai != 0)
+-	if (!callback (table, fe.name, fe.dir, fe.time, fe.size))
+-	  return false;
++      if (!callback (table, fe.name, fe.dir, fe.time, fe.size))
++	return false;
+     }
+ 
+   *bufp = buf;
+@@ -2592,6 +2612,7 @@ decode_line_info (struct comp_unit *unit)
+       if (!read_formatted_entries (unit, &line_ptr, line_end, table,
+ 				   line_info_add_file_name))
+ 	goto fail;
++      table->use_dir_and_file_0 = true;
+     }
+   else
+     {
+@@ -2614,6 +2635,7 @@ decode_line_info (struct comp_unit *unit)
+ 	  if (!line_info_add_file_name (table, cur_file, dir, xtime, size))
+ 	    goto fail;
+ 	}
++      table->use_dir_and_file_0 = false;
+     }
+ 
+   /* Read the statement sequences until there's nothing left.  */
+@@ -2622,7 +2644,7 @@ decode_line_info (struct comp_unit *unit)
+       /* State machine registers.  */
+       bfd_vma address = 0;
+       unsigned char op_index = 0;
+-      char * filename = table->num_files ? concat_filename (table, 1) : NULL;
++      char * filename = NULL;
+       unsigned int line = 1;
+       unsigned int column = 0;
+       unsigned int discriminator = 0;
+@@ -2637,6 +2659,14 @@ decode_line_info (struct comp_unit *unit)
+       bfd_vma low_pc  = (bfd_vma) -1;
+       bfd_vma high_pc = 0;
+ 
++      if (table->num_files)
++	{
++	  if (table->use_dir_and_file_0)
++	    filename = concat_filename (table, 0);
++	  else
++	    filename = concat_filename (table, 1);
++	}
++
+       /* Decode the table.  */
+       while (!end_sequence && line_ptr < line_end)
+ 	{
+diff --git a/ld/testsuite/ld-x86-64/pr27587.err b/ld/testsuite/ld-x86-64/pr27587.err
+index fa870790..807750ca 100644
+--- a/ld/testsuite/ld-x86-64/pr27587.err
++++ b/ld/testsuite/ld-x86-64/pr27587.err
+@@ -1,3 +1,3 @@
+ #...
+-.*pr27587.i:4: undefined reference to `stack_size'
++.*pr27587/<artificial>:4: undefined reference to `stack_size'
+ #...
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.patch
new file mode 100644
index 0000000000..a1b74248ce
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.patch
@@ -0,0 +1,32 @@
+From 4b8386a90802ed8e43eac2266f6e03c92b4462ed Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 23 Dec 2022 13:02:04 +0000
+Subject: [PATCH] Fix illegal memory access parsing corrupt DWARF information.
+
+	PR 29936
+	* dwarf2.c (concat_filename): Fix check for a directory index off
+	the end of the directory table.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=8af23b30edbaedf009bc9b243cd4dfa10ae1ac09]
+CVE: CVE-2023-22608
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+---
+ bfd/dwarf2.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index b7839ad6..8b07a24c 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -1828,7 +1828,8 @@ concat_filename (struct line_info_table *table, unsigned int file)
+ 
+       if (table->files[file].dir
+ 	  /* PR 17512: file: 0317e960.  */
+-	  && table->files[file].dir <= table->num_dirs
++	  && table->files[file].dir
++	  <= (table->use_dir_and_file_0 ? table->num_dirs - 1 : table->num_dirs)
+ 	  /* PR 17512: file: 7f3d2e4b.  */
+ 	  && table->dirs != NULL)
+ 	{
-- 
2.34.1


