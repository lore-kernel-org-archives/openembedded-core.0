Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC66DF589DB
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 13:45:45 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19954.1776951941513208205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 06:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Nwm75P2K;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso39662395e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776951940; x=1777556740; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBoFiozcgR1L0s4GGRX7QZdczI/qSiJYHBzS6q8R8f4=;
        b=Nwm75P2K+Emg2hHs7HVyHxMj5FP3nh2vh2Pvgm4igiQZ+CFFMQVSFJ2EQgA89k1BHK
         oXYDcymaXxvfz798X8R1doylZW26KTIOK5L6KHB9EXEKxNQGcY0TuoxDupnOHw8DuXUI
         nVyvTDVp1YGxa4nN9CiEBBocU9o0Z3q0ISS+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951940; x=1777556740;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBoFiozcgR1L0s4GGRX7QZdczI/qSiJYHBzS6q8R8f4=;
        b=lgzFg57E08ODr3rpt6A8WDpLPkijlqf5eKY68/flkmYdDLLbjx6WeSt3pv6zC6Pexu
         jaRaowMkQEe8fxNEkP2f8ilWUgzmgHz+EEDavsDqbBjW/U3UkjPW0a8LEakAyg2zJYv8
         5ae1or87kdGDJRDJ2sVC1Ei4eO+xtO0U5OyQNJA+pNwgI7JJqINLrsgNibrwoZH647NK
         Vc6crqSFNqd0MPFxXi0mkWTNVfA3oGBR2Gbqs11vbrRyLy+jCiAT1Hd2rl88UFo/YiFU
         oBqSxB12KbqVMHcqXdmz7LYKvyfAhhgF50M03dgSFVa3vNzizBXq1DdRIDN824ctIgDR
         qf0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9iWxjYDnDQpf4elYc3UVgbEErOYIEIVeqpMxJBQlOhZJDZIZc1K7uwm2MAWWwTpKe1zhW8onrXeUOkpgVwaSS9sA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3PNa1lEiX68NkCUrr1SsUrBdU7fnTXODMYlAhE2QfJW1u6JvQ
	AkHuRX83okoRbAnEy0nKGC/poXzA36xpAHhQjWuOZDnFwWf6p8GMIZ3ca7/XHYxCH5s=
X-Gm-Gg: AeBDietKDjYrFtyJhIvPcwjkwNm/aI2QCc0vFadTibyZSCtAuyhXftyep0lTl7EPxBD
	uz4mvDdosNOCosUCZ59Tq5sNqjQqrCOnPAgPT4rBytinByADs81BEtmFr5ta7W1N8cJ4bssbKdB
	qwr7Sm6yQqRiW6k1HnZeKeTMUSd46XjERUR8Em4FBMJdsq+ml54LGdIGCJLIrRsgYceuL2NhdY2
	iURf+c2y6U07gDujcQ7zG4pLU3fCE2UNFyMsOj24opSW4cTJgtWiilOpUfYmDGXolQmFckz+bd+
	wTm9pIluz81RbeyXZVBvdSlrLHsAA5i7htDUM4Co/HVLrf9tYL0fG2er1OZrDXhJeKWornSPAmh
	rSFGrNrcOjuk+H7Nxwv9Sw4W/GL1Gw1O24cXJs+jQftxnyfYUxdz8M7O5O9wJkgYplSquLdL8/J
	VhAvFgH8aOBJx48zHE7kqL1yPyQwAI4oi8kOd2z1b0Zb6pfFcjnNPMpvQYmiUpNlEF5guku0huF
	dod+lesB7pLZKhYGp9qpCk/Bg==
X-Received: by 2002:a05:600c:19c8:b0:48a:554d:b9a2 with SMTP id 5b1f17b1804b1-48a554dba51mr188156575e9.6.1776951939697;
        Thu, 23 Apr 2026 06:45:39 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c01cfsm546626895e9.10.2026.04.23.06.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 06:45:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 15:45:38 +0200
Message-Id: <DI0KW340PLYT.2HO6B3DWHUUGT@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <ashissh7@cisco.com>
To: <pahaditechie@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] libpng: Fix CVE-2026-33416
X-Mailer: aerc 0.20.0
References: <20260406063250.3479054-1-pahaditechie@gmail.com>
In-Reply-To: <20260406063250.3479054-1-pahaditechie@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 13:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235772

Hello,

Thanks for the patch. A couple of remarks, questions:

On Mon Apr 6, 2026 at 8:32 AM CEST, Ashish Sharma via lists.openembedded.or=
g wrote:
> Backports upstream fix for use-after-free vulnerability in
> png_set_tRNS() where png_ptr->trans_alpha was aliased to
> info_ptr->trans_alpha. If png_free_data() freed the info_ptr buffer,
> png_ptr held a dangling pointer causing UAF in png_do_expand_palette().
>
> Fix gives png_struct its own independent allocation, decoupling
> the two lifetimes.
>
> CVE: CVE-2026-33416
> CVSS: 7.5 (HIGH)
^ Those 2 lines are not needed here (but you can keep themp if you
want).

You need to provide a justification for the CVE patch. What makes you
think this is the right patch for the CVE? Usually a link to the NVD or
the debian security tracker is enough (provided that they mention you
upstream commit).



> Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
> ---


>  .../libpng/files/CVE-2026-33416.patch         | 143 ++++++++++++++++++

In that case, the NVD and Debian Security Tracker mention 4 patches to
fix this CVE:
  NVD Tracker:    https://nvd.nist.gov/vuln/detail/CVE-2026-33416
  Debian Tracker: https://security-tracker.debian.org/tracker/CVE-2026-3341=
6
    Fix URL:      https://github.com/pnggroup/libpng/commit/23019269764e35e=
d8458e517f1897bd3c54820eb
    Fix URL:      https://github.com/pnggroup/libpng/commit/a3a21443ed12bfa=
1ef46fa0d4fb2b74a0fa34a25
    Fix URL:      https://github.com/pnggroup/libpng/commit/7ea9eea884a2328=
cc7fdcb3c0c00246a50d90667
    Fix URL:      https://github.com/pnggroup/libpng/commit/c1b0318b393c906=
79e6fa5bc1d329fd5d5012ec1
... But you only applied one. Why?

Can you send a v2 with those remarks addressed?

Regards,

>  .../libpng/libpng_1.6.42.bb                   |   1 +
>  2 files changed, 144 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416.p=
atch
>
> diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416.patch b/=
meta/recipes-multimedia/libpng/files/CVE-2026-33416.patch
> new file mode 100644
> index 0000000000..c563d977e3
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416.patch
> @@ -0,0 +1,143 @@
> +From 7c1c160358b839bd177d1134acede9891e256027 Mon Sep 17 00:00:00 2001
> +From: Oblivionsage <cookieandcream560@gmail.com>
> +Date: Sun, 15 Mar 2026 10:35:29 +0100
> +Subject: [PATCH] fix: Resolve use-after-free on `png_ptr->trans_alpha`
> +
> +The function `png_set_tRNS` sets `png_ptr->trans_alpha` to point at
> +`info_ptr->trans_alpha` directly, so both structs share the same heap
> +buffer. If the application calls `png_free_data(PNG_FREE_TRNS)`, or if
> +`png_set_tRNS` is called a second time, the buffer is freed through
> +`info_ptr` while `png_ptr` still holds a dangling reference. Any
> +subsequent row read that hits the function `png_do_expand_palette` will
> +dereference freed memory.
> +
> +The fix gives `png_struct` its own allocation instead of aliasing the
> +`info_ptr` pointer. This was already flagged with a TODO in
> +`png_handle_tRNS` ("horrible side effect ... Fix this.") but it was
> +never addressed.
> +
> +Verified with AddressSanitizer. All 34 existing tests pass without
> +regressions.
> +
> +CVE: CVE-2026-33416
> +Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/230=
19269764e35ed8458e517f1897bd3c54820eb]
> +
> +Reviewed-by: Cosmin Truta <ctruta@gmail.com>
> +Signed-off-by: Cosmin Truta <ctruta@gmail.com>
> +(cherry picked from commit 23019269764e35ed8458e517f1897bd3c54820eb)
> +Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
> +---
> + pngread.c  | 11 +++++------
> + pngrutil.c |  4 ----
> + pngset.c   | 31 +++++++++++++++++++------------
> + pngwrite.c |  6 ++++++
> + 4 files changed, 30 insertions(+), 22 deletions(-)
> +
> +diff --git a/pngread.c b/pngread.c
> +index 008a41856..b8a64a6e7 100644
> +--- a/pngread.c
> ++++ b/pngread.c
> +@@ -968,12 +968,11 @@ png_read_destroy(png_structrp png_ptr)
> +=20
> + #if defined(PNG_tRNS_SUPPORTED) || \
> +     defined(PNG_READ_EXPAND_SUPPORTED) || defined(PNG_READ_BACKGROUND_S=
UPPORTED)
> +-   if ((png_ptr->free_me & PNG_FREE_TRNS) !=3D 0)
> +-   {
> +-      png_free(png_ptr, png_ptr->trans_alpha);
> +-      png_ptr->trans_alpha =3D NULL;
> +-   }
> +-   png_ptr->free_me &=3D ~PNG_FREE_TRNS;
> ++   /* png_ptr->trans_alpha is always independently allocated (not alias=
ed
> ++    * with info_ptr->trans_alpha), so free it unconditionally.
> ++    */
> ++   png_free(png_ptr, png_ptr->trans_alpha);
> ++   png_ptr->trans_alpha =3D NULL;
> + #endif
> +=20
> +    inflateEnd(&png_ptr->zstream);
> +diff --git a/pngrutil.c b/pngrutil.c
> +index d31dc21da..2128b2a66 100644
> +--- a/pngrutil.c
> ++++ b/pngrutil.c
> +@@ -1905,10 +1905,6 @@ png_handle_tRNS(png_structrp png_ptr, png_inforp =
info_ptr, png_uint_32 length)
> +       return;
> +    }
> +=20
> +-   /* TODO: this is a horrible side effect in the palette case because =
the
> +-    * png_struct ends up with a pointer to the tRNS buffer owned by the
> +-    * png_info.  Fix this.
> +-    */
> +    png_set_tRNS(png_ptr, info_ptr, readbuf, png_ptr->num_trans,
> +        &(png_ptr->trans_color));
> + }
> +diff --git a/pngset.c b/pngset.c
> +index eb1c8c7a3..3ae16f4e1 100644
> +--- a/pngset.c
> ++++ b/pngset.c
> +@@ -990,28 +990,35 @@ png_set_tRNS(png_structrp png_ptr, png_inforp info=
_ptr,
> +=20
> +    if (trans_alpha !=3D NULL)
> +    {
> +-       /* It may not actually be necessary to set png_ptr->trans_alpha =
here;
> +-        * we do it for backward compatibility with the way the png_hand=
le_tRNS
> +-        * function used to do the allocation.
> +-        *
> +-        * 1.6.0: The above statement is incorrect; png_handle_tRNS effe=
ctively
> +-        * relies on png_set_tRNS storing the information in png_struct
> +-        * (otherwise it won't be there for the code in pngrtran.c).
> +-        */
> +-
> +        png_free_data(png_ptr, info_ptr, PNG_FREE_TRNS, 0);
> +=20
> +        if (num_trans > 0 && num_trans <=3D PNG_MAX_PALETTE_LENGTH)
> +        {
> +-         /* Changed from num_trans to PNG_MAX_PALETTE_LENGTH in version=
 1.2.1 */
> ++          /* Allocate info_ptr's copy of the transparency data. */
> +           info_ptr->trans_alpha =3D png_voidcast(png_bytep,
> +               png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
> +           memcpy(info_ptr->trans_alpha, trans_alpha, (size_t)num_trans)=
;
> +-
> +           info_ptr->free_me |=3D PNG_FREE_TRNS;
> +           info_ptr->valid |=3D PNG_INFO_tRNS;
> ++
> ++          /* Allocate an independent copy for png_struct, so that the
> ++           * lifetime of png_ptr->trans_alpha is decoupled from the
> ++           * lifetime of info_ptr->trans_alpha.  Previously these two
> ++           * pointers were aliased, which caused a use-after-free if
> ++           * png_free_data freed info_ptr->trans_alpha while
> ++           * png_ptr->trans_alpha was still in use by the row transform
> ++           * functions (e.g. png_do_expand_palette).
> ++           */
> ++          png_free(png_ptr, png_ptr->trans_alpha);
> ++          png_ptr->trans_alpha =3D png_voidcast(png_bytep,
> ++              png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
> ++          memcpy(png_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
> ++       }
> ++       else
> ++       {
> ++          png_free(png_ptr, png_ptr->trans_alpha);
> ++          png_ptr->trans_alpha =3D NULL;
> +        }
> +-       png_ptr->trans_alpha =3D info_ptr->trans_alpha;
> +    }
> +=20
> +    if (trans_color !=3D NULL)
> +diff --git a/pngwrite.c b/pngwrite.c
> +index 77e412f43..e4e2973f8 100644
> +--- a/pngwrite.c
> ++++ b/pngwrite.c
> +@@ -977,6 +977,12 @@ png_write_destroy(png_structrp png_ptr)
> +    png_ptr->chunk_list =3D NULL;
> + #endif
> +=20
> ++#if defined(PNG_tRNS_SUPPORTED)
> ++   /* Free the independent copy of trans_alpha owned by png_struct. */
> ++   png_free(png_ptr, png_ptr->trans_alpha);
> ++   png_ptr->trans_alpha =3D NULL;
> ++#endif
> ++
> +    /* The error handling and memory handling information is left intact=
 at this
> +     * point: the jmp_buf may still have to be freed.  See png_destroy_p=
ng_struct
> +     * for how this happens.
> +--=20
> +2.44.4
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recip=
es-multimedia/libpng/libpng_1.6.42.bb
> index 7471315fdd..4d8be5d843 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN=
}${LIBV}/${PV}/${BP}.tar.xz
>             file://CVE-2026-22695.patch \
>             file://CVE-2026-22801.patch \
>             file://CVE-2026-25646.patch \
> +           file://CVE-2026-33416.patch \
>  "
> =20
>  SRC_URI[sha256sum] =3D "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af97=
2bb60057bdb48450"


--=20
Yoann Congal
Smile ECS


