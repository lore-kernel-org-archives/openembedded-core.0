Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id BA95960116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 09:47:29 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 931D91803BF;
	Thu, 17 Dec 2015 10:47:29 +0100 (CET)
To: Roman Khimov <roman@khimov.ru>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
	<1b8e3d820ac8f20f89ba01e1f88543deed69620e.1450288828.git.mschiffer@universe-factory.net>
	<1893430.e3TcZXnnJp@masala.hex>
From: Matthias Schiffer <mschiffer@universe-factory.net>
X-Enigmail-Draft-Status: N1110
Message-ID: <567284B0.4020603@universe-factory.net>
Date: Thu, 17 Dec 2015 10:47:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1893430.e3TcZXnnJp@masala.hex>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] base-files: create typical merged /usr symlinks if the "merged-usr" distro feature is set
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
X-List-Received-Date: Thu, 17 Dec 2015 09:47:30 -0000
X-Groupsio-MsgNum: 74876
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="cuM0KojKggms9mb77kJNmHb4Qsr3FuLtx"

--cuM0KojKggms9mb77kJNmHb4Qsr3FuLtx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/16/2015 08:46 PM, Roman Khimov wrote:
> =D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 16 =D0=B4=D0=B5=
=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2015 19:12:00 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=
=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Matthias Schiffer =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>> The following options in a distro configuration create a full Fedora-s=
tyle
>> merged /usr:
>>
>>   DISTRO_FEATURES_DEFAULT +=3D "merged-usr"
>>   base_bindir =3D "${exec_prefix}/bin"
>>   base_sbindir =3D "${exec_prefix}/bin"
>>   sbindir =3D "${exec_prefix}/bin"
>>   base_libdir =3D "${exec_prefix}/${baselib}"
>>   nonarch_base_libdir =3D "${exec_prefix}/lib"
>=20
> Hmm. Why not just change the base_prefix? We've done it this way (not m=
erging=20
> bin with sbin, but that's a separate thing):
>=20
> +base_prefix =3D "/usr"
> +sysconfdir =3D "/etc"
> +localstatedir =3D "/var"

My patches don't care how base_bindir etc. are set, your way would work
with it just fine. My recommendation is to set the dirs explicitly
instead of changing the base_prefix, as other things might depend on the
base_prefix, and symlinks are created for /bin, /sbin, /lib and
/${baselib} only.

>=20
> Also, you probably want to add this symlinks to fs-perms.txt. I don't q=
uite=20
> remember which packages failed for me without it, but there were some.
>=20

Is it even possible to have fs-perms.txt entries depending on a
DISTRO_FEATURE? And can fs-perms.txt move files from one directory to
another (as you suggested in your reply for PATCH 2)?

AFAICT, fs-perms.txt is only there to fix some common issues with
directory permissions. Most packages already respect base_libdir etc.
just fine, so in my opinion it would be preferable to just fix the
packages which don't if adding such things to fs-perms.txt is non-trivial=
=2E


--cuM0KojKggms9mb77kJNmHb4Qsr3FuLtx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWcoSxAAoJEBbvP2TLIB2cDPIP/jHzvzHjbe9ocOnRjAh/K6w8
eGu++ucQwZKQzs5WqRX+fX7N+fY/mYQ0YyQnB5wI7Y1giZ/irBYAyuiNVovUYfY3
PhMYitSUmTFr1iNFnYeiuAIHysLB6ZHWvYs/8olwzOH/bPaCobcJLg1u10WTQf8j
YWWzTSoN8IGSvSNrreULfyaTndWhoC0B8RFfWPwIG1JjYx7tG1IEyFMyloLh7ObL
q0xaGn/ZLeSwzEPnJCMECcBKBlnV9GmsqXRN8+w5Pbn40FgRYd4OIfBrzNynzGcg
oaAJ2Qy6Yj7KsOikM3w1B3C6/oZLCxB4/S0bDKvGq2PvoCP4RsFEBZ6elUar7OQO
yKgi3xgVuA3s5O9lGwlmfhd3/Ldt9Nm8nweQBLh1+HqlcmgLgB8ftGtFI6CkR3t4
TejVmuxki6NSR2sBfjEkSkP1jMoB1EQnAQtiBnTcSxghnXo8jjBie0smjLYgpkTT
WTbBsVcwcsq7OnR5ZWJZaEAmhejEwTQuhzrOfpRrFaMgKZX5V7QeV0VBZmwDWO94
mrM40lkWK7z4iHmiLa8jMv7r8TMlQG86JKgqWFdBpUmuhBwooOR8aq8Livl5J67F
09d170MQJtv9oDc9nY/LLEAKe/xer9Njy+hUXnbIiNtOvLLW/sRSWMApNRu4cXxC
/WCtJaE8NGneCr+JZzEU
=FkGQ
-----END PGP SIGNATURE-----

--cuM0KojKggms9mb77kJNmHb4Qsr3FuLtx--
