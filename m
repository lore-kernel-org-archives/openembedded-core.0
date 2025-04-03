Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43811C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 16:46:54 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.418.1743698813733981637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 09:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Okr0OU7J;
 spf=pass (domain: konsulko.com, ip: 209.85.166.173, mailfrom: scott.murray@konsulko.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d46aaf36a2so8000485ab.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1743698813; x=1744303613; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=11AAdqxAKfCOolgoOBEX6ETrIGa/oEN75jhfFp7l3k4=;
        b=Okr0OU7J54v4fd450Kq5a+sH/EXIwkZrxKakb5hLM/P68jRZAKjNYRfxJLHLJk5+85
         zp/1dx4oxwI3ua1sjf/SubltCDQJtsVL00YHPJQ3TAIv0GvyeRoqdVIt9PHwjqmEsOfk
         JtvsfcHaiXMR/M+vv2cS2yjKEQPbOieOuIGSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743698813; x=1744303613;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11AAdqxAKfCOolgoOBEX6ETrIGa/oEN75jhfFp7l3k4=;
        b=pdJlRtfvp+zABCCq5Ne06Qu8UpLDF+FwGTjc0XRrDwDbT3qR8UevzU268aWmqxgOye
         7KICTe/9SCXCrTrR980y/KyC85gSLB+Sh/Z98idvdw/nR4r6GLHu+SQWl0nhSTJTpF9W
         PKnzcRcXONc2D+5zGHC1TJbhgpGCnOyOx8nzh8KKA8rniBuo5GEQLFnM/Tfz5Oa3aJey
         /rMXjDx5bkdy/Xdl59YMqQjs3nvBLkci8g+sR0cNY28Aye96bMMCJy+DPz5XuUcxO1Mh
         tzms9flSdcCCcmsqYs7hpw0owdhaIwf030pOo7B0WWFLS4NRx2iVt1piRmHMFplBXtdt
         BTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUldSOoUWXa+pA9NxRSQkk40c+hJQ6J+sz2ma94SwUvwGwj8moiS7RzeE1oMtwafg7ZSJWrGhLvvmtslO1iwh0x7Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4dprjgWPafwDB8WWQDCguRdSs1Hy/aZZ06BRV6D7ZwfNvvsKI
	51HqbaqsRvDUwBIJA0xKnUO3ysfj4JrWpuY/6ZQK+6oY/ErUe73K0UZ+WkokE4g=
X-Gm-Gg: ASbGnct0Jp25XDLTHfbZoSsPpwNe6Z24IowKVbPo/GYECLAIVXcUyPJ6RMenw+Ge6PX
	Nx+25Qg7EBwJMOygFj3w4AlOdG9fBOWjbhzifRaubcUt8jDO59DDGryojispqjt/sGl0Gbvkn1l
	qYEVbYeFn3jBh03NdTbQibsoIGh6buQegMzYkmqcB4vQ/vUh33M8+Im7s8P+gsVCDA5bXbNxH89
	t5nBJjtahcrqV04BuapqM7Tox6H/Gc3bf94tQsOEQO7hsGaq0dRhP5YboEqjispV+HbIgQgbUCl
	cNfm2bt2I2KhOS3opG0faoKpOA0iNbzAAjQbJTOwcBCkMFZCKlrXmRJDhZdvtr3mroiRKeIVkcu
	AYkk=
X-Google-Smtp-Source: AGHT+IE+yvAqJyqZGRARDQg2Wz7RohhI25OG9ZVKJ1QnleSYGABeu7WmN7Mer0xIVEryXU8125Ghdw==
X-Received: by 2002:a05:6e02:b2c:b0:3d6:d3f7:8827 with SMTP id e9e14a558f8ab-3d6e3f80a00mr747535ab.22.1743698812702;
        Thu, 03 Apr 2025 09:46:52 -0700 (PDT)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4b5d245e9sm372053173.82.2025.04.03.09.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:46:51 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:46:51 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: Alex Kiernan <alex.kiernan@gmail.com>, 
    =?ISO-8859-15?Q?Jan-Simon_M=F6ller?= <jsmoeller@linuxfoundation.org>, 
    openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH OE-Core 0/5] connman: Update for all PACKAGECONFIG
 options, clean up legacy
In-Reply-To: <cdcd72e3c0d2490030eb1b00bef5a11b49ebbfcb.camel@linuxfoundation.org>
Message-ID: <e5fe985a-9022-00d6-cd92-dd64061fa6d6@konsulko.com>
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com> <633bbc8576502d873a8e2a3938a6ae64bc508eb2.camel@linuxfoundation.org> <CAO5Uq5TWH00ALXtatz8y8Vf9fy4DLpC949ut_UeZhSx3BJKeSA@mail.gmail.com>
 <cdcd72e3c0d2490030eb1b00bef5a11b49ebbfcb.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811583-1913586508-1743698811=:3408"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 16:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214328

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811583-1913586508-1743698811=:3408
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Apr 2025, Richard Purdie wrote:

> On Thu, 2025-04-03 at 07:42 +0100, Alex Kiernan wrote:
> > On Wed, Apr 2, 2025 at 8:33 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2025-04-02 at 16:02 +0000, Alex Kiernan via lists.openembedded.org wrote:
> > > > connman has a legacy style, this patch set adds in all the PACKAGECONFIG
> > > > options which the upstream pacakge supports, removes patches which are no
> > > > longer required, explicitly supports operation alongside systemd-resolved and
> > > > reworks the packaging so that PACKAGECONFIG and explicit package selection for
> > > > every VPN is no longer required.
> > > >
> > > > Everything up to the final patch should be backward compatible cleanup of the
> > > > existing recipe, with only the final patch reworking the packaging.
> > > >
> > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > ---
> > > > Alex Kiernan (5):
> > > >       connman: Merge .inc into .bb
> > > >       connman: Delete patches for gold and MIPS binutils fix
> > > >       connman: Move ppp from DEPENDS to PACKAGECONFIG
> > > >       connman: Add all build options as PACKAGECONFIG
> > > >       connman: Rework to avoid splitting into many single binary packages
> > > >
> > > >  meta/recipes-connectivity/connman/connman.inc      | 221 ---------------------
> > > >  ...vice-stop-systemd-resolved-when-we-use-co.patch |  26 ---
> > > >  ...ange-visibility-to-default-for-debug-symb.patch |  31 ---
> > > >  .../connman/connman/no-version-scripts.patch       |  47 -----
> > > >  meta/recipes-connectivity/connman/connman_1.44.bb  | 154 +++++++++++++-
> > > >  5 files changed, 147 insertions(+), 332 deletions(-)
> > >
> > > This failed in testing on the first try. I've added:
> > >
> > > diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > > index 03f02d14ae8..c5ddea79005 100644
> > > --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > > +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > > @@ -6,7 +6,7 @@ LICENSE = "MIT"
> > >  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> > >
> > >  IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted \
> > > -                 kernel-dev kernel-devsrc connman connman-plugin-ethernet dhcpcd \
> > > +                 kernel-dev kernel-devsrc connman dhcpcd \
> > >                   tzdata python3-pip perl-misc"
> > >
> > >  IMAGE_FEATURES += "x11-base package-management splash"
> >
> > Is keeping all those RPROVIDES (plus doubtless more at this point)
> > actually useful? I can see it in the traditional distribution world,
> > but for OE-Core it feels mostly redundant to me.
>
> Short term, it will help fix people's builds and give some level of
> runtime compatibility. Long term, it would be deadweight we carry. I'm
> therefore torn.
>
> I did note that meta-agl ran into a similar issue:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/1250
>
> With the above tweak and the tweaked nftables, the rest of the build
> was ok through.

If you're leaning towards taking it, we can adapt in AGL, though I can't
guarantee there won't be a brief instance of AB breakage before I push
a change.  Overall, I'm a bit ambivalent about removing the split out
packages.  I understand the desire for simplifying it, but I also see
some benefits to still mirroring what most other distributions do with
networkmanager packaging since there still seems to be some interest in
attempting to do binary packagefeeds...

Cheers,

Scott

---1463811583-1913586508-1743698811=:3408--

