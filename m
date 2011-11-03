Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLweg-0000S0-7t
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 13:44:26 +0100
Received: by wwf27 with SMTP id 27so543278wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 05:38:14 -0700 (PDT)
Received: by 10.216.14.36 with SMTP id c36mr2759095wec.84.1320323894652;
	Thu, 03 Nov 2011 05:38:14 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a27sm9921230wbp.16.2011.11.03.05.38.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 05:38:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 3 Nov 2011 13:38:07 +0100
In-Reply-To: <22CC451F-6D62-44A0-8984-489D40859F17@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320191934.git.sgw@linux.intel.com>
	<9ef4f9a56a7d68c636768d2a1dbfeb9d6542b5f4.1320191934.git.sgw@linux.intel.com>
	<22CC451F-6D62-44A0-8984-489D40859F17@dominion.thruhere.net>
Message-Id: <9971B226-F171-4D8E-B751-B358923CD41A@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [Pull v3 1/4] avahi: use useradd to create avahi user for avahi-daemon
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
X-List-Received-Date: Thu, 03 Nov 2011 12:44:26 -0000
X-Groupsio-MsgNum: 11853
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7CB0F959-ABC0-465F-8457-54205A8E31B1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7CB0F959-ABC0-465F-8457-54205A8E31B1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 3 nov. 2011, om 13:23 heeft Koen Kooi het volgende geschreven:

>=20
> Op 2 nov. 2011, om 01:21 heeft Saul Wold het volgende geschreven:
>=20
>> DBus was failing to start correct since the avahi user was
>> not setup.
>>=20
>> Keep the dbus reload since this could still be installed
>> as a package an would require a dbus restart.
>=20
> This doesn't seem to work for me, I keep getting "Unknown username =
'avahi' in message bus configuration file"

Manually running the preinst on the target *does* work, so something =
isn't right during do_rootfs.

regards,

Koen


>=20
>=20
>>=20
>> Fixes: [YOCTO #1699]
>>=20
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>> meta/recipes-connectivity/avahi/avahi.inc |   16 +++++++++-------
>> 1 files changed, 9 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/meta/recipes-connectivity/avahi/avahi.inc =
b/meta/recipes-connectivity/avahi/avahi.inc
>> index 5ad9db0..79cfd73 100644
>> --- a/meta/recipes-connectivity/avahi/avahi.inc
>> +++ b/meta/recipes-connectivity/avahi/avahi.inc
>> @@ -14,7 +14,7 @@ SECTION =3D "network"
>> # python scripts are under GPLv2+
>> LICENSE =3D "GPLv2+ & LGPLv2.1+"
>>=20
>> -INC_PR =3D "r8"
>> +INC_PR =3D "r9"
>>=20
>> DEPENDS =3D "expat libcap libdaemon dbus glib-2.0"
>>=20
>> @@ -23,7 +23,12 @@ SRC_URI =3D =
"http://avahi.org/download/avahi-${PV}.tar.gz \
>>          file://99avahi-autoipd \
>>          file://initscript.patch"
>>=20
>> -inherit autotools pkgconfig update-rc.d gettext
>> +USERADD_PACKAGES =3D "${PN}-daemon"
>> +USERADD_PARAM_${PN}-daemon =3D "--system --home =
/var/run/avahi-daemon \
>> +                              --no-create-home --shell /bin/false \
>> +                              --user-group avahi"
>> +
>> +inherit autotools pkgconfig update-rc.d gettext useradd
>>=20
>> EXTRA_OECONF =3D "--with-distro=3Ddebian \
>>             --disable-introspection \
>> @@ -116,15 +121,12 @@ do_install_avahi-autoipd() {
>> 	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
>> }
>>=20
>> -# At the time the postinst runs, dbus might not be setup so only =
restart if running
>> +# At the time the postinst runs, dbus might not be setup so only =
restart if running=20
>>=20
>> pkg_postinst_avahi-daemon () {
>> -	# can't do this offline
>> 	if [ "x$D" !=3D "x" ]; then
>> -		exit 1
>> +		exit 0
>> 	fi
>=20
> Removing that check completely would be a better idea :)
>=20
> regards,
>=20
> Koen


--Apple-Mail=_7CB0F959-ABC0-465F-8457-54205A8E31B1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEUEARECAAYFAk6yiy8ACgkQMkyGM64RGpHpyACY/pdriAYpJ9HwHuKONG09oWU4
sACdEcvspii+yCN4O6hAzA0ol+fxyJ8=
=uxld
-----END PGP SIGNATURE-----

--Apple-Mail=_7CB0F959-ABC0-465F-8457-54205A8E31B1--
