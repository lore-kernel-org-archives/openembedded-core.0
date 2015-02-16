Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7A09F606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:09:54 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id m14so23303301wev.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 05:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=x5kk5va8Jya+GftRgbDyrA51o0UasIS9n9MDIiipeKU=;
	b=n9HkSf/YWGYltbgwdqwYuIYeotRQXYWPdLUSGgp8FJIcWZbIw85yIYQ3z4WzwGFNnQ
	+Udwh3IaFxIYF5sjpMbhxTHA+lm/wGKyrsbA+EqLyPLT1clMLG3A41N9+Op0GNXNHjou
	ssEapbsBi+5Wvmz3aeQzGnE/hdM34LMPRSQMsdAYHcO/vHiNEZePzQwbOIdggJnLT5Y9
	ZWvsGA9iAbOaE83ngCb3GBVnfwSIYqjJNAdcV38ktBPaN0j7GC+qTDDfdqNBEe7HHYJn
	RHtEu2/MFTOYNhdVRQh+UgdADrn7rjyGqwvQ5IZklCmPwtd5RhNay7djutJDOIxdsTrk
	Tlow==
X-Received: by 10.180.75.132 with SMTP id c4mr38712032wiw.78.1424092195393;
	Mon, 16 Feb 2015 05:09:55 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj5sm22799734wjb.28.2015.02.16.05.09.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 05:09:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Feb 2015 14:10:03 +0100
To: brendan.le.foll@intel.com
Message-ID: <20150216131003.GG2297@jama>
References: <1424085509-25433-1-git-send-email-brendan.le.foll@intel.com>
	<1424085509-25433-2-git-send-email-brendan.le.foll@intel.com>
MIME-Version: 1.0
In-Reply-To: <1424085509-25433-2-git-send-email-brendan.le.foll@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: disable SSLv3 by default
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
X-List-Received-Date: Mon, 16 Feb 2015 13:09:54 -0000
X-Groupsio-MsgNum: 62423
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHbokkKX1kTiQeDC"
Content-Disposition: inline

--xHbokkKX1kTiQeDC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 11:18:29AM +0000, brendan.le.foll@intel.com wrote:
> From: Brendan Le Foll <brendan.le.foll@intel.com>
>=20
> Because of the SSLv3 POODLE vulnerability, it's preferred to simply disab=
le
> SSLv3 even if patched with the TLS_FALLBACK_SCSV
>=20
> Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes=
-connectivity/openssl/openssl.inc
> index 6eb1b5e..ba9bca6 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -50,6 +50,10 @@ CONFFILES_openssl-conf =3D "${libdir}/ssl/openssl.cnf"
>  RRECOMMENDS_libcrypto +=3D "openssl-conf"
>  RDEPENDS_${PN}-ptest +=3D "${PN}-misc make perl perl-module-filehandle b=
c"
> =20
> +# Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the=
 POODLE
> +# vulnerability
> +EXTRA_OECONF =3D " -no-ssl3"

Why not use PACKAGECONFIG to make it easier to enable from distro
config or bbappend?

> +
>  do_configure_prepend_darwin () {
>  	sed -i -e '/version-script=3Dopenssl\.ld/d' Configure
>  }
> --=20
> 2.2.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xHbokkKX1kTiQeDC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTh7CsACgkQN1Ujt2V2gBw7VQCfQq/Ffv58HQIP/U/SIkJZysIC
SakAn3eco5AKAmexdupwg7aOPMoKp/33
=pCpI
-----END PGP SIGNATURE-----

--xHbokkKX1kTiQeDC--
