Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAKky-0002So-Mg for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 13:35:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LCQJk9001561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:26:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00980-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:26:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LCQ9av001555
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:26:11 GMT
Message-ID: <1332332772.9740.146.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 12:26:12 +0000
In-Reply-To: <1332328101-22779-1-git-send-email-eric@eukrea.com>
References: <1332328101-22779-1-git-send-email-eric@eukrea.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q2LCQJk9001561
Subject: Re: [PATCH] speex: fix FILES variables
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
X-List-Received-Date: Wed, 21 Mar 2012 12:35:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-21 at 12:08 +0100, Eric B=C3=A9nard wrote:
> actually FILES_${PN} and FILES_${PN}-dev match the same files.
> these files are supposed to go into ${PN} so remove the other entry.
>=20
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
>  meta/recipes-multimedia/speex/speex_1.2rc1.bb |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recip=
es-multimedia/speex/speex_1.2rc1.bb
> index fe46a00..7370134 100644
> --- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> +++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D314649d8ba9d=
d7045dfb6683f298d0a8 \
>                      file://include/speex/speex.h;beginline=3D1;endline=
=3D34;md5=3Da68129f78d7fe66e07163f73aba143b3"
>  DEPENDS =3D "libogg"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.=
tar.gz"
> =20
> @@ -24,5 +24,4 @@ EXTRA_OECONF =3D " --enable-fixed-point --with-ogg-li=
braries=3D${STAGING_LIBDIR} \
> =20
>  PACKAGES +=3D "${PN}-bin"
>  FILES_${PN} =3D "${libdir}/lib*.so.*"
> -FILES_${PN}-dev +=3D "${libdir}/lib*.so.*"
>  FILES_${PN}-bin =3D "${bindir}"

Doesn't this mean -dev files are ending up in the main package?

Shouldn't this be:

FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
FILES_${PN}-dev =3D "${libdir}/lib*${SOLIBSDEV}"

or better, remove these and add:

inherit lib_package

?

Cheers,

Richard



