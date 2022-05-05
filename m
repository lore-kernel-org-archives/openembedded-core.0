Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F3CC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 22:51:21 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.3184.1651791071370504873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 15:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IJwt8u7S;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id f186so4344299qke.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 15:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3G5d90Kye99bWwXqhzfB/bNdTNOqFiehvo+c3CotgWU=;
        b=IJwt8u7S5WEcZ+KXjIxEWOZX0mL9XgSgtbmurZaYTgmbH6e8RHbBt94hljWFq1RlpO
         8o3c0VZBZDkwQ472OMIDBEnCw5AwaElsuTPxy2QnQhsLDAOzW/hxFX8lyOkUEWPdI2nZ
         lds+xA10r1cHo4kuL/4KfRbalvsodZWkONpGpDgr0baLkQ10r6WCMy7MXGGMdegZh6qO
         ka/l4SOmqyjWHF5TthkqAv8aeZbinRuF46TNuimxA62lktypmrTWHSWbjGmJz1EICX68
         Rhai+T2EDy5l03WEeCkvmnHW7W1L3SAdb4vNZJYufwdCBEfQdALHufQrOq37rdDAxhqn
         MQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3G5d90Kye99bWwXqhzfB/bNdTNOqFiehvo+c3CotgWU=;
        b=D4quk2Q6lCLtR2cKdj75owYWoRY8JDpagJlbArB+Ydcc8KzsO45a3ErxSWq8C0x6yX
         zHVawloLHeKX2CbN0yAMcoLcoSz4MVxWu8sq2Lft/dUhFxn53BQZAD9n8G7EqaFOFe9Y
         U5nIrAyVQvKmjsPhA9IUajsh18v3FXaf/V2vG5W5WVIjo4Nh+fLPCckJlLAvpZew5YD+
         vLw/xzj2KHBOprW2S12yugbPUvtW/PUm4Du8BW/dlOYR8E3XjuOZgvv7mx8mKZalsmwJ
         ll5OFWasqa8pB4uhxWs4BWZcXuRi0m9dEr7QfjMYx/ZowDBERlsTth1WC+TZCDiEJfsG
         3rtA==
X-Gm-Message-State: AOAM532X0r1UicVXlnWJ7Y07yj0tpcXfGkKR6/7GPuFCAqeTmmbG2MBf
	SgoQqV8HHE6e3J9by3MTeNqxnA0vq+j+Zgsa2H8=
X-Google-Smtp-Source: 
 ABdhPJyzPhIyvJl11kJf6mNrbX0OO6Y90mYwBTCBBsiwlKQrBzOaZxsFBOGIptSAFgd/hxb/sXCshMvoieiT2dVvceg=
X-Received: by 2002:a05:620a:44d0:b0:6a0:3f5a:d810 with SMTP id
 y16-20020a05620a44d000b006a03f5ad810mr519088qkp.72.1651791070392; Thu, 05 May
 2022 15:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220502211001.4183095-1-wes@mitsi.com>
 <20220502211001.4183095-2-wes@mitsi.com>
 <CAPnigKkL5LeyUj5NGwb0iYOeEBGSvm0FAO25zmVD2G9KATEijg@mail.gmail.com>
 <CANNYZj-19bZmShcS4ws_3hDKpxiir7-abo5M-_WEiEUUCCK25Q@mail.gmail.com>
 <CADqWEoSCJay3HL8iDU5yM4McJ1M7JLnfRJWFt7sm1kGQfuU_Fg@mail.gmail.com>
 <CAMKF1spZ529yEBOz=4tCBdpQskrpHr6dS3X920QaER25SN34jA@mail.gmail.com>
 <CADqWEoSJemS7-=FWUbYNCvXcdx3H7H-OiLSftvmyRZtquHwXMA@mail.gmail.com>
In-Reply-To: 
 <CADqWEoSJemS7-=FWUbYNCvXcdx3H7H-OiLSftvmyRZtquHwXMA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 May 2022 15:50:44 -0700
Message-ID: 
 <CAMKF1sogSyHV9tB05SLVFUpVnxD0GJHpOfuLt2PAAn_T6WRgAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: disable libjitterentropy due to cpu
 usage
To: Wes Malone <wes@mitsi.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 "William A. Kennington III" <wak@google.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 22:51:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165313

one way is to make rng-tools use less resources on embedded devices
perhaps limit the number of cores its give and buffer sizes.
secondly send a patch to remove openssh dependency on rng-tools perhaps

On Thu, May 5, 2022 at 2:34 PM Wes Malone <wes@mitsi.com> wrote:
>
> I'm not well versed enough in these details to make a decision but I'd
> like to help fix it once the decision is made. I of course moved on
> with a small append on my end but I'd like to help fix this since it
> affected my project.
>
> On Tue, May 3, 2022 at 11:21 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, May 3, 2022 at 8:23 AM Wes Malone <wes@mitsi.com> wrote:
> > >
> > > > Isn't this desirable if you don't have an hwrng?
> > > Perhaps what's needed then is a 'hwrng' in MACHINE_FEATURES?
> > >
> > > > Can=E2=80=99t rng-tools figure out the right sources at run time?
> > > rng-tools enables jitter by default if it's built in, even if hwrng i=
s
> > > available. Maybe it's faster to do this on more powerful machines but
> > > it's disruptive to run the cpu at max for so long on my pi's.
> > >
> > > We could also disable it with the /etc/defaults file with `-x jitter`=
.
> > >
> >
> > I wonder if rng-tools is still needed after 5.6+ kernel after this comm=
it [1]
> > Arch Linux wiki says no [2]. We added this as a recommendation to
> > openssh by default [3] [4],
> > I wonder if we can turn that off by default and perhaps add havaged as
> > dependency if needed.
> > [5] changed to use /dev/hwrng which seems right change to me. I also
> > wonder if we can tune
> > the resource requirement for rng-tools with limiting cpu threads and
> > buffers allocated for this.
> >
> > [1] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094=
baa51bb4c44e32
> > [2] https://wiki.archlinux.org/title/Rng-tools
> > [3] https://git.openembedded.org/openembedded-core/commit/?id=3D9b01375=
236e19e3366c58877c4154d7c71632984
> > [4] https://git.openembedded.org/openembedded-core/commit/?id=3Dfe99349=
c1bd72b69d22ab0dc52b8825d3157b8e7
> > [5] https://git.openembedded.org/openembedded-core/commit/?id=3Df1dc9ac=
46710814c27cae2d22e79c84a9522993a
> >
> > >
> > > On Mon, May 2, 2022 at 11:47 PM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Yes, I wonder why this needs to be disabled altogether at build tim=
e. Can=E2=80=99t rng-tools figure out the right sources at run time?
> > > >
> > > > Alex
> > > >
> > > > On Mon 2. May 2022 at 23.33, William A. Kennington III via lists.op=
enembedded.org <wak=3Dgoogle.com@lists.openembedded.org> wrote:
> > > >>
> > > >> Isn't this desirable if you don't have an hwrng? We want to genera=
te
> > > >> entropy so we can perform cryptographic operations by default if w=
e
> > > >> bring in rng-tools.
> > > >>
> > > >> On Mon, May 2, 2022 at 2:10 PM Wes Malone <wes@mitsi.com> wrote:
> > > >> >
> > > >> > After boot rngd maxes out the processor initializing JITTER entr=
opy for
> > > >> > some minutes. Here we disable libjitterentropy in favor of only =
using
> > > >> > the hardware random source via config.
> > > >> >
> > > >> > Signed-off-by: Wes Malone <wes@mitsi.com>
> > > >> > ---
> > > >> >  meta/recipes-support/rng-tools/rng-tools_6.15.bb | 1 -
> > > >> >  1 file changed, 1 deletion(-)
> > > >> >
> > > >> > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/=
meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > > >> > index 0696351903..4eed060960 100644
> > > >> > --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > > >> > +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > > >> > @@ -21,7 +21,6 @@ inherit autotools update-rc.d systemd pkgconfi=
g
> > > >> >
> > > >> >  EXTRA_OECONF =3D "--without-rtlsdr"
> > > >> >
> > > >> > -PACKAGECONFIG ??=3D "libjitterentropy"
> > > >> >  PACKAGECONFIG:libc-musl =3D "libargp libjitterentropy"
> > > >> >
> > > >> >  PACKAGECONFIG[libargp] =3D "--with-libargp,--without-libargp,ar=
gp-standalone,"
> > > >> > --
> > > >> > 2.36.0
> > > >> >
> > > >> >
> > > >> >
> > > >> >
> > > >>
> > > >>
> > > >>
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#165204): https://lists.openembedded.org/g/openemb=
edded-core/message/165204
> > > Mute This Topic: https://lists.openembedded.org/mt/90845997/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

