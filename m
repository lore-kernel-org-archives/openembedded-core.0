Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TRKQE-0002NY-VZ
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 12:12:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Oct 2012 02:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,646,1344236400"; d="scan'208";a="210625706"
Received: from unknown (HELO helios.localnet) ([10.252.122.43])
	by orsmga001.jf.intel.com with ESMTP; 25 Oct 2012 02:58:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Thu, 25 Oct 2012 10:58:47 +0100
Message-ID: <1919390.bnYn62cq03@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121025040826.GG3465@denix.org>
References: <1313164784.6733.165.camel@phil-desktop>
	<20121025040826.GG3465@denix.org>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 25 Oct 2012 10:12:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 25 October 2012 00:08:26 Denys Dmytriyenko wrote:
> On Fri, Aug 12, 2011 at 04:59:43PM +0100, Phil Blundell wrote:
> > This makes it possible to include dbus in a non-X11-equipped DISTRO.
> 
> I have a follow up question on this old change...
> 
> > Signed-off-by: Phil Blundell <philb@gnu.org>
> > ---
> > 
> >  meta/recipes-core/dbus/dbus.inc |    7 ++++---
> >  1 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-core/dbus/dbus.inc
> > b/meta/recipes-core/dbus/dbus.inc index 6b76cba..a8ecda8 100644
> > --- a/meta/recipes-core/dbus/dbus.inc
> > +++ b/meta/recipes-core/dbus/dbus.inc
> > @@ -5,7 +5,8 @@ SECTION = "base"
> > 
> >  LICENSE = "AFL-2 | GPLv2+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> >  
> >                      file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0
> >                      c7750dd8e620dcb1437312fa5"> 
> > -DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
> > +X11DEPENDS = "virtual/libx11 libsm"
> > +DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES',
> > 'x11', '${X11DEPENDS}', '', d)}"> 
> >  DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
> >  DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk
> >  virtual/libx11"
>
> Would there be any objections extending this DISTRO check to nativesdk as
> well?

We did have a request not so long ago to be able to have x11 enabled in the 
nativesdk (for development tools that need X) but disabled on the target. I'm 
pretty sure we already have a lot of places where DISTRO_FEATURES will 
influence nativesdk, but I suspect the configuration may need to be separated 
for these two at some point.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


