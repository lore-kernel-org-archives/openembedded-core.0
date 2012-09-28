Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THaf2-0005SO-BU for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:31:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDIQOE010389;
	Fri, 28 Sep 2012 14:18:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10054-04; Fri, 28 Sep 2012 14:18:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDIIDd010383
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 14:18:19 +0100
Message-ID: <1348838300.15753.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steven Munk =?ISO-8859-1?Q?=D8stergaard?= <sml@rosetechnology.dk>
Date: Fri, 28 Sep 2012 14:18:20 +0100
In-Reply-To: <50646480.40108@rosetechnology.dk>
References: <50646480.40108@rosetechnology.dk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q8SDIQOE010389
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Fail in perl-native_5.14.2.bb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 13:31:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-27 at 16:36 +0200, Steven Munk =C3=98stergaard wrote:
> Hello, peace be with thee... :)
>=20
> I found a mistake in the "do_configure()" function of:=20
> "perl-native_5.14.2.bb"
>=20
> I am not experienced enough with mailing list to produce patches, but i=
=20
> will try...
>=20
> Explanation:
> sed is in " -e "s%/perl5%/perl%g" \ " replacing parts of @DESTDIR@ whic=
h=20
> makes its patch way to long and doubles up parts of it's folders...
> This patch works for me...
>=20
>=20
> Index: perl/perl_5.14.2.bb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- perl.orig/perl_5.14.2.bb
> +++ perl/perl_5.14.2.bb
> @@ -146,14 +146,14 @@ do_configure() {
>       ${@base_contains('DISTRO_FEATURES', 'largefile', '',=20
> 'do_nolargefile', d)}
>=20
>           # Update some paths in the configuration
> -        sed -i -e 's,@DESTDIR@,${prefix},g' \
> -               -e 's,@ARCH@-thread-multi,,g' \
> +        sed -i -e 's,@ARCH@-thread-multi,,g' \
>                  -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
>                  -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
>                  -e "s%\([ \"^\',=3D]\+\)/usr/include%\1${STAGING_INCDI=
R}%g" \
>              -e "s%\([ \"^\',=3D]\+\)/usr/lib/%\1${libdir}/%g" \
>              -e "s%\([ \"^\',=3D]\+\)/usr/%\1${exec_prefix}/%g" \
>              -e "s%/perl5%/perl%g" \
> +           -e 's,@DESTDIR@,${prefix},g' \
>               config.sh-${TARGET_ARCH}-${TARGET_OS}
>=20
>       case "${TARGET_ARCH}" in

Thanks, there are a number of problems in this area. Please see the
patch I just posted which hopefully addresses all this once and for all.

Cheers,

Richard



