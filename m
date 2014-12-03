Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E6A7760169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 12:23:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Dec 2014 04:23:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,507,1413270000"; d="scan'208";a="641811811"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.104.113])
	by fmsmga002.fm.intel.com with ESMTP; 03 Dec 2014 04:23:08 -0800
Date: Wed, 3 Dec 2014 14:23:07 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20141203122307.GB15731@lpalcu-linux>
References: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
	<CAMKF1srheZyVe5ATST-ToxZQJkXTTNvoh8j+PzrytSVbjVV9wA@mail.gmail.com>
	<542056AF.8080009@windriver.com>
	<2558455.kgL2mNBB1h@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2558455.kgL2mNBB1h@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 03 Dec 2014 12:23:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Wed, Dec 03, 2014 at 12:00:31PM +0000, Paul Eggleton wrote:
> On Monday 22 September 2014 13:04:47 Bruce Ashfield wrote:
> > On 14-09-22 01:03 PM, Khem Raj wrote:
> > > On Mon, Sep 22, 2014 at 8:27 AM, Bruce Ashfield
> > > 
> > > <bruce.ashfield@windriver.com> wrote:
> > >> But the reports we've been getting have been that externalsrc
> > >> builds are working for kernels, and linux-yocto without the change
> > >> in place, so I'm looking to reduce the patch footprint and re-submit.
> > > 
> > > no, it cant work if folks were trying the usecase I have mentioned.
> > > The fix is infact for
> > > non linux-yocto kernels.
> > 
> > I'll send out my updated patch shortly, it should fix both cases.
> 
> Bruce, did you get around to doing this?
> 
> At the moment I am trying to make my workflow tool ("devtool modify") work with 
> linux-yocto. I've at least got to the point where I can extract the 
> appropriate source from the recipe, but when I use externalsrc to point to it 
> and then try to build it, it doesn't even get past do_configure, so something 
> must be missing (make complains about missing targets, presumably because it's 
> running in ${B} and there's nothing in that directory).
> 
> Do you expect linux-yocto + externalsrc to work at the moment in master? If 
> so, are there any special steps I need to do with respect to preparing the 
> external source tree that my tool might not be performing?
FWIW, I'm using externalsrc to build non linux-yocto kernels but, to make it
work, I had to overwrite the KERNEL_CONFIG_COMMAND:

KERNEL_CONFIG_COMMAND = "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"

This might be the reason of your do_configure failure...

I hope it helps,
laurentiu


