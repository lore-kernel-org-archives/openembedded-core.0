Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DA6C678D9
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:09:05 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.197084.1673964542315817296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RQvf300d;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so10784566pjg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 06:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zDYOPeUwvFzdNKvrrdrL8W9s9rV9Ue2r39IqTOT82o=;
        b=RQvf300d0TjI7i19i62cdrVwXozB6EQm/pQQyue7HDCEG0wrd2khd8gXX9CrdVxsuF
         7IyWZqumtDIYBETbZ5oecw9ERXpWeFoH7U0WbdelzXH8LI86K/+76atpXs2ns8AuLgjH
         MuvIAhu/Be77DBavs4g4j3xYdnhEMa/5PnTasB9jIDbirCScE6xZHp7aULwyDK6cE6nP
         yXh87WG6e8Rfe9cbgG4JbaBy7BU9sgNGq0HhUqNJcuT+J3OooUq4FtTnvfJrcJm0rV4d
         Uzr9YCRWot1q0c3dm2+K+cgRiEv8mnbXAVWjP9ku9wR8Vc+tr+R84ID1AAh3fM4ZpeBi
         ZXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zDYOPeUwvFzdNKvrrdrL8W9s9rV9Ue2r39IqTOT82o=;
        b=ixlG6vEHSZHQMzdjVSEIjlKKteLQUIaLCCEOPNkEpMsg3Al/tvnB8JJbUhoweyqFKw
         iH/XdbhecA12Sr5+lQocthT8zVoNnmFX7bH8lF9CNtJMscVQTJNPfHOpOMiRQ3yJeC21
         3RJ/PUbOFaJP1qezHx52onNDnMMKklK72CZO0m8+EFSMduPxImY4qPs1G3bAsh53zsgx
         m9kXgYIHANyxF7bbb07AN4JiBi0yh7cPtXWwLonB5L0eBiNlzjX6kAr+a30vH1Udbt/E
         6xapBDFAZuOmhDhNvPHD4ULzTLW0cYQutnIRN8zk1TinoK5BeASFmB5qXrgHkpUBMNsY
         zftA==
X-Gm-Message-State: AFqh2kpazm3rv9oBlb3rj16bx/Dp/LY4tiI3nalAdY5mU1dRUWj+qi2g
	fAg6vI/e8Sx5nsWYwR/M8IBCxS5r8FAFmf4+KvM=
X-Google-Smtp-Source: AMrXdXsozIUaEiLezWl7rMY+ZjiLhxvZNwkvDeIdvJie6fEgdyjZNKK/nxTCnGYIPAmxr2+CNt9K4Q==
X-Received: by 2002:a05:6a20:6b91:b0:ac:21c3:2fb7 with SMTP id bu17-20020a056a206b9100b000ac21c32fb7mr21808772pzb.6.1673964536622;
        Tue, 17 Jan 2023 06:08:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001930b7e2c04sm18197788pli.287.2023.01.17.06.08.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:08:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/9] ffmpeg: refresh patches to apply cleanly
Date: Tue, 17 Jan 2023 04:08:37 -1000
Message-Id: <6060dec1fc9d215f6b2ff9d6571bac802ac6a09b.1673964419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673964419.git.steve@sakoman.com>
References: <cover.1673964419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176041

From: Martin Jansa <martin.jansa@gmail.com>

* the last patch added in:
  https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=874b72fe259cd3a23f4613fccfe2e9cc3f79cd6a
  doesn't apply cleanly.

* fixes:
  ERROR: ffmpeg-5.0.1-r0 do_patch: Fuzz detected:

  Applying patch 0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
  patching file libavcodec/vp3.c
  Hunk #1 succeeded at 2677 with fuzz 1 (offset -2 lines).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


