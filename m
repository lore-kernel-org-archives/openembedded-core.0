Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcZnJ-0004nE-PU
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:13:49 +0200
Received: by wyg30 with SMTP id 30so2336080wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 02:10:04 -0700 (PDT)
Received: by 10.227.200.3 with SMTP id eu3mr2678030wbb.94.1309511403884;
	Fri, 01 Jul 2011 02:10:03 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b13sm2199504wbh.41.2011.07.01.02.10.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 02:10:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTimzg79tkU+=-AgwgYhJSC52jJVT6Q@mail.gmail.com>
Date: Fri, 1 Jul 2011 11:09:57 +0200
Message-Id: <1299A20C-0494-4434-84C4-E1503FAE0CFC@dominion.thruhere.net>
References: <1309453832.7987.33.camel@desktop.home>
	<1309472051.20015.465.camel@rex>
	<BANLkTimzg79tkU+=-AgwgYhJSC52jJVT6Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Proposal: recipe feature switches
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
X-List-Received-Date: Fri, 01 Jul 2011 09:13:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 10:55 heeft Frans Meulenbroeks het volgende =
geschreven:

>=20
>=20
> 2011/7/1 Richard Purdie <richard.purdie@linuxfoundation.org>
> On Thu, 2011-06-30 at 18:10 +0100, Chris Elston wrote:
> > We're looking to base an embedded development on oe-core in the near
> > future, and one of the things we must have is the ability to =
configure
> > features in/out of recipes per distro.
> >
> > At the moment some recipes have a configuration / set of =
dependencies
> > baked in to the recipe.  For example, gstreamer has theora, ogg and
> > vorbis hard-coded in to it's EXTRA_OECONF and DEPENDS.  Currently, =
you'd
> > have to override the DEPENDS and EXTRA_OECONF for the recipe in the
> > distro layer - which means moving knowledge about what EXTRA_OECONF
> > flags bring in which dependencies outside of the recipe.  It seems =
that
> > this metadata is better contained in the recipe.
> >
> > I'm proposing something along the lines of the following:
>=20
> This is actually along the lines of what I've been thinking too!
>=20
> > diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> > index 9930a24..4f1c54f 100644
> > --- a/meta/classes/utils.bbclass
> > +++ b/meta/classes/utils.bbclass
> > @@ -84,6 +84,15 @@ def oe_system(d, cmd, **kwargs):
> >          kwargs["shell"] =3D True
> >      return oe_popen(d, cmd, **kwargs).wait()
> >
> > +def oe_package_feature_switch(feature, switch_on, switch_off,
> > dependencies, d):
> > +    oeconf =3D d.getVar("EXTRA_OECONF", True)
> > +    if feature in d.getVar("PACKAGE_FEATURES", True).split():
> > +        d.setVar("EXTRA_OECONF", oeconf + " " + switch_on)
> > +        depends =3D d.getVar("DEPENDS", True)
> > +        d.setVar("DEPENDS", depends + " " + dependencies)
> > +    else:
> > +        d.setVar("EXTRA_OECONF", oeconf + " " + switch_off)
> > +
> >  oe_soinstall() {
> >       # Purpose: Install shared library file and
> >       #          create the necessary links
> > diff --git
> > a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> > b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> > index f81011f..6fc6405 100644
> > --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> > @@ -6,10 +6,12 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
> >
> > file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9abc605 \
> >
> > =
file://gst/ffmpegcolorspace/utils.c;beginline=3D1;endline=3D20;md5=3D9c83a=
200b8e597b26ca29df20fc6ecd0"
> >
> > -DEPENDS +=3D "virtual/libx11 alsa-lib freetype gnome-vfs liboil =
libogg
> > libvorbis libxv libtheora avahi util-linux tremor"
> > +DEPENDS +=3D "virtual/libx11 alsa-lib freetype gnome-vfs liboil =
libxv
> > avahi util-linux tremor"
> >  RDEPENDS_${PN} +=3D "gnome-vfs-plugin-file gnome-vfs-plugin-http
> > gnome-vfs-plugin-ftp \
> >               gnome-vfs-plugin-sftp"
> >
> > +PACKAGE_FEATURES ?=3D "ogg vorbis theora"
> > +
> >  SRC_URI +=3D " file://gst-plugins-base-tremor.patch"
> >
> >  SRC_URI[md5sum] =3D "2920af2b3162f3d9fbaa7fabc8ed4d38"
> > @@ -21,6 +23,12 @@ inherit gettext
> >
> >  EXTRA_OECONF +=3D "--disable-freetypetest --disable-pango"
> >
> > +python () {
> > +     oe_package_feature_switch("ogg", "--enable-ogg", =
"--disable-ogg",
> > "libogg", d)
> > +     oe_package_feature_switch("vorbis", "--enable-vorbis",
> > "--disable-vorbis", "libvorbis", d)
> > +     oe_package_feature_switch("theora", "--enable-theora",
> > "--disable-theora", "libtheora", d)
> > +}
> > +
> >  do_configure_prepend() {
> >       # This m4 file contains nastiness which conflicts with libtool =
2.2.2
> >       rm -f ${S}/m4/lib-link.m4
> >
> > Then in your layer, you could configure which plugins gstreamer =
should
> > be built with like this:
> >
> > PACKAGE_FEATURES_pn-gst-plugins-base =3D "ogg theora"
> >
> > Or just filter out the package features that you don't want.
> >
> > With a little extra work, it would also be possible to check the =
list of
> > package features a distro layer requests against those the recipe
> > actually implements.  Then we could get an early warning when we =
pull
> > oe-core and a recipe has stopped implementing a feature.
>=20
> How about something like the syntax for the recipe:
>=20
> PACKAGECONFIG[ogg] =3D "--enable-ogg, --disable-ogg, libogg"
> PACKAGECONFIG[vorbis] =3D "--enable-vorbis, --disable-vorbis, =
libvorbis"
> PACKAGECONFIG[theora] =3D "--enable-theora, --disable-theora, =
libtheora"
>=20
> and then in base.bbclass we can simply:
>=20
> for flag in (d.getVarFlags("PACKAGECONFIG") or {}):
>    <manipulate DEPENDS/EXTRA_OECONF>
>=20
> I'm also strongly tempted to tie this into the DISTRO_FEATURES =
variable
> instead of individual PACKAGE_FEATURES variables to make it clear how
> this is intended to be used.
>=20
> If we do this, we are going to need to exercise some measure of =
control
> as someone is going to want an enable/disable option for every config
> option for every package. How do we decide which make sense and which
> don't?
>=20
> Note that the more options you have, the more combinations there are =
to
> test and the less testing the system likely gets. I would therefore =
like
> to see some kind of natural pressure to only add very useful
> DISTRO_FEATURES. Maybe a criteria like it affecting 5 or more recipes?
> =20
> Good idea.
> Personally I'd like to also bring footprint into the equation. If a =
feature drags in lots of additional packages, it is interesting to make =
it configurable.
> My favourite example: bluez dragging in all kind of rendering stuff =
(through DEPENDS) even though the hardware functionality might not be =
there (e.g. you have BT but not audio).

Which is a great example, since that doesn't impact footprint at all, =
it's an alsa *plugin* that will get produced.



