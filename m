Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA93CC7618D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:34:18 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.91880.1680575654466179695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mSD5BZBP;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-17fcc07d6c4so18922810fac.8
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680575654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhtpUihx3Sz2DHtZj2mkEZ1m3/0PrTdBCExCFFkDTtI=;
        b=mSD5BZBPFxrGjunmPmxxDJn2H2SkDrhKIegK59HZKRGhyPdZSxL680FTNm2jEXhPAl
         N/x9EaGLn4ACQ5+bB9T8vRMelOoHyyYdlHc5dKsuoTRcmKXDg/XNzOMpMaLGslE0DFBV
         HRSotturAhXd3AmoyZ33WrNX/IOMb2a/uy2bgh32lMRPgkkIBCIgO9gmU3FVB1vr1cfI
         PReg0FJf9njDP2gWlSoitiNOmSuTxOZukVTRx/IVXSBrESDBF5tQB07Ltdf1OIZIdMEm
         uhfhcjQMPVwtSp36VuzZ6A4g58ErBOk5gkZqcP+BmiOZb+PcgNrhaGnknbd2Vm8GWJQx
         hPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680575654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhtpUihx3Sz2DHtZj2mkEZ1m3/0PrTdBCExCFFkDTtI=;
        b=L3S2bJjkpsUwMW0C7zIT7CDlSw2PZzURby/9siSPC/RMeiBJiFN2iWNpAGrrBdlu0i
         b4TbBS6XRgqNnflrW9AtpiXbKQcgus5mCHYIa9TTGuf6yn0ykB8GTulDOrn++LTsAomv
         MkuLAMDhOZjF0C7O7gP7GVUdc6/oyaeVrDBjjA48xZkvAzg/SGitbBhAjzJTKQPbUCB7
         t75hrKUNGI9S8wwKWWtw0C6WsrM2IHX1jBu5F5L8v7Q5U+NarsOSDesIMIcBHWaZKDWr
         GENPNdexsOyR2tNBEgm55oFa0kDjdt9xxNNwLB23s4LNqS/gaGOcmpHVhzWU4kNNHA8l
         RcZA==
X-Gm-Message-State: AAQBX9fsMZosEm3Jm6lCbtbWmWyWMjEKazpp42AFw4LuF+tPArLTzVCw
	oDsQ7GpCf2SRTsltOiD2NWnsB77S5KhKLE0yL8s=
X-Google-Smtp-Source: AKy350ZHDQfQvTcRJSTJsfjCVypumj8tAZ+KGLDSnr4xUKFuDNaA2opl4EnvbrltpRpl4yTST2XhaARdyAJXGW+9sgw=
X-Received: by 2002:a05:6870:1258:b0:17e:a9eb:196b with SMTP id
 24-20020a056870125800b0017ea9eb196bmr551943oao.4.1680575653685; Mon, 03 Apr
 2023 19:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230331104025.1478393-1-ejo@pengutronix.de> <7269b525eb965461ff7507ed59e79ccb24dbb388.camel@linuxfoundation.org>
 <9e38cb1cc2e7f7f64a47a7398961d73d6b386a7d.camel@pengutronix.de>
In-Reply-To: <9e38cb1cc2e7f7f64a47a7398961d73d6b386a7d.camel@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Apr 2023 19:33:47 -0700
Message-ID: <CAMKF1sp2benMoVS04jr-0Xps-jGyFR0ZbtipsKgL5sS3qNpETw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/9] Add barebox bootloader support (and testing)
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Alexander Kanavin <alex.kanavin@gmail.com>, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179658

On Mon, Apr 3, 2023 at 2:20=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutronix.d=
e> wrote:
>
> Hi Richard,
>
> Am Montag, dem 03.04.2023 um 16:49 +0100 schrieb Richard Purdie:
> > On Fri, 2023-03-31 at 12:40 +0200, Enrico Jorns wrote:
> > > This adds support for the barebox bootloader (and tools) to oe-core.
> > >
> > > In order to have proper testing, this extends oe-selftest to allow
> > > basic testing of bootloaders. While at it, cover both barebox and u-b=
oot.
> > >
> > > v2:
> > >   * set myself as maintainer in maintainers.inc
> > >   * move doc from documentation.conf to recipe
> > >   * update to barebox v2023.03 (including fixes for musl, etc.)
> > >   * set standard configs for qemu machines to allow building them
> > >   * add better efi dir support in barebox recipe
> > >   * enable testing bootloaders in oeqa
> > >   * add test cases for barebox (and u-boot)
> > >
> > > Enrico Jorns (7):
> > >   barebox: set default BAREBOX_CONFIG for qemu machines
> > >   oeqa/utils/qemurunner: support ignoring vt100 escape sequences
> > >   oeqa/utils/qemurunner: simplify output parsing and make
> > >     crlf-compatible
> > >   oeqa/utils/commands: document runqemu context manager
> > >   oeqa: support passing custom boot patterns to runqemu
> > >   oeqa/selftest/cases: add barebox tests
> > >   oeqa/selftest/cases: add basic u-boot test
> > >
> > > Marco Felsch (2):
> > >   barebox: add initial support
> > >   barebox-tools: add initial barebox tools support
> >
> > Testing on the autobuilder did trigger a few issues:
> >
> > on musl:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5023
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6932
> >
> > and some failing oe-selftests:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4971
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5023
> > [there were more but look similar]
>
> thank you for the autobuilder logs!
>
> I fear we are running into a conceptional issue that I already feared we =
could run into (but did not
> test for yet).
>
> If I traced this down correctly, then the 'issue' is:
>
> | NOTE: Multiple providers are available for virtual/bootloader (barebox,=
 u-boot)
> | Consider defining a PREFERRED_PROVIDER entry to match virtual/bootloade=
r
>
> The fitimage tests building "virtual/bootloader", silently assuming this =
is equal to u-boot (which
> it actually was so far).
>
> Now, the quick fix for this would be to properly set the correct PREFERRE=
D_PROVIDER here, but I
> could imagine that we run into similar issues in other builds, too.
>
> Do you have a good solution for this at hand? Like defining a standard pr=
eferred provider for
> virtual/bootloader?
>
> I guess one could argue possibly that the mechanism does exactly what it =
is meant for. And a few
> machines (like beaglebone-yocto or qemuloongarch) actually set the PREFER=
RED_PROVIDER, but not all
> and this might lead to silently switching the bootloader (like in our tes=
ts).
>
> I hope you have a better overview on the topic than I have and could give=
 me a hint on how you would
> like to see this being resolved?

I see that it fails to build with clang
https://errors.yoctoproject.org/Errors/Details/699467/

is it buildable with clang ? if not we can pin it to use gcc always in
meta-clang but I want to make sure first.


>
> Thanks in advance and best regards
>
> Enrico
>
>
> > Cheers,
> >
> > Richard
> >
> >
>
> --
> Pengutronix e.K.                           | Enrico J=C3=B6rns           =
     |
> Embedded Linux Consulting & Support        | https://www.pengutronix.de/ =
|
> Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  =
|
> 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    =
|
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179655): https://lists.openembedded.org/g/openembedde=
d-core/message/179655
> Mute This Topic: https://lists.openembedded.org/mt/97970644/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

