Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2743D10FC458
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 22:00:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.118048.1775685596851763412
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 14:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ylgx4LDN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso1688975e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775685595; x=1776290395; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AZ4vy0kxE4eCUtErGycsub8kvHLt5BUVq58LDmRgpw4=;
        b=Ylgx4LDNDYPUsMRqNOn49gmrkx4tXXhywGHClfwuQbOXaPKvpiqDGkSAKFkGWsNPSL
         3oBcBnoDWQnHh7rQ/18fe/MmvrvAz1ButNl2N3vnPADtF6ZksVo3EZrlkrz9ebTXCTQK
         wle/JCAuU326ZK29aS7WwloP3t/Pl5gDPDu6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775685595; x=1776290395;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZ4vy0kxE4eCUtErGycsub8kvHLt5BUVq58LDmRgpw4=;
        b=cJFIavtUO7rNeolLzuR2PVSba/Qr3DaAi7e7N9W4C16wmH5sKL+szuiyiBm5nXDvnd
         AWOxK4z7v6xDGBW2PLRub8R7t0bMA7qahSp8DUlE6qty2NcGSItv0npJpEx5KprkvMha
         /5HlVXt8YV+NMMDRaF9d8Aw6hjyCB7qDIr6vky3RM0J600RZa5Yh51c++2zH4j74cMyh
         SMGGhZw0A3vzUtuzXGUi8jdWOcaRgWB7l8kZio5SuYngEmV4AnGCqA+G46voqmHmBewD
         8Ss9CwPG18CrfZCyQoB8X5b+hLxoZwDYXN+W4zQoinUsrWhGg13BGDg9uDzVi8TIRwCK
         guhA==
X-Gm-Message-State: AOJu0YxfZ0I5OJo2SHj4qqBK9o76ZpsOtZ9LFSUW8HICNeCiZDgqoZs7
	1ZQ0AQHKh+P8y9+5pZ600oQNRQTPYZM4BP9K8HkHu8iqro+BL1OJ+KS/3vU0KciOTXWXZqVJTXa
	14m9GZoc=
X-Gm-Gg: AeBDietdmERu7E2KGWduq8g6JVXaDO3N3/mEFe7ym6mUTSAobnRBtMoviWlT5YBw4AA
	KI60nTXl5qEqLD8LNoKljIWvTzeaRd0aWeuPVi2Fz+4zUk4eYmL8g2AwV6wgfbW1VQPUDxPYA1P
	UwK5BxzDG6s/4k5pOs4FJq7Jj6ml8TTYUvcefTPZlydS7FSBKsZEuCm8zt6Y+lfIpra0SsrRxdJ
	h1YAYBfC6fr5PqVHgxZ2Cu1Obr5Pvlt7YfXUBPS5NCEMTf3yy92J/XQKTSesRH6ZY4YHtVratdX
	K9hHMgj0MltkZvaYg97Lumoqx1L7sykna/+BL/pTJtUnBkJpAGzxuE43GDCaScW32AxdZ0/xh1l
	EpC0Bo1xbtmvbHbUfezFOfg9XBRvybYs0z7ux9NA8F6FLjFc1w10butoXDTx5uxwjjFfR3fJ8pN
	tjLFuoByAy94z3/KQT1xfbK+t6yb4lHwmTUZb9qh71Bg1wVmdKbDv2xmqe0C/u3kwXZe4cnN95a
	xW3HSlCprVUmQ==
X-Received: by 2002:a05:600c:638e:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-488997dec25mr307237055e9.27.1775685595206;
        Wed, 08 Apr 2026 14:59:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:530:d4f8:22df:8c0d? ([2001:8b0:aba:5f3c:530:d4f8:22df:8c0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cf9e8be9sm2197835e9.6.2026.04.08.14.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:59:54 -0700 (PDT)
Message-ID: <2725ce14e862d3bdc289000c1dd3e904f9cc6e39.camel@linuxfoundation.org>
Subject: Re: [OE-core] why would ASSUME_PROVIDED recipes be built anyway?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 08 Apr 2026 22:59:54 +0100
In-Reply-To: <c8876982-82da-0f03-b9ef-2796fbcab38b@crashcourse.ca>
References: <daa91ca5-ef8c-bb83-7079-3d03ace27a8a@crashcourse.ca>
	 <1acc463784821951790b0a3cf3ee23a6b02aaa68.camel@linuxfoundation.org>
	 <c8876982-82da-0f03-b9ef-2796fbcab38b@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 22:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234869

On Wed, 2026-04-08 at 14:52 -0700, Robert P. J. Day via lists.openembedded.=
org wrote:
> On Wed, 8 Apr 2026, Richard Purdie wrote:
>=20
> > On Wed, 2026-04-08 at 06:33 -0700, Robert P. J. Day via lists.openembed=
ded.org wrote:
> > >=20
> > > =C2=A0 puzzled by something i just noticed ... the documentation for
> > > "ASSUME_PROVIDED":"
> > >=20
> > > https://docs.yoctoproject.org/ref-manual/variables.html#term-ASSUME_P=
ROVIDED
> > >=20
> > > clearly suggests that these represent recipes that would not be built
> > > as they are already on the host, the example given there is
> > > "git-native".
> > >=20
> > > =C2=A0 however, in a walnascar-based build i just built, native recip=
es
> > > that were listed in ASSUME_PROVIDED were built anyway, even though
> > > they are clearly on my Debian 13 host, "git-native" among them. in
> > > fact, a number of recipes i checked appear to all have been built fro=
m
> > > scratch, despite being listed in ASSUME_PROVIDED.
> > >=20
> > > =C2=A0 as a test, if i then tried to "cleanall" such a recipe, i got =
the
> > > perfectly reasonable:
> > >=20
> > >=20
> > > $ bitbake -c cleanall git-native
> > > ... snip ...
> > > WARNING: Explicit target "git-native" is in ASSUME_PROVIDED, ignoring
> > >=20
> > >=20
> > > is there some reason that something listed in ASSUME_PROVIDED will be
> > > fetched and built anyway? is it a version thing?
> >=20
> > Some of the recipes have a PROVIDES for XXX-replacement-native and you
> > can build/depend on that.
>=20
> =C2=A0 sounds like something that should be in the docs, just to avoid my
> level of confusion. :-)

I'm sure you could work out a suitable patch! ;-)

Cheers,

Richard

