X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <7a0ff4e8-554a-e6c8-f7cd-ab8d08fa5186@pr.hu>
Date: Mon, 15 Nov 2021 07:15:33 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 05/24] xserver-xorg: convert from autotools to meson
References: <20211110193937.2606747-1-alex@linutronix.de>
 <20211110193937.2606747-5-alex@linutronix.de>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <20211110193937.2606747-5-alex@linutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

2021. 11. 10. 20:39 keltezéssel, Alexander Kanavin írta:
> Not every option was carried over, drop them accordingly.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../xorg-xserver/xserver-xorg.inc             | 55 ++++++++-----------
>   1 file changed, 22 insertions(+), 33 deletions(-)
> 
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 6a5f274046..4a7048aced 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -23,7 +23,7 @@ CVE_PRODUCT = "xorg-server"
>   
>   S = "${WORKDIR}/${XORG_PN}-${PV}"
>   
> -inherit autotools pkgconfig
> +inherit meson pkgconfig
>   
>   inherit features_check
>   REQUIRED_DISTRO_FEATURES = "x11"
> @@ -105,50 +105,39 @@ FILES:${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
>   FILES:${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
>   FILES:xf86-video-modesetting = "${libdir}/xorg/modules/drivers/modesetting_drv.so"
>   
> -EXTRA_OECONF += "--with-fop=no \
> -                 --with-pic \
> -                 --disable-static \
> -                 --disable-record \
> -                 --disable-xnest \
> -                 --enable-xvfb \
> -                 --enable-composite \
> -                 --without-dtrace \
> -                 --with-int10=x86emu \
> -                 --sysconfdir=/etc/X11 \
> -                 --localstatedir=/var \
> -                 --with-xkb-output=/var/lib/xkb \
> +EXTRA_OEMESON += " \
> +                 -Dxnest=false \
> +                 -Dxvfb=true \
> +                 -Ddtrace=false \
> +                 -Dint10=x86emu \
> +                 -Dxkb_output_dir=/var/lib/xkb \
>   "
>   
> -OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
> +OPENGL_PKGCONFIGS = "dri glx glamor dri3"
>   PACKAGECONFIG ??= "dga dri2 udev ${XORG_CRYPTO} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-logind', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-logind', '', d)} \
>   "
>   
> -PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
> -PACKAGECONFIG[dga] = "--enable-dga,--disable-dga"
> -PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,virtual/mesa"
> -PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2"
> -# DRI3 requires xshmfence to also be enabled
> -PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3"
> -PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,virtual/libgl virtual/libx11"
> -PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy virtual/libgbm,libegl"
> -PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
> -PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
> -PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
> -PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
> -PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd"
> -PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama"
> +PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,udev"
> +PACKAGECONFIG[dga] = "-Ddga=true,-Ddga=false"
> +PACKAGECONFIG[dri] = "-Ddri1=true,-Ddri1=false,virtual/mesa"
> +PACKAGECONFIG[dri2] = "-Ddri2=true,-Ddri2=false"
> +PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false"
> +PACKAGECONFIG[glx] = "-Dglx=true,-Dglx=false,virtual/libgl virtual/libx11"
> +PACKAGECONFIG[glamor] = "-Dglamor=true,-Dglamor=false,libepoxy virtual/libgbm,libegl"
> +PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
> +PACKAGECONFIG[systemd-logind] = "-Dsystemd_logind=true,-Dsystemd_logind=false,dbus,"
> +PACKAGECONFIG[xinerama] = "-Dxinerama=true,-Dxinerama=false"
>   
>   # Xorg requires a SHA1 implementation, pick one
>   XORG_CRYPTO ??= "openssl"
> -PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
> -PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
> -PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
> +PACKAGECONFIG[openssl] = "-Dsha1=libcrypto,,openssl"
> +PACKAGECONFIG[nettle] = "-Dsha1=libnettle,,nettle"
> +PACKAGECONFIG[gcrypt] = "-Dsha1=libgcrypt,,libgcrypt"
>   
>   do_install:append () {
>   	# Its assumed base-files creates this for us
> -	rmdir ${D}${localstatedir}/log/

The comment is related to the presence of /var/log and
now it doesn't make sense after removing the above line.
Please remove the comment, too.

>           sed -i -e 's,${libdir}/xorg/modules,${prefix}/lib*/xorg/modules,' ${D}${mandir}/man5/xorg.conf.5
>   }
>   
> 
> 
> 
> 
> 

