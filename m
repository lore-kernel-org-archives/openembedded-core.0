Received: from host46-141-dynamic.2-87-r.retail.telecomitalia.it
	([87.2.141.46] helo=router.workgroup)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1TPcxE-0006JM-4b
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 19:35:21 +0200
Received: from gnutoo-laptop.local ([192.168.1.118] helo=localhost.localdomain)
	by router.workgroup with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.76) (envelope-from <GNUtoo@no-log.org>)
	id 1TPcjN-0004rJ-HR; Sat, 20 Oct 2012 19:21:01 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Oct 2012 19:21:54 +0200
Message-Id: <1350753714-7007-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] libsdl: fix inconditional alsa disabling.
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
X-List-Received-Date: Sat, 20 Oct 2012 17:35:21 -0000

Without that fix ALSA is inconditionally disabled,
  reguardless of the fact that alsa is in the distribution
  feature or not.

This patch has been tested on the om-gta04 target with both
  alsa distribution feature enabled(libsdl can then play sound),
  and disabled(it fails to play some sound trough alsa).

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libsdl/libsdl-1.2.15/configure_tweak.patch     |  211 ++++++++------------
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    4 +-
 2 files changed, 90 insertions(+), 125 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/configure_tweak.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/configure_tweak.patch
index 07bda6d..3f97639 100644
--- a/meta/recipes-graphics/libsdl/libsdl-1.2.15/configure_tweak.patch
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/configure_tweak.patch
@@ -1,8 +1,10 @@
 Upstream-Status: Inappropriate [configuration]
 
---- SDL-1.2.14/configure.in.orig	2011-10-18 14:51:32.044167004 +0800
-+++ SDL-1.2.14/configure.in	2011-10-18 14:51:42.374167009 +0800
-@@ -48,9 +48,9 @@
+Index: SDL-1.2.15/configure.in
+===================================================================
+--- SDL-1.2.15.orig/configure.in
++++ SDL-1.2.15/configure.in
+@@ -48,9 +48,9 @@ AC_CONFIG_AUX_DIR([build-scripts])
  dnl AC_CANONICAL_HOST
  AC_C_BIGENDIAN
  if test x$ac_cv_c_bigendian = xyes; then
@@ -14,7 +16,7 @@ Upstream-Status: Inappropriate [configuration]
  fi
  
  dnl Check for tools
-@@ -139,7 +139,7 @@
+@@ -134,7 +134,7 @@ AC_ARG_ENABLE(libc,
  AC_HELP_STRING([--enable-libc], [Use the system C library [[default=yes]]]),
                , enable_libc=yes)
  if test x$enable_libc = xyes; then
@@ -23,7 +25,7 @@ Upstream-Status: Inappropriate [configuration]
  
      dnl Check for C library headers
      AC_HEADER_STDC
-@@ -150,7 +150,7 @@
+@@ -145,7 +145,7 @@ if test x$enable_libc = xyes; then
      if test x$ac_cv_header_inttypes_h = xyes -o x$ac_cv_header_stdint_h = xyes; then
          AC_CHECK_TYPE(int64_t)
          if test x$ac_cv_type_int64_t = xyes; then
@@ -32,7 +34,7 @@ Upstream-Status: Inappropriate [configuration]
          fi
          have_inttypes=yes
      fi
-@@ -166,11 +166,11 @@
+@@ -161,11 +161,11 @@ if test x$enable_libc = xyes; then
  
      AC_FUNC_MEMCMP
      if test x$ac_cv_func_memcmp_working = xyes; then
@@ -46,7 +48,7 @@ Upstream-Status: Inappropriate [configuration]
      fi
      AC_CHECK_FUNC(mprotect,
          AC_TRY_COMPILE([
-@@ -194,40 +194,40 @@
+@@ -191,40 +191,40 @@ if test x$have_inttypes != xyes; then
      AC_CHECK_SIZEOF(long, 4)
      AC_CHECK_SIZEOF(long long, 8)
      if test x$ac_cv_sizeof_char = x1; then
@@ -105,7 +107,7 @@ Upstream-Status: Inappropriate [configuration]
  fi
  
  # Standard C sources
-@@ -248,25 +248,25 @@
+@@ -245,25 +245,25 @@ AC_ARG_ENABLE(audio,
  AC_HELP_STRING([--enable-audio], [Enable the audio subsystem [[default=yes]]]),
                , enable_audio=yes)
  if test x$enable_audio != xyes; then
@@ -135,7 +137,7 @@ Upstream-Status: Inappropriate [configuration]
  else
      SOURCES="$SOURCES $srcdir/src/joystick/*.c"
  fi
-@@ -274,43 +274,43 @@
+@@ -271,43 +271,43 @@ AC_ARG_ENABLE(cdrom,
  AC_HELP_STRING([--enable-cdrom], [Enable the cdrom subsystem [[default=yes]]]),
                , enable_cdrom=yes)
  if test x$enable_cdrom != xyes; then
@@ -186,7 +188,7 @@ Upstream-Status: Inappropriate [configuration]
  fi
  
  dnl See if the OSS audio interface is supported
-@@ -338,12 +338,12 @@
+@@ -335,12 +335,12 @@ AC_HELP_STRING([--enable-oss], [support
                int arg = SNDCTL_DSP_SETFRAGMENT;
              ],[
              have_oss=yes
@@ -201,44 +203,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/audio/dsp/*.c"
              SOURCES="$SOURCES $srcdir/src/audio/dma/*.c"
              have_audio=yes
-@@ -363,35 +363,7 @@
-     AC_ARG_ENABLE(alsa,
- AC_HELP_STRING([--enable-alsa], [support the ALSA audio API [[default=yes]]]),
-                   , enable_alsa=yes)
--    if test x$enable_audio = xyes -a x$enable_alsa = xyes; then
--        AM_PATH_ALSA(0.9.0, have_alsa=yes, have_alsa=no)
--        # Restore all flags from before the ALSA detection runs
--        CFLAGS="$alsa_save_CFLAGS"
--        LDFLAGS="$alsa_save_LDFLAGS"
--        LIBS="$alsa_save_LIBS"
--        if test x$have_alsa = xyes; then
--            AC_ARG_ENABLE(alsa-shared,
--AC_HELP_STRING([--enable-alsa-shared], [dynamically load ALSA audio support [[default=yes]]]),
--                          , enable_alsa_shared=yes)
--            alsa_lib=[`find_lib "libasound.so.*" "$ALSA_LIBS" | sed 's/.*\/\(.*\)/\1/; q'`]
--
--            AC_DEFINE(SDL_AUDIO_DRIVER_ALSA)
--            SOURCES="$SOURCES $srcdir/src/audio/alsa/*.c"
--            EXTRA_CFLAGS="$EXTRA_CFLAGS $ALSA_CFLAGS"
--            if test x$have_loadso != xyes && \
--               test x$enable_alsa_shared = xyes; then
--                AC_MSG_WARN([You must have SDL_LoadObject() support for dynamic ALSA loading])
--            fi
--            if test x$have_loadso = xyes && \
--               test x$enable_alsa_shared = xyes && test x$alsa_lib != x; then
--                echo "-- dynamic libasound -> $alsa_lib"
--                AC_DEFINE_UNQUOTED(SDL_AUDIO_DRIVER_ALSA_DYNAMIC, "$alsa_lib")
--            else
--                EXTRA_LDFLAGS="$EXTRA_LDFLAGS $ALSA_LIBS"
--            fi
--            have_audio=yes
--        fi
--    fi
-+    enable_alsa=no
- }
- 
- dnl Check whether we want to use IRIX 6.5+ native audio or not
-@@ -410,7 +382,7 @@
+@@ -407,7 +407,7 @@ CheckDMEDIA()
          AC_MSG_RESULT($have_dmedia)
          # Set up files for the audio library
          if test x$have_dmedia = xyes; then
@@ -247,7 +212,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/audio/dmedia/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -laudio"
              have_audio=yes
-@@ -447,7 +419,7 @@
+@@ -444,7 +444,7 @@ CheckMME()
          AC_MSG_RESULT($have_mme)
          # Set up files for the audio library
          if test x$have_mme = xyes; then
@@ -256,7 +221,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/audio/mme/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $MME_CFLAGS"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS $MME_LIBS"
-@@ -470,7 +442,7 @@
+@@ -467,7 +467,7 @@ AC_HELP_STRING([--enable-esd-shared], [d
                            , enable_esd_shared=yes)
              esd_lib=[`find_lib "libesd.so.*" "$ESD_LIBS" | sed 's/.*\/\(.*\)/\1/; q'`]
  
@@ -265,7 +230,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/audio/esd/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $ESD_CFLAGS"
              if test x$have_loadso != xyes && \
-@@ -480,7 +452,7 @@
+@@ -477,7 +477,7 @@ AC_HELP_STRING([--enable-esd-shared], [d
              if test x$have_loadso = xyes && \
                 test x$enable_esd_shared = xyes && test x$esd_lib != x; then
                  echo "-- dynamic libesd -> $esd_lib"
@@ -274,7 +239,7 @@ Upstream-Status: Inappropriate [configuration]
              else
                  EXTRA_LDFLAGS="$EXTRA_LDFLAGS $ESD_LIBS"
              fi
-@@ -567,7 +539,7 @@
+@@ -564,7 +564,7 @@ AC_HELP_STRING([--enable-arts-shared], [
                                , enable_arts_shared=yes)
                  arts_lib=[`find_lib "libartsc.so.*" "$ARTS_LIBS" | sed 's/.*\/\(.*\)/\1/; q'`]
  
@@ -283,7 +248,7 @@ Upstream-Status: Inappropriate [configuration]
                  SOURCES="$SOURCES $srcdir/src/audio/arts/*.c"
                  EXTRA_CFLAGS="$EXTRA_CFLAGS $ARTS_CFLAGS"
                  if test x$have_loadso != xyes && \
-@@ -577,7 +549,7 @@
+@@ -574,7 +574,7 @@ AC_HELP_STRING([--enable-arts-shared], [
                  if test x$have_loadso = xyes && \
                     test x$enable_arts_shared = xyes && test x$arts_lib != x; then
                      echo "-- dynamic libartsc -> $arts_lib"
@@ -292,7 +257,7 @@ Upstream-Status: Inappropriate [configuration]
                  else
                      EXTRA_LDFLAGS="$EXTRA_LDFLAGS $ARTS_LIBS"
                  fi
-@@ -637,7 +609,7 @@
+@@ -634,7 +634,7 @@ AC_HELP_STRING([--enable-nas-shared], [d
                  EXTRA_LDFLAGS="$EXTRA_LDFLAGS $NAS_LIBS"
              fi
  
@@ -301,7 +266,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/audio/nas/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $NAS_CFLAGS"
              have_audio=yes
-@@ -652,7 +624,7 @@
+@@ -649,7 +649,7 @@ CheckDiskAudio()
  AC_HELP_STRING([--enable-diskaudio], [support the disk writer audio driver [[default=yes]]]),
                    , enable_diskaudio=yes)
      if test x$enable_audio = xyes -a x$enable_diskaudio = xyes; then
@@ -310,7 +275,7 @@ Upstream-Status: Inappropriate [configuration]
          SOURCES="$SOURCES $srcdir/src/audio/disk/*.c"
      fi
  }
-@@ -664,7 +636,7 @@
+@@ -661,7 +661,7 @@ CheckDummyAudio()
  AC_HELP_STRING([--enable-dummyaudio], [support the dummy audio driver [[default=yes]]]),
                    , enable_dummyaudio=yes)
      if test x$enable_audio = xyes -a x$enable_dummyaudio = xyes; then
@@ -319,7 +284,7 @@ Upstream-Status: Inappropriate [configuration]
          SOURCES="$SOURCES $srcdir/src/audio/dummy/*.c"
      fi
  }
-@@ -680,7 +652,7 @@
+@@ -677,7 +677,7 @@ AC_HELP_STRING([--enable-mintaudio], [su
          AC_CHECK_HEADER(mint/falcon.h, have_mint_falcon_hdr=yes)
          if test x$have_mint_falcon_hdr = xyes; then
              mintaudio=yes
@@ -328,16 +293,16 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/audio/mint/*.c"
              SOURCES="$SOURCES $srcdir/src/audio/mint/*.S"
              have_audio=yes
-@@ -756,7 +728,7 @@
-             AC_PATH_PROG(NASM, nasm)
-         fi
+@@ -746,7 +746,7 @@ AC_HELP_STRING([--enable-nasm], [use nas
+         CompileNASM unquoted-sections || NASM=""
+ 
          if test "x$NASM" != x -a "x$NASM" != x'"$NASM"'; then
 -            AC_DEFINE(SDL_HERMES_BLITTERS)
 +            AC_DEFINE(SDL_HERMES_BLITTERS,1,"")
              SOURCES="$SOURCES $srcdir/src/hermes/*.asm"
              NASMFLAGS="$NASMFLAGS -I $srcdir/src/hermes/"
  
-@@ -850,9 +822,9 @@
+@@ -840,9 +840,9 @@ AC_HELP_STRING([--enable-altivec], [use
          CFLAGS="$save_CFLAGS"
  
          if test x$have_gcc_altivec = xyes; then
@@ -349,7 +314,7 @@ Upstream-Status: Inappropriate [configuration]
              fi
              EXTRA_CFLAGS="$EXTRA_CFLAGS $altivec_CFLAGS"
          fi
-@@ -895,7 +867,7 @@
+@@ -920,7 +920,7 @@ AC_HELP_STRING([--enable-ipod], [configu
  
      if test x$enable_ipod = xyes; then
          EXTRA_CFLAGS="$EXTRA_CFLAGS -DIPOD"
@@ -358,7 +323,7 @@ Upstream-Status: Inappropriate [configuration]
          SOURCES="$SOURCES $srcdir/src/video/ipod/*.c"
      fi
  }
-@@ -929,7 +901,7 @@
+@@ -954,7 +954,7 @@ CheckNANOX()
              EXTRA_CFLAGS="$EXTRA_CFLAGS -DENABLE_NANOX_DIRECT_FB"
          fi
  
@@ -367,7 +332,7 @@ Upstream-Status: Inappropriate [configuration]
          SOURCES="$SOURCES $srcdir/src/video/nanox/*.c"
          EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lnano-X"
          have_video=yes
-@@ -995,7 +967,7 @@
+@@ -1020,7 +1020,7 @@ AC_HELP_STRING([--enable-x11-shared], [d
              CFLAGS="$CFLAGS $X_CFLAGS"
              LDFLAGS="$LDFLAGS $X_LIBS"
  
@@ -376,7 +341,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/x11/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $X_CFLAGS"
  
-@@ -1017,8 +989,8 @@
+@@ -1042,8 +1042,8 @@ AC_HELP_STRING([--enable-x11-shared], [d
                 test x$enable_x11_shared = xyes && test x$x11_lib != x && test x$x11ext_lib != x; then
                  echo "-- dynamic libX11 -> $x11_lib"
                  echo "-- dynamic libX11ext -> $x11ext_lib"
@@ -387,7 +352,7 @@ Upstream-Status: Inappropriate [configuration]
              else
                  enable_x11_shared=no
                  EXTRA_LDFLAGS="$EXTRA_LDFLAGS $X_LIBS -lX11 -lXext"
-@@ -1035,20 +1007,20 @@
+@@ -1060,20 +1060,20 @@ AC_HELP_STRING([--enable-dga], [allow us
  AC_HELP_STRING([--enable-video-dga], [use DGA 2.0 video driver [[default=yes]]]),
                    , enable_video_dga=yes)
              if test x$enable_dga = xyes -a x$enable_video_dga = xyes; then
@@ -411,7 +376,7 @@ Upstream-Status: Inappropriate [configuration]
                  SOURCES="$SOURCES $srcdir/src/video/Xext/Xxf86vm/*.c"
              fi
              AC_ARG_ENABLE(video-x11-xv,
-@@ -1062,14 +1034,14 @@
+@@ -1087,14 +1087,14 @@ AC_HELP_STRING([--enable-video-x11-xv],
  AC_HELP_STRING([--enable-video-x11-xinerama], [enable X11 Xinerama support [[default=yes]]]),
                              , enable_video_x11_xinerama=yes)
              if test x$enable_video_x11_xinerama = xyes; then
@@ -428,7 +393,7 @@ Upstream-Status: Inappropriate [configuration]
                  SOURCES="$SOURCES $srcdir/src/video/Xext/XME/*.c"
              fi
              AC_ARG_ENABLE(video-x11-xrandr,
-@@ -1086,8 +1058,8 @@
+@@ -1111,8 +1111,8 @@ AC_HELP_STRING([--enable-video-x11-xrand
                      if test x$enable_x11_shared = xyes && test x$xrandr_lib != x ; then
                          echo "-- dynamic libXrender -> $xrender_lib"
                          echo "-- dynamic libXrandr -> $xrandr_lib"
@@ -439,7 +404,7 @@ Upstream-Status: Inappropriate [configuration]
                          definitely_enable_video_x11_xrandr=yes
                      else
                          AC_CHECK_LIB(Xrender, XRenderQueryExtension, have_xrender_lib=yes)
-@@ -1100,7 +1072,7 @@
+@@ -1125,7 +1125,7 @@ AC_HELP_STRING([--enable-video-x11-xrand
                  fi
              fi
              if test x$definitely_enable_video_x11_xrandr = xyes; then
@@ -448,7 +413,7 @@ Upstream-Status: Inappropriate [configuration]
              fi
          fi
      fi
-@@ -1127,7 +1099,7 @@
+@@ -1152,7 +1152,7 @@ AC_HELP_STRING([--enable-video-photon],
          ])
          AC_MSG_RESULT($video_photon)
          if test x$video_photon = xyes; then
@@ -457,7 +422,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/photon/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lph"
              have_video=yes
-@@ -1141,7 +1113,7 @@
+@@ -1166,7 +1166,7 @@ dnl Set up the BWindow video driver if e
  CheckBWINDOW()
  {
      if test x$enable_video = xyes; then
@@ -466,7 +431,7 @@ Upstream-Status: Inappropriate [configuration]
          SOURCES="$SOURCES $srcdir/src/video/bwindow/*.cc"
          have_video=yes
      fi
-@@ -1164,7 +1136,7 @@
+@@ -1189,7 +1189,7 @@ AC_HELP_STRING([--enable-video-carbon],
          ])
          AC_MSG_RESULT($have_carbon)
          if test x$have_carbon = xyes; then
@@ -475,7 +440,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/maccommon/*.c"
              SOURCES="$SOURCES $srcdir/src/video/macrom/*.c"
              have_video=yes
-@@ -1193,7 +1165,7 @@
+@@ -1218,7 +1218,7 @@ AC_HELP_STRING([--enable-video-cocoa], [
          AC_MSG_RESULT($have_cocoa)
          CFLAGS="$save_CFLAGS"
          if test x$have_cocoa = xyes; then
@@ -484,7 +449,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/quartz/*.m"
              have_video=yes
          fi
-@@ -1220,7 +1192,7 @@
+@@ -1245,7 +1245,7 @@ AC_HELP_STRING([--enable-video-fbcon], [
          AC_MSG_RESULT($video_fbcon)
          if test x$video_fbcon = xyes; then
              AC_CHECK_FUNCS(getpagesize)
@@ -493,7 +458,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/fbcon/*.c"
              have_video=yes
          fi
-@@ -1271,7 +1243,7 @@
+@@ -1296,7 +1296,7 @@ AC_HELP_STRING([--enable-video-directfb]
          AC_MSG_RESULT($video_directfb)
  
          if test x$video_directfb = xyes; then
@@ -502,7 +467,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/directfb/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $DIRECTFB_CFLAGS"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS $DIRECTFB_LIBS"
-@@ -1298,7 +1270,7 @@
+@@ -1323,7 +1323,7 @@ AC_HELP_STRING([--enable-video-ps2gs], [
          ])
          AC_MSG_RESULT($video_ps2gs)
          if test x$video_ps2gs = xyes; then
@@ -511,7 +476,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/ps2gs/*.c"
              have_video=yes
          fi
-@@ -1350,7 +1322,7 @@
+@@ -1376,7 +1376,7 @@ AC_HELP_STRING([--enable-video-ggi], [us
          ])
          AC_MSG_RESULT($video_ggi)
          if test x$video_ggi = xyes; then
@@ -520,7 +485,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/ggi/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lggi -lgii -lgg"
              have_video=yes
-@@ -1380,7 +1352,7 @@
+@@ -1406,7 +1406,7 @@ AC_HELP_STRING([--enable-video-svga], [u
          ])
          AC_MSG_RESULT($video_svga)
          if test x$video_svga = xyes; then
@@ -529,7 +494,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/svga/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lvga"
              have_video=yes
-@@ -1412,7 +1384,7 @@
+@@ -1438,7 +1438,7 @@ AC_HELP_STRING([--enable-video-vgl], [us
          ])
          AC_MSG_RESULT($video_vgl)
          if test x$video_vgl = xyes; then
@@ -538,7 +503,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/vgl/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lvgl"
              have_video=yes
-@@ -1440,7 +1412,7 @@
+@@ -1466,7 +1466,7 @@ AC_HELP_STRING([--enable-video-wscons],
          ])
          AC_MSG_RESULT($video_wscons)
          if test x$video_wscons = xyes; then
@@ -547,7 +512,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/wscons/*.c"
              have_video=yes
          fi
-@@ -1465,7 +1437,7 @@
+@@ -1491,7 +1491,7 @@ AC_HELP_STRING([--enable-video-aalib], [
          ])
          AC_MSG_RESULT($video_aalib)
          if test x$video_aalib = xyes; then
@@ -556,7 +521,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/aalib/*.c"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -laa"
              have_video=yes
-@@ -1527,7 +1499,7 @@
+@@ -1553,7 +1553,7 @@ AC_HELP_STRING([--enable-video-qtopia],
          CXXFLAGS="$OLD_CXX"
          AC_MSG_RESULT($video_qtopia)
          if test x$video_qtopia = xyes; then
@@ -564,8 +529,8 @@ Upstream-Status: Inappropriate [configuration]
 +            AC_DEFINE(SDL_VIDEO_DRIVER_QTOPIA,1,"")
              SOURCES="$SOURCES $srcdir/src/video/qtopia/*.cc"
              SDLMAIN_SOURCES="$srcdir/src/main/qtopia/*.cc"
-             EXTRA_CFLAGS="$EXTRA_CFLAGS $QTOPIA_FLAGS"
-@@ -1556,7 +1528,7 @@
+             SDLMAIN_LDFLAGS="-static"
+@@ -1583,7 +1583,7 @@ AC_HELP_STRING([--enable-video-picogui],
          ])
          AC_MSG_RESULT($video_picogui)
          if test x$video_picogui = xyes; then
@@ -574,7 +539,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/picogui/*.c"
              SDL_LIBS="$SDL_LIBS -lpgui"
              have_video=yes
-@@ -1580,7 +1552,7 @@
+@@ -1607,7 +1607,7 @@ AC_HELP_STRING([--enable-video-xbios], [
      video_xbios=no
      if test x$enable_video = xyes -a x$enable_video_xbios = xyes; then
          video_xbios=yes
@@ -583,7 +548,7 @@ Upstream-Status: Inappropriate [configuration]
          SOURCES="$SOURCES $srcdir/src/video/xbios/*.c"
          have_video=yes
      fi
-@@ -1598,7 +1570,7 @@
+@@ -1625,7 +1625,7 @@ AC_HELP_STRING([--enable-video-gem], [us
          AC_CHECK_LIB(gem, appl_init, have_gem_lib=yes)
          if test x$have_gem_hdr = xyes -a x$have_gem_lib = xyes; then
              video_gem=yes
@@ -592,7 +557,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/gem/*.c"
              SDL_LIBS="$SDL_LIBS -lgem"
              have_video=yes
-@@ -1613,7 +1585,7 @@
+@@ -1640,7 +1640,7 @@ CheckDummyVideo()
  AC_HELP_STRING([--enable-video-dummy], [use dummy video driver [[default=yes]]]),
                    , enable_video_dummy=yes)
      if test x$enable_video_dummy = xyes; then
@@ -601,7 +566,7 @@ Upstream-Status: Inappropriate [configuration]
          SOURCES="$SOURCES $srcdir/src/video/dummy/*.c"
          have_video=yes
      fi
-@@ -1640,8 +1612,8 @@
+@@ -1667,8 +1667,8 @@ CheckOpenGLX11()
          ])
          AC_MSG_RESULT($video_opengl)
          if test x$video_opengl = xyes; then
@@ -612,7 +577,7 @@ Upstream-Status: Inappropriate [configuration]
          fi
      fi
  }
-@@ -1660,7 +1632,7 @@
+@@ -1687,7 +1687,7 @@ CheckOpenGLQNX()
          ])
          AC_MSG_RESULT($video_opengl)
          if test x$video_opengl = xyes; then
@@ -621,7 +586,7 @@ Upstream-Status: Inappropriate [configuration]
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lGL"
          fi
      fi
-@@ -1670,8 +1642,8 @@
+@@ -1697,8 +1697,8 @@ dnl Check for Win32 OpenGL
  CheckWIN32GL()
  {
      if test x$enable_video = xyes -a x$enable_video_opengl = xyes; then
@@ -632,7 +597,7 @@ Upstream-Status: Inappropriate [configuration]
      fi
  }
  
-@@ -1679,7 +1651,7 @@
+@@ -1706,7 +1706,7 @@ dnl Check for BeOS OpenGL
  CheckBeGL()
  {
      if test x$enable_video = xyes -a x$enable_video_opengl = xyes; then
@@ -641,7 +606,7 @@ Upstream-Status: Inappropriate [configuration]
          EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lGL"
      fi
  }
-@@ -1688,7 +1660,7 @@
+@@ -1715,7 +1715,7 @@ dnl Check for MacOS OpenGL
  CheckMacGL()
  {
      if test x$enable_video = xyes -a x$enable_video_opengl = xyes; then
@@ -650,7 +615,7 @@ Upstream-Status: Inappropriate [configuration]
          case "$host" in
              *-*-darwin*)
                  if test x$enable_video_cocoa = xyes; then
-@@ -1720,8 +1692,8 @@
+@@ -1747,8 +1747,8 @@ CheckAtariOSMesa()
              OSMESA_CFLAGS=`$OSMESA_CONFIG --cflags`
              OSMESA_LIBS=`$OSMESA_CONFIG --libs`
          fi
@@ -661,7 +626,7 @@ Upstream-Status: Inappropriate [configuration]
          SDL_CFLAGS="$SDL_CFLAGS $OSMESA_CFLAGS"
          SDL_LIBS="$SDL_LIBS $OSMESA_LIBS"
  
-@@ -1731,7 +1703,7 @@
+@@ -1758,7 +1758,7 @@ AC_HELP_STRING([--enable-osmesa-shared],
          if test "x$enable_osmesa_shared" = "xyes" -a "x$enable_atari_ldg" = "xyes"; then
              # Dynamic linking
              if test "x$have_osmesa_hdr" = "xyes"; then
@@ -670,7 +635,7 @@ Upstream-Status: Inappropriate [configuration]
              fi
          fi
      fi
-@@ -1765,7 +1737,7 @@
+@@ -1792,7 +1792,7 @@ AC_HELP_STRING([--enable-input-events],
          ])
          AC_MSG_RESULT($use_input_events)
          if test x$use_input_events = xyes; then
@@ -679,7 +644,7 @@ Upstream-Status: Inappropriate [configuration]
          fi
      fi
  }
-@@ -1787,7 +1759,7 @@
+@@ -1814,7 +1814,7 @@ AC_HELP_STRING([--enable-input-tslib], [
          ])
          AC_MSG_RESULT($enable_input_tslib)
          if test x$enable_input_tslib = xyes; then
@@ -688,7 +653,7 @@ Upstream-Status: Inappropriate [configuration]
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lts"
          fi
      fi
-@@ -1810,7 +1782,7 @@
+@@ -1837,7 +1837,7 @@ AC_HELP_STRING([--enable-pth], [use GNU
          AC_MSG_CHECKING(pth)
          AC_MSG_RESULT($use_pth)
          if test "x$use_pth" = xyes; then
@@ -697,7 +662,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/thread/pth/*.c"
              SOURCES="$SOURCES $srcdir/src/thread/generic/SDL_syssem.c"
              SDL_CFLAGS="$SDL_CFLAGS `$PTH_CONFIG --cflags`"
-@@ -1916,7 +1888,7 @@
+@@ -1943,7 +1943,7 @@ AC_HELP_STRING([--enable-pthread-sem], [
  
          # Do futher testing if we have pthread support...
          if test x$use_pthreads = xyes; then
@@ -706,7 +671,7 @@ Upstream-Status: Inappropriate [configuration]
              EXTRA_CFLAGS="$EXTRA_CFLAGS $pthread_cflags"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS $pthread_lib"
              SDL_CFLAGS="$SDL_CFLAGS $pthread_cflags"
-@@ -1938,7 +1910,7 @@
+@@ -1965,7 +1965,7 @@ AC_HELP_STRING([--enable-pthread-sem], [
                    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
                  ],[
                  has_recursive_mutexes=yes
@@ -715,7 +680,7 @@ Upstream-Status: Inappropriate [configuration]
                  ])
              fi
              if test x$has_recursive_mutexes = xno; then
-@@ -1949,7 +1921,7 @@
+@@ -1976,7 +1976,7 @@ AC_HELP_STRING([--enable-pthread-sem], [
                    pthread_mutexattr_setkind_np(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
                  ],[
                  has_recursive_mutexes=yes
@@ -724,7 +689,7 @@ Upstream-Status: Inappropriate [configuration]
                  ])
              fi
              AC_MSG_RESULT($has_recursive_mutexes)
-@@ -2024,7 +1996,7 @@
+@@ -2065,7 +2065,7 @@ AC_HELP_STRING([--enable-stdio-redirect]
      fi
  
      if test x$enable_video = xyes; then
@@ -733,7 +698,7 @@ Upstream-Status: Inappropriate [configuration]
          SOURCES="$SOURCES $srcdir/src/video/wincommon/*.c"
          SOURCES="$SOURCES $srcdir/src/video/windib/*.c"
          have_video=yes
-@@ -2046,7 +2018,7 @@
+@@ -2087,7 +2087,7 @@ AC_HELP_STRING([--enable-directx], [use
              have_directx=yes
          fi
          if test x$enable_video = xyes -a x$have_directx = xyes; then
@@ -742,7 +707,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/video/windx5/*.c"
              have_video=yes
          fi
-@@ -2077,7 +2049,7 @@
+@@ -2118,7 +2118,7 @@ AC_HELP_STRING([--enable-sdl-dlopen], [u
              AC_CHECK_LIB(c, dlopen, EXTRA_LDFLAGS="$EXTRA_LDFLAGS",
                 AC_CHECK_LIB(dl, dlopen, EXTRA_LDFLAGS="$EXTRA_LDFLAGS -ldl",
                    AC_CHECK_LIB(ltdl, dlopen, EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lltdl")))
@@ -751,7 +716,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/loadso/dlopen/*.c"
              have_loadso=yes
          fi
-@@ -2094,7 +2066,7 @@
+@@ -2135,7 +2135,7 @@ AC_HELP_STRING([--enable-atari-ldg], [us
          AC_CHECK_HEADER(ldg.h, have_ldg_hdr=yes)
          AC_CHECK_LIB(ldg, ldg_open, have_ldg_lib=yes, have_ldg_lib=no, -lgem)
          if test x$have_ldg_hdr = xyes -a x$have_ldg_lib = xyes; then
@@ -760,7 +725,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/loadso/mint/*.c"
              SDL_LIBS="$SDL_LIBS -lldg -lgem"
              have_loadso=yes
-@@ -2225,11 +2197,11 @@
+@@ -2266,11 +2266,11 @@ CheckUSBHID()
              have_machine_joystick=yes
              ])
              if test x$have_machine_joystick = xyes; then
@@ -774,7 +739,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/joystick/bsd/*.c"
              EXTRA_CFLAGS="$EXTRA_CFLAGS $USB_CFLAGS"
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS $USB_LIBS"
-@@ -2248,7 +2220,7 @@
+@@ -2289,7 +2289,7 @@ AC_HELP_STRING([--enable-clock_gettime],
      if test x$enable_clock_gettime = xyes; then
          AC_CHECK_LIB(rt, clock_gettime, have_clock_gettime=yes)
          if test x$have_clock_gettime = xyes; then
@@ -783,7 +748,7 @@ Upstream-Status: Inappropriate [configuration]
              EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lrt"
          fi
      fi
-@@ -2279,7 +2251,7 @@
+@@ -2320,7 +2320,7 @@ case "$host" in
          CheckIPod
          # Set up files for the timer library
          if test x$enable_timers = xyes; then
@@ -792,7 +757,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/timer/unix/*.c"
              have_timers=yes
          fi
-@@ -2345,17 +2317,17 @@
+@@ -2386,17 +2386,17 @@ case "$host" in
          if test x$enable_audio = xyes; then
            case $ARCH in
              sysv5|solaris|hpux)
@@ -813,7 +778,7 @@ Upstream-Status: Inappropriate [configuration]
                  SOURCES="$SOURCES $srcdir/src/audio/paudio/*.c"
                  have_audio=yes
              ;;
-@@ -2365,7 +2337,7 @@
+@@ -2406,7 +2406,7 @@ case "$host" in
          if test x$enable_joystick = xyes; then
            case $ARCH in
              linux)
@@ -822,7 +787,7 @@ Upstream-Status: Inappropriate [configuration]
                  SOURCES="$SOURCES $srcdir/src/joystick/linux/*.c"
                  have_joystick=yes
              ;;
-@@ -2375,32 +2347,32 @@
+@@ -2416,32 +2416,32 @@ case "$host" in
          if test x$enable_cdrom = xyes; then
            case $ARCH in
              linux|solaris)
@@ -861,7 +826,7 @@ Upstream-Status: Inappropriate [configuration]
                  SOURCES="$SOURCES $srcdir/src/cdrom/osf/*.c"
                  have_cdrom=yes
              ;;
-@@ -2408,7 +2380,7 @@
+@@ -2449,7 +2449,7 @@ case "$host" in
          fi
          # Set up files for the thread library
          if test x$enable_threads = xyes -a x$use_pthreads != xyes -a x$use_pth != xyes -a x$ARCH = xirix; then
@@ -870,7 +835,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/thread/irix/*.c"
              SOURCES="$SOURCES $srcdir/src/thread/generic/SDL_sysmutex.c"
              SOURCES="$SOURCES $srcdir/src/thread/generic/SDL_syscond.c"
-@@ -2416,7 +2388,7 @@
+@@ -2457,7 +2457,7 @@ case "$host" in
          fi
          # Set up files for the timer library
          if test x$enable_timers = xyes; then
@@ -879,7 +844,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/timer/unix/*.c"
              have_timers=yes
          fi
-@@ -2435,20 +2407,20 @@
+@@ -2476,20 +2476,20 @@ case "$host" in
          CheckPTHREAD
          # Set up files for the audio library
          if test x$enable_audio = xyes; then
@@ -903,7 +868,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/timer/unix/*.c"
              have_timers=yes
          fi
-@@ -2473,29 +2445,29 @@
+@@ -2514,29 +2514,29 @@ case "$host" in
          CheckNASM
          # Set up files for the audio library
          if test x$enable_audio = xyes; then
@@ -938,7 +903,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/thread/win32/SDL_sysmutex.c"
              SOURCES="$SOURCES $srcdir/src/thread/win32/SDL_syssem.c"
              SOURCES="$SOURCES $srcdir/src/thread/win32/SDL_systhread.c"
-@@ -2504,13 +2476,13 @@
+@@ -2545,13 +2545,13 @@ case "$host" in
          fi
          # Set up files for the timer library
          if test x$enable_timers = xyes; then
@@ -954,7 +919,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/loadso/win32/*.c"
              have_loadso=yes
          fi
-@@ -2579,25 +2551,25 @@
+@@ -2622,25 +2622,25 @@ case "$host" in
          CheckBeGL
          # Set up files for the audio library
          if test x$enable_audio = xyes; then
@@ -984,7 +949,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/thread/beos/*.c"
              SOURCES="$SOURCES $srcdir/src/thread/generic/SDL_sysmutex.c"
              SOURCES="$SOURCES $srcdir/src/thread/generic/SDL_syscond.c"
-@@ -2605,7 +2577,7 @@
+@@ -2648,7 +2648,7 @@ case "$host" in
          fi
          # Set up files for the timer library
          if test x$enable_timers = xyes; then
@@ -993,7 +958,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/timer/beos/*.c"
              have_timers=yes
          fi
-@@ -2613,11 +2585,11 @@
+@@ -2656,11 +2656,11 @@ case "$host" in
          if test x$enable_loadso = xyes; then
              case "$host" in
                  *-*-beos*)
@@ -1007,7 +972,7 @@ Upstream-Status: Inappropriate [configuration]
                      SOURCES="$SOURCES $srcdir/src/loadso/dlopen/*.c"
                  ;;
              esac    
-@@ -2653,7 +2625,7 @@
+@@ -2696,7 +2696,7 @@ case "$host" in
          # Set up files for the shared object loading library
          # (this needs to be done before the dynamic X11 check)
          if test x$enable_loadso = xyes -a x$have_dlopen != xyes; then
@@ -1016,7 +981,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/loadso/macosx/*.c"
              have_loadso=yes
          fi
-@@ -2671,26 +2643,26 @@
+@@ -2714,26 +2714,26 @@ case "$host" in
  
          # Set up files for the audio library
          if test x$enable_audio = xyes; then
@@ -1047,7 +1012,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/timer/unix/*.c"
              have_timers=yes
          fi
-@@ -2731,30 +2703,30 @@
+@@ -2775,30 +2775,30 @@ case "$host" in
          # Set up files for the audio library
          if test x$enable_threads = xyes -a x$enable_pth = xyes; then
              if test x$enable_audio = xyes; then
@@ -1083,7 +1048,7 @@ Upstream-Status: Inappropriate [configuration]
                  SOURCES="$SOURCES $srcdir/src/timer/mint/*.c"
                  SOURCES="$SOURCES $srcdir/src/timer/mint/*.S"
              fi
-@@ -2767,20 +2739,20 @@
+@@ -2811,20 +2811,20 @@ case "$host" in
          CheckPTHREAD
          # Set up files for the video library
          if test x$enable_video = xyes; then
@@ -1107,7 +1072,7 @@ Upstream-Status: Inappropriate [configuration]
              SOURCES="$SOURCES $srcdir/src/timer/riscos/*.c"
              have_timers=yes
          fi
-@@ -2799,31 +2771,31 @@
+@@ -2846,31 +2846,31 @@ CheckWarnAll
  if test x$enable_joystick = xyes; then
    if test x$have_joystick != xyes; then
      # Wants joystick subsystem, but doesn't have a platform-specific backend...
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index b05840a..d5c127d 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -18,7 +18,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
            tslib"
 DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
@@ -47,7 +47,7 @@ EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads
                 --disable-pulseaudio"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
-PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib,"
+PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.5.4



