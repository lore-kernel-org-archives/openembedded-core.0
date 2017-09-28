Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 44D7377B20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 09:15:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id C87B12610CE
Message-ID: <1506612178.13215.11.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LbRLkqJMgvH0wZczZWXYBjFb5LpFFh+mL3ox7S7qPiRZA@mail.gmail.com>
References: <20170927131426.4037-1-fabien.lahoudere@collabora.co.uk>
	<20170927131426.4037-2-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LbRLkqJMgvH0wZczZWXYBjFb5LpFFh+mL3ox7S7qPiRZA@mail.gmail.com>
Date: Thu, 28 Sep 2017 17:22:58 +0200
Mime-Version: 1.0
X-Mailer: Evolution 3.22.6-1 
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] wayland-protocols: Fix installation patch issue
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
X-List-Received-Date: Sat, 30 Sep 2017 09:15:24 -0000
Content-Type: multipart/alternative; boundary="=-rJu9ojeTwyirw/zsK5Zh"

--=-rJu9ojeTwyirw/zsK5Zh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-09-27 at 20:11 +0100, Burton, Ross wrote:
> libsdl2 doesn't build for me:
> | /bin/bash ../SDL2-2.0.5/build-scripts/mkinstalldirs build
> | make: *** No rule to make target '/usr/share/wayland/wayland.xml', needed by 'gen/wayland-
> client-protocol.h'.  Stop.
> 
> Do you have wayland-protocols on your build host?
> 

I found a machine without wayland installed and succeed to reproduce.I found the issue and fix it.
libsdl2 build now and I am building with X enabled to check it is not broken too.
> Ross
> On 27 September 2017 at 14:14, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk> wrote:
> > This patch also remove workaround to find wayland-protocols:
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
> > Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > 
> > ---
> > 
> >  meta/recipes-gnome/gtk+/gtk+3.inc                  |  1 -
> > 
> >  meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |  2 +-
> > 
> >  .../usesysrootprefixforpkgdatadirvariable.patch    | 27 ++++++++++++++++++++++
> > 
> >  .../wayland/wayland-protocols_1.10.bb              |  1 +
> > 
> >  meta/recipes-graphics/wayland/weston_2.0.0.bb      |  1 -
> > 
> >  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  1 -
> > 
> >  .../gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb   |  1 -
> > 
> >  7 files changed, 29 insertions(+), 5 deletions(-)
> > 
> >  create mode 100644 meta/recipes-graphics/wayland/wayland-
> > protocols/usesysrootprefixforpkgdatadirvariable.patch
> > 
> > 
> > 
> > diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> > 
> > index 0a357db049..420ead2ca2 100644
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
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-
> > graphics/libsdl2/libsdl2_2.0.5.bb
> > 
> > index 12d3aaf6f0..6bfa13200b 100644
> > 
> > --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> > 
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
> > 
> > @@ -35,7 +35,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
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
> > index 0000000000..0922a4d2c2
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
> > index 4f9e9f32bf..1ff12c607b 100644
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
> > diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb b/meta/recipes-
> > graphics/wayland/weston_2.0.0.bb
> > 
> > index 54b07bd6b9..8160f5556d 100644
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
> > index 863d80ce43..e8025de55f 100644
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
> > index 8321da0c27..a83a5bab21 100644
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
> > 2.11.0
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

--=-rJu9ojeTwyirw/zsK5Zh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; -webkit-line-break: after-white-space;"><div>On Wed, 2017-09-27 at =
20:11 +0100, Burton, Ross wrote:</div><blockquote type=3D"cite"><div dir=3D=
"ltr">libsdl2 doesn't build for me:<div><br></div><div><div>| /bin/bash ../=
SDL2-2.0.5/build-scripts/mkinstalldirs build</div><div>| make: *** No rule =
to make target '/usr/share/wayland/wayland.xml', needed by 'gen/wayland-cli=
ent-protocol.h'.&nbsp; Stop.</div></div><div><br></div><div>Do you have way=
land-protocols on your build host?</div><div><br></div></div></blockquote><=
div><br></div><div>I found a machine without wayland installed and succeed =
to reproduce.</div><div>I found the issue and fix it.</div><div><br></div><=
div>libsdl2 build now and I am building with X enabled to check it is not b=
roken too.</div><div><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><=
div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On 27 September 2017 at 14:14, Fabien Lahoudere <span dir=
=3D"ltr">&lt;<a href=3D"mailto:fabien.lahoudere@collabora.co.uk" target=3D"=
_blank">fabien.lahoudere@collabora.co.uk</a>&gt;</span> wrote:<br><blockquo=
te type=3D"cite">This patch also remove workaround to find wayland-protocol=
s:<br>
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
Signed-off-by: Fabien Lahoudere &lt;<a href=3D"mailto:fabien.lahoudere@coll=
abora.co.uk">fabien.lahoudere@collabora.<wbr>co.uk</a>&gt;<br>
---<br>
&nbsp;meta/recipes-gnome/gtk+/gtk+3.inc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 -<br>
&nbsp;meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>libsdl2_2.0.5.bb</a>&nbsp; &nbsp; &n=
bsp;|&nbsp; 2 +-<br>
&nbsp;.../usesysrootprefixforpkgdatadirvariable.patch&nbsp; &nbsp; | 27 +++=
+++++++++++++++++++<br>
&nbsp;.../wayland/<a href=3D"http://wayland-protocols_1.10.bb" rel=3D"noref=
errer" target=3D"_blank">wayland-protocols_<wbr>1.10.bb</a>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 +<br>
&nbsp;meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>weston_2.0.0.bb</a>&nbsp; &nbsp; &nb=
sp; |&nbsp; 1 -<br>
&nbsp;.../recipes-graphics/xorg-xserver/xserver-xorg.inc |&nbsp; 1 -<br>
&nbsp;.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.12.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-<wbr>plugins-bad_1.12.2.bb=
</a>&nbsp; &nbsp;|&nbsp; 1 -<br>
&nbsp;7 files changed, 29 insertions(+), 5 deletions(-)<br>
&nbsp;create mode 100644 meta/recipes-graphics/wayland/wayland-protocols/us=
esysrootprefixforpkgdatadirvariable.patch<br>
<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc<br>
index 0a357db049..420ead2ca2 100644<br>
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
diff --git a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.=
bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a> b/meta/recipe=
s-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libsdl2_2.0.5.bb</a><br>
index 12d3aaf6f0..6bfa13200b 100644<br>
--- a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
+++ b/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.5.bb</a><br>
@@ -35,7 +35,7 @@ EXTRA_OECONF =3D "--disable-oss --disable-esd --disable-a=
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
index 0000000000..0922a4d2c2<br>
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
index 4f9e9f32bf..1ff12c607b 100644<br>
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
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://weston_2.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">weston_2.0.0.bb</a> b/meta/recipes-=
graphics/wayland/<a href=3D"http://weston_2.0.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">weston_2.0.0.bb</a><br>
index 54b07bd6b9..8160f5556d 100644<br>
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
index 863d80ce43..e8025de55f 100644<br>
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
index 8321da0c27..a83a5bab21 100644<br>
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
2.11.0<br>
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

--=-rJu9ojeTwyirw/zsK5Zh--
