Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EB4E7F14D
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 00:25:02 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.6905.1695774300593015341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 17:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PxrHm1v9;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: colinmca242@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-350fbd09d8bso32483725ab.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695774299; x=1696379099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5alndn1rRU/fp5AyF7Y6P8OcPDrKlKa36ftIXWSPClY=;
        b=PxrHm1v9SP9OcvBmeVeH1XwCrn2Yb4p+RR95dfmPZ8xQRi/jxADBLFA0uOjKwYGkyZ
         oy/XyIufVFq7/qCLjiQSZ+v/mXX2yK/UCbclr0AzzxfSdeD+U0Zf5xkA2yMT1wpTeF77
         rM+y3KqNsiA1CnfMI+IdbskhIpNvhDH1obC3v9XkjQpw4hhZg9KijGdLBSKW8B8x24O7
         xinGISefkOnqVmToj9IicrsI+449cVlYK5FXC+8oQnsVbGQhMhDO3ZGCDShPX6ea5IRD
         SVXyCh7XBtGW/rV5kO0pgSfowlTOYLIDIez3uioXrHZiId/hPnAbK8sBrqMAvStHNMd7
         vXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695774299; x=1696379099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5alndn1rRU/fp5AyF7Y6P8OcPDrKlKa36ftIXWSPClY=;
        b=dnGvhDpAXwLrxt//eoM910WnjE3VsdaPYpIFirlsOEBOZMcYistUnnRxMv9TFVyb2y
         eY3odx+2bH/8WD6+6LYljiwUgalqvJtIEEcHOIHFrOO5IpsyZx3uClatLedXiCRPep12
         mb+eug7qSsK+jxEdq27WibzNMNcrAypumxA8dpKEpmuIiSNgVsXBV/nSetMpytvRZKlY
         Mnm1UW0d6vCf5GkjCNKq4zhd29lJy0zy7lX59FMY4mk7x/5okKSe98JC89tLnU0lGvjP
         mLyfxGUg8IGA/+nS3PBPArC8hHfTxiHlZc6Q8hJmMX1On4eu4FsnN46UkktSAEG861r7
         fX8Q==
X-Gm-Message-State: AOJu0YwUylNUCRC3n2xuM4Hy79CsdE8YEXJeIEIlTm0PsHzkuwPNCn0p
	hgMGCtqNENUle2k28T4X9eb6kcPujvi6NQ==
X-Google-Smtp-Source: AGHT+IEzE06/1oQCUGKToRatI8cu2e6eWQHX80WSEseNpvruzOUrL9aeuBKfDvJZIMRCJ0exCoI0Vw==
X-Received: by 2002:a05:6e02:144f:b0:351:203e:68eb with SMTP id p15-20020a056e02144f00b00351203e68ebmr654940ilo.6.1695774299256;
        Tue, 26 Sep 2023 17:24:59 -0700 (PDT)
Received: from rehoboam.localdomain ([136.37.193.71])
        by smtp.gmail.com with ESMTPSA id a10-20020a92d10a000000b00348cb9adb38sm3890485ilb.7.2023.09.26.17.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 17:24:58 -0700 (PDT)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
Subject: [kirkstone][PATCH v3] libwebp: Fix CVE-2023-5129
Date: Tue, 26 Sep 2023 19:24:50 -0500
Message-Id: <20230927002450.2150707-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <584338eec7>
References: <584338eec7>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 00:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188286

Add patch from libwebp 1.2.4 to fix CVE-2023-5129

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
---
 .../webp/files/CVE-2023-5129.patch            | 364 ++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.2.4.bb |   1 +
 2 files changed, 365 insertions(+)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-5129.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
new file mode 100644
index 0000000000..401fa370d4
--- /dev/null
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
@@ -0,0 +1,364 @@
+From 383b8b4eb6780d855e8a8177fbce96ab39dba6a5 Mon Sep 17 00:00:00 2001
+From: Vincent Rabaud <vrabaud@google.com>
+Date: Thu, 7 Sep 2023 21:16:03 +0200
+Subject: [PATCH 1/1] Fix OOB write in BuildHuffmanTable.
+
+First, BuildHuffmanTable is called to check if the data is valid.
+If it is and the table is not big enough, more memory is allocated.
+
+This will make sure that valid (but unoptimized because of unbalanced
+codes) streams are still decodable.
+
+Bug: chromium:1479274
+Change-Id: I31c36dbf3aa78d35ecf38706b50464fd3d375741
+
+CVE: CVE-2023-5129
+
+Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/902bc9190331343b2017211debcec8d2ab87e17a]
+---
+ src/dec/vp8l_dec.c        | 46 ++++++++++---------
+ src/dec/vp8li_dec.h       |  2 +-
+ src/utils/huffman_utils.c | 97 +++++++++++++++++++++++++++++++--------
+ src/utils/huffman_utils.h | 27 +++++++++--
+ 4 files changed, 129 insertions(+), 43 deletions(-)
+
+diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
+index 13480551..186b0b2f 100644
+--- a/src/dec/vp8l_dec.c
++++ b/src/dec/vp8l_dec.c
+@@ -253,11 +253,11 @@ static int ReadHuffmanCodeLengths(
+   int symbol;
+   int max_symbol;
+   int prev_code_len = DEFAULT_CODE_LENGTH;
+-  HuffmanCode table[1 << LENGTHS_TABLE_BITS];
++  HuffmanTables tables;
+ 
+-  if (!VP8LBuildHuffmanTable(table, LENGTHS_TABLE_BITS,
+-                             code_length_code_lengths,
+-                             NUM_CODE_LENGTH_CODES)) {
++  if (!VP8LHuffmanTablesAllocate(1 << LENGTHS_TABLE_BITS, &tables) ||
++      !VP8LBuildHuffmanTable(&tables, LENGTHS_TABLE_BITS,
++                             code_length_code_lengths, NUM_CODE_LENGTH_CODES)) {
+     goto End;
+   }
+ 
+@@ -277,7 +277,7 @@ static int ReadHuffmanCodeLengths(
+     int code_len;
+     if (max_symbol-- == 0) break;
+     VP8LFillBitWindow(br);
+-    p = &table[VP8LPrefetchBits(br) & LENGTHS_TABLE_MASK];
++    p = &tables.curr_segment->start[VP8LPrefetchBits(br) & LENGTHS_TABLE_MASK];
+     VP8LSetBitPos(br, br->bit_pos_ + p->bits);
+     code_len = p->value;
+     if (code_len < kCodeLengthLiterals) {
+@@ -300,6 +300,7 @@ static int ReadHuffmanCodeLengths(
+   ok = 1;
+ 
+  End:
++  VP8LHuffmanTablesDeallocate(&tables);
+   if (!ok) dec->status_ = VP8_STATUS_BITSTREAM_ERROR;
+   return ok;
+ }
+@@ -307,7 +308,8 @@ static int ReadHuffmanCodeLengths(
+ // 'code_lengths' is pre-allocated temporary buffer, used for creating Huffman
+ // tree.
+ static int ReadHuffmanCode(int alphabet_size, VP8LDecoder* const dec,
+-                           int* const code_lengths, HuffmanCode* const table) {
++                           int* const code_lengths,
++                           HuffmanTables* const table) {
+   int ok = 0;
+   int size = 0;
+   VP8LBitReader* const br = &dec->br_;
+@@ -362,8 +364,7 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, int xsize, int ysize,
+   VP8LMetadata* const hdr = &dec->hdr_;
+   uint32_t* huffman_image = NULL;
+   HTreeGroup* htree_groups = NULL;
+-  HuffmanCode* huffman_tables = NULL;
+-  HuffmanCode* huffman_table = NULL;
++  HuffmanTables* huffman_tables = &hdr->huffman_tables_;
+   int num_htree_groups = 1;
+   int num_htree_groups_max = 1;
+   int max_alphabet_size = 0;
+@@ -372,6 +373,10 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, int xsize, int ysize,
+   int* mapping = NULL;
+   int ok = 0;
+ 
++  // Check the table has been 0 initialized (through InitMetadata).
++  assert(huffman_tables->root.start == NULL);
++  assert(huffman_tables->curr_segment == NULL);
++
+   if (allow_recursion && VP8LReadBits(br, 1)) {
+     // use meta Huffman codes.
+     const int huffman_precision = VP8LReadBits(br, 3) + 2;
+@@ -434,16 +439,15 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, int xsize, int ysize,
+ 
+   code_lengths = (int*)WebPSafeCalloc((uint64_t)max_alphabet_size,
+                                       sizeof(*code_lengths));
+-  huffman_tables = (HuffmanCode*)WebPSafeMalloc(num_htree_groups * table_size,
+-                                                sizeof(*huffman_tables));
+   htree_groups = VP8LHtreeGroupsNew(num_htree_groups);
+ 
+-  if (htree_groups == NULL || code_lengths == NULL || huffman_tables == NULL) {
++  if (htree_groups == NULL || code_lengths == NULL ||
++      !VP8LHuffmanTablesAllocate(num_htree_groups * table_size,
++                                 huffman_tables)) {
+     dec->status_ = VP8_STATUS_OUT_OF_MEMORY;
+     goto Error;
+   }
+ 
+-  huffman_table = huffman_tables;
+   for (i = 0; i < num_htree_groups_max; ++i) {
+     // If the index "i" is unused in the Huffman image, just make sure the
+     // coefficients are valid but do not store them.
+@@ -468,19 +472,20 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, int xsize, int ysize,
+       int max_bits = 0;
+       for (j = 0; j < HUFFMAN_CODES_PER_META_CODE; ++j) {
+         int alphabet_size = kAlphabetSize[j];
+-        htrees[j] = huffman_table;
+         if (j == 0 && color_cache_bits > 0) {
+           alphabet_size += (1 << color_cache_bits);
+         }
+-        size = ReadHuffmanCode(alphabet_size, dec, code_lengths, huffman_table);
++        size =
++            ReadHuffmanCode(alphabet_size, dec, code_lengths, huffman_tables);
++        htrees[j] = huffman_tables->curr_segment->curr_table;
+         if (size == 0) {
+           goto Error;
+         }
+         if (is_trivial_literal && kLiteralMap[j] == 1) {
+-          is_trivial_literal = (huffman_table->bits == 0);
++          is_trivial_literal = (htrees[j]->bits == 0);
+         }
+-        total_size += huffman_table->bits;
+-        huffman_table += size;
++        total_size += htrees[j]->bits;
++        huffman_tables->curr_segment->curr_table += size;
+         if (j <= ALPHA) {
+           int local_max_bits = code_lengths[0];
+           int k;
+@@ -515,14 +520,13 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, int xsize, int ysize,
+   hdr->huffman_image_ = huffman_image;
+   hdr->num_htree_groups_ = num_htree_groups;
+   hdr->htree_groups_ = htree_groups;
+-  hdr->huffman_tables_ = huffman_tables;
+ 
+  Error:
+   WebPSafeFree(code_lengths);
+   WebPSafeFree(mapping);
+   if (!ok) {
+     WebPSafeFree(huffman_image);
+-    WebPSafeFree(huffman_tables);
++    VP8LHuffmanTablesDeallocate(huffman_tables);
+     VP8LHtreeGroupsFree(htree_groups);
+   }
+   return ok;
+@@ -1358,7 +1362,7 @@ static void ClearMetadata(VP8LMetadata* const hdr) {
+   assert(hdr != NULL);
+ 
+   WebPSafeFree(hdr->huffman_image_);
+-  WebPSafeFree(hdr->huffman_tables_);
++  VP8LHuffmanTablesDeallocate(&hdr->huffman_tables_);
+   VP8LHtreeGroupsFree(hdr->htree_groups_);
+   VP8LColorCacheClear(&hdr->color_cache_);
+   VP8LColorCacheClear(&hdr->saved_color_cache_);
+@@ -1673,7 +1677,7 @@ int VP8LDecodeImage(VP8LDecoder* const dec) {
+ 
+   if (dec == NULL) return 0;
+ 
+-  assert(dec->hdr_.huffman_tables_ != NULL);
++  assert(dec->hdr_.huffman_tables_.root.start != NULL);
+   assert(dec->hdr_.htree_groups_ != NULL);
+   assert(dec->hdr_.num_htree_groups_ > 0);
+ 
+diff --git a/src/dec/vp8li_dec.h b/src/dec/vp8li_dec.h
+index 72b2e861..32540a4b 100644
+--- a/src/dec/vp8li_dec.h
++++ b/src/dec/vp8li_dec.h
+@@ -51,7 +51,7 @@ typedef struct {
+   uint32_t*       huffman_image_;
+   int             num_htree_groups_;
+   HTreeGroup*     htree_groups_;
+-  HuffmanCode*    huffman_tables_;
++  HuffmanTables   huffman_tables_;
+ } VP8LMetadata;
+ 
+ typedef struct VP8LDecoder VP8LDecoder;
+diff --git a/src/utils/huffman_utils.c b/src/utils/huffman_utils.c
+index 0cba0fbb..9efd6283 100644
+--- a/src/utils/huffman_utils.c
++++ b/src/utils/huffman_utils.c
+@@ -177,21 +177,24 @@ static int BuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
+       if (num_open < 0) {
+         return 0;
+       }
+-      if (root_table == NULL) continue;
+       for (; count[len] > 0; --count[len]) {
+         HuffmanCode code;
+         if ((key & mask) != low) {
+-          table += table_size;
++          if (root_table != NULL) table += table_size;
+           table_bits = NextTableBitSize(count, len, root_bits);
+           table_size = 1 << table_bits;
+           total_size += table_size;
+           low = key & mask;
+-          root_table[low].bits = (uint8_t)(table_bits + root_bits);
+-          root_table[low].value = (uint16_t)((table - root_table) - low);
++          if (root_table != NULL) {
++            root_table[low].bits = (uint8_t)(table_bits + root_bits);
++            root_table[low].value = (uint16_t)((table - root_table) - low);
++          }
++        }
++        if (root_table != NULL) {
++          code.bits = (uint8_t)(len - root_bits);
++          code.value = (uint16_t)sorted[symbol++];
++          ReplicateValue(&table[key >> root_bits], step, table_size, code);
+         }
+-        code.bits = (uint8_t)(len - root_bits);
+-        code.value = (uint16_t)sorted[symbol++];
+-        ReplicateValue(&table[key >> root_bits], step, table_size, code);
+         key = GetNextKey(key, len);
+       }
+     }
+@@ -211,25 +214,83 @@ static int BuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
+   ((1 << MAX_CACHE_BITS) + NUM_LITERAL_CODES + NUM_LENGTH_CODES)
+ // Cut-off value for switching between heap and stack allocation.
+ #define SORTED_SIZE_CUTOFF 512
+-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bits,
+                           const int code_lengths[], int code_lengths_size) {
+-  int total_size;
++  const int total_size =
++      BuildHuffmanTable(NULL, root_bits, code_lengths, code_lengths_size, NULL);
+   assert(code_lengths_size <= MAX_CODE_LENGTHS_SIZE);
+-  if (root_table == NULL) {
+-    total_size = BuildHuffmanTable(NULL, root_bits,
+-                                   code_lengths, code_lengths_size, NULL);
+-  } else if (code_lengths_size <= SORTED_SIZE_CUTOFF) {
++  if (total_size == 0 || root_table == NULL) return total_size;
++
++  if (root_table->curr_segment->curr_table + total_size >=
++      root_table->curr_segment->start + root_table->curr_segment->size) {
++    // If 'root_table' does not have enough memory, allocate a new segment.
++    // The available part of root_table->curr_segment is left unused because we
++    // need a contiguous buffer.
++    const int segment_size = root_table->curr_segment->size;
++    struct HuffmanTablesSegment* next =
++        (HuffmanTablesSegment*)WebPSafeMalloc(1, sizeof(*next));
++    if (next == NULL) return 0;
++    // Fill the new segment.
++    // We need at least 'total_size' but if that value is small, it is better to
++    // allocate a big chunk to prevent more allocations later. 'segment_size' is
++    // therefore chosen (any other arbitrary value could be chosen).
++    next->size = total_size > segment_size ? total_size : segment_size;
++    next->start =
++        (HuffmanCode*)WebPSafeMalloc(next->size, sizeof(*next->start));
++    if (next->start == NULL) {
++      WebPSafeFree(next);
++      return 0;
++    }
++    next->curr_table = next->start;
++    next->next = NULL;
++    // Point to the new segment.
++    root_table->curr_segment->next = next;
++    root_table->curr_segment = next;
++  }
++  if (code_lengths_size <= SORTED_SIZE_CUTOFF) {
+     // use local stack-allocated array.
+     uint16_t sorted[SORTED_SIZE_CUTOFF];
+-    total_size = BuildHuffmanTable(root_table, root_bits,
+-                                   code_lengths, code_lengths_size, sorted);
+-  } else {   // rare case. Use heap allocation.
++    BuildHuffmanTable(root_table->curr_segment->curr_table, root_bits,
++                      code_lengths, code_lengths_size, sorted);
++  } else {  // rare case. Use heap allocation.
+     uint16_t* const sorted =
+         (uint16_t*)WebPSafeMalloc(code_lengths_size, sizeof(*sorted));
+     if (sorted == NULL) return 0;
+-    total_size = BuildHuffmanTable(root_table, root_bits,
+-                                   code_lengths, code_lengths_size, sorted);
++    BuildHuffmanTable(root_table->curr_segment->curr_table, root_bits,
++                      code_lengths, code_lengths_size, sorted);
+     WebPSafeFree(sorted);
+   }
+   return total_size;
+ }
++
++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables) {
++  // Have 'segment' point to the first segment for now, 'root'.
++  HuffmanTablesSegment* const root = &huffman_tables->root;
++  huffman_tables->curr_segment = root;
++  // Allocate root.
++  root->start = (HuffmanCode*)WebPSafeMalloc(size, sizeof(*root->start));
++  if (root->start == NULL) return 0;
++  root->curr_table = root->start;
++  root->next = NULL;
++  root->size = size;
++  return 1;
++}
++
++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables) {
++  HuffmanTablesSegment *current, *next;
++  if (huffman_tables == NULL) return;
++  // Free the root node.
++  current = &huffman_tables->root;
++  next = current->next;
++  WebPSafeFree(current->start);
++  current->start = NULL;
++  current->next = NULL;
++  current = next;
++  // Free the following nodes.
++  while (current != NULL) {
++    next = current->next;
++    WebPSafeFree(current->start);
++    WebPSafeFree(current);
++    current = next;
++  }
++}
+diff --git a/src/utils/huffman_utils.h b/src/utils/huffman_utils.h
+index 13b7ad1a..98415c53 100644
+--- a/src/utils/huffman_utils.h
++++ b/src/utils/huffman_utils.h
+@@ -43,6 +43,29 @@ typedef struct {
+                     // or non-literal symbol otherwise
+ } HuffmanCode32;
+ 
++// Contiguous memory segment of HuffmanCodes.
++typedef struct HuffmanTablesSegment {
++  HuffmanCode* start;
++  // Pointer to where we are writing into the segment. Starts at 'start' and
++  // cannot go beyond 'start' + 'size'.
++  HuffmanCode* curr_table;
++  // Pointer to the next segment in the chain.
++  struct HuffmanTablesSegment* next;
++  int size;
++} HuffmanTablesSegment;
++
++// Chained memory segments of HuffmanCodes.
++typedef struct HuffmanTables {
++  HuffmanTablesSegment root;
++  // Currently processed segment. At first, this is 'root'.
++  HuffmanTablesSegment* curr_segment;
++} HuffmanTables;
++
++// Allocates a HuffmanTables with 'size' contiguous HuffmanCodes. Returns 0 on
++// memory allocation error, 1 otherwise.
++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables);
++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables);
++
+ #define HUFFMAN_PACKED_BITS 6
+ #define HUFFMAN_PACKED_TABLE_SIZE (1u << HUFFMAN_PACKED_BITS)
+ 
+@@ -78,9 +101,7 @@ void VP8LHtreeGroupsFree(HTreeGroup* const htree_groups);
+ // the huffman table.
+ // Returns built table size or 0 in case of error (invalid tree or
+ // memory error).
+-// If root_table is NULL, it returns 0 if a lookup cannot be built, something
+-// > 0 otherwise (but not the table size).
+-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bits,
+                           const int code_lengths[], int code_lengths_size);
+ 
+ #ifdef __cplusplus
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
index 5d868b3b96..4defdd5e42 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz \
            file://CVE-2023-1999.patch \
+           file://CVE-2023-5129.patch \
            "
 SRC_URI[sha256sum] = "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df"
 
-- 
2.34.1


