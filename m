Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B986B60673
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 14:58:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 26 Nov 2014 06:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,462,1413270000"; d="scan'208";a="628602335"
Received: from ambyrne1-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.108])
	by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2014 06:57:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Wed, 26 Nov 2014 14:57:48 +0000
Message-ID: <1920393.GFIm8gtWQZ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <5475D3AE.1040803@topic.nl>
References: <54758D01.3070601@topic.nl>
	<12654718.RPpo1aQ4TE@peggleto-mobl5.ger.corp.intel.com>
	<5475D3AE.1040803@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Why does building an image for machine X delete the bootloader for machine Y?
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
X-List-Received-Date: Wed, 26 Nov 2014 14:58:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 26 November 2014 14:20:46 Mike Looijmans wrote:
> On 11/26/2014 12:31 PM, Paul Eggleton wrote:
> > Hi Mike,
> > 
> > On Wednesday 26 November 2014 09:19:13 Mike Looijmans wrote:
> >> I do a:
> >> 
> >> MACHINE=X bitbake my-image
> >> 
> >> This DEPENDS on a virtual bootloader, which will produce a BOOT.BIN file
> >> in
> >> the deploy directory, which is tmp-glibc/deploy.images/X/
> >> 
> >> If I then do a:
> >> 
> >> MACHINE=Y bitbake my-image
> >> 
> >> the BOOT.BIN in tmp-glibc/deploy.images/X/ is suddenly gone!
> >> 
> >> If i do a
> >> 
> >> MACHINE=X bitbake my-image
> >> 
> >> then the the BOOT.BIN in tmp-glibc/deploy.images/Y/ is suddenly gone, and
> >> the one for the X machine appears again. The bootloader recipe is not
> >> being
> >> rebuilt at all.
> >> 
> >> The machines have the same MACHINE_ARCH, they differ on only minor points
> >> (the FPGA).
> >> 
> >> What is going on here?
> > 
> > I can't be sure, but my guess is the recipe is not marked as being
> > machine-
> > specific (i.e. PACKAGE_ARCH is not set to "${MACHINE_ARCH}" - is that the
> > case?) but there is still some variable dependency on a variable that has
> > a machine-specific value. If it's not obvious from the recipe, check if
> > there are two sets of tasks for the bootloader recipe in the sstate
> > cache, and then use bitbake-diffsigs to compare the sigdata/siginfo
> > files.
> 
> MACHINE is actually "topic-miami-florida-med-xc7z015" or
> "topic-miami-florida-med-xc7z030"
> 
> Both machines have MACHINE_ARCH = "topic_miami_florida_med" since they only
> differ in the FPGA subsystem, but share all the rest (kernel, bootloader,
> etc).
> 
> Is it forbidden to share $MACHINE_ARCH between $MACHINEs? (And if so, why
> does MACHINE_ARCH even exist?)

I don't know for sure, but I don't think that is forbidden. I'm not sure 
that's the issue here though.

> The BSP layer for the topic-miami machines is here (yes, you can build OE or
> Yocto images with it, but I have yet some more work to do to make it a
> proper BSP...):
> https://github.com/topic-embedded-products/meta-topic

Is it u-boot that's the actual bootloader we are talking about here?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

