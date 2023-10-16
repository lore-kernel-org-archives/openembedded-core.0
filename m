Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBAECDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 15:40:01 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.130002.1697470795873181424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 08:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZM2IsaYu;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so8172878a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697470794; x=1698075594; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYjJKgoKkm6AtMoFQbvSsV65Jx+qLCWxa0en4AJNImM=;
        b=ZM2IsaYurWimlUizD1nJrUgORtpfTJrCc4uZ6jwUehad70X2/vrz6DqMSWJ5530fOH
         iDghY/H/HTYDu8aiSU8BuRfZUHbIV8DPyOARW0kMFgGgc9MCmKN6dVfBUzVPFQPrdH2f
         sbPXhNYHFevCP8kAw3aeGgTTPCvQQAExVZMI3qs19yJ8AmSA2fkn8QAhqVKX5/QrPVTI
         dU2VlY+D1+YXxZGoQkcJxcPuodmwCnfcxSmMX1uC7PHSfK16am1RWVofAkEz9nErZWZo
         mGAcwsXAQrDP8t7Vzfp/eq8wCwicRvNp+Y4nMxLEAHfVo+dU/Sq2IP45g1g07rIJibSZ
         pVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470794; x=1698075594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYjJKgoKkm6AtMoFQbvSsV65Jx+qLCWxa0en4AJNImM=;
        b=dr0FZr8x1SuFtcvmSV3dy+5oPK0SurM3BEgtYTy8l72+KOHLEQhPn2drB0Kf5acuf2
         F02c/PFxvdMzM+fWEQpjxwHdCXv+PQWJ/YNS4IIQ2Y8pOawsg4D1ZbZUN5s1OGTEV9bl
         nEctiFQL8CYzdKtDdtEnAjY6NoZFF9SxrlLv6L0i0U0XIf1OAlqFwn41vlzLW1rir4K0
         VQfc+GLnBgfcg6dGMZaDb4XyYGtdodDavGcnFHnnSS77vNrInbVOLH02xf2gCJipumcu
         iKprIG4jSCfMK0Xi3jzYi89FTArQPfUkijlv0iD2U5g/8T+JVjAdz20K0JIPbzFmQ8cv
         rALQ==
X-Gm-Message-State: AOJu0YzwL4rOPFlFvmB3HAVE9cUiinRMOE8rkav1A6JnaGFps2jEMdil
	/yGzfOb83SWNPYimM1py4EOTmpDXAM+vD25K9AE54Q==
X-Google-Smtp-Source: AGHT+IFt8mT1AXR1N5fVOIgDxAdL+Tt3dVp1HtJnjkwy5fTLNSlAOitGQZPvo9SezPSKX0TkPrvf4BCvoo1aVgA4WAk=
X-Received: by 2002:a17:906:315a:b0:9a4:88af:b7b with SMTP id
 e26-20020a170906315a00b009a488af0b7bmr30211583eje.62.1697470793987; Mon, 16
 Oct 2023 08:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231016064152.18868-1-badganchipv@gmail.com>
In-Reply-To: <20231016064152.18868-1-badganchipv@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 16 Oct 2023 05:39:42 -1000
Message-ID: <CAOSpxdY2tRK-LZg4usL0-EaQoXRfy-_Xq+JXGHvjA2GANsMMMQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libwebp: Fix CVE-2023-4863 for libwebp
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	rajmohan r <rajmohan.r@kpit.com>, Pawan Badganchi <Pawan.Badganchi@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 15:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189300

On Sun, Oct 15, 2023 at 8:42=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com> wrote:
>
> From: rajmohan r <rajmohan.r@kpit.com>
>
> Add patch to fix CVE-2023-4863
>
> Reference:
> https://tracker.debian.org/pkg/libwebp
> https://snapshot.debian.org/archive/debian-debug/20230916T210655Z/pool/ma=
in/libw/libwebp/libwebp_1.2.4-0.2%2Bdeb12u1.debian.tar.xz
>
> Upstream-Status: Pending
>
> Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> ---
>  .../webp/files/CVE-2023-4863.patch            | 367 ++++++++++++++++++

This patch does not apply:

ERROR: libwebp-1.2.4-r0 do_patch: Applying patch 'CVE-2023-4863.patch'
on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-lin=
ux/libwebp/1.2.4-r0/libwebp-1.2.4'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/libwebp/1.2.4-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2023-4863.patch
patching file src/dec/vp8l_dec.c
Hunk #1 FAILED at 253.
Hunk #2 FAILED at 277.
Hunk #3 FAILED at 300.
Hunk #4 FAILED at 307.
Hunk #5 FAILED at 362.
Hunk #6 succeeded at 377 with fuzz 2 (offset 5 lines).
Hunk #7 FAILED at 438.
Hunk #8 FAILED at 472.
Hunk #9 FAILED at 519.
Hunk #10 succeeded at 1245 (offset 4 lines).
Hunk #11 FAILED at 1373.
Hunk #12 FAILED at 1688.
10 out of 12 hunks FAILED -- rejects in file src/dec/vp8l_dec.c
patching file src/dec/vp8li_dec.h
Hunk #1 FAILED at 51.
1 out of 1 hunk FAILED -- rejects in file src/dec/vp8li_dec.h
patching file src/utils/huffman_utils.c
Hunk #1 FAILED at 177.
Hunk #2 FAILED at 211.
2 out of 2 hunks FAILED -- rejects in file src/utils/huffman_utils.c
patching file src/utils/huffman_utils.h
Hunk #1 succeeded at 66 with fuzz 2 (offset 23 lines).
Hunk #2 FAILED at 101.
1 out of 2 hunks FAILED -- rejects in file src/utils/huffman_utils.h
Patch CVE-2023-4863.patch does not apply (enforce with -f)

Steve

>  meta/recipes-multimedia/webp/libwebp_1.2.4.bb |   1 +
>  2 files changed, 368 insertions(+)
>  create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863.patc=
h
>
> diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch b/met=
a/recipes-multimedia/webp/files/CVE-2023-4863.patch
> new file mode 100644
> index 0000000000..07004eceee
> --- /dev/null
> +++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> @@ -0,0 +1,367 @@
> +From 902bc9190331343b2017211debcec8d2ab87e17a Mon Sep 17 00:00:00 2001
> +From: Vincent Rabaud <vrabaud@google.com>
> +Date: Thu, 7 Sep 2023 21:16:03 +0200
> +Subject: [PATCH] Fix OOB write in BuildHuffmanTable.
> +
> +From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00 2001
> +From: Vincent Rabaud <vrabaud@google.com>
> +Date: Mon, 11 Sep 2023 16:06:08 +0200
> +Subject: [PATCH] Fix invalid incremental decoding check.
> +
> +CVE: CVE-2023-4863
> +Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-de=
bug/20230916T210655Z/pool/main/libw/libwebp/libwebp_1.2.4-0.2%2Bdeb12u1.deb=
ian.tar.xz]
> +
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +
> +--- libwebp-1.2.4.orig/src/dec/vp8l_dec.c
> ++++ libwebp-1.2.4/src/dec/vp8l_dec.c
> +@@ -253,11 +253,11 @@ static int ReadHuffmanCodeLengths(
> +   int symbol;
> +   int max_symbol;
> +   int prev_code_len =3D DEFAULT_CODE_LENGTH;
> +-  HuffmanCode table[1 << LENGTHS_TABLE_BITS];
> ++  HuffmanTables tables;
> +
> +-  if (!VP8LBuildHuffmanTable(table, LENGTHS_TABLE_BITS,
> +-                             code_length_code_lengths,
> +-                             NUM_CODE_LENGTH_CODES)) {
> ++  if (!VP8LHuffmanTablesAllocate(1 << LENGTHS_TABLE_BITS, &tables) ||
> ++      !VP8LBuildHuffmanTable(&tables, LENGTHS_TABLE_BITS,
> ++                             code_length_code_lengths, NUM_CODE_LENGTH_=
CODES)) {
> +     goto End;
> +   }
> +
> +@@ -277,7 +277,7 @@ static int ReadHuffmanCodeLengths(
> +     int code_len;
> +     if (max_symbol-- =3D=3D 0) break;
> +     VP8LFillBitWindow(br);
> +-    p =3D &table[VP8LPrefetchBits(br) & LENGTHS_TABLE_MASK];
> ++    p =3D &tables.curr_segment->start[VP8LPrefetchBits(br) & LENGTHS_TA=
BLE_MASK];
> +     VP8LSetBitPos(br, br->bit_pos_ + p->bits);
> +     code_len =3D p->value;
> +     if (code_len < kCodeLengthLiterals) {
> +@@ -300,6 +300,7 @@ static int ReadHuffmanCodeLengths(
> +   ok =3D 1;
> +
> +  End:
> ++  VP8LHuffmanTablesDeallocate(&tables);
> +   if (!ok) dec->status_ =3D VP8_STATUS_BITSTREAM_ERROR;
> +   return ok;
> + }
> +@@ -307,7 +308,8 @@ static int ReadHuffmanCodeLengths(
> + // 'code_lengths' is pre-allocated temporary buffer, used for creating =
Huffman
> + // tree.
> + static int ReadHuffmanCode(int alphabet_size, VP8LDecoder* const dec,
> +-                           int* const code_lengths, HuffmanCode* const =
table) {
> ++                           int* const code_lengths,
> ++                           HuffmanTables* const table) {
> +   int ok =3D 0;
> +   int size =3D 0;
> +   VP8LBitReader* const br =3D &dec->br_;
> +@@ -362,8 +364,7 @@ static int ReadHuffmanCodes(VP8LDecoder*
> +   VP8LMetadata* const hdr =3D &dec->hdr_;
> +   uint32_t* huffman_image =3D NULL;
> +   HTreeGroup* htree_groups =3D NULL;
> +-  HuffmanCode* huffman_tables =3D NULL;
> +-  HuffmanCode* huffman_table =3D NULL;
> ++  HuffmanTables* huffman_tables =3D &hdr->huffman_tables_;
> +   int num_htree_groups =3D 1;
> +   int num_htree_groups_max =3D 1;
> +   int max_alphabet_size =3D 0;
> +@@ -372,6 +373,10 @@ static int ReadHuffmanCodes(VP8LDecoder*
> +   int* mapping =3D NULL;
> +   int ok =3D 0;
> +
> ++  // Check the table has been 0 initialized (through InitMetadata).
> ++  assert(huffman_tables->root.start =3D=3D NULL);
> ++  assert(huffman_tables->curr_segment =3D=3D NULL);
> ++
> +   if (allow_recursion && VP8LReadBits(br, 1)) {
> +     // use meta Huffman codes.
> +     const int huffman_precision =3D VP8LReadBits(br, 3) + 2;
> +@@ -434,16 +439,15 @@ static int ReadHuffmanCodes(VP8LDecoder*
> +
> +   code_lengths =3D (int*)WebPSafeCalloc((uint64_t)max_alphabet_size,
> +                                       sizeof(*code_lengths));
> +-  huffman_tables =3D (HuffmanCode*)WebPSafeMalloc(num_htree_groups * ta=
ble_size,
> +-                                                sizeof(*huffman_tables)=
);
> +   htree_groups =3D VP8LHtreeGroupsNew(num_htree_groups);
> +
> +-  if (htree_groups =3D=3D NULL || code_lengths =3D=3D NULL || huffman_t=
ables =3D=3D NULL) {
> ++  if (htree_groups =3D=3D NULL || code_lengths =3D=3D NULL ||
> ++      !VP8LHuffmanTablesAllocate(num_htree_groups * table_size,
> ++                                 huffman_tables)) {
> +     dec->status_ =3D VP8_STATUS_OUT_OF_MEMORY;
> +     goto Error;
> +   }
> +
> +-  huffman_table =3D huffman_tables;
> +   for (i =3D 0; i < num_htree_groups_max; ++i) {
> +     // If the index "i" is unused in the Huffman image, just make sure =
the
> +     // coefficients are valid but do not store them.
> +@@ -468,19 +472,20 @@ static int ReadHuffmanCodes(VP8LDecoder*
> +       int max_bits =3D 0;
> +       for (j =3D 0; j < HUFFMAN_CODES_PER_META_CODE; ++j) {
> +         int alphabet_size =3D kAlphabetSize[j];
> +-        htrees[j] =3D huffman_table;
> +         if (j =3D=3D 0 && color_cache_bits > 0) {
> +           alphabet_size +=3D (1 << color_cache_bits);
> +         }
> +-        size =3D ReadHuffmanCode(alphabet_size, dec, code_lengths, huff=
man_table);
> ++        size =3D
> ++            ReadHuffmanCode(alphabet_size, dec, code_lengths, huffman_t=
ables);
> ++        htrees[j] =3D huffman_tables->curr_segment->curr_table;
> +         if (size =3D=3D 0) {
> +           goto Error;
> +         }
> +         if (is_trivial_literal && kLiteralMap[j] =3D=3D 1) {
> +-          is_trivial_literal =3D (huffman_table->bits =3D=3D 0);
> ++          is_trivial_literal =3D (htrees[j]->bits =3D=3D 0);
> +         }
> +-        total_size +=3D huffman_table->bits;
> +-        huffman_table +=3D size;
> ++        total_size +=3D htrees[j]->bits;
> ++        huffman_tables->curr_segment->curr_table +=3D size;
> +         if (j <=3D ALPHA) {
> +           int local_max_bits =3D code_lengths[0];
> +           int k;
> +@@ -515,14 +520,13 @@ static int ReadHuffmanCodes(VP8LDecoder*
> +   hdr->huffman_image_ =3D huffman_image;
> +   hdr->num_htree_groups_ =3D num_htree_groups;
> +   hdr->htree_groups_ =3D htree_groups;
> +-  hdr->huffman_tables_ =3D huffman_tables;
> +
> +  Error:
> +   WebPSafeFree(code_lengths);
> +   WebPSafeFree(mapping);
> +   if (!ok) {
> +     WebPSafeFree(huffman_image);
> +-    WebPSafeFree(huffman_tables);
> ++    VP8LHuffmanTablesDeallocate(huffman_tables);
> +     VP8LHtreeGroupsFree(htree_groups);
> +   }
> +   return ok;
> +@@ -1237,9 +1241,20 @@ static int DecodeImageData(VP8LDecoder*
> +   }
> +
> +   br->eos_ =3D VP8LIsEndOfStream(br);
> +-  if (dec->incremental_ && br->eos_ && src < src_end) {
> ++  // In incremental decoding:
> ++  // br->eos_ && src < src_last: if 'br' reached the end of the buffer =
and
> ++  // 'src_last' has not been reached yet, there is not enough data. 'de=
c' has to
> ++  // be reset until there is more data.
> ++  // !br->eos_ && src < src_last: this cannot happen as either the buff=
er is
> ++  // fully read, either enough has been read to reach 'src_last'.
> ++  // src >=3D src_last: 'src_last' is reached, all is fine. 'src' can a=
ctually go
> ++  // beyond 'src_last' in case the image is cropped and an LZ77 goes fu=
rther.
> ++  // The buffer might have been enough or there is some left. 'br->eos_=
' does
> ++  // not matter.
> ++  assert(!dec->incremental_ || (br->eos_ && src < src_last) || src >=3D=
 src_last);
> ++  if (dec->incremental_ && br->eos_ && src < src_last) {
> +     RestoreState(dec);
> +-  } else if (!br->eos_) {
> ++  } else if ((dec->incremental_ && src >=3D src_last) || !br->eos_) {
> +     // Process the remaining rows corresponding to last row-block.
> +     if (process_func !=3D NULL) {
> +       process_func(dec, row > last_row ? last_row : row);
> +@@ -1358,7 +1373,7 @@ static void ClearMetadata(VP8LMetadata*
> +   assert(hdr !=3D NULL);
> +
> +   WebPSafeFree(hdr->huffman_image_);
> +-  WebPSafeFree(hdr->huffman_tables_);
> ++  VP8LHuffmanTablesDeallocate(&hdr->huffman_tables_);
> +   VP8LHtreeGroupsFree(hdr->htree_groups_);
> +   VP8LColorCacheClear(&hdr->color_cache_);
> +   VP8LColorCacheClear(&hdr->saved_color_cache_);
> +@@ -1673,7 +1688,7 @@ int VP8LDecodeImage(VP8LDecoder* const d
> +
> +   if (dec =3D=3D NULL) return 0;
> +
> +-  assert(dec->hdr_.huffman_tables_ !=3D NULL);
> ++  assert(dec->hdr_.huffman_tables_.root.start !=3D NULL);
> +   assert(dec->hdr_.htree_groups_ !=3D NULL);
> +   assert(dec->hdr_.num_htree_groups_ > 0);
> +
> +--- libwebp-1.2.4.orig/src/dec/vp8li_dec.h
> ++++ libwebp-1.2.4/src/dec/vp8li_dec.h
> +@@ -51,7 +51,7 @@ typedef struct {
> +   uint32_t*       huffman_image_;
> +   int             num_htree_groups_;
> +   HTreeGroup*     htree_groups_;
> +-  HuffmanCode*    huffman_tables_;
> ++  HuffmanTables   huffman_tables_;
> + } VP8LMetadata;
> +
> + typedef struct VP8LDecoder VP8LDecoder;
> +--- libwebp-1.2.4.orig/src/utils/huffman_utils.c
> ++++ libwebp-1.2.4/src/utils/huffman_utils.c
> +@@ -177,21 +177,24 @@ static int BuildHuffmanTable(HuffmanCode
> +       if (num_open < 0) {
> +         return 0;
> +       }
> +-      if (root_table =3D=3D NULL) continue;
> +       for (; count[len] > 0; --count[len]) {
> +         HuffmanCode code;
> +         if ((key & mask) !=3D low) {
> +-          table +=3D table_size;
> ++          if (root_table !=3D NULL) table +=3D table_size;
> +           table_bits =3D NextTableBitSize(count, len, root_bits);
> +           table_size =3D 1 << table_bits;
> +           total_size +=3D table_size;
> +           low =3D key & mask;
> +-          root_table[low].bits =3D (uint8_t)(table_bits + root_bits);
> +-          root_table[low].value =3D (uint16_t)((table - root_table) - l=
ow);
> ++          if (root_table !=3D NULL) {
> ++            root_table[low].bits =3D (uint8_t)(table_bits + root_bits);
> ++            root_table[low].value =3D (uint16_t)((table - root_table) -=
 low);
> ++          }
> ++        }
> ++        if (root_table !=3D NULL) {
> ++          code.bits =3D (uint8_t)(len - root_bits);
> ++          code.value =3D (uint16_t)sorted[symbol++];
> ++          ReplicateValue(&table[key >> root_bits], step, table_size, co=
de);
> +         }
> +-        code.bits =3D (uint8_t)(len - root_bits);
> +-        code.value =3D (uint16_t)sorted[symbol++];
> +-        ReplicateValue(&table[key >> root_bits], step, table_size, code=
);
> +         key =3D GetNextKey(key, len);
> +       }
> +     }
> +@@ -211,25 +214,83 @@ static int BuildHuffmanTable(HuffmanCode
> +   ((1 << MAX_CACHE_BITS) + NUM_LITERAL_CODES + NUM_LENGTH_CODES)
> + // Cut-off value for switching between heap and stack allocation.
> + #define SORTED_SIZE_CUTOFF 512
> +-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
> ++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bit=
s,
> +                           const int code_lengths[], int code_lengths_si=
ze) {
> +-  int total_size;
> ++  const int total_size =3D
> ++      BuildHuffmanTable(NULL, root_bits, code_lengths, code_lengths_siz=
e, NULL);
> +   assert(code_lengths_size <=3D MAX_CODE_LENGTHS_SIZE);
> +-  if (root_table =3D=3D NULL) {
> +-    total_size =3D BuildHuffmanTable(NULL, root_bits,
> +-                                   code_lengths, code_lengths_size, NUL=
L);
> +-  } else if (code_lengths_size <=3D SORTED_SIZE_CUTOFF) {
> ++  if (total_size =3D=3D 0 || root_table =3D=3D NULL) return total_size;
> ++
> ++  if (root_table->curr_segment->curr_table + total_size >=3D
> ++      root_table->curr_segment->start + root_table->curr_segment->size)=
 {
> ++    // If 'root_table' does not have enough memory, allocate a new segm=
ent.
> ++    // The available part of root_table->curr_segment is left unused be=
cause we
> ++    // need a contiguous buffer.
> ++    const int segment_size =3D root_table->curr_segment->size;
> ++    struct HuffmanTablesSegment* next =3D
> ++        (HuffmanTablesSegment*)WebPSafeMalloc(1, sizeof(*next));
> ++    if (next =3D=3D NULL) return 0;
> ++    // Fill the new segment.
> ++    // We need at least 'total_size' but if that value is small, it is =
better to
> ++    // allocate a big chunk to prevent more allocations later. 'segment=
_size' is
> ++    // therefore chosen (any other arbitrary value could be chosen).
> ++    next->size =3D total_size > segment_size ? total_size : segment_siz=
e;
> ++    next->start =3D
> ++        (HuffmanCode*)WebPSafeMalloc(next->size, sizeof(*next->start));
> ++    if (next->start =3D=3D NULL) {
> ++      WebPSafeFree(next);
> ++      return 0;
> ++    }
> ++    next->curr_table =3D next->start;
> ++    next->next =3D NULL;
> ++    // Point to the new segment.
> ++    root_table->curr_segment->next =3D next;
> ++    root_table->curr_segment =3D next;
> ++  }
> ++  if (code_lengths_size <=3D SORTED_SIZE_CUTOFF) {
> +     // use local stack-allocated array.
> +     uint16_t sorted[SORTED_SIZE_CUTOFF];
> +-    total_size =3D BuildHuffmanTable(root_table, root_bits,
> +-                                   code_lengths, code_lengths_size, sor=
ted);
> +-  } else {   // rare case. Use heap allocation.
> ++    BuildHuffmanTable(root_table->curr_segment->curr_table, root_bits,
> ++                      code_lengths, code_lengths_size, sorted);
> ++  } else {  // rare case. Use heap allocation.
> +     uint16_t* const sorted =3D
> +         (uint16_t*)WebPSafeMalloc(code_lengths_size, sizeof(*sorted));
> +     if (sorted =3D=3D NULL) return 0;
> +-    total_size =3D BuildHuffmanTable(root_table, root_bits,
> +-                                   code_lengths, code_lengths_size, sor=
ted);
> ++    BuildHuffmanTable(root_table->curr_segment->curr_table, root_bits,
> ++                      code_lengths, code_lengths_size, sorted);
> +     WebPSafeFree(sorted);
> +   }
> +   return total_size;
> + }
> ++
> ++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables) =
{
> ++  // Have 'segment' point to the first segment for now, 'root'.
> ++  HuffmanTablesSegment* const root =3D &huffman_tables->root;
> ++  huffman_tables->curr_segment =3D root;
> ++  // Allocate root.
> ++  root->start =3D (HuffmanCode*)WebPSafeMalloc(size, sizeof(*root->star=
t));
> ++  if (root->start =3D=3D NULL) return 0;
> ++  root->curr_table =3D root->start;
> ++  root->next =3D NULL;
> ++  root->size =3D size;
> ++  return 1;
> ++}
> ++
> ++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables) {
> ++  HuffmanTablesSegment *current, *next;
> ++  if (huffman_tables =3D=3D NULL) return;
> ++  // Free the root node.
> ++  current =3D &huffman_tables->root;
> ++  next =3D current->next;
> ++  WebPSafeFree(current->start);
> ++  current->start =3D NULL;
> ++  current->next =3D NULL;
> ++  current =3D next;
> ++  // Free the following nodes.
> ++  while (current !=3D NULL) {
> ++    next =3D current->next;
> ++    WebPSafeFree(current->start);
> ++    WebPSafeFree(current);
> ++    current =3D next;
> ++  }
> ++}
> +--- libwebp-1.2.4.orig/src/utils/huffman_utils.h
> ++++ libwebp-1.2.4/src/utils/huffman_utils.h
> +@@ -43,6 +43,29 @@ typedef struct {
> +                     // or non-literal symbol otherwise
> + } HuffmanCode32;
> +
> ++// Contiguous memory segment of HuffmanCodes.
> ++typedef struct HuffmanTablesSegment {
> ++  HuffmanCode* start;
> ++  // Pointer to where we are writing into the segment. Starts at 'start=
' and
> ++  // cannot go beyond 'start' + 'size'.
> ++  HuffmanCode* curr_table;
> ++  // Pointer to the next segment in the chain.
> ++  struct HuffmanTablesSegment* next;
> ++  int size;
> ++} HuffmanTablesSegment;
> ++
> ++// Chained memory segments of HuffmanCodes.
> ++typedef struct HuffmanTables {
> ++  HuffmanTablesSegment root;
> ++  // Currently processed segment. At first, this is 'root'.
> ++  HuffmanTablesSegment* curr_segment;
> ++} HuffmanTables;
> ++
> ++// Allocates a HuffmanTables with 'size' contiguous HuffmanCodes. Retur=
ns 0 on
> ++// memory allocation error, 1 otherwise.
> ++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables);
> ++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables);
> ++
> + #define HUFFMAN_PACKED_BITS 6
> + #define HUFFMAN_PACKED_TABLE_SIZE (1u << HUFFMAN_PACKED_BITS)
> +
> +@@ -78,9 +101,7 @@ void VP8LHtreeGroupsFree(HTreeGroup* con
> + // the huffman table.
> + // Returns built table size or 0 in case of error (invalid tree or
> + // memory error).
> +-// If root_table is NULL, it returns 0 if a lookup cannot be built, som=
ething
> +-// > 0 otherwise (but not the table size).
> +-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
> ++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bit=
s,
> +                           const int code_lengths[], int code_lengths_si=
ze);
> +
> + #ifdef __cplusplus
> diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb b/meta/recipes=
-multimedia/webp/libwebp_1.2.4.bb
> index 4defdd5e42..0728ca60f5 100644
> --- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> +++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> @@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6e8dee932c26=
f2dab503abf70c96d8bb \
>  SRC_URI =3D "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz=
 \
>             file://CVE-2023-1999.patch \
>             file://CVE-2023-5129.patch \
> +           file://CVE-2023-4863.patch \
>             "
>  SRC_URI[sha256sum] =3D "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d54=
80c205331d9494df"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189259): https://lists.openembedded.org/g/openembedde=
d-core/message/189259
> Mute This Topic: https://lists.openembedded.org/mt/101991116/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

