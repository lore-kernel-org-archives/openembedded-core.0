Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7C560D57
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 09:36:11 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so923717eek.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 01:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bFr0/R6/5U4fiuVPiqu3iaJ/sp3TPVQQOJfA3iV7ARM=;
	b=e9pdg6ccM3npLhqaCer3c/8ZRSAj5mLvBfhKA+vlWOnQsxpm74jAkIaxsGVBuSl4k2
	x88vNJ/teBgL5Tk1dyZrxJIUTKdnF87JhLrrXVUHaZ5w+SMSOwT548Rfd6v7OzIXoxuW
	BpELAnTdYR4Hb6s8VWYMGZbdo0GV8DQmU+SoPqqabrs2bU5TXN6pHMRJ4uDkgNRoDq6k
	290Q04yJgdn4X2rSUXN1q9zAVuhuc+nkZOhQfPu4yxiyUyQI82BBmM0rBaQb0fkXRbp1
	5V97TLzDJa1ZPCjUhVN/64qDveyh/O5ym/agsIIBJPl/3uFySFzppbe99W98U/FawdtC
	lhGQ==
X-Received: by 10.14.194.131 with SMTP id m3mr4855913een.2.1387532171975;
	Fri, 20 Dec 2013 01:36:11 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm16922236eel.2.2013.12.20.01.36.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Dec 2013 01:36:10 -0800 (PST)
Date: Fri, 20 Dec 2013 10:36:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20131220093645.GR3706@jama>
References: <1387521668-26329-1-git-send-email-sgw@linux.intel.com>
	<1387521668-26329-4-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1387521668-26329-4-git-send-email-sgw@linux.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] openssl: use PACKAGECONFIG to disable perl bits
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
X-List-Received-Date: Fri, 20 Dec 2013 09:36:11 -0000
X-Groupsio-MsgNum: 48351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KAk/33nSS6LK84p9"
Content-Disposition: inline

--KAk/33nSS6LK84p9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2013 at 10:41:07PM -0800, Saul Wold wrote:
> Adding perl to the RDEPENDS caused a performance hit to the overall build=
 time since this was
> the only package that depended on perl.  The openssl-misc package is not =
installed by default
> so use a PACKAGECONFIG which can be overridden to allow the perl scripts =
along with  perl to
>  be installed.
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes=
-connectivity/openssl/openssl.inc
> index cdb1809..c58c99f 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -13,8 +13,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df9a8f9681073=
45e0b75aa8c2ecaa7ec8"
> =20
>  DEPENDS =3D "perl-native-runtime"
> =20
> -# Adding RDEPENDS for perl scripts
> -RDEPENDS_${PN}-misc +=3D"perl"
> +PACKAGECONFIG[perl] =3D ",,,perl"

Doesn't it add perl to ${PN} (instead of ${PN}-misc)?

>  SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>            "
> @@ -157,11 +156,18 @@ do_install () {
> =20
>  	install -d ${D}${includedir}
>  	cp --dereference -R include/openssl ${D}${includedir}
> -	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
> =20
>  	oe_multilib_header openssl/opensslconf.h
> -	# The c_rehash utility isn't installed by the normal installation proce=
ss.
> -	install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
> +	if [ "${@base_contains('PACKAGECONFIG', 'perl', 'perl', '', d)}" =3D "p=
erl" ]; then
> +		install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
> +		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${bindir}/c_rehash
> +		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
> +		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/tsget
> +		# The c_rehash utility isn't installed by the normal installation proc=
ess.
> +	else
> +		rm -f ${D}${bindir}/c_rehash
> +		rm -f ${D}${libdir}/ssl/misc/CA.pl ${D}${libdir}/ssl/misc/tsget
> +	fi
>  }
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KAk/33nSS6LK84p9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlK0D60ACgkQN1Ujt2V2gBz87ACfdpl/gcigua583MrNoKjjU9SE
nz4Ani1bmGxxtxTx4M2ti9XRtQffJqXc
=Nm7B
-----END PGP SIGNATURE-----

--KAk/33nSS6LK84p9--
