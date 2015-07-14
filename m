Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC4365C78;
	Tue, 14 Jul 2015 11:19:45 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so52843109wib.1;
	Tue, 14 Jul 2015 04:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D1oFZzqjhvNglhKKmIlV3P1EQu0UfzmJSObEEAoMiwQ=;
	b=uCu+VCP4yuqxTj5X7sLhXK3i+xX60UgyknvGjyes9HmaozAtUsI9obER2sbWDmURaf
	tFluJeYtNZB8PDdSGBpgy2kc/yZkzwuDqiczbBBpt5sSI443rE/SKm6MMdxlzNq2Q+PT
	uKFUMM3Y8xGj6z3xxmcB/GMctwDRwxFc2BmV+6TyqWQvymnhpmxokWLva8pBgqRFDkoV
	z+4VJkspj+4x3/WYb/t9KVoxNo6tO+Cl7unKbkyNjjJsxBKQA3v8Fd9GpqN1Sxtp/Ej1
	CowmNBZ3pkx2lwkvwhnUWb0RP07EqmsB3AgENaWl/a5Qz787a2Kj2rw5GCcDf5W/xyXP
	h4Ow==
X-Received: by 10.195.13.1 with SMTP id eu1mr77475354wjd.131.1436872784566;
	Tue, 14 Jul 2015 04:19:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id f3sm2625628wiz.13.2015.07.14.04.19.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 04:19:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Jul 2015 13:19:56 +0200
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-ID: <20150714111956.GA2184@jama>
References: <20150410171048.DCC2450492@opal.openembedded.org>
	<20150702143331.GE2434@jama>
MIME-Version: 1.0
In-Reply-To: <20150702143331.GE2434@jama>
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
X-List-Received-Date: Tue, 14 Jul 2015 11:19:45 -0000
X-Groupsio-MsgNum: 67925
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2015 at 04:33:31PM +0200, Martin Jansa wrote:
> On Fri, Apr 10, 2015 at 05:10:48PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 47f67fae98faec17087a827eff141e05b0400560
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D47f67fae98faec17087a827eff141e05b0400560
> >=20
> > Author: Khem Raj <raj.khem@gmail.com>
> > Date:   Mon Apr  6 17:36:29 2015 +0000
> >=20
> > ncurses: Upgrade 4.9 stable to latest patchlevel 20150329
> >=20
> > gcc5 barfs on older release
>=20
> In some builds I'm seeing failures like this:
>=20
> ncurses/5.9-r15.1/ncurses-5.9-20150329/ncurses/tinfo/init_keytry.c:54:25:=
 fatal error: init_keytry.h: No such file or directory
>  #include <init_keytry.h>
>                          ^
> compilation terminated.
> make[1]: *** [../objects/init_keytry.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
>=20
> Reverting this commit fixes the issue. The ${includedir} removal in
> do_configure seems suspicious.
>=20
> I'm trying to narrow why it fails in some builds and builds fine in
> other builds even when they are relatively similar.
>=20
> Any hints appreciated.

I've narrowed it down to -D in CC variable, ncurses-20150329 is using:

  echo "$as_me:2129: checking \$CC variable" >&5
  echo $ECHO_N "checking \$CC variable... $ECHO_C" >&6
  case "$CC" in #(vi
  *[\ \   ]-[IUD]*)
          echo "$as_me:2133: result: broken" >&5
  echo "${ECHO_T}broken" >&6
          { echo "$as_me:2135: WARNING: your environment misuses the CC var=
iable to hold CFLAGS/CPPFLAGS options" >&5
  echo "$as_me: WARNING: your environment misuses the CC variable to hold C=
FLAGS/CPPFLAGS options" >&2;}
          # humor him...
          cf_flags=3D`echo "$CC" | sed -e 's/^[^    ]*[     ]//'`
          CC=3D`echo "$CC" | sed -e 's/[    ].*//'`
  ....

to check and possibly fix CC variable, most my MACHINEs were working fine,
except one which still had:
  TUNE_CCARGS +=3D "-D__ARM__ -D__LINUX_ARM_ARCH__=3D7"
for whatever historical reason, that trips ncurses configure:

$ export CC=3D"arm-webos-linux-gnueabi-gcc  -march=3Darmv7-a -mthumb  -mthu=
mb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -rdynamic -funwind-tables -mve=
ctorize-with-neon-quad -Os --sysroot=3D<SYSROOT>"
jenkins@rabbit:~/ncurses$ . cc.check                                       =
                                                                           =
        :2129: checking $CC variable
checking $CC variable...
:2221: result: ok
ok

$ export CC=3D"arm-webos-linux-gnueabi-gcc  -march=3Darmv7-a -mthumb  -mthu=
mb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -rdynamic -funwind-tables -D__=
ARM__ -D__LINUX_ARM_ARCH__=3D7 -mvectorize-with-neon-quad -Os --sysroot=3D<=
SYSROOT>"
jenkins@rabbit:~/ncurses$ . cc.check=20
:2129: checking $CC variable
checking $CC variable...=20
:2133: result: broken
broken
:2135: WARNING: your environment misuses the CC variable to hold CFLAGS/CPP=
FLAGS options
: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS=
 options

And "fixed" CC variable causes issues described above.

> > Change-Id: Ib1ad9b1cf7f16eb454da21fd61dc56fe1d9f6783
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > ---
> >=20
> >  meta/recipes-core/ncurses/ncurses.inc    | 14 ++++++++++++--
> >  meta/recipes-core/ncurses/ncurses_5.9.bb |  8 +++++---
> >  2 files changed, 17 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/=
ncurses/ncurses.inc
> > index 10f7dd1..225e369 100644
> > --- a/meta/recipes-core/ncurses/ncurses.inc
> > +++ b/meta/recipes-core/ncurses/ncurses.inc
> > @@ -13,7 +13,7 @@ BINCONFIG =3D "${bindir}/ncurses-config"
> >  inherit autotools binconfig-disabled multilib_header
> > =20
> >  # Upstream has useful patches at times at ftp://invisible-island.net/n=
curses/
> > -SRC_URI =3D "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz"
> > +SRC_URI =3D "ftp://invisible-island.net/${BPN}/current/${BP}-${REVISIO=
N}.tgz"
> > =20
> >  EXTRA_AUTORECONF =3D "-I m4"
> >  CONFIG_SITE =3D+ "${WORKDIR}/config.cache"
> > @@ -97,6 +97,8 @@ do_configure() {
> >          # broken because it requires stdin to be pollable (which is
> >          # not the case for /dev/null redirections)
> >          export cf_cv_working_poll=3Dyes
> > +	#Remove ${includedir} from CPPFLAGS, need for cross compile
> > +	sed -i 's#-I${cf_includedir}##g' ${S}/configure || die "sed CPPFLAGS"
> > =20
> >  	# The --enable-pc-files requires PKG_CONFIG_LIBDIR existed
> >  	mkdir -p ${PKG_CONFIG_LIBDIR}
> > @@ -105,6 +107,7 @@ do_configure() {
> >  		return 1
> >  	! ${ENABLE_WIDEC} || \
> >  		ncurses_configure "widec" "--enable-widec" "--without-progs"
> > +
> >  }
> > =20
> >  do_compile() {
> > @@ -231,7 +234,14 @@ do_install() {
> >              # At some point we can rely on coreutils 8.16 which has ln=
 -r.
> >              lnr ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinf=
o.so
> >          fi
> > -
> > +        if [ -d "${D}${includedir}/ncurses" ]; then
> > +            for f in `find ${D}${includedir}/ncurses -name "*.h"`
> > +            do
> > +	        f=3D`basename $f`
> > +	        test -e ${D}${includedir}/$f && continue
> > +                ln -sf ncurses/$f ${D}${includedir}/$f
> > +            done
> > +        fi
> >          oe_multilib_header curses.h
> >  }
> > =20
> > diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-co=
re/ncurses/ncurses_5.9.bb
> > index 6d23c0c..54d27a9 100644
> > --- a/meta/recipes-core/ncurses/ncurses_5.9.bb
> > +++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
> > @@ -1,10 +1,12 @@
> >  require ncurses.inc
> > =20
> > +REVISION =3D "20150329"
> > +
> >  PR =3D "${INC_PR}.1"
> > =20
> >  SRC_URI +=3D "file://tic-hang.patch \
> >              file://config.cache \
> >  "
> > -
> > -SRC_URI[md5sum] =3D "8cb9c412e5f2d96bc6f459aa8c6282a1"
> > -SRC_URI[sha256sum] =3D "9046298fb440324c9d4135ecea7879ffed8546dd1b58e5=
9430ea07a4633f563b"
> > +S =3D "${WORKDIR}/${BP}-${REVISION}"
> > +SRC_URI[md5sum] =3D "cee991d09e69e60ebedef424804c52d4"
> > +SRC_URI[sha256sum] =3D "5b64f40e4dce73e3aa83d15bd9257c6eff8790ec41150f=
0938bd87c0eb75828f"
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWk8FkACgkQN1Ujt2V2gBzojwCbBfewAqx/hNrLDupAYNXro0gA
cq4An3qlLyVSpuSfcYs0T72JUZckaRIN
=M71/
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
