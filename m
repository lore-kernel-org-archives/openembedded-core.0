Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 907726D73C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 15:54:54 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so13979090eaj.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2013 07:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=l2hJBlBw7uwdaDpxFNWD6MrExR3issrmCf9hvY6mAfI=;
	b=MDnOAL/cQgX+bV932IcM0IJ3RiBiknt9xmouZZrRxuIjUbGIzt4O7mh2+zBQ/7vOUB
	9oiRckLXngCg6ZY3ExOiPGRyJF0an7Zdgx9PoVS82S8gdZtOAdlgemXXlsJ4gIIWoYfx
	F7q21rraNGAY3dESXr43oTQ1nazLmyXkYI7rQUu3gDdc73nrxcXBn+FGw0Q1XVcnSaU0
	qilA97dXDUrTmnWx31aAWe9pldC5Y36giXTkbL8ugikSwF/np8IWgHsgNT1EYrHKdbjr
	dj4Z+QcrPA0WgYfaQmQKIGfi8UluIt2FM2XkE8ehBi+DDCYhgY6X/Xh5iFDWUp4+y+XF
	Jy2A==
X-Received: by 10.14.114.71 with SMTP id b47mr71983258eeh.26.1386086093412;
	Tue, 03 Dec 2013 07:54:53 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm84041534eew.18.2013.12.03.07.54.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Dec 2013 07:54:52 -0800 (PST)
Date: Tue, 3 Dec 2013 16:55:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131203155502.GE3714@jama>
References: <1385765549-20934-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1385765549-20934-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH] cpan-base: Add vardepvalue to get_perl_version function
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
X-List-Received-Date: Tue, 03 Dec 2013 15:54:55 -0000
X-Groupsio-MsgNum: 47829
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Content-Disposition: inline

--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2013 at 11:52:29PM +0100, Martin Jansa wrote:
> * without this bitbake -S perf shows following error:
>   ERROR: Bitbake's cached basehash does not match the one we just generat=
ed
>     (/OE/oe-core/meta/recipes-kernel/perf/perf.bb.do_package)!
>   if you run it twice, once without perl in sysroot and once with perl
>   already built
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/cpan-base.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbcl=
ass
> index 7e1e8d0..609fde6 100644
> --- a/meta/classes/cpan-base.bbclass
> +++ b/meta/classes/cpan-base.bbclass
> @@ -10,6 +10,9 @@ RDEPENDS_${PN} +=3D "${@["perl", ""][(bb.data.inherits_=
class('native', d))]}"
>  PERL_OWN_DIR =3D "${@["", "/perl-native"][(bb.data.inherits_class('nativ=
e', d))]}"
> =20
>  # Determine the staged version of perl from the perl configuration file
> +# Assign vardepvalue, because otherwise signature is changed before and =
after
> +# perl is built (from None to real version in config.sh).
> +get_perl_version[vardepvalue] =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}"

Sorry, this isn't correct, it includes whole path to STAGING_LIBDIR in
signature (different for each MACHINE).

v2 coming soon

>  def get_perl_version(d):
>      import re
>      cfg =3D d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh')
> --=20
> 1.8.4.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKd/tYACgkQN1Ujt2V2gBwWlQCfTCxLGuVKOIzpRrkUZcXq2IeW
TL4AoIKTgGcyVZPSpTG5AY1ilP/okZz1
=ZP3l
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--
