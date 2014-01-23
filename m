Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id C2EA76D02F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 01:16:46 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id uo5so1159831pbc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 17:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:in-reply-to:references
	:mime-version:content-type;
	bh=ZND6UA2PopcHFDNHTQ/ahOZ9RWZuBJg7W1piKxpTNqM=;
	b=Cu5A9NiInFiB+rIYKMruDKISjqmwGiZI9YDF4atUvukSFLtVZ7X0O13p5ujW7pDUKt
	Ml9zONBEZRR85b5bxFXy7obmxCuPgKd6aD6Wovhc/CTv/OhVgj1xKZKmPo5O0aPPet7N
	MLLKcMDGTx5ZOTw37Fd9gY4wsAg+C1iLY8j59vGiYCEiJ2dyCMxxm5s/aerrs9t5fqLf
	o4PaZCwiOpOMUV1TDi3cAILQ/NMsG6WhiQsh8d4Ph8i+br8Uzu7IC6a88vF4OTfg3xBD
	KV+eXoV2L7orn1wr3lyOUNLrxZXzeL4Vsavg6qk1U0m96gLCM+BtF+T8TCRF1Me2Navr
	T9Qw==
X-Received: by 10.66.137.109 with SMTP id qh13mr5075167pab.140.1390439807676; 
	Wed, 22 Jan 2014 17:16:47 -0800 (PST)
Received: from leo.localnet ([66.129.239.12]) by mx.google.com with ESMTPSA id
	de3sm29100525pbb.33.2014.01.22.17.16.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 17:16:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 17:16:41 -0800
Message-ID: <1760931.7HjZTF9m8R@leo>
X-Face: (*D:+-|[O9m:a&dKxg#R`m^Nxy<HmNPV<Ic-_>RMPm0'o70t~39kUjcE\?l`>41l^%&x; O
	ss*RIK.m#<6OwX.R&K={4[\RYyqeUgI^7G0BRJfLXVkrEjSlX5rk\rOt"ur?`%"2}`hDBt
	QHQ|<@r6-hq"([T&r02ayw^tEXBwsh6g%qt!Q?)*H$OE6mk^BUm30s`G[u:_wi&vIUh&Lh
	L_.\+; 0Q:nB(8TJq\bWseix)aav+[*-wMDT5+55W^jS%u-J{Hv)&lSoaU^m_+*>]"
User-Agent: KMail/4.12.1 (Linux/3.12.8-1-ARCH; KDE/4.12.1; x86_64; ; )
In-Reply-To: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
References: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] boost: Convert ??= weaker assingment to weak ?= assignment
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
X-List-Received-Date: Thu, 23 Jan 2014 01:16:47 -0000
X-Groupsio-MsgNum: 49401
Content-Type: multipart/signed; boundary="nextPart10792751.cFt77ioVkQ";
	micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart10792751.cFt77ioVkQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday, December 06, 2013 05:42:26 PM Khem Raj wrote:
> ??=3D does not react at all with
> BOOST_LIBS +=3D "${@base_contains('PACKAGECONFIG', 'python', 'python'=
, '',
> d)}"
>=20
> even though we have
>=20
> PACKAGECONFIG ??=3D "" it does not honor it and always add python to
> BOOST_LIBS but the dependency is not added so it fails to build
> complaining for missing python headers which is a understood outcome
>=20
> When converted to ?=3D it works as expected and only add --with-pytho=
n
> in bjam when python is specified in PACKAGECONFIG otherwise not.
>=20
> Is it a bitbake bug ? in anycase ?=3D should be enough of loose rope
> to let user/distro configure the packageconfig policy
>

OK so the problem is that I have meta-ros in my layer-mix and in that l=
ayer
it defines PACKAGECONFIG ?=3D "python" IMO it should have appended inst=
ead of
redefining. Thats why I was seeing what I was seeing.=20
=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/boost/boost.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/boost/boost.inc
> b/meta/recipes-support/boost/boost.inc index f13051c..f0f9eb8 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -19,7 +19,7 @@ BOOST_LIBS =3D "\
>  =09"
>=20
>  # optional boost-python library
> -PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG ?=3D ""
>  PACKAGECONFIG[python] =3D ",,python"
>  BOOST_LIBS +=3D "${@base_contains('PACKAGECONFIG', 'python', 'python=
', '',
> d)}" inherit python-dir



=2D-=20
=2DKhem

--nextPart10792751.cFt77ioVkQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlLgbYoACgkQuwUzVZGdMxS9eACfQ8D2KU2IgbQKBTnf4g0WA8yE
z/4AnRAICIT2kcZoDHkEpcYZQljKWEYS
=Vh6o
-----END PGP SIGNATURE-----

--nextPart10792751.cFt77ioVkQ--
