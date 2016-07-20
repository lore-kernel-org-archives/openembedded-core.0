Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id E50136067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 02:20:44 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BxAQCg345X/5tjdVtdGgEBAQGDIVZ8jSqpNYIPgXoihXgCgTQ4FAEBAQEBAQFlJ4RdAQEEIygBLRALGAkUDQICDwJGBg0GAgKIMAEJry2FSAGILQEBAQEBAQQBAQEBARQOhiqETYdBgloFk2OFQYM3gW5uiE+COYx+kB4eNoI+gTdsAYgkAQEB
X-IPAS-Result: A2BxAQCg345X/5tjdVtdGgEBAQGDIVZ8jSqpNYIPgXoihXgCgTQ4FAEBAQEBAQFlJ4RdAQEEIygBLRALGAkUDQICDwJGBg0GAgKIMAEJry2FSAGILQEBAQEBAQQBAQEBARQOhiqETYdBgloFk2OFQYM3gW5uiE+COYx+kB4eNoI+gTdsAYgkAQEB
X-IronPort-AV: E=Sophos;i="5.28,392,1464645600"; 
	d="asc'?scan'208";a="86914156"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 20 Jul 2016 04:20:42 +0200
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=[192.168.0.23]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1bPh7p-0000eT-MO; Wed, 20 Jul 2016 04:20:41 +0200
To: Khem Raj <raj.khem@gmail.com>
References: <1468876796-16026-1-git-send-email-clopez@igalia.com>
	<CAMKF1spPAi60QxGcUJ8JtPSxih+wgkbPY5+tgDhDDMV4+aktTA@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Message-ID: <578EDFF0.20507@igalia.com>
Date: Wed, 20 Jul 2016 04:20:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spPAi60QxGcUJ8JtPSxih+wgkbPY5+tgDhDDMV4+aktTA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: Switch the ARMv7 build to Thumb2 and enable back the JSC JIT.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2016 02:20:46 -0000
X-Groupsio-MsgNum: 84704
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="lcASWFfJsjB5x9QT77ewt5U8TrbI9M9sG"

--lcASWFfJsjB5x9QT77ewt5U8TrbI9M9sG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19/07/16 21:26, Khem Raj wrote:
> On Mon, Jul 18, 2016 at 2:19 PM, Carlos Alberto Lopez Perez
> <clopez@igalia.com> wrote:
>> > * The JSC JIT is broken on ARMv7 without Thumb2.
>> >
>> > [YOCTO #9474]
>> >
>> > Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
>> > ---
>> >  meta/recipes-sato/webkit/webkitgtk_2.12.3.bb | 17 ++++++++++++-----=

>> >  1 file changed, 12 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/rec=
ipes-sato/webkit/webkitgtk_2.12.3.bb
>> > index c5e5432..536fa23 100644
>> > --- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
>> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
>> > @@ -71,10 +71,6 @@ EXTRA_OECMAKE_append_armv5 =3D " -DENABLE_JIT=3DO=
FF "
>> >  EXTRA_OECMAKE_append_armv6 =3D " -DENABLE_JIT=3DOFF "
>> >  EXTRA_OECMAKE_append_armv4 =3D " -DENABLE_JIT=3DOFF "
>> >
>> > -# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
>> > -# displaying problems or ephiphany hang.
>> > -EXTRA_OECMAKE_append_armv7a =3D " -DENABLE_JIT=3DOFF "
>> > -
>> >  # binutils 2.25.1 has a bug on aarch64:
>> >  # https://sourceware.org/bugzilla/show_bug.cgi?id=3D18430
>> >  EXTRA_OECMAKE_append_aarch64 =3D " -DUSE_LD_GOLD=3DOFF "
>> > @@ -89,7 +85,18 @@ SECURITY_CFLAGS_append_aarch64 =3D " -fPIE"
>> >  FILES_${PN} +=3D "${libdir}/webkit2gtk-4.0/injected-bundle/libwebki=
t2gtkinjectedbundle.so"
>> >
>> >  # http://errors.yoctoproject.org/Errors/Details/20370/
>> > -ARM_INSTRUCTION_SET =3D "arm"
>> > +ARM_INSTRUCTION_SET_armv4 =3D "arm"
>> > +ARM_INSTRUCTION_SET_armv5 =3D "arm"
>> > +ARM_INSTRUCTION_SET_armv6 =3D "arm"
>> > +
>> > +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
>> > +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
>> > +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtim=
e.
>> > +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-=
mthumb).
>> > +ARM_INSTRUCTION_SET_armv7a =3D "thumb"
>> > +ARM_INSTRUCTION_SET_armv7r =3D "thumb"
>> > +ARM_INSTRUCTION_SET_armv7m =3D "thumb"
>> > +ARM_INSTRUCTION_SET_armv7ve =3D "thumb"
> This should be ok. Do we need to specify 'm' ?
> they should be thumb only anyway
>=20

Right, good catch..

So I guess is not needed to specify anything for armv7m.

Do you want me to send the patch again without the armv7m line?

Regards.


--lcASWFfJsjB5x9QT77ewt5U8TrbI9M9sG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJXjt/wAAoJEJZQic5rlfiCSJkP/3C3Wlso26RZNDWIQdh1MRpY
Cs0XIMTasvmECBghPemClHlqu3cwSP5BjBz3SyL4OGDr33xfJ+Y12qAVX58kr0u2
en23Ev2A0zwi+xafWIr3oQljauUDDypUSgApkaRzKnxk74yzjK/8FMWoFV662vG9
t6Rf6AY+cJ4/bt0TXFFqlg4WVt3B2zpPlQnlEW9N5+y9kMV298mfNlzbl9UTDseZ
6L7RMw9ajdnHm1nsiceUk332Hhiur7+8ofFItiVgb9uFEUe/45AjZhx/YAYWa2CU
gW0d7OjFfMJEXpC9+CaswNQJKXvlME5GWW4FrlWhOWwdxqd4u9KlP7q2hmFCvg/+
cwrmBMZLCC9rvgdC5KhvjDMcE7skB/DoUYnsHVyRPIBI1MB0Mo3y0Q80/9WNijUM
eTM2jNhzCs0QgDjJ/U3i51/qRzNPVG8B5aqibyqK2/vN2b5Znvl5RZY+5Vf2+DSa
6fZ4gGLS9a3ASRzCJNX1a9kCPoJuJKBuNshanomphV3QVNatP6nkbjpQ0sMEJ3e6
XSFul9ZEQLNIrL2eH/arG3yo+6FUcGNzBN6jM00oQyPGTRrX86+ZWlNCBcgY2Miu
XUVhZ+/X9f0d2J5GsR8Vkdv3CcFUeoRcds050kcLw1c1Rkw6MBLcfP3fMGtYejgA
Pop7U7TP2f7MpQMBnFNx
=Upxe
-----END PGP SIGNATURE-----

--lcASWFfJsjB5x9QT77ewt5U8TrbI9M9sG--
