Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id AB3B67739B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 18:32:15 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id j6YD1u0020BmcFC016YEeZ; Fri, 10 Feb 2017 18:32:15 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Hr8GIwbS c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=n2v9WMKugxEA:10 a=CSdTWWOMC6ZjLuihBg8A:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1ccFzR-0002k1-IX; Fri, 10 Feb 2017 18:32:13 +0000
Date: Fri, 10 Feb 2017 18:32:13 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170210183213.GA10017@mcrowe.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
	<ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
	<20170208115042.GA21576@mcrowe.com>
	<1486559082.13854.12.camel@intel.com>
	<20170208134810.GA29105@mcrowe.com>
	<1486657479.13854.85.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1486657479.13854.85.camel@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 10 Feb 2017 18:32:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 09 February 2017 at 17:24:39 +0100, Patrick Ohly wrote:
> On Wed, 2017-02-08 at 13:48 +0000, Mike Crowe wrote:
> > On Wednesday 08 February 2017 at 14:04:42 +0100, Patrick Ohly wrote:
> > > On Wed, 2017-02-08 at 11:50 +0000, Mike Crowe wrote:
> > > > On Friday 13 January 2017 at 15:52:33 +0100, Patrick Ohly wrote:
> > > > > The right solution is to inject do_rm_work before do_build and after
> > > > > all tasks of the recipe. Achieving that depends on the new bitbake
> > > > > bb.event.RecipeTaskPreProcess and bb.build.preceedtask().
> > > > 
> > > > We've run into trouble with this change. We have a number of custom
> > > > ancillary tasks that are used to generate source release files and run
> > > > package tests. No other tasks (including do_build) depend on these tasks
> > > > since they are run explicitly when required using bitbake -c; either
> > > > directly or via a recrdeptask.
> > > > 
> > > > Running a single task continues to work correctly - presumably this is
> > > > because the do_build task is not being run, so its dependencies (including
> > > > rm_work) aren't run either.
> > > > 
> > > > Running via the recrdeptask fails. This is because for any particular
> > > > recipe we end up depending on both do_build and the source release tasks.
> > > > There's nothing to stop do_rm_work running before (or even during!) one of
> > > > the source release tasks.
> > > 
> > > Can you show how you use recrdeptask and how you call bitbake to trigger
> > > those extra tasks, just for my understanding?
> > 
> > Certainly, we have a bbclass globally in INHERIT that contains:
> > 
> >  addtask source_release # potential fix here
> >  do_source_release() {
> >      :
> >  }
> > 
> >  addtask all_source_releases
> >  xx_do_all_source_releases() {
> >      :
> >  }
> > 
> >  do_all_source_releases[nostamp] = "1"
> >  do_all_source_releases[recrdeptask] += "do_all_source_releases do_source_release"
> > 
> >  addtask husk_recipe before do_source_release
> >  python xx_do_husk_recipe() {
> >     ...
> >  }
> > 
> >  (there's also another task similar to do_husk_recipe)
> > 
> > and in the particular recipe that has trouble with racing against rm_work:
> > 
> >  do_husk_recipe() {
> >     # do stuff in ${WORKDIR}
> >  }
> >  addtask husk_recipe after do_populate_sysroot before do_source_release
> > 
> > there's also a source-release-world recipe that contains:
> > 
> >  DEPENDS = "our-image"
> > 
> > and we run:
> > 
> >  bitbake -c all_source_releases source-release-world
> 
> I tried to replicate that with Poky master (= 226a508da), but without
> luck:
> 
> /work/poky$ cat meta/classes/release-source.bbclass 
> addtask source_release # potential fix here
> do_source_release() {
>     :
> }
> 
> addtask all_source_releases
> do_all_source_releases() {
>     :
> }
> 
> do_all_source_releases[nostamp] = "1"
> do_all_source_releases[recrdeptask] += "do_all_source_releases do_source_release"
> 
> addtask husk_recipe before do_source_release
> python do_husk_recipe() {
>     pass
> }
> 
> /work/poky$ cat meta/recipes-core/husk/husk.bb 
> LICENSE = "custom"
> 
> do_husk_recipe() {
>     # do stuff in ${WORKDIR}
>     :
> }
> addtask husk_recipe after do_populate_sysroot before do_source_release
> 
> /work/poky$ cat meta/recipes-core/husk/source-release-world.bb
> LICENSE = "custom"
> DEPENDS = "core-image-sato"
> 
> /work/poky/build$ tail -1 conf/local.conf
> INHERIT += "rm_work release-source"

The part I'd missed is the all-important line in source-release-world.bb:

 do_source_release[depends] += "core-image-sato:do_build"

We have this to ensure that the source release includes everything that is
required to build the rootfs itself. (For example, elfutils-native is only
included if this line is present.)

> /work/poky/build$ bitbake --dry-run -c all_source_releases source-release-world
> ...
> 
> That last command does not trigger the do_rm_work task and thus there is
> also no race.

That was my experience without the magic extra line too. Sorry I omitted
that.

> It seems unsafe to have tasks that are not properly ordered and just
> rely on not activating them in the same build, but without understanding
> the problem better it is too early to look for a solution.

Thanks for investigating. If you're still having trouble then I have a
single patch on top of current oe-core master that reproduces it for me
that I can send.

Mike.

