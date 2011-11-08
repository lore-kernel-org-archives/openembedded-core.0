Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RNlBS-0001f6-BH
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 13:53:46 +0100
Received: by wyh5 with SMTP id 5so427898wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 04:47:32 -0800 (PST)
Received: by 10.227.204.135 with SMTP id fm7mr33293199wbb.2.1320756449341;
	Tue, 08 Nov 2011 04:47:29 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fi11sm1615611wbb.9.2011.11.08.04.47.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 04:47:28 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 8 Nov 2011 13:47:21 +0100
In-Reply-To: <1320755519.3915.15.camel@mattotaupa>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320755519.3915.15.camel@mattotaupa>
Message-Id: <D173D270-DC47-4EEB-8CC8-F0A10284EF56@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] xinit: Fix `startx` looking for `mcookie` in sysroot
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
X-List-Received-Date: Tue, 08 Nov 2011 12:53:46 -0000
X-Groupsio-MsgNum: 12083
Content-Type: multipart/signed;
	boundary="Apple-Mail=_90B8B7A6-3B9C-43D7-BFE8-9AE12DEFA6BB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_90B8B7A6-3B9C-43D7-BFE8-9AE12DEFA6BB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


Op 8 nov. 2011, om 13:31 heeft Paul Menzel het volgende geschreven:

> Date: Tue, 8 Nov 2011 13:00:32 +0100
>=20
> `startx` run on a system based on the demo systemd image [1] and =
`opkg`-installed packages fails with the following error.
>=20
> 	/usr/bin/startx: line 139: =
/OE/tentacle/build/tmp-angstrom_2010_x/sysroots/x68_64-linux/usr/bin/mcook=
ie: No such file or directory
>=20
> Applying commit 443bcc07 [1] from OE-classic
>=20
>        Author: Tom Rini <tom_rini@mentor.com>
>        Date:   Thu Apr 7 10:36:43 2011 -0700
>=20
>            xinit: Fix mcookie / util-linux-ng dependency
>=20
>            xinit just needs to know the runtime path of mcookie so we =
need to
>            RDEPEND on util-linux-ng and pass the runtime path in via =
EXTRA_OECONF
>=20
>            Signed-off-by: Tom Rini <tom_rini@mentor.com>
>=20
> fixes this issue. Commit 7f6cec6f [2]
>=20
>        Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>        Date:   Sun Feb 21 18:11:30 2010 +0100
>=20
>            xinit: add dependency on util-linux-ng
>=20
>        [=85]
>=20
> tried to address the same problem but apparently did not help, because =
Tom still had problems.
>=20
> [1] =
http://www.angstrom-distribution.org/demo/beagleboard/Angstrom-systemd-ima=
ge-eglibc-ipk-v2011.11-core-beagleboard.rootfs.tar.bz2
> [2] =
http://git.openembedded.org/openembedded/commit/443bcc0785bc004e471b3750a3=
4d12d2fd2e5dad
> [3] =
http://git.openembedded.org/openembedded/commit/7f6cec6f0adb6203a6dbaf8a43=
c67c2c4f8bf84e
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> 1. Please note that I did neither build nor run tested this patch and =
just noticed the error trying the demo image.
> 2. Koen mentioned something on IRC wanting to get rid of `startx` =
entirely. But this patch should be applied nevertheless.
> ---
> meta/recipes-graphics/xorg-app/xinit_1.3.0.bb |    6 +++++-
> 1 files changed, 5 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb =
b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
> index ee7c64d..cdfc843 100644
> --- a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
> +++ b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
> @@ -9,9 +9,13 @@ systems. When this first client exits, xinit will =
kill the X server and \
> then terminate."
>=20
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0d4b5eef75f1584ccbdc5e4a34314407"
> -PR =3D "r0"
> +RDEPENDS_${PN} +=3D "util-linux-ng"

RDEPENDS go below do_install

regards,

Koen=

--Apple-Mail=_90B8B7A6-3B9C-43D7-BFE8-9AE12DEFA6BB
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk65JNkACgkQMkyGM64RGpHLEACZARppWCY0B31Y72btmXft4kW1
HNQAn0H0TYC524zqyZ6DMqt2oII3srmg
=Y+OV
-----END PGP SIGNATURE-----

--Apple-Mail=_90B8B7A6-3B9C-43D7-BFE8-9AE12DEFA6BB--
