Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5654.1795866769851898976
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 03:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GZHfUACL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261128115248f68b838170000207a8-oarzg0@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261128115248f68b838170000207a8
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Nov 2026 12:52:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Y7BsdH3muGlAb9mKLKKeSfHxs+oPyAW8ndHvGvaohd0=;
 b=GZHfUACLjCaEf+q9PK0tdJdznXwuyXcIOOktRWnRW6BYkOZASlwNgH/BrHqTMpBcyPwmRj
 WdcQJIyYhzJq9FECztynzb1f2gV8SLmD1e0Ai4azPJrS5pTnmWX0A/ghTOUJ1y3JwgR9IWBt
 W+KVZYd+X54N+jy2MaCwgKSFN5cr3jYz1ssHTs2gDpcQinMs0Ug92zOKJ1dKLlh18EbqEA38
 isNEL9nGED/4AovBggv0B0wvxcA2Xu1vJUtKfU80BLvQB1R/oXF0hYvXe47HFAd/+ziPeySx
 dEpzqqSHNEHomTFRmfF8SBd/slAnqporo8a3hbr1oGz6guDXmBtS46iA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] zstd: patch CVE-2026-124851
Date: Sat, 28 Nov 2026 12:52:18 +0100
Message-ID: <20261128115218.3079397-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 11:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251488
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per https://security-tracker.debian.org/tracker/CVE-2026-124851

Also pick a precondition patch.
It's a bigger commit, but also Debian picked it in
https://salsa.debian.org/debian/libzstd/-/commit/29204aed7ddb1450b0b2e393d3231de77e4d59ab

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...eaming-decompression-memory-by-128KB.patch | 717 ++++++++++++++++++
 .../zstd/zstd/CVE-2026-124851.patch           |  98 +++
 meta/recipes-extended/zstd/zstd_1.5.5.bb      |   5 +-
 3 files changed, 819 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/zstd/zstd/0001-Reduce-streaming-decompression-memory-by-128KB.patch
 create mode 100644 meta/recipes-extended/zstd/zstd/CVE-2026-124851.patch

diff --git a/meta/recipes-extended/zstd/zstd/0001-Reduce-streaming-decompression-memory-by-128KB.patch b/meta/recipes-extended/zstd/zstd/0001-Reduce-streaming-decompression-memory-by-128KB.patch
new file mode 100644
index 00000000000..56e99503e92
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/0001-Reduce-streaming-decompression-memory-by-128KB.patch
@@ -0,0 +1,717 @@
+From 0abf2baef925fed4dac13d551c35d817e3206fdd Mon Sep 17 00:00:00 2001
+From: Nick Terrell <terrelln@fb.com>
+Date: Fri, 14 Apr 2023 14:27:06 -0700
+Subject: [PATCH] Reduce streaming decompression memory by 128KB
+
+The split literals buffer patch increased streaming decompression memory
+by 64KB (shrunk lit buffer from 128KB to 64KB, and added 128KB). This
+patch removes the added 128KB buffer, because it isn't necessary.
+
+The buffer was there because the literals compression code didn't know
+the true `blockSizeMax` of the frame, and always put split literals so
+they ended 128KB - 32 from the beginning of the block. Instead, we can
+pass down the true `blockSizeMax` and ensure that the split literals
+end up at `blockSizeMax - 32` from the beginning of the block. We
+already reserve a full `blockSizeMax` bytes in streaming mode, so we
+won't be overwriting the extDict window.
+
+Upstream-Status: Backport [https://github.com/meta/zstd/commit/0abf2baef925fed4dac13d551c35d817e3206fdd]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/decompress/zstd_decompress.c          |  21 ++-
+ lib/decompress/zstd_decompress_block.c    | 220 ++++++++++++----------
+ lib/decompress/zstd_decompress_block.h    |   2 +-
+ lib/decompress/zstd_decompress_internal.h |   1 +
+ tests/fullbench.c                         |  13 +-
+ 5 files changed, 143 insertions(+), 114 deletions(-)
+
+diff --git a/lib/decompress/zstd_decompress.c b/lib/decompress/zstd_decompress.c
+index 7bc271342..94b90481b 100644
+--- a/lib/decompress/zstd_decompress.c
++++ b/lib/decompress/zstd_decompress.c
+@@ -265,6 +265,7 @@ static void ZSTD_initDCtx_internal(ZSTD_DCtx* dctx)
+ #endif
+     dctx->noForwardProgress = 0;
+     dctx->oversizedDuration = 0;
++    dctx->isFrameDecompression = 1;
+ #if DYNAMIC_BMI2
+     dctx->bmi2 = ZSTD_cpuSupportsBmi2();
+ #endif
+@@ -1003,7 +1004,8 @@ static size_t ZSTD_decompressFrame(ZSTD_DCtx* dctx,
+         switch(blockProperties.blockType)
+         {
+         case bt_compressed:
+-            decodedSize = ZSTD_decompressBlock_internal(dctx, op, (size_t)(oBlockEnd-op), ip, cBlockSize, /* frame */ 1, not_streaming);
++            assert(dctx->isFrameDecompression == 1);
++            decodedSize = ZSTD_decompressBlock_internal(dctx, op, (size_t)(oBlockEnd-op), ip, cBlockSize, not_streaming);
+             break;
+         case bt_raw :
+             /* Use oend instead of oBlockEnd because this function is safe to overlap. It uses memmove. */
+@@ -1319,7 +1321,8 @@ size_t ZSTD_decompressContinue(ZSTD_DCtx* dctx, void* dst, size_t dstCapacity, c
+             {
+             case bt_compressed:
+                 DEBUGLOG(5, "ZSTD_decompressContinue: case bt_compressed");
+-                rSize = ZSTD_decompressBlock_internal(dctx, dst, dstCapacity, src, srcSize, /* frame */ 1, is_streaming);
++                assert(dctx->isFrameDecompression == 1);
++                rSize = ZSTD_decompressBlock_internal(dctx, dst, dstCapacity, src, srcSize, is_streaming);
+                 dctx->expected = 0;  /* Streaming not supported */
+                 break;
+             case bt_raw :
+@@ -1548,6 +1551,7 @@ size_t ZSTD_decompressBegin(ZSTD_DCtx* dctx)
+     dctx->litEntropy = dctx->fseEntropy = 0;
+     dctx->dictID = 0;
+     dctx->bType = bt_reserved;
++    dctx->isFrameDecompression = 1;
+     ZSTD_STATIC_ASSERT(sizeof(dctx->entropy.rep) == sizeof(repStartValue));
+     ZSTD_memcpy(dctx->entropy.rep, repStartValue, sizeof(repStartValue));  /* initial repcodes */
+     dctx->LLTptr = dctx->entropy.LLTable;
+@@ -1911,6 +1915,7 @@ size_t ZSTD_DCtx_reset(ZSTD_DCtx* dctx, ZSTD_ResetDirective reset)
+       || (reset == ZSTD_reset_session_and_parameters) ) {
+         dctx->streamStage = zdss_init;
+         dctx->noForwardProgress = 0;
++        dctx->isFrameDecompression = 1;
+     }
+     if ( (reset == ZSTD_reset_parameters)
+       || (reset == ZSTD_reset_session_and_parameters) ) {
+@@ -1929,9 +1934,15 @@ size_t ZSTD_sizeof_DStream(const ZSTD_DStream* dctx)
+ 
+ size_t ZSTD_decodingBufferSize_min(unsigned long long windowSize, unsigned long long frameContentSize)
+ {
+-    size_t const blockSize = (size_t) MIN(windowSize, ZSTD_BLOCKSIZE_MAX);
+-    /* space is needed to store the litbuffer after the output of a given block without stomping the extDict of a previous run, as well as to cover both windows against wildcopy*/
+-    unsigned long long const neededRBSize = windowSize + blockSize + ZSTD_BLOCKSIZE_MAX + (WILDCOPY_OVERLENGTH * 2);
++    size_t const blockSize = (size_t)MIN(windowSize, ZSTD_BLOCKSIZE_MAX);
++    /* We need blockSize + WILDCOPY_OVERLENGTH worth of buffer so that if a block
++     * ends at windowSize + WILDCOPY_OVERLENGTH + 1 bytes, we can start writing
++     * the block at the beginning of the output buffer, and maintain a full window.
++     *
++     * We need another blockSize worth of buffer so that we can store split
++     * literals at the end of the block without overwriting the extDict window.
++     */
++    unsigned long long const neededRBSize = windowSize + (blockSize * 2) + (WILDCOPY_OVERLENGTH * 2);
+     unsigned long long const neededSize = MIN(frameContentSize, neededRBSize);
+     size_t const minRBSize = (size_t) neededSize;
+     RETURN_ERROR_IF((unsigned long long)minRBSize != neededSize,
+diff --git a/lib/decompress/zstd_decompress_block.c b/lib/decompress/zstd_decompress_block.c
+index 09896a931..5028a52f1 100644
+--- a/lib/decompress/zstd_decompress_block.c
++++ b/lib/decompress/zstd_decompress_block.c
+@@ -51,6 +51,13 @@ static void ZSTD_copy4(void* dst, const void* src) { ZSTD_memcpy(dst, src, 4); }
+  *   Block decoding
+  ***************************************************************/
+ 
++static size_t ZSTD_blockSizeMax(ZSTD_DCtx const* dctx)
++{
++    size_t const blockSizeMax = dctx->isFrameDecompression ? dctx->fParams.blockSizeMax : ZSTD_BLOCKSIZE_MAX;
++    assert(blockSizeMax <= ZSTD_BLOCKSIZE_MAX);
++    return blockSizeMax;
++}
++
+ /*! ZSTD_getcBlockSize() :
+  *  Provides the size of compressed block from block header `src` */
+ size_t ZSTD_getcBlockSize(const void* src, size_t srcSize,
+@@ -73,41 +80,49 @@ size_t ZSTD_getcBlockSize(const void* src, size_t srcSize,
+ static void ZSTD_allocateLiteralsBuffer(ZSTD_DCtx* dctx, void* const dst, const size_t dstCapacity, const size_t litSize,
+     const streaming_operation streaming, const size_t expectedWriteSize, const unsigned splitImmediately)
+ {
+-    if (streaming == not_streaming && dstCapacity > ZSTD_BLOCKSIZE_MAX + WILDCOPY_OVERLENGTH + litSize + WILDCOPY_OVERLENGTH)
+-    {
+-        /* room for litbuffer to fit without read faulting */
+-        dctx->litBuffer = (BYTE*)dst + ZSTD_BLOCKSIZE_MAX + WILDCOPY_OVERLENGTH;
++    size_t const blockSizeMax = ZSTD_blockSizeMax(dctx);
++    assert(litSize <= blockSizeMax);
++    assert(dctx->isFrameDecompression || streaming == not_streaming);
++    assert(expectedWriteSize <= blockSizeMax);
++    if (streaming == not_streaming && dstCapacity > blockSizeMax + WILDCOPY_OVERLENGTH + litSize + WILDCOPY_OVERLENGTH) {
++        /* If we aren't streaming, we can just put the literals after the output
++         * of the current block. We don't need to worry about overwriting the
++         * extDict of our window, because it doesn't exist.
++         * So if we have space after the end of the block, just put it there.
++         */
++        dctx->litBuffer = (BYTE*)dst + blockSizeMax + WILDCOPY_OVERLENGTH;
+         dctx->litBufferEnd = dctx->litBuffer + litSize;
+         dctx->litBufferLocation = ZSTD_in_dst;
+-    }
+-    else if (litSize > ZSTD_LITBUFFEREXTRASIZE)
+-    {
+-        /* won't fit in litExtraBuffer, so it will be split between end of dst and extra buffer */
++    } else if (litSize <= ZSTD_LITBUFFEREXTRASIZE) {
++        /* Literals fit entirely within the extra buffer, put them there to avoid
++         * having to split the literals.
++         */
++        dctx->litBuffer = dctx->litExtraBuffer;
++        dctx->litBufferEnd = dctx->litBuffer + litSize;
++        dctx->litBufferLocation = ZSTD_not_in_dst;
++    } else {
++        assert(blockSizeMax > ZSTD_LITBUFFEREXTRASIZE);
++        /* Literals must be split between the output block and the extra lit
++         * buffer. We fill the extra lit buffer with the tail of the literals,
++         * and put the rest of the literals at the end of the block, with
++         * WILDCOPY_OVERLENGTH of buffer room to allow for overreads.
++         * This MUST not write more than our maxBlockSize beyond dst, because in
++         * streaming mode, that could overwrite part of our extDict window.
++         */
+         if (splitImmediately) {
+             /* won't fit in litExtraBuffer, so it will be split between end of dst and extra buffer */
+             dctx->litBuffer = (BYTE*)dst + expectedWriteSize - litSize + ZSTD_LITBUFFEREXTRASIZE - WILDCOPY_OVERLENGTH;
+             dctx->litBufferEnd = dctx->litBuffer + litSize - ZSTD_LITBUFFEREXTRASIZE;
+-        }
+-        else {
++        } else {
+             /* initially this will be stored entirely in dst during huffman decoding, it will partially be shifted to litExtraBuffer after */
+             dctx->litBuffer = (BYTE*)dst + expectedWriteSize - litSize;
+             dctx->litBufferEnd = (BYTE*)dst + expectedWriteSize;
+         }
+         dctx->litBufferLocation = ZSTD_split;
+-    }
+-    else
+-    {
+-        /* fits entirely within litExtraBuffer, so no split is necessary */
+-        dctx->litBuffer = dctx->litExtraBuffer;
+-        dctx->litBufferEnd = dctx->litBuffer + litSize;
+-        dctx->litBufferLocation = ZSTD_not_in_dst;
++        assert(dctx->litBufferEnd <= (BYTE*)dst + expectedWriteSize);
+     }
+ }
+ 
+-/* Hidden declaration for fullbench */
+-size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+-                          const void* src, size_t srcSize,
+-                          void* dst, size_t dstCapacity, const streaming_operation streaming);
+ /*! ZSTD_decodeLiteralsBlock() :
+  * Where it is possible to do so without being stomped by the output during decompression, the literals block will be stored
+  * in the dstBuffer.  If there is room to do so, it will be stored in full in the excess dst space after where the current
+@@ -116,7 +131,7 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+  *
+  * @return : nb of bytes read from src (< srcSize )
+  *  note : symbol not declared but exposed for fullbench */
+-size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
++static size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+                           const void* src, size_t srcSize,   /* note : srcSize < BLOCKSIZE */
+                           void* dst, size_t dstCapacity, const streaming_operation streaming)
+ {
+@@ -125,6 +140,7 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+ 
+     {   const BYTE* const istart = (const BYTE*) src;
+         symbolEncodingType_e const litEncType = (symbolEncodingType_e)(istart[0] & 3);
++        size_t const blockSizeMax = ZSTD_blockSizeMax(dctx);
+ 
+         switch(litEncType)
+         {
+@@ -140,7 +156,7 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+                 U32 const lhlCode = (istart[0] >> 2) & 3;
+                 U32 const lhc = MEM_readLE32(istart);
+                 size_t hufSuccess;
+-                size_t expectedWriteSize = MIN(ZSTD_BLOCKSIZE_MAX, dstCapacity);
++                size_t expectedWriteSize = MIN(blockSizeMax, dstCapacity);
+                 int const flags = 0
+                     | (ZSTD_DCtx_get_bmi2(dctx) ? HUF_flags_bmi2 : 0)
+                     | (dctx->disableHufAsm ? HUF_flags_disableAsm : 0);
+@@ -167,7 +183,7 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+                     break;
+                 }
+                 RETURN_ERROR_IF(litSize > 0 && dst == NULL, dstSize_tooSmall, "NULL not handled");
+-                RETURN_ERROR_IF(litSize > ZSTD_BLOCKSIZE_MAX, corruption_detected, "");
++                RETURN_ERROR_IF(litSize > blockSizeMax, corruption_detected, "");
+                 if (!singleStream)
+                     RETURN_ERROR_IF(litSize < MIN_LITERALS_FOR_4_STREAMS, literals_headerWrong,
+                         "Not enough literals (%zu) for the 4-streams mode (min %u)",
+@@ -214,10 +230,12 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+                 }
+                 if (dctx->litBufferLocation == ZSTD_split)
+                 {
++                    assert(litSize > ZSTD_LITBUFFEREXTRASIZE);
+                     ZSTD_memcpy(dctx->litExtraBuffer, dctx->litBufferEnd - ZSTD_LITBUFFEREXTRASIZE, ZSTD_LITBUFFEREXTRASIZE);
+                     ZSTD_memmove(dctx->litBuffer + ZSTD_LITBUFFEREXTRASIZE - WILDCOPY_OVERLENGTH, dctx->litBuffer, litSize - ZSTD_LITBUFFEREXTRASIZE);
+                     dctx->litBuffer += ZSTD_LITBUFFEREXTRASIZE - WILDCOPY_OVERLENGTH;
+                     dctx->litBufferEnd -= WILDCOPY_OVERLENGTH;
++                    assert(dctx->litBufferEnd <= (BYTE*)dst + blockSizeMax);
+                 }
+ 
+                 RETURN_ERROR_IF(HUF_isError(hufSuccess), corruption_detected, "");
+@@ -232,7 +250,7 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+         case set_basic:
+             {   size_t litSize, lhSize;
+                 U32 const lhlCode = ((istart[0]) >> 2) & 3;
+-                size_t expectedWriteSize = MIN(ZSTD_BLOCKSIZE_MAX, dstCapacity);
++                size_t expectedWriteSize = MIN(blockSizeMax, dstCapacity);
+                 switch(lhlCode)
+                 {
+                 case 0: case 2: default:   /* note : default is impossible, since lhlCode into [0..3] */
+@@ -251,6 +269,7 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+                 }
+ 
+                 RETURN_ERROR_IF(litSize > 0 && dst == NULL, dstSize_tooSmall, "NULL not handled");
++                RETURN_ERROR_IF(litSize > blockSizeMax, corruption_detected, "");
+                 RETURN_ERROR_IF(expectedWriteSize < litSize, dstSize_tooSmall, "");
+                 ZSTD_allocateLiteralsBuffer(dctx, dst, dstCapacity, litSize, streaming, expectedWriteSize, 1);
+                 if (lhSize+litSize+WILDCOPY_OVERLENGTH > srcSize) {  /* risk reading beyond src buffer with wildcopy */
+@@ -279,7 +298,7 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+         case set_rle:
+             {   U32 const lhlCode = ((istart[0]) >> 2) & 3;
+                 size_t litSize, lhSize;
+-                size_t expectedWriteSize = MIN(ZSTD_BLOCKSIZE_MAX, dstCapacity);
++                size_t expectedWriteSize = MIN(blockSizeMax, dstCapacity);
+                 switch(lhlCode)
+                 {
+                 case 0: case 2: default:   /* note : default is impossible, since lhlCode into [0..3] */
+@@ -298,7 +317,7 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+                     break;
+                 }
+                 RETURN_ERROR_IF(litSize > 0 && dst == NULL, dstSize_tooSmall, "NULL not handled");
+-                RETURN_ERROR_IF(litSize > ZSTD_BLOCKSIZE_MAX, corruption_detected, "");
++                RETURN_ERROR_IF(litSize > blockSizeMax, corruption_detected, "");
+                 RETURN_ERROR_IF(expectedWriteSize < litSize, dstSize_tooSmall, "");
+                 ZSTD_allocateLiteralsBuffer(dctx, dst, dstCapacity, litSize, streaming, expectedWriteSize, 1);
+                 if (dctx->litBufferLocation == ZSTD_split)
+@@ -320,6 +339,18 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+     }
+ }
+ 
++/* Hidden declaration for fullbench */
++size_t ZSTD_decodeLiteralsBlock_wrapper(ZSTD_DCtx* dctx,
++                          const void* src, size_t srcSize,
++                          void* dst, size_t dstCapacity);
++size_t ZSTD_decodeLiteralsBlock_wrapper(ZSTD_DCtx* dctx,
++                          const void* src, size_t srcSize,
++                          void* dst, size_t dstCapacity)
++{
++    dctx->isFrameDecompression = 0;
++    return ZSTD_decodeLiteralsBlock(dctx, src, srcSize, dst, dstCapacity, not_streaming);
++}
++
+ /* Default FSE distribution tables.
+  * These are pre-calculated FSE decoding tables using default distributions as defined in specification :
+  * https://github.com/facebook/zstd/blob/release/doc/zstd_compression_format.md#default-distributions
+@@ -1320,22 +1351,24 @@ MEM_STATIC void ZSTD_assertValidSequence(
+         BYTE const* prefixStart, BYTE const* virtualStart)
+ {
+ #if DEBUGLEVEL >= 1
+-    size_t const windowSize = dctx->fParams.windowSize;
+-    size_t const sequenceSize = seq.litLength + seq.matchLength;
+-    BYTE const* const oLitEnd = op + seq.litLength;
+-    DEBUGLOG(6, "Checking sequence: litL=%u matchL=%u offset=%u",
+-            (U32)seq.litLength, (U32)seq.matchLength, (U32)seq.offset);
+-    assert(op <= oend);
+-    assert((size_t)(oend - op) >= sequenceSize);
+-    assert(sequenceSize <= ZSTD_BLOCKSIZE_MAX);
+-    if (ZSTD_dictionaryIsActive(dctx, prefixStart, oLitEnd)) {
+-        size_t const dictSize = (size_t)((char const*)dctx->dictContentEndForFuzzing - (char const*)dctx->dictContentBeginForFuzzing);
+-        /* Offset must be within the dictionary. */
+-        assert(seq.offset <= (size_t)(oLitEnd - virtualStart));
+-        assert(seq.offset <= windowSize + dictSize);
+-    } else {
+-        /* Offset must be within our window. */
+-        assert(seq.offset <= windowSize);
++    if (dctx->isFrameDecompression) {
++        size_t const windowSize = dctx->fParams.windowSize;
++        size_t const sequenceSize = seq.litLength + seq.matchLength;
++        BYTE const* const oLitEnd = op + seq.litLength;
++        DEBUGLOG(6, "Checking sequence: litL=%u matchL=%u offset=%u",
++                (U32)seq.litLength, (U32)seq.matchLength, (U32)seq.offset);
++        assert(op <= oend);
++        assert((size_t)(oend - op) >= sequenceSize);
++        assert(sequenceSize <= ZSTD_blockSizeMax(dctx));
++        if (ZSTD_dictionaryIsActive(dctx, prefixStart, oLitEnd)) {
++            size_t const dictSize = (size_t)((char const*)dctx->dictContentEndForFuzzing - (char const*)dctx->dictContentBeginForFuzzing);
++            /* Offset must be within the dictionary. */
++            assert(seq.offset <= (size_t)(oLitEnd - virtualStart));
++            assert(seq.offset <= windowSize + dictSize);
++        } else {
++            /* Offset must be within our window. */
++            assert(seq.offset <= windowSize);
++        }
+     }
+ #else
+     (void)dctx, (void)op, (void)oend, (void)seq, (void)prefixStart, (void)virtualStart;
+@@ -1351,8 +1384,7 @@ DONT_VECTORIZE
+ ZSTD_decompressSequences_bodySplitLitBuffer( ZSTD_DCtx* dctx,
+                                void* dst, size_t maxDstSize,
+                          const void* seqStart, size_t seqSize, int nbSeq,
+-                         const ZSTD_longOffset_e isLongOffset,
+-                         const int frame)
++                         const ZSTD_longOffset_e isLongOffset)
+ {
+     const BYTE* ip = (const BYTE*)seqStart;
+     const BYTE* const iend = ip + seqSize;
+@@ -1365,7 +1397,6 @@ ZSTD_decompressSequences_bodySplitLitBuffer( ZSTD_DCtx* dctx,
+     const BYTE* const vBase = (const BYTE*) (dctx->virtualStart);
+     const BYTE* const dictEnd = (const BYTE*) (dctx->dictEnd);
+     DEBUGLOG(5, "ZSTD_decompressSequences_bodySplitLitBuffer");
+-    (void)frame;
+ 
+     /* Regen sequences */
+     if (nbSeq) {
+@@ -1453,7 +1484,7 @@ ZSTD_decompressSequences_bodySplitLitBuffer( ZSTD_DCtx* dctx,
+                 size_t const oneSeqSize = ZSTD_execSequenceSplitLitBuffer(op, oend, litPtr + sequence.litLength - WILDCOPY_OVERLENGTH, sequence, &litPtr, litBufferEnd, prefixStart, vBase, dictEnd);
+ #if defined(FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION) && defined(FUZZING_ASSERT_VALID_SEQUENCE)
+                 assert(!ZSTD_isError(oneSeqSize));
+-                if (frame) ZSTD_assertValidSequence(dctx, op, oend, sequence, prefixStart, vBase);
++                ZSTD_assertValidSequence(dctx, op, oend, sequence, prefixStart, vBase);
+ #endif
+                 if (UNLIKELY(ZSTD_isError(oneSeqSize)))
+                     return oneSeqSize;
+@@ -1482,7 +1513,7 @@ ZSTD_decompressSequences_bodySplitLitBuffer( ZSTD_DCtx* dctx,
+                     size_t const oneSeqSize = ZSTD_execSequence(op, oend, sequence, &litPtr, litBufferEnd, prefixStart, vBase, dictEnd);
+ #if defined(FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION) && defined(FUZZING_ASSERT_VALID_SEQUENCE)
+                     assert(!ZSTD_isError(oneSeqSize));
+-                    if (frame) ZSTD_assertValidSequence(dctx, op, oend, sequence, prefixStart, vBase);
++                    ZSTD_assertValidSequence(dctx, op, oend, sequence, prefixStart, vBase);
+ #endif
+                     if (UNLIKELY(ZSTD_isError(oneSeqSize)))
+                         return oneSeqSize;
+@@ -1519,7 +1550,7 @@ ZSTD_decompressSequences_bodySplitLitBuffer( ZSTD_DCtx* dctx,
+                 size_t const oneSeqSize = ZSTD_execSequence(op, oend, sequence, &litPtr, litBufferEnd, prefixStart, vBase, dictEnd);
+ #if defined(FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION) && defined(FUZZING_ASSERT_VALID_SEQUENCE)
+                 assert(!ZSTD_isError(oneSeqSize));
+-                if (frame) ZSTD_assertValidSequence(dctx, op, oend, sequence, prefixStart, vBase);
++                ZSTD_assertValidSequence(dctx, op, oend, sequence, prefixStart, vBase);
+ #endif
+                 if (UNLIKELY(ZSTD_isError(oneSeqSize)))
+                     return oneSeqSize;
+@@ -1568,8 +1599,7 @@ DONT_VECTORIZE
+ ZSTD_decompressSequences_body(ZSTD_DCtx* dctx,
+     void* dst, size_t maxDstSize,
+     const void* seqStart, size_t seqSize, int nbSeq,
+-    const ZSTD_longOffset_e isLongOffset,
+-    const int frame)
++    const ZSTD_longOffset_e isLongOffset)
+ {
+     const BYTE* ip = (const BYTE*)seqStart;
+     const BYTE* const iend = ip + seqSize;
+@@ -1582,7 +1612,6 @@ ZSTD_decompressSequences_body(ZSTD_DCtx* dctx,
+     const BYTE* const vBase = (const BYTE*)(dctx->virtualStart);
+     const BYTE* const dictEnd = (const BYTE*)(dctx->dictEnd);
+     DEBUGLOG(5, "ZSTD_decompressSequences_body: nbSeq = %d", nbSeq);
+-    (void)frame;
+ 
+     /* Regen sequences */
+     if (nbSeq) {
+@@ -1621,7 +1650,7 @@ ZSTD_decompressSequences_body(ZSTD_DCtx* dctx,
+             size_t const oneSeqSize = ZSTD_execSequence(op, oend, sequence, &litPtr, litEnd, prefixStart, vBase, dictEnd);
+ #if defined(FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION) && defined(FUZZING_ASSERT_VALID_SEQUENCE)
+             assert(!ZSTD_isError(oneSeqSize));
+-            if (frame) ZSTD_assertValidSequence(dctx, op, oend, sequence, prefixStart, vBase);
++            ZSTD_assertValidSequence(dctx, op, oend, sequence, prefixStart, vBase);
+ #endif
+             if (UNLIKELY(ZSTD_isError(oneSeqSize)))
+                 return oneSeqSize;
+@@ -1656,20 +1685,18 @@ static size_t
+ ZSTD_decompressSequences_default(ZSTD_DCtx* dctx,
+                                  void* dst, size_t maxDstSize,
+                            const void* seqStart, size_t seqSize, int nbSeq,
+-                           const ZSTD_longOffset_e isLongOffset,
+-                           const int frame)
++                           const ZSTD_longOffset_e isLongOffset)
+ {
+-    return ZSTD_decompressSequences_body(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++    return ZSTD_decompressSequences_body(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+ }
+ 
+ static size_t
+ ZSTD_decompressSequencesSplitLitBuffer_default(ZSTD_DCtx* dctx,
+                                                void* dst, size_t maxDstSize,
+                                          const void* seqStart, size_t seqSize, int nbSeq,
+-                                         const ZSTD_longOffset_e isLongOffset,
+-                                         const int frame)
++                                         const ZSTD_longOffset_e isLongOffset)
+ {
+-    return ZSTD_decompressSequences_bodySplitLitBuffer(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++    return ZSTD_decompressSequences_bodySplitLitBuffer(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+ }
+ #endif /* ZSTD_FORCE_DECOMPRESS_SEQUENCES_LONG */
+ 
+@@ -1697,8 +1724,7 @@ ZSTD_decompressSequencesLong_body(
+                                ZSTD_DCtx* dctx,
+                                void* dst, size_t maxDstSize,
+                          const void* seqStart, size_t seqSize, int nbSeq,
+-                         const ZSTD_longOffset_e isLongOffset,
+-                         const int frame)
++                         const ZSTD_longOffset_e isLongOffset)
+ {
+     const BYTE* ip = (const BYTE*)seqStart;
+     const BYTE* const iend = ip + seqSize;
+@@ -1710,7 +1736,6 @@ ZSTD_decompressSequencesLong_body(
+     const BYTE* const prefixStart = (const BYTE*) (dctx->prefixStart);
+     const BYTE* const dictStart = (const BYTE*) (dctx->virtualStart);
+     const BYTE* const dictEnd = (const BYTE*) (dctx->dictEnd);
+-    (void)frame;
+ 
+     /* Regen sequences */
+     if (nbSeq) {
+@@ -1764,7 +1789,7 @@ ZSTD_decompressSequencesLong_body(
+                 oneSeqSize = ZSTD_execSequence(op, oend, sequences[(seqNb - ADVANCED_SEQS) & STORED_SEQS_MASK], &litPtr, litBufferEnd, prefixStart, dictStart, dictEnd);
+ #if defined(FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION) && defined(FUZZING_ASSERT_VALID_SEQUENCE)
+                 assert(!ZSTD_isError(oneSeqSize));
+-                if (frame) ZSTD_assertValidSequence(dctx, op, oend, sequences[(seqNb - ADVANCED_SEQS) & STORED_SEQS_MASK], prefixStart, dictStart);
++                ZSTD_assertValidSequence(dctx, op, oend, sequences[(seqNb - ADVANCED_SEQS) & STORED_SEQS_MASK], prefixStart, dictStart);
+ #endif
+                 if (ZSTD_isError(oneSeqSize)) return oneSeqSize;
+ 
+@@ -1780,7 +1805,7 @@ ZSTD_decompressSequencesLong_body(
+                     ZSTD_execSequence(op, oend, sequences[(seqNb - ADVANCED_SEQS) & STORED_SEQS_MASK], &litPtr, litBufferEnd, prefixStart, dictStart, dictEnd);
+ #if defined(FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION) && defined(FUZZING_ASSERT_VALID_SEQUENCE)
+                 assert(!ZSTD_isError(oneSeqSize));
+-                if (frame) ZSTD_assertValidSequence(dctx, op, oend, sequences[(seqNb - ADVANCED_SEQS) & STORED_SEQS_MASK], prefixStart, dictStart);
++                ZSTD_assertValidSequence(dctx, op, oend, sequences[(seqNb - ADVANCED_SEQS) & STORED_SEQS_MASK], prefixStart, dictStart);
+ #endif
+                 if (ZSTD_isError(oneSeqSize)) return oneSeqSize;
+ 
+@@ -1812,7 +1837,7 @@ ZSTD_decompressSequencesLong_body(
+                     size_t const oneSeqSize = ZSTD_execSequence(op, oend, *sequence, &litPtr, litBufferEnd, prefixStart, dictStart, dictEnd);
+ #if defined(FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION) && defined(FUZZING_ASSERT_VALID_SEQUENCE)
+                     assert(!ZSTD_isError(oneSeqSize));
+-                    if (frame) ZSTD_assertValidSequence(dctx, op, oend, sequences[seqNb&STORED_SEQS_MASK], prefixStart, dictStart);
++                    ZSTD_assertValidSequence(dctx, op, oend, sequences[seqNb&STORED_SEQS_MASK], prefixStart, dictStart);
+ #endif
+                     if (ZSTD_isError(oneSeqSize)) return oneSeqSize;
+                     op += oneSeqSize;
+@@ -1825,7 +1850,7 @@ ZSTD_decompressSequencesLong_body(
+                     ZSTD_execSequence(op, oend, *sequence, &litPtr, litBufferEnd, prefixStart, dictStart, dictEnd);
+ #if defined(FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION) && defined(FUZZING_ASSERT_VALID_SEQUENCE)
+                 assert(!ZSTD_isError(oneSeqSize));
+-                if (frame) ZSTD_assertValidSequence(dctx, op, oend, sequences[seqNb&STORED_SEQS_MASK], prefixStart, dictStart);
++                ZSTD_assertValidSequence(dctx, op, oend, sequences[seqNb&STORED_SEQS_MASK], prefixStart, dictStart);
+ #endif
+                 if (ZSTD_isError(oneSeqSize)) return oneSeqSize;
+                 op += oneSeqSize;
+@@ -1863,10 +1888,9 @@ static size_t
+ ZSTD_decompressSequencesLong_default(ZSTD_DCtx* dctx,
+                                  void* dst, size_t maxDstSize,
+                            const void* seqStart, size_t seqSize, int nbSeq,
+-                           const ZSTD_longOffset_e isLongOffset,
+-                           const int frame)
++                           const ZSTD_longOffset_e isLongOffset)
+ {
+-    return ZSTD_decompressSequencesLong_body(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++    return ZSTD_decompressSequencesLong_body(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+ }
+ #endif /* ZSTD_FORCE_DECOMPRESS_SEQUENCES_SHORT */
+ 
+@@ -1880,20 +1904,18 @@ DONT_VECTORIZE
+ ZSTD_decompressSequences_bmi2(ZSTD_DCtx* dctx,
+                                  void* dst, size_t maxDstSize,
+                            const void* seqStart, size_t seqSize, int nbSeq,
+-                           const ZSTD_longOffset_e isLongOffset,
+-                           const int frame)
++                           const ZSTD_longOffset_e isLongOffset)
+ {
+-    return ZSTD_decompressSequences_body(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++    return ZSTD_decompressSequences_body(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+ }
+ static BMI2_TARGET_ATTRIBUTE size_t
+ DONT_VECTORIZE
+ ZSTD_decompressSequencesSplitLitBuffer_bmi2(ZSTD_DCtx* dctx,
+                                  void* dst, size_t maxDstSize,
+                            const void* seqStart, size_t seqSize, int nbSeq,
+-                           const ZSTD_longOffset_e isLongOffset,
+-                           const int frame)
++                           const ZSTD_longOffset_e isLongOffset)
+ {
+-    return ZSTD_decompressSequences_bodySplitLitBuffer(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++    return ZSTD_decompressSequences_bodySplitLitBuffer(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+ }
+ #endif /* ZSTD_FORCE_DECOMPRESS_SEQUENCES_LONG */
+ 
+@@ -1902,10 +1924,9 @@ static BMI2_TARGET_ATTRIBUTE size_t
+ ZSTD_decompressSequencesLong_bmi2(ZSTD_DCtx* dctx,
+                                  void* dst, size_t maxDstSize,
+                            const void* seqStart, size_t seqSize, int nbSeq,
+-                           const ZSTD_longOffset_e isLongOffset,
+-                           const int frame)
++                           const ZSTD_longOffset_e isLongOffset)
+ {
+-    return ZSTD_decompressSequencesLong_body(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++    return ZSTD_decompressSequencesLong_body(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+ }
+ #endif /* ZSTD_FORCE_DECOMPRESS_SEQUENCES_SHORT */
+ 
+@@ -1915,37 +1936,34 @@ typedef size_t (*ZSTD_decompressSequences_t)(
+                             ZSTD_DCtx* dctx,
+                             void* dst, size_t maxDstSize,
+                             const void* seqStart, size_t seqSize, int nbSeq,
+-                            const ZSTD_longOffset_e isLongOffset,
+-                            const int frame);
++                            const ZSTD_longOffset_e isLongOffset);
+ 
+ #ifndef ZSTD_FORCE_DECOMPRESS_SEQUENCES_LONG
+ static size_t
+ ZSTD_decompressSequences(ZSTD_DCtx* dctx, void* dst, size_t maxDstSize,
+                    const void* seqStart, size_t seqSize, int nbSeq,
+-                   const ZSTD_longOffset_e isLongOffset,
+-                   const int frame)
++                   const ZSTD_longOffset_e isLongOffset)
+ {
+     DEBUGLOG(5, "ZSTD_decompressSequences");
+ #if DYNAMIC_BMI2
+     if (ZSTD_DCtx_get_bmi2(dctx)) {
+-        return ZSTD_decompressSequences_bmi2(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++        return ZSTD_decompressSequences_bmi2(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+     }
+ #endif
+-    return ZSTD_decompressSequences_default(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++    return ZSTD_decompressSequences_default(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+ }
+ static size_t
+ ZSTD_decompressSequencesSplitLitBuffer(ZSTD_DCtx* dctx, void* dst, size_t maxDstSize,
+                                  const void* seqStart, size_t seqSize, int nbSeq,
+-                                 const ZSTD_longOffset_e isLongOffset,
+-                                 const int frame)
++                                 const ZSTD_longOffset_e isLongOffset)
+ {
+     DEBUGLOG(5, "ZSTD_decompressSequencesSplitLitBuffer");
+ #if DYNAMIC_BMI2
+     if (ZSTD_DCtx_get_bmi2(dctx)) {
+-        return ZSTD_decompressSequencesSplitLitBuffer_bmi2(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++        return ZSTD_decompressSequencesSplitLitBuffer_bmi2(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+     }
+ #endif
+-    return ZSTD_decompressSequencesSplitLitBuffer_default(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++    return ZSTD_decompressSequencesSplitLitBuffer_default(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+ }
+ #endif /* ZSTD_FORCE_DECOMPRESS_SEQUENCES_LONG */
+ 
+@@ -1960,16 +1978,15 @@ static size_t
+ ZSTD_decompressSequencesLong(ZSTD_DCtx* dctx,
+                              void* dst, size_t maxDstSize,
+                              const void* seqStart, size_t seqSize, int nbSeq,
+-                             const ZSTD_longOffset_e isLongOffset,
+-                             const int frame)
++                             const ZSTD_longOffset_e isLongOffset)
+ {
+     DEBUGLOG(5, "ZSTD_decompressSequencesLong");
+ #if DYNAMIC_BMI2
+     if (ZSTD_DCtx_get_bmi2(dctx)) {
+-        return ZSTD_decompressSequencesLong_bmi2(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++        return ZSTD_decompressSequencesLong_bmi2(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+     }
+ #endif
+-  return ZSTD_decompressSequencesLong_default(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset, frame);
++  return ZSTD_decompressSequencesLong_default(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
+ }
+ #endif /* ZSTD_FORCE_DECOMPRESS_SEQUENCES_SHORT */
+ 
+@@ -2051,20 +2068,20 @@ static size_t ZSTD_maxShortOffset(void)
+ size_t
+ ZSTD_decompressBlock_internal(ZSTD_DCtx* dctx,
+                               void* dst, size_t dstCapacity,
+-                        const void* src, size_t srcSize, const int frame, const streaming_operation streaming)
++                        const void* src, size_t srcSize, const streaming_operation streaming)
+ {   /* blockType == blockCompressed */
+     const BYTE* ip = (const BYTE*)src;
+     DEBUGLOG(5, "ZSTD_decompressBlock_internal (size : %u)", (U32)srcSize);
+ 
+     /* Note : the wording of the specification
+-     * allows compressed block to be sized exactly ZSTD_BLOCKSIZE_MAX.
++     * allows compressed block to be sized exactly ZSTD_blockSizeMax(dctx).
+      * This generally does not happen, as it makes little sense,
+      * since an uncompressed block would feature same size and have no decompression cost.
+      * Also, note that decoder from reference libzstd before < v1.5.4
+      * would consider this edge case as an error.
+-     * As a consequence, avoid generating compressed blocks of size ZSTD_BLOCKSIZE_MAX
++     * As a consequence, avoid generating compressed blocks of size ZSTD_blockSizeMax(dctx)
+      * for broader compatibility with the deployed ecosystem of zstd decoders */
+-    RETURN_ERROR_IF(srcSize > ZSTD_BLOCKSIZE_MAX, srcSize_wrong, "");
++    RETURN_ERROR_IF(srcSize > ZSTD_blockSizeMax(dctx), srcSize_wrong, "");
+ 
+     /* Decode literals section */
+     {   size_t const litCSize = ZSTD_decodeLiteralsBlock(dctx, src, srcSize, dst, dstCapacity, streaming);
+@@ -2079,7 +2096,7 @@ ZSTD_decompressBlock_internal(ZSTD_DCtx* dctx,
+         /* Compute the maximum block size, which must also work when !frame and fParams are unset.
+          * Additionally, take the min with dstCapacity to ensure that the totalHistorySize fits in a size_t.
+          */
+-        size_t const blockSizeMax = MIN(dstCapacity, (frame ? dctx->fParams.blockSizeMax : ZSTD_BLOCKSIZE_MAX));
++        size_t const blockSizeMax = MIN(dstCapacity, ZSTD_blockSizeMax(dctx));
+         size_t const totalHistorySize = ZSTD_totalHistorySize((BYTE*)dst + blockSizeMax, (BYTE const*)dctx->virtualStart);
+         /* isLongOffset must be true if there are long offsets.
+          * Offsets are long if they are larger than ZSTD_maxShortOffset().
+@@ -2145,16 +2162,16 @@ ZSTD_decompressBlock_internal(ZSTD_DCtx* dctx,
+         {
+ #endif
+ #ifndef ZSTD_FORCE_DECOMPRESS_SEQUENCES_SHORT
+-            return ZSTD_decompressSequencesLong(dctx, dst, dstCapacity, ip, srcSize, nbSeq, isLongOffset, frame);
++            return ZSTD_decompressSequencesLong(dctx, dst, dstCapacity, ip, srcSize, nbSeq, isLongOffset);
+ #endif
+         }
+ 
+ #ifndef ZSTD_FORCE_DECOMPRESS_SEQUENCES_LONG
+         /* else */
+         if (dctx->litBufferLocation == ZSTD_split)
+-            return ZSTD_decompressSequencesSplitLitBuffer(dctx, dst, dstCapacity, ip, srcSize, nbSeq, isLongOffset, frame);
++            return ZSTD_decompressSequencesSplitLitBuffer(dctx, dst, dstCapacity, ip, srcSize, nbSeq, isLongOffset);
+         else
+-            return ZSTD_decompressSequences(dctx, dst, dstCapacity, ip, srcSize, nbSeq, isLongOffset, frame);
++            return ZSTD_decompressSequences(dctx, dst, dstCapacity, ip, srcSize, nbSeq, isLongOffset);
+ #endif
+     }
+ }
+@@ -2176,8 +2193,9 @@ size_t ZSTD_decompressBlock_deprecated(ZSTD_DCtx* dctx,
+                                  const void* src, size_t srcSize)
+ {
+     size_t dSize;
++    dctx->isFrameDecompression = 0;
+     ZSTD_checkContinuity(dctx, dst, dstCapacity);
+-    dSize = ZSTD_decompressBlock_internal(dctx, dst, dstCapacity, src, srcSize, /* frame */ 0, not_streaming);
++    dSize = ZSTD_decompressBlock_internal(dctx, dst, dstCapacity, src, srcSize, not_streaming);
+     dctx->previousDstEnd = (char*)dst + dSize;
+     return dSize;
+ }
+diff --git a/lib/decompress/zstd_decompress_block.h b/lib/decompress/zstd_decompress_block.h
+index 9d1318882..ab152404b 100644
+--- a/lib/decompress/zstd_decompress_block.h
++++ b/lib/decompress/zstd_decompress_block.h
+@@ -47,7 +47,7 @@ typedef enum {
+  */
+ size_t ZSTD_decompressBlock_internal(ZSTD_DCtx* dctx,
+                                void* dst, size_t dstCapacity,
+-                         const void* src, size_t srcSize, const int frame, const streaming_operation streaming);
++                         const void* src, size_t srcSize, const streaming_operation streaming);
+ 
+ /* ZSTD_buildFSETable() :
+  * generate FSE decoding table for one symbol (ll, ml or off)
+diff --git a/lib/decompress/zstd_decompress_internal.h b/lib/decompress/zstd_decompress_internal.h
+index c2ec5d9fb..25aaebe50 100644
+--- a/lib/decompress/zstd_decompress_internal.h
++++ b/lib/decompress/zstd_decompress_internal.h
+@@ -153,6 +153,7 @@ struct ZSTD_DCtx_s
+     size_t litSize;
+     size_t rleSize;
+     size_t staticSize;
++    int isFrameDecompression;
+ #if DYNAMIC_BMI2 != 0
+     int bmi2;                     /* == 1 if the CPU supports BMI2 and 0 otherwise. CPU support is determined dynamically once per context lifetime. */
+ #endif
+diff --git a/tests/fullbench.c b/tests/fullbench.c
+index 41bd26d04..0391107b9 100644
+--- a/tests/fullbench.c
++++ b/tests/fullbench.c
+@@ -141,15 +141,14 @@ static size_t local_ZSTD_decompress(const void* src, size_t srcSize,
+ static ZSTD_DCtx* g_zdc = NULL;
+ 
+ #ifndef ZSTD_DLL_IMPORT
+-typedef enum {
+-    not_streaming = 0,
+-    is_streaming = 1
+-} streaming_operation;
+-extern size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* ctx, const void* src, size_t srcSize, void* dst, size_t dstCapacity, const streaming_operation streaming);
++
++extern size_t ZSTD_decodeLiteralsBlock_wrapper(ZSTD_DCtx* dctx,
++                          const void* src, size_t srcSize,
++                          void* dst, size_t dstCapacity);
+ static size_t local_ZSTD_decodeLiteralsBlock(const void* src, size_t srcSize, void* dst, size_t dstSize, void* buff2)
+ {
+     (void)src; (void)srcSize; (void)dst; (void)dstSize;
+-    return ZSTD_decodeLiteralsBlock(g_zdc, buff2, g_cSize, dst, dstSize, not_streaming);
++    return ZSTD_decodeLiteralsBlock_wrapper(g_zdc, buff2, g_cSize, dst, dstSize);
+ }
+ 
+ static size_t local_ZSTD_decodeSeqHeaders(const void* src, size_t srcSize, void* dst, size_t dstSize, void* buff2)
+@@ -606,7 +605,7 @@ static int benchMem(unsigned benchNb,
+             ip += ZSTD_blockHeaderSize;    /* skip block header */
+             ZSTD_decompressBegin(g_zdc);
+             CONTROL(iend > ip);
+-            ip += ZSTD_decodeLiteralsBlock(g_zdc, ip, (size_t)(iend-ip), dstBuff, dstBuffSize, not_streaming);   /* skip literal segment */
++            ip += ZSTD_decodeLiteralsBlock_wrapper(g_zdc, ip, (size_t)(iend-ip), dstBuff, dstBuffSize);   /* skip literal segment */
+             g_cSize = (size_t)(iend-ip);
+             memcpy(dstBuff2, ip, g_cSize);   /* copy rest of block (it starts by SeqHeader) */
+             srcSize = srcSize > 128 KB ? 128 KB : srcSize;   /* speed relative to block */
diff --git a/meta/recipes-extended/zstd/zstd/CVE-2026-124851.patch b/meta/recipes-extended/zstd/zstd/CVE-2026-124851.patch
new file mode 100644
index 00000000000..c4a4083d0c6
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/CVE-2026-124851.patch
@@ -0,0 +1,98 @@
+From 0c9d297531a9f15a717ff24604afc0843b3b1427 Mon Sep 17 00:00:00 2001
+From: Nick Terrell <terrelln@fb.com>
+Date: Fri, 6 Nov 2026 08:53:26 -0800
+Subject: [PATCH] decompress: prevent stale literal leaks after output buffer
+ wraps
+
+After the streaming output buffer wraps, the external dictionary and
+current prefix must share the frame history window. Retaining expired
+history can allow malformed offsets to expose uninitialized bytes or
+literals from earlier decompressions on the same context.
+
+Once a full window has been decoded, limit external history to the
+portion not occupied by the current prefix. Apply this bound before
+subsequent blocks even when output remains contiguous. Also zero the
+wildcopy padding after decoder-owned literals, including both parts of a
+split literal buffer, so permitted over-reads only see initialized bytes.
+
+CVE: CVE-2026-124851
+Upstream-Status: Backport [https://github.com/meta/zstd/commit/0c9d297531a9f15a717ff24604afc0843b3b1427]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/decompress/zstd_decompress_block.c | 35 ++++++++++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+
+diff --git a/lib/decompress/zstd_decompress_block.c b/lib/decompress/zstd_decompress_block.c
+index 7b02e9658..6c7ef11cc 100644
+--- a/lib/decompress/zstd_decompress_block.c
++++ b/lib/decompress/zstd_decompress_block.c
+@@ -123,6 +123,25 @@ static void ZSTD_allocateLiteralsBuffer(ZSTD_DCtx* dctx, void* const dst, const
+     }
+ }
+ 
++/**
++ * Zeros the bytes directly after the decompressed literals so that over-reads
++ * only read zeros, rather than potentially uninitialized memory, or bytes from
++ * prior decompressions.
++ */
++static void ZSTD_zeroLiteralsBufferPadding(ZSTD_DCtx* dctx, size_t litSize)
++{
++    if (dctx->litBufferLocation == ZSTD_split) {
++        BYTE* const litBufferEnd = dctx->litBuffer + litSize - ZSTD_LITBUFFEREXTRASIZE;
++        assert(litBufferEnd == dctx->litBufferEnd);
++        ZSTD_memset(litBufferEnd, 0, WILDCOPY_OVERLENGTH);
++        ZSTD_memset(dctx->litExtraBuffer + ZSTD_LITBUFFEREXTRASIZE, 0, WILDCOPY_OVERLENGTH);
++    } else {
++        BYTE* const litBufferEnd = dctx->litBuffer + litSize;
++        assert(litBufferEnd == dctx->litBufferEnd);
++        ZSTD_memset(litBufferEnd, 0, WILDCOPY_OVERLENGTH);
++    }
++}
++
+ /*! ZSTD_decodeLiteralsBlock() :
+  * Where it is possible to do so without being stomped by the output during decompression, the literals block will be stored
+  * in the dstBuffer.  If there is room to do so, it will be stored in full in the excess dst space after where the current
+@@ -240,6 +259,7 @@ static size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+ 
+                 RETURN_ERROR_IF(HUF_isError(hufSuccess), corruption_detected, "");
+ 
++                ZSTD_zeroLiteralsBufferPadding(dctx, litSize);
+                 dctx->litPtr = dctx->litBuffer;
+                 dctx->litSize = litSize;
+                 dctx->litEntropy = 1;
+@@ -283,6 +303,7 @@ static size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+                     {
+                         ZSTD_memcpy(dctx->litBuffer, istart + lhSize, litSize);
+                     }
++                    ZSTD_zeroLiteralsBufferPadding(dctx, litSize);
+                     dctx->litPtr = dctx->litBuffer;
+                     dctx->litSize = litSize;
+                     return lhSize+litSize;
+@@ -329,6 +350,7 @@ static size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx* dctx,
+                 {
+                     ZSTD_memset(dctx->litBuffer, istart[lhSize], litSize);
+                 }
++                ZSTD_zeroLiteralsBufferPadding(dctx, litSize);
+                 dctx->litPtr = dctx->litBuffer;
+                 dctx->litSize = litSize;
+                 return lhSize+1;
+@@ -2185,6 +2207,19 @@ void ZSTD_checkContinuity(ZSTD_DCtx* dctx, const void* dst, size_t dstSize)
+         dctx->prefixStart = dst;
+         dctx->previousDstEnd = dst;
+     }
++    /* The external dictionary and current prefix share the frame window.
++     * As the prefix grows after a wrap, retaining a full external window
++     * could let corrupt offsets alias the destination and expose stale literals.
++     * decodedSize > 0 ensures the frame header has initialized windowSize.
++     * Only kicks in after decoding windowSize bytes because the entire dictionary is
++     * valid as long as a single byte of the dictionary is in the window.
++     */
++    if (dstSize > 0 && dctx->isFrameDecompression && dctx->decodedSize > 0 && dctx->decodedSize >= dctx->fParams.windowSize) {
++        size_t const prefixSize = (size_t)((const char*)dctx->previousDstEnd - (const char*)dctx->prefixStart);
++        size_t const extDictSize = (size_t)((const char*)dctx->prefixStart - (const char*)dctx->virtualStart);
++        U64 const maxExtDictSize = prefixSize < dctx->fParams.windowSize ? dctx->fParams.windowSize - prefixSize : 0;
++        dctx->virtualStart = (const char*)dctx->prefixStart - (size_t)MIN((U64)extDictSize, maxExtDictSize);
++    }
+ }
+ 
+ 
diff --git a/meta/recipes-extended/zstd/zstd_1.5.5.bb b/meta/recipes-extended/zstd/zstd_1.5.5.bb
index 2d72af50a43..b41c0d6962f 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.5.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.5.bb
@@ -11,7 +11,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
                     "
 
 SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https \
-           file://0001-pzstd-use-directly-for-the-test-c-snippet.patch"
+           file://0001-pzstd-use-directly-for-the-test-c-snippet.patch \
+           file://0001-Reduce-streaming-decompression-memory-by-128KB.patch \
+           file://CVE-2026-124851.patch \
+"
 
 SRCREV = "63779c798237346c2b245c546c40b72a5a5913fe"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
