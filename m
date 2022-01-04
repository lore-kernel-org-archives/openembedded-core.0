Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <13578261-bd55-c634-5b02-d912143b896d@gmail.com>
Date: Tue, 4 Jan 2022 07:54:27 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] libsdl2: Move to CMake build
References: <20220103234447.448613-1-schnitzeltony@gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
In-Reply-To: <20220103234447.448613-1-schnitzeltony@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>, openembedded-core@lists.openembedded.org

On 1/4/22 00:44, Andreas Müller wrote:
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  .../libsdl2/libsdl2_2.0.18.bb                 | 47 +++++++------------
>  1 file changed, 18 insertions(+), 29 deletions(-)
> 
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> index 5e645b443c..dbc270d858 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> @@ -24,20 +24,19 @@ S = "${WORKDIR}/SDL2-${PV}"
>  
>  SRC_URI[sha256sum] = "94d40cd73dbfa10bb6eadfbc28f355992bb2d6ef6761ad9d4074eff95ee5711c"
>  
> -inherit autotools lib_package binconfig-disabled pkgconfig
> +inherit cmake lib_package binconfig-disabled pkgconfig
>  
>  BINCONFIG = "${bindir}/sdl2-config"
>  
>  CVE_PRODUCT = "simple_directmedia_layer sdl"
>  
> -EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
> -                --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
> -                --disable-video-dummy \
> -                --disable-video-rpi \
> -                --enable-pthreads \
> -                --disable-rpath \
> -                --disable-sndio \
> -                --disable-fcitx --disable-ibus \
> +EXTRA_OECMAKE = "-DSDL_OSS==OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \

^^^
s/==/= ?

> +                 -DSDL_DISKAUDIO=OFF -DSDL_NAS=OFF -DSDL_ESD_SHARED=OFF \
> +                 -DSDL_DUMMYVIDEO=OFF \
> +                 -DSDL_RPI=OFF \
> +                 -DSDL_PTHREADS=ON \
> +                 -DSDL_RPATH=OFF \
> +                 -DSDL_SNDIO=OFF \
>                  "
>  
>  # opengl packageconfig factored out to make it easy for distros
> @@ -52,27 +51,17 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)} \
>      ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
>  "
> -PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
> -PACKAGECONFIG[arm-neon]   = "--enable-arm-neon,--disable-arm-neon"
> -PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb,directfb"
> -PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
> -PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
> -PACKAGECONFIG[kmsdrm]     = "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
> -PACKAGECONFIG[opengl]     = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
> -PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
> -PACKAGECONFIG[wayland]    = "--enable-video-wayland,--disable-video-wayland,wayland-native wayland wayland-protocols libxkbcommon"
> -PACKAGECONFIG[x11]        = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
> +PACKAGECONFIG[alsa]       = "-DSDL_ALSA=ON,-DSDL_ALSA=OFF,alsa-lib,"
> +PACKAGECONFIG[arm-neon]   = "-DSDL_ARMNEON=ON,-DSDL_ARMNEON=OFF"
> +PACKAGECONFIG[directfb]   = "-DSDL_DIRECTFB=ON,-DSDL_DIRECTFB=OFF,directfb,directfb"
> +PACKAGECONFIG[gles2]      = "-DSDL_OPENGLES=ON,-DSDL_OPENGLES=OFF,virtual/libgles2"
> +PACKAGECONFIG[jack]       = "-DSDL_JACK=ON,-DSDL_JACK=OFF,jack"
> +PACKAGECONFIG[kmsdrm]     = "-DSDL_KMSDRM=ON,-DSDL_KMSDRM=OFF,libdrm virtual/libgbm"
> +PACKAGECONFIG[opengl]     = "-DSDL_OPENGL=ON,-DSDL_OPENGL=OFF,virtual/libgl"
> +PACKAGECONFIG[pulseaudio] = "-DSDL_PULSEAUDIO=ON,-DSDL_PULSEAUDIO=OFF,pulseaudio"
> +PACKAGECONFIG[wayland]    = "-DSDL_WAYLAND=ON,-DSDL_WAYLAND=OFF,wayland-native wayland wayland-protocols libxkbcommon"
> +PACKAGECONFIG[x11]        = "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext libxrandr libxrender"
>  
> -EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
>  CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
>  
> -do_configure:prepend() {
> -        # Remove old libtool macros.
> -        MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
> -        for i in ${MACROS}; do
> -               rm -f ${S}/acinclude/$i
> -        done
> -        export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
> -}
> -
>  BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> 
> 
