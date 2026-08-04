Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74ACFC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:38:48 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20777.1785861522985019618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TpRi3paK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so14157f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 09:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785861521; x=1786466321; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1nJuxcOfRLY6ZyV2GLrLaWku0UfWtejh/g4JTzr1da4=;
        b=TpRi3paKEA5ZL0hXsGVAdTtK2MLT8+pAPofVnUNCrxKLEGTKXIA2qBgo48wxQNC844
         +EwaOaN7GcnYuItzkK5tnEitrS1FWhQd2rOw3c86U7ewI4WOOw2SFxbYAciJXK/rTshj
         +jgt8Toezk1mqHgLXOWBInWGpiEccIetqKvts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785861521; x=1786466321;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nJuxcOfRLY6ZyV2GLrLaWku0UfWtejh/g4JTzr1da4=;
        b=NgcBY+/grGMOz8SPUAal6GjH82Hgkr+e97LOOIi0QckfOincUhrYQFyG4ymjkRqoEd
         XZEo7hTuo6mrhNe0H9J+jqX3cml9eLRUVs6nLtY3quH+04xhXrdrNKT0g4Fo5SI38+yA
         jycbZUNX/koFnkZBpFiAzwNWGXIKZU98jZZJPRawMk+xFE1f1zgSMk9bF2oXhXjjgp5g
         KU7AOy8VcV7dkfVMt5Ko+vn8qSHD2WzR0f/pfZwC+avvUAIhY/lw/I/VDAmbQ7U7BXat
         3l1U30WOWmULJtkffVSdpW55ZcYbmdqd+0FGY1KGxoo9jNLZGMEg3JtQK4DkRRR/ZddJ
         IKyg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2hkIsrENWMH+PrQodjjhOaE6vc6TyOEY620Un1FYNErwc+Qa1eyiBdDN8d/FdHPsTXSnPwND+B2Lpkne/uo6ruA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXBXowCBJTjkXeQ+TVaQ0C2mzl5Xmren0i+PuZ+I6tUc5PjPcP
	nH1+CliDbEWAIqkLGX/nFjPMPOvx03yO8YcYPNb+9fDg1bqaNskHTcSslu1DGgZBAac=
X-Gm-Gg: AR+sD11lcD64wz41XXbllXTKmPZUHRnMxn8OpwXdlHe8C13A9hG3opIqJQ1sqIQrUzD
	qFCVOMPM5NSLVGov2BNEm1yUKNDX8goVd4Qw40DWeP51DMmbD0gmNNno82ESJ1H6xZYYHs+5C0l
	oxbU3b7UGLZkwi5OzutaiK4MSfzs0FTl0QzgQBbVCr2rK8J6t/+26SJ+IlbeuOx3BsJ6Yk6U9z+
	ydXJ4FJui2cYgiSSIcN5yRMnljmCqLB8+fKnFfBgEhPyFGimfHMUjZ1xBJPjWV0zfRn9EyyIgpR
	ENkhDoW5tFNIvj2GTgJ3nrnhFXTIsw7YU2fYK5av3bZeKs3FyNSn+Ah0FaG2zRe4wRWys+rMjct
	0r0o9HJQsON9Ru/VtVjffcV737Os/8H8zuCwEximKQHurytrfh9B5DK5FoXm4yxP5+p0Yqkjulw
	C/FovT0w6LW1hNmZtCn7E6Nu2d1pOgPnwtOReXXWNwUICmNZaN/Rpaf+WmogD2ma4N/nbrnmeFo
	BGlIyxP1TviTS5XKwjCz7nY6ebGK6P9aYN0uKAfcnzDcVUPS9DHXg==
X-Received: by 2002:a05:6000:41f9:b0:47f:96e6:6e3 with SMTP id ffacd0b85a97d-47fec532566mr1060757f8f.23.1785861520935;
        Tue, 04 Aug 2026 09:38:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4? ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec232333sm1214509f8f.18.2026.08.04.09.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 09:38:40 -0700 (PDT)
Message-ID: <39883190b1f9fa5c5979c3ab6dea9a58d08cb23f.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] libva: update 2.23.0 -> 2.24.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Date: Tue, 04 Aug 2026 17:38:39 +0100
In-Reply-To: <20260803134915.8676-1-f_l_k@t-online.de>
References: <20260803134915.8676-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242780

On Mon, 2026-08-03 at 15:49 +0200, Markus Volk via lists.openembedded.org w=
rote:
> version 2.24.1
> va: include <unistd.h> for getuid/getgid in secure_getenv fallback
>=20
> version 2.24.0
> va: Add VA_PICTURE_H264_NON_EXISTING flag
> va: use secure_getenv instead of getenv in va_x11.c
> doc: fix libva av1 link for doxygen
> trace: dump input/output data in va_TraceProtectedSessionExecute
> trace: Add ProtectedSession Related Log in Trace
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
> =C2=A0.../{libva-initial_2.23.0.bb =3D> libva-initial_2.24.1.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 0
> =C2=A0.../libva/{libva-utils_2.23.0.bb =3D> libva-utils_2.24.1.bb}=C2=A0=
=C2=A0=C2=A0 | 0
> =C2=A0meta/recipes-graphics/libva/libva.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0.../libva/{libva_2.23.0.bb =3D> libva_2.24.1.bb}=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
0
> =C2=A04 files changed, 2 insertions(+), 2 deletions(-)
> =C2=A0rename meta/recipes-graphics/libva/{libva-initial_2.23.0.bb =3D> li=
bva-initial_2.24.1.bb} (100%)
> =C2=A0rename meta/recipes-graphics/libva/{libva-utils_2.23.0.bb =3D> libv=
a-utils_2.24.1.bb} (100%)
> =C2=A0rename meta/recipes-graphics/libva/{libva_2.23.0.bb =3D> libva_2.24=
.1.bb} (100%)

I think there is an issue with the gstreamer module with this and the
libva-utils upgrade in the tree:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4601

2026-08-04 16:11:43,763 - oe-selftest - INFO -       | ../sources/gst-libav=
-1.28.5/ext/libav/gstavvidenc.c: In function 'gst_ffmpegvidenc_register':
2026-08-04 16:11:43,763 - oe-selftest - INFO -       | ../sources/gst-libav=
-1.28.5/ext/libav/gstavvidenc.c:1036:26: error: 'AV_CODEC_ID_V308' undeclar=
ed (first use in this function); did you mean 'AV_CODEC_ID_MV30'?
2026-08-04 16:11:43,763 - oe-selftest - INFO -       |  1036 |         in_p=
lugin->id =3D=3D AV_CODEC_ID_V308 ||
2026-08-04 16:11:43,763 - oe-selftest - INFO - Found ERROR (line 31688):

Cheers,

Richard

