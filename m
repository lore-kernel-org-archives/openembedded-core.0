Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE9F6BCB4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 10:56:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2013 03:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1020,1367996400"; d="scan'208";a="398028984"
Received: from unknown (HELO helios.localnet) ([10.252.123.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2013 03:56:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Wed, 04 Sep 2013 11:56:27 +0100
Message-ID: <1522300.pfxjxHF61P@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <5221ABED.6060705@pabigot.com>
References: <521CF70C.2050100@pabigot.com> <2056053.nfWMgOXbJx@helios>
	<5221ABED.6060705@pabigot.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4-x11-free dependence on gtk+
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
X-List-Received-Date: Wed, 04 Sep 2013 10:56:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Peter,
 
On Saturday 31 August 2013 03:40:13 Peter A. Bigot wrote:
> On 08/30/2013 08:37 AM, Paul Eggleton wrote:
> > On Tuesday 27 August 2013 13:59:24 Peter A. Bigot wrote:
> >> Since "bitbake qt4-x11-free" failed for me until I did "bitbake gtk+",
> >> qt4-x11-free needs some sort of dependency on gtk+ to avoid the failure
> >> below.  I'm guessing it's something like the following added to
> >> qt4-x11-free.inc:
> >> 
> >> PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '',
> >> d)}"
> >> PACKAGECONFIG[gtk] = "-gtkstyle,-no-gtkstyle,gtk+"
> >> 
> >> but since it takes about an hour to build qt4-x11-free on my system I'm
> >> hoping somebody can tell me whether that's the right approach.
> > 
> > This seems reasonable to me. I can't actually reproduce the failure, but I
> > can see how the dependency comes in and it does look to be on by default.
>
> What actually happens is qt4 assumes -gtkstyle, but disables it if gtk+
> (not gtk+3) can't be located in sysroots by invoking pkgconfig.
> 
> qt4-x11-free already depends on x11 so looking for x11 in
> DISTRO_FEATURES will always succeed.

Right, that check alone wouldn't solve anything.
 
> Further, PACKAGECONFIG doesn't work because the recipe uses qmake and I
> can't see where changes to EXTRA_OECONF are ever applied.

Indeed, I had missed that - that's because we haven't yet used PACKAGECONFIG 
in conjunction with Qt (mainly because a lot of the Qt configure options 
effectively have more than two states which PACKAGECONFIG can't handle) and Qt 
doesn't use autotools so it doesn't already use EXTRA_OECONF.

> So unless there's a way to do something like PACKAGECONFIG that isn't
> PACKAGECONFIG, the options I see are either add -gtkstyle to
> QT_X11_FLAGS and gtk+ to DEPENDS, or leave DEPENDS alone and add
> -no-gtkstyle to QT_X11_FLAGS. I don't knowingly use qt4 so don't know
> whether the GTK theme is important, but I'm inclined to the former path
> (unconditionally enable gtk+).
> 
> Any better way to solve this?

We could add ${EXTRA_OECONF} to the configure command line and then the 
previously suggested PACKAGECONFIG will work. I'm tempted to suggest this 
should be off by default as well since most users of Qt in our environment will 
neither want nor expect it to depend on GTK+; having QGtkStyle enabled is (I 
would think) peripheral to most embedded use cases.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

