Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24951C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:26:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24462.1785871583433411613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DmTHWEyy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso812355e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785871582; x=1786476382; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TdlUAYOo/Ne9k4keogoKd4h1m5BdHKIOkbqyatneFl4=;
        b=DmTHWEyy8lyio7XO7yihpjWlRC8X7I529k50cS6+CR/CntM9wcXWbAIVJkc0aCP86l
         ATGJlzB9/KK00w23+VkttihD8tC2PUtVMJwrmnoxDHTTH4zOvgxNAXZuNukvjImqWMP7
         qUGRjnm20PjReqHmZQE0NKjOHwkuC74/iWS2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785871582; x=1786476382;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdlUAYOo/Ne9k4keogoKd4h1m5BdHKIOkbqyatneFl4=;
        b=kY8KTiFlkWwPKtdOzjP4doxcdFU2CRoL1S+nDOz76CYReonek4poRW9JsXp12sjQh0
         jFLyqIjMWoEdHRaEmnkG8tm9m1Aer6/feRrm+dQN+eCjIF9pu1cRgEIhzBvjti22Do4U
         bBlk6IQGfE/2y34aZ4XDAlcOKoNVBnv64M7S0dGE7VzG8oBq5Xl57N7TNdPR9TNWtysc
         MdhdNtWnwyIWt1exgZwgrs5Ds4v3U0N+kOj+oiwkhSPbefowKdvDiBbuY73gx2CHm2t5
         DdyteTdu1nu1K6RzYx/T7dZDzFBHl7eWp/ovuiltxeS4YXQxZGeClgkr8J9nW5tUGPpV
         Fo2g==
X-Forwarded-Encrypted: i=1; AHgh+Rp85hgMCm600Kk3AXh/x+iKSiV/7DF4cqotEg7KuNvJeocKkX3EuTzUwMQzbNnUsiWCxlE1CStyl+nzIM4CtAPGcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzCEPv7EW9c4wD591RRix2CKzxli3gw/9tUwNSNU4u0RlWpcW4K
	7bgfooWWHpOKGTiEiD0SvuKqyGXlLatJwvuObs00kJHIoViLIfxOoGn9W2idueAUomY=
X-Gm-Gg: AR+sD10qlPXTJeibopmnmW0S3zwz7++njWkXaQx9BMelxxACPz+Nu+FvONBOZhA11HU
	tnYrgou5fStdG0B9g89vQ/PifTSVsQapuL+p44d9eM7iREmRSeWDyJdNZLfKPvhdV0m0q/vD6hh
	VsiiScWWxxy07dzSFTJpIp0Cxcp0RuBB9ihcEr9QfkC3QT2B8I+1FIiRh6EhIoekUgepTH12e9s
	OhSXIrzqnSr/8EMW99sG4yzL28jJcVubTEFUu0VHJIkpZsreX4mR6mE9eaNkEFAwpvC+TBG57aW
	XweUS+Lov8K6FLdnYiNkD7U7cBGiXZ2yV7KYBxyupMkUi0dp5nE/oXPTy4LzsaLZ8zGChf8riYQ
	GW7+kZJ1QuBSMSZwspIhTSv/OhSH8DkOZOoPy5Ibk1xLo7a0xBMXnsdMmstcM3pdFuhmuYv0M1K
	02a/0udVW5W1ai6ttaJiIfR8PxTaUWRt3UO1GORkqNqnSq26MaKCQAucBIbD3I4uyzzU5uGVkyz
	FwRedyqiavPTGXksJvwsOESitf+aVSAgAESsz0i+fvQK19OgkrFVw==
X-Received: by 2002:a05:600c:4694:b0:495:3f99:849c with SMTP id 5b1f17b1804b1-4994e7cbb88mr6935045e9.15.1785871581497;
        Tue, 04 Aug 2026 12:26:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cf1f:6744:c6dd:c3ab? ([2001:8b0:aba:5f3c:cf1f:6744:c6dd:c3ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb345sm113247545e9.6.2026.08.04.12.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:26:20 -0700 (PDT)
Message-ID: <91387dc10e9cb054ecece87a3fe5a486d5229993.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] libva: update 2.23.0 -> 2.24.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Date: Tue, 04 Aug 2026 20:26:17 +0100
In-Reply-To: <18C8A798080DE499.3417489@lists.openembedded.org>
References: <20260803134915.8676-1-f_l_k@t-online.de>
	 <18C8A798080DE499.3417489@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 19:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242795

On Tue, 2026-08-04 at 17:38 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Mon, 2026-08-03 at 15:49 +0200, Markus Volk via lists.openembedded.org=
 wrote:
> > version 2.24.1
> > va: include <unistd.h> for getuid/getgid in secure_getenv fallback
> >=20
> > version 2.24.0
> > va: Add VA_PICTURE_H264_NON_EXISTING flag
> > va: use secure_getenv instead of getenv in va_x11.c
> > doc: fix libva av1 link for doxygen
> > trace: dump input/output data in va_TraceProtectedSessionExecute
> > trace: Add ProtectedSession Related Log in Trace
> >=20
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> > =C2=A0.../{libva-initial_2.23.0.bb =3D> libva-initial_2.24.1.bb}=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> > =C2=A0.../libva/{libva-utils_2.23.0.bb =3D> libva-utils_2.24.1.bb}=C2=
=A0=C2=A0=C2=A0 | 0
> > =C2=A0meta/recipes-graphics/libva/libva.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> > =C2=A0.../libva/{libva_2.23.0.bb =3D> libva_2.24.1.bb}=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 0
> > =C2=A04 files changed, 2 insertions(+), 2 deletions(-)
> > =C2=A0rename meta/recipes-graphics/libva/{libva-initial_2.23.0.bb =3D> =
libva-initial_2.24.1.bb} (100%)
> > =C2=A0rename meta/recipes-graphics/libva/{libva-utils_2.23.0.bb =3D> li=
bva-utils_2.24.1.bb} (100%)
> > =C2=A0rename meta/recipes-graphics/libva/{libva_2.23.0.bb =3D> libva_2.=
24.1.bb} (100%)
>=20
> I think there is an issue with the gstreamer module with this and the
> libva-utils upgrade in the tree:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4601
>=20
> 2026-08-04 16:11:43,763 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | ../sources/gst-libav-1.28.5/ext/libav/gstavvidenc.c: In functio=
n 'gst_ffmpegvidenc_register':
> 2026-08-04 16:11:43,763 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | ../sources/gst-libav-1.28.5/ext/libav/gstavvidenc.c:1036:26: er=
ror: 'AV_CODEC_ID_V308' undeclared (first use in this function); did you me=
an 'AV_CODEC_ID_MV30'?
> 2026-08-04 16:11:43,763 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1036 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
_plugin->id =3D=3D AV_CODEC_ID_V308 ||
> 2026-08-04 16:11:43,763 - oe-selftest - INFO - Found ERROR (line 31688):

It is the ffmpeg upgrade, sorry for the confusion. The libva pieces should =
be ok.

Cheers,

Richard

