Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F076AE743DD
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:24 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.47631.1696102823701251899
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pRuZ3bNw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-690bccb0d8aso12422515b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102823; x=1696707623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOIddVUGKadfLmJU0nNzmOYxdEJoO2HHcoYHuZNbqI0=;
        b=pRuZ3bNwdnT0+cgqaXwA5ly41sM3J6Ar/Y3EhGVGE03x0mwaiaXwf9CoD35JTC7XQx
         l+kVhGn2/rG8VcCMifkRpATPh36oymE1qKviapvIWcjSSJZXNfXlqqCWUXtMoviG1Ad1
         AV7SRqAOSqJDnAz/6e9UsgOtsDH4RvOWlMSGSCBKzrTN2gOCODvFAX0oAt28UilfoJZk
         n8fyEtK/vEjf32Qf0kJeHvUDNUpsbq0XMp11iuTkC1g5ie4f7CgFPKHSuWeQ+xgyqPwD
         WBTsf35X0x/jxNe3Y/Zoi4ZRDsf2XZGy+W+rUsPkqSpRQcyqz4gGH59C+CSaH2GsYaoJ
         2MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102823; x=1696707623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOIddVUGKadfLmJU0nNzmOYxdEJoO2HHcoYHuZNbqI0=;
        b=MapiyUq7d4Zoc9ekvcUvcIeRwCz77SASFhmUIyfX3QdMFWZ4piFoUhhXZc6+GTXMhh
         Vm8P+lrOsS53TFCbIo4CwCVFVvNWQgET01HUD28/k0CELRvRxb1uTCtDDytM0HH2adU0
         pOCLmXh/6JFZqwKfU+otXIajGieSfOUqZR7h2niN8hWSZX9pds0EcePW5WYWtsdKVTPC
         w5EPMdmvdQZLMxl2fIPPkTz8u5in4TF8Opq2aBPzMpewwYVSdhDK07CtLAeySEKWMNYQ
         4s8l9AE+dN+jfWp86jtL8WjTE/CZNNerqPTpAGt7lYGdjDwC0VFK23K3gg48aipx+rMu
         Uu3A==
X-Gm-Message-State: AOJu0YyjiCaC0J/HazptrCxMhoN/jhaLjhx2ZpqSrzbuYivowzxN6hMc
	HoG7I/uMPGSt7uCpPkoQ/ooz4hu6XE9Z/98C4XU=
X-Google-Smtp-Source: AGHT+IEI4w3uU7C3Wb2y/lwBS3QUtfeLLTmwIZtC/mkBGh/+1/oJpUhKWi2zDFkYnxaXeCpNvSdYCQ==
X-Received: by 2002:a05:6a00:1495:b0:68f:e9ce:92a5 with SMTP id v21-20020a056a00149500b0068fe9ce92a5mr8082439pfu.4.1696102822383;
        Sat, 30 Sep 2023 12:40:22 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/13] libwebp: Fix CVE-2023-5129
Date: Sat, 30 Sep 2023 09:39:59 -1000
Message-Id: <2ab6568d35e3d68f77a73bf56eb2d38aa6ada236.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696102675.git.steve@sakoman.com>
References: <cover.1696102675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188467

From: Colin McAllister <colinmca242@gmail.com>

Add patch from libwebp 1.1.0 to fix CVE-2023-5129.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webp/files/CVE-2023-5129.patch            | 364 ++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.1.0.bb |   1 +
 2 files changed, 365 insertions(+)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-5129.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
new file mode 100644
index 0000000000..eb77e193c2
--- /dev/null
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
@@ -0,0 +1,364 @@
+From 12b11893edf6c201710ebeee7c84743a8573fad6 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/2af26267cdfcb63a88e5c74a85927a12d6ca1d76]
+Signed-off-by: Colin McAllister <colinmca242@gmail.com>
+---
+ src/dec/vp8l_dec.c        | 46 ++++++++++---------
+ src/dec/vp8li_dec.h       |  2 +-
+ src/utils/huffman_utils.c | 97 +++++++++++++++++++++++++++++++--------
+ src/utils/huffman_utils.h | 27 +++++++++--
+ 4 files changed, 129 insertions(+), 43 deletions(-)
+
+diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
+index 93615d4e..0d38314d 100644
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
+@@ -1354,7 +1358,7 @@ static void ClearMetadata(VP8LMetadata* const hdr) {
+   assert(hdr != NULL);
+ 
+   WebPSafeFree(hdr->huffman_image_);
+-  WebPSafeFree(hdr->huffman_tables_);
++  VP8LHuffmanTablesDeallocate(&hdr->huffman_tables_);
+   VP8LHtreeGroupsFree(hdr->htree_groups_);
+   VP8LColorCacheClear(&hdr->color_cache_);
+   VP8LColorCacheClear(&hdr->saved_color_cache_);
+@@ -1670,7 +1674,7 @@ int VP8LDecodeImage(VP8LDecoder* const dec) {
+   // Sanity checks.
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
diff --git a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
index f449ae750b..27c5d92c92 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
@@ -21,6 +21,7 @@ UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
 SRC_URI += " \
     file://CVE-2023-1999.patch \
+    file://CVE-2023-5129.patch \
 "
 
 EXTRA_OECONF = " \
-- 
2.34.1


