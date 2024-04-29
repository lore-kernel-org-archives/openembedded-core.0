Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF83C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 15:03:58 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.23788.1714403033211577384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 08:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h9ycT2Ll;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-22f746c56a2so1829970fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 08:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714403032; x=1715007832; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv3Wa7k+TisIDMS3fW/qWuhfIQVMgWGURicb2i8JhaE=;
        b=h9ycT2LlzvGgCRWSTEA7CG08y6NhLGANEEV1studNVP98E+a+mRqwKNGOTEgB8MYN5
         qbKcaRXaOGmP+5uLXuM0BxOdGuU58B80k+XfYA/uJyzjwxYJIexsInb0ZNse3tkjqVDo
         4ZuapUmci82wgKDdQuqjjr/JsANGdr5j7ECzERArDBsSO1/1m6mT0t+LagdE4kMbdVse
         y6Lkv9+/BE8o0bW2yvNiWALo6vFczCdGVPoGE4sxL534ahrCRwSgQQ2zuMrgLpPOeWDi
         GFzPoMh8wOI2iyMn8ivKNfOBCgW+Pe3yuDQs1ykTb5LsvkKRmtP24P1O2LlRxzr2ZEAd
         iEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403032; x=1715007832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yv3Wa7k+TisIDMS3fW/qWuhfIQVMgWGURicb2i8JhaE=;
        b=qvQzoxEbZHbmDeAv4Zjugnfh+hstxL7NAF7nEeA0bgPErjSQrNDUMHFmik1sVHTkAK
         WUt7VV0dludSL+KFLdsauCOyhLzZ2wgkcoA+cm7iw7Lj2m2jxMmLPa2FeZcqOaUDKXKi
         N67XNk+rZa1LHXni3UfhwDZuv/OlVZstjtnGRpkNT7LvoEW9aCWnkzLLq8F6YH8BTpts
         wWAYPpQI663heiRImmFLCMWsSKF5HmbfDUvFjcK4jgK/dZ0cw5aeV0mdZCN/ARDRives
         oDTP3zQrGXn4oPYOwAC+kJzX80/byB32RGqlRKD5IHF0Q6/vAju88FG8fivuEL7NwiVm
         iTPw==
X-Gm-Message-State: AOJu0YxNS4q0GK+poBTtO2uBwa5tMPuG8hQCE1j81HL1DwfVy0CPrzJG
	d7go0ZUHJ/YDxjRL5CxcYMjiCcgmInvMqln/dRc5fulf8EUR3maRKOAH4PkcghTW7UNRonJ9WLb
	EB1WYxOEiQj8U+D6ZAkpRlM8DRmMBJr9L
X-Google-Smtp-Source: AGHT+IFW9B8hduG2MHmtggUkiduizV6ZYXkB8d2WePzSiwENJ1EBwsvYPka+SnlsbcEXC4drokGd2WGTumBilFqk25w=
X-Received: by 2002:a05:6870:d38e:b0:23c:e5f:8a64 with SMTP id
 k14-20020a056870d38e00b0023c0e5f8a64mr9229383oag.10.1714403032403; Mon, 29
 Apr 2024 08:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240429102959.3493324-1-zboszor@gmail.com>
In-Reply-To: <20240429102959.3493324-1-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Apr 2024 08:03:25 -0700
Message-ID: <CAMKF1so2k-N0VvfNnzOdu5L2pMLppN6UQqkK2VQRhG_ww73z-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cracklib: Modify patch to compile with GCC 14
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 15:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198744

Thanks for fixing this, however I would also suggest to submit this
upstream and see if this is acceptable

On Mon, Apr 29, 2024 at 3:30=E2=80=AFAM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org>
wrote:
>
> GCC 14 implicitly turns a warning into a compiler error:
>
> | ../../git/src/lib/packlib.c: In function =E2=80=98PWClose=E2=80=99:
> | ../../git/src/lib/packlib.c:554:40: error: passing argument 1 of =E2=80=
=98HwmsHostToBigEndian=E2=80=99 from incompatible pointer type [-Wincompati=
ble-pointer-types]
> |   554 |             HwmsHostToBigEndian(tmp_pwp.hwms, sizeof(tmp_pwp.hw=
ms), en_is32);
> |       |                                 ~~~~~~~^~~~~
> |       |                                        |
> |       |                                        uint32_t * {aka unsigned=
 int *}
> | ../../git/src/lib/packlib.c:142:27: note: expected =E2=80=98char *=E2=
=80=99 but argument is of type =E2=80=98uint32_t *=E2=80=99 {aka =E2=80=98u=
nsigned int *=E2=80=99}
> |   142 | HwmsHostToBigEndian(char *pHwms, int nLen,int nBitType)
> |       |                     ~~~~~~^~~~~
>
> Add the cast to (char *) to silence it.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  ...0001-packlib.c-support-dictionary-byte-order-dependent.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-suppo=
rt-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/c=
racklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
> index 20572b55c4..35229ae890 100644
> --- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dict=
ionary-byte-order-dependent.patch
> +++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dict=
ionary-byte-order-dependent.patch
> @@ -303,7 +303,7 @@ index 9396e1d..d0bb181 100644
>  +          PWDICT tmp_pwp;
>  +
>  +          memcpy(&tmp_pwp, pwp, sizeof(PWDICT));
> -+          HwmsHostToBigEndian(tmp_pwp.hwms, sizeof(tmp_pwp.hwms), en_is=
32);
> ++          HwmsHostToBigEndian((char *)tmp_pwp.hwms, sizeof(tmp_pwp.hwms=
), en_is32);
>  +          fwrite(tmp_pwp.hwms, 1, sizeof(tmp_pwp.hwms), pwp->wfp);
>         }
>       }
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198734): https://lists.openembedded.org/g/openembedde=
d-core/message/198734
> Mute This Topic: https://lists.openembedded.org/mt/105797819/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

