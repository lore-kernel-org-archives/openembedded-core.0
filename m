Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E6FF07320D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:44:44 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Z9eyz-0006lW-Bw from drew_moseley@mentor.com ;
	Mon, 29 Jun 2015 12:44:45 -0700
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) with mapi id
	14.03.0224.002; Mon, 29 Jun 2015 12:44:44 -0700
From: "Moseley, Drew" <drew_moseley@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH] mesa: Add blank r600 PACKAGECONFIG
Thread-Index: AQHQspjOTgsvFmoYwEWAQXGfbi62lZ3EVOkAgAADUwA=
Date: Mon, 29 Jun 2015 19:44:44 +0000
Message-ID: <AA8A0B9B-E310-4C1C-9DF9-884455D6FC14@mentor.com>
References: <1435602230-12093-1-git-send-email-drew_moseley@mentor.com>
	<20150629193248.GG2393@jama>
In-Reply-To: <20150629193248.GG2393@jama>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Add blank r600 PACKAGECONFIG
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
X-List-Received-Date: Mon, 29 Jun 2015 19:44:49 -0000
X-Groupsio-MsgNum: 67316
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F19C3355-88E2-4F09-AF6C-7F90C74F0030";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F19C3355-88E2-4F09-AF6C-7F90C74F0030
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 29, 2015, at 3:32 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Mon, Jun 29, 2015 at 02:23:50PM -0400, Drew Moseley wrote:
>> Fixes warnings such as:
>>    WARNING: mesa: invalid PACKAGECONFIG: r600
>> when building with the r600 configuration.
>=20
> Shouldn't you fix your PACKAGECONFIG value instead (wherever it's set =
to
> include r600)?

It=E2=80=99s very possible that this is not the best solution for the =
warning.  The line that sets the GALLIUMDRIVERS_LLVM33 variable right =
above the line I added is ultimately what I=E2=80=99m trying to have =
behave properly.  Previously setting PACKAGECONFIG+=3D=E2=80=9Cr600=E2=80=9D=
 was sufficient to enable this setting but with commit hash =
c2cbe0f60e6d19ab9a8321be74d636d2c36671a8 this now throws a warning.  Any =
suggestions for a cleaner solution?

Drew

>=20
>>=20
>> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
>> ---
>> meta/recipes-graphics/mesa/mesa.inc | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc =
b/meta/recipes-graphics/mesa/mesa.inc
>> index 97ed02f..09e80e8 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -53,6 +53,7 @@ PACKAGECONFIG[openvg] =3D "--enable-openvg, =
--disable-openvg"
>>=20
>> GALLIUMDRIVERS =3D "swrast"
>> GALLIUMDRIVERS_LLVM33 =3D "${@bb.utils.contains('PACKAGECONFIG', =
'r600', 'radeonsi,r600', '', d)}"
>> +PACKAGECONFIG[r600] =3D ""
>> GALLIUMDRIVERS_LLVM33_ENABLED =3D =
"${@base_version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False, =
len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
>> GALLIUMDRIVERS_LLVM =3D =
"r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if =
${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
>> GALLIUMDRIVERS_append_x86 =3D "${@bb.utils.contains('PACKAGECONFIG', =
'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
>> --
>> 1.9.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


--Apple-Mail=_F19C3355-88E2-4F09-AF6C-7F90C74F0030
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iD8DBQFVkaAr++E4Rrql4XYRAloiAKCZvjG6Ae31zmY1GSCZHrdT+cmvZgCghN8Y
wXzP2v8xhPWQKsmTwUMdbRQ=
=kmuS
-----END PGP SIGNATURE-----

--Apple-Mail=_F19C3355-88E2-4F09-AF6C-7F90C74F0030--
