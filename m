Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id F0F8577074
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:04:13 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id DZ4B1s0090BmcFC01Z4CwH; Tue, 02 Feb 2016 21:04:13 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=Q4-j1AaZAAAA:8 a=aW8_UpYnkoB4sUjRx4MA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1aQi7P-0005QK-Tm; Tue, 02 Feb 2016 21:04:11 +0000
Date: Tue, 2 Feb 2016 21:04:11 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160202210411.GA20640@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1454428874.27087.87.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 02 Feb 2016 21:04:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 02 February 2016 at 16:01:14 +0000, Richard Purdie wrote:
> On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
> > bitbake.conf currently contains:
> > 
> > EXTRA_OEMAKE = "-e MAKEFLAGS="
> > 
> > Back in November[1] I submitted a patch that allowed this default
> > value to be overridden without affecting anything else that was
> > appended to it. I received feedback that the default value was no
> > longer useful and that it would be good to get rid of it.
> > 
> > So, this patch series fixes the two recipes that still appear to be
> > relying on the previous default and then makes the default
> > EXTRA_OEMAKE = "". After these changes core-image-sato builds
> > successfully for me (although I have not run it.)
> > 
> > Mike.
> > 
> > [1] http://lists.openembedded.org/pipermail/openembedded-core/2015-No
> > vember/112393.html
> 
> This is a pretty major change and we likely need a bit more of an idea
> of impact.

I agree.

> Which architectures did you test? Often, x86 is a bad choice here and
> we'd need something cross (arm/mips/ppc) to ensure it really is doing
> the right things. We also need to assess a bit more than just sato. We
> can run this up on the autobuilder and see what happens.

I've compile-tested qemux86 and qemuarm for core-image-sato. qemumips is
building now.

We've been running with the previous version of the patch with our code for
a while but now I look more closely that solution didn't have anywhere near
as wide an impact so I'll switch us over to using these patches. That will
runtime-test a few real mips and arm targets (and even x86 and x86-64 to a
limited extent) but only with our customised set of packages.

> A post to the architecture list is probably needed so everyone knows
> this is happening (or at least being considered).

I'll do that once I've finished this round of testing. Would it be best to
just post a general overview or the complete patch series?

> I do worry how much of meta-oe may be affected by this.

We don't use meta-oe. I could have a look at trying some builds over the
weekend. Luckily any breakage will be easy to fix, but that doesn't really
help if hundreds of packages are affected!

Thanks.

Mike.

