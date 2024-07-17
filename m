Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F55CC3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 12:54:14 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.14396.1721220845125720257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 05:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yiWQhtiG;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.179, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-64789495923so62085767b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721220844; x=1721825644; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6UV5vrAegJ9ScWNWQNq0EZWo/Zvxoev8NPTQI7t4VY=;
        b=yiWQhtiG2f3AZq32tu2Bg6SywQj5rNctUTqV6kQAw5sFFjM1Hy35XGS3gSFVjzPMyk
         9B0SnV0NMhCNZAQX/9jKIdQe9G7hw31O5TztmILbqIYupRg4ADDcON8Qg3bZInG4MojL
         LPT9cbzhruhwEjAnFrnWUAGAyTKeGVZy0ZkBvX4KkJHgeqg5VPn07e1aRoeX+YQAhI95
         MKMb/QZbEYOEktyiGUeIfl/tGawO/VyVx/3SUIuSEMj87U47PcTBwa1D2SDdwCC2tMzv
         kC0M/WduH2Hr8SbT6qejytdxq1qfT0R+fMZ4zEZoB6eKsU4fY2EMsXXrmpz/su4V63gp
         B3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721220844; x=1721825644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6UV5vrAegJ9ScWNWQNq0EZWo/Zvxoev8NPTQI7t4VY=;
        b=dxAQxARKoU4vR1E/P6oRWdRb8iogabYL1jBFx2iAPV+ik2N2oDv2HeBOGkAd259D1g
         zm6jsmOOVIPbZyp5mpg+/WCMDtoe3yf5eEZrIc6m0qaaFNpvhM7U2W5HjJFxUMIgWKSe
         zcxB+CjMRakk8VPh/EGOcqiV4EU05keDKk8vLHcs33jNd/jzr514vE+GvUcg6SfADbeu
         3dJIK/3FfiDEFRgsO8Wq1M+xJeORm8My9uLBhiS7/yCFTCM5lqNX80InGUQ92Ga+YKHt
         y/fU2eMo9iPFAZErI1ZW9FAAVnThNrqrapSNk9d7l/pglpSZQsXB+i2suP7/iaWin5zV
         TdDA==
X-Gm-Message-State: AOJu0Yx6+i7M8CF7c/t4ZT7oyjrPWEHXsIh00XZ+clSs1z+8AXyxjZYj
	SZXDJr31pFbEdOSBMFhqi/gCMkrUEKsrHDWm2R44t/oQscW8f1ymPOcaJ2mvcsQ7IioZ4xyPX95
	nz6HT3Zs4capePJmxlAi+M4kYIdZcJ72M2MvpGNwfnPMN6VPz
X-Google-Smtp-Source: AGHT+IGmgwosfXaEATlD9QbixMNTXRvvcQOsAj7ZnTLob5brD3UBYJdribbrdpYqZDnFXAz1SaY4W3bAjNlsk5VIE1g=
X-Received: by 2002:a81:a550:0:b0:65f:a0e5:8324 with SMTP id
 00721157ae682-664fd983f86mr18411547b3.4.1721220844118; Wed, 17 Jul 2024
 05:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240716095803.3548946-1-changqing.li@windriver.com>
 <CAOSpxdZzpn4h2-=qgJd1yv_aUcnLF+xqV7st_w4O1zD3MsRqnQ@mail.gmail.com> <0557a6b3-636e-41cc-9774-9ad6fc52dce5@windriver.com>
In-Reply-To: <0557a6b3-636e-41cc-9774-9ad6fc52dce5@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 17 Jul 2024 05:53:52 -0700
Message-ID: <CAOSpxdbPJ_DXLjFxJHRXQtTKh46w5LhbkVGjrvFU-ckY0MYuww@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] pixman: fixing inline failure with -Og
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 12:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202162

On Tue, Jul 16, 2024 at 7:17=E2=80=AFPM Changqing Li <changqing.li@windrive=
r.com> wrote:
>
> On 7/16/24 20:54, Steve Sakoman wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> Is there any reason I can't cherry-pick the similar commit in master?
>
> No,  but if cherry-pick from master,  you need to cherry pick two commit:
>
> [1]https://git.openembedded.org/openembedded-core/commit/?id=3D4ab0d5c24b=
32a80432d9cfa6c904027b8a6710b5
>
> [2]https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next=
&id=3Dfdb5798b813c258ff8d922711ebe081c3c36aedf
>
>
> [2] is based on [1].  I noticed [1] is not on scarthgap,  so I send this =
patch.

Got it!  Thanks for the clarification.

Steve

>
>
> Regards
>
> Changqing
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D4ab0d5c24b32a=
80432d9cfa6c904027b8a6710b5
>
> Steve
>
> On Tue, Jul 16, 2024 at 2:58=E2=80=AFAM Changqing Li via
> lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
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

