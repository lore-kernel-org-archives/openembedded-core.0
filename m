Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B583910775FC
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:29:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20001.1773854961015136128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OesU10mx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48534237460so838375e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 10:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773854959; x=1774459759; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1JgC+n5IcQ0bJIz4oQoUx6aBUKaFcL/VyteW2mQh9U=;
        b=OesU10mxNXlAnzW9mB/RGRXWvW4l5bo3MJE/ordNXJbapPF3zpe3UmyDq1hVl7R+xk
         aRjFgPvnEnWMWFcMmE5qgdM8unMI+1USTvwrdmYeGupHemPJBSUvIlbgJ06hxE76cv/t
         tBgHmTco5w49on3tHY4Q+WXH6JQSnV4idS/2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773854959; x=1774459759;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1JgC+n5IcQ0bJIz4oQoUx6aBUKaFcL/VyteW2mQh9U=;
        b=KUoJeKkJFKDsxcGnuq0xwpQBWhvDqMgG/qKRMqkeOBl+BdKtLOzhtCt/E5+RN0F9Vf
         Pw3ueFyg3lVRUAqVQpMp8zG7UHt9e55UTKjYQ0GM64qSRl1twfnhXFWjQSi8vfNnTiGX
         Sv/2Gogw8iiDxs7Lhv+tB7dllgkWA+c8Q0Uodesrfhp5KS/OVGWOpr/Jiwr/0jVvNT4P
         OKPzlWDfxtN9Sqyb2QK5tW4qKN1tBx8Jfi8GNphIM5vH88wbQoaXuCd7jHXw4ILwJyKy
         X7PixgBQYFY5UPyuwsasZ6ZgQCCCZKQaXQGBkLf2s78o2Jp4ePD8SSslFLIGt2izod/t
         jAEg==
X-Forwarded-Encrypted: i=1; AJvYcCVRisvW8WzDzMjV1P64q1MhR0iLfA3mh59GQuf+RP1pLXORpHxy1qP0O3xCAKbZGK+RufJHd3ExvWTPRrZ+kYFlpQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyg5qXxRwJUBiGqrDiKwhnCAWCkOvC5nlfLj4qe41fhtUPQxyo6
	1XRiR5eAVdXcr73/6GcEM8ppYUgmbOj0ehbFEHN4E02y37Q6rNYpyYhddGWRrIU63WiHBg8OQpg
	Cee/HRc8=
X-Gm-Gg: ATEYQzyUFU1XK33RAvuF0eII6yye9JaT8vAW2iXOSQtZEGTMMyVYyywOZgcIWYx9WKJ
	xPqkwNmy9Tr35E67yHXfm8JvFbC9SzLDmgiO2XpJrG//sstgF3dhdTdk2Zw9vFoU+CMQRELotqv
	DzmVSn2id3N0ygVwo6mN876B/qzfE0KBzBzwRDnGuI5wrsytUSGF/T+rlf/oMIqspO41iYFaoa8
	vJSj89MBCk/xOTVQ9qx296G9AAt6y51zqbQpTG24p7qlPTXCbhKo3NVuLsbX+4gi3nyG+0jNjTx
	xFA2/vXNtiNqAB7n6xngY2Jf59P8hA8+1dkUo+UJcmoeIo2Op6MTTiy6BrErajWqQsWDZr3qmJv
	O5XJGnNAwYnOmK4PftpNCzWTIxaN3r5patvL5ZD4k5dYM/aoh4yWpP/arXmFHiVYPG1ugZFK0p9
	djWf7mmPAh+VYpLL6dZckuhnSnHCFNbjyNNfMXnMFb/6iOyF4uw9+PBUqvJXwQFbp95NM1p66iv
	tjuncf4B6SH3NI=
X-Received: by 2002:a05:600c:1f13:b0:485:3c05:24dc with SMTP id 5b1f17b1804b1-486f4465ec5mr70626165e9.33.1773854959244;
        Wed, 18 Mar 2026 10:29:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c5d8:efeb:ae8c:c686? ([2001:8b0:aba:5f3c:c5d8:efeb:ae8c:c686])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518a3dedsm8944627f8f.36.2026.03.18.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:29:18 -0700 (PDT)
Message-ID: <b2f33df7c4ca8457f34482ab5ce8bc1b1a9c5c7d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 10/12] libsdl2: Explicitly set PACKAGECONFIG
 vardeps
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paul@pbarker.dev, openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2026 17:29:17 +0000
In-Reply-To: <20260318-fix-checklayer-2-v1-10-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
	 <20260318-fix-checklayer-2-v1-10-388ba6ce47cd@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233432

On Wed, 2026-03-18 at 17:14 +0000, Paul Barker via lists.openembedded.org w=
rote:
> The variable dependencies are discarded for PACKAGECONFIG, which may
> cause tasks which use the value of PACKAGECONFIG to be considered
> arch-independent, even when the value is actually different depending on
> the target architecture.
>=20
> In this case, we use the value of TUNE_FEATURES in PACKAGECONFIG, which
> is obviously arch-dependent so we should explicitly list this
> dependency.
>=20
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
> =C2=A0meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb b/meta/reci=
pes-graphics/libsdl2/libsdl2_2.32.10.bb
> index 834cf096b977..f7c292b6adb0 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
> @@ -80,6 +80,9 @@ PACKAGECONFIG[vulkan]=C2=A0=C2=A0=C2=A0 =3D "-DSDL_VULK=
AN=3DON,-DSDL_VULKAN=3DOFF"
> =C2=A0PACKAGECONFIG[wayland]=C2=A0=C2=A0=C2=A0 =3D "-DSDL_WAYLAND=3DON,-D=
SDL_WAYLAND=3DOFF,wayland-native wayland wayland-protocols libxkbcommon"
> =C2=A0PACKAGECONFIG[x11]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "-=
DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/libx11 libxext libxrandr libxrender"
> =C2=A0
> +# PACKAGECONFIG dependencies are not automatically carried forwards
> +PACKAGECONFIG[vardeps] +=3D "TUNE_FEATURES"

I'm not understanding the issue here.

I added a vardepvalue for PACKAGECONFIG but the usage of TUNE_FEATURES
here shouldn't matter, the expanded value will differ and that should
be all we need for the taskhashes to work properly.

What issue are you trying to solve here?

Cheers,

Richard


