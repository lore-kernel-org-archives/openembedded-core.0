Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 454 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Feb 2017 13:55:49 UTC
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id E83D871C27
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:55:49 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id iDoB1u0020BmcFC01DoCsA; Wed, 08 Feb 2017 13:48:14 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Hr8GIwbS c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=n2v9WMKugxEA:10 a=gdCW4lFhI8uyIvVjrxcA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1cbSbS-00089i-TQ; Wed, 08 Feb 2017 13:48:10 +0000
Date: Wed, 8 Feb 2017 13:48:10 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170208134810.GA29105@mcrowe.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
	<ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
	<20170208115042.GA21576@mcrowe.com>
	<1486559082.13854.12.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1486559082.13854.12.camel@intel.com>
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
X-List-Received-Date: Wed, 08 Feb 2017 13:56:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 08 February 2017 at 14:04:42 +0100, Patrick Ohly wrote:
> On Wed, 2017-02-08 at 11:50 +0000, Mike Crowe wrote:
> > On Friday 13 January 2017 at 15:52:33 +0100, Patrick Ohly wrote:
> > > The right solution is to inject do_rm_work before do_build and after
> > > all tasks of the recipe. Achieving that depends on the new bitbake
> > > bb.event.RecipeTaskPreProcess and bb.build.preceedtask().
> > 
> > We've run into trouble with this change. We have a number of custom
> > ancillary tasks that are used to generate source release files and run
> > package tests. No other tasks (including do_build) depend on these tasks
> > since they are run explicitly when required using bitbake -c; either
> > directly or via a recrdeptask.
> > 
> > Running a single task continues to work correctly - presumably this is
> > because the do_build task is not being run, so its dependencies (including
> > rm_work) aren't run either.
> > 
> > Running via the recrdeptask fails. This is because for any particular
> > recipe we end up depending on both do_build and the source release tasks.
> > There's nothing to stop do_rm_work running before (or even during!) one of
> > the source release tasks.
> 
> Can you show how you use recrdeptask and how you call bitbake to trigger
> those extra tasks, just for my understanding?

Certainly, we have a bbclass globally in INHERIT that contains:

 addtask source_release # potential fix here
 do_source_release() {
     :
 }

 addtask all_source_releases
 xx_do_all_source_releases() {
     :
 }

 do_all_source_releases[nostamp] = "1"
 do_all_source_releases[recrdeptask] += "do_all_source_releases do_source_release"

 addtask husk_recipe before do_source_release
 python xx_do_husk_recipe() {
    ...
 }

 (there's also another task similar to do_husk_recipe)

and in the particular recipe that has trouble with racing against rm_work:

 do_husk_recipe() {
    # do stuff in ${WORKDIR}
 }
 addtask husk_recipe after do_populate_sysroot before do_source_release

there's also a source-release-world recipe that contains:

 DEPENDS = "our-image"

and we run:

 bitbake -c all_source_releases source-release-world

> I suppose it worked before because your tasks could depend on do_build
> without triggering do_rm_work, while now that is included.

I believe so.

> > It seems that we need to ensure that do_rm_work also needs to depend on our
> > ancillary tasks too, but only if they are being built. I'm unsure how this
> > can be done though. :(
> 
> How do you determine whether the tasks need to run? Does it depend on
> how bitbake is invoked or does it depend on specific properties of the
> recipe?

Running bitbake as above.

I think that I could fix this by changing:

 addtask source_release

to

 addtask source_release before do_rm_work

(and also fixing any other tasks that suffer from this problem)

but I was hoping that there was a better fix to rm_work.bbclass itself.

Thanks.

Mike.

