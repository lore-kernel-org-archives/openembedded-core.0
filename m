Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941DE106ACCD
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:11:44 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25492.1773331901645900943
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LPcfB8F3;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad9fabd08so1591413d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773331901; cv=none;
        d=google.com; s=arc-20240605;
        b=VXM7s0vrEPXmqwDt+rLc6b85DiDi/QZRLczJrRPvE/syxEAc8l2vJCptzYgZsIACql
         osF+/2ICnNTqT+MaRGNiuMOnkdSwNM85fblxgT86MOX9gbLB57N/tAy38Us/KpE9/uLP
         boo9ApNYIRT8IqJYnfodp5r25D/I8i6qqQDO7M6ia422XwHx9yDIAEe55uGPOKn774qv
         /hhzi1pGe/n+YZs6MSTC1AmC+nVJPxVzbY/SY22zuK9KXXAqdiK9NNbP9zLCVzgGH937
         k7grco6rl0vaN9hToEe1eB2tvNs35XxgN8JVcIVSyMLbzlPaCJgiDLZOIFJy2wGNGznN
         UlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e167wLjoKSg1BHUwOYbW1NMTzfNo4iozwpDQ83E+Om8=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=HZhGY1JTmDw6HTJzmWouBpmD+kQB6eUJ1Pg9aeyrQMX4ZzmC0c/Z0oQOac6KIZq5EF
         7TsxmV1WFT9HFD2HEPwohOjMGcKWX+h0adtZ94DZnqPvWjAt7cDYlBe6Un/Xp5Ch8dUA
         x8Q6FmRu9c55erD3jr9jfSjbF/5A/u+Fdm2dIrxTYBN7KjYzM9ljbo46VK6fZpjcMygb
         RvCZd/WILtVeRlGmxksU2q4FI/zO22ewDUSRHl1MiMX8RfW4axenCTdbAcdmDzDo3Qm2
         J6GVH0anH1WDrwpnAGYkUgED5ZCTVo4bSd2oR0gdm5BnHjAellLZ2vizpTCrp/HAGZ7C
         HpQw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773331901; x=1773936701; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e167wLjoKSg1BHUwOYbW1NMTzfNo4iozwpDQ83E+Om8=;
        b=LPcfB8F3cgnsBfzXdWBgVvsoSAEs2BKBWv5FfqeUZVd4dz9ilBRft7qydAAE7aYbKa
         O9ku95G0cXAGL3feyEm8adcWlL1fejF6pBDWBMySNxtscK+2ibD2rNnLsy5P2esKmU0a
         7mOIz6W0jZPOwqbFcBlISKQIWJdPQ6oLqOsX1G1GrNDl8k5CbmToMdEZ+eDp1i8VChNf
         T7m/Zuk8DXobbX2w5/16Dwd2x3HYpdZzMmPlrg5mg2epZCf3TukTWQyta+QehFHOkJqV
         E8vIbUgJc1uRUMTT9n+mCwC/AEo9Vr48k8gpdB1I2yJ55LOOJV0R7E1cnnpYj3qRHHAZ
         YcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331901; x=1773936701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e167wLjoKSg1BHUwOYbW1NMTzfNo4iozwpDQ83E+Om8=;
        b=wXDNPnajd6HQSODHun7Haj00XBWVYJSdfamvh6kW5GA/aNxyP34MHhRomAyOK+LUPe
         zGzF9itUS4llOTpCmOTGkkIE5f6NjSrub7HaM3MRNr5wReAl9XwnqZTEIWiRDGMVLxBC
         54/kbD/2pu+o7od5hZF2/znspkTxGzSSI21sqNtMcmXfjqRn0SRD5/hIAioQFQSz3rIG
         VTmBMLC0Mh4v5u4l+/hnm5o3qf564xj2aqRul+Cl7JkSN1T1WzpvGaAnlGbvcOwcyZq6
         UiQo9pyc0HglKHJPVrn3RPc24HRzeXZEOIsUpv0enUUslIaTtyWVoLmOHIKOpia+ETWM
         fVmQ==
X-Gm-Message-State: AOJu0YzyDbk2hlLKdYA/5Y3Tzzh2v7DI4flQve6YCI64WUVUsJfQCwIR
	cRUYKDMVacPVX4VhBpQAScdWv00oDHIauIGvZG7q5rO6Tmep9S62ix8vS5Q3T8cUD75fkV3KzC2
	wGjlZprugvZ1GujyULQ6vqNz1uHofBRO21A==
X-Gm-Gg: ATEYQzy707ycACC1BHyJfh6ny0kHAgttauFUenyfFqcN+VRaFlcOxAYTDZrF+OMNkdJ
	VGmp7CbuP1Xj3kbeQdskYM/Je0ImQBOjgg0BkF6EbIp3o6svGqwQtx6LMf9mbVTC0er7tcemgap
	ihKhOH2xR53RiX+NozudtbD1N3aNyPn6uf5mGBVjVt8An7io1VIHTtR2mteZA4c4lzaTomsDjtf
	nxPu57AHoEc9Qt/lirb1xChP9tBLj1Nb/gsxdPr0nHMedY681DSqucVtPnIWFHc8hh1rU37Tjb4
	SBiSDpoOQ3TNca3fKZog0A==
X-Received: by 2002:a53:ce92:0:b0:64c:9d01:aa66 with SMTP id
 956f58d0204a3-64e630900bamr72397d50.68.1773331900453; Thu, 12 Mar 2026
 09:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <20260310184058.533343-10-JPEWhacker@gmail.com>
 <68df2a5e4d34f553e5e1c4e6ebaa95cf1e75d462.camel@linuxfoundation.org>
 <CAJdd5GYbf7qApD_tfDP94faaJtVoG8KM=aHojGB8GQuF3tUJvw@mail.gmail.com> <6c53957cd2d8808c9a82015c350ff53186c5eb7e.camel@linuxfoundation.org>
In-Reply-To: <6c53957cd2d8808c9a82015c350ff53186c5eb7e.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Mar 2026 10:11:29 -0600
X-Gm-Features: AaiRm50f8LT8Z12B-5ZONBob0SgTuG0rZ22-XfobVpdneMTNuMtm4D_8yDbcBYg
Message-ID: <CAJdd5GaB3mPnUg1wb1JS_f3vP333eULsMuH7veQP5Z70VSXX8w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 09/15] spdx30: Skip install package CVE information
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232995

On Thu, Mar 12, 2026 at 9:52=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2026-03-12 at 08:15 -0600, Joshua Watt wrote:
> > On Thu, Mar 12, 2026 at 5:55=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded=
.org wrote:
> > > > Skips adding the install package CVE information by default. This
> > > > information grows exponentially, since it ends up be N_CVES *
> > > > N_PACKAGES. The CVE information for a given installed package can b=
e
> > > > determined by following the "generates" link between the install pa=
ckage
> > > > and the recipe and looking at the CVE information for the recipe,
> > > > meaning that the CVE information is only included once in the SPDX
> > > > document.
> > > >
> > > > If users still need the legacy method of including CVE information =
for
> > > > each package, then then can set SPDX_PACKAGE_INCLUDE_VEX =3D "1"
> > > >
> > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >  meta/classes/create-spdx-3.0.bbclass | 11 ++++++++
> > > >  meta/lib/oe/spdx30_tasks.py          | 39 ++++++++++++++----------=
----
> > > >  meta/lib/oeqa/selftest/cases/spdx.py | 12 +++++++++
> > > >  3 files changed, 43 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/cr=
eate-spdx-3.0.bbclass
> > > > index c3ea95b8bc..88b7ef9f42 100644
> > > > --- a/meta/classes/create-spdx-3.0.bbclass
> > > > +++ b/meta/classes/create-spdx-3.0.bbclass
> > > > @@ -45,6 +45,17 @@ SPDX_INCLUDE_VEX[doc] =3D "Controls what VEX inf=
ormation is in the output. Set to
> > > >      including those already fixed upstream (warning: This can be l=
arge and \
> > > >      slow)."
> > > >
> > > > +SPDX_PACKAGE_INCLUDE_VEX ?=3D "0"
> > > > +SPDX_PACKAGE_INCLUDE_VEX[doc] =3D "Link VEX information to the bin=
ary package outputs. \
> > > > +    Normally, VEX information is only linked to the common recipe =
that `generates` the \
> > > > +    binary packages, but setting this to '1' will cause it to also=
 be linked into the \
> > > > +    generated binary packages. This is off by default because link=
ing the VEX data to \
> > > > +    each package causes the SPDX output to grow very large, and th=
e same information \
> > > > +    can be determined by following the `generates` relationship ba=
ck to the recipe. \
> > > > +    Before recipe packages were introduced, this was the only way =
VEX data was \
> > > > +    expressed; you may need to enable this if your downstream tool=
s do not \
> > > > +    understand how to trace back to the recipe to find VEX informa=
tion."
> > >
> > > To me, removing this duplication and keeping the SPDX docs usable see=
ms
> > > like a very sensible thing to do. Do we want/need to make it
> > > configurable?
> > >
> > > I appreciate some tools/usage may need fixing to work with this but
> > > adding configuration options like this makes it harder to use our cod=
e
> > > and also adds maintenance/testing overhead.
> >
> > Maybe, but I'm very hesitant to break any existing SPDX based CVE
> > workflows that people may have in a LTS release, which is the only
> > reason I added the option. I'm fine to remove this after the LTS, IMHO
> > it's just too close to LTS release to suddenly say "sorry this is all
> > broken for you now"
>
> We're not yet at feature freeze and I'm getting very worried about all
> the combinations of things we're trying to support. Having so many user
> options is likely going to confuse users too . I can see both sides of
> this but I am leaning towards a cleaner implementation and having
> people adapt to it now rather than when we remove it later.
>
> Do we know of tools that are going to struggle with this change? I'm
> guessing people can adapt to the change relatively easily?

Any tool that didn't know to change would get a lot more CVE reports
show up, since the VEX data saying how we fixed things (derived from
CVE_STATUS and patches) would be "missing". The fix isn't terribly
hard as long as you know to follow the relationship back to the recipe
package (where all the VEX data now exists).

>
> Cheers,
>
> Richard
>
>

