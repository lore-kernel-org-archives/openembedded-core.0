Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC016106705E
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:52:13 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24990.1773330731327571628
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F5H4CbxG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so1328073f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773330730; x=1773935530; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SGsHjklQ6kbv/rN08zXk3Cs0ev2PM0fCt/9woqjCaAA=;
        b=F5H4CbxGFDd+vWra8CplNtMc1/gjt39HBZWhcX5RECSRuCKfQOB4X7GHPHW+7S0maE
         RokrHcZLTLKev0gX37q1eMoSoz/bsZfQgT4E3Oae6wfyNudOkN9REtWlDvdgA7dySC5b
         8jZ9qh/59+MdjjKQguctUJEpmAiS0/JaJxH4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330730; x=1773935530;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGsHjklQ6kbv/rN08zXk3Cs0ev2PM0fCt/9woqjCaAA=;
        b=wkyBbOzWf1vjpRQhBzt+OPgIrES3TrtrfD73Efpje+Gqk7azaOLoRdZcCiuqiguH0t
         w0Mua9UadgbYCziicu7vTTjfxkgMRQzKc8gJ1C4qHtqT2s5oZIUJqgyvAGwe8VfHjeGQ
         kTZbBagnoUHBICeVXKCvtXC57Qxocm/CED1mj3qj18AujExarUAA2avLBfyYXC/nCM+Q
         sDAWHfwWZh/ENv8dac9KntHkgvJ8b7Zi0g/EKsRaRRX4YqfJb8rI7U83Lxl+SBAVJh4q
         uuvxV5iNXrjy8eCjUuI0Xffa7nEobgjdvwqssZHnMyKFqYETFoXXjkKMZ6cH+pmuGauG
         fpDQ==
X-Gm-Message-State: AOJu0YwoXo0J1w0h/mTKr37izUtCUdPG7st1aVf5hg90nMOPDKTgkMiE
	q2dgrOvM8vEQZ1vLiNL58TNwsJ6VKM/zyIdY+8olcnL/pERWu3mQZoR7BlRQgt86fDQ=
X-Gm-Gg: ATEYQzyyGSglaurcB41txDsw41GB/eVE1f3qR/VAgMyynSNZ8kIrBTKlNuENawB0t3W
	O/xUv34olU6TjonWtjaQLhiUuV6+gZCzNApmKCxBmwfnVBlo8LCTlMB8U4syjNaW+Gu59npYGjy
	EbzXfjuAbiHCMSbkZXEVve1TrlNjm5sjA2SQVJiJGELmB54RJo4fQIYkeoWLQa8XRVgQFY/mN3U
	IDf3xtwod71A9zaARl19yxXsJbE1TZxArGTV6sqkcgKqfouyfVIqfwmsTCu1MR12LVgcrEWgHWJ
	zV5qJUd8txjS7/cv58CUGOBwkXFpkBPrhUjmpCgh2NHS7llS/Abp4pW73Dt6d89NStyT4CQuHp+
	BeLRwYfl4I3F8TfbhUPf2gYgmU81oQqFISfyvUb9SelYGiFTl/06BmoY/1nthnieehDmER1CpJ7
	GzxoaH/h9Odgq91jspZEaWfR2cPvh7X8il3+Ee7REQ5RCp6JFuXCQiC7CuIXCGltetLR7rj9dzu
	4ey8iDFDarg
X-Received: by 2002:a05:6000:2584:b0:439:abcd:b314 with SMTP id ffacd0b85a97d-43a04d87b68mr377740f8f.18.1773330729403;
        Thu, 12 Mar 2026 08:52:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm9693956f8f.23.2026.03.12.08.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:52:08 -0700 (PDT)
Message-ID: <6c53957cd2d8808c9a82015c350ff53186c5eb7e.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 09/15] spdx30: Skip install package CVE
 information
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2026 15:52:07 +0000
In-Reply-To: <CAJdd5GYbf7qApD_tfDP94faaJtVoG8KM=aHojGB8GQuF3tUJvw@mail.gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-10-JPEWhacker@gmail.com>
	 <68df2a5e4d34f553e5e1c4e6ebaa95cf1e75d462.camel@linuxfoundation.org>
	 <CAJdd5GYbf7qApD_tfDP94faaJtVoG8KM=aHojGB8GQuF3tUJvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232982

On Thu, 2026-03-12 at 08:15 -0600, Joshua Watt wrote:
> On Thu, Mar 12, 2026 at 5:55=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.o=
rg wrote:
> > > Skips adding the install package CVE information by default. This
> > > information grows exponentially, since it ends up be N_CVES *
> > > N_PACKAGES. The CVE information for a given installed package can be
> > > determined by following the "generates" link between the install pack=
age
> > > and the recipe and looking at the CVE information for the recipe,
> > > meaning that the CVE information is only included once in the SPDX
> > > document.
> > >=20
> > > If users still need the legacy method of including CVE information fo=
r
> > > each package, then then can set SPDX_PACKAGE_INCLUDE_VEX =3D "1"
> > >=20
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > > =C2=A0meta/classes/create-spdx-3.0.bbclass | 11 ++++++++
> > > =C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 39 ++++++++++++++--------------
> > > =C2=A0meta/lib/oeqa/selftest/cases/spdx.py | 12 +++++++++
> > > =C2=A03 files changed, 43 insertions(+), 19 deletions(-)
> > >=20
> > > diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/crea=
te-spdx-3.0.bbclass
> > > index c3ea95b8bc..88b7ef9f42 100644
> > > --- a/meta/classes/create-spdx-3.0.bbclass
> > > +++ b/meta/classes/create-spdx-3.0.bbclass
> > > @@ -45,6 +45,17 @@ SPDX_INCLUDE_VEX[doc] =3D "Controls what VEX infor=
mation is in the output. Set to
> > > =C2=A0=C2=A0=C2=A0=C2=A0 including those already fixed upstream (warn=
ing: This can be large and \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 slow)."
> > >=20
> > > +SPDX_PACKAGE_INCLUDE_VEX ?=3D "0"
> > > +SPDX_PACKAGE_INCLUDE_VEX[doc] =3D "Link VEX information to the binar=
y package outputs. \
> > > +=C2=A0=C2=A0=C2=A0 Normally, VEX information is only linked to the c=
ommon recipe that `generates` the \
> > > +=C2=A0=C2=A0=C2=A0 binary packages, but setting this to '1' will cau=
se it to also be linked into the \
> > > +=C2=A0=C2=A0=C2=A0 generated binary packages. This is off by default=
 because linking the VEX data to \
> > > +=C2=A0=C2=A0=C2=A0 each package causes the SPDX output to grow very =
large, and the same information \
> > > +=C2=A0=C2=A0=C2=A0 can be determined by following the `generates` re=
lationship back to the recipe. \
> > > +=C2=A0=C2=A0=C2=A0 Before recipe packages were introduced, this was =
the only way VEX data was \
> > > +=C2=A0=C2=A0=C2=A0 expressed; you may need to enable this if your do=
wnstream tools do not \
> > > +=C2=A0=C2=A0=C2=A0 understand how to trace back to the recipe to fin=
d VEX information."
> >=20
> > To me, removing this duplication and keeping the SPDX docs usable seems
> > like a very sensible thing to do. Do we want/need to make it
> > configurable?
> >=20
> > I appreciate some tools/usage may need fixing to work with this but
> > adding configuration options like this makes it harder to use our code
> > and also adds maintenance/testing overhead.
>=20
> Maybe, but I'm very hesitant to break any existing SPDX based CVE
> workflows that people may have in a LTS release, which is the only
> reason I added the option. I'm fine to remove this after the LTS, IMHO
> it's just too close to LTS release to suddenly say "sorry this is all
> broken for you now"

We're not yet at feature freeze and I'm getting very worried about all
the combinations of things we're trying to support. Having so many user
options is likely going to confuse users too . I can see both sides of
this but I am leaning towards a cleaner implementation and having
people adapt to it now rather than when we remove it later.

Do we know of tools that are going to struggle with this change? I'm
guessing people can adapt to the change relatively easily?

Cheers,

Richard



