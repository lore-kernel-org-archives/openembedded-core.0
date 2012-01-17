Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RnILg-0005ZJ-Fx for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 00:21:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HNE9bU013084;
	Tue, 17 Jan 2012 23:14:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12556-05; Tue, 17 Jan 2012 23:14:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HNDxj9013078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 Jan 2012 23:14:00 GMT
Message-ID: <1326842038.2529.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 23:13:58 +0000
In-Reply-To: <1427429.26ZIzxQgNj@helios>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<1322068148.15626.15.camel@ted> <1412695.vvBBPeJL4B@helios>
	<1427429.26ZIzxQgNj@helios>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Phil Blundell <philb@gnu.org>
Subject: Process for New DISTRO_FEATURES (was: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE)
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
X-List-Received-Date: Tue, 17 Jan 2012 23:21:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-16 at 17:58 +0000, Paul Eggleton wrote:
> On Thursday 29 December 2011 12:55:56 Paul Eggleton wrote:
> > On Wednesday 23 November 2011 17:09:08 Richard Purdie wrote:
> > > On Wed, 2011-11-23 at 16:48 +0000, Phil Blundell wrote:
> > > > b) introduce some sort of concept of "feature epochs", where the
> > > > DISTRO
> > > > gets to declare what epoch it is expecting and the compatibility
> > > > code
> > > > then backfills DISTRO_FEATURES to take account of things that were
> > > > enabled by default in past epochs but have since been removed.  This
> > > > introduces a certain extra maintenance burden but it means that
> > > > DISTROs
> > > > will no longer get unpleasant surprises
> > > 
> > > I'm wondering if we can do something in the core like:
> > > 
> > > DISTRO_FEATURES_BACKFILLOPTS = "pulseaudio"
> > > 
> > > and have the distro set:
> > > 
> > > DISTRO_FEATURES_BACKFILLCONSIDERED = ""
> > > 
> > > and then add some code which looks for anything in
> > > DISTRO_FEATURES_BACKFILLOPTS but not in
> > > DISTRO_FEATURES_BACKFILLCONSIDERED and adds it to DISTRO_FEATURES.
> > > 
> > > Distros can then opt out of a given feature by adding it to
> > > DISTRO_FEATURES_BACKFILLCONSIDERED.
> > > 
> > > This would let us maintain compatibility but also move forward and
> > > create new settings with names that make sense.
> > 
> > I'd like to try to move forward with this fix (although I prefer an
> > alternative term to "backfill", perhaps "introduce" instead?) If this is
> > what we want to do, should it be implemented by:
> > 
> > (a) modifying DISTRO_FEATURES directly (as I think Richard is suggesting),
> > or
> > 
> > (b) a simple python call that the distro needs to add to their own
> > DISTRO_FEATURES (i.e. "${@distro_features_introduce(d)}" ?
> > 
> > Option (a) is a little tidier but (b) makes it obvious where any introduced
> > items in DISTRO_FEATURES are coming from.
> 
> This was brought up at the last TSC meeting, but we agreed to leave the 
> discussion on the mailing list for the moment.
> 
> So, any thoughts?

In the intervening time I haven't come up with anything better. I would
like to move forward on this issue. I think the main thing is to
document the variables clearly. The names aren't brilliant but with
reasonable comments we should be ok...

Cheers,

Richard





