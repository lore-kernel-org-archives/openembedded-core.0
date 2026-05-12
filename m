Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9767ECD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:06:43 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71080.1778576799676253421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 02:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Br09dgH/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe608cb92so3300413f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778576798; x=1779181598; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OG7ZfrMaqSem1M4Sy83d4QPDcvZLRh0yO3aCuqXg3uc=;
        b=Br09dgH/K+MNjOaBqVOgY1vcpTxwWjhu2GQnE9DEcYy4vNrGanUERDiGin0KAHRiQR
         +agwrmPxY8g9Aw5ynQ9iaRIl7n1OzBBGn+2vvdBSiwuS/LUNw4EAQwOPiB+qiFDR+IxH
         tjZ+QwVes3q8kEh1WDPtHz/arK3DFKWFtE/tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576798; x=1779181598;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OG7ZfrMaqSem1M4Sy83d4QPDcvZLRh0yO3aCuqXg3uc=;
        b=GLEVxUvtHVDsh517oUfSTgydqVlhfNQuAdEPn8OnDY2dwkjNh7d0hgEXBf+g/JEAYG
         MRE6d09FwDYyqwd0O8K2rKc8gAAO5b2Ka/hLilzlJCrglkWUXGEMXEB815+DTbGeX4Nq
         0Mdu30oW07WWRhwhLoj+/sEqoNGo1xYzm602GWmOSS4zRnefNbeHLH+tdfjmqnn7TDwI
         WRvmiwnsO8OeT4moPHglPzsgBVWlL0l+EKvYtm4JpGB+peAzAO7vUJZq3OhNd/nRxnmI
         /VCeQE7iyEbw562EyIM9mBt8jAJWfABzMQ32Bh9WGHxHT2+FqOSQd8YHaNzj7gmtEZeK
         0DJw==
X-Forwarded-Encrypted: i=1; AFNElJ97dufbX0TXpj+dvdy2L3YlWSCLVsdggoparrQbn64C3vWwVAh0BgY4ONB5kiu19pFh70dMa+CMA/kDRvYn0iqNiw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz8DT+Mh43fAkgme/6N3J7FGdbfVVRQGMCK0Lmq7BmbQsTMFdmV
	IqtKCQxkKspEbYUKVjK9DywRAk8iQk4S0dj9fC06vIxXsZ709bnxSQe5X/cQfONBXU4=
X-Gm-Gg: Acq92OHH7K/512keJnMxfUv1nO2LiBVhUQbES8Vmfb75ZQEdAwljotgrzduhtToF5RL
	9BVa8WI3+onSeeb20OY+CAkHuFTydZ1SNZ3lrixNkAuFJx898fuXDe90Cuww260D/F+LIpboE7x
	5fo/zkjmfMU4Z4pqHp60h50AfxbIhx6VWAgh56VvCHXW8h1h2vBRZtLOuMubXW8dQD15U6d+rT2
	gwkOmNjYG26EN3NIHnQI3E0/evCkPyiVd2T1gWZKWKQTlr2k3TLRDvZ4hx5dXdCJGCv/BuINOAB
	vnQyELBEgKP6dn9DMKvKj4qH7ykWZaBVw9rznTMjxJDqjyyKYiREtSOLihCeSP2/C7Yfyktkle6
	ulf09x1Kcezg1pgWN1WL7gk8sAyzfhOvkokt+W6jeZtrdjH5J3Al1Y2of+JcdjeVabsLy2DfD3Z
	7j4ifsi99SOBtM6rTB76VS7vuiXvfey6lP52pcZ07zNvNsgcBZ8BfWOytxuCtPy9JhNK7MfEgGw
	che5tysun//BDv7jAmD5Nqo7Sc=
X-Received: by 2002:a5d:588e:0:b0:43d:184:8aa2 with SMTP id ffacd0b85a97d-4546140b235mr26998991f8f.16.1778576797755;
        Tue, 12 May 2026 02:06:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:44a5:ca0b:d27c:9664? ([2001:8b0:aba:5f3c:44a5:ca0b:d27c:9664])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm27456607f8f.4.2026.05.12.02.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 02:06:37 -0700 (PDT)
Message-ID: <8af0d0102205adfe2e997435e5fae90445c3c88e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] ovmf: drop gcc-12 specific BUILD_CFLAGS
 setting
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>, 
	quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2026 10:06:35 +0100
In-Reply-To: <03127fae-4d0f-46b1-b740-b6020a10a3e8@bootlin.com>
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
	 <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
	 <5f42f257-59fa-4085-a42c-7cbe55472567@cherry.de>
	 <708f2321-2420-431e-8b9a-3a5a470228dd@bootlin.com>
	 <bf76e336-9a8a-4488-a7fd-c4315303e53b@cherry.de>
	 <2558d49d-58e6-4e0b-be28-3d27cf521dc1@bootlin.com>
	 <a74ef617f11ddfc139fb23c7d688118de207712e.camel@linuxfoundation.org>
	 <03127fae-4d0f-46b1-b740-b6020a10a3e8@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236869

On Tue, 2026-05-12 at 11:02 +0200, Joao Marcos Costa wrote:
> Hello,
>=20
> On 5/12/26 10:46, Richard Purdie wrote:
> > On Mon, 2026-05-11 at 16:00 +0200, Joao Marcos Costa via lists.openembe=
dded.org wrote:
> > > Hello,
> > >=20
> > > On 5/11/26 15:52, Quentin Schulz via lists.openembedded.org wrote:
> > > (...)
> > > >=20
> > > > Not necessarily true as I don't think we build GCC for native recip=
es
> > > > (and ovmf has a native variant), so it depends on the GCC on the ho=
st
> > > > (unless you have uninative?). I don't know the autobuilder
> > > > infrastructure, e.g. whether we build patches on multiple workers o=
n
> > > > different distros to have a big GCC version test matrix.
> > > >=20
> > > > But yes, building with a newer GCC will generally not make warnings=
 from
> > > > previous versions disappear and I'm hoping upstream has had time to=
 fix
> > > > warnings returned by GCC12 in the last 4 years :)
> > > >=20
> > > > Cheers,
> > > > Quentin
> > >=20
> > > Yep, my whole point is based on the the distros in SANITY_TESTED_DIST=
ROS
> > > being recent enough to ship GCC > 12 :)
> > >=20
> > > I should have made it explicit in my commit message.
> >=20
> > I hate to say this but:
> >=20
> > Alma/Centos/Rocky 8 have gcc 8
> > Debian 11 has gcc 10
> >=20
> > and we don't use buildtools on debian 11.
> >=20
> > I'm therefore not sure how you concluded that from SANITY_TESTED_DISTRO=
S.
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> Ah, my bad...
>=20
> =C2=A0From this list here:
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#support=
ed-linux-distributions
>=20
> Considering the versions of Fedora and Ubuntu, I presumed the other=20
> distros were at least as recent (in terms of packages versions) as=20
> Fedora 39 (which ships GCC 13).
>=20
> I will check the results in SWAT to see if this warnings pops up, but
> the commit message could use a rewording to address this point and also=
=20
> some questions raised by Quentin, so a v2 will be sent later in this week=
.

We currently support distros with gcc 10, I think that is clear.=C2=A0

It may or may not show up on the autobuilder due to sstate reuse, so
relying on that as a way to check this is not appropriate.

Also note:

https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#requi=
red-git-tar-python-make-and-gcc-versions

Personally I'd love to remove this but we simply can't without changing
our documented host requirements.

Cheers,

Richard




