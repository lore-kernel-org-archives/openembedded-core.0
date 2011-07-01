Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QcZZd-00048Z-Cj
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 10:59:41 +0200
Received: by gwb11 with SMTP id 11so1330700gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 01:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DjS6z546dOp81J0KQnrJCv8fJHFPoBelzLWJMikJnZI=;
	b=hGiFpvo+EhqVIlsDj6/QHZWWxY5+XQISyq159idCIzS6xMWqdGCuYUr8kjSDLU5TWS
	0wvq0qbYTFX2UW8wqBZhdKwfW80w09jMMCvM9b6ioe4rJO9HASnd0hB83YQiVuujAkaX
	HXdKTlMCiVwDSq1493c54cTv5sROcsiQtNfpg=
MIME-Version: 1.0
Received: by 10.91.21.37 with SMTP id y37mr2829000agi.63.1309510556321; Fri,
	01 Jul 2011 01:55:56 -0700 (PDT)
Received: by 10.90.183.14 with HTTP; Fri, 1 Jul 2011 01:55:56 -0700 (PDT)
In-Reply-To: <1309472051.20015.465.camel@rex>
References: <1309453832.7987.33.camel@desktop.home>
	<1309472051.20015.465.camel@rex>
Date: Fri, 1 Jul 2011 10:55:56 +0200
Message-ID: <BANLkTimzg79tkU+=-AgwgYhJSC52jJVT6Q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 01 Jul 2011 08:59:41 -0000
Content-Type: multipart/alternative; boundary=0016e640d0528a06a704a6fe2ffb

--0016e640d0528a06a704a6fe2ffb
Content-Type: text/plain; charset=ISO-8859-1

2011/7/1 Richard Purdie <richard.purdie@linuxfoundation.org>

> On Thu, 2011-06-30 at 18:10 +0100, Chris Elston wrote:
> > We're looking to base an embedded development on oe-core in the near
> > future, and one of the things we must have is the ability to configure
> > features in/out of recipes per distro.
> >
> > At the moment some recipes have a configuration / set of dependencies
> > baked in to the recipe.  For example, gstreamer has theora, ogg and
> > vorbis hard-coded in to it's EXTRA_OECONF and DEPENDS.  Currently, you'd
> > have to override the DEPENDS and EXTRA_OECONF for the recipe in the
> > distro layer - which means moving knowledge about what EXTRA_OECONF
> > flags bring in which dependencies outside of the recipe.  It seems that
> > this metadata is better contained in the recipe.
> >
> > I'm proposing something along the lines of the following:
>
> This is actually along the lines of what I've been thinking too!
>
> > diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> > index 9930a24..4f1c54f 100644
> > --- a/meta/classes/utils.bbclass
> > +++ b/meta/classes/utils.bbclass
> > @@ -84,6 +84,15 @@ def oe_system(d, cmd, **kwargs):
> >          kwargs["shell"] = True
> >      return oe_popen(d, cmd, **kwargs).wait()
> >
> > +def oe_package_feature_switch(feature, switch_on, switch_off,
> > dependencies, d):
> > +    oeconf = d.getVar("EXTRA_OECONF", True)
> > +    if feature in d.getVar("PACKAGE_FEATURES", True).split():
> > +        d.setVar("EXTRA_OECONF", oeconf + " " + switch_on)
> > +        depends = d.getVar("DEPENDS", True)
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
> > @@ -6,10 +6,12 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> >
> > file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
> >
> >
> file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
> >
> > -DEPENDS += "virtual/libx11 alsa-lib freetype gnome-vfs liboil libogg
> > libvorbis libxv libtheora avahi util-linux tremor"
> > +DEPENDS += "virtual/libx11 alsa-lib freetype gnome-vfs liboil libxv
> > avahi util-linux tremor"
> >  RDEPENDS_${PN} += "gnome-vfs-plugin-file gnome-vfs-plugin-http
> > gnome-vfs-plugin-ftp \
> >               gnome-vfs-plugin-sftp"
> >
> > +PACKAGE_FEATURES ?= "ogg vorbis theora"
> > +
> >  SRC_URI += " file://gst-plugins-base-tremor.patch"
> >
> >  SRC_URI[md5sum] = "2920af2b3162f3d9fbaa7fabc8ed4d38"
> > @@ -21,6 +23,12 @@ inherit gettext
> >
> >  EXTRA_OECONF += "--disable-freetypetest --disable-pango"
> >
> > +python () {
> > +     oe_package_feature_switch("ogg", "--enable-ogg", "--disable-ogg",
> > "libogg", d)
> > +     oe_package_feature_switch("vorbis", "--enable-vorbis",
> > "--disable-vorbis", "libvorbis", d)
> > +     oe_package_feature_switch("theora", "--enable-theora",
> > "--disable-theora", "libtheora", d)
> > +}
> > +
> >  do_configure_prepend() {
> >       # This m4 file contains nastiness which conflicts with libtool
> 2.2.2
> >       rm -f ${S}/m4/lib-link.m4
> >
> > Then in your layer, you could configure which plugins gstreamer should
> > be built with like this:
> >
> > PACKAGE_FEATURES_pn-gst-plugins-base = "ogg theora"
> >
> > Or just filter out the package features that you don't want.
> >
> > With a little extra work, it would also be possible to check the list of
> > package features a distro layer requests against those the recipe
> > actually implements.  Then we could get an early warning when we pull
> > oe-core and a recipe has stopped implementing a feature.
>
> How about something like the syntax for the recipe:
>
> PACKAGECONFIG[ogg] = "--enable-ogg, --disable-ogg, libogg"
> PACKAGECONFIG[vorbis] = "--enable-vorbis, --disable-vorbis, libvorbis"
> PACKAGECONFIG[theora] = "--enable-theora, --disable-theora, libtheora"
>
> and then in base.bbclass we can simply:
>
> for flag in (d.getVarFlags("PACKAGECONFIG") or {}):
>    <manipulate DEPENDS/EXTRA_OECONF>
>
> I'm also strongly tempted to tie this into the DISTRO_FEATURES variable
> instead of individual PACKAGE_FEATURES variables to make it clear how
> this is intended to be used.
>
> If we do this, we are going to need to exercise some measure of control
> as someone is going to want an enable/disable option for every config
> option for every package. How do we decide which make sense and which
> don't?
>
> Note that the more options you have, the more combinations there are to
> test and the less testing the system likely gets. I would therefore like
> to see some kind of natural pressure to only add very useful
> DISTRO_FEATURES. Maybe a criteria like it affecting 5 or more recipes?
>

Good idea.
Personally I'd like to also bring footprint into the equation. If a feature
drags in lots of additional packages, it is interesting to make it
configurable.
My favourite example: bluez dragging in all kind of rendering stuff (through
DEPENDS) even though the hardware functionality might not be there (e.g. you
have BT but not audio).

frans

--0016e640d0528a06a704a6fe2ffb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/1 Richard Purdie <span dir=3D"ltr=
">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@=
linuxfoundation.org</a>&gt;</span><br><blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204);=
 padding-left: 1ex;">
<div class=3D"im">On Thu, 2011-06-30 at 18:10 +0100, Chris Elston wrote:<br=
>
&gt; We&#39;re looking to base an embedded development on oe-core in the ne=
ar<br>
&gt; future, and one of the things we must have is the ability to configure=
<br>
&gt; features in/out of recipes per distro.<br>
&gt;<br>
&gt; At the moment some recipes have a configuration / set of dependencies<=
br>
&gt; baked in to the recipe. =A0For example, gstreamer has theora, ogg and<=
br>
&gt; vorbis hard-coded in to it&#39;s EXTRA_OECONF and DEPENDS. =A0Currentl=
y, you&#39;d<br>
&gt; have to override the DEPENDS and EXTRA_OECONF for the recipe in the<br=
>
&gt; distro layer - which means moving knowledge about what EXTRA_OECONF<br=
>
&gt; flags bring in which dependencies outside of the recipe. =A0It seems t=
hat<br>
&gt; this metadata is better contained in the recipe.<br>
&gt;<br>
&gt; I&#39;m proposing something along the lines of the following:<br>
<br>
</div>This is actually along the lines of what I&#39;ve been thinking too!<=
br>
<div><div></div><div class=3D"h5"><br>
&gt; diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass<b=
r>
&gt; index 9930a24..4f1c54f 100644<br>
&gt; --- a/meta/classes/utils.bbclass<br>
&gt; +++ b/meta/classes/utils.bbclass<br>
&gt; @@ -84,6 +84,15 @@ def oe_system(d, cmd, **kwargs):<br>
&gt; =A0 =A0 =A0 =A0 =A0kwargs[&quot;shell&quot;] =3D True<br>
&gt; =A0 =A0 =A0return oe_popen(d, cmd, **kwargs).wait()<br>
&gt;<br>
&gt; +def oe_package_feature_switch(feature, switch_on, switch_off,<br>
&gt; dependencies, d):<br>
&gt; + =A0 =A0oeconf =3D d.getVar(&quot;EXTRA_OECONF&quot;, True)<br>
&gt; + =A0 =A0if feature in d.getVar(&quot;PACKAGE_FEATURES&quot;, True).sp=
lit():<br>
&gt; + =A0 =A0 =A0 =A0d.setVar(&quot;EXTRA_OECONF&quot;, oeconf + &quot; &q=
uot; + switch_on)<br>
&gt; + =A0 =A0 =A0 =A0depends =3D d.getVar(&quot;DEPENDS&quot;, True)<br>
&gt; + =A0 =A0 =A0 =A0d.setVar(&quot;DEPENDS&quot;, depends + &quot; &quot;=
 + dependencies)<br>
&gt; + =A0 =A0else:<br>
&gt; + =A0 =A0 =A0 =A0d.setVar(&quot;EXTRA_OECONF&quot;, oeconf + &quot; &q=
uot; + switch_off)<br>
&gt; +<br>
&gt; =A0oe_soinstall() {<br>
&gt; =A0 =A0 =A0 # Purpose: Install shared library file and<br>
&gt; =A0 =A0 =A0 # =A0 =A0 =A0 =A0 =A0create the necessary links<br>
&gt; diff --git<br>
&gt; a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-plugins-base=
_0.10.32.bb" target=3D"_blank">gst-plugins-base_0.10.32.bb</a><br>
&gt; b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-plugins-base=
_0.10.32.bb" target=3D"_blank">gst-plugins-base_0.10.32.bb</a><br>
&gt; index f81011f..6fc6405 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-plugins-=
base_0.10.32.bb" target=3D"_blank">gst-plugins-base_0.10.32.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-plugins-=
base_0.10.32.bb" target=3D"_blank">gst-plugins-base_0.10.32.bb</a><br>
&gt; @@ -6,10 +6,12 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \<br>
&gt;<br>
&gt; file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9abc605 \<br>
&gt;<br>
&gt; file://gst/ffmpegcolorspace/utils.c;beginline=3D1;endline=3D20;md5=3D9=
c83a200b8e597b26ca29df20fc6ecd0&quot;<br>
&gt;<br>
&gt; -DEPENDS +=3D &quot;virtual/libx11 alsa-lib freetype gnome-vfs liboil =
libogg<br>
&gt; libvorbis libxv libtheora avahi util-linux tremor&quot;<br>
&gt; +DEPENDS +=3D &quot;virtual/libx11 alsa-lib freetype gnome-vfs liboil =
libxv<br>
&gt; avahi util-linux tremor&quot;<br>
&gt; =A0RDEPENDS_${PN} +=3D &quot;gnome-vfs-plugin-file gnome-vfs-plugin-ht=
tp<br>
&gt; gnome-vfs-plugin-ftp \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 gnome-vfs-plugin-sftp&quot;<br>
&gt;<br>
&gt; +PACKAGE_FEATURES ?=3D &quot;ogg vorbis theora&quot;<br>
&gt; +<br>
&gt; =A0SRC_URI +=3D &quot; file://gst-plugins-base-tremor.patch&quot;<br>
&gt;<br>
&gt; =A0SRC_URI[md5sum] =3D &quot;2920af2b3162f3d9fbaa7fabc8ed4d38&quot;<br=
>
&gt; @@ -21,6 +23,12 @@ inherit gettext<br>
&gt;<br>
&gt; =A0EXTRA_OECONF +=3D &quot;--disable-freetypetest --disable-pango&quot=
;<br>
&gt;<br>
&gt; +python () {<br>
&gt; + =A0 =A0 oe_package_feature_switch(&quot;ogg&quot;, &quot;--enable-og=
g&quot;, &quot;--disable-ogg&quot;,<br>
&gt; &quot;libogg&quot;, d)<br>
&gt; + =A0 =A0 oe_package_feature_switch(&quot;vorbis&quot;, &quot;--enable=
-vorbis&quot;,<br>
&gt; &quot;--disable-vorbis&quot;, &quot;libvorbis&quot;, d)<br>
&gt; + =A0 =A0 oe_package_feature_switch(&quot;theora&quot;, &quot;--enable=
-theora&quot;,<br>
&gt; &quot;--disable-theora&quot;, &quot;libtheora&quot;, d)<br>
&gt; +}<br>
&gt; +<br>
&gt; =A0do_configure_prepend() {<br>
&gt; =A0 =A0 =A0 # This m4 file contains nastiness which conflicts with lib=
tool 2.2.2<br>
&gt; =A0 =A0 =A0 rm -f ${S}/m4/lib-link.m4<br>
&gt;<br>
&gt; Then in your layer, you could configure which plugins gstreamer should=
<br>
&gt; be built with like this:<br>
&gt;<br>
&gt; PACKAGE_FEATURES_pn-gst-plugins-base =3D &quot;ogg theora&quot;<br>
&gt;<br>
&gt; Or just filter out the package features that you don&#39;t want.<br>
&gt;<br>
&gt; With a little extra work, it would also be possible to check the list =
of<br>
&gt; package features a distro layer requests against those the recipe<br>
&gt; actually implements. =A0Then we could get an early warning when we pul=
l<br>
&gt; oe-core and a recipe has stopped implementing a feature.<br>
<br>
</div></div>How about something like the syntax for the recipe:<br>
<br>
PACKAGECONFIG[ogg] =3D &quot;--enable-ogg, --disable-ogg, libogg&quot;<br>
PACKAGECONFIG[vorbis] =3D &quot;--enable-vorbis, --disable-vorbis, libvorbi=
s&quot;<br>
PACKAGECONFIG[theora] =3D &quot;--enable-theora, --disable-theora, libtheor=
a&quot;<br>
<br>
and then in base.bbclass we can simply:<br>
<br>
for flag in (d.getVarFlags(&quot;PACKAGECONFIG&quot;) or {}):<br>
 =A0 =A0&lt;manipulate DEPENDS/EXTRA_OECONF&gt;<br>
<br>
I&#39;m also strongly tempted to tie this into the DISTRO_FEATURES variable=
<br>
instead of individual PACKAGE_FEATURES variables to make it clear how<br>
this is intended to be used.<br>
<br>
If we do this, we are going to need to exercise some measure of control<br>
as someone is going to want an enable/disable option for every config<br>
option for every package. How do we decide which make sense and which<br>
don&#39;t?<br>
<br>
Note that the more options you have, the more combinations there are to<br>
test and the less testing the system likely gets. I would therefore like<br=
>
to see some kind of natural pressure to only add very useful<br>
DISTRO_FEATURES. Maybe a criteria like it affecting 5 or more recipes?<br>
=A0</blockquote><div>Good idea.<br>Personally I&#39;d like to also bring fo=
otprint into the equation. If a feature drags in lots of additional package=
s, it is interesting to make it configurable.<br>My favourite example: blue=
z dragging in all kind of rendering stuff (through DEPENDS) even though the=
 hardware functionality might not be there (e.g. you have BT but not audio)=
.<br>
<br>frans <br></div></div><br>

--0016e640d0528a06a704a6fe2ffb--
