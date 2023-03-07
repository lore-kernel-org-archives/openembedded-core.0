Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD429C678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 09:54:53 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.10938.1678182885798874939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 01:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p3FroIEr;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id s22so16295181lfi.9
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 01:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678182884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1PE1aKSstMdzkxnT5/JUEGB60FVnJssfIxaQPoMa8I=;
        b=p3FroIErrgb/BlgPw153jrlw9w0+e+hgpKzQjpRl0rHB+LyeAe1Ff1MZ7sQhDaoQtK
         skpm44Kiluqls7CAY1flCDcyFev9fPo736DhFSLrg+unDlHY6MDdcPV10L2ezrDKjsNg
         NF9K/M7GQkiH/d3vtW8y9pW9g80wZ8FjKIWWAQIYTrkdITG423MYX7UeNN9GXBw3lk7z
         rQlYUlBrI0ayXZ95IpktDrHCzWp637RDF+UkR/2NX8SsB1x+ZEYQBXGU2zAeutoaL+IE
         xTuGvNUzjjTYUXw1yBVz8HJ7M7eyBcqChhcGOn8sBh8r5D4TW3RJrl614CsVCMeo+LMe
         JY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1PE1aKSstMdzkxnT5/JUEGB60FVnJssfIxaQPoMa8I=;
        b=Yvga+LVZBiySiA23Qz5wSh7saSpUKhn6Th20H+3D0EmxeQGty/5nIv3mfDL0vE5GS4
         fVBxjWn0HyXwfySCT7KZors3Im3H5SDXbb6bV+in2mVhwX023zQZdzdApCqcfWC+xnuZ
         xFSjK9RyeNzlp+JwRhGaAPsVqeTlwmAKfmNAcJGmnedB4ayWvwiRE7QYUSJuPSS8SuW+
         0I2cKGpJ5fGTDrSHRT2xl3BnisKUiDsTUidnuAMzAg7L4KhahYdofdEhXboXmljhBNhW
         Ql1Tlm0m345TN9ENhDZ1T9xR5rkxMrPwF0e4Uh9pf1dJ3eGgMJnT+ZI90rgY+/Y6CW5h
         Ddeg==
X-Gm-Message-State: AO0yUKUfeBFdIOp3izUP2dirkQpHIuKG4uP75GkSPvOqojT7CipbR//c
	jn6y1keWaosJziKlPQ0PFv1ARKrj/KItb+1zEXM=
X-Google-Smtp-Source: AK7set9K7NebWYbeyQS3G473a0pU3v07HyvtUgqyNCrkb6W4eHOt3HQBTqTDFaVC2WXsP6kVQ8Gke8+BGGZF73Bn6Rg=
X-Received: by 2002:ac2:4893:0:b0:4d8:1c0e:bfc7 with SMTP id
 x19-20020ac24893000000b004d81c0ebfc7mr4062502lfc.13.1678182883716; Tue, 07
 Mar 2023 01:54:43 -0800 (PST)
MIME-Version: 1.0
References: <17448D1AD5EE07BA.28744@lists.openembedded.org>
 <DB4PR02MB10030B5C7A26DB7E9DA54B42AE2B79@DB4PR02MB10030.eurprd02.prod.outlook.com>
 <CANNYZj-CuEp++Fvvt7s7mTd5R3uABk4wv9sYJGcMpe7Gm3EGsw@mail.gmail.com> <DB4PR02MB10030912A46A13228FF23FA6CE2B79@DB4PR02MB10030.eurprd02.prod.outlook.com>
In-Reply-To: <DB4PR02MB10030912A46A13228FF23FA6CE2B79@DB4PR02MB10030.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Mar 2023 10:54:32 +0100
Message-ID: <CANNYZj_6z0pb7B-MOsTQQyYrxM4iTDpicL-n0KhgnMwzmZOmuQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] graphene: remove introspection from PACKAGECONFIG
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 09:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178099

We don't send them out as it's too much manual work for integrators.

I'd like to see a bot that sends notifications privately when patches
land in master - if you can commit time and make it happen, that'd be
great :)

Alex

On Tue, 7 Mar 2023 at 10:46, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wrot=
e:
>
> I see, sorry. I expected some kind of "merged" response in this thread.
>
> Cheers,
> Petr
>
> ________________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Tuesday, March 7, 2023 10:31 AM
> To: Petr Kubiz=C5=88=C3=A1k - 2N
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] graphene: remove introspection from PACKAGE=
CONFIG
>
> Has been merged long time ago. Pls rebase to master, then ask.
>
> Alex
>
> On Tue, 7 Mar 2023 at 10:23, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wr=
ote:
> >
> > Could anyone have a look at this patch, please?
> >
> > Thank you,
> > Petr
> >
> > ________________________________________
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> on behalf of Petr Kubiz=C5=88=C3=A1k - 2N <Kubiznak@2n.c=
om>
> > Sent: Friday, February 17, 2023 8:47 AM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Petr Kubiz=C5=88=C3=A1k - 2N
> > Subject: [OE-core][PATCH] graphene: remove introspection from PACKAGECO=
NFIG
> >
> > Assignment of "introspection" as default PACKAGECONFIG value does not
> > reflect gobject-introspection being globally enabled or disabled.
> > As a result, graphene compilation used to fail when g-i was disabled.
> >
> > Use standard means to enable or disable introspection based on machine
> > and distro features, as implemented by gobject-introspection class.
> >
> > Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> > ---
> >  meta/recipes-graphics/graphene/graphene_1.10.8.bb | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/r=
ecipes-graphics/graphene/graphene_1.10.8.bb
> > index 75c8258d99..120ee80b17 100644
> > --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> > +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> > @@ -9,14 +9,15 @@ inherit gnomebase gobject-introspection gtk-doc
> >
> >  SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c7027bcff52f5ec236=
7c25ec859da31dfde2928f279a"
> >
> > -# gtk4 & mutter 41.0 requires graphene build with introspection
> >  # Disable neon support by default on ARM-32 platforms because of the
> >  # following upstream bug: https://github.com/ebassi/graphene/issues/21=
5
> > -PACKAGECONFIG ?=3D "introspection ${@bb.utils.contains('TUNE_FEATURES'=
, 'aarch64', 'neon', '', d)}"
> > +PACKAGECONFIG ?=3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '=
neon', '', d)}"
> >
> > -PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospe=
ction=3Ddisabled,"
> >  PACKAGECONFIG[neon] =3D "-Darm_neon=3Dtrue,-Darm_neon=3Dfalse,"
> >
> > +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> > +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> > +
> >  GTKDOC_MESON_OPTION =3D "gtk_doc"
> >
> >  EXTRA_OEMESON =3D "-Dinstalled_tests=3Dfalse"
> > --
> > 2.30.2
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178098): https://lists.openembedded.org/g/openembedde=
d-core/message/178098
> Mute This Topic: https://lists.openembedded.org/mt/97024165/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

