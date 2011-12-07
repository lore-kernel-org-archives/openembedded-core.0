Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYH3w-0002qH-4j
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 13:57:28 +0100
Received: by eekb15 with SMTP id b15so381286eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 04:50:39 -0800 (PST)
Received: by 10.14.19.132 with SMTP id n4mr3478261een.127.1323262235144;
	Wed, 07 Dec 2011 04:50:35 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 49sm5383005eec.1.2011.12.07.04.50.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 04:50:34 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 7 Dec 2011 13:50:29 +0100
In-Reply-To: <1323262134.30601.7.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323160412.git.Martin.Jansa@gmail.com>
	<822c669a79e5f30bda467bc3a6f7b3c92377af22.1323160412.git.Martin.Jansa@gmail.com>
	<1323262134.30601.7.camel@ted>
Message-Id: <20B8F1DB-384B-41D7-B219-EFCF6F70C822@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH][oe-core 1/3] sysstat: don't run populate-volatile.sh update in do_rootfs or without populate-volatile.sh
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
X-List-Received-Date: Wed, 07 Dec 2011 12:57:28 -0000
X-Groupsio-MsgNum: 13731
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4C52FEAF-F20F-4BE1-B119-D0C885BBE04B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4C52FEAF-F20F-4BE1-B119-D0C885BBE04B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 7 dec. 2011, om 13:48 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-12-06 at 09:35 +0100, Martin Jansa wrote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> meta/recipes-extended/sysstat/sysstat.inc       |    7 ++++++-
>> meta/recipes-extended/sysstat/sysstat_10.0.3.bb |    2 +-
>> 2 files changed, 7 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/recipes-extended/sysstat/sysstat.inc =
b/meta/recipes-extended/sysstat/sysstat.inc
>> index 2936f96..ca40ab5 100644
>> --- a/meta/recipes-extended/sysstat/sysstat.inc
>> +++ b/meta/recipes-extended/sysstat/sysstat.inc
>> @@ -22,7 +22,12 @@ do_install() {
>> }
>>=20
>> pkg_postinst_${PN} () {
>> -        /etc/init.d/populate-volatile.sh update
>> +        if [ -n "$D" ]; then
>> +                exit 1
>> +        fi
>> +        if [ -e /etc/init.d/populate-volatile.sh ]; then
>> +                /etc/init.d/populate-volatile.sh update
>> +        fi
>> }
>=20
> The subject commit message and the code match now, thanks :)
>=20
> My only other question is whether we need to run this at first boot
> time? At first boot after rootfs, populate-volatile will run anyway. =
We
> therefore don't need to run the update as a postinst on device as part
> of first boot as well as it will always be covered if present.

How does that interact with the volatiles caching logic?

regards,

Koen=

--Apple-Mail=_4C52FEAF-F20F-4BE1-B119-D0C885BBE04B
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7fYRcACgkQMkyGM64RGpHX0QCfaGoN+Q45/dpw6fiTRydy6GV2
XOEAn1Oc4KkM69FzViUG6KXu7LczmH7k
=U4nC
-----END PGP SIGNATURE-----

--Apple-Mail=_4C52FEAF-F20F-4BE1-B119-D0C885BBE04B--
