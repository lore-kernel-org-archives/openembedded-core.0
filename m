Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLwpf-0000kP-L7
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 13:55:47 +0100
Received: by wyh5 with SMTP id 5so1247181wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 05:49:39 -0700 (PDT)
Received: by 10.216.80.18 with SMTP id j18mr3216722wee.18.1320324578926;
	Thu, 03 Nov 2011 05:49:38 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fw16sm9984778wbb.13.2011.11.03.05.49.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 05:49:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 3 Nov 2011 13:49:33 +0100
In-Reply-To: <1320323991.20107.49.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320191934.git.sgw@linux.intel.com>
	<9ef4f9a56a7d68c636768d2a1dbfeb9d6542b5f4.1320191934.git.sgw@linux.intel.com>
	<22CC451F-6D62-44A0-8984-489D40859F17@dominion.thruhere.net>
	<1320323991.20107.49.camel@ted>
Message-Id: <CD42B7BF-FA58-42F6-AE08-4EF68B3F43AD@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 03 Nov 2011 12:55:47 -0000
X-Groupsio-MsgNum: 11857
Content-Type: multipart/signed;
	boundary="Apple-Mail=_85D925CA-614B-47F9-BC82-5D5A5B1F6AE9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_85D925CA-614B-47F9-BC82-5D5A5B1F6AE9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 3 nov. 2011, om 13:39 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-11-03 at 13:23 +0100, Koen Kooi wrote:
>> Op 2 nov. 2011, om 01:21 heeft Saul Wold het volgende geschreven:
>>=20
>>> DBus was failing to start correct since the avahi user was
>>> not setup.
>>>=20
>>> Keep the dbus reload since this could still be installed
>>> as a package an would require a dbus restart.
>>=20
>> This doesn't seem to work for me, I keep getting "Unknown username
>> 'avahi' in message bus configuration file"
>=20
> =46rom where? On target device upgrade? do_rootfs? populate_sysroot? =
More
> info would be useful here.

On target device boot. I've narrowed it down to an RDEPENDS problem, I'm =
working out the correct cycle of _append and +=3D now

The basic problem:

Package: avahi-daemon
Version: 0.6.30-r9.0
 [..]
Depends: libavahi-core7 (>=3D 0.6.30), libdaemon0 (>=3D 0.14), libcap2 =
(>=3D 2.22), libavahi-common3 (>=3D 0.6.30), libdbus-1-3 (>=3D 1.4.12), =
sysvinit-pidof, libc6 (>=3D 2.12), libexpat1 (>=3D 2.0.1)

No 'base-passwd' in there.

>=20
>>> Fixes: [YOCTO #1699]
>>>=20
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> ---
>>> meta/recipes-connectivity/avahi/avahi.inc |   16 +++++++++-------
>>> 1 files changed, 9 insertions(+), 7 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-connectivity/avahi/avahi.inc =
b/meta/recipes-connectivity/avahi/avahi.inc
>>> index 5ad9db0..79cfd73 100644
>>> --- a/meta/recipes-connectivity/avahi/avahi.inc
>>> +++ b/meta/recipes-connectivity/avahi/avahi.inc
>>> @@ -14,7 +14,7 @@ SECTION =3D "network"
>>> # python scripts are under GPLv2+
>>> LICENSE =3D "GPLv2+ & LGPLv2.1+"
>>>=20
>>> -INC_PR =3D "r8"
>>> +INC_PR =3D "r9"
>>>=20
>>> DEPENDS =3D "expat libcap libdaemon dbus glib-2.0"
>>>=20
>>> @@ -23,7 +23,12 @@ SRC_URI =3D =
"http://avahi.org/download/avahi-${PV}.tar.gz \
>>>          file://99avahi-autoipd \
>>>          file://initscript.patch"
>>>=20
>>> -inherit autotools pkgconfig update-rc.d gettext
>>> +USERADD_PACKAGES =3D "${PN}-daemon"
>>> +USERADD_PARAM_${PN}-daemon =3D "--system --home =
/var/run/avahi-daemon \
>>> +                              --no-create-home --shell /bin/false \
>>> +                              --user-group avahi"
>>> +
>>> +inherit autotools pkgconfig update-rc.d gettext useradd
>>>=20
>>> EXTRA_OECONF =3D "--with-distro=3Ddebian \
>>>             --disable-introspection \
>>> @@ -116,15 +121,12 @@ do_install_avahi-autoipd() {
>>> 	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
>>> }
>>>=20
>>> -# At the time the postinst runs, dbus might not be setup so only =
restart if running
>>> +# At the time the postinst runs, dbus might not be setup so only =
restart if running=20
>>>=20
>>> pkg_postinst_avahi-daemon () {
>>> -	# can't do this offline
>>> 	if [ "x$D" !=3D "x" ]; then
>>> -		exit 1
>>> +		exit 0
>>> 	fi
>>=20
>> Removing that check completely would be a better idea :)
>=20
> No it wouldn't, if we're installing this at do_rootfs time, we can =
just
> mark the postinstall as done.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_85D925CA-614B-47F9-BC82-5D5A5B1F6AE9
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6yjd0ACgkQMkyGM64RGpEbHgCfSJqOGiXIounsjm9+kVT9a0J3
GnUAn2UW8XwXWh8tFe545/kh5Vkug4zj
=hcx3
-----END PGP SIGNATURE-----

--Apple-Mail=_85D925CA-614B-47F9-BC82-5D5A5B1F6AE9--
