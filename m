Return-Path: <wes@mitsi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A9BC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 21:34:50 +0000 (UTC)
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by mx.groups.io with SMTP id smtpd.web08.2430.1651786484025968442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 14:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@mitsi.com header.s=mesmtp
 header.b=YOff3bj0;
 spf=pass (domain: mitsi.com, ip: 173.228.157.53, mailfrom: wes@mitsi.com)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 7026A17C030
	for <openembedded-core@lists.openembedded.org>;
 Thu,  5 May 2022 17:34:42 -0400 (EDT)
	(envelope-from wes@mitsi.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=
	mime-version:references:in-reply-to:from:date:message-id:subject
	:to:cc:content-type:content-transfer-encoding; s=sasl; bh=0OkiJK
	60/Hm2qDoyTP8uC5zNGbOTMmPidIZnGnS9x8I=; b=HvIfE49+yJseggX4dpAWj9
	fPWoWhcZX7UTZwrd1wsaJFN5KBQfPjz2feTwN5JpbM96Gkxm2pV5k5imifDUBDXm
	DYQdySEQJJk3DPAivoC8IK1BmTSU70ZnzawQA3edd6Obgshu0VZU9V/6UtgKtAQJ
	yu1z7vSOM3qq3EgrOp1uk=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 5DF0C17C02F
	for <openembedded-core@lists.openembedded.org>;
 Thu,  5 May 2022 17:34:42 -0400 (EDT)
	(envelope-from wes@mitsi.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=mitsi.com;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to:cc:content-type:content-transfer-encoding;
 s=mesmtp; bh=0OkiJK60/Hm2qDoyTP8uC5zNGbOTMmPidIZnGnS9x8I=;
 b=YOff3bj0hhPEz1dldE8lqbu82cAbh1DJIH3T9Xe7mGSdbJ2//KxBXL36/coKBAkysFHHIxjQfhcfAldNFe4ja1fSY/cNhzKRKPTGCJ+Y3C5GeFoWGUqs6uGOoCCxRFBR9oSAkNjCupjEYRop8LaqUk18dwJ3Pa5x78yojZ7dsd8=
Received: from mail-yb1-f178.google.com (unknown [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 070B217C02E
	for <openembedded-core@lists.openembedded.org>;
 Thu,  5 May 2022 17:34:39 -0400 (EDT)
	(envelope-from wes@mitsi.com)
Received: by mail-yb1-f178.google.com with SMTP id m128so9823905ybm.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 14:34:38 -0700 (PDT)
X-Gm-Message-State: AOAM532S1VFzsO1+DexwmmWhSkJF1gYFEShHPiHm4eEz4hQJBkn7/uTq
	pHvtnlKIZelT/FAr4/TlZFAd9HEj0QrBicFP8iE=
X-Google-Smtp-Source: 
 ABdhPJxs5ujicCKB6cjbiME+9Dl0gY7ZyQQP9AvQWEOhrT12oNx85QqHcpbqnQc2HMZbjFri0whjio2lP0sfpIa+Xag=
X-Received: by 2002:a25:b9d2:0:b0:628:a85f:953c with SMTP id
 y18-20020a25b9d2000000b00628a85f953cmr174310ybj.312.1651786477297; Thu, 05
 May 2022 14:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220502211001.4183095-1-wes@mitsi.com>
 <20220502211001.4183095-2-wes@mitsi.com>
 <CAPnigKkL5LeyUj5NGwb0iYOeEBGSvm0FAO25zmVD2G9KATEijg@mail.gmail.com>
 <CANNYZj-19bZmShcS4ws_3hDKpxiir7-abo5M-_WEiEUUCCK25Q@mail.gmail.com>
 <CADqWEoSCJay3HL8iDU5yM4McJ1M7JLnfRJWFt7sm1kGQfuU_Fg@mail.gmail.com>
 <CAMKF1spZ529yEBOz=4tCBdpQskrpHr6dS3X920QaER25SN34jA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spZ529yEBOz=4tCBdpQskrpHr6dS3X920QaER25SN34jA@mail.gmail.com>
From: Wes Malone <wes@mitsi.com>
Date: Thu, 5 May 2022 16:34:10 -0500
X-Gmail-Original-Message-ID: 
 <CADqWEoSJemS7-=FWUbYNCvXcdx3H7H-OiLSftvmyRZtquHwXMA@mail.gmail.com>
Message-ID: 
 <CADqWEoSJemS7-=FWUbYNCvXcdx3H7H-OiLSftvmyRZtquHwXMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: disable libjitterentropy due to cpu
 usage
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 "William A. Kennington III" <wak@google.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Pobox-Relay-ID: 
 2AC96742-CCBB-11EC-A7B2-CBA7845BAAA9-78235051!pb-smtp21.pobox.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 21:34:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165312

I'm not well versed enough in these details to make a decision but I'd
like to help fix it once the decision is made. I of course moved on
with a small append on my end but I'd like to help fix this since it
affected my project.

On Tue, May 3, 2022 at 11:21 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, May 3, 2022 at 8:23 AM Wes Malone <wes@mitsi.com> wrote:
> >
> > > Isn't this desirable if you don't have an hwrng?
> > Perhaps what's needed then is a 'hwrng' in MACHINE_FEATURES?
> >
> > > Can=E2=80=99t rng-tools figure out the right sources at run time?
> > rng-tools enables jitter by default if it's built in, even if hwrng is
> > available. Maybe it's faster to do this on more powerful machines but
> > it's disruptive to run the cpu at max for so long on my pi's.
> >
> > We could also disable it with the /etc/defaults file with `-x jitter`.
> >
>
> I wonder if rng-tools is still needed after 5.6+ kernel after this commit=
 [1]
> Arch Linux wiki says no [2]. We added this as a recommendation to
> openssh by default [3] [4],
> I wonder if we can turn that off by default and perhaps add havaged as
> dependency if needed.
> [5] changed to use /dev/hwrng which seems right change to me. I also
> wonder if we can tune
> the resource requirement for rng-tools with limiting cpu threads and
> buffers allocated for this.
>
> [1] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094ba=
a51bb4c44e32
> [2] https://wiki.archlinux.org/title/Rng-tools
> [3] https://git.openembedded.org/openembedded-core/commit/?id=3D9b0137523=
6e19e3366c58877c4154d7c71632984
> [4] https://git.openembedded.org/openembedded-core/commit/?id=3Dfe99349c1=
bd72b69d22ab0dc52b8825d3157b8e7
> [5] https://git.openembedded.org/openembedded-core/commit/?id=3Df1dc9ac46=
710814c27cae2d22e79c84a9522993a
>
> >
> > On Mon, May 2, 2022 at 11:47 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Yes, I wonder why this needs to be disabled altogether at build time.=
 Can=E2=80=99t rng-tools figure out the right sources at run time?
> > >
> > > Alex
> > >
> > > On Mon 2. May 2022 at 23.33, William A. Kennington III via lists.open=
embedded.org <wak=3Dgoogle.com@lists.openembedded.org> wrote:
> > >>
> > >> Isn't this desirable if you don't have an hwrng? We want to generate
> > >> entropy so we can perform cryptographic operations by default if we
> > >> bring in rng-tools.
> > >>
> > >> On Mon, May 2, 2022 at 2:10 PM Wes Malone <wes@mitsi.com> wrote:
> > >> >
> > >> > After boot rngd maxes out the processor initializing JITTER entrop=
y for
> > >> > some minutes. Here we disable libjitterentropy in favor of only us=
ing
> > >> > the hardware random source via config.
> > >> >
> > >> > Signed-off-by: Wes Malone <wes@mitsi.com>
> > >> > ---
> > >> >  meta/recipes-support/rng-tools/rng-tools_6.15.bb | 1 -
> > >> >  1 file changed, 1 deletion(-)
> > >> >
> > >> > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/me=
ta/recipes-support/rng-tools/rng-tools_6.15.bb
> > >> > index 0696351903..4eed060960 100644
> > >> > --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > >> > +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > >> > @@ -21,7 +21,6 @@ inherit autotools update-rc.d systemd pkgconfig
> > >> >
> > >> >  EXTRA_OECONF =3D "--without-rtlsdr"
> > >> >
> > >> > -PACKAGECONFIG ??=3D "libjitterentropy"
> > >> >  PACKAGECONFIG:libc-musl =3D "libargp libjitterentropy"
> > >> >
> > >> >  PACKAGECONFIG[libargp] =3D "--with-libargp,--without-libargp,argp=
-standalone,"
> > >> > --
> > >> > 2.36.0
> > >> >
> > >> >
> > >> >
> > >> >
> > >>
> > >>
> > >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#165204): https://lists.openembedded.org/g/openembed=
ded-core/message/165204
> > Mute This Topic: https://lists.openembedded.org/mt/90845997/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

