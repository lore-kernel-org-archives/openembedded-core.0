Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9dxP-0002OT-4J for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 16:20:55 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UELlT2025142; Fri, 30 Sep 2011 15:21:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XZfsD-3XS5JW; Fri, 30 Sep 2011 15:21:47 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UELfbG025138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 30 Sep 2011 15:21:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 30 Sep 2011 15:15:15 +0100
In-Reply-To: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317392122.12332.208.camel@ted>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Fri, 30 Sep 2011 14:20:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'd not forgotten about this patch, just been distracted by other
things. I've run some further tests on the changes here and have
comments below. Summary is I think some pieces can merge, other pieces
need more work. Lets try and get the pieces that are ready merged, then
worry about the remainder.

On Fri, 2011-09-30 at 10:19 +0200, Martin Jansa wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> * Jansa: rebased on current master, added nocompiler patch also to
>   font-alias, dropped allarch from linux-firmware, gnome-icon-theme, hal-info as
>   those are checking compiler (ie in intltool check) and better to build
>   them as default arch instead of rebuilding after every machine
>   change.
> * this is also part of [BUGID# 1075]
> * tested except linux-firmware (SRC_URI is offline)
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../resolvconf/resolvconf_1.59.bb                  |    7 ++--
>  .../update-alternatives-dpkg.inc                   |    5 +--
>  meta/recipes-gnome/gnome/gnome-common_2.28.0.bb    |    7 +---
>  .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    5 +--
>  .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    6 +--
>  .../ttf-fonts/liberation-fonts_1.04.bb             |    5 ++-
>  .../ttf-fonts/liberation-fonts_1.06.bb             |    5 ++-
>  .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    5 ++-
>  .../xcursor-transparent-theme_0.1.1.bb             |    6 +--
>  .../xorg-font/encodings/nocompiler.patch           |   31 ++++++++++++++++++++
>  meta/recipes-graphics/xorg-font/encodings_1.0.4.bb |    8 +++--
>  .../xorg-font/font-alias-1.0.3/nocompiler.patch    |   30 +++++++++++++++++++
>  .../recipes-graphics/xorg-font/font-alias_1.0.3.bb |    8 +++--
>  .../xorg-font/xorg-minimal-fonts.bb                |    5 ++-
>  .../linux-firmware/linux-firmware_git.bb           |    4 +--
>  .../sato-icon-theme/sato-icon-theme.inc            |    4 +--
>  .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +
>  meta/recipes-support/hal/hal-info.inc              |    1 -
>  meta/recipes-support/hal/hal-info_20091130.bb      |    2 +
>  meta/recipes-support/hal/hal-info_git.bb           |    2 +-
>  20 files changed, 102 insertions(+), 46 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
>  create mode 100644 meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
> 
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
> index 94231e0..50252b1 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
> @@ -11,13 +11,15 @@ AUTHOR = "Thomas Hood"
>  HOMEPAGE = "http://packages.debian.org/resolvconf"
>  DEPENDS = "bash"
>  RDEPENDS_${PN} = "bash"
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
>  
>  SRC_URI[md5sum] = "59b20258bb8a3c25b8c4083fc0279547"
>  SRC_URI[sha256sum] = "37691677cea24da66d6664c98668b5f16667c0133f17feb166f246ee923ad756"
>  
> +inherit allarch
> +
>  do_compile () {
>  	:
>  }
> @@ -31,6 +33,3 @@ do_install () {
>  	install -m 0644 README ${D}${docdir}/${P}/
>  	install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/
>  }
> -
> -PACKAGE_ARCH = "all"
> -

resolvconf is fine except we should drop the DEPENDS = "bash" (the
RDEPENDS is fine).

> diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
> index c881ae0..e95a307 100644
> --- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
> +++ b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
> @@ -7,10 +7,9 @@ LICENSE = "GPL"
>  SECTION = "base"
>  SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2"
>  S = "${WORKDIR}/dpkg-${PV}"
> -PACKAGE_ARCH = "all"
> -INC_PR = "r3"
> +INC_PR = "r4"
>  
> -inherit gettext
> +inherit gettext allarch
>  
>  do_patch () {
>      cat ${S}/scripts/update-alternatives.pl | \

This doesn't build.

ERROR: Logfile of failure stored
in: /media/build1/poky/build/tmp/work/all-poky-linux/update-alternatives-dpkg-1.16.0.3-r4.0/temp/log.do_configure.24532
Log data follows:
| NOTE: Checking autotools environment for common misconfiguration
| ERROR: virtual/gettext required but not in DEPENDS for
file /media/build1/poky/build/tmp/work/all-poky-linux/update-alternatives-dpkg-1.16.0.3-r4.0/dpkg-1.16.0.3/configure.ac.
| Missing inherit gettext?


> diff --git a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb b/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
> index 570c45a..8936dbd 100644
> --- a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
> +++ b/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
> @@ -6,11 +6,8 @@ LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
>  SECTION = "x11/gnome"
> -PR = "r0"
> -inherit gnome
> -
> -# all isn't appropriate since STAGING_DATADIR is target specific
> -# PACKAGE_ARCH="all"
> +PR = "r1"
> +inherit gnome allarch
>  
>  # The omf.make file failed if scrollkeeper doesn't happen to be
>  # installed


This one is fine, to be clear the warning no longer applies with machine
specific sysroots.

> diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> index 55868ab..956c015 100644
> --- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> +++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> @@ -9,7 +9,7 @@ SECTION = "x11/gnome"
>  DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native"
>  RDEPENDS_${PN} = "hicolor-icon-theme"
>  RRECOMMENDS_${PN} = "librsvg-gtk"
> -PR = "r1"
> +PR = "r2"
>  
>  FILES_${PN} += "${datadir}/*"
>  
> @@ -22,6 +22,3 @@ SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a
>  EXTRA_OECONF = "--disable-hicolor-check --with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
>  
>  inherit autotools
> -
> -# We can't do this until the output is shared into all target sysroots
> -#PACKAGE_ARCH = "all"

No need to change PR for a comment. We really should dig into this one
and find a way to get rid of the compiler checks.

> diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> index c9d65a2..8d48dec 100644
> --- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> +++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> @@ -6,9 +6,9 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
>  
>  SECTION = "unknown"
> -inherit gnome
> +inherit gnome allarch
>  
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
>          file://index.theme"
> @@ -16,8 +16,6 @@ SRC_URI = "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
>  SRC_URI[md5sum] = "55cafbcef8bcf7107f6d502149eb4d87"
>  SRC_URI[sha256sum] = "9edca690617eaa19054951ca53501c802180262be8880ed84754ac46c93bec73"
>  
> -PACKAGE_ARCH = "all"
> -
>  FILES_${PN} += "${datadir}/icons"
>  
>  do_install_append () {

The inherit gnome is injecting gconf dependencies here along with a load
of native stuff which might not make sense. We really need to find a way
of disabling that.

> diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> index 19bb69c..b0a8242 100644
> --- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> +++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> @@ -8,11 +8,12 @@ BUGTRACKER = "https://bugzilla.redhat.com/"
>  SECTION = "x11/fonts"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -PACKAGE_ARCH = "all"
>  RDEPENDS_${PN} = "fontconfig-utils"
> -PR = "r1"
> +PR = "r2"
>  PE = "1"
>  
> +inherit allarch
> +
>  SRC_URI = "https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-${PV}.tar.gz \
>             file://30-liberation-aliases.conf"
>  
> diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
> index 4882cc7..5193fda 100644
> --- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
> +++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
> @@ -8,10 +8,9 @@ BUGTRACKER = "https://bugzilla.redhat.com/"
>  SECTION = "x11/fonts"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -PACKAGE_ARCH = "all"
>  RDEPENDS_${PN} = "fontconfig-utils"
>  PE = "1"
> -PR = "r1"
> +PR = "r2"
>  
>  FONTREV = "0.20100721"
>  SRC_URI = "https://fedorahosted.org/releases/l/i/${BPN}/${BPN}-${PV}.${FONTREV}.tar.gz \
> @@ -19,6 +18,8 @@ SRC_URI = "https://fedorahosted.org/releases/l/i/${BPN}/${BPN}-${PV}.${FONTREV}.
>  
>  S = ${WORKDIR}/${BPN}-${PV}.${FONTREV}
>  
> +inherit allarch
> +
>  do_install () {
>  	install -d ${D}${datadir}/fonts/ttf/
>  	for i in *.ttf; do

These seem fine.

> diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
> index 3294b40..682184a 100644
> --- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
> +++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
> @@ -7,10 +7,11 @@ but is visibly different than normal and bold, and reasonably pleasing."
>  SECTION = "x11/fonts"
>  LICENSE = "Bitstream_Vera"
>  LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
> -PACKAGE_ARCH = "all"
> -PR = "r4"
> +PR = "r5"
>  RDEPENDS_${PN} = "fontconfig-utils"
>  
> +inherit allarch
> +
>  SRC_URI = "${GNOME_MIRROR}/ttf-bitstream-vera/1.10/ttf-bitstream-vera-${PV}.tar.bz2" 
>  
>  do_install () { 

Also fine

> diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
> index 002cc15..824c295 100644
> --- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
> +++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  
>  SECTION = "x11/base"
> -PR="r3"
> +PR = "r4"
>  
>  SRC_URI = "http://matchbox-project.org/sources/utils/xcursor-transparent-theme-${PV}.tar.gz \
>  	   file://use-relative-symlinks.patch \
> @@ -16,6 +16,4 @@ SRC_URI[md5sum] = "7b0c623049d4aab20600d6473f8aab23"
>  SRC_URI[sha256sum] = "b26adf2d503d01299718390ae39dab4691a67220de09423be0364e9a060bf7e4"
>  FILES_${PN} = "${datadir}/icons/xcursor-transparent/cursors/*"
>  
> -inherit autotools
> -
> -PACKAGE_ARCH = "all"
> +inherit autotools allarch

Also fine.

> diff --git a/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch b/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
> new file mode 100644
> index 0000000..1cddd10
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
> @@ -0,0 +1,31 @@
> +XORG_DEFAULT_OPTIONS pulls in the following dependency chains:
> +
> +XORG_CWARNFLAGS -> AC_PROG_CC_C99
> +XORG_STRICT_OPTION -> AC_PROG_CC_C99, XORG_CWARNFLAGS
> +XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host 
> +
> +each of which triggers the use of the host compiler. As an "all"
> +architecture package, it shouldn't need a compiler (and doesn't).
> +
> +RP 17/5/2011
> +
> +Index: encodings-1.0.4/configure.ac
> +===================================================================
> +--- encodings-1.0.4.orig/configure.ac	2011-05-17 23:36:19.505095876 +0100
> ++++ encodings-1.0.4/configure.ac	2011-05-17 23:54:14.935096128 +0100
> +@@ -4,12 +4,12 @@
> + AM_INIT_AUTOMAKE([foreign dist-bzip2])
> + AM_MAINTAINER_MODE
> + 
> +-# Require xorg-macros: XORG_DEFAULT_OPTIONS
> + m4_ifndef([XORG_MACROS_VERSION],
> + 	  [m4_fatal([must install xorg-macros 1.3 or later before running autoconf/autogen])])
> + XORG_MACROS_VERSION(1.3)
> +-XORG_DEFAULT_OPTIONS
> +-
> ++XORG_RELEASE_VERSION
> ++XORG_CHANGELOG
> ++XORG_INSTALL
> + AC_PROG_INSTALL
> + 
> + # Require X.Org's font util macros 1.2 or later
> diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
> index 1345134..cf7b3e3 100644
> --- a/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
> +++ b/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
> @@ -7,13 +7,15 @@ require xorg-font-common.inc
>  LICENSE = "PD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=9da93f2daf2d5572faa2bfaf0dbd9e76"
>  PE = "1"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  DEPENDS = "mkfontscale-native font-util-native"
>  
> -EXTRA_OECONF += "--with-encodingsdir=${datadir}/fonts/X11/encodings"
> +SRC_URI += "file://nocompiler.patch"
> +
> +inherit allarch
>  
> -PACKAGE_ARCH = "all"
> +EXTRA_OECONF += "--with-encodingsdir=${datadir}/fonts/X11/encodings"
>  
>  SRC_URI[md5sum] = "0f2d6546d514c5cc4ecf78a60657a5c1"
>  SRC_URI[sha256sum] = "ced6312988a45d23812c2ac708b4595f63fd7a49c4dcd9f66bdcd50d1057d539"

Uses native dependencies but is fine.

> diff --git a/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch b/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
> new file mode 100644
> index 0000000..48e183c
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
> @@ -0,0 +1,30 @@
> +XORG_DEFAULT_OPTIONS pulls in the following dependency chains:
> +
> +XORG_CWARNFLAGS -> AC_PROG_CC_C99
> +XORG_STRICT_OPTION -> AC_PROG_CC_C99, XORG_CWARNFLAGS
> +XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host 
> +
> +each of which triggers the use of the host compiler. As an "all"
> +architecture package, it shouldn't need a compiler (and doesn't).
> +
> +RP 17/5/2011
> +
> +diff -uNr font-alias-1.0.3.orig//configure.ac font-alias-1.0.3/configure.ac
> +--- font-alias-1.0.3.orig//configure.ac	2011-05-18 21:29:18.378258643 +0200
> ++++ font-alias-1.0.3/configure.ac	2011-05-18 21:32:06.865258593 +0200
> +@@ -28,12 +28,12 @@
> + AM_INIT_AUTOMAKE([foreign dist-bzip2])
> + AM_MAINTAINER_MODE
> + 
> +-# Require xorg-macros: XORG_DEFAULT_OPTIONS
> + m4_ifndef([XORG_MACROS_VERSION],
> + 	  [m4_fatal([must install xorg-macros 1.3 or later before running autoconf/autogen])])
> + XORG_MACROS_VERSION(1.3)
> +-XORG_DEFAULT_OPTIONS
> +-
> ++XORG_RELEASE_VERSION
> ++XORG_CHANGELOG
> ++XORG_INSTALL
> + AC_PROG_INSTALL
> + 
> + XORG_FONTROOTDIR
> diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
> index 1b63961..69edd0b 100644
> --- a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
> +++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
> @@ -9,14 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bf0158b89be493d523d69d9f29265038 \
>                      file://misc/fonts.alias;md5=a8ec05d528431d4c9703b55a7efd67a8 \
>                      file://100dpi/fonts.alias;md5=85bebd6ca213aa656c301a72eb4397cb"
>  
> +SRC_URI += "file://nocompiler.patch"
> +
>  DEPENDS = "virtual/xserver font-util"
>  RDEPENDS_${PN} = "encodings font-util"
>  RDEPENDS_${PN}_virtclass-native = "font-util-native"
>  
> -PE = "1"
> -PR = "${INC_PR}.1"
> +inherit allarch
>  
> -PACKAGE_ARCH = "all"
> +PE = "1"
> +PR = "${INC_PR}.2"
>  
>  SRC_URI[md5sum] = "6d25f64796fef34b53b439c2e9efa562"
>  SRC_URI[sha256sum] = "8b453b2aae1cfa8090009ca037037b8c5e333550651d5a158b7264ce1d472c9a"

The DEPENDS are problematic in this one :/. If its allarch, it shouldn't
need them...

> diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
> index d5d8fe7..f454f9e 100644
> --- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
> +++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
> @@ -13,10 +13,11 @@ LIC_FILES_CHKSUM = "file://../misc/fonts.alias;md5=bbe8d3c0e4e74af96e3ac393985c4
>  SRC_URI = "file://misc"
>  
>  PE = "1"
> -PR = "r0"
> +PR = "r1"
> +
> +inherit allarch
>  
>  PACKAGES = "${PN}"
> -PACKAGE_ARCH = "all"
>  FILES_${PN} = "${libdir}/X11/ ${datadir}/fonts/X11/"
>  
>  do_install() {

This one is fine.

> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 660877e..1dffd75 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -24,7 +24,7 @@ PROVIDES += "linux-firmware-sd8686 linux-firmware-rtl8192cu linux-firmware-rtl81
>  
>  SRCREV = "40c0f950be7040614dc45df54e25e54d00e3b73b"
>  PV = "0.0+git${SRCPV}"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git;protocol=git"
>  
> @@ -77,5 +77,3 @@ FILES_${PN}-rtl8192su = " \
>    /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
>  "
>  RPROVIDES_${PN}-rtl8192su = "${PN}-rtl8192su"
> -
> -PACKAGE_ARCH = "all"

This needs more investigation.

> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> index 0eff9dd..75e029c 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> @@ -8,12 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
>  SECTION = "x11"
>  DEPENDS = ""
>  
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig allarch
>  
>  FILES_${PN} += "${datadir}"
>  
> -PACKAGE_ARCH = "all"
> -
>  EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
>  
>  #explictly setting "Sato" as default icon theme to avoid icon missing due to
> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> index e69481d..54e4627 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> @@ -2,6 +2,8 @@ require sato-icon-theme.inc
>  
>  DEPENDS += "icon-naming-utils-native"
>  
> +PR = "r1"
> +
>  SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
>             file://iconpath-option.patch"
 
This one is fine.

> diff --git a/meta/recipes-support/hal/hal-info.inc b/meta/recipes-support/hal/hal-info.inc
> index 183dd0e..d6743de 100644
> --- a/meta/recipes-support/hal/hal-info.inc
> +++ b/meta/recipes-support/hal/hal-info.inc
> @@ -18,5 +18,4 @@ do_configure() {
>  	oe_runconf
>  }
>  
> -PACKAGE_ARCH = "all"
>  FILES_${PN} += "${datadir}/hal/"
> diff --git a/meta/recipes-support/hal/hal-info_20091130.bb b/meta/recipes-support/hal/hal-info_20091130.bb
> index 4469904..65d4d6b 100644
> --- a/meta/recipes-support/hal/hal-info_20091130.bb
> +++ b/meta/recipes-support/hal/hal-info_20091130.bb
> @@ -1,4 +1,6 @@
>  require hal-info.inc
>  
> +PR = "r1"
> +
>  SRC_URI[md5sum] = "34375489a02a00b250fdc0b280be11b8"
>  SRC_URI[sha256sum] = "3b5a90eaea4359977d36c808a19b3f08835345a258c68b9c6c080ad5ef875224"
> diff --git a/meta/recipes-support/hal/hal-info_git.bb b/meta/recipes-support/hal/hal-info_git.bb
> index 3fff5e0..adcde9e 100644
> --- a/meta/recipes-support/hal/hal-info_git.bb
> +++ b/meta/recipes-support/hal/hal-info_git.bb
> @@ -1,7 +1,7 @@
>  require hal-info.inc
>  
>  PV = "${SRCDATE}+git"
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "git://anongit.freedesktop.org/hal-info/;protocol=git;rev=HAL_INFO_20091130"
>  S = "${WORKDIR}/git"

It would be better if we could find a way to patch out the compiler
checks in this package...

Could we clean out the problematic pieces and resubmit please so we can
at least get those pieces in? :)

Cheers,

Richard



