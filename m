Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYb6Y-0002mT-Pe
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 11:21:30 +0100
Received: by bkbzt4 with SMTP id zt4so1469464bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 02:14:41 -0800 (PST)
Received: by 10.181.11.226 with SMTP id el2mr3875445wid.64.1323339280898;
	Thu, 08 Dec 2011 02:14:40 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j5sm7814599wix.20.2011.12.08.02.14.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 02:14:39 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 8 Dec 2011 11:14:35 +0100
In-Reply-To: <7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323327959.git.xiaofeng.yan@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323327959.git.xiaofeng.yan@windriver.com>
Message-Id: <67C6F211-C6C2-4655-889A-A254F4E0D7D9@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Thu, 08 Dec 2011 10:21:30 -0000
X-Groupsio-MsgNum: 13851
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1985D80A-D833-4B99-A9FE-5D84FD7348FB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1985D80A-D833-4B99-A9FE-5D84FD7348FB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Op 8 dec. 2011, om 10:34 heeft Xiaofeng Yan het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> gtk run over x11 at current OE-core. If gtk want to run over directfb, =
then \
> the configuration related to x11 should be disabled and directfb =
should be enabled.

Since I still can't get an answer to "what happens when you enable both =
x11 and directfb as distro features", let me ask a different question:

Why don't you do it like we did for gtk-directfb in OE-classic? add a =
cairo-directfb and a gtk-directfb, done.


>=20
> [YOCTO #1674]
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> meta/recipes-gnome/gtk+/gtk+.inc |   13 ++++++++++---
> 1 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc =
b/meta/recipes-gnome/gtk+/gtk+.inc
> index 1d8f4a6..0319916 100644
> --- a/meta/recipes-gnome/gtk+/gtk+.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
> @@ -9,9 +9,16 @@ LICENSE =3D "LGPLv2 & LGPLv2+ & LGPLv2.1+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f7e7"
>=20
> SECTION =3D "libs"
> -DEPENDS =3D "glib-2.0 pango atk jpeg libpng libxext libxcursor \
> -           gtk-doc-native docbook-utils-native libxrandr libgcrypt \
> -           libxdamage libxrender libxcomposite cairo gdk-pixbuf"
> +
> +X11DEPENDS =3D "virtual/libx11 libxext libxcursor libxrandr =
libxdamage libxrender libxcomposite"
> +DEPENDS =3D "glib-2.0 pango atk jpeg libpng gtk-doc-native =
gdk-pixbuf-native docbook-utils-native \
> + libgcrypt cairo gdk-pixbuf"
> +
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', =
'x11', '', d)} \
> + ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
> +
> +PACKAGECONFIG[x11] =3D "--with-x=3Dyes =
--with-gdktarget=3Dx11,--with-x=3Dno,${X11DEPENDS}"
> +PACKAGECONFIG[directfb] =3D "--with-gdktarget=3Ddirectfb,,directfb"
>=20
> inherit autotools pkgconfig
>=20
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_1985D80A-D833-4B99-A9FE-5D84FD7348FB
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7gjg4ACgkQMkyGM64RGpGNmgCgqfVWOp/0X7LdlqCHrTEeNYd7
l4MAoKyhThoO0TkLeFSXf9hyMLAQdDNb
=q/Sn
-----END PGP SIGNATURE-----

--Apple-Mail=_1985D80A-D833-4B99-A9FE-5D84FD7348FB--
