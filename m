Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6b6-00047V-G4
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:12:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Sep 2012 08:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="220120805"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2012 08:59:57 -0700
Message-ID: <504E0E7D.3090500@linux.intel.com>
Date: Mon, 10 Sep 2012 08:59:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1347014897-24227-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1347014897-24227-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] xserver-xorg-lite: remove
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
X-List-Received-Date: Mon, 10 Sep 2012 16:12:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2012 03:48 AM, Ross Burton wrote:
> Building xserver-xorg and not installing the DRI and GLX modules (and so not
> Mesa) results in an increase of 16kb compared to this package.
>
> This isn't worth the effort of maintaining two packages.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../xorg-xserver/xserver-xorg-common.inc           |  129 ------------------
>   .../xorg-xserver/xserver-xorg-lite.inc             |    8 --
>   .../xorg-xserver/xserver-xorg-lite_1.11.2.bb       |    4 -
>   .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  138 +++++++++++++++++++-
>   4 files changed, 134 insertions(+), 145 deletions(-)
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb
>

Merged into OE-core

Thanks
	Sau!

> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> deleted file mode 100644
> index 6133344..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> +++ /dev/null
> @@ -1,129 +0,0 @@
> -DESCRIPTION = "The X.Org X server"
> -HOMEPAGE = "http://www.x.org"
> -SECTION = "x11/base"
> -LICENSE = "MIT-X"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
> -
> -# xf86-*-* packages depend on an X server built with the xfree86 DDX
> -# so we have a virtual to represent that:
> -# deprecated, we should use virtual/xserver instead
> -PROVIDES = "virtual/xserver-xf86"
> -
> -# Other packages tend to just care that there is *an* X server:
> -PROVIDES += "virtual/xserver"
> -
> -PE = "2"
> -
> -XORG_PN = "xorg-server"
> -SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
> -SRC_URI += "file://macro_tweak.patch"
> -
> -S = "${WORKDIR}/${XORG_PN}-${PV}"
> -
> -inherit autotools pkgconfig
> -
> -PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
> -LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
> -DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
> -
> -# Split out some modules and extensions from the main package
> -# These aren't needed for basic operations and only take up space:
> -#  32.0k   libdri.so
> -#  91.0k   libexa.so
> -#  336.0k  libglx.so
> -#  1360k   libint10.so
> -#  180.0k  libwfb.so
> -#  320.0k  libxaa.so
> -#  124.0k  libxf1bpp.so
> -#  84.0k   libxf4bpp.so
> -#          librecord.so
> -#          libextmod.so
> -#          libdbe.so
> -
> -PACKAGES =+ "${PN}-security-policy \
> -             ${PN}-sdl \
> -             ${PN}-fbdev \
> -             ${PN}-xprint \
> -             ${PN}-xvfb \
> -             ${PN}-utils \
> -             ${PN}-xephyr \
> -             ${PN}-multimedia-modules \
> -             ${PN}-extension-dri \
> -             ${PN}-extension-dri2 \
> -             ${PN}-extension-glx \
> -             ${PN}-extension-record \
> -             ${PN}-extension-extmod \
> -             ${PN}-extension-dbe \
> -             ${PN}-module-libint10 \
> -             ${PN}-module-libafb \
> -             ${PN}-module-libwfb  \
> -             ${PN}-module-libmfb \
> -             ${PN}-module-libcfb \
> -             ${PN}-module-exa \
> -             ${PN}-module-xaa \
> -             ${PN}-module-libxf1bpp \
> -             ${PN}-module-libxf4bpp"
> -
> -RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
> -RDEPENDS_${PN}-xvfb += "xkeyboard-config"
> -RREPLACES_${PN}-module-exa = "${PN}"
> -
> -FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
> -FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
> -FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled ${localstatedir}/lib/xkb/README.compiled"
> -FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
> -                    ${libdir}/xorg/modules/*/.debug \
> -                    ${libdir}/xorg/modules/*/*/.debug \
> -                    "
> -FILES_${PN}-security-policy += "${libdir}/xserver/SecurityPolicy"
> -FILES_${PN}-sdl = "${bindir}/Xsdl"
> -FILES_${PN}-fbdev = "${bindir}/Xfbdev"
> -FILES_${PN}-xprint = "${libdir}/X11/xserver/*/print"
> -FILES_${PN}-xvfb = "${bindir}/Xvfb"
> -FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
> -FILES_${PN}-xephyr = "${bindir}/Xephyr"
> -FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
> -FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
> -FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
> -FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
> -FILES_${PN}-extension-record = "${libdir}/xorg/modules/extensions/librecord.so"
> -FILES_${PN}-extension-extmod = "${libdir}/xorg/modules/extensions/libextmod.so"
> -FILES_${PN}-extension-dbe = "${libdir}/xorg/modules/extensions/libdbe.so"
> -FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
> -FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
> -FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
> -FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
> -FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
> -FILES_${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
> -FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
> -FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
> -FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
> -
> -EXTRA_OECONF += "--with-fop=no \
> -                 --disable-static \
> -                 --disable-acfb \
> -                 --disable-ccfb \
> -                 --disable-mcfb \
> -                 --disable-xinerama \
> -                 --disable-xf86misc \
> -                 --disable-xorgcfg \
> -                 --disable-record \
> -                 --disable-dmx \
> -                 --disable-xnest \
> -                 --disable-xvfb \
> -                 --enable-composite \
> -                 --without-dtrace \
> -                 --sysconfdir=/etc/X11 \
> -                 --localstatedir=/var \
> -                 --with-fontdir=${datadir}/fonts/X11 \
> -                 --with-xkb-output=/var/lib/xkb \
> -                 ac_cv_file__usr_share_sgml_X11_defs_ent=no \
> -"
> -
> -PACKAGECONFIG ??= "udev"
> -PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
> -
> -do_install_append () {
> -	# Its assumed base-files creates this for us
> -	rmdir ${D}${localstatedir}/log/
> -}
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
> deleted file mode 100644
> index 02db5bf..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require xserver-xorg-common.inc
> -
> -EXTRA_OECONF += "\
> -                 --disable-dri \
> -                 --disable-glx \
> -                 --disable-dga \
> -                 --without-xmlto \
> -"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb
> deleted file mode 100644
> index ec29b21..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require xserver-xorg-lite.inc
> -require xserver-xorg-${PV}.inc
> -
> -FILESEXTRAPATHS_append := "${THISDIR}/xserver-xorg:${THISDIR}/xserver-xorg-${PV}:"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index ca7d33a..a0309aa 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -1,5 +1,138 @@
> -require xserver-xorg-common.inc
> +DESCRIPTION = "The X.Org X server"
> +HOMEPAGE = "http://www.x.org"
> +SECTION = "x11/base"
> +LICENSE = "MIT-X"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
>
> +# xf86-*-* packages depend on an X server built with the xfree86 DDX
> +# so we have a virtual to represent that:
> +# deprecated, we should use virtual/xserver instead
> +PROVIDES = "virtual/xserver-xf86"
> +
> +# Other packages tend to just care that there is *an* X server:
> +PROVIDES += "virtual/xserver"
> +
> +PE = "2"
> +
> +XORG_PN = "xorg-server"
> +SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
> +SRC_URI += "file://macro_tweak.patch"
> +
> +S = "${WORKDIR}/${XORG_PN}-${PV}"
> +
> +inherit autotools pkgconfig
> +
> +PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
> +LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
> +DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
> +
> +# Split out some modules and extensions from the main package
> +# These aren't needed for basic operations and only take up space:
> +#  32.0k   libdri.so
> +#  91.0k   libexa.so
> +#  336.0k  libglx.so
> +#  1360k   libint10.so
> +#  180.0k  libwfb.so
> +#  320.0k  libxaa.so
> +#  124.0k  libxf1bpp.so
> +#  84.0k   libxf4bpp.so
> +#          librecord.so
> +#          libextmod.so
> +#          libdbe.so
> +
> +PACKAGES =+ "${PN}-security-policy \
> +             ${PN}-sdl \
> +             ${PN}-fbdev \
> +             ${PN}-xprint \
> +             ${PN}-xvfb \
> +             ${PN}-utils \
> +             ${PN}-xephyr \
> +             ${PN}-multimedia-modules \
> +             ${PN}-extension-dri \
> +             ${PN}-extension-dri2 \
> +             ${PN}-extension-glx \
> +             ${PN}-extension-record \
> +             ${PN}-extension-extmod \
> +             ${PN}-extension-dbe \
> +             ${PN}-module-libint10 \
> +             ${PN}-module-libafb \
> +             ${PN}-module-libwfb  \
> +             ${PN}-module-libmfb \
> +             ${PN}-module-libcfb \
> +             ${PN}-module-exa \
> +             ${PN}-module-xaa \
> +             ${PN}-module-libxf1bpp \
> +             ${PN}-module-libxf4bpp"
> +
> +RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
> +RDEPENDS_${PN}-xvfb += "xkeyboard-config"
> +RREPLACES_${PN}-module-exa = "${PN}"
> +
> +FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
> +FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
> +FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled ${localstatedir}/lib/xkb/README.compiled"
> +FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
> +                    ${libdir}/xorg/modules/*/.debug \
> +                    ${libdir}/xorg/modules/*/*/.debug \
> +                    "
> +FILES_${PN}-security-policy += "${libdir}/xserver/SecurityPolicy"
> +FILES_${PN}-sdl = "${bindir}/Xsdl"
> +FILES_${PN}-fbdev = "${bindir}/Xfbdev"
> +FILES_${PN}-xprint = "${libdir}/X11/xserver/*/print"
> +FILES_${PN}-xvfb = "${bindir}/Xvfb"
> +FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
> +FILES_${PN}-xephyr = "${bindir}/Xephyr"
> +FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
> +FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
> +FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
> +FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
> +FILES_${PN}-extension-record = "${libdir}/xorg/modules/extensions/librecord.so"
> +FILES_${PN}-extension-extmod = "${libdir}/xorg/modules/extensions/libextmod.so"
> +FILES_${PN}-extension-dbe = "${libdir}/xorg/modules/extensions/libdbe.so"
> +FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
> +FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
> +FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
> +FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
> +FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
> +FILES_${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
> +FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
> +FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
> +FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
> +
> +EXTRA_OECONF += "--with-fop=no \
> +                 --without-xmlto \
> +                 --with-pic \
> +                 --disable-static \
> +                 --disable-acfb \
> +                 --disable-ccfb \
> +                 --disable-mcfb \
> +                 --disable-xinerama \
> +                 --disable-xf86misc \
> +                 --disable-xorgcfg \
> +                 --disable-record \
> +                 --disable-dmx \
> +                 --disable-xnest \
> +                 --disable-xvfb \
> +                 --enable-composite \
> +                 --without-dtrace \
> +                 --with-int10=x86emu \
> +                 --sysconfdir=/etc/X11 \
> +                 --localstatedir=/var \
> +                 --with-fontdir=${datadir}/fonts/X11 \
> +                 --with-xkb-output=/var/lib/xkb \
> +                 ac_cv_file__usr_share_sgml_X11_defs_ent=no \
> +"
> +
> +PACKAGECONFIG ??= "udev"
> +PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
> +
> +do_install_append () {
> +	# Its assumed base-files creates this for us
> +	rmdir ${D}${localstatedir}/log/
> +}
> +
> +
> +# Mesa/GLX/DRI
>   PROTO_DEPS += "xf86driproto dri2proto"
>   LIB_DEPS += "mesa-dri"
>
> @@ -7,7 +140,4 @@ EXTRA_OECONF += "\
>                    --enable-dri \
>                    --enable-dri2 \
>                    --enable-glx-tls \
> -                 --with-pic \
> -                 --with-int10=x86emu \
> -                 --without-xmlto \
>   "
>


