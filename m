Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJIe-00079Y-5D
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 19:02:24 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3041408eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 09:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FVzC4OLjQ2PlNpK5Rv6KKw/UiXkuJCZjo5jRi6icrUc=;
	b=qtnJS+odBkBVPPDRxbmtQpHYaLC6VHsZ/Y8hPLzzAeBzU9XbXjOQPqeLZQWxcbd91x
	A0iQaTtbN/Gt4lwuJblZ2q8IIkiUrgoP8PORRYsE80+JPXwi3g7T1uUG2Empc003F9Tl
	P6kPvRs7cltQSAxmYBUF8OamdRnPxqxlW31VK5i7i5vjg/I8wDt0mGncUpTLkf7vcN3g
	gDU6n5IqdO8FgrVNcKAHXTk0ZQpRwJxghvSCdXfzcAmXt0HBI9kcraugJymn+ujRV1dp
	f4KQN3g9Nxj3YeFO0YxWXPDGJKuF2iURGGKRDyEKud4034innT/z41J2mvQP7QB8bL0d
	TX/A==
Received: by 10.14.208.137 with SMTP id q9mr62866258eeo.28.1354729679941;
	Wed, 05 Dec 2012 09:47:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm10442961eem.16.2012.12.05.09.47.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 09:47:59 -0800 (PST)
Date: Wed, 5 Dec 2012 18:47:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20121205174756.GE3396@jama.jama.net>
References: <1354724029-9230-1-git-send-email-sgw@linux.intel.com>
	<50BF87A1.2050404@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50BF87A1.2050404@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-smartpm: Fix build error
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
X-List-Received-Date: Wed, 05 Dec 2012 18:02:24 -0000
X-Groupsio-MsgNum: 32280
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Content-Disposition: inline

--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2012 at 11:42:57AM -0600, Mark Hatle wrote:
> On 12/5/12 10:13 AM, Saul Wold wrote:
> > datadir is normally /usr/share so we don't need to add /share to it.
> >
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >   meta/recipes-devtools/python/python-smartpm_1.4.1.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/met=
a/recipes-devtools/python/python-smartpm_1.4.1.bb
> > index 254318c..3617fde 100644
> > --- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> > +++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> > @@ -44,7 +44,7 @@ inherit distutils
> >
> >   do_install_append() {
> >      # Cleanup unused item...
> > -   rmdir ${D}${datadir}/share
> > +   rmdir ${D}${datadir}
>=20
> I believe this is wrong.  There are things in /usr/share that we want fro=
m smart.
>=20
> There are docs and locales and associated files...
>=20
> I believe that was there because an errant "/usr/share/share" directory w=
as=20
> generated and that caused problems.

It really was in /usr/share/share and I've moved this fix to
distutils.bbclass in=20
http://git.openembedded.org/openembedded-core/commit/?id=3D10457e343b27e63b=
35e0278b00e9c25106b0cc1b

So rmdir in python-smartpm should be dropped completely... I've fix for
that too, but still testing it together with other changes, but will
submit that pull-request today.

Cheers,

>=20
> >
> >      # We don't support the following items
> >      rm -rf ${D}${libdir}/python*/site-packages/smart/backends/slack
> >
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC/iMwACgkQN1Ujt2V2gBy6nACeIh3GZiPHW+bMGc26IjWi7ESg
8B0An0eZ21VT2/kFDqAERTUqBO64UDgJ
=jUlp
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
