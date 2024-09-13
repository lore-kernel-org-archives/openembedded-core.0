Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95A5FA374F
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 13:19:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.73112.1726233551493891572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 06:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wbU+RSiX;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb806623eso19625155e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1726233550; x=1726838350; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRuCI3GaE3WkEyA3US4haTybkpARRA1ICShiOJFhUzU=;
        b=wbU+RSiXKCROengWQanVDWhAzQ6Ox2gDWQdQDHkeBZRfg9JLTWaw+b5yoAFnhf1ukd
         KIr5Dl+Jt3dOyvHxfwA5/OAbMBvo0DgRPlNJ2UN7+CuEyOij9GND+uzmnXkSxue9oiCs
         7Q/lr2aLQZSKRMltMxzEXMtrS+qK3HbnCWciw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726233550; x=1726838350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRuCI3GaE3WkEyA3US4haTybkpARRA1ICShiOJFhUzU=;
        b=XdmeyZmbIOBYPmqSHo8ALU/RysAM9RpCnFqWmcZMXVIYnSl1dKR6/YmF6kM0+xc58f
         fN7DkeozmNOf2RrFSdcX1HUiwh4MnvdXTthAUovBscqq7zajX1AqBMdjpvKQqRSSkzkg
         Uf8Di9gJ7tJBwTMl5OZ5cv1woqPIzBywW1pi81H+tL7SNbHfgZwtA23j5ZpYFdkJlYvY
         0LXFVtqq69HaHEI7SJ7cFLQ4+hV0xViAifMpmSnFxrQwYPBrVHgaAotWuZuVEGGZskjv
         rWrSuUqEQwAdZFMTA7pbqz75uUxoELy+COhsxwIDkVPVCNWPLDCqgKaSNzuJ03pNV5iU
         dnhQ==
X-Gm-Message-State: AOJu0YwK8XafNEMjIbaQ/dtEUKjU8SiHZTyNk953Rhq5SaNGekQcrh12
	Tz+AeR/+x8K6QyN2ULTAGBmUlzkWq+n7P/Ivu6SwENlotQgzFyBHo4IZbs0bv3pQtRMYrdSDOGQ
	6UqRcmTnCv0fTENfYTCOc4x1wYmMLRIHU2ql7Qw==
X-Google-Smtp-Source: AGHT+IG2laO0mvYFX9C539CUfv0Teexi7QMfh6Vmp5m1kGPhfzxm66Re3qvSLkcklD8qxoLxbttPQFMHMdPS247wP8Q=
X-Received: by 2002:a05:6000:1f89:b0:374:c040:b00e with SMTP id
 ffacd0b85a97d-378c2d5a827mr3862035f8f.39.1726233549131; Fri, 13 Sep 2024
 06:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240912225741.2147108-1-yoann.congal@smile.fr>
 <CAMSfU+6UFNDFb7LUULAryQn2cZE9y4dprmoWaMOLEwsyC4Sfow@mail.gmail.com> <CAOSpxdbSGNiVT9cFDSkC0kAqGgHpugk6DnAHyGrnjAur1bYtGw@mail.gmail.com>
In-Reply-To: <CAOSpxdbSGNiVT9cFDSkC0kAqGgHpugk6DnAHyGrnjAur1bYtGw@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 13 Sep 2024 15:18:43 +0200
Message-ID: <CAMSfU+6HYE3hLCkxHOwv+4hrd9tZNXwYMhBKA6sdvuaJvbcrGw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] cve-exclusion: Drop the version comparision/warning
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 13:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204484

Le ven. 13 sept. 2024 =C3=A0 15:14, Steve Sakoman <steve@sakoman.com> a =C3=
=A9crit :
>
> On Thu, Sep 12, 2024 at 11:35=E2=80=AFPM Yoann Congal via
> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
> wrote:
> >
> > Le ven. 13 sept. 2024 =C3=A0 00:59, Yoann Congal <yoann.congal@smile.fr=
> a =C3=A9crit :
> > >
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >
> > > Since the CVE repository is no longer being updated, drop the warning
> > > comparision since it is no longer valid.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit 9a232a9c3023dfec7e2d2c7e384d64006d1cf1af)
> > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > > Backport: Applied the idea of the original patch to the corresponding
> > > files.
> > > ---
> >
> > Maybe I should have added that this is to avoid the warning on every
> > kirkstone metrics AB run :
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/138/builds/2234
>
> Is this version to be preferred to the one that is currently out for revi=
ew?
>
> https://lists.openembedded.org/g/openembedded-core/message/204408

Ahh I missed it.
Both have the same content, no reason to prefer mine over Alexandre
Belloni's so you can ignore mine.

Thanks!


> Thanks!
>
> Steve
>
> >
> > >
> > >  meta/recipes-kernel/linux/cve-exclusion_5.10.inc | 14 +++++++-------
> > >  meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 14 +++++++-------
> > >  2 files changed, 14 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc b/meta/=
recipes-kernel/linux/cve-exclusion_5.10.inc
> > > index 4d959c90b1..4ce0664c0d 100644
> > > --- a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
> > > +++ b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
> > > @@ -2,13 +2,13 @@
> > >  # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
> > >  # Generated at 2024-02-21 03:55:27.305577 for version 5.10.209
> > >
> > > -python check_kernel_cve_status_version() {
> > > -    this_version =3D "5.10.209"
> > > -    kernel_version =3D d.getVar("LINUX_VERSION")
> > > -    if kernel_version !=3D this_version:
> > > -        bb.warn("Kernel CVE status needs updating: generated for %s =
but kernel is %s" % (this_version, kernel_version))
> > > -}
> > > -do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
> > > +#python check_kernel_cve_status_version() {
> > > +#    this_version =3D "5.10.209"
> > > +#    kernel_version =3D d.getVar("LINUX_VERSION")
> > > +#    if kernel_version !=3D this_version:
> > > +#        bb.warn("Kernel CVE status needs updating: generated for %s=
 but kernel is %s" % (this_version, kernel_version))
> > > +#}
> > > +#do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
> > >
> > >  # fixed-version: Fixed after version 2.6.12rc2
> > >  CVE_CHECK_IGNORE +=3D "CVE-2003-1604"
> > > diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/=
recipes-kernel/linux/cve-exclusion_5.15.inc
> > > index f5ccf2bc22..1f5c783db4 100644
> > > --- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
> > > +++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
> > > @@ -2,13 +2,13 @@
> > >  # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
> > >  # Generated at 2024-05-02 12:18:54.390781 for version 5.15.157
> > >
> > > -python check_kernel_cve_status_version() {
> > > -    this_version =3D "5.15.157"
> > > -    kernel_version =3D d.getVar("LINUX_VERSION")
> > > -    if kernel_version !=3D this_version:
> > > -        bb.warn("Kernel CVE status needs updating: generated for %s =
but kernel is %s" % (this_version, kernel_version))
> > > -}
> > > -do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
> > > +#python check_kernel_cve_status_version() {
> > > +#    this_version =3D "5.15.157"
> > > +#    kernel_version =3D d.getVar("LINUX_VERSION")
> > > +#    if kernel_version !=3D this_version:
> > > +#        bb.warn("Kernel CVE status needs updating: generated for %s=
 but kernel is %s" % (this_version, kernel_version))
> > > +#}
> > > +#do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
> > >
> > >  # fixed-version: Fixed after version 2.6.12rc2
> > >  CVE_CHECK_IGNORE +=3D "CVE-2003-1604"
> >
> >
> >
> > --
> > Yoann Congal
> > Smile ECS - Tech expert
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#204471): https://lists.openembedded.org/g/openembed=
ded-core/message/204471
> > Mute This Topic: https://lists.openembedded.org/mt/108422982/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Yoann Congal
Smile ECS - Tech expert

