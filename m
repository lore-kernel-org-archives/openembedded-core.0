Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id B44AC6B8A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 08:32:27 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so2805864eek.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BzmQyq8EJDN0hA6FzLQMi16/4/cRjug4qdAec7iPkIo=;
	b=zH0wr6wwDNgCYnRvpbHq12NI2MwWHCNu6IDxcwtAMdBgLsvqvL1PpOr7iIqm957SYd
	ypVtEdNlR1x6NYAafExQyuazWVmlGu+CJUmcqtrsx1+B/JJeubC2wMVWeE9XU+RIsZSQ
	B5qUr0rOQTYVS9u/QhY7Z+3Gp5QXUPuOTRxxiuDZfXVklhEr3bzBcT9wpQkhrKW0nyM+
	0vXJdaZ3BoglI9nVWxNagJZJJeA3mBnhM/n7/Pj8euEg9NDxb3o0svb9dVbvnOJrIKng
	ATRtT2T+CcsOEwR6cQhxYU76EK0/qre55oTk2gN+oOKqztIiUKNlD/KCrKMNQinUcNiE
	n2Aw==
X-Received: by 10.14.220.200 with SMTP id o48mr1458165eep.62.1377678747941;
	Wed, 28 Aug 2013 01:32:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm35308069eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 01:32:27 -0700 (PDT)
Date: Wed, 28 Aug 2013 10:33:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130828083339.GI3544@jama>
References: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][PATCH 1/4] package.bbclass: move reading shlibs providers to separate function
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
X-List-Received-Date: Wed, 28 Aug 2013 08:32:28 -0000
X-Groupsio-MsgNum: 44181
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uN5p0Kt0tLhd3gfz"
Content-Disposition: inline

--uN5p0Kt0tLhd3gfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 07, 2013 at 01:13:04AM +0200, Martin Jansa wrote:
> * prepare for reading shlibs providers only from dependency tree of
>   current recipe
>=20
> [YOCTO #4628]

Any comment on this patchset?

I'm using first 3 commits for some time in world builds and they helped
me to discover some unexpected shlib providers (and fix them by setting
PRIVATE_LIBS).

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/package.bbclass | 43 +++++++++++++++++++++++---------------=
-----
>  1 file changed, 23 insertions(+), 20 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 5c2d1c6..d80535d 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1337,6 +1337,28 @@ python package_do_shlibs() {
>      # Take shared lock since we're only reading, not writing
>      lf =3D bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
> =20
> +    def read_shlib_providers:
> +        list_re =3D re.compile('^(.*)\.list$')
> +        # Go from least to most specific since the last one found wins
> +        for dir in reversed(shlibs_dirs):
> +            if not os.path.exists(dir):
> +                continue
> +            for file in os.listdir(dir):
> +                m =3D list_re.match(file)
> +                if m:
> +                    dep_pkg =3D m.group(1)
> +                    fd =3D open(os.path.join(dir, file))
> +                    lines =3D fd.readlines()
> +                    fd.close()
> +                    ver_file =3D os.path.join(dir, dep_pkg + '.ver')
> +                    lib_ver =3D None
> +                    if os.path.exists(ver_file):
> +                        fd =3D open(ver_file)
> +                        lib_ver =3D fd.readline().rstrip()
> +                        fd.close()
> +                    for l in lines:
> +                        shlib_provider[l.rstrip()] =3D (dep_pkg, lib_ver)
> +
>      def linux_so(file):
>          needs_ldconfig =3D False
>          cmd =3D d.getVar('OBJDUMP', True) + " -p " + pipes.quote(file) +=
 " 2>/dev/null"
> @@ -1479,26 +1501,7 @@ python package_do_shlibs() {
>              postinst +=3D d.getVar('ldconfig_postinst_fragment', True)
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
> =20
> -    list_re =3D re.compile('^(.*)\.list$')
> -    # Go from least to most specific since the last one found wins
> -    for dir in reversed(shlibs_dirs):
> -        if not os.path.exists(dir):
> -            continue
> -        for file in os.listdir(dir):
> -            m =3D list_re.match(file)
> -            if m:
> -                dep_pkg =3D m.group(1)
> -                fd =3D open(os.path.join(dir, file))
> -                lines =3D fd.readlines()
> -                fd.close()
> -                ver_file =3D os.path.join(dir, dep_pkg + '.ver')
> -                lib_ver =3D None
> -                if os.path.exists(ver_file):
> -                    fd =3D open(ver_file)
> -                    lib_ver =3D fd.readline().rstrip()
> -                    fd.close()
> -                for l in lines:
> -                    shlib_provider[l.rstrip()] =3D (dep_pkg, lib_ver)
> +    read_shlib_providers()
> =20
>      bb.utils.unlockfile(lf)
> =20
> --=20
> 1.8.2.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uN5p0Kt0tLhd3gfz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIdteMACgkQN1Ujt2V2gBy7uwCgtuze1IPO9zFFriJ3rC/sP8TG
2ZoAnRQSPw9u2GGwv9K2r4rwOpHc/S9M
=MCF+
-----END PGP SIGNATURE-----

--uN5p0Kt0tLhd3gfz--
