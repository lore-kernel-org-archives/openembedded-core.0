Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNmB5-0004fU-NT for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 14:57:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8DpEdO032292
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 13:51:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31928-03 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 13:51:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8Dp6H1032286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 13:51:07 GMT
Message-ID: <1320760268.10843.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 13:51:08 +0000
In-Reply-To: <A61A980F-D367-4F98-98F8-E413B0F20EA5@dominion.thruhere.net>
References: <cover.1320750179.git.xiaofeng.yan@windriver.com>
	<9d9675eee33b1f77242db3ecd556c82470696f61.1320750179.git.xiaofeng.yan@windriver.com>
	<1320758312.10843.27.camel@ted>
	<A61A980F-D367-4F98-98F8-E413B0F20EA5@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/7] gtk+: Fix bug 1674
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
X-List-Received-Date: Tue, 08 Nov 2011 13:57:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 14:32 +0100, Koen Kooi wrote:
> Op 8 nov. 2011, om 14:18 heeft Richard Purdie het volgende geschreven:
> 
> > On Tue, 2011-11-08 at 19:15 +0800, Xiaofeng Yan wrote:
> >> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> >> 
> >> [YOCTO #1674]
> >> Image "gtk+ over directfb" doesn't need "x11".
> >> So I add "directfb" on configuration and gtk-demo to image for check \
> >> whether image based on gtk+-directfb work successfully.
> >> 
> >> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> >> ---
> >> meta/recipes-gnome/gtk+/gtk+.inc       |   18 ++++++++++++++----
> >> meta/recipes-gnome/gtk+/gtk+_2.24.6.bb |   17 ++++++++++++-----
> >> 2 files changed, 26 insertions(+), 9 deletions(-)
> >> 
> >> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
> >> index 0e5c45c..6ec5906 100644
> >> --- a/meta/recipes-gnome/gtk+/gtk+.inc
> >> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
> >> @@ -9,13 +9,18 @@ LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
> >> LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
> >> 
> >> SECTION = "libs"
> >> -DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
> >> -           gtk-doc-native docbook-utils-native libxrandr libgcrypt \
> >> -           libxdamage libxrender libxcomposite cairo gdk-pixbuf"
> >> +X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
> >> +DIRECTFBDEPENDS = "directfb"
> >> +
> >> +DEPENDS = "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native \
> >> +           libgcrypt cairo gdk-pixbuf \
> >> +           ${@base_contains('DISTRO_FEATURES', 'x11', '', '', d)} \
> >> +           ${@base_contains('DISTRO_FEATURES', 'directfb', '${DIRECTFBDEPENDS}', '', d)}"
> >> +
> >> 
> >> inherit autotools pkgconfig
> >> 
> >> -PACKAGES += "libgail"
> >> +PACKAGES += "libgail gtk+-demo"
> >> 
> >> FILES_${PN} = "${bindir}/gtk-update-icon-cache \
> >> 	${bindir}/gtk-query-immodules-2.0 \
> >> @@ -40,6 +45,11 @@ FILES_${PN}-dbg += " \
> >> 	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
> >> 	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
> >> 
> >> +FILES_gtk+-demo = " \
> >> +        ${datadir}/gtk-2.0/demo/* \
> >> +        ${bindir}/gtk-demo \
> >> +        "
> >> +
> >> FILES_libgail = " \
> >> 	${libdir}/gtk-2.0/modules/libgail.so \
> >> 	${libdir}/gtk-2.0/modules/libferret.so \
> >> diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
> >> index 01f4a11..5a9dc5e 100644
> >> --- a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
> >> +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
> >> @@ -8,7 +8,6 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
> >>            file://xsettings.patch \
> >>            file://run-iconcache.patch \
> >>            file://hardcoded_libtool.patch \
> >> -           file://no-demos.patch \
> >>            file://cellrenderer-cairo.patch;striplevel=0 \
> >>            file://toggle-font.diff;striplevel=0 \
> >>            file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
> >> @@ -25,13 +24,21 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
> >> #           file://menu-deactivate.patch
> >> #        file://combo-arrow-size.patch;striplevel=0
> >> #            file://configurefix.patch
> >> +#           file://no-demos.patch 
> >> 
> >> -PR = "r1"
> >> +PR = "r2"
> >> 
> >> -SRC_URI[md5sum] = "421100f6597e613234f8dead6091a9fe"
> >> -SRC_URI[sha256sum] = "6f45bdbf9ea27eb3b5f977d7ee2365dede0d0ce454985680c26e5210163bbf37"
> >> +SRC_URI[md5sum] = "4e977cb6a4530e9d4fe54d6ba70831c4"
> >> +SRC_URI[sha256sum] = "9aade52339dca563780bca5c83b0fb02284393221bda4f55cb9ec7eae1661a1d"
> >> +
> >> +CONF_directfb=" --with-x=no --with-gdktarget=directfb"
> >> +CONF_xorg=" --with-x=yes --with-gdktarget=x11"
> >> +
> >> +EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'directfb', \
> >> + '${CONF_directfb}', '${CONF_xorg}', d)} \
> >> + --without-libtiff --without-libjasper --enable-xkb \
> >> + --disable-glibtest --disable-cups --disable-xinerama"
> >> 
> >> -EXTRA_OECONF = "--without-libtiff --without-libjasper --enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
> > 
> > This is a horrible mess and its just going to get worse. We started
> > adding PACKAGECONFIG to try and help with things like this problem.
> > Instead of the above you should be able to do something like:
> > 
> > PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> >                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> > PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
> > PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
> 
> What happens when I have both directfb and x11 in DISTRO_FEATURES?

That would cause problems. The grand plan is to flag incompatible
options and error but don't have code for that yet...

Cheers,

Richard



