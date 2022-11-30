Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912BDC4332F
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 14:58:54 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.13368.1669820324923962960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 06:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JQBqOvBx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A6D1C000A;
	Wed, 30 Nov 2022 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669820322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s3dr+R+fbQ1ejk0/KSIuD1iJM4H3K3Cux7Cx9Or6xn0=;
	b=JQBqOvBxhMKcfrdmCy6fh3OQhxyHU+yZoyy9GtTwBjapsUc3pjzdgagGsHom4xw9ZRsrsI
	1dgnckaXUqs6lX4Cn6LGF9cUbfSMERC6ZXF/GKoLx0JeVa05S2Z1zoFqyGtNKfXE5M/nlw
	L5G0igxMj64KHbTrEH3wqidaDH/yBuRz/VDIyUuxWuqmygk91So1lvyD+pn7WBE6CoXz6k
	Uxcg2PiAWrgxIOBUA4f7zJb6ZOSPt8SrfUHQcvPPNfOnolfTqtR/VDteL6impGMk4BT4GE
	NSjZjhdI+4Y6kW5gRU//7IcxnocOimuh+d2/Q6yrIGcwi4g8ypgpD+0/c0Aq+g==
Date: Wed, 30 Nov 2022 15:58:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Narpat Mali <narpat.mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
	archana.polampalli@windriver.com, hari.gpillai@windriver.com
Subject: Re: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964
Message-ID: <Y4dvoazSudWqVJQX@mail.local>
References: <20221130140048.595320-1-narpat.mali@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130140048.595320-1-narpat.mali@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 14:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174017

On 30/11/2022 14:00:48+0000, Narpat Mali wrote:
> A vulnerability classified as problematic has been found in ffmpeg. This affects an unknown part of the file
> libavcodec/rpzaenc.c of the component QuickTime RPZA Video Encoder. The manipulation of the argument y_size
> leads to out-of-bounds read. It is possible to initiate the attack remotely. The name of the patch is
> 92f9b28ed84a77138105475beba16c146bdaf984. It is recommended to apply a patch to fix this issue. The associated
> identifier of this vulnerability is VDB-213543.
> 
> CVE: CVE-2022-3964

It doesn't matter anymore as this was already applied but Ross was
mentioning adding this header to the patch that your are adding below:

> 
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2022-3964
> 
> Upstream Fix:
> https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984
> 
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  ...c-stop-accessing-out-of-bounds-frame.patch | 89 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |  4 +-
>  2 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
> 
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
> new file mode 100644
> index 0000000000..2775a81cc8
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
> @@ -0,0 +1,89 @@
> +From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 2001
> +From: Paul B Mahol <onemda@gmail.com>
> +Date: Sat, 12 Nov 2022 16:12:00 +0100
> +Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
> +
> +Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984]

Here

> +
> +Signed-off-by: <narpat.mali@windriver.com>
> +
> +---
> + libavcodec/rpzaenc.c | 22 +++++++++++++++-------
> + 1 file changed, 15 insertions(+), 7 deletions(-)
> +
> +diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c
> +index d710eb4f82..4ced9523e2 100644
> +--- a/libavcodec/rpzaenc.c
> ++++ b/libavcodec/rpzaenc.c
> +@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInfo *bi, const uint16_t *block_pt
> + 
> +     // loop thru and compare pixels
> +     for (y = 0; y < bi->block_height; y++) {
> +-        for (x = 0; x < bi->block_width; x++){
> ++        for (x = 0; x < bi->block_width; x++) {
> +             // TODO:  optimize
> +             min_r = FFMIN(R(block_ptr[x]), min_r);
> +             min_g = FFMIN(G(block_ptr[x]), min_g);
> +@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr, const BlockInfo *bi,
> +         return -1;
> + 
> +     for (i = 0; i < bi->block_height; i++) {
> +-        for (j = 0; j < bi->block_width; j++){
> ++        for (j = 0; j < bi->block_width; j++) {
> +             x = GET_CHAN(block_ptr[j], xchannel);
> +             y = GET_CHAN(block_ptr[j], ychannel);
> +             sumx += x;
> +@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t *block_ptr, const BlockInfo *bi
> +     int max_err = 0;
> + 
> +     for (i = 0; i < bi->block_height; i++) {
> +-        for (j = 0; j < bi->block_width; j++){
> ++        for (j = 0; j < bi->block_width; j++) {
> +             int x_inc, lin_y, lin_x;
> +             x = GET_CHAN(block_ptr[j], xchannel);
> +             y = GET_CHAN(block_ptr[j], ychannel);
> +@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint16_t *src_pixels,
> +                                        uint16_t *dest_pixels,
> +                                        const BlockInfo *bi, int block_counter)
> + {
> +-    for (int y = 0; y < 4; y++) {
> ++    const int y_size = FFMIN(4, bi->image_height - bi->row * 4);
> ++
> ++    for (int y = 0; y < y_size; y++) {
> +         memcpy(dest_pixels, src_pixels, 8);
> +         dest_pixels += bi->rowstride;
> +         src_pixels += bi->rowstride;
> +@@ -730,14 +732,15 @@ post_skip :
> + 
> +             if (err > s->sixteen_color_thresh) { // DO SIXTEEN COLOR BLOCK
> +                 uint16_t *row_ptr;
> +-                int rgb555;
> ++                int y_size, rgb555;
> + 
> +                 block_offset = get_block_info(&bi, block_counter);
> + 
> +                 row_ptr = &src_pixels[block_offset];
> ++                y_size = FFMIN(4, bi.image_height - bi.row * 4);
> + 
> +-                for (int y = 0; y < 4; y++) {
> +-                    for (int x = 0; x < 4; x++){
> ++                for (int y = 0; y < y_size; y++) {
> ++                    for (int x = 0; x < 4; x++) {
> +                         rgb555 = row_ptr[x] & ~0x8000;
> + 
> +                         put_bits(&s->pb, 16, rgb555);
> +@@ -745,6 +748,11 @@ post_skip :
> +                     row_ptr += bi.rowstride;
> +                 }
> + 
> ++                for (int y = y_size; y < 4; y++) {
> ++                    for (int x = 0; x < 4; x++)
> ++                        put_bits(&s->pb, 16, 0);
> ++                }
> ++
> +                 block_counter++;
> +             } else { // FOUR COLOR BLOCK
> +                 block_counter += encode_four_color_block(min_color, max_color,
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> index a0c98d4ae0..43b858984b 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> @@ -22,7 +22,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
>                      file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
>  
> -SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
> +SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
> +           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch"
> +
>  SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
>  
>  # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174008): https://lists.openembedded.org/g/openembedded-core/message/174008
> Mute This Topic: https://lists.openembedded.org/mt/95218376/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

