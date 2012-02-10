Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rvpvo-0007Vl-UZ
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 13:50:29 +0100
Received: by werc1 with SMTP id c1so1977976wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 04:42:23 -0800 (PST)
Received: by 10.216.132.4 with SMTP id n4mr742987wei.19.1328877743227;
	Fri, 10 Feb 2012 04:42:23 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l8sm17634971wiy.5.2012.02.10.04.42.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 04:42:22 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F350CEA.70605@opendreambox.org>
Date: Fri, 10 Feb 2012 13:42:24 +0100
Message-Id: <9D036E41-4B81-42A4-8236-467A8F871A69@dominion.thruhere.net>
References: <4F34729A.3020402@opendreambox.org>
	<7113E9EE-BFA2-47CA-94A5-381601F92C7F@dominion.thruhere.net>
	<1443906.UPv3ikXssj@helios> <4F350CEA.70605@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQkNCPwoSnSdr/83kGAGtXo5e6BjdD19tVbobhm8SNe5GoccxP/bwno5LZxPQL+qHhMxWHLO
Subject: Re: [PATCH/RFC v2] xorg-lib: don't build libs unless requested by DISTRO_FEATURES
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
X-List-Received-Date: Fri, 10 Feb 2012 12:50:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 feb. 2012, om 13:26 heeft Andreas Oberritter het volgende =
geschreven:

> On 10.02.2012 13:19, Paul Eggleton wrote:
>> On Friday 10 February 2012 09:38:59 Koen Kooi wrote:
>>> I know you're just moving the error message around, but I would =
suggest
>>> changing it to "'x11' not in DISTRO_FEATURES".
>>=20
>> You have to be careful with this, as it will pick up partial words =
e.g.=20
>> assuming we had an "x11test" DISTRO_FEATURE then this would also be =
picked up=20
>> by this statement; whereas oe.utils.contains() does a split to make =
it a list=20
>> first and therefore does not have this issue. I'd suggest leaving it =
as-is, or=20
>> if you really want to change it, do a split on the string first.
>=20
> I think Koen was referring to the error string, see below.

Indeed I was!



>=20
> Regards,
> Andreas
>=20
> =46rom 7d9633e0b1ccf85ec72f32d7d39952b467fa5cae Mon Sep 17 00:00:00 =
2001
> From: Andreas Oberritter <obi@opendreambox.org>
> Date: Fri, 10 Feb 2012 02:10:15 +0100
> Subject: [PATCH] xorg-lib: don't build libs unless requested by
> DISTRO_FEATURES
>=20
> * If 'x11' is not set in DISTRO_FEATURES, then skip all
> recipes using xorg-lib-common.inc instead of only those
> using libx11.inc.
>=20
> * One exception: pixman, which is not only used by xorg,
> but also by cairo.
>=20
> * Improve error message as suggested by Koen.
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
> index d106054..73a4d1d 100644
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
> +                raise bb.parse.SkipPackage("'x11' not in =
DISTRO_FEATURES")
> +}
> --=20
> 1.7.5.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



