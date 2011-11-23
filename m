Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RTG6c-0007b5-77
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 17:55:30 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RTG0K-0008Hw-BD
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 17:49:00 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2011 16:48:59 +0000
In-Reply-To: <3298934.bvzy1dahMQ@helios>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<E459AF7A-6F7C-43F7-85C8-784419C4E6FE@dominion.thruhere.net>
	<3298934.bvzy1dahMQ@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322066940.26081.27.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 23 Nov 2011 16:55:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-23 at 16:33 +0000, Paul Eggleton wrote:
> On Wednesday 23 November 2011 16:59:56 Koen Kooi wrote:
> > We also agreed that the current behaviour should be retained, so needing to
> > add pulse to distro features would go against that. Having said that, I
> > personally would dislike having negative ('nopulseaudio') entries to
> > address that. Feedback needed :)
> 
> I don't see how we can achieve this without making a huge mess. I'm happy to 
> be proven wrong, but I would really like us to figure this stuff out soon so we 
> can get the actual problem here fixed.

Agreed.  This problem (or variants of it) comes up fairly frequently: we
had a similar amount of grief when ipv4 and ipv6 became DISTRO_FEATURES
and everybody who wasn't paying attention found that they suddenly had
no networking.  But I think it is basically insoluble in the general
case without any extra stateful mechanics: we need to either:

a) decide that what we have today, or at some other arbitrary point, is
the "base configuration" and any departure from that (including
removals) will now be a DISTRO_FEATURE.  This means accepting things
like "nopulseaudio" which are, admittedly, ugly; or

b) introduce some sort of concept of "feature epochs", where the DISTRO
gets to declare what epoch it is expecting and the compatibility code
then backfills DISTRO_FEATURES to take account of things that were
enabled by default in past epochs but have since been removed.  This
introduces a certain extra maintenance burden but it means that DISTROs
will no longer get unpleasant surprises; or

c) just live with the status quo and accept that things will break when
features are turned off.

My personal preference would be for (b) but I could live with (a) just
as well.

p.




