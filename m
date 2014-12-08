Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD2165D53
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 12:10:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2014 04:10:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,538,1413270000"; d="scan'208";a="634390924"
Received: from apwitke-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.30.33])
	by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2014 04:10:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 08 Dec 2014 12:10:15 +0000
Message-ID: <1506700.RfibPUDy3g@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <CADkTA4OdPvV4+6wENW1G-9HMnnNgH_oH_Mz-WrMga0W7o_SWOw@mail.gmail.com>
References: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
	<CADkTA4NobmfAEbYR+2bbSWsKBcJ=Cw3Qf0=+w9V5C26ATT=p+Q@mail.gmail.com>
	<CADkTA4OdPvV4+6wENW1G-9HMnnNgH_oH_Mz-WrMga0W7o_SWOw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [RFC] kernel: Enable externalsrc on kernels which instantiate kernel.bbclass
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
X-List-Received-Date: Mon, 08 Dec 2014 12:10:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 04 December 2014 00:28:24 Bruce Ashfield wrote:
> On Wed, Dec 3, 2014 at 11:50 AM, Bruce Ashfield
> 
> <bruce.ashfield@gmail.com> wrote:
> > On Wed, Dec 3, 2014 at 9:36 AM, Paul Eggleton
> > 
> > <paul.eggleton@linux.intel.com> wrote:
> >> On Wednesday 03 December 2014 08:14:44 Bruce Ashfield wrote:
> >>> On Wed, Dec 3, 2014 at 7:23 AM, Laurentiu Palcu
> >>> 
> >>> <laurentiu.palcu@intel.com> wrote:
> >>> > Hi Paul,
> >>> > 
> >>> > On Wed, Dec 03, 2014 at 12:00:31PM +0000, Paul Eggleton wrote:
> >>> >> On Monday 22 September 2014 13:04:47 Bruce Ashfield wrote:
> >>> >> > On 14-09-22 01:03 PM, Khem Raj wrote:
> >>> >> > > On Mon, Sep 22, 2014 at 8:27 AM, Bruce Ashfield
> >>> >> > > 
> >>> >> > > <bruce.ashfield@windriver.com> wrote:
> >>> >> > >> But the reports we've been getting have been that externalsrc
> >>> >> > >> builds are working for kernels, and linux-yocto without the
> >>> >> > >> change
> >>> >> > >> in place, so I'm looking to reduce the patch footprint and
> >>> >> > >> re-submit.
> >>> >> > > 
> >>> >> > > no, it cant work if folks were trying the usecase I have
> >>> >> > > mentioned.
> >>> >> > > The fix is infact for
> >>> >> > > non linux-yocto kernels.
> >>> >> > 
> >>> >> > I'll send out my updated patch shortly, it should fix both cases.
> >>> >> 
> >>> >> Bruce, did you get around to doing this?
> >>> >> 
> >>> >> At the moment I am trying to make my workflow tool ("devtool modify")
> >>> >> work with linux-yocto. I've at least got to the point where I can
> >>> >> extract the appropriate source from the recipe, but when I use
> >>> >> externalsrc to point to it and then try to build it, it doesn't even
> >>> >> get
> >>> >> past do_configure, so something must be missing (make complains about
> >>> >> missing targets, presumably because it's running in ${B} and there's
> >>> >> nothing in that directory).
> >>> >> 
> >>> >> Do you expect linux-yocto + externalsrc to work at the moment in
> >>> >> master?
> >>> >> If
> >>> >> so, are there any special steps I need to do with respect to
> >>> >> preparing
> >>> >> the
> >>> >> external source tree that my tool might not be performing?
> >>> > 
> >>> > FWIW, I'm using externalsrc to build non linux-yocto kernels but, to
> >>> > make
> >>> > it work, I had to overwrite the KERNEL_CONFIG_COMMAND:
> >>> > 
> >>> > KERNEL_CONFIG_COMMAND = "oe_runmake_call -C ${S} O=${B} oldnoconfig ||
> >>> > yes
> >>> > '' | oe_runmake -C ${S} O=${B} oldconfig"
> >>> 
> >>> For an externalsrc kernel, we've always skipped configure* completely.
> >>> If the user is providing the kernel, it should also be configured. We
> >>> don't
> >>> want the build system changing anything at all,  including the config
> >>> that is in place.
> >> 
> >> OK, that makes sense - but all I'm doing is enabling externalsrc for the
> >> kernel, and do_configure is still being executed. Perhaps that's
> >> something that shouldn't be happening (needs to be added to
> >> SRCTREECOVEREDTASKS? We don't normally cover do_configure for other
> >> recipes.)
> > 
> > IMHO it should be, I have it inhibited here.
> > 
> > Still trying to get my 1.8 work cleaned up for a RFC, and I'll send
> > you what I have for
> > this shortly as well.
> 
> I did manage to launch and build a 3.14 kernel externalsrc against master
> using the WIP progress patches.
> 
> .. and it worked :)
> 
> I've just finished my other developer experience patches (initial
> version), so this is
> the next thing on my list to finish on for 1.8.
> 
> The patch that I currently have is broken as part of a rebase to
> account for other
> changes, but I did have the original patch, that has too large a
> footprint (i.e. lots
> of extra ${S} and ${B} manipulations that aren't all required. So I
> tested using it.
> 
> That being said,  I pushed the working patch to poky-contrib
> zedd/kernel-externalsrc,
> so you can see what the baseline is.
> 
> I'm interested to hear if this hobbles along for you, and if not, what
> breaks. I'm building an externalsrc recipe that I put together some time ago
> .. so if yours isn't working, that could be the difference.

I can't get this to work; at least what I was going to attempt was a build of
just the kernel first and then extract the source to try externalsrc. I can't
even do that however:

------------- snip -------------
$ bitbake virtual/kernel
Parsing recipes: 100%
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1296 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.25.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-20"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "qemux86-64"
DISTRO            = "poky"
DISTRO_VERSION    = "1.7"
TUNE_FEATURES     = "m64 core2"
TARGET_FPU        = ""
meta              
meta-yocto        
meta-yocto-bsp    
workspace         = "paule/devtool-kerneltest:24b6a5242546ad5e6b6c9413d1eeb2465f79a91b"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=standard/common-pc-64/base,meta;name=machine,meta, attempting MIRRORS if available
ERROR: Fetcher failure: Unable to find revision c100e8665052051487a17169748c457829d3f88c in branch standard/common-pc-64/base even from upstream
ERROR: Function failed: Fetcher failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=standard/common-pc-64/base,meta;name=machine,meta'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/paul/poky/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/3.14.24+gitAUTOINC+fba2d0cdb7_c100e86650-r0/temp/log.do_fetch.26831
ERROR: Task 6 (/home/paul/poky/poky/meta/recipes-kernel/linux/linux-yocto_3.14.bb, do_fetch) failed with exit code '1'
------------- snip -------------

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

