Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 456 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 May 2017 10:36:42 UTC
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 24D946B6EA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 10:36:42 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id HmV31v0060BmcFC01mV44s; Mon, 08 May 2017 11:29:07 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Y+WIilWN c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=tJ8p9aeEuA8A:10 a=elASCIoeAAAA:8 a=Q4-j1AaZAAAA:8
	a=dUJii8Bm11yG0-elK08A:9 a=CjuIK1q_8ugA:10 a=DKSRTSwd7xYA:10
	a=UlySpbFP9e0eES3xxyTT:22 a=9H3Qd4_ONW2Ztcrla5EB:22
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1d7fuZ-0002Zs-Pr; Mon, 08 May 2017 11:29:03 +0100
Date: Mon, 8 May 2017 11:29:03 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170508102903.GA9571@mcrowe.com>
References: <1449401194-31567-1-git-send-email-paul.barker@commagility.com>
	<20151215140434.75233de0@centos-7>
MIME-Version: 1.0
In-Reply-To: <20151215140434.75233de0@centos-7>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Barker <paul.barker@commagility.com>
Subject: Re: [PATCH RFC] module.bbclass: Fix potential do_compile/do_make_scripts race condition
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
X-List-Received-Date: Mon, 08 May 2017 10:36:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 15 December 2015 at 14:04:34 +0000, Paul Barker wrote:
> On Sun, 6 Dec 2015 11:26:33 +0000
> Paul Barker <paul.barker@commagility.com> wrote:
> 
> > I ran into a race condition building multiple external modules against a 3.10.y
> > series kernel using the dylan branch of OpenEmbedded. This is difficult to
> > reproduce as it requires very specific timing: the do_make_scripts task for one
> > module was linking the modpost script whilst the do_compile task for another
> > module was attempting to use the modpost script. This resulted in a permission
> > error:
> > 
> > ERROR: Function failed: do_compile (see /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434 for further information)
> > ERROR: Logfile of failure stored in: /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434
> > Log data follows:
> > | DEBUG: Executing shell function do_compile
> > | make -C /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel M=$PWD clean
> > | make[1]: Entering directory `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> > | make[1]: Leaving directory `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> > | make -C /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel M=$PWD modules
> > | make[1]: Entering directory `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> > |   CC [M]  /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/git/ti/runtime/hplib/module/hplibmod.o
> > |   Building modules, stage 2.
> > |   MODPOST 1 modules
> > | /bin/sh: scripts/mod/modpost: Permission denied
> > | make[2]: *** [__modpost] Error 126
> > | make[1]: *** [modules] Error 2
> > | make[1]: Leaving directory `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> > | make: *** [default] Error 2
> > | ERROR: Function failed: do_compile (see /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434 for further information)
> > ERROR: Task 1284 (/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/meta-mcsdk/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib-mod_git.bb, do_compile) failed with exit code '1'
> > 
> > Later kernel versions do not rebuild the modpost script every time that 'make
> > scripts' is invoked so they should be safe from this particular failure. However
> > I'm not convinced that running 'make scripts' whilst also building an
> > out-of-tree module is always safe on later kernels and there is always the
> > potential for vendor kernels to have different behaviour here.
> > 
> > Although this was seen on the dylan branch the behaviour of master and jethro
> > looks to be the same here - do_make_scripts is locked so that only one instance
> > of it may run at one time but there is nothing to prevent one instance of
> > do_make_scripts running at the same time as an instance of do_compile.
> > 
> > The patch I'm sending attempts to solve this issue by locking the do_compile
> > task with the same lockfile as the do_make_scripts task in module.bbclass so
> > that an instance of do_copile can't run at the same time as an instance of
> > do_make_scripts. I don't know enough about the task locking to guarantee that
> > this is the right solution or to be able to test that it works as expected so
> > I'm marking the patch as an RFC.
> > 
> > Please let me know if this is the right approach and if there is any easy way to
> > test this.
> > 
> > Paul Barker (1):
> >   module.bbclass: Fix potential do_compile/do_make_scripts race
> >     condition
> > 
> >  meta/classes/module.bbclass | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> 
> ping on this.
> 
> I've just got bitten by this again so it's not a one-off. Is anyone able to
> give me some feedback on the patch, whether this is the right approach to fix
> the problem and whether this is applicable to jethro/master.

We've started seeing the same symptom, but with a v3.14 kernel. We have
several recipes that build out-of-tree modules and I can see
do_make_scripts for one running at the same time as do_compile for the one
that fails.

If I try to reproduce the problem by hand, I cannot. However, I only see
modpost being compiled for one of the tasks in the logs.

I can't really explain why I see the problem with a newer kernel.
Regardless, it seems unwise to even attempt to run do_make_tasks and
do_compile in parallel.

It looks this patch was reviewed favourably, but doesn't seem to have made
it into master.

In the meantime, I'll try this patch and see if it makes the problem go
away for us.

Thanks.

Mike.

Original patch at https://patchwork.openembedded.org/patch/109269/ and
thread at
http://lists.openembedded.org/pipermail/openembedded-core/2015-December/113752.html
for those without long-term email archives.

