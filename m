Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB09CC7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:23:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.10206.1684938217496824326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 07:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ss4DYhRo;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-96f7bf3cf9eso184400166b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 07:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684938216; x=1687530216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6NDMAnLwwHaOCY/NgppOUd9VH1lVyg1i0IEpa/S5F0=;
        b=Ss4DYhRo1yiIUpo6ZytZqfEdMYZ2VJypbEtFqF+MF5u6jzse2Z2gWMpqST6TZf/GLY
         7E6oAjcx9IXPbJUbi9HRymnotzhfk1LyDe0WrelnOQh/soNynii1cR10SCgaycrzoGex
         Lf3P2gDAvQI6gxqFewPz8/htGvIIMhdEiuP0MyojRERwjE7+WE97pp24LxMYbzdxT9rk
         6DFia4uWCTlnXkaiJqlI978yW0q4+PkAsWMR0PZ3Ce0c1FG86U6Z/okz+ecl27seaHd+
         PoWRkpT329OL8bjxVcj22LfFBRidCYHQWnyJJSK/m+YPy+tPrccNoC0pdQ8vMAfP03J9
         8gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684938216; x=1687530216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6NDMAnLwwHaOCY/NgppOUd9VH1lVyg1i0IEpa/S5F0=;
        b=Y0ZOu9/ezNZq+rhHz1nUn1mcBZQ6tVr/hh1UH0QsHb2JqqDoXOnXRoqEaGIzZ/2q77
         ybqYVHc4e4rcCpT6L9iUp4wrNaUNpHfhyKqNNh8rmypEmUzkxD0HieUhhbLKIHVit0wg
         r4jeVrYwFb1WDMMFKs+3FvVoOihCDxjzfiTA1q7/kz7U+l2qm6GHihDvSKH3seAegn3c
         EqJhI1j1dDlTz4ElaySqiofRuJKtM2J50tBwN+S4kENdVDmnuJwchc9iM7i+Qi0hONaT
         c9IpEqsSn5F1YPaL6uS95c5SJv4wmDmM6AvHK5qLV2BmL2IZuoafsUUFw/yiCbbYLiB3
         tQZQ==
X-Gm-Message-State: AC+VfDwESVnV1dkLCCkxFakJGNglrJDiWcit6IEUEXiBmvmB3g/+1q21
	mAktt9h2jqFoflBBN6lpOf/jYC+ngwVRmyuICyV/3w==
X-Google-Smtp-Source: ACHHUZ7vybnZpLqMDkUPf/OTj/q1DzsyKpBvL0o0LbEode/UB9eQxl3IdF81RVpmnWLIziaAJUWHsRUhBfqU5SduKrI=
X-Received: by 2002:a17:906:b188:b0:96a:4ea0:a1e7 with SMTP id
 w8-20020a170906b18800b0096a4ea0a1e7mr15522303ejy.50.1684938215766; Wed, 24
 May 2023 07:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230126064612.3803320-1-jlu@pengutronix.de> <8f1d515d-0eb3-c9de-65df-1034c61154e2@windriver.com>
In-Reply-To: <8f1d515d-0eb3-c9de-65df-1034c61154e2@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 24 May 2023 04:23:23 -1000
Message-ID: <CAOSpxdaCCSE3uQiO14Q0sD2u3pQRc_B2MiEb3En5BjmYuZThDg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] p11-kit: add native to BBCLASSEXTEND -> kirkstone
To: randy.macleod@windriver.com
Cc: jlu@pengutronix.de, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 14:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181675

On Wed, May 24, 2023 at 2:57=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2023-01-26 01:46, Jan Luebbe via lists.openembedded.org wrote:
>
> This recipe is needed to build softhsm (in meta-oe) in with p11-kit
> support, which is useful when multiple PKCS#11 modules need to be used.
>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  meta/recipes-support/p11-kit/p11-kit_0.24.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipe=
s-support/p11-kit/p11-kit_0.24.1.bb
> index 59cbb67961ac..72b446204a1c 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> @@ -29,4 +29,4 @@ FILES:${PN} +=3D " \
>  # PN contains p11-kit-proxy.so, a symlink to a loadable module
>  INSANE_SKIP:${PN} =3D "dev-so"
>
> -BBCLASSEXTEND =3D "nativesdk"
> +BBCLASSEXTEND =3D "native nativesdk"
>
> Steve, could this change be back-ported to kirkstone?

Certainly!

Steve

> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181672): https://lists.openembedded.org/g/openembedde=
d-core/message/181672
> Mute This Topic: https://lists.openembedded.org/mt/99107763/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

