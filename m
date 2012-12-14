Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjRVI-0008WT-JG
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 10:24:24 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2048199pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 01:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NFfojE6NafQrl7gR2IUDy7WcokyaHTZpGI6PNqghj0o=;
	b=RjzAx6bETP/Bkon8WvrJJ8isT00GdCOWMEDBVdhwhbCu8evGqWbNW3vj0BzQ0Vnxci
	1acmMBbI/xtaxpVVcbKVwni5bOfb4y0eVjBT+FQxPbHR5owkvGugKcfBsipuHfXKdXjf
	FsS/JDGCSKz/k/QGUDZkogDxGaPmz1EhcXbAOkXKrt/6IjLXWxXwOnmykE7uVlg785LK
	Yi8MiudEzi+tdCBjCXlmiTtlly+rQmqHHCsNOaVFcr9sScgdiiJWIYIQi/Vyyc0XZlc0
	PigDNj56Ll8DkOrfcLeXx35RRS0FYd1CWuxDupGzTUThX6WfPWIZdBCux34yskhqxqtM
	vFbA==
Received: by 10.68.225.232 with SMTP id rn8mr13974563pbc.34.1355476187860;
	Fri, 14 Dec 2012 01:09:47 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id jq1sm2083137pbb.71.2012.12.14.01.09.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 01:09:45 -0800 (PST)
Date: Fri, 14 Dec 2012 10:09:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20121214090957.GB5567@jama.jama.net>
References: <cover.1355363862.git.hongxu.jia@windriver.com>
	<475c322eafe0f825ead42e582dfa0ed1a4497f06.1355363862.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <475c322eafe0f825ead42e582dfa0ed1a4497f06.1355363862.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ghostscript-native:fix host underlinking issues
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
X-List-Received-Date: Fri, 14 Dec 2012 09:24:25 -0000
X-Groupsio-MsgNum: 32660
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline

--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2012 at 10:17:43AM +0800, Hongxu Jia wrote:
> The ghostscript-native will check libtiff
> automatically at configure time and libtiff
> needs libjpeg. If libtiff and libjpeg is
> just populated to staging native directories
> and the host doesn't install them, the libjpeg
> could not be linked, fail with:
>=20
> |libjpeg.so.8, needed by libtiff.so, not found
> |libtiff.so: undefined reference to
> `jpeg_set_defaults@LIBJPEG_8.0'
> |collect2: error: ld returned 1 exit status
>=20
> Disable libtiff support to fix this issue and
> modify configure to let disable system libtiff
> could work.
> We also explicity disable fontconfig, freetype,
> cups for ghostscript-native to avoid the similar
> issues.

Fixes issues I was seeing:
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks!

>=20
> [YOCTO #3562]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...tscript-native-fix-disable-system-libtiff.patch |   51 ++++++++++++++=
++++++
>  .../ghostscript/ghostscript_9.05.bb                |   15 ++++--
>  2 files changed, 63 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostsc=
ript-native-fix-disable-system-libtiff.patch
>=20
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-na=
tive-fix-disable-system-libtiff.patch b/meta/recipes-extended/ghostscript/g=
hostscript/ghostscript-native-fix-disable-system-libtiff.patch
> new file mode 100644
> index 0000000..ce254f6
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fi=
x-disable-system-libtiff.patch
> @@ -0,0 +1,51 @@
> +ghostscript-native:fix disable-system-libtiff
> +
> +Modify configure to add the check to make sure
> +ghostscrip could work while system-libtiff is
> +disabled.
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Upstream-Status: Pending
> +---
> +diff --git a/base/configure.ac b/base/configure.ac
> +index bb05105..4b817ac 100644
> +--- a/base/configure.ac
> ++++ b/base/configure.ac
> +@@ -814,17 +814,23 @@ Disabling tiff output devices.])
> + esac
> +=20
> + if test $SHARE_LIBTIFF -eq 0; then
> +-      echo
> +-      echo "Running libtiff configure script..."
> +-      olddir=3D`pwd`
> +-      cd $LIBTIFFDIR && ./configure --disable-jbig $SUBCONFIG_OPTS
> +-      status=3D$?
> +-      if test "$status" -ne 0 ; then
> +-        AC_MSG_ERROR([libtiff configure script failed], $status)
> +-      fi
> +-      cd $olddir
> +-      echo
> +-      echo "Continuing with Ghostscript configuration..."
> ++    if test -e $LIBTIFFDIR/configure; then
> ++        echo
> ++        echo "Running libtiff configure script..."
> ++        olddir=3D`pwd`
> ++        cd $LIBTIFFDIR && ./configure --disable-jbig $SUBCONFIG_OPTS
> ++        status=3D$?
> ++        if test "$status" -ne 0 ; then
> ++          AC_MSG_ERROR([libtiff configure script failed], $status)
> ++        fi
> ++        cd $olddir
> ++        echo
> ++        echo "Continuing with Ghostscript configuration..."
> ++    else
> ++        AC_MSG_NOTICE([Could not find local copy of libtiff.
> ++Disabling tiff output devices.])
> ++    fi
> ++
> + fi
> +=20
> + AC_SUBST(SHARE_LIBTIFF)
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb b/meta=
/recipes-extended/ghostscript/ghostscript_9.05.bb
> index 2789897..93c503f 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
> @@ -15,7 +15,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc5326026692dbed183f0558f92658=
0f8"
> =20
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  DEPENDS =3D "ghostscript-native tiff jpeg fontconfig cups"
>  DEPENDS_class-native =3D ""
> @@ -31,8 +31,9 @@ SRC_URI =3D "${SRC_URI_BASE} \
>             "
> =20
>  SRC_URI_class-native =3D "${SRC_URI_BASE} \
> -		        file://0001-make-ghostscript-work-with-long-building-directory=
=2Epatch \
> -		        "
> +                        file://0001-make-ghostscript-work-with-long-buil=
ding-directory.patch \
> +                        file://ghostscript-native-fix-disable-system-lib=
tiff.patch \
> +                        "
> =20
>  SRC_URI[md5sum] =3D "f7c6f0431ca8d44ee132a55d583212c1"
>  SRC_URI[sha256sum] =3D "593f77f7584704bdf9de41598a084a4208c3ad3b940a1de1=
faaf8f59a15cc207"
> @@ -40,6 +41,14 @@ SRC_URI[sha256sum] =3D "593f77f7584704bdf9de41598a084a=
4208c3ad3b940a1de1faaf8f59a1
>  EXTRA_OECONF =3D "--without-x --with-system-libtiff --without-jbig2dec -=
-without-jasper \
>                  --with-fontpath=3D${datadir}/fonts --with-install-cups -=
-without-libidn"
> =20
> +# Explicity disable libtiff, fontconfig,
> +# freetype, cups for ghostscript-native
> +EXTRA_OECONF_class-native =3D "--without-x --with-system-libtiff=3Dno \
> +                             --without-jbig2dec --without-jasper \
> +                             --with-fontpath=3D${datadir}/fonts \
> +                             --without-libidn --disable-fontconfig \
> +                             --disable-freetype --disable-cups"
> +
>  # This has been fixed upstream but for now we need to subvert the check =
for time.h
>  # http://bugs.ghostscript.com/show_bug.cgi?id=3D692443
>  # http://bugs.ghostscript.com/show_bug.cgi?id=3D692426
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDK7OUACgkQN1Ujt2V2gBzSuQCdHpQ6+4Yt466t9+htlTD0Aan8
eNIAnAt/bli8T50mQhmsE0Truevv/7mq
=jJAa
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
