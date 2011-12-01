Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW4Jq-0001GT-B5
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 11:56:46 +0100
Received: by eaad13 with SMTP id d13so2003396eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 02:50:05 -0800 (PST)
Received: by 10.227.202.70 with SMTP id fd6mr2621687wbb.27.1322736604941;
	Thu, 01 Dec 2011 02:50:04 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o3sm262608wiy.14.2011.12.01.02.50.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 02:50:04 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 11:50:03 +0100
In-Reply-To: <1322736468-12941-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
References: <1322736468-12941-1-git-send-email-koen@dominion.thruhere.net>
Message-Id: <637FA7B4-E523-4A57-B330-028B67649FE5@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/5] pulseaudio 1.1: convert to useradd.bbclass
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
X-List-Received-Date: Thu, 01 Dec 2011 10:56:46 -0000
X-Groupsio-MsgNum: 13413
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8BBAD2E2-AA90-4B84-845F-C4C7ABC27EA1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8BBAD2E2-AA90-4B84-845F-C4C7ABC27EA1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Ignore this one, resent as 1/2

Op 1 dec. 2011, om 11:47 heeft Koen Kooi het volgende geschreven:

> The only thing that got lost in the conversion is the "Pulse Audio =
daemon" description:
>=20
> root@beagleboard:~# grep pulse /etc/passwd /etc/group
> /etc/passwd:pulse:x:999:1000::/var/run/pulse:/bin/false
> /etc/group:audio:x:29:pulse
> /etc/group:pulse:x:1000:pulse
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-multimedia/pulseaudio/pulseaudio.inc |   18 =
++++++++----------
> 1 files changed, 8 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc =
b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 131d659..4170857 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -16,7 +16,7 @@ SRC_URI =3D =
"http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.g
>            file://gcc4-compile-fix.patch \
>            file://volatiles.04_pulse"
>=20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig useradd
>=20
> EXTRA_OECONF =3D "\
> 		--disable-lynx \
> @@ -50,6 +50,12 @@ do_install_append() {
> 	fi
> }
>=20
> +USERADD_PACKAGES =3D "pulseaudio-server"
> +GROUPADD_PARAM_pulseaudio-server =3D "pulse"
> +USERADD_PARAM_pulseaudio-server =3D "--system --home /var/run/pulse \
> +                              --no-create-home --shell /bin/false \
> +                              --groups audio,pulse --gid pulse pulse"
> +
> PACKAGES =3D+ "libpulsecore libpulsecommon libpulsedsp libpulse =
libpulse-simple libpulse-browse libpulse-mainloop-glib \
>              pulseaudio-server pulseaudio-misc =
pulseaudio-gconf-helper"
>=20
> @@ -90,20 +96,12 @@ pkg_postinst_${PN}-server() {
>         if [ "x$D" !=3D "x" ]; then
>                 exit 1
>         fi
> -        grep -q pulse: ${sysconfdir}/group || addgroup pulse
> -        grep -q pulse: ${sysconfdir}/passwd || \
> -            adduser --disabled-password --home=3D/var/run/pulse =
--system \
> -                    --ingroup pulse --no-create-home -g "Pulse audio =
daemon" pulse
> -        addgroup pulse audio
> +
>         if [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
>             ${sysconfdir}/init.d/populate-volatile.sh update
>         fi
> }
>=20
> -pkg_postrm_${PN}-server() {
> -        deluser pulse || true
> -}
> -
> python populate_packages_prepend() {
>         #d.setVar('PKG_pulseaudio', 'pulseaudio')
>=20
> --=20
> 1.7.2.5
>=20


--Apple-Mail=_8BBAD2E2-AA90-4B84-845F-C4C7ABC27EA1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XW9sACgkQMkyGM64RGpEJ7gCeJ5SbmmSYYehgAeMHqOqYqk5i
LFIAniW8TK9av3JpfR7NCwZqgp1KoID/
=bah+
-----END PGP SIGNATURE-----

--Apple-Mail=_8BBAD2E2-AA90-4B84-845F-C4C7ABC27EA1--
