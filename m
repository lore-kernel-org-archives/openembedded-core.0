Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TRM4z-0004A7-H3 for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 13:58:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9PBivnA017131;
	Thu, 25 Oct 2012 12:44:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16860-04; Thu, 25 Oct 2012 12:44:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9PBik4N017124
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 25 Oct 2012 12:44:47 +0100
Message-ID: <1351165486.22340.152.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 25 Oct 2012 12:44:46 +0100
In-Reply-To: <1919390.bnYn62cq03@helios>
References: <1313164784.6733.165.camel@phil-desktop>
	<20121025040826.GG3465@denix.org> <1919390.bnYn62cq03@helios>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: dbus: only use x11 if DISTRO_FEATURES has selected it
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
X-List-Received-Date: Thu, 25 Oct 2012 11:58:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-10-25 at 10:58 +0100, Paul Eggleton wrote:
> On Thursday 25 October 2012 00:08:26 Denys Dmytriyenko wrote:
> > On Fri, Aug 12, 2011 at 04:59:43PM +0100, Phil Blundell wrote:
> > > This makes it possible to include dbus in a non-X11-equipped DISTRO.
> > 
> > I have a follow up question on this old change...
> > 
> > > Signed-off-by: Phil Blundell <philb@gnu.org>
> > > ---
> > > 
> > >  meta/recipes-core/dbus/dbus.inc |    7 ++++---
> > >  1 files changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meta/recipes-core/dbus/dbus.inc
> > > b/meta/recipes-core/dbus/dbus.inc index 6b76cba..a8ecda8 100644
> > > --- a/meta/recipes-core/dbus/dbus.inc
> > > +++ b/meta/recipes-core/dbus/dbus.inc
> > > @@ -5,7 +5,8 @@ SECTION = "base"
> > > 
> > >  LICENSE = "AFL-2 | GPLv2+"
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> > >  
> > >                      file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0
> > >                      c7750dd8e620dcb1437312fa5"> 
> > > -DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
> > > +X11DEPENDS = "virtual/libx11 libsm"
> > > +DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES',
> > > 'x11', '${X11DEPENDS}', '', d)}"> 
> > >  DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
> > >  DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk
> > >  virtual/libx11"
> >
> > Would there be any objections extending this DISTRO check to nativesdk as
> > well?
> 
> We did have a request not so long ago to be able to have x11 enabled in the 
> nativesdk (for development tools that need X) but disabled on the target. I'm 
> pretty sure we already have a lot of places where DISTRO_FEATURES will 
> influence nativesdk, but I suspect the configuration may need to be separated 
> for these two at some point.

There is a nasty subtlety in this request which I've noticed with
dbus-native on my local builds.

If I launch a devshell, then within it try and launch a local X app
which uses dbus, it finds the dbus in the native sysroot, not the host
system one. Since X11 is disabled in the native dbus, it then generall
gives me nasty errors and breaks the X app I wanted to run.

So far I've just ignored this but it will do the same thing to
nativesdk, namely break X apps once the dbus-nativesdk is in PATH.

So I'm not sure disabling X11 is a good idea here. Perhaps not
installing the dbus binaries into PATH for nativesdk might be good
enough to avoid undesired affects but we need to think it through very
carefully and the request isn't as simple as it first appears.

Cheers,

Richard




