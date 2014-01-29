Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 107CA6E791
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 10:22:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Jan 2014 02:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,741,1384329600"; d="scan'208";a="446350457"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.74])
	by orsmga001.jf.intel.com with ESMTP; 29 Jan 2014 02:22:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Wed, 29 Jan 2014 10:22:53 +0000
Message-ID: <6921928.yT49xnGtv4@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <52E8D497.1080708@dresearch-fe.de>
References: <1390833588.17424.254.camel@ted> <52E8D497.1080708@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Wed, 29 Jan 2014 10:22:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 January 2014 11:14:47 Steffen Sledz wrote:
> On 27.01.2014 15:39, Richard Purdie wrote:
> > Its rather sad that people don't appear to read local.conf and then
> > complain about slow builds when they're just using a single thread. Most
> > systems have more than one core now so we might as well use a more
> > automatic default for these values. This may lead to better experiences
> > for new users.
> > 
> > [YOCTO #2528]
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> > index 71856b8..36d33e1 100644
> > --- a/meta/conf/local.conf.sample
> > +++ b/meta/conf/local.conf.sample
> > @@ -18,12 +18,18 @@
> > 
> >  # option determines how many tasks bitbake should run in parallel:
> >  #
> >  #BB_NUMBER_THREADS ?= "4"
> > 
> > +#
> > +# Default to setting automatically based on cpu count
> > +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> > 
> >  #
> >  # The second option controls how many processes make should run in
> >  parallel when # running compile tasks:
> >  #
> >  #PARALLEL_MAKE ?= "-j 4"
> >  #
> > 
> > +# Default to setting automatically based on cpu count
> > +PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
> > +#
> > 
> >  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j
> >  4" would # be appropriate for example.
> 
> On our Fedora-18 build host this change leads to the following exception. :(
> 
> ----------------------> snip <-------------------------
> Loading cache...done.
> Loaded 2167 entries from dependency cache.
> 
> Parsing recipes...done.
> Parsing of 1729 .bb files complete (1727 cached, 2 parsed). 2168 targets, 85
> skipped, 1 masked, 0 errors.
> 
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.20.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Fedora-18"
> TARGET_SYS        = "arm-angstrom-linux-gnueabi"
> MACHINE           = "hikirk"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v2013.12"
> TUNE_FEATURES     = "armv5 thumb dsp"
> TARGET_FPU        = "soft"
> meta-hipos        = "(nobranch):6f2ad6754c9c9ddd6f1c5505e584e0eb62cfcf83"
> meta-hipos-kirkwood = "(nobranch):1a43f75e217fea3c6b4493536b3b66945ce53921"
> meta-hipos-fsl    = "(nobranch):ad3beec4157a96d0c506969a29d14f6354e7406f"
> meta-fsl-arm      = "(nobranch):af392c22bf6b563525ede4a81b6755ff1dd2c1c6"
> meta-fsl-arm-extra = "(nobranch):07ad83db0fb67c5023bd627a61efb7f474c52622"
> meta-java         = "(nobranch):9dfb7ecb87e67052e94641d6e02907c582264217"
> meta-angstrom     = "(nobranch):8fcd781b777a7a94f2b97514c9691a2b5c74eaf2"
> meta-oe
> meta-systemd
> meta-multimedia
> meta-networking
> meta-efl
> meta-gnome        = "(nobranch):eb4563b83be0a57ede4269ab19688af6baa62cd2"
> meta              = "(nobranch):e86622a932bbd0acdea67ecfb15c8b06c27353d8"
> 
> NOTE: Preparing runqueue
> ERROR: An uncaught exception occured in runqueue, please see the failure
> below: ERROR: Running idle function
> Traceback (most recent call last):
> 
>   File "/CACHE/jenkins-workspace/hipos/bitbake/lib/bb/runqueue.py", line 
1111, in RunQueueExecuteScenequeue.__init__(rq=<bb.runqueue.RunQueue instance 
at 0x1534b2d8>):
>     >        self.number_tasks =
>     >        int(self.cfgData.getVar("BB_NUMBER_THREADS", True) or 1)
>              self.scheduler = self.cfgData.getVar("BB_SCHEDULER", True) or
> "speed" File "/CACHE/jenkins-workspace/hipos/bitbake/lib/bb/data_smart.py",
> line 516, in DataSmart.getVar(var='BB_NUMBER_THREADS', expand=True,
> noweakdefault=False):
>          def getVar(self, var, expand=False, noweakdefault=False):
>     >        return self.getVarFlag(var, "_content", expand, noweakdefault)
> 
>   File "/CACHE/jenkins-workspace/hipos/bitbake/lib/bb/data_smart.py", line
> 606, in DataSmart.getVarFlag(var='BB_NUMBER_THREADS', flag='_content',
> expand=True, noweakdefault=False): cachename = var + "[" + flag + "]"
> 
>     >            value = self.expand(value, cachename)
> 
>              if value is not None and flag == "_content" and local_var is
> not None and "_removeactive" in local_var: File
> "/CACHE/jenkins-workspace/hipos/bitbake/lib/bb/data_smart.py", line 344, in
> DataSmart.expand(s='${@oe.utils.cpu_count()}',
> varname='BB_NUMBER_THREADS'):
>          def expand(self, s, varname = None):
>     >        return self.expandWithRefs(s, varname).value
> 
>   File "/CACHE/jenkins-workspace/hipos/bitbake/lib/bb/data_smart.py", line
> 334, in DataSmart.expandWithRefs(s='${@oe.utils.cpu_count()}',
> varname='BB_NUMBER_THREADS'):
>                  except Exception as exc:
>     >                raise ExpansionError(varname, s, exc)
> 
> ExpansionError: Failure expanding variable BB_NUMBER_THREADS, expression was
> ${@oe.utils.cpu_count()} which triggered exception AttributeError: 'module'
> object has no attribute 'cpu_count' ----------------------> snip
> <-------------------------
> 
> Any ideas? A missing python package at the build host? ...?

Looks like you're missing Richard's other posted patch that adds this 
function.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

