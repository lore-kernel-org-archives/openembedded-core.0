Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA54FA3751
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 13:14:20 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.73011.1726233254356512995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 06:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PQxU4GKc;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6c49c9018ebso19010047b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726233253; x=1726838053; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lExBHVJlXN2G7nLb9JdU6546fof1Nw0MUk8tIGgjz1s=;
        b=PQxU4GKcO1D59v4gqkMsneVACnC9NrEW3RDbSD4U/0/eOwM7ZSWMcysJ2FS7giMlVd
         37ngcVZ0kNUq8Qum74A5rkSiZifWDVtPzeQoUaggyHwaHYc8wxG4uID2rSPAueUr/Mos
         hspyPyg55rAUFsGrm+ILAvGpiwwoGuhIp28kvANnJ51AfY/llym2gSsKyvXupVbjd+RH
         iHAzymt0nyrWImSdUGHNTt1FF6OSWPpvPJ2uwBQwmi6rHf6sjA1eGIL10+Tg3igNsMXP
         4d+rqdqZq17IO3dppzpPGlnIOB4reRa/VYzAhVrdwhr+GqDbdJlGSRW862wkQihfhxjt
         I7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726233253; x=1726838053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lExBHVJlXN2G7nLb9JdU6546fof1Nw0MUk8tIGgjz1s=;
        b=XnFzUdeRDPvCKwR52foKu+fIpWzWc68IGjaCHmyPaGuaNJJEJkWVS16+5p1f8vEAdg
         +h//iOTBqqwjIpn0vCip2Y7DCNVKBriAXjTKBi/wVXuiiTEcLc2Ao0MVs2OC5RpE1Va9
         Lp54cZ2EZEZSkOJVtdER13/FIyJf1N6wJH6xOEYvwqq9EXCr9kmvXySMhEJn+zLyxhpF
         05STIpPymZkLoLOwTm82huxDz2ofhOBNA6mFPWmdpSOyBPY6VSrRijy9ckD5ElhExYcQ
         TKNTOmvJX2YQHfC9xLAAHpgtXUhaX5/xS3D5RQn7YjuuooX98TUZAJweKnknNTQm4Qzr
         G+dQ==
X-Gm-Message-State: AOJu0YyVYt7yGpZDvHPhq60yAbW+jXhtdsUn4tGU+8AYGZJBKAhyfhrF
	Svq1qwJV5al+lWIYTAtZO+BokbOOdqeb+hrOdFtAz7ipVnTCH+PoEaY/CZvADMOzd1tToVjM+kF
	kCbdY71fjLzIFLDSkzsk7oxmwZM4AupIUbYxyaA==
X-Google-Smtp-Source: AGHT+IEwl2AyK0+VTIW4l6PCMTHR1y8x/q0ea6Yx7L4Ksfownu5r7qJwLR/LH0/En+QVGlp/IywHv8VX7Uf3FkBtNI0=
X-Received: by 2002:a05:690c:6887:b0:6d3:92c6:a006 with SMTP id
 00721157ae682-6dbb6b07938mr59738487b3.15.1726233253345; Fri, 13 Sep 2024
 06:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240912225741.2147108-1-yoann.congal@smile.fr> <CAMSfU+6UFNDFb7LUULAryQn2cZE9y4dprmoWaMOLEwsyC4Sfow@mail.gmail.com>
In-Reply-To: <CAMSfU+6UFNDFb7LUULAryQn2cZE9y4dprmoWaMOLEwsyC4Sfow@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 13 Sep 2024 06:14:02 -0700
Message-ID: <CAOSpxdbSGNiVT9cFDSkC0kAqGgHpugk6DnAHyGrnjAur1bYtGw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] cve-exclusion: Drop the version comparision/warning
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 13:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204483

On Thu, Sep 12, 2024 at 11:35=E2=80=AFPM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> Le ven. 13 sept. 2024 =C3=A0 00:59, Yoann Congal <yoann.congal@smile.fr> =
a =C3=A9crit :
> >
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Since the CVE repository is no longer being updated, drop the warning
> > comparision since it is no longer valid.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 9a232a9c3023dfec7e2d2c7e384d64006d1cf1af)
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > Backport: Applied the idea of the original patch to the corresponding
> > files.
> > ---
>
> Maybe I should have added that this is to avoid the warning on every
> kirkstone metrics AB run :
> https://autobuilder.yoctoproject.org/typhoon/#/builders/138/builds/2234

Is this version to be preferred to the one that is currently out for review=
?

https://lists.openembedded.org/g/openembedded-core/message/204408

Thanks!

Steve

>
> >
> >  meta/recipes-kernel/linux/cve-exclusion_5.10.inc | 14 +++++++-------
> >  meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 14 +++++++-------
> >  2 files changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc b/meta/re=
cipes-kernel/linux/cve-exclusion_5.10.inc
> > index 4d959c90b1..4ce0664c0d 100644
> > --- a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
> > +++ b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
> > @@ -2,13 +2,13 @@
> >  # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
> >  # Generated at 2024-02-21 03:55:27.305577 for version 5.10.209
> >
> > -python check_kernel_cve_status_version() {
> > -    this_version =3D "5.10.209"
> > -    kernel_version =3D d.getVar("LINUX_VERSION")
> > -    if kernel_version !=3D this_version:
> > -        bb.warn("Kernel CVE status needs updating: generated for %s bu=
t kernel is %s" % (this_version, kernel_version))
> > -}
> > -do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
> > +#python check_kernel_cve_status_version() {
> > +#    this_version =3D "5.10.209"
> > +#    kernel_version =3D d.getVar("LINUX_VERSION")
> > +#    if kernel_version !=3D this_version:
> > +#        bb.warn("Kernel CVE status needs updating: generated for %s b=
ut kernel is %s" % (this_version, kernel_version))
> > +#}
> > +#do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
> >
> >  # fixed-version: Fixed after version 2.6.12rc2
> >  CVE_CHECK_IGNORE +=3D "CVE-2003-1604"
> > diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/re=
cipes-kernel/linux/cve-exclusion_5.15.inc
> > index f5ccf2bc22..1f5c783db4 100644
> > --- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
> > +++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
> > @@ -2,13 +2,13 @@
> >  # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
> >  # Generated at 2024-05-02 12:18:54.390781 for version 5.15.157
> >
> > -python check_kernel_cve_status_version() {
> > -    this_version =3D "5.15.157"
> > -    kernel_version =3D d.getVar("LINUX_VERSION")
> > -    if kernel_version !=3D this_version:
> > -        bb.warn("Kernel CVE status needs updating: generated for %s bu=
t kernel is %s" % (this_version, kernel_version))
> > -}
> > -do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
> > +#python check_kernel_cve_status_version() {
> > +#    this_version =3D "5.15.157"
> > +#    kernel_version =3D d.getVar("LINUX_VERSION")
> > +#    if kernel_version !=3D this_version:
> > +#        bb.warn("Kernel CVE status needs updating: generated for %s b=
ut kernel is %s" % (this_version, kernel_version))
> > +#}
> > +#do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
> >
> >  # fixed-version: Fixed after version 2.6.12rc2
> >  CVE_CHECK_IGNORE +=3D "CVE-2003-1604"
>
>
>
> --
> Yoann Congal
> Smile ECS - Tech expert
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204471): https://lists.openembedded.org/g/openembedde=
d-core/message/204471
> Mute This Topic: https://lists.openembedded.org/mt/108422982/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

