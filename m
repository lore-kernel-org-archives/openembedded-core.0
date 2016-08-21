Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 081E26FF73
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2016 15:51:29 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160821155128544_0684;
	Sun, 21 Aug 2016 15:51:28 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.114.62.25] (port=41844 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bbV3q-0007RZ-SU; Sun, 21 Aug 2016 11:53:22 -0400
Date: Sun, 21 Aug 2016 11:51:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Tom Rini <trini@konsulko.com>
In-Reply-To: <20160821150452.GR5342@bill-the-cat>
Message-ID: <alpine.LFD.2.20.1608211146290.20716@localhost.localdomain>
References: <alpine.LFD.2.20.1608181237130.2886@ca624034.mitel.com>
	<20160819201637.GO5342@bill-the-cat>
	<alpine.LFD.2.20.1608210955340.18845@localhost.localdomain>
	<20160821150452.GR5342@bill-the-cat>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how can i add u-boot-fw-utils to my build without u-boot being part of the build?
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
X-List-Received-Date: Sun, 21 Aug 2016 15:51:33 -0000
Content-Type: text/plain; charset=US-ASCII

On Sun, 21 Aug 2016, Tom Rini wrote:

> On Sun, Aug 21, 2016 at 09:59:22AM -0400, Robert P. J. Day wrote:
> > On Fri, 19 Aug 2016, Tom Rini wrote:
> >
> > > On Thu, Aug 18, 2016 at 12:41:25PM -0400, Robert P. J. Day wrote:
> > > >
> > > >   i want to add the u-boot-fw-utils recipe to my current build,
> > > > but u-boot is *not* part of the relevant BSP layer -- u-boot is
> > > > being configured and built elsewhere, and that's not changing for
> > > > the foreseeable future.
> > > >
> > > >   the good news is that those utilities don't need to have any
> > > > info on the default environment for u-boot -- they need only have
> > > > access to the environment in flash, and there is a
> > > > /etc/fw_env.config file that is all set up and ready to go and
> > > > referring to the correct device and offset in flash.
> > > >
> > > >   so how do i specify that i want to add that recipe to my build,
> > > > while saying, "don't worry about the default environment, you
> > > > don't need it." can that be done? thanks.
> > >
> > > The "easy" way out here is to just set a valid (as in, compiles)
> > > UBOOT_MACHINE and then not worry about installing U-Boot from the OE
> > > build.  You can ASSUME_PROVIDED away u-boot itself, but you still
> > > need to have a UBOOT_MACHINE set so that we configure U-Boot before
> > > building the tools (And you must configure before building).
> >
> >   the problem is that the machine is a custom tweaking of an existing
> > platform in u-boot, so that a regular checkout of u-boot won't have a
> > defconfig for that machine. the entirety of u-boot for this target
> > board is configured and built elsewhere, so i'm just trying to figure
> > out what little i need to supply to get a build of those fw-utils in
> > my image.
> >
> >   i suppose i can just use an existing machine that's compatible --
> > beyond that, i assume all i need to supply is a /etc/fw_env.config
> > file defining where in flash the environment is to be manipulated.
> >
> >   i realize this is a weird scenario, it's just what i have to work
> > with for the time being.
>
> This is a fairly common scenario I think.  I'm doing it myself right
> now for a customer :)  And what I'm doing is having OE build U-Boot
> for the reference platform (and not using that U-Boot) and re-use
> that config for building u-boot-fw-utils (which we do need) and
> providing a good fw_env.config just like you suggest.

  i apologize for being clueless, but i'm still unclear on what i need
to do here, and in my case, i'm going in the opposite direction.

  currently, u-boot is being configured and compiled standalone -- not
as part of OE. and that build works just fine, so i can grab whatever
(little?) i need from that build to then add to an actual OE build so
i can just add u-boot-fw-utils to an existing image.

  as i read it, for an OE build of u-boot, i need to supply either
UBOOT_MACHINE or UBOOT_CONFIG. so in this case, what would i do? my
assumption until now is that i need to add to the OE build just enough
to get the fw utils to build, and i'd do that by setting either of
those variables. and i already have the appropriate fw_env.config file
ready to go.

  so what precisely do i need to do here?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


