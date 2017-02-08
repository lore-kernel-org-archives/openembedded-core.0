Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 455 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Feb 2017 11:58:20 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id A759460621
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:58:20 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id iBqi1u0080BmcFC01BqjNM; Wed, 08 Feb 2017 11:50:44 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=QoEu5R6d c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=n2v9WMKugxEA:10 a=4WVi_W3CE8yTpJeQ81sA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1cbQlm-0006di-Oo; Wed, 08 Feb 2017 11:50:42 +0000
Date: Wed, 8 Feb 2017 11:50:42 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20170208115042.GA21576@mcrowe.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
	<ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
MIME-Version: 1.0
In-Reply-To: <ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Wed, 08 Feb 2017 11:58:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 13 January 2017 at 15:52:33 +0100, Patrick Ohly wrote:
> Having do_rm_work depend on do_build had one major disadvantage:
> do_build depends on the do_build of other recipes, to ensure that
> runtime dependencies also get built. The effect is that when work on a
> recipe is complete and it could get cleaned up, do_rm_work still
> doesn't run because it waits for those other recipes, thus leading to
> more temporary disk space usage than really needed.
> 
> The right solution is to inject do_rm_work before do_build and after
> all tasks of the recipe. Achieving that depends on the new bitbake
> bb.event.RecipeTaskPreProcess and bb.build.preceedtask().

We've run into trouble with this change. We have a number of custom
ancillary tasks that are used to generate source release files and run
package tests. No other tasks (including do_build) depend on these tasks
since they are run explicitly when required using bitbake -c; either
directly or via a recrdeptask.

Running a single task continues to work correctly - presumably this is
because the do_build task is not being run, so its dependencies (including
rm_work) aren't run either.

Running via the recrdeptask fails. This is because for any particular
recipe we end up depending on both do_build and the source release tasks.
There's nothing to stop do_rm_work running before (or even during!) one of
the source release tasks.

> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 3516c7e..fda7bd6 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -117,7 +107,13 @@ rm_work_rootfs () {
>  }
>  rm_work_rootfs[cleandirs] = "${WORKDIR}/rootfs"
>  
> -python () {
> +# We have to add the do_rmwork task already now, because all tasks are
> +# meant to be defined before the RecipeTaskPreProcess event triggers.
> +# The inject_rm_work event handler then merely changes task dependencies.
> +addtask do_rm_work
> +addhandler inject_rm_work
> +inject_rm_work[eventmask] = "bb.event.RecipeTaskPreProcess"
> +python inject_rm_work() {
>      if bb.data.inherits_class('kernel', d):
>          d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN"))
>      # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
> @@ -126,4 +122,17 @@ python () {
>      if pn in excludes:
>          d.delVarFlag('rm_work_rootfs', 'cleandirs')
>          d.delVarFlag('rm_work_populatesdk', 'cleandirs')
> +    else:
> +        # Inject do_rm_work into the tasks of the current recipe such that do_build
> +        # depends on it and that it runs after all other tasks that block do_build,
> +        # i.e. after all work on the current recipe is done. The reason for taking
> +        # this approach instead of making do_rm_work depend on do_build is that
> +        # do_build inherits additional runtime dependencies on
> +        # other recipes and thus will typically run much later than completion of
> +        # work in the recipe itself.
> +        deps = bb.build.preceedtask('do_build', True, d)
> +        if 'do_build' in deps:
> +            deps.remove('do_build')
> +        # In practice, addtask() here merely updates the dependencies.
> +        bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
>  }

It seems that we need to ensure that do_rm_work also needs to depend on our
ancillary tasks too, but only if they are being built. I'm unsure how this
can be done though. :(

For the time being, I've reverted this patch in our tree and it seems to
have resolved the problem. I'd be very interested in knowing what the
correct solution would be.

Mike.

