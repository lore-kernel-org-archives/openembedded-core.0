Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DA23B601D4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Nov 2015 20:06:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2015 12:06:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,360,1444719600"; d="scan'208";a="830385772"
Received: from wlaw4-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.131])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2015 12:06:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: akuster808 <akuster808@gmail.com>
Date: Mon, 30 Nov 2015 09:06:28 +1300
Message-ID: <1592700.kHUBgMKmhe@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <56588FBB.3060907@gmail.com>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<56588FBB.3060907@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Sun, 29 Nov 2015 20:06:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Armin,

On Friday 27 November 2015 09:15:39 akuster808 wrote:
> On 11/26/2015 01:00 PM, Paul Eggleton wrote:
> > Over the past several years one of the regular complaints people have made
> > about our project has been that patches sometimes take a long time to make
> > it into master, and it's not always clear what the state of a patch is
> > during that time. On the other side of things, maintainers are finding it
> > increasingly hard to keep up with testing and integrating incoming
> > patches.
> 
> This is not all the result of the patchwork. As a maintainer I rarely
> use the patchwork in work flow as I have no access to the state change
> bits. So its harder to integrate patchwork into my workflow.

So I would argue you should have access to that and we should arrange it; 
having said that though my idea is any manual status updates with Patchwork 
should be minimal - we should pick up as much as we can from other actions 
you're already carrying out e.g. pushing the patch to your staging branch, 
running that through the autobuilder, etc. About the only ones where we can't 
pick something up would be where the patch is rejected, deferred, or master 
has moved on or the patch overlaps with another person's patch such that you 
ask the submitter to rebase; in those cases someone will need to mark the 
patch in patchwork by hand. Thinking aloud though it's possible we could do 
this via email if we embedded some kind of directive to patchwork in the reply 
to the mailing list; not sure how people feel about that idea but I think it's 
at least a possibility.

> Since the rules are to wait for changes to hit Master before moving them
> down the line adds time to merging patches to the stable branches. The
> Patchwork does not have an impact on that delay.

Not directly, but my hope is that automating a lot of this is going to smooth 
the flow of patches into master so that that part of the delay is minimised.

> What adds to the challenge of integrating patches is that a layer
> maintainer may shoot a patch directly into the stable branch so if I had
> that patch queued, I now have to back it out.

I agree that would generate a bit more work, but shouldn't it be as 
straightforward as a rebase though?

> Also, I do this work all on my free time so I do my work in batches with
> leads to some delay. I could probably do a better job at communication
> where things are in the process.

As far as I've seen you've been pretty proactive as far as communicating 
things goes, and it's definitely appreciated :)

>  Additionally,
> 
> > trivial mistakes sometimes creep in that would be fairly easy to catch
> > with an automated process. We've been talking about this for a while and
> > now I'd like to propose a plan to finally address this:
> > 
> > 1) Upgrade the OE Patchwork instance [0] to a newer release; this should
> > fix some of the problems we are having [1] plus give us additional
> > features. I propose using the fork that freedesktop.org are using [2] [3]
> > which is moving a bit faster than upstream Patchwork; whilst the changes
> > there may eventually make it upstream (and work is ongoing there) we have
> > a much greater ability to influence the fork given that it's being worked
> > on by one of my colleagues who is pushing it in the direction we need it
> > to go e.g. proper support for series as opposed to treating every patch
> > individually, improved UI, etc.
>
> Yes please.
> 
> > 2) Trigger automatic testing of submitted patches from Patchwork. We'd
> > have a script look at the contents of a patch and first check that the
> > expected style has been adhered to; second it would do some quick tests
> > to verify that the patch hasn't caused any immediately obvious
> > regressions. I've filed some bugs to cover this in more detail [4].
> 
> sounds good.
> 
> > 3) Provide a means to easily schedule an overnight build on the
> > autobuilder
> > for the set of patches that have passed the initial testing, as well as
> > present the results in a form that's easier to review for maintainers. For
> > OE- Core this would be tied into the Yocto Project autobuilder, but I
> > expect the tools could be made flexible.
> > 
> > At all stages through this process the patch status in patchwork will be
> > kept up-to-date so it's clear to everyone what's happening. I'm also
> > thinking we could do email notifications to the submitter (opt-in) though
> > that would be a later add-on.
> > 
> > Whilst the initial plan covers only OE-Core, once we get them working the
> > tools and scripts used should be just as applicable to other layers. I'm
> > also trying to ensure that the patch validation is generic enough so it
> > can live in OE-Core, and thus we can easily update and refine it over
> > time in line with the code itself as well as encourage submitters to use
> > the script on their own changes before sending.
> 
> Yes, I would like to use this with meta-oe
> 
> > Please let me know your thoughts on the above, most importantly on the
> > patchwork upgrade, since most of this hinges on that; I don't believe we
> > can practically base it on the version of Patchwork we are using now.
> 
> Yes we should enhance any tools that improve our workflow and quality of
> work.
> 
> Kind regards and thanks again Paul.

Thank you!

> > [Note that this email is cross-posted - it may be best to reply on OE-Core
> > only to save people's inboxes.]
> > 
> > Thanks,
> > Paul
> > 
> > [0] http://patchwork.openembedded.org/
> > [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7657#c21
> > [2] http://patchwork.freedesktop.org/
> > [3] https://github.com/dlespiau/patchwork
> > [4] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8648

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

