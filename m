Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 88CA87101A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 19:55:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Dec 2014 11:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,559,1413270000"; d="scan'208";a="636310284"
Received: from acox1-desk.ger.corp.intel.com (HELO [10.255.13.133])
	([10.255.13.133])
	by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2014 11:54:06 -0800
Message-ID: <1418327646.4600.32.camel@picadillo>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 11 Dec 2014 13:54:06 -0600
In-Reply-To: <1418316320.4600.4.camel@picadillo>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<CAJTo0LaGa3ACsL+vLjzUDgEQDDxJ2L2m1WQgj1LHdbzpsJPLUg@mail.gmail.com>
	<CADkTA4P0XMtSxKop9vqr6SbS8KBmaGuZfKFs7Ej0CsDcqLt4DQ@mail.gmail.com>
	<1418306324.22903.72.camel@linuxfoundation.org>
	<1418309772.22903.74.camel@linuxfoundation.org>
	<1418316320.4600.4.camel@picadillo>
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2 PATCH 0/9] kernel: version updates
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
X-List-Received-Date: Thu, 11 Dec 2014 19:56:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-12-11 at 10:45 -0600, Tom Zanussi wrote:
> On Thu, 2014-12-11 at 14:56 +0000, Richard Purdie wrote:
> > On Thu, 2014-12-11 at 13:58 +0000, Richard Purdie wrote:
> > > On Thu, 2014-12-11 at 03:31 -0500, Bruce Ashfield wrote:
> > > > On Wed, Dec 10, 2014 at 10:02 AM, Burton, Ross <ross.burton@intel.com> wrote:
> > > > >
> > > > > On 10 December 2014 at 14:16, Bruce Ashfield <bruce.ashfield@windriver.com>
> > > > > wrote:
> > > > >>
> > > > >> The following changes since commit
> > > > >> 88dfcbf149dda89277e58ae4ec3a87500624cfff:
> > > > >>
> > > > >>   kernel-yocto: make sure git tags get dereferenced properly in do_patch()
> > > > >> (2014-12-10 08:12:56 -0500)
> > > > >>
> > > > >> are available in the git repository at:
> > > > >>
> > > > >>   git://git.pokylinux.org/poky-contrib HEAD
> > > > >
> > > > >
> > > > > I wonder what happened here!
> > > > 
> > > > @#!$#@$ the script is insane.
> > > > 
> > > > >
> > > > >>
> > > > >> for you to fetch changes up to 4be985be419f06f18c735d72ac4a4d00fea71dd8:
> > > > >>
> > > > >>   linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updates
> > > > >> (2014-12-10 08:38:49 -0500)
> > > > >
> > > > >
> > > > > That's zedd/kernel-updates, right?
> > > > >
> > > > 
> > > > Yah. Sorry about the confusion,
> > > 
> > > I've been experimenting, the upgrades look good but we have a problem
> > > with the new kernel class changes.
> > > 
> > > The issue is that if you have an existing TMPDIR, the build will do "bad
> > > things".
> > > 
> > > Basically, there is usually an existing sstate manifest file which
> > > covers the kernel source in the sysroot. do_configure will trigger
> > > cleaning of that manifest, a large chunk of the source disappears and
> > > then the build understandably fails.
> > > 
> > > Whilst I can say what is happening, I can't say how we fix it at this
> > > point :/.
> > > 
> > > I would like people to test these patches, we'd better hold off merging
> > > until we can get this issue figured out. Its part of a wider problem
> > > with "stale" data in the sysroot which we really need to figure out but
> > > its not been solved yet as its a  very hard problem for which we don't
> > > have a solution :(.
> > 
> > After quite some thinking, I've come up with the patch below which
> > should at least allow us to get this patch series merged. Obviously I
> > need to split this up and send it out properly with a decent commit log
> > but I thought I'd share it sooner than later.
> > 
> 
> I tried this on an old romley build and got this:
> 
> http://pastebin.com/WetCnesw
> 
> I then switched to nuc using the same tmpdir and that kernel built fine.
> 
> Note that the romley build uses the 3.10 kernel and the nuc build uses
> the 3.17 kernel - I don't know if that could account for the difference,
> or if it was more due to the fact that I did the romley build first and
> then the nuc, and if I'd done it in the reverse order it would have been
> the nuc failing instead.  Or something else...
> 

So, when I switched back to the romley machine and tried again, the
kernel built without error.  But..

I went back and reproduced the starting point, which I'll post here to
make it easy for anyone to reproduce, using the following commits:

poky: f19b4e995ea47f9243f152b39337330307453c9f
meta-intel: a72da6350e7a77256ad597e8e8c40909590a2a40

And verified the romley case again, and also saw the same thing with
nuc, which uses the 3.17 kernel.  In both cases the build failed and the
kernel source directory was empty e.g.:

/usr/local/dev/yocto/isg-test/build/tmp/sysroots/romley/usr/src/kernel

Switching to romley built fine, and switching back after that the nuc
kernel built fine again, and the kernel source dirs were populated in
both cases.

Below is the output from the nuc build:


[trz@medianoche build]$ bitbake virtual/kernel
NOTE: Converting staging layout from version 8/9 to layout version 10
NOTE: Uninstalling manifest
file /usr/local/dev/yocto/isg-test/build/tmp/sstate-control/manifest-nuc-linux-yocto.populate_sysroot
Parsing recipes: 100% |
##############################################################| Time:
00:00:19
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1314 targets,
46 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.25.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-20"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "nuc"
DISTRO            = "poky"
DISTRO_VERSION    = "1.7"
TUNE_FEATURES     = "m64 corei7"
TARGET_FPU        = ""
meta              
meta-yocto        
meta-yocto-bsp    =
"zedd-kernel-updates0:3554105e81a2084f23cae9fef8db8c7a1c4f7c04"
meta-intel        
meta-crownbay     
meta-nuc          
meta-romley       = "master20:a72da6350e7a77256ad597e8e8c40909590a2a40"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_kernel_checkout (log file is located
at /usr/local/dev/yocto/isg-test/build/tmp/work/corei7-64-intel-common-poky-linux/linux-yocto/3.17.1+gitAUTOINC+b86dd5c6f4_0caf16d385-r0/temp/log.do_kernel_checkout.9225)
ERROR: Logfile of failure stored
in: /usr/local/dev/yocto/isg-test/build/tmp/work/corei7-64-intel-common-poky-linux/linux-yocto/3.17.1+gitAUTOINC+b86dd5c6f4_0caf16d385-r0/temp/log.do_kernel_checkout.9225
Log data follows:
| DEBUG: Executing shell function do_kernel_checkout
| ERROR: S is not set to the linux source directory. Check
| ERROR: the recipe and set S to the proper extracted subdirectory
|
WARNING: /usr/local/dev/yocto/isg-test/build/tmp/work/corei7-64-intel-common-poky-linux/linux-yocto/3.17.1+gitAUTOINC+b86dd5c6f4_0caf16d385-r0/temp/run.do_kernel_checkout.9225:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_kernel_checkout (log file is located
at /usr/local/dev/yocto/isg-test/build/tmp/work/corei7-64-intel-common-poky-linux/linux-yocto/3.17.1+gitAUTOINC+b86dd5c6f4_0caf16d385-r0/temp/log.do_kernel_checkout.9225)
ERROR: Task 1
(/usr/local/dev/yocto/isg-test/meta/recipes-kernel/linux/linux-yocto_3.17.bb, do_kernel_checkout) failed with exit code '1'
NOTE: Tasks Summary: Attempted 69 tasks of which 58 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /usr/local/dev/yocto/isg-test/meta/recipes-kernel/linux/linux-yocto_3.17.bb, do_kernel_checkout
Summary: There was 1 ERROR message shown, returning a non-zero exit
code.


> Tom
> 
> > Cheers,
> > 
> > Richard
> > 
> > 
> > From 2495650e76bdee971645b3049b6e65307e506e09 Mon Sep 17 00:00:00 2001
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date: Thu, 11 Dec 2014 14:36:05 +0000
> > Subject: sanity: TMPDIR ABI change for kernel process
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky.conf
> > index 72db36d..bea8e04 100644
> > --- a/meta-yocto/conf/distro/poky.conf
> > +++ b/meta-yocto/conf/distro/poky.conf
> > @@ -94,7 +94,7 @@ BB_SIGNATURE_HANDLER ?= 'OEBasicHash'
> >  # that breaks the format and have been previously discussed on the mailing list 
> >  # with general agreement from the core team.
> >  #
> > -OELAYOUT_ABI = "8"
> > +OELAYOUT_ABI = "10"
> >  
> >  # add poky sanity bbclass
> >  INHERIT += "poky-sanity"
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index 5be5efb..71fd2e9 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -519,6 +519,16 @@ def sanity_handle_abichanges(status, d):
> >              status.addresult("Your configuration is using stamp files including the sstate hash but your build directory was built with stamp files that do not include this.\nTo continue, either rebuild or switch back to the OEBasic signature handler with BB_SIGNATURE_HANDLER = 'OEBasic'.\n")
> >          elif (abi != current_abi and current_abi == "9"):
> >              status.addresult("The layout of the TMPDIR STAMPS directory has changed. Please clean out TMPDIR and rebuild (sstate will be still be valid and reused)\n")
> > +        elif (abi != current_abi and current_abi == "10" and (abi == "8" or abi == "9")):
> > +            bb.note("Converting staging layout from version 8/9 to layout version 10")
> > +            cmd = d.expand("grep -l sysroot-providers/virtual_kernel ${SSTATE_MANIFESTS}/*")
> > +            ret, result = oe.utils.getstatusoutput(cmd)
> > +            result = result.split()
> > +            for f in result:
> > +                bb.note("Uninstalling manifest file %s" % f)
> > +                sstate_clean_manifest(f, d)
> > +            with open(abifile, "w") as f:
> > +                f.write(current_abi)
> >          elif (abi != current_abi):
> >              # Code to convert from one ABI to another could go here if possible.
> >              status.addresult("Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi))
> > diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
> > index e8cf9a3..2867850 100644
> > --- a/meta/conf/abi_version.conf
> > +++ b/meta/conf/abi_version.conf
> > @@ -4,4 +4,4 @@
> >  # that breaks the format and have been previously discussed on the mailing list 
> >  # with general agreement from the core team.
> >  #
> > -OELAYOUT_ABI = "9"
> > +OELAYOUT_ABI = "10"
> > 
> > 
> 



