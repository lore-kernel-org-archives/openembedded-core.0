Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0BAF07728F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12MfVZx003703; Tue, 2 Feb 2016 22:41:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3EsgPn4kUGnh; Tue,  2 Feb 2016 22:41:31 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12MfP0V003698
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 2 Feb 2016 22:41:26 GMT
Message-ID: <1454452885.27087.127.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Tue, 02 Feb 2016 22:41:25 +0000
In-Reply-To: <20160202210411.GA20640@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202210411.GA20640@mcrowe.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 02 Feb 2016 22:41:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-02 at 21:04 +0000, Mike Crowe wrote:
> On Tuesday 02 February 2016 at 16:01:14 +0000, Richard Purdie wrote:
> > On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
> > > bitbake.conf currently contains:
> > > 
> > > EXTRA_OEMAKE = "-e MAKEFLAGS="
> > > 
> > > Back in November[1] I submitted a patch that allowed this default
> > > value to be overridden without affecting anything else that was
> > > appended to it. I received feedback that the default value was no
> > > longer useful and that it would be good to get rid of it.
> > > 
> > > So, this patch series fixes the two recipes that still appear to
> > > be
> > > relying on the previous default and then makes the default
> > > EXTRA_OEMAKE = "". After these changes core-image-sato builds
> > > successfully for me (although I have not run it.)
> > > 
> > > Mike.
> > > 
> > > [1] 
> > > http://lists.openembedded.org/pipermail/openembedded-core/2015-No
> > > vember/112393.html
> > 
> > This is a pretty major change and we likely need a bit more of an
> > idea
> > of impact.
> 
> I agree.
> 
> > Which architectures did you test? Often, x86 is a bad choice here
> > and
> > we'd need something cross (arm/mips/ppc) to ensure it really is
> > doing
> > the right things. We also need to assess a bit more than just sato.
> > We
> > can run this up on the autobuilder and see what happens.
> 
> I've compile-tested qemux86 and qemuarm for core-image-sato. qemumips
> is
> building now.
> 
> We've been running with the previous version of the patch with our
> code for
> a while but now I look more closely that solution didn't have
> anywhere near
> as wide an impact so I'll switch us over to using these patches. That
> will
> runtime-test a few real mips and arm targets (and even x86 and x86-64
> to a
> limited extent) but only with our customised set of packages.

Thanks. Please do mention what tests have passed/failed just so I can
build some idea of the risk of the patch and decide if/as/when the
right time to merge it is.

> > A post to the architecture list is probably needed so everyone
> > knows
> > this is happening (or at least being considered).
> 
> I'll do that once I've finished this round of testing. Would it be
> best to
> just post a general overview or the complete patch series?

The general overview and main patch is fine. I will likely merge any
fixups like the two in this series as they become available since they
don't have an adverse affect as far as I can tell.

> > I do worry how much of meta-oe may be affected by this.
> 
> We don't use meta-oe. I could have a look at trying some builds over
> the
> weekend. Luckily any breakage will be easy to fix, but that doesn't
> really
> help if hundreds of packages are affected!

Right, I really just need an idea of whether its going to cause
problems and a rough idea of scale. I will run this on the Yocto
Project autobuilder but we're pushed for bandwidth at the moment so it
may not be until the weekend.

Cheers,

Richard

