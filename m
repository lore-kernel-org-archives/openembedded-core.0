Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB2CC25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 20:06:26 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.441.1716408375851453879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 13:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRe80kow;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-23d1c4c14ceso2817713fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716408375; x=1717013175; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Q8jUrXHLqn0YEw5kio3pfZD28w5eJpcvSE8tkcCjT0=;
        b=NRe80kowXD51+C744vdC2L5deSiHpF24e2mri32n/Q99I2k6J9s8bHV9BObwDqRVgf
         uiFjS5djgIwruiro6H7D9cWDUE+Co41DjnO64naEOsuPTj8jgNwugy2LYOTu7W7dWzc+
         Ns+80hHj28Job4qKw81Y0b1y5niAZO5rEXOKtJw0RA3wEi8bKUCHylT7mmRuZfGUKTOG
         R8MgmiBUslzALR/7FgAMZ/cJ+jHT5r2p/cyThZIBpmbh1UCLxTe+Lh7yTObdMgeeHW0f
         2SELXMdJwWPSB60EFGZ3Bm4jMNHkCX6k0wQUZK+AT+WIirIHc1yMeZORAXX4aUqILBvk
         zszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716408375; x=1717013175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Q8jUrXHLqn0YEw5kio3pfZD28w5eJpcvSE8tkcCjT0=;
        b=EO8K/nFXjp67MHNMtWuCCskxrZQ052TRoleHHV2poTxw8yi2VGE1h4u7ESm0hXOnLq
         DXPWnR2YIvZpTXfmKqqQ3sOb8oBBEtP/RZH5mEpZAnEilp3W8aenwbfn290L3UM13TXq
         NppbH5Vk4DzScoEl5PJUAPdHeINVA1OLWgrKeddjp6PkxWDIitbea1ff3HLzj2bVtkTG
         2IQWLIlauK7xeQUeBkAFjo9e247gW70ATbEpboPRORW6HF0JhTfgIMVbiJROvEg7QgYR
         O1Ss0J+wV89joWe5qKfhH1XnwlyEvueqQbaT2LL9iQ92Om1GW4aP4EDbW05lTFbgo1RM
         PGrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZlDRknV3I8gin1Y3N1dXcsI+xPSLvBJfAxPECAwz2mSPBPLl5TmcFNv8rXisOJQtglD51XTOmt8Q2s+slHZEeeOuVM9HIxKMcCFwhO2rOgbqpo+Ek0PII
X-Gm-Message-State: AOJu0YymtWzhdGwNs851s53pF5yHvo1FdnnbsdAMQBY7Zf9HILDQud/B
	MwMxuEL2o8yJWLF6aqfHtjqidNkSXRYmvUUzdvGoihF3NMppO8FY5atocJqlwMbiJJ0lcle3IPY
	miBEcQzmvoMMA5mLeyLfCe6M/4P0=
X-Google-Smtp-Source: AGHT+IFY5IlqMCz1hCyJuQ5acy2Sii5P4x8A1NGgExPtEF8PUCCtA8gVsWfBkUGZqKm8NVKvu8VemJ3weLVoi/iCHmI=
X-Received: by 2002:a05:6870:3325:b0:23d:9f6b:5d41 with SMTP id
 586e51a60fabf-24c68611b08mr3362803fac.0.1716408373668; Wed, 22 May 2024
 13:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240520175706.1840576-1-f_l_k@t-online.de> <20240522090622114b300c@mail.local>
 <CANNYZj-5EkpYwcaiQEkxM6dQhXVNSJ-cjodnKHjUoiREUXV8og@mail.gmail.com>
In-Reply-To: <CANNYZj-5EkpYwcaiQEkxM6dQhXVNSJ-cjodnKHjUoiREUXV8og@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2024 13:05:47 -0700
Message-ID: <CAMKF1sqYY75qRWwBtWdxhb4egJhxz6A6ubgCsPS=_fgiAZXdCA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gcc-runtime.inc: additionally remove
 libgomp.info-1 and libgomp.info-2
To: alex.kanavin@gmail.com
Cc: alexandre.belloni@bootlin.com, Markus Volk <f_l_k@t-online.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 20:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199767

On Wed, May 22, 2024 at 2:07=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> I'm also curious in what scenarios is this needed, if the AB doesn't
> have the issue?
>

I am guessing that texinfo is installed on build host and libgomp
configure is finding it somehow

> Alex
>
> On Wed, 22 May 2024 at 11:06, Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Hello Markus,
> >
> > this doesn't apply on master anymore, can you rebase?
> >
> > On 20/05/2024 19:57:06+0200, Markus Volk wrote:
> > > This avoids:
> > > ERROR: gcc-runtime-14.1.0-r0 do_package: QA Issue: gcc-runtime: Files=
/directories were installed but not shipped in any package:
> > >   /usr/share/info
> > >   /usr/share/info/libgomp.info-1
> > >   /usr/share/info/libgomp.info-2
> > > Please set FILES such that these items are packaged. Alternatively if=
 they are unneeded, avoid installing them or delete them within do_install.
> > > gcc-runtime: 3 installed and not shipped files. [installed-vs-shipped=
]
> > >
> > > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > > ---
> > >  meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes=
-devtools/gcc/gcc-runtime.inc
> > > index dbc9141000..d1c47c5d5c 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > @@ -92,7 +92,7 @@ do_install () {
> > >               mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${=
D}${libdir}/${TARGET_SYS}/${BINV}/include
> > >               rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/$=
{TARGET_SYS}/${BINV}/include
> > >       fi
> > > -     rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
> > > +     rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/libgomp.info-=
1 ${D}${infodir}/libgomp.info-2 ${D}${infodir}/dir
> > >       rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
> > >       rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
> > >       if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; the=
n
> > > --
> > > 2.44.0
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199695): https://lists.openembedded.org/g/openembedde=
d-core/message/199695
> Mute This Topic: https://lists.openembedded.org/mt/106208568/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

