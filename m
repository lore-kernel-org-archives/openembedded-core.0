Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5652.1795866763166422135
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 03:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=juRMabUK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261128115241185138815d000207a2-icw7qa@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261128115241185138815d000207a2
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Nov 2026 12:52:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QHaOycqUpoCTyJkzywMFnaUnUOp/DvaIXm8euUefYTg=;
 b=juRMabUKy763jeADBxO4eNB0Y0SnAWaFQ/L0neKMnvkNoiCha/Mc6iIZ6g+eyID3vGggFM
 2rpZJU3wG2XLO3K8dGJ/kOxcyG1oK9aFukbutQCGqGqoErwXx9MgNLPOevlx6zgGLTauE18K
 yH3f/6gUsL0d/gvcS3D7+P+2PqGoKNYoWIyheUwTKK9YleH2zblJuj2en/GFVgKnAY2cBWGL
 LD1clbm5QwzeYXn7U80crmeWoNc1d9zM5TcaHWqwRhTzZSkLPE4rqMo5Hhj+bKg2vGZi7C9t
 kG5HVFC81RbOzB1MR1TtJwMLZDCnIcaiZG6ydvGJMZXTbbVj5wVkKZ8Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] zstd: patch CVE-2026-124851
Date: Sat, 28 Nov 2026 12:52:02 +0100
Message-ID: <20261128115202.3079330-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 11:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251487
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per https://security-tracker.debian.org/tracker/CVE-2026-124851

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../zstd/zstd/CVE-2026-124851.patch           | 98 +++++++++++++++++++
 meta/recipes-extended/zstd/zstd_1.5.7.bb      |  5 +-
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/zstd/zstd/CVE-2026-124851.patch

diff --git a/meta/recipes-extended/zstd/zstd/CVE-2026-124851.patch b/meta/recipes-extended/zstd/zstd/CVE-2026-124851.patch
new file mode 100644
index 00000000000..23d9c99d540
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
+@@ -2183,6 +2205,19 @@ void ZSTD_checkContinuity(ZSTD_DCtx* dctx, const void* dst, size_t dstSize)
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
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extended/zstd/zstd_1.5.7.bb
index 0e872b95aaf..86030f8acae 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -10,7 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0 \
                     "
 
-SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https"
+SRC_URI = " \
+    git://github.com/facebook/zstd.git;branch=release;protocol=https \
+    file://CVE-2026-124851.patch \
+"
 
 SRCREV = "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
