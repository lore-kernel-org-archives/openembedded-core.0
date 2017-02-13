Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD8C71A72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 12:19:08 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id kCK61u0070BmcFC01CK8Q7; Mon, 13 Feb 2017 12:19:08 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=QoEu5R6d c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=n2v9WMKugxEA:10 a=mDV3o1hIAAAA:8
	a=VstMSg-w4vT6cWokx0gA:9
	a=CjuIK1q_8ugA:10 a=qOx8Ico6AQcA:10 a=GBnqXKe9rgIA:10
	a=_FVE-zBwftR9WsbkzFJk:22
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1cdFaz-0000XK-Rl; Mon, 13 Feb 2017 12:19:05 +0000
Date: Mon, 13 Feb 2017 12:19:05 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170213121905.GA887@mcrowe.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
	<ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
	<20170208115042.GA21576@mcrowe.com>
	<1486559082.13854.12.camel@intel.com>
	<20170208134810.GA29105@mcrowe.com>
	<1486657479.13854.85.camel@intel.com>
	<20170210183213.GA10017@mcrowe.com>
	<1486983272.13854.223.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1486983272.13854.223.camel@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Mon, 13 Feb 2017 12:19:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 13 February 2017 at 11:54:32 +0100, Patrick Ohly wrote:
> On Fri, 2017-02-10 at 18:32 +0000, Mike Crowe wrote:
> > On Thursday 09 February 2017 at 17:24:39 +0100, Patrick Ohly wrote:
> > > On Wed, 2017-02-08 at 13:48 +0000, Mike Crowe wrote:
> > > > On Wednesday 08 February 2017 at 14:04:42 +0100, Patrick Ohly wrote:
> > The part I'd missed is the all-important line in source-release-world.bb:
> > 
> >  do_source_release[depends] += "core-image-sato:do_build"
> 
> Okay, that explains it.
> 
> IMHO this do_build dependency should trigger do_rm_work. Your "bitbake
> -c all_source_releases source-release-world" intentionally includes a
> real world build, not just executing the source release tasks. Cleaning
> up while building is the goal of rm_work.bbclass. It's arguably a
> deficiency in the previous rm_work.bbclass that it wasn't active in your
> case.
> 
> Now we just need to find a way to combine these without breaking the
> extra tasks.
> 
> > > It seems unsafe to have tasks that are not properly ordered and just
> > > rely on not activating them in the same build, but without understanding
> > > the problem better it is too early to look for a solution.
> > 
> > Thanks for investigating. If you're still having trouble then I have a
> > single patch on top of current oe-core master that reproduces it for me
> > that I can send.
> 
> I can reproduce it.
> 
> As you said earlier, adding "before do_rm_work" solves the problem:
> addtask source_release before do_rm_work

I'd temporarily forgotten that this would cause every build to include the
source release when I wrote that. :(

> That's okay, even when rm_work.bbclass does not get inherited. However,
> when rm_work.bbclass, a "normal" build like "bitbake menu-cache" ends up
> triggering the source_release task:
> 
> $ bitbake -g menu-cache
> ...
> $ grep do_rm_work task-depends.dot  | grep do_source_release | grep menu-cache
> "menu-cache.do_rm_work" -> "menu-cache.do_source_release"
> 
> Is that acceptable for you?

Not really.

> To me it seems like the right solution. Inheriting
> release-source.bbclass could be limited to builds which produce
> releases, for example in your CI setup, then normal developers will not
> be affected.

At the moment it is straightforward to build the source release with a
simple bitbake invocation.

Your solution would work, but it would be necessary to meddle with
local.conf or similar in order to generate the source release.

Is there any way we can get our tasks in as predecessors of rm_work only if
they would have run anyway? Rather like the way make(1) supports order-only
prerequisites[1]?

Thanks.

Mike.

[1] https://www.gnu.org/software/make/manual/html_node/Prerequisite-Types.html

