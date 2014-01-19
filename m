Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 20C6360644
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 15:25:15 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so2619331eaj.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 07:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PERSr94vpnnq1btg3Yq1d8pXKprqUkLQ605In41AD1s=;
	b=bUdVycg/GeMgXWLfjpjXs0Mt9bUagvIf6dfPRTGDc2+iW+dTB3vvKv5fYO14upaIv+
	U12zRr36oHQPGd+l3m7YzcYzfKrKAn3lcQbz5W/Dl+AIan3sMycPNVBxbtzRWQrv9OSS
	f4Ubs3w4ERbqro/Wg041VcsWvFB4Kje1whsGsQQs1IvYcDCBbNQxH5E4K5nuKaj3AkWR
	QwrB1kQqJuA3xo2tX7y4H5fUN97c6G254C2X94idvykzz9oMnDxQHw4MXDM/0w+mQoji
	bbHySGq0GwD6zvDlDc6jGg5/Y49FdnM2ZeYAAA2+ZiUG5EPws6M5k04NKAqbixkHF+OW
	g5JQ==
X-Received: by 10.15.91.3 with SMTP id r3mr13260736eez.18.1390145116435;
	Sun, 19 Jan 2014 07:25:16 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm44471379eef.16.2014.01.19.07.25.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jan 2014 07:25:15 -0800 (PST)
Date: Sun, 19 Jan 2014 16:25:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140119152515.GC5565@jama>
References: <1390142552.2467.48.camel@e130.pbcl.net>
	<6b2c74bfb8b8a787273dc0a2f75ddc91573d1c8b.1390144972.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6b2c74bfb8b8a787273dc0a2f75ddc91573d1c8b.1390144972.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCHv2 3/5] package.bbclass: add SHLIBSSEARCHDIRS to define where to search for shlib providers
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
X-List-Received-Date: Sun, 19 Jan 2014 15:25:16 -0000
X-Groupsio-MsgNum: 49188
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline

--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2014 at 04:23:35PM +0100, Martin Jansa wrote:
> * when package contains some files matching "^.*\.so", but in directory
>   not default linker search paths (e.g. /opt/package/bundled-lib/libfoo.s=
o)
>   don't register it as libfoo provider, because it's possible that there
>   is different package providing libfoo.so in ${libdir} and that would
>   be better shlib provider for other packages to depend on
> * recipes providing libs intentionally in some other directory can
>   define own SHLIBSSEARCHDIRS value

This one is the same as v1, sent by accident when sending v3 of 2/5.

> [YOCTO #4628]
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/package.bbclass | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 9b511a6..a9e32f2 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1322,6 +1322,9 @@ python package_do_filedeps() {
>  SHLIBSDIRS =3D "${PKGDATA_DIR}/${MLPREFIX}shlibs"
>  SHLIBSWORKDIR =3D "${PKGDESTWORK}/${MLPREFIX}shlibs"
> =20
> +# default search path when searching for shlibs provided by package
> +SHLIBSSEARCHDIRS ?=3D "${baselib} ${libdir}"
> +
>  python package_do_shlibs() {
>      import re, pipes
> =20
> @@ -1332,6 +1335,20 @@ python package_do_shlibs() {
> =20
>      lib_re =3D re.compile("^.*\.so")
>      libdir_re =3D re.compile(".*/%s$" % d.getVar('baselib', True))
> +   =20
> +    shlibs_search_dirs =3D d.getVar('SHLIBSSEARCHDIRS', True)
> +    shlibs_search_dirs_re_txt =3D ""
> +    for dir in shlibs_search_dirs.split(' '):
> +        # strip leading and trailing slash, it's added in regexp
> +        if dir.endswith("/"):
> +            dir =3D dir[:-1]
> +        if dir.startswith("/"):
> +            dir =3D dir[1:]
> +        if shlibs_search_dirs_re_txt:
> +            shlibs_search_dirs_re_txt +=3D "|"
> +        shlibs_search_dirs_re_txt +=3D "(^.*/%s/.*$)" % dir
> +    shlibs_search_dirs_re =3D re.compile(shlibs_search_dirs_re_txt)
> +    bb.debug(2, "will use following RE to search for provides sonames %s=
" % shlibs_search_dirs_re_txt)
> =20
>      packages =3D d.getVar('PACKAGES', True)
>      targetos =3D d.getVar('TARGET_OS', True)
> @@ -1390,9 +1407,12 @@ python package_do_shlibs() {
>              if m:
>                  this_soname =3D m.group(1)
>                  if not this_soname in sonames:
> -                    # if library is private (only used by package) then =
do not build shlib for it
> -                    if not private_libs or -1 =3D=3D private_libs.find(t=
his_soname):
> -                        sonames.append(this_soname)
> +                    if shlibs_search_dirs_re.match(file):
> +                        # if library is private (only used by package) t=
hen do not build shlib for it
> +                        if not private_libs or -1 =3D=3D private_libs.fi=
nd(this_soname):
> +                            sonames.append(this_soname)
> +                    else:
> +                        bb.debug(2, "ignoring soname %s from %s, because=
 path doesn't match %s" % (this_soname, file, shlibs_search_dirs_re_txt))
>                  if libdir_re.match(os.path.dirname(file)):
>                      needs_ldconfig =3D True
>                  if snap_symlinks and (os.path.basename(file) !=3D this_s=
oname):
> --=20
> 1.8.5.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLb7lsACgkQN1Ujt2V2gBxJRwCgoqMpZvYnqxvFRKPpulcg0r9O
fXYAn18xw9Eqe705AEgNLELowNjWOYJQ
=+BRX
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
