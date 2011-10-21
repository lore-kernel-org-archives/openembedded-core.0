Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHDKr-0006rl-HD
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 13:32:25 +0200
Received: by bkat8 with SMTP id t8so4992721bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bYeGbejdai8jxR1bmB8wNM9hJ9yeNg4KGA4FBOn1mP4=;
	b=ncHMG7FSfWjprN17tdHJqtlqUEf6UgGZl0DcOr14I7gVnAkrfI3dIeO90abfdBHLzb
	eoqq/9/rlT8g3qbaw29I5o8emjdR4IUiZ0+Pm1mz/Cge+xp4NCh4GZ8HjOBkrJbXJcWI
	imguAEqnVKqzCZekusPRQnI3LE/3yss/n87BQ=
Received: by 10.204.7.199 with SMTP id e7mr10357206bke.40.1319196392172;
	Fri, 21 Oct 2011 04:26:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f7sm4373999bkc.1.2011.10.21.04.26.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 04:26:31 -0700 (PDT)
Date: Fri, 21 Oct 2011 13:26:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111021112625.GQ3522@jama.jama.net>
References: <bcdfb52940fbceb12549f4725ad808ae496afdb3.1319184832.git.Martin.Jansa@gmail.com>
	<1319190483-5637-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1319190483-5637-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] base.bbclass: add subversion-native to DEPENDS if there is svn:// in SRC_URI
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
X-List-Received-Date: Fri, 21 Oct 2011 11:32:25 -0000
X-Groupsio-MsgNum: 11423
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kPJUzav3owWaKxsz"
Content-Disposition: inline

--kPJUzav3owWaKxsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 11:48:03AM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/base.bbclass |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index f539744..bced226 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -401,6 +401,13 @@ python () {
>                      bb.note("SKIPPING %s because it's %s" % (pn, this_li=
cense))
>                      raise bb.parse.SkipPackage("incompatible with licens=
e %s" % this_license)
> =20
> +    # Svn packages should DEPEND on subversion-native
> +    srcuri =3D bb.data.getVar('SRC_URI', d, 1)
> +    if "svn://" in srcuri:
> +        depends =3D bb.data.getVarFlag('do_fetch', 'depends', d) or ""
> +        depends =3D depends + " subversion-native:do_populate_sysroot"
> +        bb.data.setVarFlag('do_fetch', 'depends', depends, d)
> +
>      # Git packages should DEPEND on git-native
>      srcuri =3D bb.data.getVar('SRC_URI', d, 1)
>      if "git://" in srcuri:

For this to work correctly, we need to add BBCLASSEXTEND =3D "native" also
to subversion_1.6* otherwise everybody will get subversion-native-1.7.0
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kPJUzav3owWaKxsz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6hVuEACgkQN1Ujt2V2gBx+EwCgkQAxMk0otUOoE+y0YL4VgnZE
fOQAoLYQLNEjrn3NQT0YXwlTLOwtxl80
=cO99
-----END PGP SIGNATURE-----

--kPJUzav3owWaKxsz--
