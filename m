Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTGQ9-0000Xq-7Z for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 18:15:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pANH9AKA014867
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 17:09:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14626-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 17:09:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pANH921W014861
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 17:09:03 GMT
Message-ID: <1322068148.15626.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2011 17:09:08 +0000
In-Reply-To: <1322066940.26081.27.camel@phil-desktop>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<E459AF7A-6F7C-43F7-85C8-784419C4E6FE@dominion.thruhere.net>
	<3298934.bvzy1dahMQ@helios> <1322066940.26081.27.camel@phil-desktop>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 17:15:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-23 at 16:48 +0000, Phil Blundell wrote:
> On Wed, 2011-11-23 at 16:33 +0000, Paul Eggleton wrote:
> > On Wednesday 23 November 2011 16:59:56 Koen Kooi wrote:
> > > We also agreed that the current behaviour should be retained, so needing to
> > > add pulse to distro features would go against that. Having said that, I
> > > personally would dislike having negative ('nopulseaudio') entries to
> > > address that. Feedback needed :)
> > 
> > I don't see how we can achieve this without making a huge mess. I'm happy to 
> > be proven wrong, but I would really like us to figure this stuff out soon so we 
> > can get the actual problem here fixed.
> 
> Agreed.  This problem (or variants of it) comes up fairly frequently: we
> had a similar amount of grief when ipv4 and ipv6 became DISTRO_FEATURES
> and everybody who wasn't paying attention found that they suddenly had
> no networking.  But I think it is basically insoluble in the general
> case without any extra stateful mechanics: we need to either:
> 
> a) decide that what we have today, or at some other arbitrary point, is
> the "base configuration" and any departure from that (including
> removals) will now be a DISTRO_FEATURE.  This means accepting things
> like "nopulseaudio" which are, admittedly, ugly; or
> 
> b) introduce some sort of concept of "feature epochs", where the DISTRO
> gets to declare what epoch it is expecting and the compatibility code
> then backfills DISTRO_FEATURES to take account of things that were
> enabled by default in past epochs but have since been removed.  This
> introduces a certain extra maintenance burden but it means that DISTROs
> will no longer get unpleasant surprises; or
> 
> c) just live with the status quo and accept that things will break when
> features are turned off.
> 
> My personal preference would be for (b) but I could live with (a) just
> as well.

I'm wondering if we can do something in the core like:

DISTRO_FEATURES_BACKFILLOPTS = "pulseaudio"

and have the distro set:

DISTRO_FEATURES_BACKFILLCONSIDERED = ""

and then add some code which looks for anything in
DISTRO_FEATURES_BACKFILLOPTS but not in
DISTRO_FEATURES_BACKFILLCONSIDERED and adds it to DISTRO_FEATURES.

Distros can then opt out of a given feature by adding it to
DISTRO_FEATURES_BACKFILLCONSIDERED.

This would let us maintain compatibility but also move forward and
create new settings with names that make sense.

Cheers,

Richard





