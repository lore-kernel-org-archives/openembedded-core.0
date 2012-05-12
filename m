Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ST9Fo-0006Nw-E5 for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 12:08:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4C9wrLb032486
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 10:58:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18512-10 for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 10:58:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4C9wkwp032480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 10:58:47 +0100
Message-ID: <1336816725.2494.247.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 12 May 2012 10:58:45 +0100
In-Reply-To: <4FADF81A.9010005@linux.intel.com>
References: <cover.1336719792.git.xiaofeng.yan@windriver.com>
	<7e9ada8b4a3af9425d343f37de63536abd7de711.1336719792.git.xiaofeng.yan@windriver.com>
	<4FADF81A.9010005@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Sat, 12 May 2012 10:08:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-05-11 at 22:41 -0700, Saul Wold wrote:
> On 05/11/2012 12:23 AM, Xiaofeng Yan wrote:
> > From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> >
> > LSB Test Suite complains "No library libgdk_pixbuf_xlib-2.0.so.0" \
> > because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
> > Use the linuxstdbase override and also make it conditional on x11 \
> > being in DISTRO_FEATURES for passing lsb test.
> > Split libgdk_pixbuf_xlib to a single package.
> >
> > Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> > ---
> >   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   11 +++++++++--
> >   1 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> > index e31f717..a88700b 100644
> > --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> > @@ -19,7 +19,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
> >   SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
> >   SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
> >
> > -PR = "r0"
> > +PR = "r1"
> >
> >   inherit autotools pkgconfig gettext
> >
> > @@ -28,9 +28,16 @@ LIBV = "2.10.0"
> >   EXTRA_OECONF = "\
> >     --without-libtiff \
> >     --with-libpng \
> > -  --without-x11 \
> > +  ${X11DEPENDS} \
> >     --disable-introspection \
> >   "
> > +X11DEPENDS = "--without-x11"
> > +X11DEPENDS_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x11', '--without-x11', d)}"
> > +
> I hate to ask this after this has already been merged, but should this 
> really have been more generic or do other packages need to be fixed 
> since we are seeing failures in the non-LSB case of this new -xlib 
> package being depended on.
> 
> | 	gdk-pixbuf-xlib is needed by gdk-pixbuf-loader-png-2.24.1-r1.armv5te
> | 	gdk-pixbuf-xlib is needed by gdk-pixbuf-loader-jpeg-2.24.1-r1.armv5te
> | 	gdk-pixbuf-xlib is needed by gdk-pixbuf-loader-xpm-2.24.1-r1.armv5te
> | 	gdk-pixbuf-xlib is needed by gdk-pixbuf-loader-gif-2.24.1-r1.armv5te

This is a bug in package.bbclass:

From 2006:
http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/package.bbclass?id=2af3b213e554d34d7f17e41cd9f5abfe842f6a08
http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/package.bbclass?id=77597031696448e691831ddca735c8fd096788f5

So 6 years ago I put a bandaid on this. That code is simply nuts and I
think its time to remove/rework it. We could change it to use ${PN} I
guess which would be more likely to work and I can't see it breaking too
much...

Cheers,

Richard



