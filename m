Received: from mail-pd0-f179.google.com ([209.85.192.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UImhW-0006pq-QE
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 22:07:07 +0100
Received: by mail-pd0-f179.google.com with SMTP id x10so1257711pdj.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 13:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7qdnhXIyqAn1S6vh6DMhIB1YwvQT3gn9QYif8TngqXA=;
	b=Vg2uCE/63ofuEtR8JMpKuLubASEVS0pEM+uPg+2xPoskcbgPfnAEK7U449micYv3Oe
	QQvbgIbQuQlLEL1GW7vN0Ubj2ZwVpK7V/dkeBu7sQNlydCRFjD+5wOIF808GBJK/rg0P
	CsE1ZznZVmFn3jDGbgDhPdJ5cYjkP0JDlyMcvE1fhitRl+fF0FoLVDxheoS2CR18kFyU
	FGxb+KxiMh03I1vEw4O2wdosLrGRjW8MfzJJ5kOo23HyT4osXLc/ULv6qT5rNGuiMiNq
	ds6NOUyH4CKOxwzfiKA2P6n7C9hQXlBYldVlq03WJAFB4LRG2BRHhHFrIPV+DvJ6Qs4w
	007A==
X-Received: by 10.66.81.2 with SMTP id v2mr16754290pax.204.1363899012397;
	Thu, 21 Mar 2013 13:50:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eh5sm7257553pbc.44.2013.03.21.13.50.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 21 Mar 2013 13:50:11 -0700 (PDT)
Date: Thu, 21 Mar 2013 21:50:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130321205008.GB3219@jama>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/16] distro: Add separatebuilddir.inc
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
X-List-Received-Date: Thu, 21 Mar 2013 21:07:09 -0000
X-Groupsio-MsgNum: 36881
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2013 at 03:55:14PM +0000, Richard Purdie wrote:
> Going forward its going to be useful to separate build data from source d=
ata
> in those autotooled projects which support it. Unfortunately there is a l=
ot
> of breakage so for now, this starts the creation of an opt in list which
> we can iterate over enable more recipes over time.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/defaultsetup.conf            |    1 +
>  meta/conf/distro/include/seperatebuilddir.inc |  772 +++++++++++++++++++=
++++++
>  2 files changed, 773 insertions(+)
>  create mode 100644 meta/conf/distro/include/seperatebuilddir.inc
>=20
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaul=
tsetup.conf
> index be28510..5eb6275 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -1,6 +1,7 @@
>  include conf/distro/include/default-providers.inc
>  include conf/distro/include/default-versions.inc
>  include conf/distro/include/default-distrovars.inc
> +include conf/distro/include/seperatebuilddir.inc

Why not add .inc file without including it in defaultsetup.conf so that
people who want to use it can play with it without influencing others?

>  include conf/distro/include/world-broken.inc
> =20
>  TCMODE ?=3D "default"
> diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/di=
stro/include/seperatebuilddir.inc
> new file mode 100644
> index 0000000..e1789e0
> --- /dev/null
> +++ b/meta/conf/distro/include/seperatebuilddir.inc
> @@ -0,0 +1,772 @@
> +# List of autotools recipes which support building with external build d=
irectories
> +# i.e. ${B} !=3D ${S}
> +SEPB =3D "${WORKDIR}/build"
> +

Is there some plan to move this information to recipes? It would be much
easier to extend this list in layers. Something like set SEPB in recipe
and then set B =3D "${SEPB}" in .inc if it's not empty.

> +B_pn-pn-acl =3D "${SEPB}"
> +B_pn-pn-acl-native =3D "${SEPB}"
> +B_pn-pn-alsa-lib =3D "${SEPB}"
> +B_pn-pn-alsa-lib-native =3D "${SEPB}"
> +B_pn-pn-alsa-tools =3D "${SEPB}"
> +B_pn-pn-alsa-utils =3D "${SEPB}"
> +B_pn-pn-apache2 =3D "${SEPB}"
> +B_pn-pn-apr =3D "${SEPB}"
> +B_pn-pn-apr-native =3D "${SEPB}"
> +B_pn-pn-apr-util =3D "${SEPB}"
> +B_pn-pn-apr-util-native =3D "${SEPB}"
> +B_pn-pn-apt =3D "${SEPB}"
> +B_pn-pn-apt-native =3D "${SEPB}"
> +B_pn-pn-aspell =3D "${SEPB}"
> +B_pn-pn-at =3D "${SEPB}"
> +B_pn-pn-atk =3D "${SEPB}"
> +B_pn-pn-atk-native =3D "${SEPB}"
> +B_pn-pn-attr =3D "${SEPB}"
> +B_pn-pn-attr-native =3D "${SEPB}"
> +B_pn-pn-augeas =3D "${SEPB}"
> +B_pn-pn-autoconf =3D "${SEPB}"
> +B_pn-pn-autoconf-native =3D "${SEPB}"
> +B_pn-pn-autogen-native =3D "${SEPB}"
> +B_pn-pn-automake =3D "${SEPB}"
> +B_pn-pn-automake-native =3D "${SEPB}"
> +B_pn-pn-avahi =3D "${SEPB}"
> +B_pn-pn-avahi-ui =3D "${SEPB}"
> +B_pn-pn-babeltrace =3D "${SEPB}"
> +B_pn-pn-base-passwd =3D "${SEPB}"
> +#B_pn-bash =3D "${SEPB}"
> +B_pn-bc =3D "${SEPB}"
> +B_pn-bdwgc =3D "${SEPB}"
> +B_pn-bdwgc-native =3D "${SEPB}"
> +B_pn-beecrypt =3D "${SEPB}"
> +B_pn-beecrypt-native =3D "${SEPB}"
> +B_pn-bigreqsproto =3D "${SEPB}"
> +B_pn-bigreqsproto-native =3D "${SEPB}"
> +#| make[3]: Entering directory `/media/build1/poky/build/tmp/work/i586-p=
oky-linux/bind/9.8.1-r5/build/bin/named'
> +#| i586-poky-linux-gcc  -m32   -march=3Di586 --sysroot=3D/media/build1/p=
oky/build/tmp/sysroots/qemux86 -O2 -pipe -g -feliminate-unused-debug-types =
  -c -o named-symtbl.o named-symtbl.c
> +#| named-symtbl.c:4:27: fatal error: isc/backtrace.h: No such file or di=
rectory
> +#B_pn-bind =3D "${SEPB}"
> +B_pn-bison =3D "${SEPB}"
> +B_pn-bison-native =3D "${SEPB}"
> +B_pn-blktool =3D "${SEPB}"
> +# ln: failed to create symbolic link 'lib/bluetooth/bluetooth.h': File e=
xists
> +#B_pn-bluez4 =3D "${SEPB}"
> +B_pn-bluez-hcidump =3D "${SEPB}"
> +B_pn-byacc =3D "${SEPB}"
> +B_pn-byacc-native =3D "${SEPB}"
> +B_pn-bzip2 =3D "${SEPB}"
> +B_pn-bzip2-native =3D "${SEPB}"
> +B_pn-cairo =3D "${SEPB}"
> +B_pn-cairo-native =3D "${SEPB}"
> +B_pn-calibrateproto =3D "${SEPB}"
> +B_pn-ccache =3D "${SEPB}"
> +B_pn-ccache-native =3D "${SEPB}"
> +B_pn-chrpath =3D "${SEPB}"
> +B_pn-chrpath-native =3D "${SEPB}"
> +B_pn-clutter-1.8 =3D "${SEPB}"
> +B_pn-clutter-gst-1.8 =3D "${SEPB}"
> +B_pn-clutter-gtk-1.8 =3D "${SEPB}"
> +#B_pn-cmake =3D "${SEPB}"
> +#B_pn-cmake-native =3D "${SEPB}"
> +B_pn-cogl =3D "${SEPB}"
> +B_pn-compositeproto =3D "${SEPB}"
> +B_pn-compositeproto-native =3D "${SEPB}"
> +#B_pn-connman =3D "${SEPB}"
> +#B_pn-connman-gnome =3D "${SEPB}"
> +B_pn-consolekit =3D "${SEPB}"
> +B_pn-console-tools =3D "${SEPB}"
> +B_pn-coreutils =3D "${SEPB}"
> +B_pn-coreutils-native =3D "${SEPB}"
> +B_pn-courier-authlib =3D "${SEPB}"
> +B_pn-courier-imap =3D "${SEPB}"
> +B_pn-cpio =3D "${SEPB}"
> +B_pn-cracklib =3D "${SEPB}"
> +B_pn-cronie =3D "${SEPB}"
> +B_pn-cross-localedef-native =3D "${SEPB}"
> +#No autoconf and no support for separate build
> +#B_pn-cups =3D "${SEPB}"
> +B_pn-curl =3D "${SEPB}"
> +B_pn-curl-native =3D "${SEPB}"
> +B_pn-damageproto =3D "${SEPB}"
> +B_pn-damageproto-native =3D "${SEPB}"
> +B_pn-db =3D "${SEPB}"
> +B_pn-db-native =3D "${SEPB}"
> +B_pn-dbus =3D "${SEPB}"
> +B_pn-dbus-glib =3D "${SEPB}"
> +B_pn-dbus-glib-native =3D "${SEPB}"
> +B_pn-dbus-native =3D "${SEPB}"
> +B_pn-dbus-ptest =3D "${SEPB}"
> +B_pn-dbus-wait =3D "${SEPB}"
> +B_pn-desktop-file-utils-native =3D "${SEPB}"
> +B_pn-dhcp =3D "${SEPB}"
> +B_pn-diffstat =3D "${SEPB}"
> +B_pn-diffutils =3D "${SEPB}"
> +B_pn-directfb =3D "${SEPB}"
> +B_pn-directfb-examples =3D "${SEPB}"
> +B_pn-distcc =3D "${SEPB}"
> +B_pn-dmxproto =3D "${SEPB}"
> +B_pn-docbook-utils-native =3D "${SEPB}"
> +B_pn-dpkg =3D "${SEPB}"
> +B_pn-dpkg-native =3D "${SEPB}"
> +B_pn-dri2proto =3D "${SEPB}"
> +B_pn-dropbear =3D "${SEPB}"
> +## Makefile based not autotools
> +##B_pn-dtc =3D "${SEPB}"
> +##B_pn-dtc-native =3D "${SEPB}"
> +B_pn-e2fsprogs =3D "${SEPB}"
> +B_pn-e2fsprogs-native =3D "${SEPB}"
> +B_pn-ed =3D "${SEPB}"
> +B_pn-elfutils =3D "${SEPB}"
> +B_pn-elfutils-native =3D "${SEPB}"
> +B_pn-enchant =3D "${SEPB}"
> +B_pn-encodings =3D "${SEPB}"
> +B_pn-ethtool =3D "${SEPB}"
> +B_pn-expat =3D "${SEPB}"
> +B_pn-expat-native =3D "${SEPB}"
> +B_pn-fetchmail =3D "${SEPB}"
> +B_pn-file =3D "${SEPB}"
> +B_pn-file-native =3D "${SEPB}"
> +B_pn-findutils =3D "${SEPB}"
> +B_pn-findutils-native =3D "${SEPB}"
> +B_pn-fixesproto =3D "${SEPB}"
> +B_pn-fixesproto-native =3D "${SEPB}"
> +# /bin/bash: line 0: cd: api: No such file or directory
> +#B_pn-flac =3D "${SEPB}"
> +B_pn-flex =3D "${SEPB}"
> +B_pn-flex-native =3D "${SEPB}"
> +B_pn-font-alias =3D "${SEPB}"
> +B_pn-fontconfig =3D "${SEPB}"
> +B_pn-fontconfig-native =3D "${SEPB}"
> +B_pn-fontsproto =3D "${SEPB}"
> +B_pn-fontsproto-native =3D "${SEPB}"
> +B_pn-font-util =3D "${SEPB}"
> +B_pn-font-util-native =3D "${SEPB}"
> +B_pn-foomatic-filters =3D "${SEPB}"
> +## run.do_configure.4694: 88: cd: can't cd to builds/unix
> +##B_pn-freetype =3D "${SEPB}"
> +##B_pn-freetype-native =3D "${SEPB}"
> +B_pn-fstests =3D "${SEPB}"
> +B_pn-gaku =3D "${SEPB}"
> +B_pn-gamin =3D "${SEPB}"
> +B_pn-gawk =3D "${SEPB}"
> +B_pn-gccmakedep =3D "${SEPB}"
> +B_pn-gconf =3D "${SEPB}"
> +B_pn-gconf-native =3D "${SEPB}"
> +B_pn-gdb =3D "${SEPB}"
> +B_pn-gdb-cross =3D "${SEPB}"
> +B_pn-gdb-cross-canadian-i586 =3D "${SEPB}"
> +B_pn-gdbm =3D "${SEPB}"
> +B_pn-gdbm-native =3D "${SEPB}"
> +B_pn-gdk-pixbuf =3D "${SEPB}"
> +B_pn-gdk-pixbuf-native =3D "${SEPB}"
> +B_pn-genext2fs =3D "${SEPB}"
> +B_pn-genext2fs-native =3D "${SEPB}"
> +B_pn-gettext =3D "${SEPB}"
> +B_pn-gettext-native =3D "${SEPB}"
> +#checking for system lcms2 library... checking for cmsCreateXYZProfile i=
n -llcms2... no
> +#checking for local lcms library source... configure: error: LittleCMS s=
ource not found!
> +#B_pn-ghostscript =3D "${SEPB}"
> +#B_pn-ghostscript-native =3D "${SEPB}"
> +# No out of tree build support (manual makefile)
> +#B_pn-git =3D "${SEPB}"
> +#B_pn-git-native =3D "${SEPB}"
> +B_pn-glew =3D "${SEPB}"
> +B_pn-glib-2.0 =3D "${SEPB}"
> +B_pn-glib-2.0-native =3D "${SEPB}"
> +B_pn-glib-networking =3D "${SEPB}"
> +B_pn-glproto =3D "${SEPB}"
> +B_pn-gmp =3D "${SEPB}"
> +B_pn-gmp-native =3D "${SEPB}"
> +B_pn-gnome-common =3D "${SEPB}"
> +B_pn-gnome-common-native =3D "${SEPB}"
> +B_pn-gnome-desktop =3D "${SEPB}"
> +#B_pn-gnome-doc-utils =3D "${SEPB}"
> +#B_pn-gnome-doc-utils-native =3D "${SEPB}"
> +B_pn-gnome-icon-theme =3D "${SEPB}"
> +B_pn-gnome-keyring =3D "${SEPB}"
> +B_pn-gnome-mime-data =3D "${SEPB}"
> +B_pn-gnupg =3D "${SEPB}"
> +## libtool: link: warning: library `.../usr/lib/libgcrypt.la' was moved.
> +##B_pn-gnutls =3D "${SEPB}"
> +B_pn-gnutls-native =3D "${SEPB}"
> +B_pn-gperf =3D "${SEPB}"
> +B_pn-gperf-native =3D "${SEPB}"
> +B_pn-gpgme =3D "${SEPB}"
> +B_pn-grep =3D "${SEPB}"
> +B_pn-groff =3D "${SEPB}"
> +B_pn-groff-native =3D "${SEPB}"
> +B_pn-grub =3D "${SEPB}"
> +B_pn-grub-efi-i586-native =3D "${SEPB}"
> +B_pn-gsettings-desktop-schemas =3D "${SEPB}"
> +#| ./config.status: line 2219: /media/build1/poky/build/tmp/work/i586-po=
ky-linux/gst-ffmpeg/0.10.13-r4/build//media/build1/poky/build/tmp/work/i586=
-poky-linux/gst-ffmpeg/0.10.13-r4/gst-ffmpeg-0.10.13/gst-libs/ext/libav/con=
figure: No such file or directory
> +#| config.status: error: Failed to configure embedded Libav tree
> +#B_pn-gst-ffmpeg =3D "${SEPB}"
> +B_pn-gst-fluendo-mp3 =3D "${SEPB}"
> +B_pn-gst-fluendo-mpegdemux =3D "${SEPB}"
> +B_pn-gst-openmax =3D "${SEPB}"
> +# Has races/confusion over file/symbolic link creation
> +#B_pn-gst-plugin-bluetooth =3D "${SEPB}"
> +B_pn-gst-plugins-bad =3D "${SEPB}"
> +B_pn-gst-plugins-base =3D "${SEPB}"
> +B_pn-gst-plugins-gl =3D "${SEPB}"
> +B_pn-gst-plugins-good =3D "${SEPB}"
> +B_pn-gst-plugins-ugly =3D "${SEPB}"
> +B_pn-gstreamer =3D "${SEPB}"
> +B_pn-gtk+ =3D "${SEPB}"
> +B_pn-gtk+3 =3D "${SEPB}"
> +B_pn-gtk-doc-stub =3D "${SEPB}"
> +B_pn-gtk-doc-stub-native =3D "${SEPB}"
> +B_pn-gtk-engines =3D "${SEPB}"
> +B_pn-gtk+-native =3D "${SEPB}"
> +##make[1]: *** No rule to make target `data/gtkrc', needed by `all-am'. =
 Stop
> +##B_pn-gtk-sato-engine =3D "${SEPB}"
> +B_pn-guile =3D "${SEPB}"
> +B_pn-guile-native =3D "${SEPB}"
> +B_pn-gzip =3D "${SEPB}"
> +B_pn-gzip-native =3D "${SEPB}"
> +B_pn-harfbuzz =3D "${SEPB}"
> +B_pn-harfbuzz-native =3D "${SEPB}"
> +B_pn-help2man-native =3D "${SEPB}"
> +## Hand coded makefiles don't support out-of-tree
> +##B_pn-hicolor-icon-theme =3D "${SEPB}"
> +B_pn-icon-naming-utils-native =3D "${SEPB}"
> +B_pn-icu =3D "${SEPB}"
> +B_pn-icu-native =3D "${SEPB}"
> +B_pn-imake =3D "${SEPB}"
> +B_pn-imake-native =3D "${SEPB}"
> +B_pn-inputproto =3D "${SEPB}"
> +B_pn-inputproto-native =3D "${SEPB}"
> +B_pn-intltool =3D "${SEPB}"
> +B_pn-intltool-native =3D "${SEPB}"
> +B_pn-iptables =3D "${SEPB}"
> +#B_pn-irda-utils =3D "${SEPB}"
> +B_pn-jpeg =3D "${SEPB}"
> +B_pn-jpeg-native =3D "${SEPB}"
> +#B_pn-js =3D "${SEPB}"
> +B_pn-json-glib =3D "${SEPB}"
> +B_pn-kbd =3D "${SEPB}"
> +B_pn-kbd-native =3D "${SEPB}"
> +B_pn-kbproto =3D "${SEPB}"
> +B_pn-kbproto-native =3D "${SEPB}"
> +B_pn-kconfig-frontends =3D "${SEPB}"
> +B_pn-kconfig-frontends-native =3D "${SEPB}"
> +##kexec-tools-2.0.3/kexec/arch/ppc/Makefile:4: kexec/arch/ppc/libfdt/Mak=
efile.libfdt: No such file or directory
> +##B_pn-kexec-tools =3D "${SEPB}"
> +B_pn-kmod =3D "${SEPB}"
> +B_pn-kmod-native =3D "${SEPB}"
> +B_pn-lame =3D "${SEPB}"
> +B_pn-leafpad =3D "${SEPB}"
> +B_pn-less =3D "${SEPB}"
> +B_pn-liba52 =3D "${SEPB}"
> +#| cat /media/build1/poky/build/tmp/work/i586-poky-linux/libarchive/2.8.=
5-r0/libarchive-2.8.5/libarchive/test/test_*.c | grep DEFINE_TEST > libarch=
ive/test/list.h
> +#| cat /media/build1/poky/build/tmp/work/i586-poky-linux/libarchive/2.8.=
5-r0/libarchive-2.8.5/tar/test/test_*.c | grep DEFINE_TEST > tar/test/list.h
> +#| cat /media/build1/poky/build/tmp/work/i586-poky-linux/libarchive/2.8.=
5-r0/libarchive-2.8.5/cpio/test/test_*.c | grep DEFINE_TEST > cpio/test/lis=
t.h
> +#| /bin/bash: tar/test/list.h: No such file or directory
> +#| /bin/bash: libarchive/test/list.h: No such file or directory
> +#| /bin/bash: cpio/test/list.h: No such file or directory
> +#B_pn-libarchive =3D "${SEPB}"
> +B_pn-libart-lgpl =3D "${SEPB}"
> +B_pn-libassuan =3D "${SEPB}"
> +B_pn-libatomics-ops =3D "${SEPB}"
> +B_pn-libcgroup =3D "${SEPB}"
> +B_pn-libcheck =3D "${SEPB}"
> +B_pn-libcroco =3D "${SEPB}"
> +B_pn-libdaemon =3D "${SEPB}"
> +B_pn-libdmx =3D "${SEPB}"
> +B_pn-libdrm =3D "${SEPB}"
> +B_pn-libevent =3D "${SEPB}"
> +B_pn-libexif =3D "${SEPB}"
> +B_pn-libfakekey =3D "${SEPB}"
> +B_pn-libffi =3D "${SEPB}"
> +B_pn-libffi-native =3D "${SEPB}"
> +##i586-poky-linux-libtool: link: cannot find the library `/media/build1/=
poky/build/tmp/work/i586-poky-linux/libfm/1.1.0-r0/libfm-1.1.0/src/actions/=
libfmactions.la' or unhandled argument `/media/build1/poky/build/tmp/work/i=
586-poky-linux/libfm/1.1.0-r0/libfm-1.1.0/src/actions/libfmactions.la'
> +##B_pn-libfm =3D "${SEPB}"
> +B_pn-libfontenc =3D "${SEPB}"
> +B_pn-libfontenc-native =3D "${SEPB}"
> +B_pn-libgcc =3D "${SEPB}"
> +#B_pn-libgcrypt =3D "${SEPB}"
> +#B_pn-libgcrypt-native =3D "${SEPB}"
> +B_pn-libglade =3D "${SEPB}"
> +B_pn-libglu =3D "${SEPB}"
> +B_pn-libgnome-keyring =3D "${SEPB}"
> +B_pn-libgpg-error =3D "${SEPB}"
> +B_pn-libgpg-error-native =3D "${SEPB}"
> +B_pn-libice =3D "${SEPB}"
> +B_pn-libice-native =3D "${SEPB}"
> +B_pn-libid3tag =3D "${SEPB}"
> +B_pn-libidn =3D "${SEPB}"
> +B_pn-libjson =3D "${SEPB}"
> +B_pn-libksba =3D "${SEPB}"
> +B_pn-libmad =3D "${SEPB}"
> +B_pn-libmatchbox =3D "${SEPB}"
> +B_pn-libmpc =3D "${SEPB}"
> +B_pn-libmpc-native =3D "${SEPB}"
> +B_pn-libmusicbrainz =3D "${SEPB}"
> +# Not automake and no support for out of tree
> +#B_pn-libnewt =3D "${SEPB}"
> +B_pn-libnfsidmap =3D "${SEPB}"
> +# flex.real: could not create route/cls/ematch_grammar.c
> +#B_pn-libnl =3D "${SEPB}"
> +B_pn-libnss-mdns =3D "${SEPB}"
> +B_pn-libogg =3D "${SEPB}"
> +B_pn-liboil =3D "${SEPB}"
> +B_pn-libomxil =3D "${SEPB}"
> +B_pn-libowl =3D "${SEPB}"
> +B_pn-libowl-av =3D "${SEPB}"
> +B_pn-libpam =3D "${SEPB}"
> +B_pn-libpcap =3D "${SEPB}"
> +B_pn-libpciaccess =3D "${SEPB}"
> +B_pn-libpcre =3D "${SEPB}"
> +B_pn-libpcre-native =3D "${SEPB}"
> +B_pn-libpng =3D "${SEPB}"
> +B_pn-libpng-native =3D "${SEPB}"
> +#B_pn-libproxy =3D "${SEPB}"
> +B_pn-libpthread-stubs =3D "${SEPB}"
> +B_pn-libpthread-stubs-native =3D "${SEPB}"
> +B_pn-librsvg =3D "${SEPB}"
> +B_pn-librsvg-native =3D "${SEPB}"
> +B_pn-libsamplerate0 =3D "${SEPB}"
> +B_pn-libsdl =3D "${SEPB}"
> +B_pn-libsm =3D "${SEPB}"
> +B_pn-libsm-native =3D "${SEPB}"
> +B_pn-libsndfile1 =3D "${SEPB}"
> +B_pn-libsoup-2.4 =3D "${SEPB}"
> +B_pn-libtasn1 =3D "${SEPB}"
> +B_pn-libtasn1-native =3D "${SEPB}"
> +B_pn-libtelepathy =3D "${SEPB}"
> +B_pn-libtheora =3D "${SEPB}"
> +B_pn-libtirpc =3D "${SEPB}"
> +B_pn-libtool =3D "${SEPB}"
> +B_pn-libtool-cross =3D "${SEPB}"
> +B_pn-libtool-native =3D "${SEPB}"
> +B_pn-libunique =3D "${SEPB}"
> +B_pn-libunistring =3D "${SEPB}"
> +B_pn-libunistring-native =3D "${SEPB}"
> +B_pn-liburcu =3D "${SEPB}"
> +B_pn-libusb1 =3D "${SEPB}"
> +B_pn-libusb1-native =3D "${SEPB}"
> +B_pn-libusb-compat =3D "${SEPB}"
> +B_pn-libusb-compat-native =3D "${SEPB}"
> +B_pn-libuser =3D "${SEPB}"
> +B_pn-libva-intel-driver =3D "${SEPB}"
> +B_pn-libvorbis =3D "${SEPB}"
> +B_pn-libx11 =3D "${SEPB}"
> +B_pn-libx11-diet =3D "${SEPB}"
> +B_pn-libx11-native =3D "${SEPB}"
> +B_pn-libxau =3D "${SEPB}"
> +B_pn-libxau-native =3D "${SEPB}"
> +B_pn-libxcalibrate =3D "${SEPB}"
> +B_pn-libxcb =3D "${SEPB}"
> +B_pn-libxcb-native =3D "${SEPB}"
> +B_pn-libxcomposite =3D "${SEPB}"
> +B_pn-libxcomposite-native =3D "${SEPB}"
> +B_pn-libxcursor =3D "${SEPB}"
> +B_pn-libxcursor-native =3D "${SEPB}"
> +B_pn-libxdamage =3D "${SEPB}"
> +B_pn-libxdamage-native =3D "${SEPB}"
> +B_pn-libxdmcp =3D "${SEPB}"
> +B_pn-libxdmcp-native =3D "${SEPB}"
> +B_pn-libxext =3D "${SEPB}"
> +B_pn-libxext-native =3D "${SEPB}"
> +B_pn-libxfixes =3D "${SEPB}"
> +B_pn-libxfixes-native =3D "${SEPB}"
> +B_pn-libxfont =3D "${SEPB}"
> +B_pn-libxfont-native =3D "${SEPB}"
> +B_pn-libxft =3D "${SEPB}"
> +B_pn-libxft-native =3D "${SEPB}"
> +B_pn-libxi =3D "${SEPB}"
> +B_pn-libxinerama =3D "${SEPB}"
> +B_pn-libxkbcommon =3D "${SEPB}"
> +B_pn-libxkbfile =3D "${SEPB}"
> +B_pn-libxkbfile-native =3D "${SEPB}"
> +B_pn-libxml2 =3D "${SEPB}"
> +B_pn-libxml2-native =3D "${SEPB}"
> +B_pn-libxmu =3D "${SEPB}"
> +B_pn-libxmu-native =3D "${SEPB}"
> +B_pn-libxpm =3D "${SEPB}"
> +B_pn-libxpm-native =3D "${SEPB}"
> +B_pn-libxrandr =3D "${SEPB}"
> +B_pn-libxrandr-native =3D "${SEPB}"
> +B_pn-libxrender =3D "${SEPB}"
> +B_pn-libxrender-native =3D "${SEPB}"
> +B_pn-libxres =3D "${SEPB}"
> +B_pn-libxscrnsaver =3D "${SEPB}"
> +B_pn-libxsettings-client =3D "${SEPB}"
> +B_pn-libxslt =3D "${SEPB}"
> +B_pn-libxslt-native =3D "${SEPB}"
> +B_pn-libxt =3D "${SEPB}"
> +B_pn-libxt-native =3D "${SEPB}"
> +B_pn-libxtst =3D "${SEPB}"
> +B_pn-libxv =3D "${SEPB}"
> +B_pn-libxvmc =3D "${SEPB}"
> +B_pn-libxxf86dga =3D "${SEPB}"
> +B_pn-libxxf86misc =3D "${SEPB}"
> +B_pn-libxxf86vm =3D "${SEPB}"
> +B_pn-lighttpd =3D "${SEPB}"
> +# Doesn't use automake so no separate build support
> +#B_pn-linuxdoc-tools-native =3D "${SEPB}"
> +B_pn-lrzsz =3D "${SEPB}"
> +# Doesn't use automake
> +#B_pn-ltp =3D "${SEPB}"
> +##/media/build1/poky/build1/tmp/work/i586-poky-linux/lttng-tools/v2.1.0-=
r0/git/tests/tools/health/health_check.c:20:25: fatal error: lttng/lttng.h:=
 No such file or directory
> +##B_pn-lttng-tools =3D "${SEPB}"
> +B_pn-lttng-ust =3D "${SEPB}"
> +B_pn-lzo =3D "${SEPB}"
> +B_pn-lzo-native =3D "${SEPB}"
> +B_pn-lzop =3D "${SEPB}"
> +B_pn-lzop-native =3D "${SEPB}"
> +B_pn-m4 =3D "${SEPB}"
> +B_pn-m4-native =3D "${SEPB}"
> +# Makefile only, no out of tree support
> +#B_pn-mailx =3D "${SEPB}"
> +B_pn-make =3D "${SEPB}"
> +B_pn-makedepend =3D "${SEPB}"
> +B_pn-makedepend-native =3D "${SEPB}"
> +B_pn-make-native =3D "${SEPB}"
> +B_pn-matchbox-config-gtk =3D "${SEPB}"
> +B_pn-matchbox-desktop =3D "${SEPB}"
> +B_pn-matchbox-desktop-sato =3D "${SEPB}"
> +B_pn-matchbox-keyboard =3D "${SEPB}"
> +B_pn-matchbox-panel-2 =3D "${SEPB}"
> +B_pn-matchbox-terminal =3D "${SEPB}"
> +B_pn-matchbox-theme-sato =3D "${SEPB}"
> +B_pn-matchbox-wm =3D "${SEPB}"
> +B_pn-mc =3D "${SEPB}"
> +#makefile only, no out of tree support
> +#B_pn-mdadm =3D "${SEPB}"
> +B_pn-menu-cache =3D "${SEPB}"
> +B_pn-mesa-demos =3D "${SEPB}"
> +# src/mapi/mapi/stub.c:51:39: error: 'MAPI_TABLE_NUM_DYNAMIC' undeclared=
 here (not in a function)
> +#B_pn-mesa-dri =3D "${SEPB}"
> +B_pn-minicom =3D "${SEPB}"
> +# Not automake, no external tree support
> +#B_pn-mkelfimage =3D "${SEPB}"
> +#B_pn-mkelfimage-native =3D "${SEPB}"
> +B_pn-mkfontdir =3D "${SEPB}"
> +B_pn-mkfontdir-native =3D "${SEPB}"
> +B_pn-mkfontscale =3D "${SEPB}"
> +B_pn-mkfontscale-native =3D "${SEPB}"
> +B_pn-mklibs-native =3D "${SEPB}"
> +B_pn-mktemp =3D "${SEPB}"
> +B_pn-mobile-broadband-provider-info =3D "${SEPB}"
> +B_pn-mpeg2dec =3D "${SEPB}"
> +B_pn-mpfr =3D "${SEPB}"
> +B_pn-mpfr-native =3D "${SEPB}"
> +B_pn-msmtp =3D "${SEPB}"
> +B_pn-mtdev =3D "${SEPB}"
> +B_pn-mtools =3D "${SEPB}"
> +B_pn-mtools-native =3D "${SEPB}"
> +B_pn-mx =3D "${SEPB}"
> +B_pn-mxsldr =3D "${SEPB}"
> +B_pn-mxsldr-native =3D "${SEPB}"
> +# /media/build1/poky/build1/tmp/work/x86_64-linux/nasm-native/2.10.07-r0=
/nasm-2.10.07/compiler.h:47:21: fatal error: config.h: No such file or dire=
ctory
> +#B_pn-nasm =3D "${SEPB}"
> +#B_pn-nasm-native =3D "${SEPB}"
> +B_pn-nativesdk-alsa-lib =3D "${SEPB}"
> +B_pn-nativesdk-autoconf =3D "${SEPB}"
> +B_pn-nativesdk-automake =3D "${SEPB}"
> +B_pn-nativesdk-bash =3D "${SEPB}"
> +B_pn-nativesdk-bdwgc =3D "${SEPB}"
> +B_pn-nativesdk-bigreqsproto =3D "${SEPB}"
> +B_pn-nativesdk-bison =3D "${SEPB}"
> +B_pn-nativesdk-bzip2 =3D "${SEPB}"
> +B_pn-nativesdk-chrpath =3D "${SEPB}"
> +B_pn-nativesdk-cmake =3D "${SEPB}"
> +B_pn-nativesdk-curl =3D "${SEPB}"
> +B_pn-nativesdk-db =3D "${SEPB}"
> +B_pn-nativesdk-dbus =3D "${SEPB}"
> +## Makefile based not autotools
> +##B_pn-nativesdk-dtc =3D "${SEPB}"
> +B_pn-nativesdk-eglibc =3D "${SEPB}"
> +B_pn-nativesdk-eglibc-initial =3D "${SEPB}"
> +B_pn-nativesdk-elfutils =3D "${SEPB}"
> +B_pn-nativesdk-expat =3D "${SEPB}"
> +B_pn-nativesdk-fixesproto =3D "${SEPB}"
> +B_pn-nativesdk-flex =3D "${SEPB}"
> +B_pn-nativesdk-gcc-runtime =3D "${SEPB}"
> +B_pn-nativesdk-gdbm =3D "${SEPB}"
> +B_pn-nativesdk-genext2fs =3D "${SEPB}"
> +B_pn-nativesdk-gettext =3D "${SEPB}"
> +B_pn-nativesdk-glib-2.0 =3D "${SEPB}"
> +B_pn-nativesdk-glproto =3D "${SEPB}"
> +B_pn-nativesdk-gmp =3D "${SEPB}"
> +B_pn-nativesdk-inputproto =3D "${SEPB}"
> +B_pn-nativesdk-kbproto =3D "${SEPB}"
> +#B_pn-nativesdk-libarchive =3D "${SEPB}"
> +B_pn-nativesdk-libffi =3D "${SEPB}"
> +B_pn-nativesdk-libgcc =3D "${SEPB}"
> +B_pn-nativesdk-libmpc =3D "${SEPB}"
> +B_pn-nativesdk-libpcre =3D "${SEPB}"
> +B_pn-nativesdk-libpng =3D "${SEPB}"
> +B_pn-nativesdk-libpthread-stubs =3D "${SEPB}"
> +B_pn-nativesdk-libsdl =3D "${SEPB}"
> +B_pn-nativesdk-libtool =3D "${SEPB}"
> +B_pn-nativesdk-libunistring =3D "${SEPB}"
> +B_pn-nativesdk-libusb1 =3D "${SEPB}"
> +B_pn-nativesdk-libusb-compat =3D "${SEPB}"
> +B_pn-nativesdk-libx11 =3D "${SEPB}"
> +B_pn-nativesdk-libxau =3D "${SEPB}"
> +B_pn-nativesdk-libxcb =3D "${SEPB}"
> +B_pn-nativesdk-libxdmcp =3D "${SEPB}"
> +B_pn-nativesdk-libxext =3D "${SEPB}"
> +B_pn-nativesdk-libxfixes =3D "${SEPB}"
> +B_pn-nativesdk-libxml2 =3D "${SEPB}"
> +B_pn-nativesdk-libxrandr =3D "${SEPB}"
> +B_pn-nativesdk-libxrender =3D "${SEPB}"
> +B_pn-nativesdk-lzo =3D "${SEPB}"
> +B_pn-nativesdk-lzop =3D "${SEPB}"
> +B_pn-nativesdk-m4 =3D "${SEPB}"
> +B_pn-nativesdk-mpfr =3D "${SEPB}"
> +B_pn-nativesdk-mxsldr =3D "${SEPB}"
> +B_pn-nativesdk-ncurses =3D "${SEPB}"
> +B_pn-nativesdk-opkg =3D "${SEPB}"
> +B_pn-nativesdk-pixman =3D "${SEPB}"
> +B_pn-nativesdk-pkgconfig =3D "${SEPB}"
> +# run.do_compile: 89: cd: can't cd to Lib/plat-linux2
> +#B_pn-nativesdk-python =3D "${SEPB}"
> +##B_pn-nativesdk-qemu =3D "${SEPB}"
> +B_pn-nativesdk-randrproto =3D "${SEPB}"
> +B_pn-nativesdk-readline =3D "${SEPB}"
> +B_pn-nativesdk-renderproto =3D "${SEPB}"
> +B_pn-nativesdk-sqlite3 =3D "${SEPB}"
> +B_pn-nativesdk-systemtap =3D "${SEPB}"
> +# Not automake, no out of tree build support
> +#B_pn-nativesdk-unfs-server =3D "${SEPB}"
> +B_pn-nativesdk-util-macros =3D "${SEPB}"
> +B_pn-nativesdk-xcb-proto =3D "${SEPB}"
> +B_pn-nativesdk-xcmiscproto =3D "${SEPB}"
> +B_pn-nativesdk-xextproto =3D "${SEPB}"
> +B_pn-nativesdk-xproto =3D "${SEPB}"
> +B_pn-nativesdk-xtrans =3D "${SEPB}"
> +B_pn-ncurses =3D "${SEPB}"
> +B_pn-ncurses-native =3D "${SEPB}"
> +B_pn-neon =3D "${SEPB}"
> +B_pn-neon-native =3D "${SEPB}"
> +##Weird as configure exits with error code despite apparent success
> +##B_pn-nfs-utils =3D "${SEPB}"
> +B_pn-npth =3D "${SEPB}"
> +#B_pn-nspr =3D "${SEPB}"
> +B_pn-ofono =3D "${SEPB}"
> +B_pn-oh-puzzles =3D "${SEPB}"
> +## make[2]: openjade-1.3.2/grove/../Makefile.comm: No such file or direc=
tory
> +##B_pn-openjade-native =3D "${SEPB}"
> +B_pn-opensp =3D "${SEPB}"
> +B_pn-opensp-native =3D "${SEPB}"
> +##/media/build1/poky/build1/tmp/work/i586-poky-linux/openssh/6.1p1-r0/op=
enssh-6.1p1/configure: line 5674: syntax error near unexpected token `-Wall'
> +##/media/build1/poky/build1/tmp/work/i586-poky-linux/openssh/6.1p1-r0/op=
enssh-6.1p1/configure: line 5674: `	OSSH_CHECK_CFLAG_COMPILE(-Wall)'
> +##Configure failed. The contents of all config.log files follows to aid =
debugging
> +#B_pn-openssh =3D "${SEPB}"
> +B_pn-openvpn =3D "${SEPB}"
> +B_pn-opkg =3D "${SEPB}"
> +B_pn-opkg-native =3D "${SEPB}"
> +#B_pn-oprofile =3D "${SEPB}"
> +B_pn-oprofileui =3D "${SEPB}"
> +B_pn-oprofileui-server =3D "${SEPB}"
> +B_pn-ossp-uuid =3D "${SEPB}"
> +B_pn-ossp-uuid-native =3D "${SEPB}"
> +B_pn-owl-video =3D "${SEPB}"
> +B_pn-pango =3D "${SEPB}"
> +B_pn-pango-native =3D "${SEPB}"
> +B_pn-parted =3D "${SEPB}"
> +B_pn-parted-native =3D "${SEPB}"
> +B_pn-patch =3D "${SEPB}"
> +B_pn-pax =3D "${SEPB}"
> +B_pn-pcmanfm =3D "${SEPB}"
> +B_pn-pixman =3D "${SEPB}"
> +B_pn-pixman-native =3D "${SEPB}"
> +B_pn-pkgconfig =3D "${SEPB}"
> +B_pn-pkgconfig-native =3D "${SEPB}"
> +B_pn-pm-utils =3D "${SEPB}"
> +B_pn-polkit =3D "${SEPB}"
> +B_pn-polkit-gnome =3D "${SEPB}"
> +B_pn-popt =3D "${SEPB}"
> +B_pn-popt-native =3D "${SEPB}"
> +#B_pn-ppp =3D "${SEPB}"
> +B_pn-prelink =3D "${SEPB}"
> +B_pn-prelink-native =3D "${SEPB}"
> +# Makefile only, no out of tree support
> +#B_pn-procps =3D "${SEPB}"
> +B_pn-psmisc =3D "${SEPB}"
> +B_pn-psplash =3D "${SEPB}"
> +B_pn-pth =3D "${SEPB}"
> +B_pn-pulseaudio =3D "${SEPB}"
> +#B_pn-python =3D "${SEPB}"
> +B_pn-python-dbus =3D "${SEPB}"
> +B_pn-python-gst =3D "${SEPB}"
> +B_pn-python-native =3D "${SEPB}"
> +B_pn-python-pygobject =3D "${SEPB}"
> +B_pn-python-pygobject-native =3D "${SEPB}"
> +B_pn-python-pygtk =3D "${SEPB}"
> +## Not autotools
> +##B_pn-qemu =3D "${SEPB}"
> +##B_pn-qemu-native =3D "${SEPB}"
> +##| /bin/bash: ./git-desc: No such file or directory
> +##| /usr/bin/find: `compat': No such file or directory
> +##| /bin/bash: /media/build1/poky/build1/tmp/work/x86_64-linux/quilt-nat=
ive/0.60-r0/build/test/test.quiltrc: No such file or directory
> +##| make: *** No rule to make target `Makefile.in', needed by `Makefile'=
=2E  Stop.
> +##B_pn-quilt =3D "${SEPB}"
> +##B_pn-quilt-native =3D "${SEPB}"
> +#B_pn-quota =3D "${SEPB}"
> +B_pn-randrproto =3D "${SEPB}"
> +B_pn-randrproto-native =3D "${SEPB}"
> +B_pn-readline =3D "${SEPB}"
> +B_pn-readline-native =3D "${SEPB}"
> +B_pn-recordproto =3D "${SEPB}"
> +B_pn-remake =3D "${SEPB}"
> +B_pn-remake-native =3D "${SEPB}"
> +B_pn-renderproto =3D "${SEPB}"
> +B_pn-renderproto-native =3D "${SEPB}"
> +B_pn-resourceproto =3D "${SEPB}"
> +B_pn-rgb =3D "${SEPB}"
> +B_pn-rpcbind =3D "${SEPB}"
> +B_pn-rpm =3D "${SEPB}"
> +B_pn-rpm-native =3D "${SEPB}"
> +B_pn-rsync =3D "${SEPB}"
> +B_pn-rxvt-unicode =3D "${SEPB}"
> +B_pn-sato-icon-theme =3D "${SEPB}"
> +B_pn-sato-screenshot =3D "${SEPB}"
> +B_pn-sbc =3D "${SEPB}"
> +B_pn-screen =3D "${SEPB}"
> +B_pn-scrnsaverproto =3D "${SEPB}"
> +B_pn-sed =3D "${SEPB}"
> +B_pn-sed-native =3D "${SEPB}"
> +# Wierd out of tree support, could probably be fixed
> +#i586-poky-linux-gcc: error: setserial.c: No such file or directory
> +#i586-poky-linux-gcc: fatal error: no input files
> +#compilation terminated.
> +#B_pn-setserial =3D "${SEPB}"
> +B_pn-settings-daemon =3D "${SEPB}"
> +B_pn-sgml-common =3D "${SEPB}"
> +B_pn-sgml-common-native =3D "${SEPB}"
> +B_pn-shadow =3D "${SEPB}"
> +B_pn-shadow-native =3D "${SEPB}"
> +B_pn-shared-mime-info =3D "${SEPB}"
> +B_pn-shared-mime-info-native =3D "${SEPB}"
> +##configure: error: "This software does not support configuring from ano=
ther directory.   See the INSTALL file"
> +##B_pn-slang =3D "${SEPB}"
> +B_pn-socat =3D "${SEPB}"
> +B_pn-speex =3D "${SEPB}"
> +B_pn-sqlite3 =3D "${SEPB}"
> +B_pn-sqlite3-native =3D "${SEPB}"
> +B_pn-startup-notification =3D "${SEPB}"
> +B_pn-strace =3D "${SEPB}"
> +B_pn-strace-native =3D "${SEPB}"
> +B_pn-subversion =3D "${SEPB}"
> +B_pn-subversion-native =3D "${SEPB}"
> +B_pn-sudo =3D "${SEPB}"
> +B_pn-sysfsutils =3D "${SEPB}"
> +B_pn-sysprof =3D "${SEPB}"
> +# No automake, no separate build support
> +#B_pn-sysstat =3D "${SEPB}"
> +B_pn-systemtap =3D "${SEPB}"
> +B_pn-systemtap-native =3D "${SEPB}"
> +B_pn-tar =3D "${SEPB}"
> +B_pn-tar-replacement-native =3D "${SEPB}"
> +B_pn-tcl =3D "${SEPB}"
> +B_pn-tcl-native =3D "${SEPB}"
> +B_pn-telepathy-glib =3D "${SEPB}"
> +B_pn-telepathy-idle =3D "${SEPB}"
> +B_pn-telepathy-mission-control =3D "${SEPB}"
> +B_pn-telepathy-python =3D "${SEPB}"
> +B_pn-texi2html =3D "${SEPB}"
> +B_pn-texinfo =3D "${SEPB}"
> +B_pn-texinfo-native =3D "${SEPB}"
> +B_pn-tiff =3D "${SEPB}"
> +B_pn-tiff-native =3D "${SEPB}"
> +B_pn-time =3D "${SEPB}"
> +B_pn-tremor =3D "${SEPB}"
> +B_pn-tslib =3D "${SEPB}"
> +B_pn-udev =3D "${SEPB}"
> +# Not automake, no out of tree build support
> +#B_pn-unfs-server-native =3D "${SEPB}"
> +B_pn-usbutils =3D "${SEPB}"
> +B_pn-util-linux =3D "${SEPB}"
> +B_pn-util-linux-native =3D "${SEPB}"
> +B_pn-util-macros =3D "${SEPB}"
> +B_pn-util-macros-native =3D "${SEPB}"
> +B_pn-valgrind =3D "${SEPB}"
> +B_pn-videoproto =3D "${SEPB}"
> +B_pn-vte =3D "${SEPB}"
> +B_pn-watchdog =3D "${SEPB}"
> +B_pn-wayland =3D "${SEPB}"
> +B_pn-wayland-native =3D "${SEPB}"
> +# Not even going there
> +#B_pn-webkit-gtk =3D "${SEPB}"
> +B_pn-web-webkit =3D "${SEPB}"
> +B_pn-weston =3D "${SEPB}"
> +B_pn-wget =3D "${SEPB}"
> +B_pn-which =3D "${SEPB}"
> +B_pn-x11perf =3D "${SEPB}"
> +#B_pn-x11vnc =3D "${SEPB}"
> +B_pn-xauth =3D "${SEPB}"
> +B_pn-xcb-proto =3D "${SEPB}"
> +B_pn-xcb-proto-native =3D "${SEPB}"
> +B_pn-xcb-util =3D "${SEPB}"
> +B_pn-xcb-util-image =3D "${SEPB}"
> +B_pn-xcb-util-keysyms =3D "${SEPB}"
> +B_pn-xcb-util-renderutil =3D "${SEPB}"
> +B_pn-xcb-util-wm =3D "${SEPB}"
> +B_pn-xcmiscproto =3D "${SEPB}"
> +B_pn-xcmiscproto-native =3D "${SEPB}"
> +B_pn-xcursor-transparent-theme =3D "${SEPB}"
> +# No out of tree support, no automake
> +#/usr/bin/install: cannot stat `xdg-desktop-menu': No such file or direc=
tory
> +#/usr/bin/install: cannot stat `xdg-desktop-icon': No such file or direc=
tory
> +#/usr/bin/install: cannot stat `xdg-mime': No such file or directory
> +#/usr/bin/install: cannot stat `xdg-icon-resource': No such file or dire=
ctory
> +#/usr/bin/install: cannot stat `xdg-open': No such file or directory
> +#/usr/bin/install: cannot stat `xdg-email': No such file or directory
> +#/usr/bin/install: cannot stat `xdg-screensaver': No such file or direct=
ory
> +#make[1]: *** [install] Error 1
> +#Probably fixable
> +#B_pn-xdg-utils =3D "${SEPB}"
> +B_pn-xdpyinfo =3D "${SEPB}"
> +B_pn-xev =3D "${SEPB}"
> +B_pn-xextproto =3D "${SEPB}"
> +B_pn-xextproto-native =3D "${SEPB}"
> +B_pn-xeyes =3D "${SEPB}"
> +B_pn-xf86dgaproto =3D "${SEPB}"
> +B_pn-xf86driproto =3D "${SEPB}"
> +B_pn-xf86-input-evdev =3D "${SEPB}"
> +B_pn-xf86-input-keyboard =3D "${SEPB}"
> +B_pn-xf86-input-mouse =3D "${SEPB}"
> +B_pn-xf86-input-synaptics =3D "${SEPB}"
> +B_pn-xf86-input-vmmouse =3D "${SEPB}"
> +B_pn-xf86miscproto =3D "${SEPB}"
> +B_pn-xf86-video-fbdev =3D "${SEPB}"
> +B_pn-xf86-video-imxfb =3D "${SEPB}"
> +B_pn-xf86-video-intel =3D "${SEPB}"
> +B_pn-xf86-video-mga =3D "${SEPB}"
> +B_pn-xf86-video-modesetting =3D "${SEPB}"
> +B_pn-xf86-video-omap =3D "${SEPB}"
> +B_pn-xf86-video-omapfb =3D "${SEPB}"
> +B_pn-xf86-video-vesa =3D "${SEPB}"
> +B_pn-xf86-video-vmware =3D "${SEPB}"
> +B_pn-xf86vidmodeproto =3D "${SEPB}"
> +B_pn-xhost =3D "${SEPB}"
> +B_pn-xineramaproto =3D "${SEPB}"
> +B_pn-xinetd =3D "${SEPB}"
> +B_pn-xinit =3D "${SEPB}"
> +B_pn-xinput =3D "${SEPB}"
> +B_pn-xkbcomp =3D "${SEPB}"
> +B_pn-xkbcomp-native =3D "${SEPB}"
> +B_pn-xkeyboard-config =3D "${SEPB}"
> +B_pn-xmodmap =3D "${SEPB}"
> +B_pn-xorg-cf-files =3D "${SEPB}"
> +B_pn-xorg-cf-files-native =3D "${SEPB}"
> +B_pn-xprop =3D "${SEPB}"
> +B_pn-xproto =3D "${SEPB}"
> +B_pn-xproto-native =3D "${SEPB}"
> +B_pn-xrandr =3D "${SEPB}"
> +B_pn-xrestop =3D "${SEPB}"
> +B_pn-xserver-xorg =3D "${SEPB}"
> +B_pn-xset =3D "${SEPB}"
> +B_pn-xtrans =3D "${SEPB}"
> +B_pn-xtrans-native =3D "${SEPB}"
> +B_pn-xtscal =3D "${SEPB}"
> +B_pn-xvideo-tests =3D "${SEPB}"
> +B_pn-xvinfo =3D "${SEPB}"
> +B_pn-xwininfo =3D "${SEPB}"
> +B_pn-xz =3D "${SEPB}"
> +B_pn-xz-native =3D "${SEPB}"
> +B_pn-yasm =3D "${SEPB}"
> +B_pn-yasm-native =3D "${SEPB}"
> +B_pn-zaurusd =3D "${SEPB}"
> +
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

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFLcoAACgkQN1Ujt2V2gBwQpQCguobxcoACinPFu3fWgvwdsdFu
46AAnj2vN0uU37C9vAGSxY4wCxoZYYjX
=R9n1
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
