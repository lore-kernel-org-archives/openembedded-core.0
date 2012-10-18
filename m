Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOymC-0002ui-Us
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 00:41:16 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2422828wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 15:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7hXs0G5sNYjIEuUTHeeg/nuvGLK+lMDyZ7ZvsESbc3I=;
	b=Cmq09SeC23zaMiSVCHWcXKdIDOEnN+7sBEd7kb34KNtMhlWDm7ym5VNlK7ElqJjaKm
	Eu1ozmkJXz+6fZNjjE7R4cLcDRVBjIFTcjIZg1WpU6LKG6aaDqGDz7RcIYWWMXkY6kEg
	77uPZa/tpOy6I2CWw1qStolBLmkWFKCaA9F0htlHHMEBkw8Mx+QIhoBMgVDKpbri+maF
	9pNHuU+FFx2qdb/gQ4nIOYV9as54cGCqYF/009n4QBJdkR7L1AIlrewAo/gf2nSh+IdM
	Sdk1qG8mq07tTsibhrFHutxCR7x1HHJSLmAE5i4847MoZFC5JExRZdyC9aksPh6guBHz
	8WQA==
Received: by 10.180.82.72 with SMTP id g8mr13846539wiy.20.1350599276975;
	Thu, 18 Oct 2012 15:27:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm31752311wib.10.2012.10.18.15.27.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 15:27:56 -0700 (PDT)
Date: Fri, 19 Oct 2012 00:28:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20121018222806.GF3087@jama.jama.net>
References: <1350598767.4470.179.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1350598767.4470.179.camel@x121e.pbcl.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpan-base: Add more debug paths to FILES
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
X-List-Received-Date: Thu, 18 Oct 2012 22:41:17 -0000
X-Groupsio-MsgNum: 30712
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Content-Disposition: inline

--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 11:19:27PM +0100, Phil Blundell wrote:
> We seem to be mostly installing modules into vendor_perl nowadays.
> Make sure that the .debug data from there is captured appropriately.
>=20
> Also, expand ${PERLLIBDIRS} at the point of assignment so we don't
> call the python again and again.
>=20
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/classes/cpan-base.bbclass |    9 +++++++--
>  1 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbcl=
ass
> index 660c15f..cf697f1 100644
> --- a/meta/classes/cpan-base.bbclass
> +++ b/meta/classes/cpan-base.bbclass
> @@ -39,8 +39,13 @@ def is_target(d):
>          return "yes"
>      return "no"
> =20
> -PERLLIBDIRS =3D "${@perl_get_libdirs(d)}"
> +PERLLIBDIRS :=3D "${@perl_get_libdirs(d)}"
> +PERLVERSION :=3D "${@get_perl_version(d)}"
> =20
>  FILES_${PN}-dbg +=3D "${PERLLIBDIRS}/auto/*/.debug \
>                      ${PERLLIBDIRS}/auto/*/*/.debug \
> -                    ${PERLLIBDIRS}/auto/*/*/*/.debug"
> +                    ${PERLLIBDIRS}/auto/*/*/*/.debug \
> +		    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/.debug \
> +		    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/.debug \
> +		    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/.debug \
> +		    "

Please don't mix tabs and spaces for indentation.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCAgnYACgkQN1Ujt2V2gBxOKACePmcaV90Tgk/Yq4cgBzpdwNIR
R6cAoLPbKWDmdi4nS6rTYBMUvGceLlLO
=wX41
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--
