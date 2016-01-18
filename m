Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4144C6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:Reply-To:To:From;
	bh=eoyEdF/Getl1RN0PGO+DBQnuwM9BGqvYnz8Avfb3JNg=; 
	b=sv15yeyy2mNASU+fYiMWUR9bZHOk1sOlxwj1XGBM7JynpkMqPmzZwvdU6FSjrWUWAxXFNiDbIT5yMxNJkvyg3yXOW0J+g5vQwYNXb+6upOKZ+WuMVPxynoZjvuyBVfwarImLxkFdwaSgn1wDBFaeRHWjbyFz8uiRUhonFnnW0d+x+J+BHW8uCaB7FU9B0OILW96KchirE7d3kjwCJmcdKYW9GvKXXt5EXBaWRtLLGVU8YkLOeMfFA8ukVL2tY4uBRoQiryaY+iVR66x6uUo4Omogk4rR7T2KVV+6BoUblQgOHlnKdIXufsi+TRA2if9WMrLEqU5QyJhk8hcb+MICyg==;
Received: from [93.100.16.104] (helo=masala.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>)
	id 1aL44Z-0007m2-Tb; Mon, 18 Jan 2016 10:17:58 +0300
From: Roman Khimov <roman@khimov.ru>
To: openembedded-core@lists.openembedded.org
Reply-To: roman@khimov.ru
Date: Mon, 18 Jan 2016 10:17:54 +0300
Message-ID: <1564093.TSl0G7yhEJ@masala.hex>
User-Agent: KMail/4.14.10 (Linux/4.1.13-5-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <d75d4766f208e0c33dae34f536589b78bcbf39eb.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
	<d75d4766f208e0c33dae34f536589b78bcbf39eb.1453029952.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 19/73] mtools: Fix build with uclibc
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
X-List-Received-Date: Mon, 18 Jan 2016 07:18:03 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 17 =D1=8F=D0=BD=
=D0=B2=D0=B0=D1=80=D1=8F 2016 03:35:52 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=
=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:
> --- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
> +++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
> @@ -5,6 +5,7 @@ SECTION =3D "optional"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d4=
7fae504"
>=20
> +DEPENDS +=3D "virtual/libiconv"
>=20
>  RDEPENDS_${PN}_libc-glibc =3D "glibc-gconv-ibm850"
>  RRECOMMENDS_${PN}_libc-glibc =3D "\
> @@ -35,6 +36,8 @@ inherit autotools texinfo
>=20
>  EXTRA_OECONF =3D "--without-x"
>=20
> +LDFLAGS_append_libc-uclibc =3D " -liconv "
> +
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
>  PACKAGECONFIG ??=3D ""

I've just checked to see that my mtools bbappend (based on fido) has it=
 solved=20
like this:

DEPENDS_class-target +=3D "virtual/libiconv"
export LIBS =3D "-liconv"
LIBS_class-native =3D ""

And from what I remember, I had some issue building native package with=
=20
'DEPENDS +=3D'. Although that's an old branch and probably things are d=
ifferent=20
now.

Same thing with parted.

--=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

