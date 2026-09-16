Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A27C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 08:41:49 +0000 (UTC)
Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10313.1789548101596109333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 01:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KA4O0bvj;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.91, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so1002695a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789548100; x=1790152900; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6iwoGUU1XtrF9PFm5QITt2J/DuuBQKSTvdNog0Px3s=;
        b=KA4O0bvjOIHElm13AyRxb0Dy89Bl3wGa1BQzuf8gzKoIHuqr+sse+1bF1nlB10AwlA
         vHgTJ+L4ofVPMnzoaG4L9a/QIWhFXIJ1deytK3MX0+N9YQ23XcpeE2UWcic/acSEPaeq
         cDaEMn8aLRZssZfQmeLDw+QLaIBFl8VL4bV1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548100; x=1790152900;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6iwoGUU1XtrF9PFm5QITt2J/DuuBQKSTvdNog0Px3s=;
        b=2P6Z05diO9U+BKlpliWdqozYYv/p3/4TcQQz8Ts5iuMD3MyFsKL55/+15TIghoeF6U
         CW4eWwLFtLRIJR7Cuv4MC6nCZNmfC2e1kvsPlg78N6X5EJ85HkLD07AYo+aUH972f7wA
         CEBt9HkSYNumX6QEgcJR5GSqiWeq3U1Eetvp2nmTscKwUMSm/mutFdFIfxGa2luKRq1w
         lssXfERvMT7ABHgJUNuzyd9cAlDctZWyOSfRc5uno3yXpsHKKN2LJZGddrTc9STvKrsR
         mc/IjJwjOH5N9KlC3RARZYb0rSaf8auBcYO+jBo2cTBg6LVukNz9BVTzYAPIwCCs4Oak
         O8FQ==
X-Forwarded-Encrypted: i=1; AKwUvByOsrzanMkWscNYXm8haHW6akPqmMnIOQVtYu9ZtepZ7VoHEDGS5jGdKjhVB8dCOE8HSiqudsD/8ZSiPbiSDL3D8w==@lists.openembedded.org
X-Gm-Message-State: AFuF++nk2nKHV4L07dVK7B4OC2a+x6GJZMuRkqsBL5J+pZA/SJ4vGi9d
	67UftDb1xm/m9Fm6+9QXsFv/+dTvgzl22rl732437BhjK28409g4UMR73zAoHhhr9UdGcDHTZGU
	kEoH96ng=
X-Gm-Gg: AYBFou0w7LJcH99nmWbXoDFusTJBW1A/qepiecl3whOSE6vsHbl6yxm3vcJynl3MEl3
	rcpgyegEBq0ibWq3bRV8DFAjVcZo1t/0rPAlMqy7FydM9dvp7WIv4/v7d6976y+nOMXrgtwMgSX
	6bzVO5nGeoPiMm3ZmSsHQGTSvsimAqAlHF3QXEU5AHWHZBHA4uXWgUld3a6b1r1MqvQP7tIScox
	P27TUgYVGJbQ5CG2aGZ913cO/oLAyzRI5scFq9L/y9s6SnktNowvOgVcwtIZZprXbn1O4HOr6mn
	1RW0S3zrwkDYeKVu2XGN4Aaoz6UvLGtFaFzPGHnOM0c+7ADC4dkN156Kgrv8I5agCyB6K3qX/is
	lBtDGXxAJw9Vqg2efPRVkeEKWKqfpP8Y8c0JMI8NiRBBHNiN0PgNC2ESF5XOacGYreY1t0lr5Or
	24UPL+uFduqlW1V46EOta4te9TbR+X5L3N5ZGi1Dq3JMEpK83NfYW3sXItuwEaZKzHKKYhe9kuf
	GQdKpBg5TgupbHJLT7B4Z7O/SyK1uk7Y8L3Xay+l0NGEyZhCgz+FfQnEUjOZl5AIA==
X-Received: by 2002:a05:6402:44c5:b0:6a1:f7f4:200b with SMTP id 4fb4d7f45d1cf-6aa224021cdmr1983299a12.12.1789548099363;
        Wed, 16 Sep 2026 01:41:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cd09:70e0:c6de:9b09? ([2001:8b0:aba:5f3c:cd09:70e0:c6de:9b09])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d29091bsm1111564a12.25.2026.09.16.01.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:41:38 -0700 (PDT)
Message-ID: <321582c9e3e2e99229b5a74bd3d244bdc1e0b270.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 3/3] adwaita-icon-theme: upgrade 50.0 -> 51.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org, Ross Burton
	 <ross.burton@arm.com>
Date: Wed, 16 Sep 2026 09:41:37 +0100
In-Reply-To: <20260916055325.3396270-3-f_l_k@t-online.de>
References: <20260916055325.3396270-1-f_l_k@t-online.de>
	 <20260916055325.3396270-3-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 08:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245939

Hi Markus,

In the patch review call, whilst I was probably slightly in favour, the
general suggestion was to hold off on gnome 51 until after the release.
We do have quite a few 51 upgrades coming in, both here and in meta-oe
and I want check we're all on the same page. Should we move to 51 for
this release or not?

I'm suspecting we probably do want at least the glib upgrade?

Copying Ross.

Cheers,

Richard


On Wed, 2026-09-16 at 07:53 +0200, Markus Volk via lists.openembedded.org w=
rote:
> AI-Generated: Uses Claude Code (Claude Opus 5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
> =C2=A0.../{adwaita-icon-theme_50.0.bb =3D> adwaita-icon-theme_51.0.bb}=C2=
=A0 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-gnome/gnome/{adwaita-icon-theme_50.0.bb =3D> ad=
waita-icon-theme_51.0.bb} (91%)
>=20
> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb b/meta/r=
ecipes-gnome/gnome/adwaita-icon-theme_51.0.bb
> similarity index 91%
> rename from meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
> rename to meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb
> index b0dc59353d..78dbe000ee 100644
> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
> +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc84cac88e46f=
c07647ea07e6c24eeb7c=C2=A0\
> =C2=A0
> =C2=A0inherit gnomebase allarch gtk-icon-cache
> =C2=A0
> -SRC_URI[archive.sha256sum] =3D "fac6e0401fca714780561a081b8f7e27c3bc1db3=
4ebda4da175081f26b24d460"
> +SRC_URI[archive.sha256sum] =3D "ba561cf3c96305a47179fa5605856ad695c9238e=
a07f7093aebd9ba80c4e323b"
> =C2=A0
> =C2=A0DEPENDS +=3D "librsvg-native"

