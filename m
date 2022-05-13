Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DB4C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 17:50:28 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.499.1652464227288004626
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 10:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NP+loJ9D;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id jt15so7183470qvb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nRjkw6uiWNIPr9kgX9w8xC7HBNZcc8miPFY490Syvxw=;
        b=NP+loJ9DmwqISZVy2OUl5o+UBMy/rA20K4775pEu13R7OsQsjRcgV0GfnWDmBwf9b7
         azkSPZQ7CfcNClA4L6DoLHiPzARC98A92tG9udq+3SdoKVexRl7CbWkehyP5za8i8cmN
         bJRKO7+SXbE95jPr8h1JaGu/EK9YwL1UFvNfkkPZD7zQXs5gJB0+HplL2GNHlGnyfi3m
         a0/R9Sld7aNfgOp8cTogUaMxvwkzx3nQS9Ofv9kM4aoume8g+LWwh2Nn8VJiegE45575
         pciWTetKJIZwB3QqkxRR/u5NlBTflpBfVvIlgVZOgFmhjOHRXXy7bwSBVzJ310g7tr9Y
         L06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nRjkw6uiWNIPr9kgX9w8xC7HBNZcc8miPFY490Syvxw=;
        b=OhQiGdZwnw72qxi1A9hdoRIsJqKNIg4gFuqygI+zcwI4oddT12UxjgDF6t11dmfZS5
         pA7Wh/jh97+kXKA0UdQcFcDjM1sDkEvfrShe0YfoaVgN8byfDy2jj9QLJuViEB/2p/aT
         93uCLsotHSuKyWlk3iLKd+J2Vh2l7xAhliu7QVz5kFAzP3yn/KDTmT67VBrRAKaffUsl
         /4eC0eTuKllgp9dP6YfuMCQUn7l325btuNuEOgK9AE71uiWo5an/ckZFG2g4LpjawBgP
         7uXKdi/+m+eJzewxMcFD94OrN5f61XwH5ml8/iH1HATQhpOpIB5xicQIg1TzQSwbBsXZ
         0xJA==
X-Gm-Message-State: AOAM5322hXjMd1x0zJfruQ7c/WzBtG9JGuGRdAF8SV0jZrL0bdqoaLZF
	Vvl/X6Jv27Dzff2zQ34nQc9Q9ZkPwkItjSoJGac=
X-Google-Smtp-Source: 
 ABdhPJy9HtctzLRKwFgnpF5/Hq217bua33xjNUezgf6rTqLKteOjUwbxlIxijNzEBd7SMcNM7oadbXZKWfuhn1JfATY=
X-Received: by 2002:ad4:5dca:0:b0:45a:c70d:294e with SMTP id
 m10-20020ad45dca000000b0045ac70d294emr5660154qvh.16.1652464226328; Fri, 13
 May 2022 10:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <16EEAE47FC3C363C.27599@lists.openembedded.org>
 <20220513153031.1032716-1-zboszor@pr.hu>
 <20220513153031.1032716-3-zboszor@pr.hu>
 <CANNYZj8iwdYLGZ++GXsg4hcwZF9kQORzWF3Bv9QRRiYOV-95vw@mail.gmail.com>
 <ec556aa3-fb74-47a7-94cf-63a27199ba7c@pr.hu>
In-Reply-To: <ec556aa3-fb74-47a7-94cf-63a27199ba7c@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 May 2022 10:50:00 -0700
Message-ID: 
 <CAMKF1spxPjYSOXbYL-AMmyGRk38R6uS4q3FGpA4Nw0F6xgDbiQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2 3/3] nodejs: Add /usr/lib/node ->
 node_modules symlink
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 17:50:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165583

On Fri, May 13, 2022 at 9:49 AM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> 2022. 05. 13. 17:42 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > This needs to be sent to the openembedded-devel list.
>
> Is it ok just to cc openembedded-devel? Because applying
> this 3rd patch to meta-oe without applying the second to
> oe-core will cause conflicts and has a high chance to be
> rejected.

get the oe-core things done first.

>
> >
> > Alex
> >
> > On Fri, 13 May 2022 at 17:31, Zoltan Boszormenyi via
> > lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
> >>
> >> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >>
> >> While /usr/lib/node_modules and all npm-related modules are
> >> shipped in the npm subpackage, keep the symlink in the main
> >> package because 3rd party modules that don't need npm are
> >> also installed into /usr/lib/node_modules.
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>   meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb b/meta-=
oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
> >> index 62188f94a..be68afd4c 100644
> >> --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
> >> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
> >> @@ -159,6 +159,10 @@ do_compile () {
> >>
> >>   do_install () {
> >>       oe_runmake install DESTDIR=3D${D}
> >> +
> >> +    # node(1) is using /usr/lib/node as default include directory and=
 npm(1) is
> >> +    # using /usr/lib/node_modules as install directory. Let's make bo=
th happy.
> >> +    ln -fs node_modules ${D}/${nonarch_libdir}/node
> >>   }
> >>
> >>   BINARIES =3D " \
> >> @@ -176,6 +180,7 @@ do_install:append:class-native() {
> >>   }
> >>
> >>   PACKAGES =3D+ "${PN}-npm"
> >> +FILES:${PN} +=3D "${nonarch_libdir}/node"
> >>   FILES:${PN}-npm =3D "${nonarch_libdir}/node_modules ${bindir}/npm ${=
bindir}/npx"
> >>   RDEPENDS:${PN}-npm =3D "bash python3-core python3-shell python3-date=
time \
> >>       python3-misc python3-multiprocessing"
> >> --
> >> 2.36.1
> >>
> >>
> >>
> >>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165580): https://lists.openembedded.org/g/openembedde=
d-core/message/165580
> Mute This Topic: https://lists.openembedded.org/mt/91083341/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

