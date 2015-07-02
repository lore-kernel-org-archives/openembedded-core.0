Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D2B267589F;
	Thu,  2 Jul 2015 14:33:04 +0000 (UTC)
Received: by wgqq4 with SMTP id q4so64982818wgq.1;
	Thu, 02 Jul 2015 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lyjRQI/CZz95p2bGe6moSRekhwuqHl2aTyBPtk+d9+g=;
	b=JrpMeUIphFcPzQJGl7I1gbXM+cSQA9C1lS+kC/Ea/NRWVNQABszGlBNM3SONsw7oEH
	YH0ttivHVtoqcb7tTit9/OVlSLo6K9wNgedbPFCzQRdGv5Jqg/Fs/4od4MVu9PJh+eRf
	rrXcqFa9L6desxRn9F0RoihYodScTi6LNx7kIAQFlgP0xJbc3DP/gcDS/j45roqlKuz2
	f/VGKcEJvel8KHzFWJxno5yYBcuV+MBGmxFWmzXw9wGJAfmtcgBNvT0VT81PsfxYocYG
	psNvhcKDQniWpOqO0yw+lFPfczB5fVbPHGEKlnxLfl/QZPUdtAUobEw/dW0hYkxhS9sL
	fqFA==
X-Received: by 10.194.95.71 with SMTP id di7mr56951916wjb.125.1435847584099;
	Thu, 02 Jul 2015 07:33:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id r6sm27602968wiy.13.2015.07.02.07.33.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jul 2015 07:33:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Jul 2015 16:33:31 +0200
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-ID: <20150702143331.GE2434@jama>
References: <20150410171048.DCC2450492@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150410171048.DCC2450492@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : ncurses: Upgrade 4.9 stable to latest patchlevel 20150329
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
X-List-Received-Date: Thu, 02 Jul 2015 14:33:07 -0000
X-Groupsio-MsgNum: 67475
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Content-Disposition: inline

--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 05:10:48PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 47f67fae98faec17087a827eff141e05b0400560
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D47f67fae98faec17087a827eff141e05b0400560
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Mon Apr  6 17:36:29 2015 +0000
>=20
> ncurses: Upgrade 4.9 stable to latest patchlevel 20150329
>=20
> gcc5 barfs on older release

In some builds I'm seeing failures like this:

ncurses/5.9-r15.1/ncurses-5.9-20150329/ncurses/tinfo/init_keytry.c:54:25: f=
atal error: init_keytry.h: No such file or directory
 #include <init_keytry.h>
                         ^
compilation terminated.
make[1]: *** [../objects/init_keytry.o] Error 1
make[1]: *** Waiting for unfinished jobs....

Reverting this commit fixes the issue. The ${includedir} removal in
do_configure seems suspicious.

I'm trying to narrow why it fails in some builds and builds fine in
other builds even when they are relatively similar.

Any hints appreciated.

> Change-Id: Ib1ad9b1cf7f16eb454da21fd61dc56fe1d9f6783
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/ncurses/ncurses.inc    | 14 ++++++++++++--
>  meta/recipes-core/ncurses/ncurses_5.9.bb |  8 +++++---
>  2 files changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
> index 10f7dd1..225e369 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -13,7 +13,7 @@ BINCONFIG =3D "${bindir}/ncurses-config"
>  inherit autotools binconfig-disabled multilib_header
> =20
>  # Upstream has useful patches at times at ftp://invisible-island.net/ncu=
rses/
> -SRC_URI =3D "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz"
> +SRC_URI =3D "ftp://invisible-island.net/${BPN}/current/${BP}-${REVISION}=
=2Etgz"
> =20
>  EXTRA_AUTORECONF =3D "-I m4"
>  CONFIG_SITE =3D+ "${WORKDIR}/config.cache"
> @@ -97,6 +97,8 @@ do_configure() {
>          # broken because it requires stdin to be pollable (which is
>          # not the case for /dev/null redirections)
>          export cf_cv_working_poll=3Dyes
> +	#Remove ${includedir} from CPPFLAGS, need for cross compile
> +	sed -i 's#-I${cf_includedir}##g' ${S}/configure || die "sed CPPFLAGS"
> =20
>  	# The --enable-pc-files requires PKG_CONFIG_LIBDIR existed
>  	mkdir -p ${PKG_CONFIG_LIBDIR}
> @@ -105,6 +107,7 @@ do_configure() {
>  		return 1
>  	! ${ENABLE_WIDEC} || \
>  		ncurses_configure "widec" "--enable-widec" "--without-progs"
> +
>  }
> =20
>  do_compile() {
> @@ -231,7 +234,14 @@ do_install() {
>              # At some point we can rely on coreutils 8.16 which has ln -=
r.
>              lnr ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.=
so
>          fi
> -
> +        if [ -d "${D}${includedir}/ncurses" ]; then
> +            for f in `find ${D}${includedir}/ncurses -name "*.h"`
> +            do
> +	        f=3D`basename $f`
> +	        test -e ${D}${includedir}/$f && continue
> +                ln -sf ncurses/$f ${D}${includedir}/$f
> +            done
> +        fi
>          oe_multilib_header curses.h
>  }
> =20
> diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core=
/ncurses/ncurses_5.9.bb
> index 6d23c0c..54d27a9 100644
> --- a/meta/recipes-core/ncurses/ncurses_5.9.bb
> +++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
> @@ -1,10 +1,12 @@
>  require ncurses.inc
> =20
> +REVISION =3D "20150329"
> +
>  PR =3D "${INC_PR}.1"
> =20
>  SRC_URI +=3D "file://tic-hang.patch \
>              file://config.cache \
>  "
> -
> -SRC_URI[md5sum] =3D "8cb9c412e5f2d96bc6f459aa8c6282a1"
> -SRC_URI[sha256sum] =3D "9046298fb440324c9d4135ecea7879ffed8546dd1b58e594=
30ea07a4633f563b"
> +S =3D "${WORKDIR}/${BP}-${REVISION}"
> +SRC_URI[md5sum] =3D "cee991d09e69e60ebedef424804c52d4"
> +SRC_URI[sha256sum] =3D "5b64f40e4dce73e3aa83d15bd9257c6eff8790ec41150f09=
38bd87c0eb75828f"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWVS7oACgkQN1Ujt2V2gBx/GwCguCJofEPu8x3Fd2dk0PG0DzCw
xu0AnR6Im61Wkhp2Sn95YcO/vbVLyEsG
=nEeI
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--
