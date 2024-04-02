Return-Path: <cordlandwehr@kde.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862B5CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 19:20:14 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web11.4590.1712085605427782528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 12:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kde.org header.s=users header.b=nEvbo8nL;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from rhuidean.localnet (p200300e27f09d20034c29e0c77add2f5.dip0.t-ipconnect.de [IPv6:2003:e2:7f09:d200:34c2:9e0c:77ad:d2f5])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id 1281033F502;
	Tue,  2 Apr 2024 20:20:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1712085602; bh=BNbg0uwgbh+LCY2oGySkwQP//xIYfdD4daxDXDC1bSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nEvbo8nLbWOIpjdxwRV0KFmW5CUIA1VcHVmw2XSI1lKTooSEwecMPZm/bJt+PuVji
	 bcFr8ohTVQUg+PIJ0D1InnIwJqkoINdlLiuYTot7PRdIeYTF/OltX/kSaNg6wU3n1b
	 zcTExK9Y5stEDTFV1DWTBQj9ZPR+x1+tpKccQYSiPl/N4nNSuPRxbCXwdTGHxO+DvS
	 6f4aWgrIwSrT0fbtyG0svrsHmocwir9cT9/GxYtHUEuGtboxdWWFklfnyGFcPM/wGw
	 2kzNNC0wALVyElkLDz9vOy4NNWQDhTM7joSVf202zf9S25wKq40Tq8PIz9BS04tZsd
	 54E+4hS9QwUuA==
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: 
 Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-good: Provide Qt6 option for
 qmlgl
Date: Tue, 02 Apr 2024 21:20:01 +0200
Message-ID: <13796333.uLZWGnKmhe@rhuidean>
In-Reply-To: 
 <CANNYZj_JJku5DvQXL3njGkR9h1SoBFA2W+b7yooMR9cXPNaiKw@mail.gmail.com>
References: 
 <20240401071355.1702280-1-cordlandwehr@kde.org>
 <CANNYZj_JJku5DvQXL3njGkR9h1SoBFA2W+b7yooMR9cXPNaiKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3241987.e9J7NaK4W3";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 19:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197879

--nextPart3241987.e9J7NaK4W3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 02 Apr 2024 21:20:01 +0200
Message-ID: <13796333.uLZWGnKmhe@rhuidean>
MIME-Version: 1.0

Hi Alex, thanks for your answer! I raised this topic also upstream in

https://github.com/mesonbuild/meson/issues/13018

Regarding the way meson finds native binaries, do you have an example how this 
is done in Yocto specifically how meson is pointed to the recipe-sysroot-
native? All I could find was pkg-config but that has a special native pc file as 
far as I see.

Cheers,
Andreas

On Tuesday, April 2, 2024 8:26:48 PM CEST Alexander Kanavin wrote:
> meson does have a way to specify whether native pkg-config should be
> used (defaulting to cross), so I think this should rather be fixed in
> gstreamer source, particularly its meson files?
> 
> Alex
> 
> On Mon, 1 Apr 2024 at 09:14, Andreas Cord-Landwehr <cordlandwehr@kde.org> 
wrote:
> > Introduce PACKAGECONFIG option for Qt6 and provide meson cross-build
> > file that helps meson to locate qt native binaries.
> > 
> > Qt provides pkg-config files since Qt6.3+, but those files are not
> > sufficient to detect native tools that are located in the
> > recipe-sysroot-native location, because pkg-config does not know about
> > the location of them. Thus, introduce a helper config that points mesons
> > to those binaries.
> > 
> > Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> > ---
> > 
> >  .../gstreamer1.0-plugins-good_1.22.11.bb       | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git
> > a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
> > b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
> > index edd8609b7c..3b95bd6e46 100644
> > ---
> > a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
> > +++
> > b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
> > @@ -12,6 +12,17 @@ SRC_URI[sha256sum] =
> > "6ddd032381827d31820540735f0004b429436b0bdac19aaeab44fa22fa> 
> >  S = "${WORKDIR}/gst-plugins-good-${PV}"
> > 
> > +do_write_config:append() {
> > +    cat >${WORKDIR}/meson-qt6.cross <<EOF
> > +[binaries]
> > +qmake = '${STAGING_BINDIR_NATIVE}/qmake'
> > +moc = '${STAGING_DIR_NATIVE}/usr/libexec/moc'
> > +rcc = '${STAGING_DIR_NATIVE}/usr/libexec/rcc'
> > +uic = '${STAGING_DIR_NATIVE}/usr/libexec/uic'
> > +lrelease = '${STAGING_BINDIR_NATIVE}/lrelease'
> > +EOF
> > +}
> > +
> > 
> >  LICENSE = "LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
> >  
> >                      file://gst/replaygain/rganalysis.c;beginline=1;endlin
> >                      e=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"> 
> > @@ -35,7 +46,7 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes
> > libxdamage"> 
> >  X11ENABLEOPTS = "-Dximagesrc=enabled -Dximagesrc-xshm=enabled
> >  -Dximagesrc-xfixes=enabled -Dximagesrc-xdamage=enabled" X11DISABLEOPTS =
> >  "-Dximagesrc=disabled -Dximagesrc-xshm=disabled
> >  -Dximagesrc-xfixes=disabled -Dximagesrc-xdamage=disabled"> 
> > -QT5WAYLANDDEPENDS = "${@bb.utils.contains("DISTRO_FEATURES", "wayland",
> > "qtwayland", "", d)}" +QTWAYLANDDEPENDS =
> > "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"> 
> >  PACKAGECONFIG[asm]        = "-Dasm=enabled,-Dasm=disabled,nasm-native"
> >  PACKAGECONFIG[bz2]        = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
> > 
> > @@ -52,7 +63,8 @@ PACKAGECONFIG[libpng]     =
> > "-Dpng=enabled,-Dpng=disabled,libpng"> 
> >  PACKAGECONFIG[libv4l2]    =
> >  "-Dv4l2-libv4l2=enabled,-Dv4l2-libv4l2=disabled,v4l-utils"
> >  PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
> >  PACKAGECONFIG[pulseaudio] =
> >  "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"> 
> > -PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase
> > qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}" +PACKAGECONFIG[qt5]    
> >    = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native
> > ${QTWAYLANDDEPENDS}" +PACKAGECONFIG[qt6]        =
> > "-Dqt6=enabled,-Dqt6=disabled,qtbase qtdeclarative qtbase-native
> > qttools-native ${QTWAYLANDDEPENDS}"> 
> >  PACKAGECONFIG[soup2]      = "-Dsoup=enabled,,libsoup-2.4,,,soup3"
> >  PACKAGECONFIG[soup3]      = "-Dsoup=enabled,,libsoup,,,soup2"
> >  PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
> > 
> > @@ -78,4 +90,6 @@ EXTRA_OEMESON += " \
> > 
> >      -Dwaveform=disabled \
> >  
> >  "
> > 
> > +MESON_CROSS_FILE:class-target:append =
> > "${@bb.utils.contains('PACKAGECONFIG', 'qt6', ' --cross
> > ${WORKDIR}/meson-qt6.cross', '', d)}" +
> > 
> >  FILES:${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
> > 
> > --
> > 2.40.1
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197673):
> > https://lists.openembedded.org/g/openembedded-core/message/197673 Mute
> > This Topic: https://lists.openembedded.org/mt/105259530/1686489 Group
> > Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [alex.kanavin@gmail.com] -=-=-=-=-=-=-=-=-=-=-=-

--nextPart3241987.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEExYaxXEZad4TcMo54nYpo6tgYwvMFAmYMWmEACgkQnYpo6tgY
wvNrOQf/fgJnBk5/aYnoXHUz/bwaMClg5BZbZpvfy/ywqBiCP7d986fNrrxiFkxF
Pb8IeqLLwREC7f1G1G/dr5/VixLFSjtzl9ao7GdUMpHY4PqhgrOrHFgoTr1yuLVO
rtdNsJ7JEgfpBb0/3QKUNylTXSGKrcnuJTTYaxg0rsCS0JBCvVZnED7lur5i5JN0
puD8EuSj/fKDmV+zAGXirzNDp//sxStQdo0LNcjPGBVtTIVsXMZKwsmRVdJPPX0f
VEDs+XleybIALqg90786nYfvXaOxoZf373INVn7fRm1KXRnP3uRJOrk0jvAvajLM
1Li+BJfjBylx8gjTihYLse15RBW5Og==
=ubl0
-----END PGP SIGNATURE-----

--nextPart3241987.e9J7NaK4W3--




