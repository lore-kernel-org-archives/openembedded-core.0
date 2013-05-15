Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Uccgj-0000q9-Nb
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 16:28:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 May 2013 07:09:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,677,1363158000"; d="scan'208";a="337997083"
Received: from unknown (HELO helios.localnet) ([10.255.12.118])
	by fmsmga002.fm.intel.com with ESMTP; 15 May 2013 07:09:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Wed, 15 May 2013 15:09:29 +0100
Message-ID: <5543572.N8ppyBn6lW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <519372F1.6050902@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <3057509.dy5Cs7AUqs@helios>
	<519372F1.6050902@r-finger.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Wed, 15 May 2013 14:28:19 -0000
X-List-Received-Date: Wed, 15 May 2013 14:28:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 May 2013 12:35:13 Tomas Frydrych wrote:
> On 15/05/13 10:49, Paul Eggleton wrote:
> >> It prevents efficiently supporting clutter on any real machine that does
> >> not use mesa's GL, which means all machines not in meta-intel, and some
> >> machines in meta-intel. This is the main issue, real HW support.
> > 
> > How does it prevent that? Surely if machine-specific changes are required
> > then they will be required on top of a separate layer as much as they are
> > if the recipes remain in OE-Core.
> 
> It could be all pulled together into the meta-clutter layer, the
> supported BSPs and machines documented, etc, so that common machines
> just work out of the box. We could have a dedicated mailing list, a bug
> tracker, build a community around it, pull resources.

So we already have those things covering OE-Core. I would note that we already 
get complaints from users that there are multiple mailing lists covering OE, 
adding another one is just going to make it more difficult for users to figure 
out where to send questions, split discussions that start out being Clutter-
related but have a wider impact than just Clutter, etc. Clutter being a core 
piece of functionality and depending on BSP-specific functionality strengthens 
the argument for having discussions about it in a more general place rather 
than a specific one.

I understand the problem of Clutter releases apparently having unfortunate 
timing in relation to the OE-Core stabilisation period. That may be grounds 
for maintaining a staging layer for newer Clutter recipes that can be shared 
by those who need to have the latest stable version. It is not in itself 
grounds for completely moving those recipes out of the core.

> > You may well be right about the need to test on other GL implementations.
> > That does not explain how moving them to a separate layer directly helps
> > to address that need. You must also expect to make some changes to the
> > recipes themselves, so what changes would you be making?
> 
> It's not just about testing, you have to build it first: I would like to
> see a set of recipes that can support a whole bunch of machines in the
> public OE BSP layers out of the box: configs that work and make sense,
> patches where needed, documentation, including documentation of BSP
> specific issues.

If you're suggesting effectively taking a subset of machine-specific items out 
of BSPs and into a separate non-BSP layer, this is not a good plan IMO. I know 
you have been doing this in Guacamayo already and frankly it has always 
concerned me. Can you not just get the appropriate changes into the BSP layers 
so that when you add the BSP on top of OE-Core it does just work "out of the 
box"? If clutter is taken out of OE-Core this becomes even harder because then 
BSPs can no longer bbappend clutter or cogl (if that is indeed what is 
required in order to enable machine-specific functionality) without fiddling 
around with BBMASK or keeping the appends in yet another separate layer so 
they don't impact other BSP users who aren't building Clutter.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


