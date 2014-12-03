Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DEAC460169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 18:50:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 03 Dec 2014 08:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,508,1413270000"; d="scan'208";a="647574402"
Received: from jwosulli-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.30.129])
	by orsmga002.jf.intel.com with ESMTP; 03 Dec 2014 06:36:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 03 Dec 2014 14:36:43 +0000
Message-ID: <3308676.S190v0nn32@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <CADkTA4Ogy=K9sh80UqpH=AL9Bqas9W3S80-TF=T4TtiaTGcqMA@mail.gmail.com>
References: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
	<20141203122307.GB15731@lpalcu-linux>
	<CADkTA4Ogy=K9sh80UqpH=AL9Bqas9W3S80-TF=T4TtiaTGcqMA@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 03 Dec 2014 18:50:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 December 2014 08:14:44 Bruce Ashfield wrote:
> On Wed, Dec 3, 2014 at 7:23 AM, Laurentiu Palcu
> 
> <laurentiu.palcu@intel.com> wrote:
> > Hi Paul,
> > 
> > On Wed, Dec 03, 2014 at 12:00:31PM +0000, Paul Eggleton wrote:
> >> On Monday 22 September 2014 13:04:47 Bruce Ashfield wrote:
> >> > On 14-09-22 01:03 PM, Khem Raj wrote:
> >> > > On Mon, Sep 22, 2014 at 8:27 AM, Bruce Ashfield
> >> > > 
> >> > > <bruce.ashfield@windriver.com> wrote:
> >> > >> But the reports we've been getting have been that externalsrc
> >> > >> builds are working for kernels, and linux-yocto without the change
> >> > >> in place, so I'm looking to reduce the patch footprint and
> >> > >> re-submit.
> >> > > 
> >> > > no, it cant work if folks were trying the usecase I have mentioned.
> >> > > The fix is infact for
> >> > > non linux-yocto kernels.
> >> > 
> >> > I'll send out my updated patch shortly, it should fix both cases.
> >> 
> >> Bruce, did you get around to doing this?
> >> 
> >> At the moment I am trying to make my workflow tool ("devtool modify")
> >> work with linux-yocto. I've at least got to the point where I can
> >> extract the appropriate source from the recipe, but when I use
> >> externalsrc to point to it and then try to build it, it doesn't even get
> >> past do_configure, so something must be missing (make complains about
> >> missing targets, presumably because it's running in ${B} and there's
> >> nothing in that directory).
> >> 
> >> Do you expect linux-yocto + externalsrc to work at the moment in master?
> >> If
> >> so, are there any special steps I need to do with respect to preparing
> >> the
> >> external source tree that my tool might not be performing?
> > 
> > FWIW, I'm using externalsrc to build non linux-yocto kernels but, to make
> > it work, I had to overwrite the KERNEL_CONFIG_COMMAND:
> > 
> > KERNEL_CONFIG_COMMAND = "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes
> > '' | oe_runmake -C ${S} O=${B} oldconfig"
>
> For an externalsrc kernel, we've always skipped configure* completely.
> If the user is providing the kernel, it should also be configured. We don't
> want the build system changing anything at all,  including the config that is
> in place.

OK, that makes sense - but all I'm doing is enabling externalsrc for the 
kernel, and do_configure is still being executed. Perhaps that's something that 
shouldn't be happening (needs to be added to SRCTREECOVEREDTASKS? We don't 
normally cover do_configure for other recipes.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

