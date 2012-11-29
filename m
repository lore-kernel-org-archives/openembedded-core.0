Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Te4MB-0000H5-D2
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 14:40:47 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so7979420eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 05:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ViMQVivCTMvtjCeYCKyOMmLQoNGWDx3IjXD4sZiUo64=;
	b=d6la41J+4ksDKYXpTBIer7HjSeIFiUrMYnfeJKySk4Y9PWOd2dNuPfxAENMi7dvTNT
	D2cziZRhxmrghotycpVEMlyby4CFODNhrrVyff2yBgmqheRdzPgPIaT3Qik4Z8TzCvq5
	u0iprxcH5ChxhBqce5mMG+8ffF3l5Ty1maPHLgpPYn71Kp0y1hutd9ezThQ3FsDVGROF
	FJ7OD8Sip2VLT81REK7bsc/nrK0e6tZ8e4JpH7veVi82oWIIpK27M7kZO6Ve6Qp46YtB
	nRZcOS+l0PIQdbAw9fEvWSYNzJhgn68GBdrHg/T6IGxt8ijN5yRnQoYUR55z+q+hobix
	OZwQ==
Received: by 10.14.225.72 with SMTP id y48mr78267302eep.46.1354195591652;
	Thu, 29 Nov 2012 05:26:31 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm3593527eep.9.2012.11.29.05.26.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 05:26:30 -0800 (PST)
Date: Thu, 29 Nov 2012 14:26:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20121129132627.GG3477@jama.jama.net>
References: <1354194369-17500-1-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1354194369-17500-1-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer: Fix plugin builds
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
X-List-Received-Date: Thu, 29 Nov 2012 13:40:47 -0000
X-Groupsio-MsgNum: 31932
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline

--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2012 at 06:06:09AM -0700, Gary Thomas wrote:
> Not all gstreamer plugins have localized documentation trees.

This change looks good, just curious, which plugins recipe does not have
po subdirectory?

Something outside oe-core? Because all 4 included in oe-core worked fine:
meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb:require gst-pl=
ugins.inc
meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb:require gst-p=
lugins.inc
meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb:require gst-p=
lugins.inc
meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb:require gst-p=
lugins.inc

Cheers,

>=20
> The commit
>   commit f50e2984d9411a059b86d6c158e9416fceb84c3d
>   Author: Martin Jansa <martin.jansa@gmail.com>
>   Date:   Wed Nov 28 15:59:48 2012 +0100
> breaks the build for such packages because the file "po/Makefile.in.in"
> is not present.
>=20
> This change allows building without the po/ subdirectory.
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta/recipes-multimedia/gstreamer/gst-plugins.inc |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/rec=
ipes-multimedia/gstreamer/gst-plugins.inc
> index 07b26a3..fc9567a 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> @@ -23,5 +23,7 @@ PACKAGES_DYNAMIC +=3D "^${PN}-.*"
>  # ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before config=
ure is executed=20
>  # http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/0=
32233.html
>  oe_runconf_prepend() {                                                  =
                                                                           =
        =20
> -	sed -i -e "1a\\" -e 'GETTEXT_PACKAGE =3D @GETTEXT_PACKAGE@' ${S}/po/Mak=
efile.in.in
> +	if [ -e ${S}/po/Makefile.in.in ]; then
> +		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE =3D @GETTEXT_PACKAGE@' ${S}/po/Ma=
kefile.in.in
> +	fi
>  }                                                                       =
                                                                           =
        =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC3YoMACgkQN1Ujt2V2gBwQGACglwhjC3xASycU7XTJ2H6cuqAK
x1AAoLguSflKTGUlkcNd83+XvQcPyJH8
=AnOv
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--
