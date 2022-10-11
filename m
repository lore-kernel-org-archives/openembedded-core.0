Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAF6C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 21:42:23 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.13346.1665524534342324856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 14:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=BsGuGd8W;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id 13so34238608ejn.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGMX+SFVADWZLqdTBYu2pdtdcjgKy0M6IfiRjQxInhc=;
        b=BsGuGd8WqIo47K30eFw8T4SMqV7YfA0hreIbheSSjqE6EdyoTvqUbnm5xo6G+e6SuH
         stJ4wdLsABFbG0JgBKQBYkGN+S5hlB7BEwUfQp2HHb7WlcL2HV9lN0GmiyjChgkHDVkW
         n7W93kUSxq30fBQtr3GV4Ab2aEuXacmYiYfBSkHOi/+1LBT/6hGdo3a0/C6z5fdmvYCk
         j+4+Yh7rJWV4QYpLGHDgvJfPbJYOQ4vgYfWUIUSn1a5U+tP+Lqq2+UkTxmlRlRJx2nXF
         08RrAYTSKiMPRmwxMyvolShUlqm9xSVJEteiUVjOMavLbzaZW/HZ0LatsqD0gajBCnlQ
         72Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGMX+SFVADWZLqdTBYu2pdtdcjgKy0M6IfiRjQxInhc=;
        b=pD5WV5N4nTYa1v1LLZbyXN9678CQYOKAeoBlT9dLVr3yNgrCdWVo+lbx+NN96A3M7E
         nmBLwbtaXF0+rrOg0mQseBiYM5bOsAG97CUMW5g+lfswL9EKtOO6I9/Pd3YYN7XwSFnc
         Ot6wAZQ9OfWltq5nq7WsdTq74Jf3xZCoPWHLkNm+EGAv6y6OIvlBEFt/ly1VNYglLrcs
         Iy/FlvGONZSkD1wZMkMcmYxpRdj9usxlcTZYkvzPIfdzQmdtuEQbxmAd1w1Cz4LfI0sh
         fb/QOcxPXRt1KHiuv7WxVB3FLL6TI7h25cmAmK1mxzkK7up3I8O21iRdZ4eY1GnOMFWG
         mFmQ==
X-Gm-Message-State: ACrzQf0R8gXqaB4AVDi+1v7DWuzarYzyRgccHm1l4LeOttWoaR0wl2jZ
	SRzGpneReMIo8oYfzQB5bYZ4QIDPzSyr/v9o9+eSAzCwAixqiA==
X-Google-Smtp-Source: AMsMyM6BWgr0qrabVR6bjs0u3Me1jRgeDzGGuYd97dA2I5steoku5E+v7Y7eHk0GM8TR9H8nT1sRz+ykz/GiP68CT3w=
X-Received: by 2002:a17:906:58d6:b0:783:a081:7a20 with SMTP id
 e22-20020a17090658d600b00783a0817a20mr20226788ejs.357.1665524532536; Tue, 11
 Oct 2022 14:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221011162720.42877-1-vkumbhar@mvista.com>
In-Reply-To: <20221011162720.42877-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 11 Oct 2022 11:42:01 -1000
Message-ID: <CAOSpxdZwJfVKG7piD9J3PMkNuyyKzK3QT_8PXfqRe=GOFrL=3A@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] qemu: fix CVE-2021-3638
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 21:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171641

On Tue, Oct 11, 2022 at 6:27 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> Source: https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html
> MR: 116345
> Type: Security Fix
> Disposition: Backport from https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html
> ChangeID: 16be2d24b89b9ff8f492b034f77eb24800771910
> Description:
>     When building QEMU with DEBUG_ATI defined then running with
>     '-device ati-vga,romfile="" -d unimp,guest_errors -trace ati\*'
>     we get:
>
>       ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
>       ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
>       ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
>       ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
>       ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
>       ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
>       ati_mm_write 4 0x1420 DST_Y <- 0x3fff
>       ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
>       ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
>       ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 bpp:32
>     rop:0xff
>       ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
>       ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:16383,
>     y:16383, w:16383, h:16383, xor:0xff000000)
>       Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
>       (gdb) bt
>       #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1.so.0
>       #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
>       #2  0x0000555557b5a9af in ati_2d_blt (s=0x631000028800) at
>     hw/display/ati_2d.c:196
>       #3  0x0000555557b4b5a2 in ati_mm_write (opaque=0x631000028800, addr=5512,
>     data=1073692671, size=4) at hw/display/ati.c:843
>       #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=0x631000039cc0,
>     addr=5512, ..., size=4, ...) at softmmu/memory.c:492
>
>     Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
>     the local dst_x and dst_y which adjust the (x, y) coordinates
>     depending on the direction in the SRCCOPY ROP3 operation, but
>     forgot to address the same issue for the PATCOPY, BLACKNESS and
>     WHITENESS operations, which also call pixman_fill().
>
>     Fix that now by using the adjusted coordinates in the pixman_fill
>     call, and update the related debug printf().
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/0001-CVE-2021-3638.patch        | 42 +++++++++++++++++++

Same issue with the filename as in previous patches.

>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 7a963ad57c..b9ac4c663c 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -52,6 +52,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>            file://CVE-2019-20175.patch \
>            file://CVE-2020-24352.patch \
>            file://CVE-2020-25723.patch \
> +          file://0001-CVE-2021-3638.patch \

And once again the patch doesn't apply since you aren't using current
dunfell head.

Please rebase and send a V2

Thanks,

Steve

>            "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch
> new file mode 100644
> index 0000000000..965ac3f181
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch
> @@ -0,0 +1,42 @@
> +From 1faf9c708c95b92678b7babb56f7ed861e3eda11 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Thu, 1 Sep 2022 10:22:44 +0530
> +Subject: [PATCH] CVE-2021-3638
> +
> +Upstream-Status: https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html
> +CVE: CVE-2021-3638
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + hw/display/ati_2d.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
> +index 23a8ae0c..395b523b 100644
> +--- a/hw/display/ati_2d.c
> ++++ b/hw/display/ati_2d.c
> +@@ -83,7 +83,7 @@ void ati_2d_blt(ATIVGAState *s)
> +     DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d %c %c\n",
> +             s->regs.src_offset, s->regs.dst_offset, s->regs.default_offset,
> +             s->regs.src_pitch, s->regs.dst_pitch, s->regs.default_pitch,
> +-            s->regs.src_x, s->regs.src_y, s->regs.dst_x, s->regs.dst_y,
> ++            s->regs.src_x, s->regs.src_y, dst_x, dst_y,
> +             s->regs.dst_width, s->regs.dst_height,
> +             (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ? '>' : '<'),
> +             (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ? 'v' : '^'));
> +@@ -178,11 +178,11 @@ void ati_2d_blt(ATIVGAState *s)
> +         dst_stride /= sizeof(uint32_t);
> +         DPRINTF("pixman_fill(%p, %d, %d, %d, %d, %d, %d, %x)\n",
> +                 dst_bits, dst_stride, bpp,
> +-                s->regs.dst_x, s->regs.dst_y,
> ++                dst_x, dst_y,
> +                 s->regs.dst_width, s->regs.dst_height,
> +                 filler);
> +         pixman_fill((uint32_t *)dst_bits, dst_stride, bpp,
> +-                    s->regs.dst_x, s->regs.dst_y,
> ++                    dst_x, dst_y,
> +                     s->regs.dst_width, s->regs.dst_height,
> +                     filler);
> +         if (dst_bits >= s->vga.vram_ptr + s->vga.vbe_start_addr &&
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171633): https://lists.openembedded.org/g/openembedded-core/message/171633
> Mute This Topic: https://lists.openembedded.org/mt/94262751/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

