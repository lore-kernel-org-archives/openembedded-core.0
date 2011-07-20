Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qjfzl-0006Jt-NB
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 01:16:01 +0200
Received: (qmail invoked by alias); 20 Jul 2011 23:11:54 -0000
Received: from p5B0A1B10.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.27.16]
	by mail.gmx.net (mp055) with SMTP; 21 Jul 2011 01:11:54 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+2mp8BYSO2DvyUKngdL9uB5inTSniqBT4JyPTt/C
	2X7jgVrni5iIdb
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 01:14:00 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <1310856514-12964-1-git-send-email-schnitzeltony@gmx.de>
	<4E2706BA.2000600@linux.intel.com>
In-Reply-To: <4E2706BA.2000600@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201107210114.00633.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] gdk-pixbuf(-native): Fix build by disabling introspection
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
X-List-Received-Date: Wed, 20 Jul 2011 23:16:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday, July 20, 2011 06:47:54 PM you wrote:
> On 07/16/2011 03:48 PM, Andreas Mueller wrote:
> > Error message was:
> > | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/g-ir-c
> > | ompiler  --includedir=. GdkPixbuf-2.0.gir -o GdkPixbuf-2.0.typelib
> > | /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
> > | /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
> > | error parsing file GdkPixbuf-2.0.gir: Failed to parse included gir
> > | GLib-2.0 make[4]: *** [GdkPixbuf-2.0.typelib] Error 1
> > 
> > Signed-off-by: Andreas Mueller<schnitzeltony@gmx.de>
> > ---
> > 
> >   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    3 ++-
> >   1 files changed, 2 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
> > b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb index
> > 8b6314f..e3f5977 100644
> > --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
> > 
> >   SECTION = "libs"
> >   
> >   DEPENDS = "libpng glib-2.0 jpeg"
> > 
> > -PR = "r0"
> > +PR = "r1"
> > 
> >   SRC_URI =
> >   "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.22/gdk-pixbuf-${
> >   PV}.tar.gz \
> >   
> >              file://hardcoded_libtool.patch;patch=1 \
> > 
> > @@ -26,6 +26,7 @@ LIBV = "2.10.0"
> > 
> >   EXTRA_OECONF = "\
> >   
> >     --without-libtiff \
> >     --with-libpng \
> > 
> > +  --disable-introspection \
> > 
> >   "
> >   
> >   FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
> 
> Merged into oe-core
> 
> There was a comment from Tom about gnome.bbclass, are you looking into
> that?

On Sunday, July 17, 2011 04:25:48 PM Tom Rini wrote:
> Sounds like gnome.bbclass is out of sync and we need both
> --enable-introspection=no and --disable-scrollkeeper.

--enable-introspection=no: 
I grepped around in oe-core for recipes with gobject-introspection disabled (did 
not care of other layers - e.g meta-oe has its own gnome-bbclass with "--enable-
introspection=no").

If I am not mistaken we have the following recipes requiring gnome.bbclass:
1. json-glib_0.12.4.bb:EXTRA_OECONF = "--disable-introspection"
2. mutter.inc:	         --without-introspection \

and the following *not* requiring gnome.bbclass
1. polkit-gnome_0.101.bb:                 --disable-introspection "
2. polkit_0.101.bb:EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --
disable-man-pages --disable-gtk-doc --disable-introspection"
3. gupnp_0.16.1.bb:EXTRA_OECONF = "--disable-introspection"
4. gssdp_0.10.0.bb:EXTRA_OECONF = "--disable-introspection"
5. gdk-pixbuf/gdk-pixbuf_2.22.1.bb:  --disable-introspection \
6. python-pygobject_2.27.91.bb:EXTRA_OECONF += "--disable-introspection"
7. clutter-box2d-1.6_0.10.0.bb:BASE_CONF += "--disable-introspection"
8. clutter_git.bb:BASE_CONF += "--disable-introspection"
9. clutter-1.6_1.6.14.bb:BASE_CONF += "--disable-introspection"
10. udev_145.bb:EXTRA_OECONF = "--with-udev-prefix= --disable-extras --disable-
introspection"

Currenly a move of --enable-introspection=no to gnome.bbclass would 'clean' 2 
recipes but affect all requiring gnome.bbclass. Most victims of gobject-
introspection are not requiring gnome.bbclass. 
My personal opinion: As long as we have not more gnome recipes (e.g from meta-
oe): Leave --enable-introspection=no in the recipes affected.
Best solution: Let's make gobject-introspection cross capable :-)

 --disable-scrollkeeper: 
Sorry but can anybody (e.g. Tom?) give a hint what this is about/for?

Andreas


