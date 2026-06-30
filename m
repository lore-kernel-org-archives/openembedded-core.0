Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1B9C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 06:42:20 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15585.1782801736744991803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 23:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CCsIEG3T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493a5d32e8cso23614115e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 23:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1782801735; x=1783406535; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8ToPTaeZcuS2ZFaQgVzIDNvqIjk6QcBbsOK+KCnY7Q=;
        b=CCsIEG3TNgCN5n3GakXFyKXJqCbqmKVZOXbqmqwqYuF6elriBu2Xl5FilFt0cXKPXH
         aiEyS3YxSmLYc0ojSV2UdqIFL1eIvD3hb9ZDrQtSzUUQCU/TRiyXpeXuoP6PY6gKMtA0
         Cmito1Vu344w9PQs+LrI7Kl2kpWBnT8BCo2IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801735; x=1783406535;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8ToPTaeZcuS2ZFaQgVzIDNvqIjk6QcBbsOK+KCnY7Q=;
        b=A4OVhwrKaYlWjUM7yobwvE6DrfrrbmL5unothlGq3CYxhgIs5KLmv1OzEGwlYvB3+y
         yqxYgfh82/kEIEqVSxRg57wQh57hwwlQyasVJf7xKEeRnVyzGsgyi+EJxgXGv1pxNW5j
         RImmc5wPrf+MHDSa9zthkwi50F8hrT6x8D5AQ8f6nbnhf6ejG7pCVVPO5xYTgBFsjJwK
         8E5/376bZ1ZYYxedr6xLD+NOoB82aYgP9kyIYKiLk8CAMtFwLQ/KYaXpPlMAqg3UDadY
         S16dwRMGEvmguci8yCnyjaBbrgAfLnjd0VWGp2nVzF8EBkZqjMARUPkqScp4HSr1kGrp
         TqTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7S4TN41LxmmzRr1QqykYPjy5kJf5V4apEKlqYUJFiqk4pTm/q+tZiaA4AurdJOm6LA7A03IfZuqqYT8NBYCNb7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx50M9alc4LxFPsrcsyAhjI1fUKQw7B6RHfbQXoTjD2qHJfyGuJ
	z7H+P5xY+W352FTSuGVZapQ5ZRiX+2YKVQUL+7v5VJwEZVFP4csf+clK/GyhbAbPDFoCh+bqstR
	ipnhV
X-Gm-Gg: AfdE7ckYuVGuXeRIrqnKYRnqpwEvtPc+hTgtQ+T8a/+cO55UnnAVHK1N9QPgtacAfcu
	Rkc1anksS6kYzYao92xCLTXKXg91FYZRKF23yEWmOkWFz5o6KPhv4DLoUmYJ58MA6H5IMbYR+Lg
	RQpNPcEHyCM2aHgJB0KJ5VS7itxklWBwRh4wqAuSy3fi5ys7u9Ri7h/MroJMe8AgF5HNLYUNhFM
	z78uTnJqIqsq0WCKj5VCsJg0WyJfIQl4fmDyHnMkOcUMzNPov6q+lbbai6gfVx1fAjpzaMOMRDr
	kdKACWF/c2LAaXk0NC0N5t3HxlWsF4phO1joBIDnlmZhrB1mkUf8W2s++9ZxY/uJH9NIaxyy8hA
	iMJNGhGDrqxti5wWwqk+rWYcWKeselMFdjLr/bVz8NbRZQ9/QQ4NCBQe5QLnlqq5/kw1Rg5iO9+
	d/hplhYXJ6C7msdCXiFI7gb3Hp/vLB0DDiI1OU2/vQ76rGHOXwH1FyRh4V13uQc2KOUvGzqz63s
	TgrBg==
X-Received: by 2002:a05:600c:638f:b0:492:37b7:607e with SMTP id 5b1f17b1804b1-493b827e881mr36127125e9.6.1782801734656;
        Mon, 29 Jun 2026 23:42:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:da5c:69ba:9920:6798? ([2001:8b0:aba:5f3c:da5c:69ba:9920:6798])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d0afacsm49859895e9.12.2026.06.29.23.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:42:13 -0700 (PDT)
Message-ID: <82485f53d8cdfc2fded0f3786cbe97fb105e9902.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] dropbear: Clarify LICENSE and drop PD
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2026 07:42:11 +0100
In-Reply-To: <DJLWBE1WSDSN.G0FEJAKOMOUI@smile.fr>
References: <20260602150018.189097-1-richard.purdie@linuxfoundation.org>
	 <DJLWBE1WSDSN.G0FEJAKOMOUI@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239852

On Tue, 2026-06-30 at 00:44 +0200, Yoann Congal wrote:
> On Tue Jun 2, 2026 at 5:00 PM CEST, Richard Purdie via lists.openembedded=
.org wrote:
> > The "public-domain" code has a MIT license header so we can remove
> > that from LICENSE (MIT is already listed).
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/recipes-core/dropbear/dropbear_2025.89.bb | 3 ++-
> > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/reci=
pes-core/dropbear/dropbear_2025.89.bb
> > index 957a0901fb0..ece065265ff 100644
> > --- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
> > +++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
> > @@ -5,7 +5,8 @@ SECTION =3D "console/network"
> > =C2=A0
> > =C2=A0# some files are from other projects and have others license term=
s:
> > =C2=A0#=C2=A0=C2=A0 public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
> > -LICENSE =3D "MIT & BSD-3-Clause & BSD-2-Clause & PD"
> > +# The 'public-domain' file is headered as MIT
> > +LICENSE =3D "MIT & BSD-3-Clause & BSD-2-Clause"
> > =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D25cf44512b7bc8966a48b6=
b1a9b7605f"
>=20
> While reviewing backporting this patch for scarthgap, I've look at the
> licences of dropbear:
> The "'public-domain' file headered as MIT" is (I think):
> https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/src/curve25519.c
> (indeed MIT header)
>=20
> But:
> * vendored libtommcrypt is "PD OR WTFPL"
> =C2=A0 https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/libtomcrypt/=
LICENSE
> * vendored libtommath is "Unlicense"
> =C2=A0 https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/libtommath/L=
ICENSE
> ... is that OK that those don't appear in LICENSE?
>=20
> If yes, then the argument is still valid for scarthgap and I'll will
> backport.

Well spotted, I think you're right that I didn't get this quite right.
It should be:

"MIT & BSD-3-Clause & BSD-2-Clause & (PD | WTFPL) & Unlicense"

assuming those libs are always used in the build.

We should probably just make it:

"MIT & BSD-3-Clause & BSD-2-Clause & WTFPL & Unlicense"

since PD just causes us pain and WTFPL is effectively the alternative.

Cheers,

Richard


