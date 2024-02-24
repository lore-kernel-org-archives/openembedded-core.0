Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F0EC54E41
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 08:38:01 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.15883.1708763875196351184
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Feb 2024 00:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R1UYJTBh;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512dfa097b1so2104944e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 00:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708763873; x=1709368673; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK6yJtkv+TdtgI6/IHItQdsc2bONbhyqX3K0QuokNUA=;
        b=R1UYJTBhbphkTsJX2OFf9VOYt9n7nzj7v/es0HyVZYrQowzEJZdk4t4fBlU1qEpRgG
         Ra2UsDkDARoaU5KvVTvfJKUP+jaVYF9SuofN9QzBil3l8aHO3ti6l4p4t/6dnxRzmlAV
         A9EPYrG1LNZ2eqnptWKkOXygchmzrVyUfpSy+L0GVonw373q+cny2p10rr35Iqn7lIXi
         G7JFV0dRqImR3a14hG1k+MLOT8e9g4FI9HFKvRR/FHxZ+x67lus5vMI2T2f4WcyP+nA9
         w/z4p+iN2lZ5tZIvTAD2e7nClUPVzhS7gkxqonk57YXolXmkJLu2Y3x8U6gz1Pgmrhdj
         DocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708763873; x=1709368673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK6yJtkv+TdtgI6/IHItQdsc2bONbhyqX3K0QuokNUA=;
        b=X8GSIwpBIi1OidwTeY8/Jy4Kymu/SssZy9FQXCivsz94SZYCqVArTfMgMYQJjLIzZR
         5IW4/NHBN9k0FG+zByzwyRNmhwt1qm9o/EXefbxRcXuRJzkv/sGSJoLAFi0VPjzVwBnL
         v+6T1MYVAhsW6KOTrJ1VbZ69o3R6lHbP2qN86RqNMP2Vs07OURDV+mrnrxWaik2SgPDE
         oKviWajc4y9AY/UR4qZFky4ANn30jjD4K0RaA5gSRHKZJJo9SPKkccAyWCnUfhLiU+Dc
         y3iV0fAbKwvpzvYb3h12R3o3gJDN5veAo+LnErvQ2Hak0ZQqVCdEbH9gk96ndXJmzG8U
         8lSw==
X-Forwarded-Encrypted: i=1; AJvYcCU4sXT9wF+823SrXwMDkOAzHBc4DPQdWTv31wbyLav0Ea4Bub+Hp0AWt7WA/abn62bABonah35k3MwDu4kGv0YXoVKuPQsNjqJxKVjGFX1VW6kaUkLTe+Tm
X-Gm-Message-State: AOJu0YyfkO+2oueNcUmjOulNc3X9MnXhsfZ1C/hcZveDVfmqIDOkpp71
	es+UogMUOn0764Yi7vNhxDwPl79q6afTDlnCyAotAik6xG+Y1VPKAwkkmw8RsmetDKU6jrkd7T5
	WalMRw4tirr127qujro6OCoJ3dvo=
X-Google-Smtp-Source: AGHT+IFX9InS0m5iSp2zaKYOot2K73ozxV2qEPybxlB1qu1bQh/pSEPrPDrbylYN35fFebqUBLJvISMG0bkctzPY+Rs=
X-Received: by 2002:a05:6512:12c2:b0:512:f409:7a5c with SMTP id
 p2-20020a05651212c200b00512f4097a5cmr338702lfg.0.1708763873132; Sat, 24 Feb
 2024 00:37:53 -0800 (PST)
MIME-Version: 1.0
References: <20240223191859.6912-1-simone.p.weiss@posteo.com>
 <48aaddfb9f0faf22a75bf9fe775ef819765db3d5.camel@linuxfoundation.org> <2d82dbf32da0f7ccaeae72eadc6ce5c32eb02376.camel@posteo.net>
In-Reply-To: <2d82dbf32da0f7ccaeae72eadc6ce5c32eb02376.camel@posteo.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 24 Feb 2024 09:37:41 +0100
Message-ID: <CANNYZj8rnVMzu0iuMymxy85nvxMmr-xoTXHeCcm9dX_owDDXzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxml2: Upgrade 2.11.5 -> 2.12.5
To: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.weiss@posteo.net>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 08:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196123

You should perhaps check if latest webkitgtk release has a fix, and
simply update to that.

Alex

On Sat, 24 Feb 2024 at 09:13, Simone Wei=C3=9F <simone.weiss@posteo.net> wr=
ote:
>
> On Sat, 2024-02-24 at 07:43 +0000, Richard Purdie wrote:
> > On Fri, 2024-02-23 at 19:18 +0000, Simone Wei=C3=9F wrote:
> > > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > >
> > > Upgraded to address CVE-2024-25062
> > >
> > > License-Update: hash.c was rewritten and now also has MIT license,
> > > trio was totally removed, hence remove license checksum as well.
> > > Files are not mentioned as exception in overall license any more,
> > > therefore, checksum changed there as well.
> > >
> > > Previous upgrades of libxml2 caused issues when building libsoup,
> > > this in the meantime has been adressed via commit "9f57bfb74e280827"
> > > ("libsoup-2.4: Fix build with clang-17 and libxml2-2.12") already.
> > >
> > > Changes:
> > > - [CVE-2024-25062] xmlreader: Don't expand XIncludes when backtrackin=
g
> > > - parser: Fix crash in xmlParseInNodeContext with HTML documents
> > >
> > > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > > ---
> > >  meta/recipes-core/libxml/libxml2/install-tests.patch      | 8 ++++--=
-
> > > -
> > >  .../libxml/{libxml2_2.11.5.bb =3D> libxml2_2.12.5.bb}       | 8 +++-=
---
> > > -
> > >  2 files changed, 7 insertions(+), 9 deletions(-)
> > >  rename meta/recipes-core/libxml/{libxml2_2.11.5.bb =3D>
> > > libxml2_2.12.5.bb} (91%)
> > >
> > > diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch
> > > b/meta/recipes-core/libxml/libxml2/install-tests.patch
> > > index 14ccce5873..4bddf9f05e 100644
> > > --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> > > +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> > > @@ -1,4 +1,4 @@
> > > -From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00
> > > 2001
> > > +From 582af12c9e89cd3d7c93c63756acb6e8180a776c Mon Sep 17 00:00:00
> > > 2001
> > >  From: Ross Burton <ross.burton@arm.com>
> > >  Date: Mon, 5 Dec 2022 17:02:32 +0000
> > >  Subject: [PATCH] add yocto-specific install-ptest target
> > > @@ -13,11 +13,11 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
> > >   1 file changed, 10 insertions(+)
> > >
> > >  diff --git a/Makefile.am b/Makefile.am
> > > -index 5bc4018..57d27af 100644
> > > +index 0a49d37..1097c63 100644
> > >  --- a/Makefile.am
> > >  +++ b/Makefile.am
> > > -@@ -26,6 +26,16 @@ check_PROGRAMS =3D \
> > > -       testlimits \
> > > +@@ -27,6 +27,16 @@ check_PROGRAMS =3D \
> > > +       testparser \
> > >         testrecurse
> > >
> > >  +ptestdir=3D$(libexecdir)
> > > diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb
> > > b/meta/recipes-core/libxml/libxml2_2.12.5.bb
> > > similarity index 91%
> > > rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
> > > rename to meta/recipes-core/libxml/libxml2_2.12.5.bb
> > > index 44336c25e1..01e23b21cc 100644
> > > --- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
> > > +++ b/meta/recipes-core/libxml/libxml2_2.12.5.bb
> > > @@ -4,10 +4,8 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libxml2=
"
> > >  BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibx=
ml2"
> > >  SECTION =3D "libs"
> > >  LICENSE =3D "MIT"
> > > -LIC_FILES_CHKSUM =3D
> > > "file://Copyright;md5=3D2044417e2e5006b65a8b9067b683fcf1 \
> > > -
> > > file://hash.c;beginline=3D6;endline=3D15;md5=3De77f77b12cb69e203d8b40=
90a0eee879
> > >  \
> > > -
> > > file://list.c;beginline=3D4;endline=3D13;md5=3Db9c25b021ccaf287e50060=
602d20f3a7
> > >  \
> > > -
> > > file://trio.c;beginline=3D5;endline=3D14;md5=3Dcd4f61e27f88c1d43df112=
966b1cd28f
> > > "
> > > +LIC_FILES_CHKSUM =3D
> > > "file://Copyright;md5=3Dfec7ecfe714722b2bb0aaff7d200c701 \
> > > +
> > > file://list.c;beginline=3D4;endline=3D13;md5=3Db9c25b021ccaf287e50060=
602d20f3a7
> > > "
> > >
> > >  DEPENDS =3D "zlib virtual/libiconv"
> > >
> > > @@ -19,7 +17,7 @@ SRC_URI +=3D
> > > "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP};name=3Dt=
estt
> > >             file://install-tests.patch \
> > >             "
> > >
> > > -SRC_URI[archive.sha256sum] =3D
> > > "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
> > > +SRC_URI[archive.sha256sum] =3D
> > > "a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21"
> > >  SRC_URI[testtar.sha256sum] =3D
> > > "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
> > >
> > >  # Disputed as a security issue, but fixed in d39f780
> > >
> >
> > Unfortunately this upgrade breaks webkitgtk:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8480/=
steps/11/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4416=
/steps/12/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/8643/=
steps/11/logs/stdio
> >
> > and so on.
> >
> > Cheers,
> >
> Argh sorry, I understood that only libsoup was an issue. I will propose a
> patch to webkitgtk and fix it there, then backport and finally upgrade
> this...
> > Richard
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196121): https://lists.openembedded.org/g/openembedde=
d-core/message/196121
> Mute This Topic: https://lists.openembedded.org/mt/104534962/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

