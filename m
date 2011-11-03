Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLx4T-0001Qm-3U
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 14:11:05 +0100
Received: by wyh5 with SMTP id 5so1263660wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 06:04:56 -0700 (PDT)
Received: by 10.227.59.204 with SMTP id m12mr13249898wbh.14.1320325496001;
	Thu, 03 Nov 2011 06:04:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff6sm10072404wbb.10.2011.11.03.06.04.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 06:04:54 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 3 Nov 2011 14:04:48 +0100
In-Reply-To: <1320325020-19012-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
References: <1320325020-19012-1-git-send-email-koen@dominion.thruhere.net>
Message-Id: <86762F88-8EB9-47D0-B1F7-A867ADCCFB1C@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] avahi: fix useradd race condition
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
X-List-Received-Date: Thu, 03 Nov 2011 13:11:05 -0000
X-Groupsio-MsgNum: 11860
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EC72FFE9-9942-42F0-BDD7-B181B4D428CD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EC72FFE9-9942-42F0-BDD7-B181B4D428CD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 3 nov. 2011, om 13:57 heeft Koen Kooi het volgende geschreven:

> Avahi doesn't work at boot because of:
>=20
> + sh /OE/../rootfs/var/lib/opkg/info/avahi-daemon.preinst
> Running useradd commands...
> grep: /OE/../rootfs/etc/passwd: No such file or directory
>=20
> That is due to:
>=20
> Package: avahi-daemon
> Version: 0.6.30-r9.0
> [..]
> Depends: libavahi-core7 (>=3D 0.6.30), libdaemon0 (>=3D 0.14), libcap2 =
(>=3D 2.22), libavahi-common3 (>=3D 0.6.30), libdbus-1-3 (>=3D 1.4.12), =
sysvinit-pidof, libc6 (>=3D 2.12), libexpat1 (>=3D 2.0.1)
>=20
> After this patch:
>=20
> Package: avahi-daemon
> Version: 0.6.30-r10.0
> [..]
> Depends: libavahi-core7 (>=3D 0.6.30), libdaemon0 (>=3D 0.14), libcap2 =
(>=3D 2.22), libavahi-common3 (>=3D 0.6.30), libdbus-1-3 (>=3D 1.4.12), =
sysvinit-pidof, libc6 (>=3D 2.12), shadow, libexpat1 (>=3D 2.0.1), =
base-passwd
>=20
> This also changes ${PN}-daemon to avahi-daemon to be consistent with =
the PACKAGES/FILES lines below
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-connectivity/avahi/avahi.inc |    7 ++++---
> 1 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc =
b/meta/recipes-connectivity/avahi/avahi.inc
> index 79cfd73..728c38f 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -14,7 +14,7 @@ SECTION =3D "network"
> # python scripts are under GPLv2+
> LICENSE =3D "GPLv2+ & LGPLv2.1+"
>=20
> -INC_PR =3D "r9"
> +INC_PR =3D "r10"
>=20
> DEPENDS =3D "expat libcap libdaemon dbus glib-2.0"
>=20
> @@ -23,8 +23,9 @@ SRC_URI =3D =
"http://avahi.org/download/avahi-${PV}.tar.gz \
>           file://99avahi-autoipd \
>           file://initscript.patch"
>=20
> -USERADD_PACKAGES =3D "${PN}-daemon"
> -USERADD_PARAM_${PN}-daemon =3D "--system --home /var/run/avahi-daemon =
\
> +USERADDPN =3D "avahi-daemon"

My gut feeling is that useradd.bbclass should add the RDEPENDS in its =
pythoncode instead of relying on people to set both USERADD_PACKAGES and =
USERADDPN to the same value.

regards,

Koen.=

--Apple-Mail=_EC72FFE9-9942-42F0-BDD7-B181B4D428CD
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6ykXAACgkQMkyGM64RGpHJzgCgjk+FrQsysvZtsPQHk6Xloi8f
/oMAnRQso9ENHbR8RFnYqMMBie8yOGRv
=6siS
-----END PGP SIGNATURE-----

--Apple-Mail=_EC72FFE9-9942-42F0-BDD7-B181B4D428CD--
