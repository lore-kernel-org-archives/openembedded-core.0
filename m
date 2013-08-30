Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A6A5F6BD68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 13:37:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2013 06:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,990,1367996400"; d="scan'208";a="394525188"
Received: from unknown (HELO helios.localnet) ([10.252.123.73])
	by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2013 06:37:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Fri, 30 Aug 2013 14:37:13 +0100
Message-ID: <2056053.nfWMgOXbJx@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <521CF70C.2050100@pabigot.com>
References: <521CF70C.2050100@pabigot.com>
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
X-List-Received-Date: Fri, 30 Aug 2013 13:37:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Peter,

On Tuesday 27 August 2013 13:59:24 Peter A. Bigot wrote:
> Since "bitbake qt4-x11-free" failed for me until I did "bitbake gtk+",
> qt4-x11-free needs some sort of dependency on gtk+ to avoid the failure
> below.  I'm guessing it's something like the following added to
> qt4-x11-free.inc:
> 
> PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '',
> d)}"
> PACKAGECONFIG[gtk] = "-gtkstyle,-no-gtkstyle,gtk+"
> 
> but since it takes about an hour to build qt4-x11-free on my system I'm
> hoping somebody can tell me whether that's the right approach.

This seems reasonable to me. I can't actually reproduce the failure, but I can 
see how the dependency comes in and it does look to be on by default.

Looking at bitbake -g output (for master at least) it seems like gtk+3 will 
always be built by default when building qt4-x11-free because pulseaudio 
depends upon it, so that explains how this problem doesn't often come up. Of 
course if gtk+3 is rebuilding when qt4-x11-free is in do_compile, or you've 
disabled pulseaudio, then this issue will occur so we do need to do something 
such as the above. I think the PACKAGECONFIG option for this should be called 
"gtkstyle" rather than just "gtk" to give a better idea of what it's enabling 
though. Would you please send an actual patch to add this?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

