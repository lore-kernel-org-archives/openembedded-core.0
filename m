Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 00AD171ABD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 13:43:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id 21F15260B71
Message-ID: <1506778986.9509.1.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 30 Sep 2017 15:43:06 +0200
In-Reply-To: <CAJTo0LZ+FcABO+WPvQ10qQHuJ8QQzYYbwBbNHMQGEJC3vn62hw@mail.gmail.com>
References: <1506614485-31675-1-git-send-email-fabien.lahoudere@collabora.co.uk>
	<1506614485-31675-2-git-send-email-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LZ+FcABO+WPvQ10qQHuJ8QQzYYbwBbNHMQGEJC3vn62hw@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/3] wayland: Fix installation patch issue
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
X-List-Received-Date: Sat, 30 Sep 2017 13:43:09 -0000
Content-Type: multipart/alternative; boundary="=-kahGRlqp3Ll0WCn/3xBq"

--=-kahGRlqp3Ll0WCn/3xBq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-09-29 at 11:32 +0100, Burton, Ross wrote:
> With xserver-xorg I get:
> | make[2]: *** No rule to make target '//usr/share/wayland-protocols/unstable/relative-
> pointer/relative-pointer-unstable-v1.xml', needed by 'relative-pointer-unstable-v1-client-
> protocol.h'.  Stop.
> 
> (in the xwayland directory)
> 

I am really  surprised, I succeed to build core-image-weston which contains xserver-xorg and
xserver-xorg-xwayland on a host where wayland is not installed.
$ ls /usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xmlls:
cannot access /usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-
v1.xml: No such file or directory$
Do you have something specific in your setup to help me to reproduce?
Thanks
Fabien
> Ross
> On 28 September 2017 at 17:01, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk> wrote:
> > This patch modify the way we manage wayland path issues.
> > 
> > Instead of patching each recipe to make it work with wayland and its protocols,
> > 
> > it is better to patch wayland to fix its path issues.
> > 
> > 
> > 
> > So wayland-scanner.pc, wayland-client.pc and wayland-protocols.pc are patched to change paths.
> > 
> > 
> > 
> > Then we can drop the following workaround:
> > 
> > 
> > 
> > WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}
> > 
> > 
> > 
> > in:
> > 
> > 
> > 
> > - gtk+3
> > 
> > - libsdl2
> > 
> > - xserver-xorg
> > 
> > - gstreamer1.0-plugins-bad
> > 
> > - weston-2.0.0
> > 
> > 
> > 
> > We also dropped libsdl2 patches which fix wayland paths.
> > 
> > 
> > 
> > Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > 
> > ---
> > 
> >  meta/recipes-gnome/gtk+/gtk+3.inc                  |  1 -
> > 
> >  ...-sysroot-path-so-that-make-finds-our-wayl.patch | 34 ----------------------
> > 
> >  ...void-finding-build-host-s-wayland-scanner.patch | 31 --------------------
> > 
> >  meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  4 +--
> > 
> >  .../usesysrootprefixforpkgdatadirvariable.patch    | 27 +++++++++++++++++
> > 
> >  .../wayland/wayland-protocols_1.10.bb              |  1 +
> > 
> >  .../wayland/wayland/fixpathinpcfiles.patch         | 33 +++++++++++++++++++++
> > 
> >  meta/recipes-graphics/wayland/wayland_1.14.0.bb    |  1 +
> > 
> >  meta/recipes-graphics/wayland/weston_2.0.0.bb      |  1 -
> > 
> >  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  1 -
> > 
> >  .../gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb   |  1 -
> > 
> >  11 files changed, 63 insertions(+), 72 deletions(-)
> > 
> >  delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-
> > make-finds-our-wayl.patch
> > 
> >  delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-
> > wayland-scanner.patch
> > 
> >  create mode 100644 meta/recipes-graphics/wayland/wayland-
> > protocols/usesysrootprefixforpkgdatadirvariable.patch
> > 
> >  create mode 100644 meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> > 
> > 
> > 
> > diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> > 
> > index 0a357db..420ead2 100644
> > 
> > --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> > 
> > +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> > 
> > @@ -35,7 +35,6 @@ EXTRA_OECONF += " \
> > 
> >                   --enable-modules \
> > 
> >                   --disable-cups \
> > 
> >                   --disable-colord \
> > 
> > -                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
> > 
> >                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "--disable-gtk-doc", d)} \
> > 
> >                   "
> > 
> > 
> > 
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-
> > finds-our-wayl.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-
> > that-make-finds-our-wayl.patch
> > 
> > deleted file mode 100644
> > 
> > index efc8418..0000000
> > 
> > --- a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-
> > our-wayl.patch
> > 
> > +++ /dev/null
> > 
> > @@ -1,34 +0,0 @@
> > 
> > -From b44808e43130dcd13b43e5b978b9b24aeb4c134c Mon Sep 17 00:00:00 2001
> > 
> > -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> > 
> > -Date: Thu, 20 Oct 2016 14:57:51 +0200
> > 
> > -Subject: [PATCH] prepend our sysroot path so that make finds our
> > 
> > - wayland-protocol files
> > 
> > -MIME-Version: 1.0
> > 
> > -Content-Type: text/plain; charset=UTF-8
> > 
> > -Content-Transfer-Encoding: 8bit
> > 
> > -
> > 
> > -Upstream-Status: Inappropriate [embedded specific]
> > 
> > -
> > 
> > -Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> > 
> > ----
> > 
> > - configure.in | 4 +-
> > 
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > -
> > 
> > -diff --git a/configure.in b/configure.in
> > 
> > -index 726ded3..3376600 100644
> > 
> > ---- a/configure.in
> > 
> > -+++ b/configure.in
> > 
> > -@@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], [QtWayland server
> > support for
> > 
> > -                 WAYLAND_CFLAGS=`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor 
> > xkbcommon`
> > 
> > -                 WAYLAND_LIBS=`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor
> > xkbcommon`
> > 
> > -                 WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
> > 
> > --                WAYLAND_CORE_PROTOCOL_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-client`
> > 
> > --                WAYLAND_PROTOCOLS_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
> > 
> > -+                WAYLAND_CORE_PROTOCOL_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --
> > variable=pkgdatadir wayland-client`
> > 
> > -+                WAYLAND_PROTOCOLS_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --
> > variable=pkgdatadir wayland-protocols`
> > 
> > -                 video_wayland=yes
> > 
> > -             fi
> > 
> > -         fi
> > 
> > ---
> > 
> > -2.5.5
> > 
> > -
> > 
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-
> > scanner.patch b/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-
> > scanner.patch
> > 
> > deleted file mode 100644
> > 
> > index 7837315..0000000
> > 
> > --- a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s-wayland-
> > scanner.patch
> > 
> > +++ /dev/null
> > 
> > @@ -1,31 +0,0 @@
> > 
> > -From ae879091cf65cb70293b375ec7e61ed12a96d8a7 Mon Sep 17 00:00:00 2001
> > 
> > -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> > 
> > -Date: Fri, 2 Dec 2016 09:39:25 +0100
> > 
> > -Subject: [PATCH] Avoid finding build host's wayland-scanner
> > 
> > -MIME-Version: 1.0
> > 
> > -Content-Type: text/plain; charset=UTF-8
> > 
> > -Content-Transfer-Encoding: 8bit
> > 
> > -
> > 
> > -Upstream-Status: Inappropriate [embedded specific]
> > 
> > -
> > 
> > -Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> > 
> > ----
> > 
> > - configure.in | 2 +-
> > 
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > -
> > 
> > -diff --git a/configure.in b/configure.in
> > 
> > -index 3376600..2aa6ed4 100644
> > 
> > ---- a/configure.in
> > 
> > -+++ b/configure.in
> > 
> > -@@ -1204,7 +1204,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], [QtWayland server
> > support for
> > 
> > -             if $PKG_CONFIG --exists wayland-client wayland-scanner wayland-protocols wayland-
> > egl wayland-cursor egl xkbcommon ; then
> > 
> > -                 WAYLAND_CFLAGS=`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor 
> > xkbcommon`
> > 
> > -                 WAYLAND_LIBS=`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor
> > xkbcommon`
> > 
> > --                WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
> > 
> > -+                AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
> > 
> > -                 WAYLAND_CORE_PROTOCOL_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --
> > variable=pkgdatadir wayland-client`
> > 
> > -                 WAYLAND_PROTOCOLS_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --
> > variable=pkgdatadir wayland-protocols`
> > 
> > -                 video_wayland=yes
> > 
> > ---
> > 
> > -2.7.4
> > 
> > -
> > 
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-
> > graphics/libsdl2/libsdl2_2.0.5.bb
> > 
> > index 12d3aaf..032f45b 100644
> > 
> > --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> > 
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> > 
> > @@ -17,8 +17,6 @@ DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> > 'virtu
> > 
> >  SRC_URI = " \
> > 
> >      http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> > 
> >      file://linkage.patch \
> > 
> > -    file://0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch \
> > 
> > -    file://0002-Avoid-finding-build-host-s-wayland-scanner.patch \
> > 
> >      file://fix-build-failure-on-ppc.patch \
> > 
> >  "
> > 
> > 
> > 
> > @@ -35,7 +33,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
> > 
> >                  --enable-pthreads \
> > 
> >                  --enable-sdl-dlopen \
> > 
> >                  --disable-rpath \
> > 
> > -                WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
> > 
> > +                "
> > 
> > 
> > 
> >  # opengl packageconfig factored out to make it easy for distros
> > 
> >  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
> > 
> > diff --git a/meta/recipes-graphics/wayland/wayland-
> > protocols/usesysrootprefixforpkgdatadirvariable.patch b/meta/recipes-graphics/wayland/wayland-
> > protocols/usesysrootprefixforpkgdatadirvariable.patch
> > 
> > new file mode 100644
> > 
> > index 0000000..0922a4d
> > 
> > --- /dev/null
> > 
> > +++ b/meta/recipes-graphics/wayland/wayland-
> > protocols/usesysrootprefixforpkgdatadirvariable.patch
> > 
> > @@ -0,0 +1,27 @@
> > 
> > +From 875130ee3cbcf62266901ef4b91b9a0fb6adad43 Mon Sep 17 00:00:00 2001
> > 
> > +From: Tomek Bury <tomek.bury@broadcom.com>
> > 
> > +Date: Fri, 4 Aug 2017 16:16:38 +0100
> > 
> > +Subject: Use sysroot prefix for pkgdatadir variable
> > 
> > +
> > 
> > +The pc_sysroot is automatically added to cflags and libs but not
> > 
> > +to 'pkg-config --variable'
> > 
> > +
> > 
> > +Upstream-Status: Backport [https://cgit.freedesktop.org/wayland/wayland-protocols/commit/?id=87
> > 5130ee3cbcf62266901ef4b91b9a0fb6adad43]
> > 
> > +
> > 
> > +Reviewed-by: Daniel Stone <daniels@collabora.com>
> > 
> > +
> > 
> > +diff --git a/wayland-protocols.pc.in b/wayland-protocols.pc.in
> > 
> > +index a26744c..379be06 100644
> > 
> > +--- a/wayland-protocols.pc.in
> > 
> > ++++ b/wayland-protocols.pc.in
> > 
> > +@@ -1,6 +1,6 @@
> > 
> > + prefix=@prefix@
> > 
> > + datarootdir=@datarootdir@
> > 
> > +-pkgdatadir=@datadir@/@PACKAGE@
> > 
> > ++pkgdatadir=${pc_sysrootdir}@datadir@/@PACKAGE@
> > 
> > +
> > 
> > + Name: Wayland Protocols
> > 
> > + Description: Wayland protocol files
> > 
> > +--
> > 
> > +cgit v0.10.2
> > 
> > +
> > 
> > diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb b/meta/recipes-
> > graphics/wayland/wayland-protocols_1.10.bb
> > 
> > index 4f9e9f3..1ff12c6 100644
> > 
> > --- a/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> > 
> > +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.10.bb
> > 
> > @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
> > 
> >                      file://stable/presentation-time/presentation-
> > time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
> > 
> > 
> > 
> >  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> > 
> > +          file://usesysrootprefixforpkgdatadirvariable.patch \
> > 
> >             "
> > 
> >  SRC_URI[md5sum] = "84a7846c2b6a6a3e265fc9be36453e60"
> > 
> >  SRC_URI[sha256sum] = "5719c51d7354864983171c5083e93a72ac99229e2b460c4bb10513de08839c0a"
> > 
> > diff --git a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch b/meta/recipes-
> > graphics/wayland/wayland/fixpathinpcfiles.patch
> > 
> > new file mode 100644
> > 
> > index 0000000..9fb1252
> > 
> > --- /dev/null
> > 
> > +++ b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> > 
> > @@ -0,0 +1,33 @@
> > 
> > +Fix wayland-client and wayland-scanner pc files
> > 
> > +
> > 
> > +Upstream-Status: Pending
> > 
> > +
> > 
> > +Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > 
> > +
> > 
> > +Index: wayland-1.14.0/src/wayland-client.pc.in
> > 
> > +===================================================================
> > 
> > +--- wayland-1.14.0.orig/src/wayland-client.pc.in
> > 
> > ++++ wayland-1.14.0/src/wayland-client.pc.in
> > 
> > +@@ -1,7 +1,7 @@
> > 
> > + prefix=@prefix@
> > 
> > + exec_prefix=@exec_prefix@
> > 
> > + datarootdir=@datarootdir@
> > 
> > +-pkgdatadir=@datadir@/@PACKAGE@
> > 
> > ++pkgdatadir=${pc_sysrootdir}@datadir@/@PACKAGE@
> > 
> > + libdir=@libdir@
> > 
> > + includedir=@includedir@
> > 
> > +
> > 
> > +Index: wayland-1.14.0/src/wayland-scanner.pc.in
> > 
> > +===================================================================
> > 
> > +--- wayland-1.14.0.orig/src/wayland-scanner.pc.in
> > 
> > ++++ wayland-1.14.0/src/wayland-scanner.pc.in
> > 
> > +@@ -1,8 +1,8 @@
> > 
> > + prefix=@prefix@
> > 
> > + exec_prefix=@exec_prefix@
> > 
> > + datarootdir=@datarootdir@
> > 
> > + pkgdatadir=@datadir@/@PACKAGE@
> > 
> > +-wayland_scanner=@bindir@/wayland-scanner
> > 
> > ++wayland_scanner=wayland-scanner
> > 
> > +
> > 
> > + Name: Wayland Scanner
> > 
> > + Description: Wayland scanner
> > 
> > diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb b/meta/recipes-
> > graphics/wayland/wayland_1.14.0.bb
> > 
> > index 2a2489d..1a9ff98 100644
> > 
> > --- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> > 
> > +++ b/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> > 
> > @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
> > 
> >  DEPENDS = "expat libxml2 libffi wayland-native"
> > 
> > 
> > 
> >  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> > 
> > +          file://fixpathinpcfiles.patch \
> > 
> >             "
> > 
> >  SRC_URI[md5sum] = "0235f6075c32c3be61cff94fa0b9f108"
> > 
> >  SRC_URI[sha256sum] = "ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8"
> > 
> > diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb b/meta/recipes-
> > graphics/wayland/weston_2.0.0.bb
> > 
> > index 54b07bd..8160f55 100644
> > 
> > --- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
> > 
> > +++ b/meta/recipes-graphics/wayland/weston_2.0.0.bb
> > 
> > @@ -25,7 +25,6 @@ DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-
> > native"
> > 
> > 
> > 
> >  EXTRA_OECONF = "--enable-setuid-install \
> > 
> >                  --disable-rdp-compositor \
> > 
> > -                WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
> > 
> >                  "
> > 
> >  EXTRA_OECONF_append_qemux86 = "\
> > 
> >                 WESTON_NATIVE_BACKEND=fbdev-backend.so \
> > 
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-
> > xserver/xserver-xorg.inc
> > 
> > index 863d80c..e8025de 100644
> > 
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > 
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > 
> > @@ -117,7 +117,6 @@ EXTRA_OECONF += "--with-fop=no \
> > 
> >                   --sysconfdir=/etc/X11 \
> > 
> >                   --localstatedir=/var \
> > 
> >                   --with-xkb-output=/var/lib/xkb \
> > 
> > -                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
> > 
> >  "
> > 
> > 
> > 
> >  OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
> > 
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
> > b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
> > 
> > index 8321da0..a83a5ba 100644
> > 
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
> > 
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
> > 
> > @@ -22,5 +22,4 @@ SRC_URI[sha256sum] =
> > "9c2c7edde4f59d74eb414e0701c55131f562e5c605a3ce9b091754f106
> > 
> > 
> > 
> >  S = "${WORKDIR}/gst-plugins-bad-${PV}"
> > 
> > 
> > 
> > -EXTRA_OECONF += "WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
> > 
> > 
> > 
> > --
> > 
> > 1.8.3.1
> > 
> > 
> > 
> > --
> > 
> > _______________________________________________
> > 
> > Openembedded-core mailing list
> > 
> > Openembedded-core@lists.openembedded.org
> > 
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
> > 

--=-kahGRlqp3Ll0WCn/3xBq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Fri, 2017-09-29 at 11:32 +0100, Burton, Ro=
ss wrote:</div><blockquote type=3D"cite"><div dir=3D"ltr">With xserver-xorg=
 I get:<div><br></div><div>| make[2]: *** No rule to make target '//usr/sha=
re/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1=
.xml', needed by 'relative-pointer-unstable-v1-client-protocol.h'.&nbsp; St=
op.<br><div><br></div><div>(in the xwayland directory)</div><div><br></div>=
</div></div></blockquote><div><br></div><div>I am really  surprised, I succ=
eed to build core-image-weston which contains xserver-xorg and xserver-xorg=
-xwayland on a host where wayland is not installed.</div><div><br></div><di=
v>$ ls /usr/share/wayland-protocols/unstable/relative-pointer/relative-poin=
ter-unstable-v1.xml</div><div>ls: cannot access /usr/share/wayland-protocol=
s/unstable/relative-pointer/relative-pointer-unstable-v1.xml: No such file =
or directory</div><div>$</div><div><br></div><div>Do you have something spe=
cific in your setup to help me to reproduce?</div><div><br></div><div>Thank=
s</div><div><br></div><div>Fabien</div><div><br></div><blockquote type=3D"c=
ite"><div dir=3D"ltr"><div><div><br></div><div>Ross</div></div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 28 September 2017 at=
 17:01, Fabien Lahoudere <span dir=3D"ltr">&lt;<a href=3D"mailto:fabien.lah=
oudere@collabora.co.uk" target=3D"_blank">fabien.lahoudere@collabora.co.uk<=
/a>&gt;</span> wrote:<br><blockquote type=3D"cite">This patch modify the wa=
y we manage wayland path issues.<br>
Instead of patching each recipe to make it work with wayland and its protoc=
ols,<br>
it is better to patch wayland to fix its path issues.<br>
<br>
So wayland-scanner.pc, wayland-client.pc and wayland-protocols.pc are patch=
ed to change paths.<br>
<br>
Then we can drop the following workaround:<br>
<br>
WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT}<br>
<br>
in:<br>
<br>
- gtk+3<br>
- libsdl2<br>
- xserver-xorg<br>
- gstreamer1.0-plugins-bad<br>
- weston-2.0.0<br>
<br>
We also dropped libsdl2 patches which fix wayland paths.<br>
<br>
Signed-off-by: Fabien Lahoudere &lt;<a href=3D"mailto:fabien.lahoudere@coll=
abora.co.uk">fabien.lahoudere@collabora.<wbr>co.uk</a>&gt;<br>
---<br>
&nbsp;meta/recipes-gnome/gtk+/gtk+3.inc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 -<br>
&nbsp;...-sysroot-path-so-that-make-finds-our-wayl.patch | 34 -------------=
---------<br>
&nbsp;...void-finding-build-host-s-wayland-scanner.patch | 31 -------------=
-------<br>
&nbsp;meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>libsdl2_2.0.5.bb</a>&nbsp; &nbsp; &n=
bsp;|&nbsp; 4 +--<br>
&nbsp;.../usesysrootprefixforpkgdatadirvariable.patch&nbsp; &nbsp; | 27 +++=
++++++++++++++<br>
&nbsp;.../wayland/<a href=3D"http://wayland-protocols_1.10.bb" rel=3D"noref=
errer" target=3D"_blank">wayland-protocols_<wbr>1.10.bb</a>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 +<br>
&nbsp;.../wayland/wayland/fixpathinpcfiles.patch&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| 33 +++++++++++++++++++++<br>
&nbsp;meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.14.0.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>wayland_1.14.0.bb</a>&nbsp; &nbsp; =
|&nbsp; 1 +<br>
&nbsp;meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>weston_2.0.0.bb</a>&nbsp; &nbsp; &nb=
sp; |&nbsp; 1 -<br>
&nbsp;.../recipes-graphics/xorg-xserver/xserver-xorg.inc |&nbsp; 1 -<br>
&nbsp;.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.12.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-<wbr>plugins-bad_1.12.2.bb=
</a>&nbsp; &nbsp;|&nbsp; 1 -<br>
&nbsp;11 files changed, 63 insertions(+), 72 deletions(-)<br>
&nbsp;delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-prepend=
-our-sysroot-path-so-that-make-finds-our-wayl.patch<br>
&nbsp;delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-f=
inding-build-host-s-wayland-scanner.patch<br>
&nbsp;create mode 100644 meta/recipes-graphics/wayland/wayland-protocols/us=
esysrootprefixforpkgdatadirvariable.patch<br>
&nbsp;create mode 100644 meta/recipes-graphics/wayland/wayland/fixpathinpcf=
iles.patch<br>
<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc<br>
index 0a357db..420ead2 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+3.inc<br>
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc<br>
@@ -35,7 +35,6 @@ EXTRA_OECONF +=3D " \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --enable-mod=
ules \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --disable-cu=
ps \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --disable-co=
lord \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WAYLAND_PROT=
OCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT} \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${@bb.utils.=
contains("DISTRO_FEATURES", "x11", "", "--disable-gtk-doc", d)} \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<br>
<br>
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot=
-path-so-that-make-finds-our-wayl.patch b/meta/recipes-graphics/libsdl2/lib=
sdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch<br>
deleted file mode 100644<br>
index efc8418..0000000<br>
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-s=
o-that-make-finds-our-wayl.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From b44808e43130dcd13b43e5b978b9b24aeb4c134c Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mailto:sc=
hnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
-Date: Thu, 20 Oct 2016 14:57:51 +0200<br>
-Subject: [PATCH] prepend our sysroot path so that make finds our<br>
- wayland-protocol files<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Upstream-Status: Inappropriate [embedded specific]<br>
-<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 4 +-<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"=
_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"noreferre=
r" target=3D"_blank">configure.in</a><br>
-index 726ded3..3376600 100644<br>
---- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-@@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], [Q=
tWayland server support for<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WAYLAND_CFLA=
GS=3D`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcom=
mon`<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WAYLAND_LIBS=
=3D`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`=
<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WAYLAND_SCAN=
NER=3D`$PKG_CONFIG --variable=3Dwayland_scanner wayland-scanner`<br>
--&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WAYLAND_CORE_PROT=
OCOL_DIR=3D`$PKG_CONFIG --variable=3Dpkgdatadir wayland-client`<br>
--&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WAYLAND_PROTOCOLS=
_DIR=3D`$PKG_CONFIG --variable=3Dpkgdatadir wayland-protocols`<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WAYLAND_CORE_PROT=
OCOL_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=3Dpkgdat=
adir wayland-client`<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WAYLAND_PROTOCOLS=
_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=3Dpkgdatadir=
 wayland-protocols`<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;video_waylan=
d=3Dyes<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
---<br>
-2.5.5<br>
-<br>
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build=
-host-s-wayland-scanner.patch b/meta/recipes-graphics/libsdl2/libsdl2/0002-=
Avoid-finding-build-host-s-wayland-scanner.patch<br>
deleted file mode 100644<br>
index 7837315..0000000<br>
--- a/meta/recipes-graphics/libsdl2/libsdl2/0002-Avoid-finding-build-host-s=
-wayland-scanner.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From ae879091cf65cb70293b375ec7e61ed12a96d8a7 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mailto:sc=
hnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
-Date: Fri, 2 Dec 2016 09:39:25 +0100<br>
-Subject: [PATCH] Avoid finding build host's wayland-scanner<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Upstream-Status: Inappropriate [embedded specific]<br>
-<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"=
_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"noreferre=
r" target=3D"_blank">configure.in</a><br>
-index 3376600..2aa6ed4 100644<br>
---- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
-@@ -1204,7 +1204,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], [Q=
tWayland server support for<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if $PKG_CONFIG --exists wa=
yland-client wayland-scanner wayland-protocols wayland-egl wayland-cursor e=
gl xkbcommon ; then<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WAYLAND_CFLA=
GS=3D`$PKG_CONFIG --cflags wayland-client wayland-egl wayland-cursor xkbcom=
mon`<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WAYLAND_LIBS=
=3D`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`=
<br>
--&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WAYLAND_SCANNER=
=3D`$PKG_CONFIG --variable=3Dwayland_scanner wayland-scanner`<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; AC_PATH_PROG([WAY=
LAND_SCANNER], [wayland-scanner])<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WAYLAND_CORE=
_PROTOCOL_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=3Dp=
kgdatadir wayland-client`<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WAYLAND_PROT=
OCOLS_DIR=3D${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=3Dpkgda=
tadir wayland-protocols`<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;video_waylan=
d=3Dyes<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.=
bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a> b/meta/recipe=
s-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libsdl2_2.0.5.bb</a><br>
index 12d3aaf..032f45b 100644<br>
--- a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
+++ b/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
@@ -17,8 +17,6 @@ DEPENDS_class-nativesdk =3D "${@bb.utils.contains('DISTRO=
_FEATURES', 'x11', 'virtu<br>
&nbsp;SRC_URI =3D " \<br>
&nbsp; &nbsp; &nbsp;<a href=3D"http://www.libsdl.org/release/SDL2-${PV}.tar=
.gz" rel=3D"noreferrer" target=3D"_blank">http://www.libsdl.org/release/<wb=
r>SDL2-${PV}.tar.gz</a> \<br>
&nbsp; &nbsp; &nbsp;file://linkage.patch \<br>
-&nbsp; &nbsp; file://0001-prepend-our-sysroot-path-so-that-make-finds-our-=
wayl.patch \<br>
-&nbsp; &nbsp; file://0002-Avoid-finding-build-host-s-wayland-scanner.patch=
 \<br>
&nbsp; &nbsp; &nbsp;file://fix-build-failure-on-ppc.patch \<br>
&nbsp;"<br>
<br>
@@ -35,7 +33,7 @@ EXTRA_OECONF =3D "--disable-oss --disable-esd --disable-a=
rts \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--enable-pthr=
eads \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--enable-sdl-=
dlopen \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--disable-rpa=
th \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WAYLAND_PROTOCOLS_=
SYSROOT_DIR=3D${RECIPE_SYSROOT}"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<br>
<br>
&nbsp;# opengl packageconfig factored out to make it easy for distros<br>
&nbsp;# and BSP layers to pick either (desktop) opengl, gles2, or no GL<br>
diff --git a/meta/recipes-graphics/wayland/wayland-protocols/usesysrootpref=
ixforpkgdatadirvariable.patch b/meta/recipes-graphics/wayland/wayland-proto=
cols/usesysrootprefixforpkgdatadirvariable.patch<br>
new file mode 100644<br>
index 0000000..0922a4d<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/wayland/wayland-protocols/usesysrootprefixforpk=
gdatadirvariable.patch<br>
@@ -0,0 +1,27 @@<br>
+From 875130ee3cbcf62266901ef4b91b9a0fb6adad43 Mon Sep 17 00:00:00 2001<br>
+From: Tomek Bury &lt;<a href=3D"mailto:tomek.bury@broadcom.com">tomek.bury=
@broadcom.com</a>&gt;<br>
+Date: Fri, 4 Aug 2017 16:16:38 +0100<br>
+Subject: Use sysroot prefix for pkgdatadir variable<br>
+<br>
+The pc_sysroot is automatically added to cflags and libs but not<br>
+to 'pkg-config --variable'<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.freedesktop.org/wayland=
/wayland-protocols/commit/?id=3D875130ee3cbcf62266901ef4b91b9a0fb6adad43" r=
el=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/<wbr>wayla=
nd/wayland-protocols/<wbr>commit/?id=3D<wbr>875130ee3cbcf62266901ef4b91b9a<=
wbr>0fb6adad43</a>]<br>
+<br>
+Reviewed-by: Daniel Stone &lt;<a href=3D"mailto:daniels@collabora.com">dan=
iels@collabora.com</a>&gt;<br>
+<br>
+diff --git a/<a href=3D"http://wayland-protocols.pc.in" rel=3D"noreferrer"=
 target=3D"_blank">wayland-protocols.pc.in</a> b/<a href=3D"http://wayland-=
protocols.pc.in" rel=3D"noreferrer" target=3D"_blank">wayland-protocols.pc.=
in</a><br>
+index a26744c..379be06 100644<br>
+--- a/<a href=3D"http://wayland-protocols.pc.in" rel=3D"noreferrer" target=
=3D"_blank">wayland-protocols.pc.in</a><br>
++++ b/<a href=3D"http://wayland-protocols.pc.in" rel=3D"noreferrer" target=
=3D"_blank">wayland-protocols.pc.in</a><br>
+@@ -1,6 +1,6 @@<br>
+ prefix=3D@prefix@<br>
+ datarootdir=3D@datarootdir@<br>
+-pkgdatadir=3D@datadir@/@PACKAGE@<br>
++pkgdatadir=3D${pc_sysrootdir}@datadir@/@PACKAGE@<br>
+<br>
+ Name: Wayland Protocols<br>
+ Description: Wayland protocol files<br>
+--<br>
+cgit v0.10.2<br>
+<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://wayland-protoc=
ols_1.10.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.<wbr>=
10.bb</a> b/meta/recipes-graphics/wayland/<a href=3D"http://wayland-protoco=
ls_1.10.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.<wbr>1=
0.bb</a><br>
index 4f9e9f3..1ff12c6 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://wayland-protocols_1.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.<wbr>10.bb</=
a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://wayland-protocols_1.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">wayland-protocols_1.<wbr>10.bb</=
a><br>
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da38=
ca028ace54aae3d484 \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;file://stable/presentation-time/presentation-time.xml;endline=3D26;md5=3D4=
646cd7d9edc9fa55db941f2d3a7dc53"<br>
<br>
&nbsp;SRC_URI =3D "<a href=3D"https://wayland.freedesktop.org/releases/${BP=
N}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wayland.freed=
esktop.<wbr>org/releases/${BPN}-${PV}.tar.<wbr>xz</a> \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://usesysrootprefixforpkgdatadirvar=
iable.patch \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<br>
&nbsp;SRC_URI[md5sum] =3D "84a7846c2b6a6a3e265fc9be36453e60"<br>
&nbsp;SRC_URI[sha256sum] =3D "5719c51d7354864983171c5083e93a72ac99229e2b460=
c4bb10513de08839c0a"<br>
diff --git a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch b=
/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch<br>
new file mode 100644<br>
index 0000000..9fb1252<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch<br>
@@ -0,0 +1,33 @@<br>
+Fix wayland-client and wayland-scanner pc files<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Fabien Lahoudere &lt;<a href=3D"mailto:fabien.lahoudere@col=
labora.co.uk">fabien.lahoudere@collabora.<wbr>co.uk</a>&gt;<br>
+<br>
+Index: wayland-1.14.0/src/<a href=3D"http://wayland-client.pc.in" rel=3D"n=
oreferrer" target=3D"_blank">wayland-<wbr>client.pc.in</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- wayland-1.14.0.orig/src/<a href=3D"http://wayland-client.pc.in" rel=3D=
"noreferrer" target=3D"_blank">waylan<wbr>d-client.pc.in</a><br>
++++ wayland-1.14.0/src/<a href=3D"http://wayland-client.pc.in" rel=3D"nore=
ferrer" target=3D"_blank">wayland-<wbr>client.pc.in</a><br>
+@@ -1,7 +1,7 @@<br>
+ prefix=3D@prefix@<br>
+ exec_prefix=3D@exec_prefix@<br>
+ datarootdir=3D@datarootdir@<br>
+-pkgdatadir=3D@datadir@/@PACKAGE@<br>
++pkgdatadir=3D${pc_sysrootdir}@datadir@/@PACKAGE@<br>
+ libdir=3D@libdir@<br>
+ includedir=3D@includedir@<br>
+<br>
+Index: wayland-1.14.0/src/<a href=3D"http://wayland-scanner.pc.in" rel=3D"=
noreferrer" target=3D"_blank">wayland-<wbr>scanner.pc.in</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- wayland-1.14.0.orig/src/<a href=3D"http://wayland-scanner.pc.in" rel=
=3D"noreferrer" target=3D"_blank">waylan<wbr>d-scanner.pc.in</a><br>
++++ wayland-1.14.0/src/<a href=3D"http://wayland-scanner.pc.in" rel=3D"nor=
eferrer" target=3D"_blank">wayland-<wbr>scanner.pc.in</a><br>
+@@ -1,8 +1,8 @@<br>
+ prefix=3D@prefix@<br>
+ exec_prefix=3D@exec_prefix@<br>
+ datarootdir=3D@datarootdir@<br>
+ pkgdatadir=3D@datadir@/@PACKAGE@<br>
+-wayland_scanner=3D@bindir@/wayland-scanner<br>
++wayland_scanner=3Dwayland-scanner<br>
+<br>
+ Name: Wayland Scanner<br>
+ Description: Wayland scanner<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.14.0=
.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb</a> b/meta/reci=
pes-graphics/wayland/<a href=3D"http://wayland_1.14.0.bb" rel=3D"noreferrer=
" target=3D"_blank">wayland_1.14.0.bb</a><br>
index 2a2489d..1a9ff98 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.14.0.bb" re=
l=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.14.0.bb" re=
l=3D"noreferrer" target=3D"_blank">wayland_1.14.0.bb</a><br>
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db31d8f53b6aaf2=
b4985d7dd7810a70d1 \<br>
&nbsp;DEPENDS =3D "expat libxml2 libffi wayland-native"<br>
<br>
&nbsp;SRC_URI =3D "<a href=3D"https://wayland.freedesktop.org/releases/${BP=
N}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://wayland.freed=
esktop.<wbr>org/releases/${BPN}-${PV}.tar.<wbr>xz</a> \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://fixpathinpcfiles.patch \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<br>
&nbsp;SRC_URI[md5sum] =3D "0235f6075c32c3be61cff94fa0b9f108"<br>
&nbsp;SRC_URI[sha256sum] =3D "ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98=
bbe2b812f008da27ab8"<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a> b/meta/recipes-=
graphics/wayland/<a href=3D"http://weston_2.0.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">weston_2.0.0.bb</a><br>
index 54b07bd..8160f55 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a><br>
@@ -25,7 +25,6 @@ DEPENDS +=3D "wayland wayland-protocols libinput virtual/=
egl pango wayland-native"<br>
<br>
&nbsp;EXTRA_OECONF =3D "--enable-setuid-install \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--disable-rdp=
-compositor \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WAYLAND_PROTOCOLS_=
SYSROOT_DIR=3D${RECIPE_SYSROOT} \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"<br>
&nbsp;EXTRA_OECONF_append_qemux86 =3D "\<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WESTON_NATIVE_BACKE=
ND=3Dfbdev-backend.so \<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/rec=
ipes-graphics/xorg-xserver/xserver-xorg.inc<br>
index 863d80c..e8025de 100644<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br>
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br>
@@ -117,7 +117,6 @@ EXTRA_OECONF +=3D "--with-fop=3Dno \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --sysconfdir=
=3D/etc/X11 \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --localstate=
dir=3D/var \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --with-xkb-o=
utput=3D/var/lib/xkb \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WAYLAND_PROT=
OCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT} \<br>
&nbsp;"<br>
<br>
&nbsp;OPENGL_PKGCONFIGS =3D "dri glx glamor dri3 xshmfence"<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-bad_1.12.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-<wbr>plugins-bad_1.12.2.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=
=3D"http://gstreamer1.0-plugins-bad_1.12.2.bb" rel=3D"noreferrer" target=3D=
"_blank">gstreamer1.0-<wbr>plugins-bad_1.12.2.bb</a><br>
index 8321da0..a83a5ba 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.12.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<wbr>p=
lugins-bad_1.12.2.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.12.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<wbr>p=
lugins-bad_1.12.2.bb</a><br>
@@ -22,5 +22,4 @@ SRC_URI[sha256sum] =3D "9c2c7edde4f59d74eb414e0701c55131f=
562e5c605a3ce9b091754f106<br>
<br>
&nbsp;S =3D "${WORKDIR}/gst-plugins-bad-${PV}"<br>
<br>
-EXTRA_OECONF +=3D "WAYLAND_PROTOCOLS_SYSROOT_DIR=3D${RECIPE_SYSROOT}"<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.3.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span><br></blockquote></div><br></div>
</blockquote></body></html>

--=-kahGRlqp3Ll0WCn/3xBq--
