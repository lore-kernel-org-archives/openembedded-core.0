Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BE4ECE582
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 08:45:21 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.18359.1725957918895589972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 01:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1snwUv-0005Wc-9w; Tue, 10 Sep 2024 10:45:17 +0200
Message-ID: <4f6f8ac030656c18edb7972c5d8e6f0574683daa.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v4 2/7] barebox-tools: add initial barebox
 tools support
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Tue, 10 Sep 2024 10:45:16 +0200
In-Reply-To: <CANNYZj_zpBOjperL-mxO+D5rEM768Sed8VFohUkTJbnR6piDNQ@mail.gmail.com>
References: <20240910072006.3938401-1-ejo@pengutronix.de>
	 <20240910072006.3938401-3-ejo@pengutronix.de>
	 <CANNYZj_zpBOjperL-mxO+D5rEM768Sed8VFohUkTJbnR6piDNQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 08:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204342

Hi Alex,

Am Dienstag, dem 10.09.2024 um 10:37 +0200 schrieb Alexander Kanavin:
> Can this be merged into the main barebox recipe? Does it need a separate =
recipe?

not only that it would complicate the main recipe (we had tried this before=
), but I really see no
point in doing and supporting barebox native builds (in contrast to barebox=
-tools).

And some of these tools might also be useful without using barebox.

I guess u-boot-tools is separate for similar reasons.

Regards, Enrico

> Alex
>=20
> On Tue, 10 Sept 2024 at 09:21, Enrico J=C3=B6rns via lists.openembedded.o=
rg
> <ejo=3Dpengutronix.de@lists.openembedded.org> wrote:
> >=20
> > From: Marco Felsch <m.felsch@pengutronix.de>
> >=20
> > Add initial support to build the barebox tools for the host and the
> > target.
> >=20
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
> > =C2=A0.../barebox/barebox-tools_2024.08.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 58 +++++++++++++++++++
> > =C2=A02 files changed, 59 insertions(+)
> > =C2=A0create mode 100644 meta/recipes-bsp/barebox/barebox-tools_2024.08=
.0.bb
> >=20
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distr=
o/include/maintainers.inc
> > index 1b3d485e48..067c4af096 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -55,6 +55,7 @@ RECIPE_MAINTAINER:pn-avahi =3D "Yi Zhao <yi.zhao@wind=
river.com>"
> > =C2=A0RECIPE_MAINTAINER:pn-babeltrace =3D "Alexander Kanavin <alex.kana=
vin@gmail.com>"
> > =C2=A0RECIPE_MAINTAINER:pn-babeltrace2 =3D "Alexander Kanavin <alex.kan=
avin@gmail.com>"
> > =C2=A0RECIPE_MAINTAINER:pn-barebox =3D "Enrico J=C3=B6rns <yocto@pengut=
ronix.de>"
> > +RECIPE_MAINTAINER:pn-barebox-tools =3D "Enrico J=C3=B6rns <yocto@pengu=
tronix.de>"
> > =C2=A0RECIPE_MAINTAINER:pn-baremetal-helloworld =3D "Alejandro Hernande=
z <alejandro@enedino.org>"
> > =C2=A0RECIPE_MAINTAINER:pn-base-files =3D "Anuj Mittal <anuj.mittal@int=
el.com>"
> > =C2=A0RECIPE_MAINTAINER:pn-base-passwd =3D "Anuj Mittal <anuj.mittal@in=
tel.com>"
> > diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb b/meta=
/recipes-
> > bsp/barebox/barebox-tools_2024.08.0.bb
> > new file mode 100644
> > index 0000000000..25f4998d4a
> > --- /dev/null
> > +++ b/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb
> > @@ -0,0 +1,58 @@
> > +SUMMARY =3D "barebox bootloader tools"
> > +HOMEPAGE =3D "https://barebox.org/"
> > +
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9ca1f0d3364286=
c4192"
> > +
> > +DEPENDS =3D "libusb1 bison-native flex-native"
> > +
> > +SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> > +SRC_URI[sha256sum] =3D "b08a762da8d63dd18b4f2d9f5d0a8da001b6e608d1b3ef=
f6dcebc6a2e575d535"
> > +
> > +S =3D "${WORKDIR}/barebox-${PV}"
> > +B =3D "${WORKDIR}/build"
> > +
> > +inherit pkgconfig
> > +
> > +EXTRA_OEMAKE =3D " \
> > +=C2=A0 ARCH=3Dsandbox \
> > +=C2=A0 CROSS_COMPILE=3D${TARGET_PREFIX} -C ${S} O=3D${B} \
> > +=C2=A0 CROSS_PKG_CONFIG=3Dpkg-config \
> > +=C2=A0 CC=3D'${CC}' \
> > +=C2=A0 LD=3D'${LD}' \
> > +=C2=A0 "
> > +
> > +do_compile:class-target () {
> > +=C2=A0=C2=A0=C2=A0 export userccflags=3D"${HOST_CC_ARCH}${TOOLCHAIN_OP=
TIONS}"
> > +=C2=A0=C2=A0=C2=A0 export userldflags=3D"${TARGET_LDFLAGS}${TOOLCHAIN_=
OPTIONS}"
> > +=C2=A0=C2=A0=C2=A0 oe_runmake targettools_defconfig
> > +=C2=A0=C2=A0=C2=A0 oe_runmake scripts
> > +}
> > +
> > +do_compile:class-native () {
> > +=C2=A0=C2=A0=C2=A0 oe_runmake hosttools_defconfig
> > +=C2=A0=C2=A0=C2=A0 oe_runmake scripts
> > +}
> > +
> > +BAREBOX_TOOLS =3D " \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bareboxenv \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bareboxcrc32 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-install \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bareboximd \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 omap3-usb-loader \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 omap4_usbboot \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx/imx-usb-loader \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > +
> > +BAREBOX_TOOLS_SUFFIX =3D ""
> > +BAREBOX_TOOLS_SUFFIX:class-target =3D "-target"
> > +
> > +do_install () {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for tool in ${BAREBOX_TOOLS}; do
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 install -m 0755 scripts/${tool}${BAREBOX_TOOLS_SUFFIX} ${D}=
${bindir}/${tool##*/}
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
> > +}
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.39.2
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#204337): https://lists.openembedded.org/g/openembed=
ded-core/message/204337
> > Mute This Topic: https://lists.openembedded.org/mt/108370664/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
=C2=A0[alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

