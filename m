Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5E24365D49
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:16:24 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id n15so2095892wiw.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J9Y1UCbebsZOF4DeJ7zV8YCDoJO4DeivLCCBVTuSYL0=;
	b=m/e3t89AeJHrJlOmohjy5rkJ1H+TUiLGUc2P/vjghh/bAMTKT/x5BwZEi6vHkwKXVA
	awwTTDFYg2c9nFWV7lPM9QfOaA7pmkvtZIV2YOkbnx4uFnIG0WsrtuK/1THBdUbylSc8
	Gy5xwBeiQOd5VCcHo87KD6paGinNwLs1mXumHVPeZvsxknNotHsa40u6iqopKJioiHr0
	+HYHns6ATZtIBszp7vyIDrEE+CqooexqhZDFW6QOMsrVTszNPz8diJlK7yl64ZfVfiU8
	Gs+yReNrB+ljhh1cGXIBBTKxyDuXy65VAN6+pM/bsJTYT7vgkYs/S3lggmtfzMboQjFr
	/jGA==
X-Received: by 10.180.81.37 with SMTP id w5mr5303445wix.65.1403687785221;
	Wed, 25 Jun 2014 02:16:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p3sm6217568wjw.13.2014.06.25.02.16.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jun 2014 02:16:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jun 2014 11:16:26 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140625091626.GR2437@jama>
References: <1403650427.2104.178.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1403650427.2104.178.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Convert to use pkg-config in internal m4 macros
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
X-List-Received-Date: Wed, 25 Jun 2014 09:16:29 -0000
X-Groupsio-MsgNum: 54392
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZaW/dtY/7oMe/vLp"
Content-Disposition: inline

--ZaW/dtY/7oMe/vLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2014 at 11:53:47PM +0100, Richard Purdie wrote:
> Rather than code which doesn't even work properly when cross compiling,
> lets just use pkg-config instead. Its a little simpler.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

BTW: libsdl-ttf still needs patch to use freetype2 pkg-config instead of
freetype-config, I'll fix that.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/pkgconfig.patch b=
/meta/recipes-graphics/libsdl/libsdl-1.2.15/pkgconfig.patch
> new file mode 100644
> index 0000000..913baa9
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/pkgconfig.patch
> @@ -0,0 +1,187 @@
> +Rather than code which doesn't even work properly when cross compiling,
> +lets just use pkg-config instead. Its a little simpler.
> +
> +RP 2014/6/20
> +
> +Upstream-Status: Pending
> +
> +Index: SDL-1.2.15/sdl.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- SDL-1.2.15.orig/sdl.m4
> ++++ SDL-1.2.15/sdl.m4
> +@@ -12,174 +12,8 @@ dnl Test for SDL, and define SDL_CFLAGS
> + dnl
> + AC_DEFUN([AM_PATH_SDL],
> + [dnl=20
> +-dnl Get the cflags and libraries from the sdl-config script
> +-dnl
> +-AC_ARG_WITH(sdl-prefix,[  --with-sdl-prefix=3DPFX   Prefix where SDL is=
 installed (optional)],
> +-            sdl_prefix=3D"$withval", sdl_prefix=3D"")
> +-AC_ARG_WITH(sdl-exec-prefix,[  --with-sdl-exec-prefix=3DPFX Exec prefix=
 where SDL is installed (optional)],
> +-            sdl_exec_prefix=3D"$withval", sdl_exec_prefix=3D"")
> +-AC_ARG_ENABLE(sdltest, [  --disable-sdltest       Do not try to compile=
 and run a test SDL program],
> +-		    , enable_sdltest=3Dyes)
> +-
> +-  if test x$sdl_exec_prefix !=3D x ; then
> +-    sdl_config_args=3D"$sdl_config_args --exec-prefix=3D$sdl_exec_prefi=
x"
> +-    if test x${SDL_CONFIG+set} !=3D xset ; then
> +-      SDL_CONFIG=3D$sdl_exec_prefix/bin/sdl-config
> +-    fi
> +-  fi
> +-  if test x$sdl_prefix !=3D x ; then
> +-    sdl_config_args=3D"$sdl_config_args --prefix=3D$sdl_prefix"
> +-    if test x${SDL_CONFIG+set} !=3D xset ; then
> +-      SDL_CONFIG=3D$sdl_prefix/bin/sdl-config
> +-    fi
> +-  fi
> +-
> +-  as_save_PATH=3D"$PATH"
> +-  if test "x$prefix" !=3D xNONE; then
> +-    PATH=3D"$prefix/bin:$prefix/usr/bin:$PATH"
> +-  fi
> +-  AC_PATH_PROG(SDL_CONFIG, sdl-config, no, [$PATH])
> +-  PATH=3D"$as_save_PATH"
> +   min_sdl_version=3Difelse([$1], ,0.11.0,$1)
> +-  AC_MSG_CHECKING(for SDL - version >=3D $min_sdl_version)
> +-  no_sdl=3D""
> +-  if test "$SDL_CONFIG" =3D "no" ; then
> +-    no_sdl=3Dyes
> +-  else
> +-    SDL_CFLAGS=3D`$SDL_CONFIG $sdl_config_args --cflags`
> +-    SDL_LIBS=3D`$SDL_CONFIG $sdl_config_args --libs`
> +-
> +-    sdl_major_version=3D`$SDL_CONFIG $sdl_config_args --version | \
> +-           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
> +-    sdl_minor_version=3D`$SDL_CONFIG $sdl_config_args --version | \
> +-           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
> +-    sdl_micro_version=3D`$SDL_CONFIG $sdl_config_args --version | \
> +-           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
> +-    if test "x$enable_sdltest" =3D "xyes" ; then
> +-      ac_save_CFLAGS=3D"$CFLAGS"
> +-      ac_save_CXXFLAGS=3D"$CXXFLAGS"
> +-      ac_save_LIBS=3D"$LIBS"
> +-      CFLAGS=3D"$CFLAGS $SDL_CFLAGS"
> +-      CXXFLAGS=3D"$CXXFLAGS $SDL_CFLAGS"
> +-      LIBS=3D"$LIBS $SDL_LIBS"
> +-dnl
> +-dnl Now check if the installed SDL is sufficiently new. (Also sanity
> +-dnl checks the results of sdl-config to some extent
> +-dnl
> +-      rm -f conf.sdltest
> +-      AC_TRY_RUN([
> +-#include <stdio.h>
> +-#include <stdlib.h>
> +-#include <string.h>
> +-#include "SDL.h"
> +-
> +-char*
> +-my_strdup (char *str)
> +-{
> +-  char *new_str;
> +- =20
> +-  if (str)
> +-    {
> +-      new_str =3D (char *)malloc ((strlen (str) + 1) * sizeof(char));
> +-      strcpy (new_str, str);
> +-    }
> +-  else
> +-    new_str =3D NULL;
> +- =20
> +-  return new_str;
> +-}
> +-
> +-int main (int argc, char *argv[])
> +-{
> +-  int major, minor, micro;
> +-  char *tmp_version;
> +-
> +-  /* This hangs on some systems (?)
> +-  system ("touch conf.sdltest");
> +-  */
> +-  { FILE *fp =3D fopen("conf.sdltest", "a"); if ( fp ) fclose(fp); }
> +-
> +-  /* HP/UX 9 (%@#!) writes to sscanf strings */
> +-  tmp_version =3D my_strdup("$min_sdl_version");
> +-  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) !=3D 3) {
> +-     printf("%s, bad version string\n", "$min_sdl_version");
> +-     exit(1);
> +-   }
> +-
> +-   if (($sdl_major_version > major) ||
> +-      (($sdl_major_version =3D=3D major) && ($sdl_minor_version > minor=
)) ||
> +-      (($sdl_major_version =3D=3D major) && ($sdl_minor_version =3D=3D =
minor) && ($sdl_micro_version >=3D micro)))
> +-    {
> +-      return 0;
> +-    }
> +-  else
> +-    {
> +-      printf("\n*** 'sdl-config --version' returned %d.%d.%d, but the m=
inimum version\n", $sdl_major_version, $sdl_minor_version, $sdl_micro_versi=
on);
> +-      printf("*** of SDL required is %d.%d.%d. If sdl-config is correct=
, then it is\n", major, minor, micro);
> +-      printf("*** best to upgrade to the required version.\n");
> +-      printf("*** If sdl-config was wrong, set the environment variable=
 SDL_CONFIG\n");
> +-      printf("*** to point to the correct copy of sdl-config, and remov=
e the file\n");
> +-      printf("*** config.cache before re-running configure\n");
> +-      return 1;
> +-    }
> +-}
> +-
> +-],, no_sdl=3Dyes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
> +-       CFLAGS=3D"$ac_save_CFLAGS"
> +-       CXXFLAGS=3D"$ac_save_CXXFLAGS"
> +-       LIBS=3D"$ac_save_LIBS"
> +-     fi
> +-  fi
> +-  if test "x$no_sdl" =3D x ; then
> +-     AC_MSG_RESULT(yes)
> +-     ifelse([$2], , :, [$2])    =20
> +-  else
> +-     AC_MSG_RESULT(no)
> +-     if test "$SDL_CONFIG" =3D "no" ; then
> +-       echo "*** The sdl-config script installed by SDL could not be fo=
und"
> +-       echo "*** If SDL was installed in PREFIX, make sure PREFIX/bin i=
s in"
> +-       echo "*** your path, or set the SDL_CONFIG environment variable =
to the"
> +-       echo "*** full path to sdl-config."
> +-     else
> +-       if test -f conf.sdltest ; then
> +-        :
> +-       else
> +-          echo "*** Could not run SDL test program, checking why..."
> +-          CFLAGS=3D"$CFLAGS $SDL_CFLAGS"
> +-          CXXFLAGS=3D"$CXXFLAGS $SDL_CFLAGS"
> +-          LIBS=3D"$LIBS $SDL_LIBS"
> +-          AC_TRY_LINK([
> +-#include <stdio.h>
> +-#include "SDL.h"
> +-
> +-int main(int argc, char *argv[])
> +-{ return 0; }
> +-#undef  main
> +-#define main K_and_R_C_main
> +-],      [ return 0; ],
> +-        [ echo "*** The test program compiled, but did not run. This us=
ually means"
> +-          echo "*** that the run-time linker is not finding SDL or find=
ing the wrong"
> +-          echo "*** version of SDL. If it is not finding SDL, you'll ne=
ed to set your"
> +-          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/=
ld.so.conf to point"
> +-          echo "*** to the installed location  Also, make sure you have=
 run ldconfig if that"
> +-          echo "*** is required on your system"
> +-	  echo "***"
> +-          echo "*** If you have an old version installed, it is best to=
 remove it, although"
> +-          echo "*** you may also be able to get things to work by modif=
ying LD_LIBRARY_PATH"],
> +-        [ echo "*** The test program failed to compile or link. See the=
 file config.log for the"
> +-          echo "*** exact error that occured. This usually means SDL wa=
s incorrectly installed"
> +-          echo "*** or that you have moved SDL since it was installed. =
In the latter case, you"
> +-          echo "*** may want to edit the sdl-config script: $SDL_CONFIG=
" ])
> +-          CFLAGS=3D"$ac_save_CFLAGS"
> +-          CXXFLAGS=3D"$ac_save_CXXFLAGS"
> +-          LIBS=3D"$ac_save_LIBS"
> +-       fi
> +-     fi
> +-     SDL_CFLAGS=3D""
> +-     SDL_LIBS=3D""
> +-     ifelse([$3], , :, [$3])
> +-  fi
> ++  PKG_CHECK_MODULES([SDL], [sdl >=3D $min_sdl_version])
> +   AC_SUBST(SDL_CFLAGS)
> +   AC_SUBST(SDL_LIBS)
> +-  rm -f conf.sdltest
> + ])
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes=
-graphics/libsdl/libsdl_1.2.15.bb
> index f81d862..e544b60 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -23,6 +23,7 @@ PR =3D "r3"
>  SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
>             file://configure_tweak.patch \
>             file://libsdl-1.2.15-xdata32.patch \
> +           file://pkgconfig.patch \
>            "
> =20
>  S =3D "${WORKDIR}/SDL-${PV}"
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZaW/dtY/7oMe/vLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOqk2oACgkQN1Ujt2V2gByPwQCeL3P2pw+GWRWMli9X5y73358D
zS8AniO+cPMFQPK3CdNQNW9nxFvJS6WR
=Wq12
-----END PGP SIGNATURE-----

--ZaW/dtY/7oMe/vLp--
