Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3FEC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 12:14:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.164856.1673871246975382764
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 04:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bTu24g9z;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so2363037wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 04:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JGQGrvTenlQI7gvdKegl87U2j9++4/1onEZ/kfYGfZw=;
        b=bTu24g9zksB4hUkCHCz3PQUEZ9LZQvhSY7TzlFDl936OO8F7OalfYCZWfUa1Dky7Gi
         H7F1TXMx6NvgwG1Hmz8t9ChG7BoeqFkgYWypZyhjoho9Jku7fd7FOwgrRXC5PkUjxmtS
         LL9yCijY7Zd27hW+vUj/i+swZN78bvaVRRR6f8rjQ88RYIQgNalL3n9xwzd5llNB/JlN
         yj1VE2vGFl3fS6Abuotnbb2zuZOnbClACVHAEpST8kDaPO/bOddyAs2xGs5Ijp6/gP/j
         7Ak8ObXz4CFaXUgLJBVjEiem2h5rGIfO+DwhwETpx8eC1qG1gWU6iBkfT2r3DNQC841U
         ZASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGQGrvTenlQI7gvdKegl87U2j9++4/1onEZ/kfYGfZw=;
        b=5NEyuihxDuwuQEkcYKRJerukDtKRVKbpKYH0S2M+VrGnSITRa8BBFPZ0Fd0ErpG+Zb
         0fREFCd/RPwd7owsk6ts3RxbDmOHDNO+AzExXMGnrqEBsEUQ1IPjs1XBP0WQP1mVVeA7
         LLm6b+t00tiXRZj2LaecoU/yBhzxTkvzux7s/DaFiEPuuqkZCwHbMjPasEn/o2FN0F6R
         ZSkzA96fI33W6OggGaHQ6mXPthmM//XeTvQ+tRi7smCOIFcwpfuyHFII7wSCLWCnctmj
         eACog9Qok9ZXCLgW1OMyh5A1wDDne1q15rDfUX/mi2R2fMqsxvmunMHLjEf5ge+It76i
         bXIg==
X-Gm-Message-State: AFqh2krhpw1lg53pQkOYA/fkQh/RFwiLpU5ht1oPeNSuWzsrgBVI//YH
	DV05YXW+SJYkku79VrWi9i8RcSXoPJw=
X-Google-Smtp-Source: AMrXdXt+GJR1PTFCnb9jLaZ3iFiSK+KZ1igaApxI08QF8l7/WmcQTvI6ims6yygN7pbHrQi4sU3y/A==
X-Received: by 2002:a05:600c:a15:b0:3da:10e6:b79c with SMTP id z21-20020a05600c0a1500b003da10e6b79cmr7962427wmp.24.1673871245382;
        Mon, 16 Jan 2023 04:14:05 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b003b4ff30e566sm11138108wms.3.2023.01.16.04.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 04:14:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	narpat.mali@windriver.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH][kirkstone] ffmpeg: refresh patches to apply cleanly
Date: Mon, 16 Jan 2023 13:14:01 +0100
Message-Id: <20230116121401.1086657-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 12:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175979

* the last patch added in:
  https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=874b72fe259cd3a23f4613fccfe2e9cc3f79cd6a
  doesn't apply cleanly.

* fixes:
  ERROR: ffmpeg-5.0.1-r0 do_patch: Fuzz detected:

  Applying patch 0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
  patching file libavcodec/vp3.c
  Hunk #1 succeeded at 2677 with fuzz 1 (offset -2 lines).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...c-stop-accessing-out-of-bounds-frame.patch | 19 ++++++++-----------
 ...c-stop-accessing-out-of-bounds-frame.patch |  7 ++-----
 ...-vp3-Add-missing-check-for-av_malloc.patch | 12 +++++-------
 3 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
index 2775a81cc8..23573bb6b3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
@@ -1,4 +1,4 @@
-From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 2001
+From ce25c03fb83395c0a8b5b8121182a486c4408dd4 Mon Sep 17 00:00:00 2001
 From: Paul B Mahol <onemda@gmail.com>
 Date: Sat, 12 Nov 2022 16:12:00 +0100
 Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
@@ -12,10 +12,10 @@ Signed-off-by: <narpat.mali@windriver.com>
  1 file changed, 15 insertions(+), 7 deletions(-)
 
 diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c
-index d710eb4f82..4ced9523e2 100644
+index 337b1fa..3e97c87 100644
 --- a/libavcodec/rpzaenc.c
 +++ b/libavcodec/rpzaenc.c
-@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInfo *bi, const uint16_t *block_pt
+@@ -205,7 +205,7 @@ static void get_max_component_diff(BlockInfo *bi, uint16_t *block_ptr,
  
      // loop thru and compare pixels
      for (y = 0; y < bi->block_height; y++) {
@@ -24,7 +24,7 @@ index d710eb4f82..4ced9523e2 100644
              // TODO:  optimize
              min_r = FFMIN(R(block_ptr[x]), min_r);
              min_g = FFMIN(G(block_ptr[x]), min_g);
-@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr, const BlockInfo *bi,
+@@ -277,7 +277,7 @@ static int leastsquares(uint16_t *block_ptr, BlockInfo *bi,
          return -1;
  
      for (i = 0; i < bi->block_height; i++) {
@@ -33,7 +33,7 @@ index d710eb4f82..4ced9523e2 100644
              x = GET_CHAN(block_ptr[j], xchannel);
              y = GET_CHAN(block_ptr[j], ychannel);
              sumx += x;
-@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t *block_ptr, const BlockInfo *bi
+@@ -324,7 +324,7 @@ static int calc_lsq_max_fit_error(uint16_t *block_ptr, BlockInfo *bi,
      int max_err = 0;
  
      for (i = 0; i < bi->block_height; i++) {
@@ -42,7 +42,7 @@ index d710eb4f82..4ced9523e2 100644
              int x_inc, lin_y, lin_x;
              x = GET_CHAN(block_ptr[j], xchannel);
              y = GET_CHAN(block_ptr[j], ychannel);
-@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint16_t *src_pixels,
+@@ -419,7 +419,9 @@ static void update_block_in_prev_frame(const uint16_t *src_pixels,
                                         uint16_t *dest_pixels,
                                         const BlockInfo *bi, int block_counter)
  {
@@ -53,7 +53,7 @@ index d710eb4f82..4ced9523e2 100644
          memcpy(dest_pixels, src_pixels, 8);
          dest_pixels += bi->rowstride;
          src_pixels += bi->rowstride;
-@@ -730,14 +732,15 @@ post_skip :
+@@ -729,14 +731,15 @@ post_skip :
  
              if (err > s->sixteen_color_thresh) { // DO SIXTEEN COLOR BLOCK
                  uint16_t *row_ptr;
@@ -72,7 +72,7 @@ index d710eb4f82..4ced9523e2 100644
                          rgb555 = row_ptr[x] & ~0x8000;
  
                          put_bits(&s->pb, 16, rgb555);
-@@ -745,6 +748,11 @@ post_skip :
+@@ -744,6 +747,11 @@ post_skip :
                      row_ptr += bi.rowstride;
                  }
  
@@ -84,6 +84,3 @@ index d710eb4f82..4ced9523e2 100644
                  block_counter++;
              } else { // FOUR COLOR BLOCK
                  block_counter += encode_four_color_block(min_color, max_color,
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
index 923fc6a9c1..6e237fdd52 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
@@ -1,4 +1,4 @@
-From 13c13109759090b7f7182480d075e13b36ed8edd Mon Sep 17 00:00:00 2001
+From d2f31887df2c42948dba7446c475026fdbc69336 Mon Sep 17 00:00:00 2001
 From: Paul B Mahol <onemda@gmail.com>
 Date: Sat, 12 Nov 2022 15:19:21 +0100
 Subject: [PATCH] avcodec/smcenc: stop accessing out of bounds frame
@@ -12,7 +12,7 @@ Signed-off-by: <narpat.mali@windriver.com>
  1 file changed, 14 insertions(+), 4 deletions(-)
 
 diff --git a/libavcodec/smcenc.c b/libavcodec/smcenc.c
-index f3d26a4e8d..33549b8ab4 100644
+index 52795ef..618dc4e 100644
 --- a/libavcodec/smcenc.c
 +++ b/libavcodec/smcenc.c
 @@ -61,6 +61,7 @@ typedef struct SMCContext {
@@ -103,6 +103,3 @@ index f3d26a4e8d..33549b8ab4 100644
  
          blocks = coded_blocks;
          distinct = coded_distinct;
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
index 94858a6cdd..dca7c827e3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
@@ -1,4 +1,4 @@
-From 656cb0450aeb73b25d7d26980af342b37ac4c568 Mon Sep 17 00:00:00 2001
+From ef748a8bd8720416b673e1743e5673a801e8279f Mon Sep 17 00:00:00 2001
 From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
 Date: Tue, 15 Feb 2022 17:58:08 +0800
 Subject: [PATCH] avcodec/vp3: Add missing check for av_malloc
@@ -16,16 +16,17 @@ CVE: CVE-2022-3109
 Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568]
 
 Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+
 ---
  libavcodec/vp3.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
-index e9ab54d736..e2418eb6fa 100644
+index 5b9ba60..f1eccfe 100644
 --- a/libavcodec/vp3.c
 +++ b/libavcodec/vp3.c
-@@ -2679,8 +2679,13 @@ static int vp3_decode_frame(AVCodecContext *avctx,
-                                         AV_GET_BUFFER_FLAG_REF)) < 0)
+@@ -2677,8 +2677,13 @@ static int vp3_decode_frame(AVCodecContext *avctx,
+     if ((ret = ff_thread_get_buffer(avctx, &s->current_frame, AV_GET_BUFFER_FLAG_REF)) < 0)
          goto error;
  
 -    if (!s->edge_emu_buffer)
@@ -39,6 +40,3 @@ index e9ab54d736..e2418eb6fa 100644
  
      if (s->keyframe) {
          if (!s->theora) {
--- 
-2.34.1
-
-- 
2.39.0


