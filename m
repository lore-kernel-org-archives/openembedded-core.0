Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RGMBn-0000d8-EL
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 04:47:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9J2fePv029084
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 19:41:40 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 18 Oct 2011 19:41:39 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 10:42:41 +0800
Message-ID: <7952d3012a8e843815517fbc4ff907440164cac1.1318991782.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
In-Reply-To: <cover.1318991782.git.kai.kang@windriver.com>
References: <cover.1318991782.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 5/5] libsdl: update to 1.2.14
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
X-List-Received-Date: Wed, 19 Oct 2011 02:47:32 -0000
Content-Type: text/plain

Update libsdl to 1.2.14
* update configure_tweak.patch
* update bb file, including add configure option --disable-video-ps3,
  drop acinclude.m4 and kernel-asm-page.patch and remove old libtool macros

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../libsdl/files/configure_tweak.patch             |  281 +++++++++-----------
 .../libsdl/{libsdl_1.2.11.bb => libsdl_1.2.14.bb}  |   17 +-
 2 files changed, 139 insertions(+), 159 deletions(-)
 rename meta/recipes-graphics/libsdl/{libsdl_1.2.11.bb => libsdl_1.2.14.bb} (81%)

diff --git a/meta/recipes-graphics/libsdl/files/configure_tweak.patch b/meta/recipes-graphics/libsdl/files/configure_tweak.patch
index 90a2888..55d203a 100644
--- a/meta/recipes-graphics/libsdl/files/configure_tweak.patch
+++ b/meta/recipes-graphics/libsdl/files/configure_tweak.patch
@@ -1,14 +1,7 @@
-Index: SDL-1.2.11/configure.in
-===================================================================
---- SDL-1.2.11.orig/configure.in	2006-06-27 05:48:33.000000000 +0100
-+++ SDL-1.2.11/configure.in	2008-02-21 19:48:47.000000000 +0000
-@@ -40,13 +40,13 @@
- AC_SUBST(LT_AGE)
- 
- dnl Detect the canonical build and host environments
--AC_CONFIG_AUX_DIRS($srcdir/build-scripts)
-+AC_CONFIG_AUX_DIR(./build-scripts)
- AC_CANONICAL_HOST
+--- SDL-1.2.14/configure.in.orig	2011-10-18 14:51:32.044167004 +0800
++++ SDL-1.2.14/configure.in	2011-10-18 14:51:42.374167009 +0800
+@@ -48,9 +48,9 @@
+ dnl AC_CANONICAL_HOST
  AC_C_BIGENDIAN
  if test x$ac_cv_c_bigendian = xyes; then
 -    AC_DEFINE(SDL_BYTEORDER, 4321)
@@ -18,8 +11,8 @@ Index: SDL-1.2.11/configure.in
 +    AC_DEFINE(SDL_BYTEORDER, 1234, "Byte Order")
  fi
  
- dnl Set up the compiler and linker flags
-@@ -107,7 +107,7 @@
+ dnl Check for tools
+@@ -139,7 +139,7 @@
  AC_HELP_STRING([--enable-libc], [Use the system C library [[default=yes]]]),
                , enable_libc=yes)
  if test x$enable_libc = xyes; then
@@ -28,7 +21,7 @@ Index: SDL-1.2.11/configure.in
  
      dnl Check for C library headers
      AC_HEADER_STDC
-@@ -118,7 +118,7 @@
+@@ -150,7 +150,7 @@
      if test x$ac_cv_header_inttypes_h = xyes -o x$ac_cv_header_stdint_h = xyes; then
          AC_CHECK_TYPE(int64_t)
          if test x$ac_cv_type_int64_t = xyes; then
@@ -37,8 +30,8 @@ Index: SDL-1.2.11/configure.in
          fi
          have_inttypes=yes
      fi
-@@ -127,11 +127,11 @@
-     AC_FUNC_ALLOCA
+@@ -166,11 +166,11 @@
+ 
      AC_FUNC_MEMCMP
      if test x$ac_cv_func_memcmp_working = xyes; then
 -        AC_DEFINE(HAVE_MEMCMP)
@@ -49,9 +42,9 @@ Index: SDL-1.2.11/configure.in
 -        AC_DEFINE(HAVE_STRTOD)
 +        AC_DEFINE(HAVE_STRTOD,1,"")
      fi
-     AC_CHECK_FUNCS(malloc calloc realloc free getenv putenv unsetenv qsort abs bcopy memset memcpy memmove strlen strlcpy strlcat strdup _strrev _strupr _strlwr strchr strrchr strstr itoa _ltoa _uitoa _ultoa strtol strtoul _i64toa _ui64toa strtoll strtoull atoi atof strcmp strncmp _stricmp strcasecmp _strnicmp strncasecmp sscanf snprintf vsnprintf iconv sigaction setjmp nanosleep)
- 
-@@ -146,40 +146,40 @@
+     AC_CHECK_FUNC(mprotect,
+         AC_TRY_COMPILE([
+@@ -194,40 +194,40 @@
      AC_CHECK_SIZEOF(long, 4)
      AC_CHECK_SIZEOF(long long, 8)
      if test x$ac_cv_sizeof_char = x1; then
@@ -110,7 +103,7 @@ Index: SDL-1.2.11/configure.in
  fi
  
  # Standard C sources
-@@ -201,67 +201,67 @@
+@@ -248,25 +248,25 @@
  AC_HELP_STRING([--enable-audio], [Enable the audio subsystem [[default=yes]]]),
                , enable_audio=yes)
  if test x$enable_audio != xyes; then
@@ -137,8 +130,10 @@ Index: SDL-1.2.11/configure.in
  if test x$enable_joystick != xyes; then
 -    AC_DEFINE(SDL_JOYSTICK_DISABLED)
 +    AC_DEFINE(SDL_JOYSTICK_DISABLED,1,"")
+ else
+     SOURCES="$SOURCES $srcdir/src/joystick/*.c"
  fi
- AC_ARG_ENABLE(cdrom,
+@@ -274,43 +274,43 @@
  AC_HELP_STRING([--enable-cdrom], [Enable the cdrom subsystem [[default=yes]]]),
                , enable_cdrom=yes)
  if test x$enable_cdrom != xyes; then
@@ -189,7 +184,7 @@ Index: SDL-1.2.11/configure.in
  fi
  
  dnl See if the OSS audio interface is supported
-@@ -289,12 +289,12 @@
+@@ -338,12 +338,12 @@
                int arg = SNDCTL_DSP_SETFRAGMENT;
              ],[
              have_oss=yes
@@ -204,7 +199,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/audio/dsp/*.c"
              SOURCES="$SOURCES $srcdir/src/audio/dma/*.c"
              have_audio=yes
-@@ -314,45 +314,7 @@
+@@ -363,35 +363,7 @@
      AC_ARG_ENABLE(alsa,
  AC_HELP_STRING([--enable-alsa], [support the ALSA audio API [[default=yes]]]),
                    , enable_alsa=yes)
@@ -218,18 +213,7 @@ Index: SDL-1.2.11/configure.in
 -            AC_ARG_ENABLE(alsa-shared,
 -AC_HELP_STRING([--enable-alsa-shared], [dynamically load ALSA audio support [[default=yes]]]),
 -                          , enable_alsa_shared=yes)
--            if test "x`echo $ALSA_LIBS | grep -- -L`" = "x"; then
--                if test "x`ls /lib/libasound.so.* 2> /dev/null`" != "x"; then
--                    ALSA_LIBS="-L/lib $ALSA_LIBS"
--                elif test "x`ls /usr/lib/libasound.so.* 2> /dev/null`" != "x"; then
--                    ALSA_LIBS="-L/usr/lib $ALSA_LIBS"
--                elif test "x`ls /usr/local/lib/libasound.so.* 2> /dev/null`" != "x"; then
--                    ALSA_LIBS="-L/usr/local/lib $ALSA_LIBS"
--                fi
--            fi
--            alsa_lib_spec=`echo $ALSA_LIBS | sed 's/.*-L\([[^ ]]*\).*/\1\/libasound.so.*/'`
--            alsa_lib=`ls -- $alsa_lib_spec | sed 's/.*\/\(.*\)/\1/; q'`
--            echo "-- $alsa_lib_spec -> $alsa_lib"
+-            alsa_lib=[`find_lib "libasound.so.*" "$ALSA_LIBS" | sed 's/.*\/\(.*\)/\1/; q'`]
 -
 -            AC_DEFINE(SDL_AUDIO_DRIVER_ALSA)
 -            SOURCES="$SOURCES $srcdir/src/audio/alsa/*.c"
@@ -240,6 +224,7 @@ Index: SDL-1.2.11/configure.in
 -            fi
 -            if test x$have_loadso = xyes && \
 -               test x$enable_alsa_shared = xyes && test x$alsa_lib != x; then
+-                echo "-- dynamic libasound -> $alsa_lib"
 -                AC_DEFINE_UNQUOTED(SDL_AUDIO_DRIVER_ALSA_DYNAMIC, "$alsa_lib")
 -            else
 -                EXTRA_LDFLAGS="$EXTRA_LDFLAGS $ALSA_LIBS"
@@ -251,7 +236,7 @@ Index: SDL-1.2.11/configure.in
  }
  
  dnl Check whether we want to use IRIX 6.5+ native audio or not
-@@ -371,7 +333,7 @@
+@@ -410,7 +382,7 @@
          AC_MSG_RESULT($have_dmedia)
          # Set up files for the audio library
          if test x$have_dmedia = xyes; then
@@ -260,7 +245,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/audio/dmedia/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -laudio"
              have_audio=yes
-@@ -408,7 +370,7 @@
+@@ -447,7 +419,7 @@
          AC_MSG_RESULT($have_mme)
          # Set up files for the audio library
          if test x$have_mme = xyes; then
@@ -269,52 +254,52 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/audio/mme/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $MME_CFLAGS"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS $MME_LIBS"
-@@ -433,7 +395,7 @@
-             esd_lib=`ls -- $esd_lib_spec | sed 's/.*\/\(.*\)/\1/; q'`
-             echo "-- $esd_lib_spec -> $esd_lib"
+@@ -470,7 +442,7 @@
+                           , enable_esd_shared=yes)
+             esd_lib=[`find_lib "libesd.so.*" "$ESD_LIBS" | sed 's/.*\/\(.*\)/\1/; q'`]
  
 -            AC_DEFINE(SDL_AUDIO_DRIVER_ESD)
 +            AC_DEFINE(SDL_AUDIO_DRIVER_ESD,1,"")
              SOURCES="$SOURCES $srcdir/src/audio/esd/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $ESD_CFLAGS"
              if test x$have_loadso != xyes && \
-@@ -442,7 +404,7 @@
-             fi
+@@ -480,7 +452,7 @@
              if test x$have_loadso = xyes && \
                 test x$enable_esd_shared = xyes && test x$esd_lib != x; then
+                 echo "-- dynamic libesd -> $esd_lib"
 -                AC_DEFINE_UNQUOTED(SDL_AUDIO_DRIVER_ESD_DYNAMIC, "$esd_lib")
 +                AC_DEFINE_UNQUOTED(SDL_AUDIO_DRIVER_ESD_DYNAMIC, "$esd_lib", "")
              else
                  EXTRA_LDFLAGS="$EXTRA_LDFLAGS $ESD_LIBS"
              fi
-@@ -485,7 +447,7 @@
-                 arts_lib=`ls -- $arts_lib_spec | sed 's/.*\/\(.*\)/\1/; q'`
-                 echo "-- $arts_lib_spec -> $arts_lib"
+@@ -567,7 +539,7 @@
+                               , enable_arts_shared=yes)
+                 arts_lib=[`find_lib "libartsc.so.*" "$ARTS_LIBS" | sed 's/.*\/\(.*\)/\1/; q'`]
  
 -                AC_DEFINE(SDL_AUDIO_DRIVER_ARTS)
 +                AC_DEFINE(SDL_AUDIO_DRIVER_ARTS,, "")
                  SOURCES="$SOURCES $srcdir/src/audio/arts/*.c"
                  EXTRA_CFLAGS="$EXTRA_CFLAGS $ARTS_CFLAGS"
                  if test x$have_loadso != xyes && \
-@@ -494,7 +456,7 @@
-                 fi
+@@ -577,7 +549,7 @@
                  if test x$have_loadso = xyes && \
                     test x$enable_arts_shared = xyes && test x$arts_lib != x; then
+                     echo "-- dynamic libartsc -> $arts_lib"
 -                    AC_DEFINE_UNQUOTED(SDL_AUDIO_DRIVER_ARTS_DYNAMIC, "$arts_lib")
 +                    AC_DEFINE_UNQUOTED(SDL_AUDIO_DRIVER_ARTS_DYNAMIC, "$arts_lib",1,"")
                  else
                      EXTRA_LDFLAGS="$EXTRA_LDFLAGS $ARTS_LIBS"
                  fi
-@@ -527,7 +489,7 @@
-         fi
-         AC_MSG_RESULT($have_nas)
-         if test x$have_nas = xyes; then
+@@ -637,7 +609,7 @@
+                 EXTRA_LDFLAGS="$EXTRA_LDFLAGS $NAS_LIBS"
+             fi
+ 
 -            AC_DEFINE(SDL_AUDIO_DRIVER_NAS)
 +            AC_DEFINE(SDL_AUDIO_DRIVER_NAS,1,"")
              SOURCES="$SOURCES $srcdir/src/audio/nas/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $NAS_CFLAGS"
-             EXTRA_LDFLAGS="$EXTRA_LDFLAGS $NAS_LIBS"
-@@ -543,7 +505,7 @@
+             have_audio=yes
+@@ -652,7 +624,7 @@
  AC_HELP_STRING([--enable-diskaudio], [support the disk writer audio driver [[default=yes]]]),
                    , enable_diskaudio=yes)
      if test x$enable_audio = xyes -a x$enable_diskaudio = xyes; then
@@ -323,7 +308,7 @@ Index: SDL-1.2.11/configure.in
          SOURCES="$SOURCES $srcdir/src/audio/disk/*.c"
      fi
  }
-@@ -555,7 +517,7 @@
+@@ -664,7 +636,7 @@
  AC_HELP_STRING([--enable-dummyaudio], [support the dummy audio driver [[default=yes]]]),
                    , enable_dummyaudio=yes)
      if test x$enable_audio = xyes -a x$enable_dummyaudio = xyes; then
@@ -332,7 +317,7 @@ Index: SDL-1.2.11/configure.in
          SOURCES="$SOURCES $srcdir/src/audio/dummy/*.c"
      fi
  }
-@@ -571,7 +533,7 @@
+@@ -680,7 +652,7 @@
          AC_CHECK_HEADER(mint/falcon.h, have_mint_falcon_hdr=yes)
          if test x$have_mint_falcon_hdr = xyes; then
              mintaudio=yes
@@ -341,16 +326,16 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/audio/mint/*.c"
              SOURCES="$SOURCES $srcdir/src/audio/mint/*.S"
              have_audio=yes
-@@ -602,7 +564,7 @@
+@@ -756,7 +728,7 @@
              AC_PATH_PROG(NASM, nasm)
          fi
          if test "x$NASM" != x -a "x$NASM" != x'"$NASM"'; then
 -            AC_DEFINE(SDL_HERMES_BLITTERS)
 +            AC_DEFINE(SDL_HERMES_BLITTERS,1,"")
              SOURCES="$SOURCES $srcdir/src/hermes/*.asm"
-             if test x"$NASMFLAGS" = x; then
-                 case $ARCH in
-@@ -713,9 +675,9 @@
+             NASMFLAGS="$NASMFLAGS -I $srcdir/src/hermes/"
+ 
+@@ -850,9 +822,9 @@
          CFLAGS="$save_CFLAGS"
  
          if test x$have_gcc_altivec = xyes; then
@@ -362,7 +347,7 @@ Index: SDL-1.2.11/configure.in
              fi
              EXTRA_CFLAGS="$EXTRA_CFLAGS $altivec_CFLAGS"
          fi
-@@ -758,7 +720,7 @@
+@@ -895,7 +867,7 @@
  
      if test x$enable_ipod = xyes; then
          EXTRA_CFLAGS="$EXTRA_CFLAGS -DIPOD"
@@ -371,7 +356,7 @@ Index: SDL-1.2.11/configure.in
          SOURCES="$SOURCES $srcdir/src/video/ipod/*.c"
      fi
  }
-@@ -792,7 +754,7 @@
+@@ -929,7 +901,7 @@
              EXTRA_CFLAGS="$EXTRA_CFLAGS -DENABLE_NANOX_DIRECT_FB"
          fi
  
@@ -380,7 +365,7 @@ Index: SDL-1.2.11/configure.in
          SOURCES="$SOURCES $srcdir/src/video/nanox/*.c"
          EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lnano-X"
          have_video=yes
-@@ -881,7 +843,7 @@
+@@ -995,7 +967,7 @@
              CFLAGS="$CFLAGS $X_CFLAGS"
              LDFLAGS="$LDFLAGS $X_LIBS"
  
@@ -389,7 +374,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/x11/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $X_CFLAGS"
  
-@@ -903,8 +865,8 @@
+@@ -1017,8 +989,8 @@
                 test x$enable_x11_shared = xyes && test x$x11_lib != x && test x$x11ext_lib != x; then
                  echo "-- dynamic libX11 -> $x11_lib"
                  echo "-- dynamic libX11ext -> $x11ext_lib"
@@ -400,7 +385,7 @@ Index: SDL-1.2.11/configure.in
              else
                  enable_x11_shared=no
                  EXTRA_LDFLAGS="$EXTRA_LDFLAGS $X_LIBS -lX11 -lXext"
-@@ -921,20 +883,20 @@
+@@ -1035,20 +1007,20 @@
  AC_HELP_STRING([--enable-video-dga], [use DGA 2.0 video driver [[default=yes]]]),
                    , enable_video_dga=yes)
              if test x$enable_dga = xyes -a x$enable_video_dga = xyes; then
@@ -424,7 +409,7 @@ Index: SDL-1.2.11/configure.in
                  SOURCES="$SOURCES $srcdir/src/video/Xext/Xxf86vm/*.c"
              fi
              AC_ARG_ENABLE(video-x11-xv,
-@@ -948,14 +910,14 @@
+@@ -1062,14 +1034,14 @@
  AC_HELP_STRING([--enable-video-x11-xinerama], [enable X11 Xinerama support [[default=yes]]]),
                              , enable_video_x11_xinerama=yes)
              if test x$enable_video_x11_xinerama = xyes; then
@@ -441,7 +426,7 @@ Index: SDL-1.2.11/configure.in
                  SOURCES="$SOURCES $srcdir/src/video/Xext/XME/*.c"
              fi
              AC_ARG_ENABLE(video-x11-xrandr,
-@@ -972,8 +934,8 @@
+@@ -1086,8 +1058,8 @@
                      if test x$enable_x11_shared = xyes && test x$xrandr_lib != x ; then
                          echo "-- dynamic libXrender -> $xrender_lib"
                          echo "-- dynamic libXrandr -> $xrandr_lib"
@@ -452,25 +437,16 @@ Index: SDL-1.2.11/configure.in
                          definitely_enable_video_x11_xrandr=yes
                      else
                          AC_CHECK_LIB(Xrender, XRenderQueryExtension, have_xrender_lib=yes)
-@@ -986,7 +948,7 @@
+@@ -1100,7 +1072,7 @@
                  fi
              fi
              if test x$definitely_enable_video_x11_xrandr = xyes; then
 -                AC_DEFINE(SDL_VIDEO_DRIVER_X11_XRANDR)
 +                AC_DEFINE(SDL_VIDEO_DRIVER_X11_XRANDR,1,"")
              fi
-             AC_ARG_ENABLE(video-x11-dpms,
- AC_HELP_STRING([--enable-video-x11-dpms], [enable X11 DPMS extension [[default=yes]]]),
-@@ -998,7 +960,7 @@
-                                 [#include <X11/Xlib.h>
-                                 ])
-                 if test x$have_dpms_h_hdr = xyes; then
--                    AC_DEFINE(SDL_VIDEO_DRIVER_X11_DPMS)
-+                    AC_DEFINE(SDL_VIDEO_DRIVER_X11_DPMS,1,"")
-                 fi
-             fi
          fi
-@@ -1026,7 +988,7 @@
+     fi
+@@ -1127,7 +1099,7 @@
          ])
          AC_MSG_RESULT($video_photon)
          if test x$video_photon = xyes; then
@@ -479,7 +455,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/photon/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lph"
              have_video=yes
-@@ -1040,7 +1002,7 @@
+@@ -1141,7 +1113,7 @@
  CheckBWINDOW()
  {
      if test x$enable_video = xyes; then
@@ -488,7 +464,7 @@ Index: SDL-1.2.11/configure.in
          SOURCES="$SOURCES $srcdir/src/video/bwindow/*.cc"
          have_video=yes
      fi
-@@ -1063,7 +1025,7 @@
+@@ -1164,7 +1136,7 @@
          ])
          AC_MSG_RESULT($have_carbon)
          if test x$have_carbon = xyes; then
@@ -497,7 +473,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/maccommon/*.c"
              SOURCES="$SOURCES $srcdir/src/video/macrom/*.c"
              have_video=yes
-@@ -1092,7 +1054,7 @@
+@@ -1193,7 +1165,7 @@
          AC_MSG_RESULT($have_cocoa)
          CFLAGS="$save_CFLAGS"
          if test x$have_cocoa = xyes; then
@@ -506,17 +482,17 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/quartz/*.m"
              have_video=yes
          fi
-@@ -1118,7 +1080,7 @@
-         ])
+@@ -1220,7 +1192,7 @@
          AC_MSG_RESULT($video_fbcon)
          if test x$video_fbcon = xyes; then
+             AC_CHECK_FUNCS(getpagesize)
 -            AC_DEFINE(SDL_VIDEO_DRIVER_FBCON)
 +            AC_DEFINE(SDL_VIDEO_DRIVER_FBCON,1,"")
              SOURCES="$SOURCES $srcdir/src/video/fbcon/*.c"
              have_video=yes
          fi
-@@ -1163,7 +1125,7 @@
-         fi
+@@ -1271,7 +1243,7 @@
+         AC_MSG_RESULT($video_directfb)
  
          if test x$video_directfb = xyes; then
 -            AC_DEFINE(SDL_VIDEO_DRIVER_DIRECTFB)
@@ -524,7 +500,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/directfb/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $DIRECTFB_CFLAGS"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS $DIRECTFB_LIBS"
-@@ -1190,7 +1152,7 @@
+@@ -1298,7 +1270,7 @@
          ])
          AC_MSG_RESULT($video_ps2gs)
          if test x$video_ps2gs = xyes; then
@@ -533,7 +509,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/ps2gs/*.c"
              have_video=yes
          fi
-@@ -1215,7 +1177,7 @@
+@@ -1350,7 +1322,7 @@
          ])
          AC_MSG_RESULT($video_ggi)
          if test x$video_ggi = xyes; then
@@ -542,7 +518,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/ggi/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lggi -lgii -lgg"
              have_video=yes
-@@ -1245,7 +1207,7 @@
+@@ -1380,7 +1352,7 @@
          ])
          AC_MSG_RESULT($video_svga)
          if test x$video_svga = xyes; then
@@ -551,7 +527,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/svga/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lvga"
              have_video=yes
-@@ -1277,7 +1239,7 @@
+@@ -1412,7 +1384,7 @@
          ])
          AC_MSG_RESULT($video_vgl)
          if test x$video_vgl = xyes; then
@@ -560,7 +536,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/vgl/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lvgl"
              have_video=yes
-@@ -1305,7 +1267,7 @@
+@@ -1440,7 +1412,7 @@
          ])
          AC_MSG_RESULT($video_wscons)
          if test x$video_wscons = xyes; then
@@ -569,7 +545,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/wscons/*.c"
              have_video=yes
          fi
-@@ -1330,7 +1292,7 @@
+@@ -1465,7 +1437,7 @@
          ])
          AC_MSG_RESULT($video_aalib)
          if test x$video_aalib = xyes; then
@@ -578,7 +554,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/aalib/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -laa"
              have_video=yes
-@@ -1360,7 +1322,7 @@
+@@ -1527,7 +1499,7 @@
          CXXFLAGS="$OLD_CXX"
          AC_MSG_RESULT($video_qtopia)
          if test x$video_qtopia = xyes; then
@@ -587,7 +563,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/qtopia/*.cc"
              SDLMAIN_SOURCES="$srcdir/src/main/qtopia/*.cc"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $QTOPIA_FLAGS"
-@@ -1389,7 +1351,7 @@
+@@ -1556,7 +1528,7 @@
          ])
          AC_MSG_RESULT($video_picogui)
          if test x$video_picogui = xyes; then
@@ -596,7 +572,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/picogui/*.c"
              SDL_LIBS="$SDL_LIBS -lpgui"
              have_video=yes
-@@ -1413,7 +1375,7 @@
+@@ -1580,7 +1552,7 @@
      video_xbios=no
      if test x$enable_video = xyes -a x$enable_video_xbios = xyes; then
          video_xbios=yes
@@ -605,7 +581,7 @@ Index: SDL-1.2.11/configure.in
          SOURCES="$SOURCES $srcdir/src/video/xbios/*.c"
          have_video=yes
      fi
-@@ -1431,7 +1393,7 @@
+@@ -1598,7 +1570,7 @@
          AC_CHECK_LIB(gem, appl_init, have_gem_lib=yes)
          if test x$have_gem_hdr = xyes -a x$have_gem_lib = xyes; then
              video_gem=yes
@@ -614,7 +590,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/gem/*.c"
              SDL_LIBS="$SDL_LIBS -lgem"
              have_video=yes
-@@ -1446,7 +1408,7 @@
+@@ -1613,7 +1585,7 @@
  AC_HELP_STRING([--enable-video-dummy], [use dummy video driver [[default=yes]]]),
                    , enable_video_dummy=yes)
      if test x$enable_video_dummy = xyes; then
@@ -623,7 +599,7 @@ Index: SDL-1.2.11/configure.in
          SOURCES="$SOURCES $srcdir/src/video/dummy/*.c"
          have_video=yes
      fi
-@@ -1472,8 +1434,8 @@
+@@ -1640,8 +1612,8 @@
          ])
          AC_MSG_RESULT($video_opengl)
          if test x$video_opengl = xyes; then
@@ -634,7 +610,7 @@ Index: SDL-1.2.11/configure.in
          fi
      fi
  }
-@@ -1492,7 +1454,7 @@
+@@ -1660,7 +1632,7 @@
          ])
          AC_MSG_RESULT($video_opengl)
          if test x$video_opengl = xyes; then
@@ -643,7 +619,7 @@ Index: SDL-1.2.11/configure.in
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lGL"
          fi
      fi
-@@ -1502,8 +1464,8 @@
+@@ -1670,8 +1642,8 @@
  CheckWIN32GL()
  {
      if test x$enable_video = xyes -a x$enable_video_opengl = xyes; then
@@ -654,7 +630,7 @@ Index: SDL-1.2.11/configure.in
      fi
  }
  
-@@ -1511,7 +1473,7 @@
+@@ -1679,7 +1651,7 @@
  CheckBeGL()
  {
      if test x$enable_video = xyes -a x$enable_video_opengl = xyes; then
@@ -663,7 +639,7 @@ Index: SDL-1.2.11/configure.in
          EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lGL"
      fi
  }
-@@ -1520,7 +1482,7 @@
+@@ -1688,7 +1660,7 @@
  CheckMacGL()
  {
      if test x$enable_video = xyes -a x$enable_video_opengl = xyes; then
@@ -672,7 +648,7 @@ Index: SDL-1.2.11/configure.in
          case "$host" in
              *-*-darwin*)
                  if test x$enable_video_cocoa = xyes; then
-@@ -1552,8 +1514,8 @@
+@@ -1720,8 +1692,8 @@
              OSMESA_CFLAGS=`$OSMESA_CONFIG --cflags`
              OSMESA_LIBS=`$OSMESA_CONFIG --libs`
          fi
@@ -683,7 +659,7 @@ Index: SDL-1.2.11/configure.in
          SDL_CFLAGS="$SDL_CFLAGS $OSMESA_CFLAGS"
          SDL_LIBS="$SDL_LIBS $OSMESA_LIBS"
  
-@@ -1563,7 +1525,7 @@
+@@ -1731,7 +1703,7 @@
          if test "x$enable_osmesa_shared" = "xyes" -a "x$enable_atari_ldg" = "xyes"; then
              # Dynamic linking
              if test "x$have_osmesa_hdr" = "xyes"; then
@@ -692,7 +668,7 @@ Index: SDL-1.2.11/configure.in
              fi
          fi
      fi
-@@ -1590,7 +1552,7 @@
+@@ -1765,7 +1737,7 @@
          ])
          AC_MSG_RESULT($use_input_events)
          if test x$use_input_events = xyes; then
@@ -701,7 +677,7 @@ Index: SDL-1.2.11/configure.in
          fi
      fi
  }
-@@ -1612,7 +1574,7 @@
+@@ -1787,7 +1759,7 @@
          ])
          AC_MSG_RESULT($enable_input_tslib)
          if test x$enable_input_tslib = xyes; then
@@ -710,7 +686,7 @@ Index: SDL-1.2.11/configure.in
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lts"
          fi
      fi
-@@ -1635,7 +1597,7 @@
+@@ -1810,7 +1782,7 @@
          AC_MSG_CHECKING(pth)
          AC_MSG_RESULT($use_pth)
          if test "x$use_pth" = xyes; then
@@ -719,7 +695,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/thread/pth/*.c"
              SOURCES="$SOURCES $srcdir/src/thread/generic/SDL_syssem.c"
              SDL_CFLAGS="$SDL_CFLAGS `$PTH_CONFIG --cflags`"
-@@ -1741,7 +1703,7 @@
+@@ -1916,7 +1888,7 @@
  
          # Do futher testing if we have pthread support...
          if test x$use_pthreads = xyes; then
@@ -728,7 +704,7 @@ Index: SDL-1.2.11/configure.in
              EXTRA_CFLAGS="$EXTRA_CFLAGS $pthread_cflags"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS $pthread_lib"
              SDL_CFLAGS="$SDL_CFLAGS $pthread_cflags"
-@@ -1763,7 +1725,7 @@
+@@ -1938,7 +1910,7 @@
                    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
                  ],[
                  has_recursive_mutexes=yes
@@ -737,7 +713,7 @@ Index: SDL-1.2.11/configure.in
                  ])
              fi
              if test x$has_recursive_mutexes = xno; then
-@@ -1774,7 +1736,7 @@
+@@ -1949,7 +1921,7 @@
                    pthread_mutexattr_setkind_np(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
                  ],[
                  has_recursive_mutexes=yes
@@ -746,7 +722,7 @@ Index: SDL-1.2.11/configure.in
                  ])
              fi
              AC_MSG_RESULT($has_recursive_mutexes)
-@@ -1849,7 +1811,7 @@
+@@ -2024,7 +1996,7 @@
      fi
  
      if test x$enable_video = xyes; then
@@ -755,7 +731,7 @@ Index: SDL-1.2.11/configure.in
          SOURCES="$SOURCES $srcdir/src/video/wincommon/*.c"
          SOURCES="$SOURCES $srcdir/src/video/windib/*.c"
          have_video=yes
-@@ -1871,7 +1833,7 @@
+@@ -2046,7 +2018,7 @@
              have_directx=yes
          fi
          if test x$enable_video = xyes -a x$have_directx = xyes; then
@@ -764,19 +740,16 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/video/windx5/*.c"
              have_video=yes
          fi
-@@ -1904,9 +1866,9 @@
+@@ -2077,7 +2049,7 @@
+             AC_CHECK_LIB(c, dlopen, EXTRA_LDFLAGS="$EXTRA_LDFLAGS",
+                AC_CHECK_LIB(dl, dlopen, EXTRA_LDFLAGS="$EXTRA_LDFLAGS -ldl",
                    AC_CHECK_LIB(ltdl, dlopen, EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lltdl")))
-             AC_CHECK_LIB(dl, dlvsym, have_dlvsym=yes)
-             if test x$have_dlvsym = xyes; then
--                AC_DEFINE(HAVE_DLVSYM)
-+                AC_DEFINE(HAVE_DLVSYM,1,"")
-             fi
 -            AC_DEFINE(SDL_LOADSO_DLOPEN)
 +            AC_DEFINE(SDL_LOADSO_DLOPEN,1,"")
              SOURCES="$SOURCES $srcdir/src/loadso/dlopen/*.c"
              have_loadso=yes
          fi
-@@ -1923,7 +1885,7 @@
+@@ -2094,7 +2066,7 @@
          AC_CHECK_HEADER(ldg.h, have_ldg_hdr=yes)
          AC_CHECK_LIB(ldg, ldg_open, have_ldg_lib=yes, have_ldg_lib=no, -lgem)
          if test x$have_ldg_hdr = xyes -a x$have_ldg_lib = xyes; then
@@ -785,7 +758,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/loadso/mint/*.c"
              SDL_LIBS="$SDL_LIBS -lldg -lgem"
              have_loadso=yes
-@@ -2049,11 +2011,11 @@
+@@ -2225,11 +2197,11 @@
              have_machine_joystick=yes
              ])
              if test x$have_machine_joystick = xyes; then
@@ -799,7 +772,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/joystick/bsd/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $USB_CFLAGS"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS $USB_LIBS"
-@@ -2072,7 +2034,7 @@
+@@ -2248,7 +2220,7 @@
      if test x$enable_clock_gettime = xyes; then
          AC_CHECK_LIB(rt, clock_gettime, have_clock_gettime=yes)
          if test x$have_clock_gettime = xyes; then
@@ -808,7 +781,7 @@ Index: SDL-1.2.11/configure.in
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lrt"
          fi
      fi
-@@ -2103,7 +2065,7 @@
+@@ -2279,7 +2251,7 @@
          CheckIPod
          # Set up files for the timer library
          if test x$enable_timers = xyes; then
@@ -817,7 +790,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/timer/unix/*.c"
              have_timers=yes
          fi
-@@ -2166,17 +2128,17 @@
+@@ -2345,17 +2317,17 @@
          if test x$enable_audio = xyes; then
            case $ARCH in
              sysv5|solaris|hpux)
@@ -838,7 +811,7 @@ Index: SDL-1.2.11/configure.in
                  SOURCES="$SOURCES $srcdir/src/audio/paudio/*.c"
                  have_audio=yes
              ;;
-@@ -2186,7 +2148,7 @@
+@@ -2365,7 +2337,7 @@
          if test x$enable_joystick = xyes; then
            case $ARCH in
              linux)
@@ -847,7 +820,7 @@ Index: SDL-1.2.11/configure.in
                  SOURCES="$SOURCES $srcdir/src/joystick/linux/*.c"
                  have_joystick=yes
              ;;
-@@ -2196,32 +2158,32 @@
+@@ -2375,32 +2347,32 @@
          if test x$enable_cdrom = xyes; then
            case $ARCH in
              linux|solaris)
@@ -886,7 +859,7 @@ Index: SDL-1.2.11/configure.in
                  SOURCES="$SOURCES $srcdir/src/cdrom/osf/*.c"
                  have_cdrom=yes
              ;;
-@@ -2229,7 +2191,7 @@
+@@ -2408,7 +2380,7 @@
          fi
          # Set up files for the thread library
          if test x$enable_threads = xyes -a x$use_pthreads != xyes -a x$use_pth != xyes -a x$ARCH = xirix; then
@@ -895,7 +868,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/thread/irix/*.c"
              SOURCES="$SOURCES $srcdir/src/thread/generic/SDL_sysmutex.c"
              SOURCES="$SOURCES $srcdir/src/thread/generic/SDL_syscond.c"
-@@ -2237,7 +2199,7 @@
+@@ -2416,7 +2388,7 @@
          fi
          # Set up files for the timer library
          if test x$enable_timers = xyes; then
@@ -904,7 +877,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/timer/unix/*.c"
              have_timers=yes
          fi
-@@ -2256,20 +2218,20 @@
+@@ -2435,20 +2407,20 @@
          CheckPTHREAD
          # Set up files for the audio library
          if test x$enable_audio = xyes; then
@@ -928,7 +901,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/timer/unix/*.c"
              have_timers=yes
          fi
-@@ -2294,29 +2256,29 @@
+@@ -2473,29 +2445,29 @@
          CheckNASM
          # Set up files for the audio library
          if test x$enable_audio = xyes; then
@@ -963,7 +936,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/thread/win32/SDL_sysmutex.c"
              SOURCES="$SOURCES $srcdir/src/thread/win32/SDL_syssem.c"
              SOURCES="$SOURCES $srcdir/src/thread/win32/SDL_systhread.c"
-@@ -2325,13 +2287,13 @@
+@@ -2504,13 +2476,13 @@
          fi
          # Set up files for the timer library
          if test x$enable_timers = xyes; then
@@ -979,7 +952,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/loadso/win32/*.c"
              have_loadso=yes
          fi
-@@ -2356,25 +2318,25 @@
+@@ -2579,25 +2551,25 @@
          CheckBeGL
          # Set up files for the audio library
          if test x$enable_audio = xyes; then
@@ -1009,7 +982,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/thread/beos/*.c"
              SOURCES="$SOURCES $srcdir/src/thread/generic/SDL_sysmutex.c"
              SOURCES="$SOURCES $srcdir/src/thread/generic/SDL_syscond.c"
-@@ -2382,13 +2344,13 @@
+@@ -2605,7 +2577,7 @@
          fi
          # Set up files for the timer library
          if test x$enable_timers = xyes; then
@@ -1018,14 +991,21 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/timer/beos/*.c"
              have_timers=yes
          fi
-         # Set up files for the shared object loading library
+@@ -2613,11 +2585,11 @@
          if test x$enable_loadso = xyes; then
--            AC_DEFINE(SDL_LOADSO_BEOS)
-+            AC_DEFINE(SDL_LOADSO_BEOS,1,"")
-             SOURCES="$SOURCES $srcdir/src/loadso/beos/*.c"
-             have_loadso=yes
-         fi
-@@ -2425,7 +2387,7 @@
+             case "$host" in
+                 *-*-beos*)
+-                    AC_DEFINE(SDL_LOADSO_BEOS)
++                    AC_DEFINE(SDL_LOADSO_BEOS,1,"")
+                     SOURCES="$SOURCES $srcdir/src/loadso/beos/*.c"
+                 ;;
+                 *-*-haiku*)
+-                    AC_DEFINE(SDL_LOADSO_DLOPEN)
++                    AC_DEFINE(SDL_LOADSO_DLOPEN,1,"")
+                     SOURCES="$SOURCES $srcdir/src/loadso/dlopen/*.c"
+                 ;;
+             esac    
+@@ -2653,7 +2625,7 @@
          # Set up files for the shared object loading library
          # (this needs to be done before the dynamic X11 check)
          if test x$enable_loadso = xyes -a x$have_dlopen != xyes; then
@@ -1034,16 +1014,13 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/loadso/macosx/*.c"
              have_loadso=yes
          fi
-@@ -2443,28 +2405,28 @@
+@@ -2671,26 +2643,26 @@
  
          # Set up files for the audio library
          if test x$enable_audio = xyes; then
 -            AC_DEFINE(SDL_AUDIO_DRIVER_COREAUDIO)
 +            AC_DEFINE(SDL_AUDIO_DRIVER_COREAUDIO,1,"")
              SOURCES="$SOURCES $srcdir/src/audio/macosx/*.c"
--            AC_DEFINE(SDL_AUDIO_DRIVER_SNDMGR)
-+            AC_DEFINE(SDL_AUDIO_DRIVER_SNDMGR,1,"")
-             SOURCES="$SOURCES $srcdir/src/audio/macrom/*.c"
              have_audio=yes
          fi
          # Set up files for the joystick library
@@ -1051,8 +1028,8 @@ Index: SDL-1.2.11/configure.in
 -            AC_DEFINE(SDL_JOYSTICK_IOKIT)
 +            AC_DEFINE(SDL_JOYSTICK_IOKIT,1,"")
              SOURCES="$SOURCES $srcdir/src/joystick/darwin/*.c"
-             EXTRA_LDFLAGS="$EXTRA_LDFLAGS -Wl,-framework,IOKit"
              have_joystick=yes
+             need_iokit_framework=yes
          fi
          # Set up files for the cdrom library
          if test x$enable_cdrom = xyes; then
@@ -1068,7 +1045,7 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/timer/unix/*.c"
              have_timers=yes
          fi
-@@ -2500,30 +2462,30 @@
+@@ -2731,30 +2703,30 @@
          # Set up files for the audio library
          if test x$enable_threads = xyes -a x$enable_pth = xyes; then
              if test x$enable_audio = xyes; then
@@ -1104,7 +1081,7 @@ Index: SDL-1.2.11/configure.in
                  SOURCES="$SOURCES $srcdir/src/timer/mint/*.c"
                  SOURCES="$SOURCES $srcdir/src/timer/mint/*.S"
              fi
-@@ -2536,20 +2498,20 @@
+@@ -2767,20 +2739,20 @@
          CheckPTHREAD
          # Set up files for the video library
          if test x$enable_video = xyes; then
@@ -1128,14 +1105,14 @@ Index: SDL-1.2.11/configure.in
              SOURCES="$SOURCES $srcdir/src/timer/riscos/*.c"
              have_timers=yes
          fi
-@@ -2566,31 +2528,31 @@
- # Verify that we have all the platform specific files we need
- if test x$have_joystick != xyes; then
-     if test x$enable_joystick = xyes; then
--        AC_DEFINE(SDL_JOYSTICK_DISABLED)
-+        AC_DEFINE(SDL_JOYSTICK_DISABLED,1,"")
-     fi
+@@ -2799,31 +2771,31 @@
+ if test x$enable_joystick = xyes; then
+   if test x$have_joystick != xyes; then
+     # Wants joystick subsystem, but doesn't have a platform-specific backend...
+-    AC_DEFINE(SDL_JOYSTICK_DUMMY)
++    AC_DEFINE(SDL_JOYSTICK_DUMMY,1,"")
      SOURCES="$SOURCES $srcdir/src/joystick/dummy/*.c"
+   fi
  fi
  if test x$have_cdrom != xyes; then
      if test x$enable_cdrom = xyes; then
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
similarity index 81%
rename from meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
rename to meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
index 74489b0..6b23344 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
@@ -13,17 +13,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender"
 DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
 
-PR = "r8"
+PR = "r0"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
-	   file://acinclude.m4 \
 	   file://configure_tweak.patch \
-	   file://kernel-asm-page.patch "
+       "
 
 S = "${WORKDIR}/SDL-${PV}"
 
-SRC_URI[md5sum] = "418b42956b7cd103bfab1b9077ccc149"
-SRC_URI[sha256sum] = "6985823287b224b57390b1c1b6cbc54cc9a7d7757fbf9934ed20754b4cd23730"
+SRC_URI[md5sum] = "e52086d1b508fa0b76c52ee30b55bec4"
+SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642eed9b6"
 
 inherit autotools binconfig pkgconfig
 
@@ -31,7 +30,7 @@ EXTRA_OECONF = "--disable-static --disable-debug --disable-cdrom --enable-thread
                 --enable-file --disable-oss --disable-alsa --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
                 --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
-                --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs \
+                --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
                 --disable-video-xbios --disable-video-gem --disable-video-dummy \
                 --enable-input-events --enable-pthreads \
 		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
@@ -41,7 +40,11 @@ EXTRA_OECONF = "--disable-static --disable-debug --disable-cdrom --enable-thread
 PARALLEL_MAKE = ""
 
 do_configure_prepend() {
-	cp ${WORKDIR}/acinclude.m4 ${S}/acinclude.m4
+        # Remove old libtool macros.
+        MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
+        for i in ${MACROS}; do
+               rm -f acinclude/$i
+        done
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.5.1.300.gc565c



