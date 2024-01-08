Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579EDC47077
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 22:39:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3332.1704753548480384018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 14:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CjGkOhfe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-336dcebcdb9so2505976f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704753547; x=1705358347; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1WKyWHDqkMQ4sgAQU5dU5NFt4R11WcL29ahRDFzygXo=;
        b=CjGkOhfeUbIUJM+/rqbZOUtbM3XvVE4buUfbV1e3K4GHxbEqW5o3DGPC+D0Pz0IQti
         uEEhE926uTr4mAjl0U32akQIn/EL6r2pccebl8OjaIQl+wYwH3S+zLMEm9RadEJy1981
         vToUi5SjZN5pbZFWzSEoYwF+OLVWI/ZQ6U0cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704753547; x=1705358347;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WKyWHDqkMQ4sgAQU5dU5NFt4R11WcL29ahRDFzygXo=;
        b=uUW36CJFyhPltDBAu+2LEClb0wQTpMm74q65jt5ZKmFhrGWVx0KJi6uGzMkm+pMv0B
         T/QwFr0SlLv9eNB/j52B12AQyyzLM9i57s9/rD5AYfhUI9enxSsouQVg+UUy2vTYtmrJ
         Fjn0TqsiTg9BKPNoCZ/kKhNdKUPtr5nCrSowPLhEo/BdHxngwl736statBKWFCoJTC28
         hpnSPNkF/XOHGhV9BjlLrRB+/MKDCLflnbKHfvOhYZ7TpFJE376bHrmSSDH+i78ncf6c
         DVPneD3dshVZXMaQuS6xc4bh5pGER44rHe+txGzHTa3RTOUymR6DfT9y6uJ6nSKWDgnk
         FCSQ==
X-Gm-Message-State: AOJu0YwlpjOg46mJKqM1YLq1/BDF4TNopfF4Nvq9Ky0HpdyN8ma+Xc9S
	rqmYXFmYv8A1GAzjNw3ZbP7xIe+gFZDWXuiT9n3CwfBKJTc=
X-Google-Smtp-Source: AGHT+IGDcxB+5UZsgmGmHWkUIyVYt/hjNA0iaiY5IknRgT+zZ87puSQu9gY9f6TxP4zdRGESzYbVjw==
X-Received: by 2002:a05:600c:68d7:b0:40e:4342:ae28 with SMTP id jd23-20020a05600c68d700b0040e4342ae28mr879020wmb.108.1704753546905;
        Mon, 08 Jan 2024 14:39:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:494c:2c49:a717:e3aa? ([2001:8b0:aba:5f3c:494c:2c49:a717:e3aa])
        by smtp.gmail.com with ESMTPSA id fl21-20020a05600c0b9500b0040e48e4bf8asm1218478wmb.10.2024.01.08.14.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 14:39:06 -0800 (PST)
Message-ID: <62591061a843999d470506252d6044f50ac81228.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] classes/recipes: Switch to use
 inherit_defer
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 08 Jan 2024 22:39:05 +0000
In-Reply-To: <A0382FB4-C99B-4558-8B8B-D5A3A248C862@arm.com>
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
	 <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
	 <A0382FB4-C99B-4558-8B8B-D5A3A248C862@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 22:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193434

On Mon, 2024-01-08 at 17:14 +0000, Ross Burton wrote:
> On 3 Jan 2024, at 14:59, Richard Purdie via lists.openembedded.org <richa=
rd.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > --- a/meta/classes-recipe/gnomebase.bbclass
> > +++ b/meta/classes-recipe/gnomebase.bbclass
> > @@ -28,7 +28,7 @@ FILES:${PN} +=3D "${datadir}/application-registry  \
> > FILES:${PN}-doc +=3D "${datadir}/devhelp"
> >=20
> > GNOMEBASEBUILDCLASS ??=3D "meson"
> > -inherit ${GNOMEBASEBUILDCLASS} pkgconfig
> > +inherit_defer ${GNOMEBASEBUILDCLASS} pkgconfig
>=20
> Feels like this should be split into inherit pkgconfig and inher_defer ${=
GNOMEBASEBUILDCLASS}.

I guess did it this way for ease in the patch, it won't really make
much difference either way, particularly for pkgconfig given how simple
that class is.

>=20
> > +inherit populate_sdk_base
> > +IMGCLASSES +=3D "${@['', 'populate_sdk_ext']['linux' in d.getVar("SDK_=
OS")]}"
>=20
> Whilst you=E2=80=99re here change this to foo if bar else flob, this bool=
ean subsetting idiom drives me insane.

I don't really mixing up changes as it just makes review harder so
whilst I don't mind changing that, I think it should be done
separately.

> > --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > @@ -14,7 +14,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/driver/${BPN}-=
${PV}${XORG_DRIVER_COMPRESSOR
> > FILES:${PN} +=3D " ${libdir}/xorg/modules/drivers/*.so"
> >=20
> > XORGBUILDCLASS ??=3D "autotools"
> > -inherit ${XORGBUILDCLASS} pkgconfig features_check
> > +inherit_defer ${XORGBUILDCLASS} pkgconfig features_check
>=20
> As above.
>=20
> > -inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERI=
T} python3native multilib_header
> > +inherit autotools texinfo binconfig-disabled pkgconfig multilib_header
> > +inherit_defer ${PYTHON_INHERIT} python3native
>=20
> Why is python3native defered?

In the past there were some ordering issues around the python classes
so I was just being careful not to cause more problems in the patchset
than I was already trying to debug. It probably isn't necessary but at
the time I wasn't 100% sure and there were bigger issues.

I can make the above tweaks if they really bother you...

Cheers,

Richard





