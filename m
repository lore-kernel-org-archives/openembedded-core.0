Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TdlFX-0007AJ-9c
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 18:16:40 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Nov 2012 09:01:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,179,1355126400"; d="scan'208";a="254409360"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2012 09:01:17 -0800
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 28 Nov 2012 09:01:17 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.234]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.43]) with mapi id
	14.01.0355.002; Wed, 28 Nov 2012 09:01:16 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] xserver-xorg: restore packaging for the DRI/DRI2/DBE
	extensions
Thread-Index: AQHNzX1TOjOMe2+NB0uKXxYg//t3Hpf/dvyQ
Date: Wed, 28 Nov 2012 17:01:15 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C2D93083B@ORSMSX106.amr.corp.intel.com>
References: <1354116528-21598-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1354116528-21598-1-git-send-email-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH] xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 17:16:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ross,
    I have a similar patch, which stays in meta-intel. I am testing it now.=
 Because there is no 1.9 Xserver recipe in the oecore, so I think it is met=
a-intel specific problem. In my patch for the older xserver recipes from me=
ta-intel I am avoiding inclusion of xserver-xorg.inc from oecore. And I am =
providing another xserver-xorg.inc for them in the meta-intel layer to fix =
the issues. Technically both these approaches are achieving same thing, jus=
t the location of changes is different.
  So far in my testing my patch has fixed the X issue for emenlow. And I wi=
ll be testing the X on crownbay today. BTW my patch is also fixing some add=
itional packaging warnings.

So if this patch goes in oecore, I will redo my fixes in meta-intel. Or I c=
an add Ross'es signed off to my meta-intel patches.

Thanks,
Nitin


> -----Original Message-----
> From: Ross Burton [mailto:ross.burton@intel.com]
> Sent: Wednesday, November 28, 2012 7:29 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Zanussi, Tom; Kamble, Nitin A
> Subject: [PATCH] xserver-xorg: restore packaging for the DRI/DRI2/DBE
> extensions
>=20
> Even though the current xserver in oe-core (1.13) doesn't ship these as
> standalone extensions, older X servers required by binary drives (e.g. me=
ta-
> intel's 1.9) still install them separately.  As the packages didn't exist=
 in
> xserver-xorg.inc the extensions were not packaged, and X didn't work.
>=20
> Revolve this by restoring the package definitions, and moving the upgrade
> path dependencies to xserver-xorg_1.13.bb.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   30 +++++++-------=
------
>  .../xorg-xserver/xserver-xorg_1.13.0.bb            |   22 ++++++++++++++
>  2 files changed, 33 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index d410707..cea4c26 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -13,7 +13,7 @@ PROVIDES =3D "virtual/xserver-xf86"
>  PROVIDES +=3D "virtual/xserver"
>=20
>  PE =3D "2"
> -INC_PR =3D "r6"
> +INC_PR =3D "r7"
>=20
>  XORG_PN =3D "xorg-server"
>  SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_PN}-
> ${PV}.tar.bz2"
> @@ -48,7 +48,12 @@ PACKAGES =3D+ "${PN}-security-policy \
>               ${PN}-utils \
>               ${PN}-xephyr \
>               ${PN}-multimedia-modules \
> +             ${PN}-extension-dri \
> +             ${PN}-extension-dri2 \
>               ${PN}-extension-glx \
> +             ${PN}-extension-record \
> +             ${PN}-extension-extmod \
> +             ${PN}-extension-dbe \
>               ${PN}-module-libint10 \
>               ${PN}-module-libafb \
>               ${PN}-module-libwfb  \
> @@ -62,24 +67,6 @@ PACKAGES =3D+ "${PN}-security-policy \
> RRECOMMENDS_${PN} +=3D "${PN}-security-policy xkeyboard-config rgb
> xserver-xf86-config"
>  RDEPENDS_${PN}-xvfb +=3D "xkeyboard-config"
>  RDEPENDS_${PN}-module-exa =3D "${PN} (=3D ${EXTENDPKGV})"
> -RREPLACES_${PN} =3D  "${PN}-extension-dri \
> -                    ${PN}-extension-dri2 \
> -                    ${PN}-extension-record \
> -                    ${PN}-extension-extmod \
> -                    ${PN}-extension-dbe \
> -                   "
> -RPROVIDES_${PN} =3D  "${PN}-extension-dri \
> -                    ${PN}-extension-dri2 \
> -                    ${PN}-extension-record \
> -                    ${PN}-extension-extmod \
> -                    ${PN}-extension-dbe \
> -                   "
> -RCONFLICTS_${PN} =3D "${PN}-extension-dri \
> -                    ${PN}-extension-dri2 \
> -                    ${PN}-extension-record \
> -                    ${PN}-extension-extmod \
> -                    ${PN}-extension-dbe \
> -                   "
>=20
>  FILES_${PN} =3D "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards
> ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so
> ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt
> ${datadir}/X11/xorg.conf.d"
>  FILES_${PN}-dev +=3D "${libdir}/xorg/modules/*.la
> ${libdir}/xorg/modules/*/*.la"
> @@ -95,7 +82,12 @@ FILES_${PN}-xvfb =3D "${bindir}/Xvfb"
>  FILES_${PN}-utils =3D "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/io=
port
> ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf
> ${bindir}/getconfig ${bindir}/getconfig.pl"
>  FILES_${PN}-xephyr =3D "${bindir}/Xephyr"
>  FILES_${PN}-multimedia-modules =3D
> "${libdir}/xorg/modules/multimedia/*drv*"
> +FILES_${PN}-extension-dri =3D "${libdir}/xorg/modules/extensions/libdri.=
so"
> +FILES_${PN}-extension-dri2 =3D
> "${libdir}/xorg/modules/extensions/libdri2.so"
>  FILES_${PN}-extension-glx =3D "${libdir}/xorg/modules/extensions/libglx.=
so"
> +FILES_${PN}-extension-record =3D
> "${libdir}/xorg/modules/extensions/librecord.so"
> +FILES_${PN}-extension-extmod =3D
> "${libdir}/xorg/modules/extensions/libextmod.so"
> +FILES_${PN}-extension-dbe =3D
> "${libdir}/xorg/modules/extensions/libdbe.so"
>  FILES_${PN}-module-libint10 =3D "${libdir}/xorg/modules/libint10.so"
>  FILES_${PN}-module-libafb =3D "${libdir}/xorg/modules/libafb.so"
>  FILES_${PN}-module-libwfb =3D "${libdir}/xorg/modules/libwfb.so"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> index 8ad87b8..3b102cb 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> @@ -10,3 +10,25 @@ SRC_URI[md5sum] =3D
> "bde3d178b756597d2ec2a19ef60d2e1f"
>  SRC_URI[sha256sum] =3D
> "548b91cb01087ad4f892428e7ac4955251cf12393e86c70420436b33848ef28a"
>=20
>  PR =3D "${INC_PR}.0"
> +
> +# These extensions are now integrated into the server, so declare the
> +migration # path for in-place upgrades.
> +
> +RREPLACES_${PN} =3D  "${PN}-extension-dri \
> +                    ${PN}-extension-dri2 \
> +                    ${PN}-extension-record \
> +                    ${PN}-extension-extmod \
> +                    ${PN}-extension-dbe \
> +                   "
> +RPROVIDES_${PN} =3D  "${PN}-extension-dri \
> +                    ${PN}-extension-dri2 \
> +                    ${PN}-extension-record \
> +                    ${PN}-extension-extmod \
> +                    ${PN}-extension-dbe \
> +                   "
> +RCONFLICTS_${PN} =3D "${PN}-extension-dri \
> +                    ${PN}-extension-dri2 \
> +                    ${PN}-extension-record \
> +                    ${PN}-extension-extmod \
> +                    ${PN}-extension-dbe \
> +                   "
> --
> 1.7.10



