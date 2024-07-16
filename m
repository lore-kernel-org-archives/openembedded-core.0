Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588A6C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 12:54:30 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.9993.1721134464301335849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 05:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tHljZMyB;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso5697875276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721134463; x=1721739263; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lojy0rKM8jcfJeF8DFtdEG/UxXsXWlTiUNS9u41bB0g=;
        b=tHljZMyBt/frRaw6oyRoCHlqOdarmwF08oioYBRgLXJyeiB82z7yyHuXAOflE8ipsa
         tTduPueLdTVPnFrMQQodV9MEq6qXxb74DRlQtILc3Edvk9Te7OzgukxpRbm54hYileyi
         RkumXAnNNL4iQCB/ZSY7kyl7pR1C9F+1KEydvFND1+YA4L8hHaFrov1Ge9staWPQJ8dI
         Bz5SLzzeU/Wa5qm4RTo4MwDqrfRSiA2KDmQnHUvHLUrDZ1JFayJl5XzW/Yobl5T1OoIm
         uTzG+90SeoZrJDUtpn5j/RTc9Mwmm57KD8CEbhgrPGpWP4XWnESORi0T8sc4aNc9Y+Xp
         Qz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721134463; x=1721739263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lojy0rKM8jcfJeF8DFtdEG/UxXsXWlTiUNS9u41bB0g=;
        b=X/CbPS+Aykm/m/+2XBfRvuBitDzHoKcIhAzbnu9v8yG6RxR3TBA3Qrw6InE3vblZbd
         DvRX7hgHas8RDc7BCjfQliHWWyZ5pQArihRV16QuiVmRNXbXhFToHVGbQFERR5BmpuTH
         nrHKzvX+oVSikhOC4uBsrWLwTaOwsuygrRPz/2nnTjsUuEzZs32ShU7ropk5wh3JjvcO
         yzZYaZt78VmpIzXo/cO7R74joNgvqB2IGs+iqoexxwLMmmv1OG4oqSTCego1U5+jwEn8
         X5YUP3BW4reHIsMnhQlh4bqVqwHxxxeT/28o7AL80TqkvndFKGNpTUPfwAAyCz3UNu6B
         3Xcw==
X-Gm-Message-State: AOJu0YxEaiAwhNdCCjo7ncmAzrw8DjeZ2ZNM/dVUpDAsh/aBzjTNXlcj
	f29eIIpFXvZVqCw49Df+vL3KHuAfpQJfdLrh/6yDOkhRs9m9bNVWUVT24u9sRzFMjG6DqMkWl+N
	xUPChfwOeX5tiZiik57scxbYPdnQ4DlHT7QgStg==
X-Google-Smtp-Source: AGHT+IHIKQzax5Vu4IRvPf80wxjt7IO0kDbluiAW/15eFr+j1L99ZcqrOSOY3Usljcy2bRqGfS63nStwAU/smBWAdBo=
X-Received: by 2002:a0d:de44:0:b0:62c:c5e1:ff1a with SMTP id
 00721157ae682-663817d837fmr21608717b3.45.1721134463298; Tue, 16 Jul 2024
 05:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240716095803.3548946-1-changqing.li@windriver.com>
In-Reply-To: <20240716095803.3548946-1-changqing.li@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 16 Jul 2024 05:54:11 -0700
Message-ID: <CAOSpxdZzpn4h2-=qgJd1yv_aUcnLF+xqV7st_w4O1zD3MsRqnQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] pixman: fixing inline failure with -Og
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 12:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202110

Is there any reason I can't cherry-pick the similar commit in master?

https://git.openembedded.org/openembedded-core/commit/?id=3D4ab0d5c24b32a80=
432d9cfa6c904027b8a6710b5

Steve

On Tue, Jul 16, 2024 at 2:58=E2=80=AFAM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> When debug build is enabled(-Og is used), pixman-native do_compile
> failed with error:
> In function =E2=80=98combine_inner=E2=80=99,
>     inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pixm=
an-0.42.2/pixman/pixman-combine-float.c:655:1:
> ../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inlining fai=
led in call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_=
c=E2=80=99: function not considered for inlining
>   370 |     combine_ ## name ## _c (float sa, float s, float da, float d)
>
> Refer [1], always_inline is not suggested to use with indirect function
> call, replace always_inline with __inline__ to fix the issue
>
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107931
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...loat.c-fix-inlining-failed-in-call-t.patch | 56 +++++++++++++++++++
>  .../xorg-lib/pixman_0.42.2.bb                 |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-com=
bine-float.c-fix-inlining-failed-in-call-t.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-fl=
oat.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xorg-lib/=
pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
> new file mode 100644
> index 0000000000..5c79754e50
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-f=
ix-inlining-failed-in-call-t.patch
> @@ -0,0 +1,56 @@
> +From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 16 Jul 2024 15:31:16 +0800
> +Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call to
> + always_inline
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Refer [1], always-inline is not suggested to be used if you have indirec=
t
> +calls. so replace force_inline with inline to fix error:
> +In function =E2=80=98combine_inner=E2=80=99,
> +    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pix=
man/pixman-combine-float.c:655:511:
> +../pixman/pixman-combine-float.c:655:211: error: inlining failed in call=
 to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=99:=
 function not considered for inlining
> +
> +[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D115679
> +
> +Upstream-Status: Submitted [https://www.mail-archive.com/pixman@lists.fr=
eedesktop.org/msg04812.html]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + pixman/pixman-combine-float.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float=
.c
> +index f5145bc..f65eb5f 100644
> +--- a/pixman/pixman-combine-float.c
> ++++ b/pixman/pixman-combine-float.c
> +@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, float=
 da)
> + }
> +
> + #define MAKE_PD_COMBINERS(name, a, b)                                 \
> +-    static float force_inline                                         \
> ++    static float inline                                               \
> +     pd_combine_ ## name (float sa, float s, float da, float d)         =
       \
> +     {                                                                 \
> +       const float fa =3D get_factor (a, sa, da);                       =
 \
> +@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor,         ONE_MINUS=
_DA_OVER_SA,           ONE_MINUS_SA_OVER_DA)
> +  */
> +
> + #define MAKE_SEPARABLE_PDF_COMBINERS(name)                            \
> +-    static force_inline float                                         \
> ++    static inline float                                               \
> +     combine_ ## name ## _a (float sa, float s, float da, float d)     \
> +     {                                                                 \
> +       return da + sa - da * sa;                                       \
> +     }                                                                 \
> +                                                                       \
> +-    static force_inline float                                         \
> ++    static inline float                                               \
> +     combine_ ## name ## _c (float sa, float s, float da, float d)     \
> +     {                                                                 \
> +       float f =3D (1 - sa) * d + (1 - da) * s;                         =
 \
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.42.2.bb
> index 23ae0cbb27..3c55c1705a 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
> @@ -9,6 +9,7 @@ DEPENDS =3D "zlib"
>
>  SRC_URI =3D "https://www.cairographics.org/releases/${BP}.tar.gz \
>             file://0001-ARM-qemu-related-workarounds-in-cpu-features-dete=
cti.patch \
> +           file://0001-pixman-combine-float.c-fix-inlining-failed-in-cal=
l-t.patch \
>             "
>  SRC_URI[sha256sum] =3D "ea1480efada2fd948bc75366f7c349e1c96d3297d09a3fe6=
2626e38e234a625e"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202099): https://lists.openembedded.org/g/openembedde=
d-core/message/202099
> Mute This Topic: https://lists.openembedded.org/mt/107249150/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

