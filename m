Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CE7C465D69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 22:54:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5OMrtWE000799 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:53:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id spjZKcz1SS_e
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:53:55 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5OMrrZS000794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:53:54 +0100
Message-ID: <1403650427.2104.178.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jun 2014 23:53:47 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libsdl: Convert to use pkg-config in internal m4 macros
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
X-List-Received-Date: Tue, 24 Jun 2014 22:54:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Rather than code which doesn't even work properly when cross compiling,
lets just use pkg-config instead. Its a little simpler.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/pkgconfig.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/pkgconfig.patch
new file mode 100644
index 0000000..913baa9
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/pkgconfig.patch
@@ -0,0 +1,187 @@
+Rather than code which doesn't even work properly when cross compiling,
+lets just use pkg-config instead. Its a little simpler.
+
+RP 2014/6/20
+
+Upstream-Status: Pending
+
+Index: SDL-1.2.15/sdl.m4
+===================================================================
+--- SDL-1.2.15.orig/sdl.m4
++++ SDL-1.2.15/sdl.m4
+@@ -12,174 +12,8 @@ dnl Test for SDL, and define SDL_CFLAGS
+ dnl
+ AC_DEFUN([AM_PATH_SDL],
+ [dnl 
+-dnl Get the cflags and libraries from the sdl-config script
+-dnl
+-AC_ARG_WITH(sdl-prefix,[  --with-sdl-prefix=PFX   Prefix where SDL is installed (optional)],
+-            sdl_prefix="$withval", sdl_prefix="")
+-AC_ARG_WITH(sdl-exec-prefix,[  --with-sdl-exec-prefix=PFX Exec prefix where SDL is installed (optional)],
+-            sdl_exec_prefix="$withval", sdl_exec_prefix="")
+-AC_ARG_ENABLE(sdltest, [  --disable-sdltest       Do not try to compile and run a test SDL program],
+-		    , enable_sdltest=yes)
+-
+-  if test x$sdl_exec_prefix != x ; then
+-    sdl_config_args="$sdl_config_args --exec-prefix=$sdl_exec_prefix"
+-    if test x${SDL_CONFIG+set} != xset ; then
+-      SDL_CONFIG=$sdl_exec_prefix/bin/sdl-config
+-    fi
+-  fi
+-  if test x$sdl_prefix != x ; then
+-    sdl_config_args="$sdl_config_args --prefix=$sdl_prefix"
+-    if test x${SDL_CONFIG+set} != xset ; then
+-      SDL_CONFIG=$sdl_prefix/bin/sdl-config
+-    fi
+-  fi
+-
+-  as_save_PATH="$PATH"
+-  if test "x$prefix" != xNONE; then
+-    PATH="$prefix/bin:$prefix/usr/bin:$PATH"
+-  fi
+-  AC_PATH_PROG(SDL_CONFIG, sdl-config, no, [$PATH])
+-  PATH="$as_save_PATH"
+   min_sdl_version=ifelse([$1], ,0.11.0,$1)
+-  AC_MSG_CHECKING(for SDL - version >= $min_sdl_version)
+-  no_sdl=""
+-  if test "$SDL_CONFIG" = "no" ; then
+-    no_sdl=yes
+-  else
+-    SDL_CFLAGS=`$SDL_CONFIG $sdl_config_args --cflags`
+-    SDL_LIBS=`$SDL_CONFIG $sdl_config_args --libs`
+-
+-    sdl_major_version=`$SDL_CONFIG $sdl_config_args --version | \
+-           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
+-    sdl_minor_version=`$SDL_CONFIG $sdl_config_args --version | \
+-           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
+-    sdl_micro_version=`$SDL_CONFIG $sdl_config_args --version | \
+-           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
+-    if test "x$enable_sdltest" = "xyes" ; then
+-      ac_save_CFLAGS="$CFLAGS"
+-      ac_save_CXXFLAGS="$CXXFLAGS"
+-      ac_save_LIBS="$LIBS"
+-      CFLAGS="$CFLAGS $SDL_CFLAGS"
+-      CXXFLAGS="$CXXFLAGS $SDL_CFLAGS"
+-      LIBS="$LIBS $SDL_LIBS"
+-dnl
+-dnl Now check if the installed SDL is sufficiently new. (Also sanity
+-dnl checks the results of sdl-config to some extent
+-dnl
+-      rm -f conf.sdltest
+-      AC_TRY_RUN([
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <string.h>
+-#include "SDL.h"
+-
+-char*
+-my_strdup (char *str)
+-{
+-  char *new_str;
+-  
+-  if (str)
+-    {
+-      new_str = (char *)malloc ((strlen (str) + 1) * sizeof(char));
+-      strcpy (new_str, str);
+-    }
+-  else
+-    new_str = NULL;
+-  
+-  return new_str;
+-}
+-
+-int main (int argc, char *argv[])
+-{
+-  int major, minor, micro;
+-  char *tmp_version;
+-
+-  /* This hangs on some systems (?)
+-  system ("touch conf.sdltest");
+-  */
+-  { FILE *fp = fopen("conf.sdltest", "a"); if ( fp ) fclose(fp); }
+-
+-  /* HP/UX 9 (%@#!) writes to sscanf strings */
+-  tmp_version = my_strdup("$min_sdl_version");
+-  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
+-     printf("%s, bad version string\n", "$min_sdl_version");
+-     exit(1);
+-   }
+-
+-   if (($sdl_major_version > major) ||
+-      (($sdl_major_version == major) && ($sdl_minor_version > minor)) ||
+-      (($sdl_major_version == major) && ($sdl_minor_version == minor) && ($sdl_micro_version >= micro)))
+-    {
+-      return 0;
+-    }
+-  else
+-    {
+-      printf("\n*** 'sdl-config --version' returned %d.%d.%d, but the minimum version\n", $sdl_major_version, $sdl_minor_version, $sdl_micro_version);
+-      printf("*** of SDL required is %d.%d.%d. If sdl-config is correct, then it is\n", major, minor, micro);
+-      printf("*** best to upgrade to the required version.\n");
+-      printf("*** If sdl-config was wrong, set the environment variable SDL_CONFIG\n");
+-      printf("*** to point to the correct copy of sdl-config, and remove the file\n");
+-      printf("*** config.cache before re-running configure\n");
+-      return 1;
+-    }
+-}
+-
+-],, no_sdl=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
+-       CFLAGS="$ac_save_CFLAGS"
+-       CXXFLAGS="$ac_save_CXXFLAGS"
+-       LIBS="$ac_save_LIBS"
+-     fi
+-  fi
+-  if test "x$no_sdl" = x ; then
+-     AC_MSG_RESULT(yes)
+-     ifelse([$2], , :, [$2])     
+-  else
+-     AC_MSG_RESULT(no)
+-     if test "$SDL_CONFIG" = "no" ; then
+-       echo "*** The sdl-config script installed by SDL could not be found"
+-       echo "*** If SDL was installed in PREFIX, make sure PREFIX/bin is in"
+-       echo "*** your path, or set the SDL_CONFIG environment variable to the"
+-       echo "*** full path to sdl-config."
+-     else
+-       if test -f conf.sdltest ; then
+-        :
+-       else
+-          echo "*** Could not run SDL test program, checking why..."
+-          CFLAGS="$CFLAGS $SDL_CFLAGS"
+-          CXXFLAGS="$CXXFLAGS $SDL_CFLAGS"
+-          LIBS="$LIBS $SDL_LIBS"
+-          AC_TRY_LINK([
+-#include <stdio.h>
+-#include "SDL.h"
+-
+-int main(int argc, char *argv[])
+-{ return 0; }
+-#undef  main
+-#define main K_and_R_C_main
+-],      [ return 0; ],
+-        [ echo "*** The test program compiled, but did not run. This usually means"
+-          echo "*** that the run-time linker is not finding SDL or finding the wrong"
+-          echo "*** version of SDL. If it is not finding SDL, you'll need to set your"
+-          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
+-          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
+-          echo "*** is required on your system"
+-	  echo "***"
+-          echo "*** If you have an old version installed, it is best to remove it, although"
+-          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"],
+-        [ echo "*** The test program failed to compile or link. See the file config.log for the"
+-          echo "*** exact error that occured. This usually means SDL was incorrectly installed"
+-          echo "*** or that you have moved SDL since it was installed. In the latter case, you"
+-          echo "*** may want to edit the sdl-config script: $SDL_CONFIG" ])
+-          CFLAGS="$ac_save_CFLAGS"
+-          CXXFLAGS="$ac_save_CXXFLAGS"
+-          LIBS="$ac_save_LIBS"
+-       fi
+-     fi
+-     SDL_CFLAGS=""
+-     SDL_LIBS=""
+-     ifelse([$3], , :, [$3])
+-  fi
++  PKG_CHECK_MODULES([SDL], [sdl >= $min_sdl_version])
+   AC_SUBST(SDL_CFLAGS)
+   AC_SUBST(SDL_LIBS)
+-  rm -f conf.sdltest
+ ])
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index f81d862..e544b60 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -23,6 +23,7 @@ PR = "r3"
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
            file://libsdl-1.2.15-xdata32.patch \
+           file://pkgconfig.patch \
           "
 
 S = "${WORKDIR}/SDL-${PV}"



