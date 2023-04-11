Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9D1C77B6F
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 15:16:02 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.17135.1681226154033478168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 08:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=OcuVsDXh;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id r27so10921828lfe.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681226152; x=1683818152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4Woqr5dsP+yYGUMa8BwKunK5Qz4jcBf1UTd6B5OSmI=;
        b=OcuVsDXh9gX66FblP4pkDJjLaj28e0rladwoBmaEyXGFIJsUMyiJQ/4vVyHNFQJImU
         gquEKC52UaEulJ5yBQMTVO2X+TjeeRFzE8PUXssMH/loOPh0GltcsU8nfQAp2sgzWBK2
         dw7lFkzW1px41m2xdumy+4GheInHG6b99JC6XkWVTZK6O4PxJPfcFfl168OmgfuFYIwh
         5/QDx5xAec8ZBN5S9j8ML/Zvj++spkgfQZZrYQr0UyuTHHCOEqZ2j7DR+aOt5geRyx6Z
         yiiSrQYhHYj4z8bKhLJFfR10fqfM298WYyNdZzqm7qC8TBG2q2t1qIfUm+o33ba7Myf9
         6KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681226152; x=1683818152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4Woqr5dsP+yYGUMa8BwKunK5Qz4jcBf1UTd6B5OSmI=;
        b=rQ1MPVMYZ8410UrKywEJbOGBFsZD9Tpe65Wf73/JktDRr7ayiM1M+UKgHNrRG3Nqrv
         L2DX1oxQfqwRTeCsT+7hw/EYmx4tBoP+VIvtZRMqRs+N0PHOM4hiyQZyRAamZgI2GfI2
         aewRMomshwpqtEKuYibRugi8ssvV0NWjoBWxo8XoU1480YPQNYMRZAwh4z11/TgEQgKI
         3Dd3Ig7Mp7PkRs+FsBA4t55Klv4OV0o0SjoQdt6cIjl4exaIYa28eZ6QCA9dlnRze5wT
         2LXLZO9J1xP3XbxX8NdO1FECvgA6KWHDVVjg4M9c2l8HfBf9sL2qiEUUHeRPkTxeFmiq
         +ESA==
X-Gm-Message-State: AAQBX9dGZWFNKAag0druTwii/3H1A5vC7Hw6P6vFDbjKkLkQ5/AgXa9V
	PN2k25p34zNgagXt6VQzWlnJpO3/R+ksOARaMwg=
X-Google-Smtp-Source: AKy350Y2FoV4XQ+zAf24mdo4R1yNy1POe4Zd7YqcWIiLj4lhK6YONNb/UtJBcRmtVxRixioEQAfsHmCnfSACc7k+TCc=
X-Received: by 2002:ac2:5df0:0:b0:4eb:3f68:5540 with SMTP id
 z16-20020ac25df0000000b004eb3f685540mr4000897lfq.11.1681226152132; Tue, 11
 Apr 2023 08:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230331052636.978578-1-alex@linutronix.de> <CAMKF1sonrntA3pKS3M=2U9VCNtM9acmGywy7DFnbHMKfokFVdw@mail.gmail.com>
In-Reply-To: <CAMKF1sonrntA3pKS3M=2U9VCNtM9acmGywy7DFnbHMKfokFVdw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Apr 2023 17:15:40 +0200
Message-ID: <CANNYZj_H1UufkQ6+bbEqQ=KLkS=Gkv6wj1fQH7wPGjnqJcy1zQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] ffmpeg: update 5.1.2 -> 6.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 15:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179930

This has been resolved by your 0.34.1 -> 0.35.1 update.

Alex

On Sat, 1 Apr 2023 at 20:57, Khem Raj <raj.khem@gmail.com> wrote:
>
> I think mpv is failing to this upgrade, this issue talks about it
> https://github.com/mpv-player/mpv/issues/9803
> https://errors.yoctoproject.org/Errors/Details/699341/
> This is a arm64/musl build.
>
> On Thu, Mar 30, 2023 at 10:26=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Add a patch to gstreamer1.0-libav to address an API compatibility fail.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...c-stop-accessing-out-of-bounds-frame.patch |  89 ---------------
> >  ...c-stop-accessing-out-of-bounds-frame.patch | 108 ------------------
> >  .../ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch     |  34 ------
> >  .../ffmpeg/{ffmpeg_5.1.2.bb =3D> ffmpeg_6.0.bb} |   8 +-
> >  .../gstreamer1.0-libav/ffmpeg-6.0.patch       |  49 ++++++++
> >  .../gstreamer/gstreamer1.0-libav_1.22.0.bb    |   4 +-
> >  6 files changed, 54 insertions(+), 238 deletions(-)
> >  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-=
rpzaenc-stop-accessing-out-of-bounds-frame.patch
> >  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-=
smcenc-stop-accessing-out-of-bounds-frame.patch
> >  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vu=
lkan.patch
> >  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.1.2.bb =3D> ffmpeg_6.0=
.bb} (95%)
> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-liba=
v/ffmpeg-6.0.patch
> >
> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc=
-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/=
ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
> > deleted file mode 100644
> > index 2775a81cc86..00000000000
> > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-a=
ccessing-out-of-bounds-frame.patch
> > +++ /dev/null
> > @@ -1,89 +0,0 @@
> > -From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 2001
> > -From: Paul B Mahol <onemda@gmail.com>
> > -Date: Sat, 12 Nov 2022 16:12:00 +0100
> > -Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
> > -
> > -Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f=
9b28ed84a77138105475beba16c146bdaf984]
> > -
> > -Signed-off-by: <narpat.mali@windriver.com>
> > -
> > ----
> > - libavcodec/rpzaenc.c | 22 +++++++++++++++-------
> > - 1 file changed, 15 insertions(+), 7 deletions(-)
> > -
> > -diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c
> > -index d710eb4f82..4ced9523e2 100644
> > ---- a/libavcodec/rpzaenc.c
> > -+++ b/libavcodec/rpzaenc.c
> > -@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInfo=
 *bi, const uint16_t *block_pt
> > -
> > -     // loop thru and compare pixels
> > -     for (y =3D 0; y < bi->block_height; y++) {
> > --        for (x =3D 0; x < bi->block_width; x++){
> > -+        for (x =3D 0; x < bi->block_width; x++) {
> > -             // TODO:  optimize
> > -             min_r =3D FFMIN(R(block_ptr[x]), min_r);
> > -             min_g =3D FFMIN(G(block_ptr[x]), min_g);
> > -@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr,=
 const BlockInfo *bi,
> > -         return -1;
> > -
> > -     for (i =3D 0; i < bi->block_height; i++) {
> > --        for (j =3D 0; j < bi->block_width; j++){
> > -+        for (j =3D 0; j < bi->block_width; j++) {
> > -             x =3D GET_CHAN(block_ptr[j], xchannel);
> > -             y =3D GET_CHAN(block_ptr[j], ychannel);
> > -             sumx +=3D x;
> > -@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t *=
block_ptr, const BlockInfo *bi
> > -     int max_err =3D 0;
> > -
> > -     for (i =3D 0; i < bi->block_height; i++) {
> > --        for (j =3D 0; j < bi->block_width; j++){
> > -+        for (j =3D 0; j < bi->block_width; j++) {
> > -             int x_inc, lin_y, lin_x;
> > -             x =3D GET_CHAN(block_ptr[j], xchannel);
> > -             y =3D GET_CHAN(block_ptr[j], ychannel);
> > -@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint1=
6_t *src_pixels,
> > -                                        uint16_t *dest_pixels,
> > -                                        const BlockInfo *bi, int block=
_counter)
> > - {
> > --    for (int y =3D 0; y < 4; y++) {
> > -+    const int y_size =3D FFMIN(4, bi->image_height - bi->row * 4);
> > -+
> > -+    for (int y =3D 0; y < y_size; y++) {
> > -         memcpy(dest_pixels, src_pixels, 8);
> > -         dest_pixels +=3D bi->rowstride;
> > -         src_pixels +=3D bi->rowstride;
> > -@@ -730,14 +732,15 @@ post_skip :
> > -
> > -             if (err > s->sixteen_color_thresh) { // DO SIXTEEN COLOR =
BLOCK
> > -                 uint16_t *row_ptr;
> > --                int rgb555;
> > -+                int y_size, rgb555;
> > -
> > -                 block_offset =3D get_block_info(&bi, block_counter);
> > -
> > -                 row_ptr =3D &src_pixels[block_offset];
> > -+                y_size =3D FFMIN(4, bi.image_height - bi.row * 4);
> > -
> > --                for (int y =3D 0; y < 4; y++) {
> > --                    for (int x =3D 0; x < 4; x++){
> > -+                for (int y =3D 0; y < y_size; y++) {
> > -+                    for (int x =3D 0; x < 4; x++) {
> > -                         rgb555 =3D row_ptr[x] & ~0x8000;
> > -
> > -                         put_bits(&s->pb, 16, rgb555);
> > -@@ -745,6 +748,11 @@ post_skip :
> > -                     row_ptr +=3D bi.rowstride;
> > -                 }
> > -
> > -+                for (int y =3D y_size; y < 4; y++) {
> > -+                    for (int x =3D 0; x < 4; x++)
> > -+                        put_bits(&s->pb, 16, 0);
> > -+                }
> > -+
> > -                 block_counter++;
> > -             } else { // FOUR COLOR BLOCK
> > -                 block_counter +=3D encode_four_color_block(min_color,=
 max_color,
> > ---
> > -2.34.1
> > -
> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-=
stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/f=
fmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
> > deleted file mode 100644
> > index 923fc6a9c1b..00000000000
> > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-ac=
cessing-out-of-bounds-frame.patch
> > +++ /dev/null
> > @@ -1,108 +0,0 @@
> > -From 13c13109759090b7f7182480d075e13b36ed8edd Mon Sep 17 00:00:00 2001
> > -From: Paul B Mahol <onemda@gmail.com>
> > -Date: Sat, 12 Nov 2022 15:19:21 +0100
> > -Subject: [PATCH] avcodec/smcenc: stop accessing out of bounds frame
> > -
> > -Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/13c=
13109759090b7f7182480d075e13b36ed8edd]
> > -
> > -Signed-off-by: <narpat.mali@windriver.com>
> > -
> > ----
> > - libavcodec/smcenc.c | 18 ++++++++++++++----
> > - 1 file changed, 14 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/libavcodec/smcenc.c b/libavcodec/smcenc.c
> > -index f3d26a4e8d..33549b8ab4 100644
> > ---- a/libavcodec/smcenc.c
> > -+++ b/libavcodec/smcenc.c
> > -@@ -61,6 +61,7 @@ typedef struct SMCContext {
> > -         { \
> > -             row_ptr +=3D stride * 4; \
> > -             pixel_ptr =3D row_ptr; \
> > -+            cur_y +=3D 4; \
> > -         } \
> > -     } \
> > - }
> > -@@ -117,6 +118,7 @@ static void smc_encode_stream(SMCContext *s, const=
 AVFrame *frame,
> > -     const uint8_t *prev_pixels =3D (const uint8_t *)s->prev_frame->da=
ta[0];
> > -     uint8_t *distinct_values =3D s->distinct_values;
> > -     const uint8_t *pixel_ptr, *row_ptr;
> > -+    const int height =3D frame->height;
> > -     const int width =3D frame->width;
> > -     uint8_t block_values[16];
> > -     int block_counter =3D 0;
> > -@@ -125,13 +127,14 @@ static void smc_encode_stream(SMCContext *s, con=
st AVFrame *frame,
> > -     int color_octet_index =3D 0;
> > -     int color_table_index;  /* indexes to color pair, quad, or octet =
tables */
> > -     int total_blocks;
> > -+    int cur_y =3D 0;
> > -
> > -     memset(s->color_pairs, 0, sizeof(s->color_pairs));
> > -     memset(s->color_quads, 0, sizeof(s->color_quads));
> > -     memset(s->color_octets, 0, sizeof(s->color_octets));
> > -
> > -     /* Number of 4x4 blocks in frame. */
> > --    total_blocks =3D ((frame->width + 3) / 4) * ((frame->height + 3) =
/ 4);
> > -+    total_blocks =3D ((width + 3) / 4) * ((height + 3) / 4);
> > -
> > -     pixel_ptr =3D row_ptr =3D src_pixels;
> > -
> > -@@ -145,11 +148,13 @@ static void smc_encode_stream(SMCContext *s, con=
st AVFrame *frame,
> > -         int cache_index;
> > -         int distinct =3D 0;
> > -         int blocks =3D 0;
> > -+        int frame_y =3D cur_y;
> > -
> > -         while (prev_pixels && s->key_frame =3D=3D 0 && block_counter =
+ inter_skip_blocks < total_blocks) {
> > -+            const int y_size =3D FFMIN(4, height - cur_y);
> > -             int compare =3D 0;
> > -
> > --            for (int y =3D 0; y < 4; y++) {
> > -+            for (int y =3D 0; y < y_size; y++) {
> > -                 const ptrdiff_t offset =3D pixel_ptr - src_pixels;
> > -                 const uint8_t *prev_pixel_ptr =3D prev_pixels + offse=
t;
> > -
> > -@@ -170,8 +175,10 @@ static void smc_encode_stream(SMCContext *s, cons=
t AVFrame *frame,
> > -
> > -         pixel_ptr =3D xpixel_ptr;
> > -         row_ptr =3D xrow_ptr;
> > -+        cur_y =3D frame_y;
> > -
> > -         while (block_counter > 0 && block_counter + intra_skip_blocks=
 < total_blocks) {
> > -+            const int y_size =3D FFMIN(4, height - cur_y);
> > -             const ptrdiff_t offset =3D pixel_ptr - src_pixels;
> > -             const int sy =3D offset / stride;
> > -             const int sx =3D offset % stride;
> > -@@ -180,7 +187,7 @@ static void smc_encode_stream(SMCContext *s, const=
 AVFrame *frame,
> > -             const uint8_t *old_pixel_ptr =3D src_pixels + nx + ny * s=
tride;
> > -             int compare =3D 0;
> > -
> > --            for (int y =3D 0; y < 4; y++) {
> > -+            for (int y =3D 0; y < y_size; y++) {
> > -                 compare |=3D memcmp(old_pixel_ptr + y * stride, pixel=
_ptr + y * stride, 4);
> > -                 if (compare)
> > -                     break;
> > -@@ -197,9 +204,11 @@ static void smc_encode_stream(SMCContext *s, cons=
t AVFrame *frame,
> > -
> > -         pixel_ptr =3D xpixel_ptr;
> > -         row_ptr =3D xrow_ptr;
> > -+        cur_y =3D frame_y;
> > -
> > -         while (block_counter + coded_blocks < total_blocks && coded_b=
locks < 256) {
> > --            for (int y =3D 0; y < 4; y++)
> > -+            const int y_size =3D FFMIN(4, height - cur_y);
> > -+            for (int y =3D 0; y < y_size; y++)
> > -                 memcpy(block_values + y * 4, pixel_ptr + y * stride, =
4);
> > -
> > -             qsort(block_values, 16, sizeof(block_values[0]), smc_cmp_=
values);
> > -@@ -224,6 +233,7 @@ static void smc_encode_stream(SMCContext *s, const=
 AVFrame *frame,
> > -
> > -         pixel_ptr =3D xpixel_ptr;
> > -         row_ptr =3D xrow_ptr;
> > -+        cur_y =3D frame_y;
> > -
> > -         blocks =3D coded_blocks;
> > -         distinct =3D coded_distinct;
> > ---
> > -2.34.1
> > -
> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.pa=
tch b/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
> > deleted file mode 100644
> > index 95bd608a277..00000000000
> > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -From: Lynne <dev@lynne.ee>
> > -Date: Sun, 25 Dec 2022 00:03:30 +0000 (+0100)
> > -Subject: hwcontext_vulkan: remove optional encode/decode extensions fr=
om the list
> > -X-Git-Url: http://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff_plain/eb=
0455d64690
> > -
> > -hwcontext_vulkan: remove optional encode/decode extensions from the li=
st
> > -
> > -They're not currently used, so they don't need to be there.
> > -Vulkan stabilized the decode extensions less than a week ago, and thei=
r
> > -name prefixes were changed from EXT to KHR. It's a bit too soon to be
> > -depending on it, so rather than bumping, just remove these for now.
> > -
> > -Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/co=
mmitdiff_plain/eb0455d64690]
> > ----
> > -
> > -diff --git a/libavutil/hwcontext_vulkan.c b/libavutil/hwcontext_vulkan=
.c
> > -index f1db1c7291..2a9b5f4aac 100644
> > ---- a/libavutil/hwcontext_vulkan.c
> > -+++ b/libavutil/hwcontext_vulkan.c
> > -@@ -358,14 +358,6 @@ static const VulkanOptExtension optional_device_e=
xts[] =3D {
> > -     { VK_KHR_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME,            FF_VK_E=
XT_EXTERNAL_WIN32_MEMORY  },
> > -     { VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME,         FF_VK_E=
XT_EXTERNAL_WIN32_SEM     },
> > - #endif
> > --
> > --    /* Video encoding/decoding */
> > --    { VK_KHR_VIDEO_QUEUE_EXTENSION_NAME,                      FF_VK_E=
XT_NO_FLAG                },
> > --    { VK_KHR_VIDEO_DECODE_QUEUE_EXTENSION_NAME,               FF_VK_E=
XT_NO_FLAG                },
> > --    { VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME,               FF_VK_E=
XT_NO_FLAG                },
> > --    { VK_EXT_VIDEO_ENCODE_H264_EXTENSION_NAME,                FF_VK_E=
XT_NO_FLAG                },
> > --    { VK_EXT_VIDEO_DECODE_H264_EXTENSION_NAME,                FF_VK_E=
XT_NO_FLAG                },
> > --    { VK_EXT_VIDEO_DECODE_H265_EXTENSION_NAME,                FF_VK_E=
XT_NO_FLAG                },
> > - };
> > -
> > - /* Converts return values to strings */
> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/reci=
pes-multimedia/ffmpeg/ffmpeg_6.0.bb
> > similarity index 95%
> > rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> > rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> > index cccd9f65abf..e4a4a0effa1 100644
> > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> > @@ -22,13 +22,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db23=
4ee4d69f5fce4486a80fdaf4a4263 \
> >                      file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c=
18d1b79df004 \
> >                      file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983=
680233ad02"
> >
> > -SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz \
> > -           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-fr=
ame.patch \
> > -           file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-fra=
me.patch \
> > -           file://ffmpeg-fix-vulkan.patch \
> > -           "
> > +SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz"
> >
> > -SRC_URI[sha256sum] =3D "619e706d662c8420859832ddc259cd4d4096a48a2ce1ee=
fd052db9e440eef3dc"
> > +SRC_URI[sha256sum] =3D "57be87c22d9b49c112b6d24bc67d42508660e6b718b3db=
89c44e47e289137082"
> >
> >  # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D7717
> >  ARM_INSTRUCTION_SET:armv4 =3D "arm"
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpe=
g-6.0.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6=
.0.patch
> > new file mode 100644
> > index 00000000000..0a06540fb47
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0.p=
atch
> > @@ -0,0 +1,49 @@
> > +From cde31d23c071ee93fae96331805f696856084254 Mon Sep 17 00:00:00 2001
> > +From: "U. Artie Eoff" <ullysses.a.eoff@intel.com>
> > +Date: Mon, 13 Feb 2023 17:02:01 -0500
> > +Subject: [PATCH] avviddec: change
> > + AV_CODEC_CAP_AUTO_THREADS->AV_CODEC_CAP_OTHER_THREADS
> > +
> > +This fixes a compile error with recent upstream FFmpeg.
> > +
> > +The AV_CODEC_CAP_AUTO_THREADS was deprecated and renamed to
> > +AV_CODEC_CAP_OTHER_THREADS in FFmpeg upstream commit
> > +7d09579190de (lavc 58.132.100).
> > +
> > +The AV_CODEC_CAP_AUTO_THREADS was finally removed in FFmpeg upstream
> > +commit 10c9a0874cb3 (lavc 59.63.100).
> > +
> > +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_r=
equests/3964>
> > +
> > +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gs=
treamer/-/commit/cde31d23c071ee93fae96331805f696856084254?merge_request_iid=
=3D3964]
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +---
> > + ext/libav/gstavviddec.c | 6 +++++-
> > + 1 file changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
> > +index 43cea456ae8..6d7c4cd0de8 100644
> > +--- a/ext/libav/gstavviddec.c
> > ++++ b/ext/libav/gstavviddec.c
> > +@@ -35,6 +35,10 @@
> > +
> > + GST_DEBUG_CATEGORY_STATIC (GST_CAT_PERFORMANCE);
> > +
> > ++#if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(58,132,100)
> > ++#define AV_CODEC_CAP_OTHER_THREADS AV_CODEC_CAP_AUTO_THREADS
> > ++#endif
> > ++
> > + #define GST_FFMPEG_VIDEO_CODEC_FRAME_FLAG_ALLOCATED (1<<15)
> > +
> > + #define MAX_TS_MASK 0xff
> > +@@ -615,7 +619,7 @@ gst_ffmpegviddec_set_format (GstVideoDecoder * dec=
oder,
> > +   if (ffmpegdec->max_threads =3D=3D 0) {
> > +     /* When thread type is FF_THREAD_FRAME, extra latency is introduc=
ed equal
> > +      * to one frame per thread. We thus need to calculate the thread =
count ourselves */
> > +-    if ((!(oclass->in_plugin->capabilities & AV_CODEC_CAP_AUTO_THREAD=
S)) ||
> > ++    if ((!(oclass->in_plugin->capabilities & AV_CODEC_CAP_OTHER_THREA=
DS)) ||
> > +         (ffmpegdec->context->thread_type & FF_THREAD_FRAME))
> > +       ffmpegdec->context->thread_count =3D
> > +           MIN (gst_ffmpeg_auto_max_threads (), 16);
> > +--
> > +GitLab
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.=
0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
> > index 625a52ea555..d1dce6739dd 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
> > @@ -11,7 +11,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa04=
4cb77e486cc36129f7a770 \
> >                      file://ext/libav/gstav.h;beginline=3D1;endline=3D1=
8;md5=3Da752c35267d8276fd9ca3db6994fca9c \
> >                      "
> >
> > -SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav=
-${PV}.tar.xz"
> > +SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav=
-${PV}.tar.xz \
> > +           file://ffmpeg-6.0.patch \
> > +          "
> >  SRC_URI[sha256sum] =3D "0e48407b4905227a260213dbda84cba3812f0530fc7a75=
b43829102ef82810f1"
> >
> >  S =3D "${WORKDIR}/gst-libav-${PV}"
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179384): https://lists.openembedded.org/g/openembed=
ded-core/message/179384
> > Mute This Topic: https://lists.openembedded.org/mt/97967685/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

