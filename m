Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A2FCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 06:33:38 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.111955.1697438012778548141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 23:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MRdAZjel;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: badganchipv@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b2b1af964dso2081210b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 23:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697438012; x=1698042812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTeUBEMcs19EJn+d3DMgvB3YexZsALbilLouJuOu/Rs=;
        b=MRdAZjelZnbnGToLvjTm5fuhu5Esd5T/x88WITZuS+hM1iJqqh97t512da1krqbmBE
         HDTVENNcftR0dtX0T2QOJnSCJhFSqLqF/12KGsibcBvC6/aKWl3PcNMxs0y78CVlkngM
         FVqyKfxwo/yCuwCliCMXqVLdpJDG/y/3r/2YUYSa5PL3fsUePO+SRZIFGdNiC0OiogE7
         SkMt8p2ZVQ+jLayTMf44odbAvXSY5BzA83+jb19cPLvIDPpgeZ8GYtrAIQeInb9ecZft
         qkDlxktxVeMUtHSxowmtuzp74Dpz/aBK35u10TxPKe6BqoAypMq0J/8xDfwqwn5A9ikd
         MG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697438012; x=1698042812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTeUBEMcs19EJn+d3DMgvB3YexZsALbilLouJuOu/Rs=;
        b=Bh5quu34vvkLHyX6KCrxC6t/oePlCWr5adDvB7aB0OKOFIQMXm0bsqA2dUg2i+zIJx
         CajCtjRybZ2lBZKR40QV9Gwbz6Lf1iEnJFN2LhqyqRIDEBjbwwViHFaXFYGIs7Bhsdcu
         2BZdjtil+8Rtdxi1KoW82W8HtGeJZY3uN3lESwLofjcWPr9lL8vXc7OhZDS3Y2ECLWPq
         2IeYOFcwjTpYU20tA+8zg0a4K9g0dP31x8bmQSnOLOzt1/2nZES4GmYxxf7zxPD6gWap
         9K1HTtdr2a1ud2Qzsh1HbRdz1lQrlBuUNpk4xkMLjCin5lImZzKAsktELeNCs+sY3q0w
         0/iQ==
X-Gm-Message-State: AOJu0YwJy2xuWqb4FwDKesT67cpDrHAMbefccR7EVlWW9+wuTJCQRmqx
	Z5CMKFhT72Hqj1DrKjBFnbpez8IG05Awyg==
X-Google-Smtp-Source: AGHT+IHjUpaNWvoHadCmE9iJRYo8ukrv9XIB/bUuC/8vx1kHUv5kodunE8pN8Psn9y80SIMDoluhog==
X-Received: by 2002:a05:6808:998:b0:3ae:3bd:d3d2 with SMTP id a24-20020a056808099800b003ae03bdd3d2mr36274441oic.10.1697438011762;
        Sun, 15 Oct 2023 23:33:31 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c9a:c74b:230f:a25b:2132:c022])
        by smtp.gmail.com with ESMTPSA id i13-20020a63bf4d000000b0058a9621f583sm6173493pgo.44.2023.10.15.23.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 23:33:31 -0700 (PDT)
From: Pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	rajmohan r <rajmohan.r@kpit.com>,
	Pawan Badganchi <Pawan.Badganchi@kpit.com>
Subject: [OE-core][dunfell][PATCH] libwebp: Fix CVE-2023-4863 for libwebp
Date: Mon, 16 Oct 2023 12:03:02 +0530
Message-Id: <20231016063302.18188-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 06:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189258

From: rajmohan r <rajmohan.r@kpit.com>

Add patch to fix CVE-2023-4863

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-4863
https://github.com/webmproject/libwebp/commit/902bc9190331343b2017211debcec8d2ab87e17a

Upstream-Status: Pending

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
---
 .../webp/files/CVE-2023-4863.patch            | 363 ++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.1.0.bb |   1 +
 2 files changed, 364 insertions(+)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
new file mode 100644
index 0000000000..416e0419ae
--- /dev/null
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
@@ -0,0 +1,363 @@
+From 902bc9190331343b2017211debcec8d2ab87e17a Mon Sep 17 00:00:00 2001
+From: Vincent Rabaud <vrabaud@google.com>
+Date: Thu, 7 Sep 2023 21:16:03 +0200
+Subject: [PATCH] Fix OOB write in BuildHuffmanTable.
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
+CVE: CVE-2023-4863
+Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/902bc9190331343b2017211debcec8d2ab87e17a]
+Comment: Refreshed hunk from vp8l_dec.c
+
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+---
+ src/dec/vp8l_dec.c        | 46 ++++++++++---------
+ src/dec/vp8li_dec.h       |  2 +-
+ src/utils/huffman_utils.c | 97 +++++++++++++++++++++++++++++++--------
+ src/utils/huffman_utils.h | 27 +++++++++--
+ 4 files changed, 129 insertions(+), 43 deletions(-)
+
+diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
+index 4501216298..5ab34f56cd 100644
+--- a/src/dec/vp8l_dec.c
++++ b/src/dec/vp8l_dec.c
+@@ -253,11 +253,11 @@
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
+@@ -277,7 +277,7 @@
+     int code_len;
+     if (max_symbol-- == 0) break;
+     VP8LFillBitWindow(br);
+-    p = &table[VP8LPrefetchBits(br) & LENGTHS_TABLE_MASK];
++    p = &tables.curr_segment->start[VP8LPrefetchBits(br) & LENGTHS_TABLE_MASK];
+     VP8LSetBitPos(br, br->bit_pos_ + p->bits);
+     code_len = p->value;
+     if (code_len < kCodeLengthLiterals) {
+@@ -300,6 +300,7 @@
+   ok = 1;
+ 
+  End:
++  VP8LHuffmanTablesDeallocate(&tables);
+   if (!ok) dec->status_ = VP8_STATUS_BITSTREAM_ERROR;
+   return ok;
+ }
+@@ -307,7 +308,8 @@
+ // 'code_lengths' is pre-allocated temporary buffer, used for creating Huffman
+ // tree.
+ static int ReadHuffmanCode(int alphabet_size, VP8LDecoder* const dec,
+-                           int* const code_lengths, HuffmanCode* const table) {
++                           int* const code_lengths,
++                           HuffmanTables* const table) {
+   int ok = 0;
+   int size = 0;
+   VP8LBitReader* const br = &dec->br_;
+@@ -362,8 +364,7 @@
+   VP8LMetadata* const hdr = &dec->hdr_;
+   uint32_t* huffman_image = NULL;
+   HTreeGroup* htree_groups = NULL;
+-  HuffmanCode* huffman_tables = NULL;
+-  HuffmanCode* huffman_table = NULL;
++  HuffmanTables* huffman_tables = &hdr->huffman_tables_;
+   int num_htree_groups = 1;
+   int num_htree_groups_max = 1;
+   int max_alphabet_size = 0;
+@@ -372,6 +372,10 @@
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
+@@ -434,16 +439,15 @@
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
+@@ -468,19 +472,20 @@
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
+@@ -515,14 +520,13 @@
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
+@@ -1358,7 +1362,7 @@
+   assert(hdr != NULL);
+ 
+   WebPSafeFree(hdr->huffman_image_);
+-  WebPSafeFree(hdr->huffman_tables_);
++  VP8LHuffmanTablesDeallocate(&hdr->huffman_tables_);
+   VP8LHtreeGroupsFree(hdr->htree_groups_);
+   VP8LColorCacheClear(&hdr->color_cache_);
+   VP8LColorCacheClear(&hdr->saved_color_cache_);
+@@ -1673,7 +1673,7 @@
+ 
+   if (dec == NULL) return 0;
+ 
+-  assert(dec->hdr_.huffman_tables_ != NULL);
++  assert(dec->hdr_.huffman_tables_.root.start != NULL);
+   assert(dec->hdr_.htree_groups_ != NULL);
+   assert(dec->hdr_.num_htree_groups_ > 0);
+ 
+diff --git a/src/dec/vp8li_dec.h b/src/dec/vp8li_dec.h
+index 72b2e86120..32540a4b88 100644
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
+index 90c2fbf7c1..cf73abd437 100644
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
+index 13b7ad1ac4..98415c5328 100644
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
diff --git a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
index 27c5d92c92..36e7ca38f8 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
@@ -22,6 +22,7 @@ UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 SRC_URI += " \
     file://CVE-2023-1999.patch \
     file://CVE-2023-5129.patch \
+    file://CVE-2023-4863.patch \
 "
 
 EXTRA_OECONF = " \
-- 
2.25.1


