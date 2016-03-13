Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4281F6080F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:04:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 13 Mar 2016 16:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,333,1455004800"; d="scan'208";a="932982746"
Received: from tbcheng-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.252])
	by orsmga002.jf.intel.com with ESMTP; 13 Mar 2016 16:03:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 14 Mar 2016 12:03:55 +1300
Message-ID: <1536468.FPlEIzoFz6@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.3-300.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <56E5E180.30408@gmail.com>
References: <1457836529-32388-1-git-send-email-twoerner@gmail.com>
	<1773609.Q7X4j5YgZm@peggleto-mobl.ger.corp.intel.com>
	<56E5E180.30408@gmail.com>
MIME-Version: 1.0
Cc: Randy Witt <randy.e.witt@intel.com>, Brian Avery <brian.avery@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] metadata-revs: provide more information
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
X-List-Received-Date: Sun, 13 Mar 2016 23:04:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sun, 13 Mar 2016 17:54:08 Trevor Woerner wrote:
> On 03/13/16 16:53, Paul Eggleton wrote:
> > On Sun, 13 Mar 2016 16:42:41 Trevor Woerner wrote:
> >> That's the problem I'm trying to solve: how can I easily keep all the
> >> information required to reproduce this build, exactly. The whole "two
> >> meta's" thing was just a speed bump.
> > 
> > Right, understood, and it does make sense. I'm convinced there is an
> > underlying problem to fix that this just papers over though.
> 
> Okay, I think I see your point, and I agree. There is a layer clone
> problem that should be addressed.
> 
> But again, I think this is a speed bump.
> 
> My underlying point is that we're purposefully leaving out information
> that is vital to reproducible builds.
> 
> > This probably fits with what you said at OEDEM, which was that too often
> > the system doesn't build properly out of the box for various boards. Have
> > you had a chance to think about that problem further?
> 
> Oh yes, but I'm rather sure nobody's going to like my suggestion, which
> makes me hesitant to suggest it ;-)

You may be surprised ;)

> It should be possible for me to hand you _one_ configuration file and
> from that you could reproduce my entire build in _one_ step by issuing
> _one_ command. If I can get something to build successfully for a given
> board, you should too. But currently that's not always the case.
> 
> bblayers.conf and local.conf should somehow be rolled into one and the
> build should have some sort of "repo tool"-like functionality built in.
>
> I hand you this one configuration file, you run "bitbake some-or-other"
> and the build starts by going through the provided list of layers
> checking out the exact ones I have used and potentially checking them
> out at the exact revisions I've used. This means the layer list will
> have to specify from where the layer was found, which branch, what the
> HEAD was, etc. In other words, exactly the information I'm trying to
> capture at the end of any build today.

Actually, you're not the first to suggest this - at least it's come up in 
discussions about running builds from Toaster and again separately for running 
builds within fairly generic containers. For those purposes it really would be 
nice if we could have a single file that completely describes how to run a 
build (i.e. metadata revisions and configuration), and it would also be very 
useful for sending someone a build to test on their system - in the absence of 
local changes, of course. Like anything else though the devil is in the 
details. I suspect we will try to implement at least the basic capability in 
the next release.

> Newbies would have a better out-of-box experience. Chances are they just
> bought some board and want to make a build for it. I think it is rare
> that someone stumbles onto The Yocto Project and is happy just doing
> builds for qemu. My belief is that people find The Yocto Project as a
> secondary event, the main event is they want to perform a build for the
> hardware that just arrived and is sitting on their desk. The generic
> documentation doesn't target their board specifically, so in addition to
> trying to understand this new build system, they also have to figure out
> how to get a layer, where to get it from, and how to add it to their
> build. I know that The Yocto Project does have BSPs for beaglebone,
> raspberry pi 2, generic x86(-64), edgerouter, and some ppc board... and
> if this newbie happens to have one of those, things might go better. But
> if they have some other board...
> 
> I think experienced developers would be helped too by the combined
> config+layer-full-details thing too. For example, developers would swap
> configs between each other more easily, and build artifacts could be
> kept for future reference which is very important in a production
> environment.
> 
> The current way of doing things purposely hides information, and this is
> bad.
> 
> bblayers only tells you that on a given day on a specific machine there
> was a layer at a specific location that was used for this build. If that
> layer is something that was pulled from somewhere else (and not, as Khem
> was mentioning, something that was done locally) then there is no
> mechanism anywhere that preserves this information. There's a gap; a gap
> in the information. On my machine there's a meta-browser layer, on
> github there are hundreds of meta-browser layers, bblayers just says I
> used something called meta-browser... but the link is missing which
> points to from where I got this layer.

Right, shipping around bblayers.conf doesn't really help much I agree. I don't 
think bblayers.conf was meant to be used in that way though. If we want an 
interchange format I think the time has come to create one.
 
> If I wanted to be really devious I could clone my repositories with any
> weird old name I wanted. I could clone meta-browser and name it
> openembedded-core and clone openembedded-core and name it meta-trevor.
> My build would still work 100%, but good luck with that! :-D
> 
> The genie's out of the bottle. There already are hundreds of clones.
> There is no way to police it, there is no way to force people to use
> globally unique names. 

I wouldn't suggest trying to police it, as you say it would be impossible. 
What I think is at least theoretically possible is to address some of the 
issues we have that make people feel the need to create their own forks for 
anything beyond testing / distributing changes on a short-term basis.

> I don't want to embarrass anyone by giving names, and I certainly don't
> want to be seen as a troll :-( I've been playing around with a large
> number of boards for the last while and there are lots of issues that
> I've come across. I already mentioned my thoughts on the out-of-box
> experience for newbies who have just bought a board and now have to
> figure out how to successfully add a layer.

I don't see this kind of thing as trolling. I believe If we have a fundamental 
problem then we really need to address it head on rather than grumbling to 
ourselves and working around it - which isn't what you're doing right now, 
don't get me wrong - it's good that we're at least talking in general terms, 
but I believe we need to go deeper.

> Another thing I come across is the following: given a company (ACME) who
> produces a bunch of boards (ACME-1, ACME-2, and ACME-3). The ACME-1 has
> CPU-1, ACME-2 has CPU-2, and ACME-3 has CPU-3. On github you'll find
> several meta-acme's and a couple meta-cpu's. Some of the meta-acme's
> will have support for one or more of the ACME-n boards, but not
> necessarily all of them, or you might find your board is supported by
> one of the meta-cpu repositories you've found. You'll even find one of
> those meta-acme's in the layerindex, but the developer of that
> particular layer only has 2 out of the 3 boards so that's all their
> layer supports. If you happen to have the one that's not in layerindex's
> meta-acme then you'll need to google and use some other meta-acme you've
> found yourself. When you ask the maintainers of the various meta-acme's
> to please get together and make sure the layerindex layer fully supports
> all the ACME board, sadly that doesn't happen. When you provide patches
> and pull requests to add the missing support, you're at the mercy of the
> maintainer, who is happy to refuse your contribution for all manner of
> reasons ;-)

Maintainers generally have the final say on what goes into a layer and I'm not 
sure it could really be any other way. However, the OE TSC is supposed to be 
how we resolve any technical disputes or other problems that can't be resolved 
through normal channels, and I'd encourage everyone to contact the TSC if they 
feel like a problem is being ignored or isn't being addressed in a manner that 
benefits the wider community. As an aside I noticed the TSC page was somewhat 
out-of-date so I went ahead and updated it:

  http://www.openembedded.org/wiki/TSC

To clarify, I do understand people will fork things (and github encourages 
forking, and I'm definitely not saying that's a bad thing). However if OE needs 
to do better at testing or highlighting how to get a working build or 
something else entirely that's what we should strive to do; let's talk about 
that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

