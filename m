Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T206P-00063W-No
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 15:27:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 06:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,778,1336374000"; d="scan'208";a="134975987"
Received: from unknown (HELO helios.localnet) ([10.252.121.76])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 06:15:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 16 Aug 2012 14:15:09 +0100
Message-ID: <4232599.R290qD4K8p@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <A2678AC1-3CB1-4405-BB18-8441249ED0EE@dominion.thruhere.net>
References: <A2678AC1-3CB1-4405-BB18-8441249ED0EE@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to override bitbake.conf defaults in layers properly?
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
X-List-Received-Date: Thu, 16 Aug 2012 13:27:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 16 August 2012 13:57:44 Koen Kooi wrote:
> I spent the morning backporting kernel.bbclass changes to the meta-oe denzil
> branch and I've run into a problem: STAGING_KERNEL_DIR needs to change to
> match the updated class. In this specific case I can work with Scott and
> Eric to see if those kernel.bbclass changes can go into oe-core and meta-oe
> at the same time. That's something for next week :) In the meantime I'm
> wondering what the best way is to fix this in cases where you can't
> influence oe-core.

So let's be clear, having a copy of kernel.bbclass in meta-oe is half the 
reason you have this problem. The sooner we get out of this situation the 
better, IMHO.

> I see a number of options:
> 
> 1) set STAGING_KERNEL_DIR in layer.conf. I don't know if that's parsed
> before or after bitbake.conf, but it feels like the cleanest solution 

layer.conf for each layer is parsed very early - before bitbake.conf, so if 
you're looking to alter things that are set in bitbake.conf there it's not 
really going to work unless you use override hacks.

> 2) set it in $DISTRO.conf. Easy enough, breaks every other distro out there

To answer for everyone else's benefit, this is normally the correct place to 
globally override defaults set in bitbake.conf, and for the avoidance of 
confusion, settings in the distro config will absolutely take precedence. It's 
not workable in this situation, but this situation is a special one.

> 3) copy over bitbake.conf. Might work with some BBPATH magic, but in the end
> doesn't scale when >1 layers do it

With all of the other settings in bitbake.conf and the maintenance pain this 
would lead to this is not a good idea.

> 4) provide a custom denzil branch of oe-core, another easy way, but very
> antisocial

Perhaps, but if the changes were not accepted in OE-Core denzil branch it 
would be more than a little antisocial to expect to impose them via meta-oe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


