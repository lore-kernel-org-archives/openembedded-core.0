Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T8oXC-000179-61; Tue, 04 Sep 2012 10:30:58 +0200
Received: by weyr6 with SMTP id r6so3641279wey.6
	for <multiple recipients>; Tue, 04 Sep 2012 01:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DJcHrNGQ07zcO1AMfiZOM5+S4JegxjY7juh3v4UPQ/Y=;
	b=VyYwXA3uto2VBHZ5Oa1FXo+F3mnYi6cGZO+uM8gt1pkZOBRnt9FWYp3eQ4gGtPCwas
	W22qBZVy5ID6sm7RL7kNzgtcCiMS8RKS2XIzqkCxN5EkD+YuyE/Daa64GMP5EpQLd5G+
	yv4cSLAHIy96GB6rqn4/nNE3tHjGPH3VZRw3DERddzrXAkTr39Y3DMGK95mp3/KkGM+3
	f+4YCQ2b9vj4Z4gaP7rz7VasclWLtb1lGK37UadGY8Nqn99BnG/22s4uWMJ1HJ2CcnMj
	PIAsrjXOUj8jrWradSLsPhzv1oL8lUUo5fFiZtcFqC7lTk78W1H3GUXhAmIljzyYN3Rx
	msPQ==
Received: by 10.180.97.33 with SMTP id dx1mr28961333wib.18.1346746716257;
	Tue, 04 Sep 2012 01:18:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm34582249wix.6.2012.09.04.01.18.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 01:18:35 -0700 (PDT)
Date: Tue, 4 Sep 2012 10:18:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120904081858.GA3372@jama.jama.net>
References: <20120902125724.B93CA10357@opal>
MIME-Version: 1.0
In-Reply-To: <20120902125724.B93CA10357@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : perl: Fix various nativesdk build issues
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
X-List-Received-Date: Tue, 04 Sep 2012 08:30:58 -0000
X-Groupsio-MsgNum: 28607
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 02, 2012 at 12:57:24PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 38234f2e276356b1d77a87ceabc486107e336d19
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D38234f2e276356b1d77a87ceabc486107e336d19
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Thu Aug 30 16:36:24 2012 -0700
>=20
> perl: Fix various nativesdk build issues
>=20
> The config.sh lists -fstack-protector but this isn't in LDFLAGS. This
> can result in perl compilation failures due to the mismatch. Adding the
> flag to LDFLAGS solves makes all the flags consistent and avoids build
> failures from missing symbols.
>=20
> It was also found that the path substitutions made by the sed statement
> can conflict with each other and you can end up with $prefix$prefix type
> expressions in config.sh-X which can break the build in unusual ways.
> This patch anchors the expressions to ensure only true matches are
> replaced.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-devtools/perl/perl_5.14.2.bb |   12 +++++++-----
>  1 files changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-dev=
tools/perl/perl_5.14.2.bb
> index 9db3805..3c1360f 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbde=
e469f02565f253d81a \
>  # We need gnugrep (for -I)
>  DEPENDS =3D "virtual/db grep-native"
>  DEPENDS +=3D "gdbm zlib"
> -PR =3D "r8"
> +PR =3D "r9"
> =20
>  # 5.10.1 has Module::Build built-in
>  PROVIDES +=3D "libmodule-build-perl"
> @@ -90,6 +90,8 @@ export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl-n=
ative/perl/${PV}/"
>  # LDFLAGS for shared libraries
>  export LDDLFLAGS =3D "${LDFLAGS} -shared"
> =20
> +LDFLAGS_append =3D " -fstack-protector"
> +
>  # We're almost Debian, aren't we?
>  CFLAGS +=3D "-DDEBIAN"
> =20
> @@ -148,10 +150,10 @@ do_configure() {
>                 -e 's,@ARCH@-thread-multi,,g' \
>                 -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
>                 -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
> -               -e "s%/usr/include%${STAGING_INCDIR}%g" \
> -	       -e 's,/usr/lib/,${libdir}/,g' \
> -	       -e 's,/usr/,${exec_prefix}/,g' \
> -	       -e 's,/perl5,/perl,g' \
> +               -e "s%\([ \"^\',=3D]\+\)/usr/include%\1${STAGING_INCDIR}%=
g" \
> +	       -e "s%\([ \"^\',=3D]\+\)/usr/lib/%\1${libdir}/%g" \
> +	       -e "s%\([ \"^\',=3D]\+\)/usr/%\1${exec_prefix}/%g" \
> +	       -e "s%/perl5%/perl%g" \
>              config.sh-${TARGET_ARCH}-${TARGET_OS}
> =20
>  	case "${TARGET_ARCH}" in

Not sure if it's caused by this, but nativesdk-perl now fails to
do_install()

make[1]: Nothing to be done for `install.man'.
make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oes=
dk-linux/nativesdk-perl-5.14.2-r9/perl-5.14.2'
ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-nativ=
esdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-i686/sysro=
ots/i686-oesdk-linux/usr/bin/perl': No such file or directory
ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-nativ=
esdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysr=
oots/i686-oesdk-linux/usr/lib/perl5': No such file or directory
rmdir: failed to remove '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-=
linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i686-o=
esdk-linux/usr/lib/perl/site_perl/5.14.2': No such file or directory
rmdir: failed to remove '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-=
linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i686-o=
esdk-linux/usr/lib/perl/site_perl': No such file or directory
mv: cannot stat '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/na=
tivesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i686-oesdk-lin=
ux/usr/lib/perl/5.14.2/CORE/libperl.so': No such file or directory
ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-nativ=
esdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysr=
oots/i686-oesdk-linux/usr/lib/libperl.so.5': No such file or directory
ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-nativ=
esdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysr=
oots/i686-oesdk-linux/usr/lib/perl/5.14.2/CORE/libperl.so': No such file or=
 directory
install: cannot create regular file '/OE/shr-core/tmp-eglibc/work/i686-nati=
vesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-i686/sysr=
oots/i686-oesdk-linux/usr/lib/perl': No such file or directory
ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-nativ=
esdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-i686/sysro=
ots/i686-oesdk-linux/usr/lib/perl/5.14.2/Config_heavy-target.pl': No such f=
ile or directory

And files are all installed in wrong directory (sysroot path repeated twice=
):
OE @ ~/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5=
=2E14.2-r9/perl-5.14.2 $ ls /OE/shr-core/tmp-eglibc/work/i686-nativesdk-oes=
dk-linux/nativesdk-perl-
5.14.2-r9/image/usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/local/o=
ecore-i686/sysroots/i686-oesdk-linux/usr/bin/
a2p          corelist   cpanp           enc2xs     h2xs       libnetcfg   p=
erlbug  perlthanks  pod2latex  pod2usage   prove    ptar      s2p     xsubpp
c2ph         cpan       cpanp-run-perl  find2perl  instmodsh  perl        p=
erldoc  piconv      pod2man    podchecker  psed     ptardiff  shasum
config_data  cpan2dist  dprofpp         h2ph       json_pp    perl5.14.2  p=
erlivp  pl2pm       pod2text   podselect   pstruct  ptargrep  splain

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBFuXIACgkQN1Ujt2V2gBw+hwCghg3NUTSMlAJsLYkglI1lP2ug
hGkAoKUiWS7Nb5Jwu8P/tCP1kpztvLU9
=pxAz
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
