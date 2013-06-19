Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id B7BF7601DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 09:29:21 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so3095781eek.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AtruBegrBSAaQWraYMKr5RGbCXg3zJ1DxU5DxI+enG8=;
	b=0TOacTeBpa0bv+w1BG0SO/sE+5xiv0Bux5pBGAJSRtvSjaMhBZSzrtmC2Howe3zu3q
	J6DFi3Jn0s6pvra8Qt33DniOt2lX5N8K+IjP3kmcGKLsvzxRWcg0LohkHl9lgkZv+R6u
	jvOKMATOWNU79kQO0cGGHtgMYlGy4arnX/haYQXtCFAs2WS4wLqGTuxoh2290yz+jBet
	FPGkuD6INlKagJtHfj9oYLzZrPY7Or3Ioakb7EMx2bUxbF3J42D6Hw/tNLbWVE+Y7l7c
	/6OXE9roIzAcyy+5733FjdhyB9cSs1D+3aUDg4mdSNksJ+P0/9hLoqTgKOFZFBIdGlUV
	esVA==
X-Received: by 10.15.101.2 with SMTP id bo2mr1846449eeb.57.1371634162164;
	Wed, 19 Jun 2013 02:29:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ci50sm7521173eeb.12.2013.06.19.02.29.21 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 02:29:21 -0700 (PDT)
Date: Wed, 19 Jun 2013 11:29:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20130619092952.GF14021@jama>
References: <cover.1371621343.git.liezhi.yang@windriver.com>
	<5bc169404eddb0ec90ce82c6013432f295d0cdc3.1371621343.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5bc169404eddb0ec90ce82c6013432f295d0cdc3.1371621343.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] package_ipk.bbclass: make DESCRIPTION support newline
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
X-List-Received-Date: Wed, 19 Jun 2013 09:29:22 -0000
X-Groupsio-MsgNum: 40779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline

--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2013 at 05:00:40AM -0400, Robert Yang wrote:
> The recipe's DESCRIPTION is wrapped automatically by textwrap, make it
> support newline ("\n") to let the user can wrap it manually, e.g.:
>=20
> DESCRIPTION =3D "Foo1\nFoo2"
>=20
> In the past, it would be:
> Foo1\nFoo2
>=20
> Now:
> Foo1
> Foo2
>=20
> [YOCTO #4348]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/package_ipk.bbclass |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.=
bbclass
> index 55628e4..e67f641 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -304,10 +304,11 @@ python do_package_ipk () {
>                  # Special behavior for description...
>                  if 'DESCRIPTION' in fs:
>                      summary =3D localdata.getVar('SUMMARY', True) or loc=
aldata.getVar('DESCRIPTION', True) or "."
> +                    ctrlfile.write('Description: %s\n' % summary)
>                      description =3D localdata.getVar('DESCRIPTION', True=
) or "."
>                      description =3D textwrap.dedent(description).strip()
> -                    ctrlfile.write('Description: %s\n' % summary)
> -                    ctrlfile.write('%s\n' % textwrap.fill(description, w=
idth=3D74, initial_indent=3D' ', subsequent_indent=3D' '))
> +                    for t in description.split('\\n'):
> +                        ctrlfile.write('%s\n' % textwrap.fill(t, width=
=3D74, initial_indent=3D' ', subsequent_indent=3D' '))
>                  else:

Isn't DESCRIPTION supposed to be short oneline and longer multiline only
in SUMMARY?

is opkg-utils (package-index) working with this? Newlines in SUMMARY
were causing incorrect parsing and not using cache IIRC, not sure if the
fix for that was generic enough to cover DESCRIPTION.

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHBehAACgkQN1Ujt2V2gBxy1QCfbAzs8qAextS1aHQGyXy+lkzL
EDIAnAyxh2SbbZeR3U8kIvfRS5Jd8a0R
=M/90
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
