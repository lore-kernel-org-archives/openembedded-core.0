Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SXqPC-00049t-OE
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 11:01:54 +0200
Received: by bkcjm2 with SMTP id jm2so554330bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 01:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fyJiDvjtsIQXpyMbZCtWofn6NEwjZ2KSdr0sTPWWAzE=;
	b=N+qI9JCXcFo0nMN4d3JLDZ0RreXYQsICefhK//EB8WaSXSpGxsq2JErTgOPONWBPLY
	hziEv/JGzueNGjujAIlNBXOzodV8qrKPily5LaryY8Hc31jCo0b1/mqWGCz5Tf+gyosR
	rWAIyGh1xuYlmVma9H0qmHU4buyhdTNm9a4Ijs/eZckp9yT1Wn6B2ZwEbExQlI1SlFIe
	Jwtv4UrUosn07pfhZ/HKbbIXhS2p+Cg/kCuKHKU+L/JGuAsJUWltsfqZbPnDgHJBm+tq
	8RZWm+einSfK3bupUsmf5b5TVXjucWRZ4R7K4ov5VkiWXgeg0tRY3+0EaoPMpTxEWl2l
	oG5w==
Received: by 10.205.118.9 with SMTP id fo9mr1097065bkc.58.1337935902734;
	Fri, 25 May 2012 01:51:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n19sm5486038bkv.14.2012.05.25.01.51.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 01:51:41 -0700 (PDT)
Date: Fri, 25 May 2012 10:51:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120525085145.GC3138@jama.jama.net>
References: <1337932878.20169.5.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1337932878.20169.5.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@openembedded.org>
Subject: Re: [PATCH] glib-2.0: Clean up OECONF flags into one variable
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
X-List-Received-Date: Fri, 25 May 2012 09:01:54 -0000
X-Groupsio-MsgNum: 22793
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jousvV0MzM2p6OtC"
Content-Disposition: inline

--jousvV0MzM2p6OtC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 25, 2012 at 09:01:18AM +0100, Richard Purdie wrote:
> Without this change, libelf was "floating" for linuxstdbase for example,
> leading to build failures. This patch moves all the common options
> into a common variable.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.32.3.bb
> index c453941..64441ee 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
> @@ -21,8 +21,6 @@ SRC_URI[sha256sum] =3D "b65ceb462807e4a2f91c95e4293ce6b=
befca308cb44a1407bcfdd9e403
>  SRC_URI_append_virtclass-native =3D " file://glib-gettextize-dir.patch"
>  BBCLASSEXTEND =3D "native nativesdk"
> =20
> -EXTRA_OECONF =3D "--disable-libelf"
> -
>  PERLPATH =3D "${bindir}/env perl"
>  PERLPATH_virtclass-native =3D "/usr/bin/env perl"
>  PERLPATH_virtclass-nativesdk =3D "/usr/bin/env perl"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index 33f7613..1dbd538 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -25,9 +25,11 @@ inherit autotools pkgconfig gettext
> =20
>  S =3D "${WORKDIR}/glib-${PV}"
> =20
> -EXTRA_OECONF =3D "--disable-debug --enable-included-printf=3Dno --disabl=
e-dtrace --disable-fam"
> -EXTRA_OECONF_virtclass-native =3D "--disable-dtrace --disable-systemtap =
--disable-fam"
> -EXTRA_OECONF_linuxstdbase =3D "--enable-included-printf=3Dno --disable-d=
trace --disable-fam"
> +CORECONF =3D "--disable-dtrace --disable-fam --disable-libelf --disable-=
systemtap"
> +
> +EXTRA_OECONF =3D "--disable-debug --enable-included-printf=3Dno ${CORECO=
NF}"
> +EXTRA_OECONF_virtclass-native =3D "${CORECONF}"
> +EXTRA_OECONF_linuxstdbase =3D "--enable-included-printf=3Dno ${CORECONF}"
> =20
>  FILES_${PN} =3D "${libdir}/lib*${SOLIBS} ${sysconfdir}/bash_completion.d=
 ${datadir}/glib-2.0/schemas"
>  FILES_${PN}-dev +=3D "${libdir}/glib-2.0/include \

Ah sorry for that EXTRA_OECONF in .bb, looks much better, please add PR
bump.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jousvV0MzM2p6OtC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+/SCEACgkQN1Ujt2V2gBx8RgCguTajLVavLO0hfPOTzqljud2C
01MAnjavErJv/EtVq5EVcNOFHkhnlDVT
=+fEj
-----END PGP SIGNATURE-----

--jousvV0MzM2p6OtC--
