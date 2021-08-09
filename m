Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.20312.1628498230844476150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 01:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AB1A61C000E;
	Mon,  9 Aug 2021 08:37:07 +0000 (UTC)
Message-ID: <579bc869055ebf299c3270d890db41a7bb2ceabb.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] kernel-fitimage: images should not be signed with the same keys as the configurations
From: "Thomas Perrot" <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Mon, 09 Aug 2021 10:37:06 +0200
In-Reply-To: <YRAuMiM44mQ/oMnM@piout.net>
References: <20210806161038.1593772-1-thomas.perrot@bootlin.com>
	 <YRAuMiM44mQ/oMnM@piout.net>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-Groupsio-MsgNum: 154605
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Pqi4OonhZzMXRIX7lSPu"

--=-Pqi4OonhZzMXRIX7lSPu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alexandre,

On Sun, 2021-08-08 at 21:19 +0200, Alexandre Belloni wrote:
> Hello,
>=20
> On 06/08/2021 18:10:38+0200, Thomas Perrot wrote:
> > Otherwise the "required" property, from UBOOT_DTB_BINARY, will be set
> > to "conf"
> > and no error will be raised in case of error.
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0meta/classes/kernel-fitimage.bbclass | 40 +++++++++++++++++++++++=
+--
> > --
> > =C2=A01 file changed, 35 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/classes/kernel-fitimage.bbclass
> > b/meta/classes/kernel-fitimage.bbclass
> > index a9d1002200c9..72f692e40e63 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -60,6 +60,14 @@ FIT_DESC ?=3D "Kernel fitImage for
> > ${DISTRO_NAME}/${PV}/${MACHINE}"
> > =C2=A0# Sign individual images as well
> > =C2=A0FIT_SIGN_INDIVIDUAL ?=3D "0"
> > =C2=A0
> > +# Keys used to sign individually images nodes.
> > +# The keys to sign images nodes must be different from those used to
> > sign
> > +# configurations nodes, otherwise the "required" property, from
> > +# UBOOT_DTB_BINARY, will be set to "conf", because "conf" prevails
> > on "image".
> > +# Then images signature checking will not be mandatory and no error
> > will be
> > +# raised.
> > +# UBOOT_SIGN_IMG_KEYNAME =3D "dev2" # keys name in keydir (eg.
> > "dev2.crt", "dev2.key")
> > +
> > =C2=A0#
> > =C2=A0# Emit the fitImage ITS header
> > =C2=A0#
> > @@ -121,7 +129,7 @@ fitimage_emit_section_kernel() {
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kernel_csum=3D"${FIT_HA=
SH_ALG}"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kernel_sign_algo=3D"${F=
IT_SIGN_ALG}"
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kernel_sign_keyname=3D"${UBO=
OT_SIGN_KEYNAME}"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kernel_sign_keyname=3D"${UBO=
OT_SIGN_IMG_KEYNAME}"
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ENTRYPOINT=3D"${UBOOT_E=
NTRYPOINT}"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if [ -n "${UBOOT_ENTRYS=
YMBOL}" ]; then
> > @@ -167,7 +175,7 @@ fitimage_emit_section_dtb() {
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dtb_csum=3D"${FIT_HASH_=
ALG}"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dtb_sign_algo=3D"${FIT_=
SIGN_ALG}"
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dtb_sign_keyname=3D"${UBOOT_=
SIGN_KEYNAME}"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dtb_sign_keyname=3D"${UBOOT_=
SIGN_IMG_KEYNAME}"
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dtb_loadline=3D""
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dtb_ext=3D${DTB##*.}
> > @@ -214,7 +222,7 @@ fitimage_emit_section_boot_script() {
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootscr_csum=3D"${FIT_=
HASH_ALG}"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bootscr_sign_algo=3D"${=
FIT_SIGN_ALG}"
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bootscr_sign_keyname=3D"${UB=
OOT_SIGN_KEYNAME}"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bootscr_sign_keyname=3D"${UB=
OOT_SIGN_IMG_KEYNAME}"
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat << EOF >> ${1}
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootscr-${2} {
> > @@ -278,7 +286,7 @@ fitimage_emit_section_ramdisk() {
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ramdisk_csum=3D"${FIT_H=
ASH_ALG}"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ramdisk_sign_algo=3D"${=
FIT_SIGN_ALG}"
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ramdisk_sign_keyname=3D"${UB=
OOT_SIGN_KEYNAME}"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ramdisk_sign_keyname=3D"${UB=
OOT_SIGN_IMG_KEYNAME}"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ramdisk_loadline=3D""
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ramdisk_entryline=3D""
> > =C2=A0
> > @@ -475,6 +483,10 @@ fitimage_assemble() {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bootscr_id=3D""
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -f ${1} arch/${ARCH}=
/boot/${2}
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if [ "${UBOOT_SIGN_KEYNAME}"=
 =3D "${UBOOT_SIGN_IMG_KEYNAME}" ];
> > then
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0bbfatal "Keys used to sign images and configuration
> > nodes must be different."
>=20
> This breaks oe-selftest, as seen in:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2383/st=
eps/14/logs/stdio
>=20

Thank you for the feedback.

The tests also need to be updated, so I will submit a v2, including the
required changes on the test side.

Best regards,
Thomas Perrot

>=20
>=20
>=20
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-Pqi4OonhZzMXRIX7lSPu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmEQ6TIACgkQn8ALBXH+
Cu1+Cwv/VGZ5BNUtDjyYKPhxcWBjKxECOwt7mSJbHerUubzEGWxD1RquxjWUxg07
7cgRj2IWldi4YaZ7szZP2Tpw/mJuMUQNbnqOLWlR0w4WAGHTuL0hrmgF0h12EFKP
/jPee2laFJSOcQlkJ97XO6Ba70HGcXfIZdZSTU6jR5K1IRpyXSXjrc/QxNCZBg2s
y/suj235nyxOexQljjUK2Ym7JwERnokM8nn7AkvVo2cZIulOkjtfLBwvAaJ2aqGA
8zFVw6ga+N2FLrfbAJH4ftKhyvPFY4128oBgdwa+2oIPSRLp6qp88NQVPLq6fGjU
WyfU/3x+Zq1BxVbPFZ3ZM0yXXRljt1+c5zN1985oCzDkDbBs3+WVGEn+VXhwjfPx
CbKTY82o9y0iTk6N5LsH48xEjYgES37eUq63dEDqS06dbKpmSBLEBYXLxMZTCcvP
d3n3krJpFYZVw6+kUtC0lXL6Qhc3pdPm00j7BYfD27NUK1gP3e7dzUsObLjLPlwp
F4v/TI4K
=mD6a
-----END PGP SIGNATURE-----

--=-Pqi4OonhZzMXRIX7lSPu--
