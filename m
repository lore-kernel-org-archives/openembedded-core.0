Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80F0E92FC0
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 21:14:44 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.27598.1696540482623005252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 14:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MCb4pPFx;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6c4cbab83aaso915768a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696540482; x=1697145282; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKkCq0aqK4MN55d/hLp/bq7CQyagKZEkTv3+dnOdIBQ=;
        b=MCb4pPFx/bXp5W+p4TIgqUVcFig5H18d3ShyeqAY9DiWm6vY+NJntuE1smBxgmcm3m
         b9WA+FiVYExdTH68QyjGo0RvlD3VJO+lYtfFvH8FbrOgSYKIIqRbp5Gz4K6q5qfvKj7G
         k0jYromk5lQy2NGzRqYe4irT15FOcTqolksZcgWZLw5I2gvqOcTl1f4xtyfjkGBdOoB4
         3/mVQC+34qzToaZIFBANKlj21i9FCw1/yQK1huakQfW8SBrA9qfxN7R4GSiCdzs722mV
         8jr5mVUxjT9R9qnvHl4OSW30AW+sImqJ86eM0WIW6CAVaq/YhSq+GrIJCgj9ozWgaI2b
         sIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696540482; x=1697145282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKkCq0aqK4MN55d/hLp/bq7CQyagKZEkTv3+dnOdIBQ=;
        b=nKyquUbtQq4kRckVNgFTk8yGq6rdrFdbffAcb4YTPkJ1fOsN8Asy3IlyaUrgY01NMZ
         WaM8VQU9F1hs84f4IM1UnF35pgPVx0DQabg0iwK+OGvSgtR397GArS3CLhg2aFJ9UI7O
         6/VMMlFbvlL8jO2UPvBxAcZFvwrQYgRteo+i8Vt/YplI+3/mS+mpRd161xRGzV02b3x8
         MYN4W0W62hBOJr33uzw7CXyOhqXT+eNM57/SCpgOeJ4XJ6YOrhgc6Xm35CBFwpli+3q/
         QGCWxUBicceYtY8GQqiDjHbbGiiLw2PPsYM5MUPo5jExUZAWb1sWzxMYOLupB+ZAOikJ
         umAw==
X-Gm-Message-State: AOJu0YwTnENC+d87f8yB0Ozo2UixEEs9STkRkdAK6b2tdbr7IF/H/BCB
	Eu/p3dqFmuS4i8EUa0yKmeMqBGhb8Vw1pdmuCsI=
X-Google-Smtp-Source: AGHT+IGJ9HR5AKOkOnmZXi3PXxX26y/Sj1QuGDuaTH6TgNrnRmQluq4w2VUlqft8G1rzG8ltzGq/Qls+ndUyqOHlqTE=
X-Received: by 2002:a05:6870:1691:b0:1d5:a3f5:e93 with SMTP id
 j17-20020a056870169100b001d5a3f50e93mr7492066oae.17.1696540481763; Thu, 05
 Oct 2023 14:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231004160911.3030063-1-cordlandwehr@kde.org>
 <CAMKF1sqiRKyQ7sHf4-OLBkyY7XMWXbES_X7_XJPOS3fVrsRn9Q@mail.gmail.com>
 <7fcb07f0-8e69-ab0e-38c6-94ff96c074f4@kde.org> <286cafdd87626ede7916db899e1676484b79505c.camel@linuxfoundation.org>
 <ad4a6362-22ff-f53c-3742-e66ccb8d7183@kde.org> <c8566a503c49903303cbae463b33e775a16ba0b3.camel@linuxfoundation.org>
In-Reply-To: <c8566a503c49903303cbae463b33e775a16ba0b3.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Oct 2023 14:14:15 -0700
Message-ID: <CAMKF1spS-petzm95Xdh2K75RSJnw1uUZWvEVLF7Q7O-Ua1smXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: Provide Qt6 option
 for qmlgl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andreas Cord-Landwehr <cordlandwehr@kde.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 21:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188740

On Thu, Oct 5, 2023 at 12:27=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-10-05 at 21:22 +0200, Andreas Cord-Landwehr wrote:
> > On 04.10.23 20:42, Richard Purdie wrote:
> > > On Wed, 2023-10-04 at 20:19 +0200, Andreas Cord-Landwehr wrote:
> > > > On 04.10.23 20:10, Khem Raj wrote:
> > > > > On Wed, Oct 4, 2023 at 9:09=E2=80=AFAM Andreas Cord-Landwehr
> > > > > <cordlandwehr@kde.org> wrote:
> > > > > >
> > > > > > Gstreamer release 1.22.0 introduced option for Qt6 API.
> > > > > >
> > > > > > Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> > > > > > ---
> > > > > >    .../gstreamer/gstreamer1.0-plugins-good_1.22.5.bb      | 10 =
++++++++--
> > > > > >    1 file changed, 8 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plu=
gins-good_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good_1.22.5.bb
> > > > > > index 93f0e76ee9..ca1e1d6046 100644
> > > > > > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od_1.22.5.bb
> > > > > > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od_1.22.5.bb
> > > > > > @@ -35,7 +35,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrend=
er libxfixes libxdamage"
> > > > > >    X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3D=
enabled -Dximagesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
> > > > > >    X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=
=3Ddisabled -Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
> > > > > >
> > > > > > -QT5WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES",=
 "wayland", "qtwayland", "", d)}"
> > > > > > +QTWAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", =
"wayland", "qtwayland", "", d)}"
> > > > > >
> > > > > >    PACKAGECONFIG[asm]        =3D "-Dasm=3Denabled,-Dasm=3Ddisab=
led,nasm-native"
> > > > > >    PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisab=
led,bzip2"
> > > > > > @@ -52,7 +52,8 @@ PACKAGECONFIG[libpng]     =3D "-Dpng=3Denable=
d,-Dpng=3Ddisabled,libpng"
> > > > > >    PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,-Dv4=
l2-libv4l2=3Ddisabled,v4l-utils"
> > > > > >    PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=
=3Ddisabled,mpg123"
> > > > > >    PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Dd=
isabled,pulseaudio"
> > > > > > -PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisable=
d,qtbase qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
> > > > > > +PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisable=
d,qtbase qtdeclarative qtbase-native ${QTWAYLANDDEPENDS}"
> > > > > > +PACKAGECONFIG[qt6]        =3D "-Dqt6=3Denabled,-Dqt6=3Ddisable=
d,qtbase qtdeclarative qtbase-native qttools-native ${QTWAYLANDDEPENDS}"
> > > > > >    PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4=
,,,soup3"
> > > > > >    PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,s=
oup2"
> > > > > >    PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Dd=
isabled,speex"
> > > > > > @@ -79,3 +80,8 @@ EXTRA_OEMESON +=3D " \
> > > > > >    "
> > > > > >
> > > > > >    FILES:${PN}-equalizer +=3D "${datadir}/gstreamer-1.0/presets=
/*.prs"
> > > > > > +
> > > > > > +do_configure:prepend() {
> > > > > > +    # provide path to qtwaylandscanner
> > > > > > +    export PATH=3D${PATH}:${STAGING_DIR_NATIVE}/${libexecdir}
> > > > >
> > > > > perhaps we should fix naitve qt6 to install qtwaylandscanner in n=
ative
> > > > > bindir. Then we do not need this.
> > > >
> > > > Hi, I brought this up recently in a different discussion
> > > >
> > > > https://bugreports.qt.io/browse/QTBUG-116998
> > > >
> > > > My understanding is that the move was deliberate and the expectatio=
n is
> > > > that everybody uses the CMake macros with internal path logic; howe=
ver,
> > > > that fails when not using CMake like here with Meson.
> > >
> > > There isn't anything stopping OE from symlinking it in it's recipe?
> > >
> > > Cheers,
> > >
> > > Richard
> >
> > Hi Richard,
> >
> > thanks for you answer! Since qtwayland is part of meta-qt6, do I get
> > your comment correct that you suggest creating a symlink
> > /usr/bin/qtwaylandscanner -> /usr/libexec/qtwaylandscanner
> > for the gstreamer1.0-plugins-good recipe or do you have patching of
> > qtwayland in mind?
>
> I was suggesting you ask meta-qt6 about the idea of the symlink in
> their recipe. I didn't know if meta-qt6 was being handled by qt.io or
> not though. I may have misunderstood and it is the meta-qt6 people
> saying gstreamer are doing it "wrong" in which case this is indeed more
> tricky :(.

yeah creating a symlink in meta-qt6 should be quick and easy solution.

>
> Cheers,
>
> Richard

