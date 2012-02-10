Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rvm8E-0002Wg-7w
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:47:02 +0100
Received: by wgbdr13 with SMTP id dr13so2250171wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:38:56 -0800 (PST)
Received: by 10.180.19.97 with SMTP id d1mr7794761wie.12.1328863136650;
	Fri, 10 Feb 2012 00:38:56 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	hb10sm15736067wib.10.2012.02.10.00.38.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 00:38:55 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F34729A.3020402@opendreambox.org>
Date: Fri, 10 Feb 2012 09:38:59 +0100
Message-Id: <7113E9EE-BFA2-47CA-94A5-381601F92C7F@dominion.thruhere.net>
References: <4F34729A.3020402@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQlyOD42WPPFyce7JTq4p+d6W+jVJNzrnNiyvz8Kwq44MTuZJlx8Kh/Fl9xX4Foy8A7L2cQT
Subject: Re: [PATCH/RFC] xorg-lib: don't build libs unless requested by DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Feb 2012 08:47:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 feb. 2012, om 02:27 heeft Andreas Oberritter het volgende =
geschreven:

> * If 'x11' is not set in DISTRO_FEATURES, then skip all
>  recipes using xorg-lib-common.inc instead of only those
>  using libx11.inc.
>=20
> * One exception: pixman, which is not only used by xorg,
>  but also by cairo.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> meta/recipes-graphics/xorg-lib/libx11.inc          |    5 -----
> meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    6 ++++++
> 2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc =
b/meta/recipes-graphics/xorg-lib/libx11.inc
> index 748a48c..9057edc 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -49,8 +49,3 @@ do_compile_prepend() {
> # Multiple libx11 derivatives from from this file and are selected by =
virtual/libx11
> # A world build should only build the correct version, not all of =
them.
> EXCLUDE_FROM_WORLD =3D "1"
> -
> -python () {
> -       if not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, =
False, d):
> -       	  raise bb.parse.SkipPackage("X11 not enabled for this =
DISTRO")
> -}
> diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc =
b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> index d106054..3d5d378 100644
> --- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> +++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> @@ -14,3 +14,9 @@ S =3D "${WORKDIR}/${XORG_PN}-${PV}"
> inherit autotools pkgconfig
>=20
> EXTRA_OECONF =3D "--enable-malloc0returnsnull --with-fop=3Dno =
--without-xmlto"
> +
> +python () {
> +        whitelist =3D [ "pixman" ]
> +        if not d.getVar('BPN', True) in whitelist and not =
oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
> +                raise bb.parse.SkipPackage("X11 not enabled for this =
DISTRO")

I know you're just moving the error message around, but I would suggest =
changing it to "'x11' not in DISTRO_FEATURES".

regards,

Koen=


