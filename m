Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcPZ0-0003d2-BW for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 00:18:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UMEcBa027416
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:14:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25755-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:14:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UMEU6Q027394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 23:14:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309453832.7987.33.camel@desktop.home>
References: <1309453832.7987.33.camel@desktop.home>
Date: Thu, 30 Jun 2011 23:14:11 +0100
Message-ID: <1309472051.20015.465.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 30 Jun 2011 22:18:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 18:10 +0100, Chris Elston wrote:
> We're looking to base an embedded development on oe-core in the near
> future, and one of the things we must have is the ability to configure
> features in/out of recipes per distro.
> 
> At the moment some recipes have a configuration / set of dependencies
> baked in to the recipe.  For example, gstreamer has theora, ogg and
> vorbis hard-coded in to it's EXTRA_OECONF and DEPENDS.  Currently, you'd
> have to override the DEPENDS and EXTRA_OECONF for the recipe in the
> distro layer - which means moving knowledge about what EXTRA_OECONF
> flags bring in which dependencies outside of the recipe.  It seems that
> this metadata is better contained in the recipe.
> 
> I'm proposing something along the lines of the following:

This is actually along the lines of what I've been thinking too!

> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index 9930a24..4f1c54f 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -84,6 +84,15 @@ def oe_system(d, cmd, **kwargs):
>          kwargs["shell"] = True
>      return oe_popen(d, cmd, **kwargs).wait()
>  
> +def oe_package_feature_switch(feature, switch_on, switch_off,
> dependencies, d):
> +    oeconf = d.getVar("EXTRA_OECONF", True)
> +    if feature in d.getVar("PACKAGE_FEATURES", True).split():
> +        d.setVar("EXTRA_OECONF", oeconf + " " + switch_on)
> +        depends = d.getVar("DEPENDS", True)
> +        d.setVar("DEPENDS", depends + " " + dependencies)
> +    else:
> +        d.setVar("EXTRA_OECONF", oeconf + " " + switch_off)
> +
>  oe_soinstall() {
>  	# Purpose: Install shared library file and
>  	#          create the necessary links
> diff --git
> a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> index f81011f..6fc6405 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> @@ -6,10 +6,12 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> 
> file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
> 
> file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
>  
> -DEPENDS += "virtual/libx11 alsa-lib freetype gnome-vfs liboil libogg
> libvorbis libxv libtheora avahi util-linux tremor"
> +DEPENDS += "virtual/libx11 alsa-lib freetype gnome-vfs liboil libxv
> avahi util-linux tremor"
>  RDEPENDS_${PN} += "gnome-vfs-plugin-file gnome-vfs-plugin-http
> gnome-vfs-plugin-ftp \
>               gnome-vfs-plugin-sftp"
>  
> +PACKAGE_FEATURES ?= "ogg vorbis theora" 
> +
>  SRC_URI += " file://gst-plugins-base-tremor.patch"
>  
>  SRC_URI[md5sum] = "2920af2b3162f3d9fbaa7fabc8ed4d38"
> @@ -21,6 +23,12 @@ inherit gettext
>  
>  EXTRA_OECONF += "--disable-freetypetest --disable-pango"
>  
> +python () {
> +	oe_package_feature_switch("ogg", "--enable-ogg", "--disable-ogg",
> "libogg", d)
> +	oe_package_feature_switch("vorbis", "--enable-vorbis",
> "--disable-vorbis", "libvorbis", d)
> +	oe_package_feature_switch("theora", "--enable-theora",
> "--disable-theora", "libtheora", d)
> +}
> +
>  do_configure_prepend() {
>  	# This m4 file contains nastiness which conflicts with libtool 2.2.2
>  	rm -f ${S}/m4/lib-link.m4
> 
> Then in your layer, you could configure which plugins gstreamer should
> be built with like this:
> 
> PACKAGE_FEATURES_pn-gst-plugins-base = "ogg theora"
> 
> Or just filter out the package features that you don't want.
> 
> With a little extra work, it would also be possible to check the list of
> package features a distro layer requests against those the recipe
> actually implements.  Then we could get an early warning when we pull
> oe-core and a recipe has stopped implementing a feature.

How about something like the syntax for the recipe:

PACKAGECONFIG[ogg] = "--enable-ogg, --disable-ogg, libogg"
PACKAGECONFIG[vorbis] = "--enable-vorbis, --disable-vorbis, libvorbis"
PACKAGECONFIG[theora] = "--enable-theora, --disable-theora, libtheora"

and then in base.bbclass we can simply:

for flag in (d.getVarFlags("PACKAGECONFIG") or {}):
    <manipulate DEPENDS/EXTRA_OECONF>

I'm also strongly tempted to tie this into the DISTRO_FEATURES variable
instead of individual PACKAGE_FEATURES variables to make it clear how
this is intended to be used.

If we do this, we are going to need to exercise some measure of control
as someone is going to want an enable/disable option for every config
option for every package. How do we decide which make sense and which
don't?

Note that the more options you have, the more combinations there are to
test and the less testing the system likely gets. I would therefore like
to see some kind of natural pressure to only add very useful
DISTRO_FEATURES. Maybe a criteria like it affecting 5 or more recipes?

Cheers,

Richard






