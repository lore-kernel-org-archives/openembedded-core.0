Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RZ5wG-0006K8-DL
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:16:56 +0100
Received: by eekb15 with SMTP id b15so1680687eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:10:04 -0800 (PST)
Received: by 10.213.29.130 with SMTP id q2mr1879176ebc.85.1323457804704;
	Fri, 09 Dec 2011 11:10:04 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c9sm34631788eeb.0.2011.12.09.11.10.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 11:10:03 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 9 Dec 2011 20:09:59 +0100
In-Reply-To: <1323456842-16941-1-git-send-email-otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323456842-16941-1-git-send-email-otavio@ossystems.com.br>
Message-Id: <E768E333-CE1B-457E-B3F9-2690AE11326C@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] connman: disable ntp support
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
X-List-Received-Date: Fri, 09 Dec 2011 19:16:56 -0000
X-Groupsio-MsgNum: 13976
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A3D96508-7030-4E1A-AB55-A2FD4D563E17";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A3D96508-7030-4E1A-AB55-A2FD4D563E17
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 9 dec. 2011, om 19:54 heeft Otavio Salvador het volgende geschreven:

> OE-Core does not provide ntpd at this moment and as there's no known
> user of this plugin at this moment we are disabling it.

Ehm:

koen@dominion:/OE/tentacle/sources/meta-angstrom$ git grep =
connman-plugin-ntpd
recipes-angstrom/tasks/angstrom-task-gnome.bb:  connman-gnome =
connman-plugin-ntpd \
recipes-angstrom/tasks/angstrom-task-gnome3.bb:  connman-gnome =
connman-plugin-ntpd \

That being said, the upcoming simplentpd conmman feature is a lot =
better. But I'd appreciate a patch for meta-angstrom to remove the ntp =
plugin :)

>=20
> [YOCTO #1817]
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> meta/recipes-connectivity/connman/connman.inc     |    6 ++----
> meta/recipes-connectivity/connman/connman_0.78.bb |    2 +-
> 2 files changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc =
b/meta/recipes-connectivity/connman/connman.inc
> index e90aa4b..d695fee 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                     =
file://src/main.c;beginline=3D1;endline=3D20;md5=3D4b55b550fa6b33cc2055ef3=
0dd262b3e"
>=20
> # we need to define the depends here, the dynamic stuff is too late
> -DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls ntp \
> +DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>             ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', =
'', d)} \
>             ${@base_contains('DISTRO_FEATURES', =
'wifi','wpa-supplicant', '', d)} \
>             "
> @@ -36,8 +36,7 @@ EXTRA_OECONF +=3D "\
>     --disable-polkit \
>     --enable-client \
>     --enable-fake \
> -    --enable-ntpd \
> -    --with-ntpd=3D${bindir}/ntpd \
> +    --disable-ntpd \
> "
>=20
> INITSCRIPT_NAME =3D "connman"
> @@ -72,7 +71,6 @@ python populate_packages_prepend() {
> 	               wifi=3D"wpa-supplicant",
> 	               resolvconf=3D"resolvconf",
> 	               bluetooth=3D"bluez4",
> -	               ntpd=3D"ntp",
> 	               ofono=3D"ofono" )
> 	packages =3D []
> 	multilib_prefix =3D (d.getVar("MLPREFIX", True) or "")
> diff --git a/meta/recipes-connectivity/connman/connman_0.78.bb =
b/meta/recipes-connectivity/connman/connman_0.78.bb
> index cc23c28..5ea2bb7 100644
> --- a/meta/recipes-connectivity/connman/connman_0.78.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.78.bb
> @@ -1,6 +1,6 @@
> require connman.inc
>=20
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> # 0.78 tag
> SRCREV =3D "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_A3D96508-7030-4E1A-AB55-A2FD4D563E17
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7iXQoACgkQMkyGM64RGpGjzQCfdBZkSYruLTB7zfO1gBTd/Eju
G44AoImmaPsaaPNWxrckvXZIiKe8F2nW
=GeH4
-----END PGP SIGNATURE-----

--Apple-Mail=_A3D96508-7030-4E1A-AB55-A2FD4D563E17--
