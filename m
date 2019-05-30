Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 545A37E408
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 14:25:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45F8xX5fQxz44;
	Thu, 30 May 2019 16:25:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559226321;
	bh=M+c3yWe+jXcRV4o9KwJYGypbAqpvWaogAqtAdLQZpis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kDDp8BGA3Pl5gtP+WS2aywgaJGglj5n2MHbc7owpbT0nzmSUGsBCDzJg5ctN2T6MW
	1ZMXELpLX+4y9HVW8qacnvKFsD91qIcRKMz0fEl+i/EnfmJoga83Y8eyM2hvPTWgJa
	tIxUYUymODYqLNkYsIgB7avKWZT3DdBs8LrrPMkAFZfqRebwllKl0Re5lL5jgdk05A
	SPTYZiXiOIoEuwU7GsZgAJ98qq9voHsJkLSDJ5xwG8gGfCS8sIUIHd/Jl6bixUX1rh
	x5+yIYGLE2TxmaLoZlZc9BT8EsYzMiLpexWMRCgD60cuiuRJ58JZi2DpRz27uWtkQQ
	Q/weDu7cNuSv4LOhx7ZydKMEvkKexwChtkvNvZWv8UNjuITpY2kNAmYq2JzdYotUfA
	KpAfPt6rFOV5DHp083xRlfzv8iO2lBZaZRJhaOmF1+ZxpgKsqW/ID2+ZdWyzGJgUT4
	jGyEFFMbRYhH2t8fcsJox5FW5xj2ny9hLI1X7O0huevQ6TTqqRXHGd/hUD0weXSSam
	SfaT/qMaYE7uFDKznyE0CDEUZsPeLSOZulv/aX+mSMMkHO9T7IdOaSyYTKHrUwpVy0
	aE26m8nYnhkAtXBg8zuQV65xsMKJ+V+gPCOAV+vCqnOto5DWFq5YXKM+BH3SkcONL4
	ePJGRQOVeq7GxNmlHHfutgBA=
Date: Thu, 30 May 2019 17:25:18 +0300
From: Adrian Bunk <bunk@stusta.de>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190530142518.GC318@localhost>
References: <321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
	<20190529230203.GB16075@localhost>
	<aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
	<20190530135949.GA318@localhost>
	<e7536283bb0d7d255826585a3222aedd0d7950ad.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <e7536283bb0d7d255826585a3222aedd0d7950ad.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Thu, 30 May 2019 14:25:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 30, 2019 at 03:06:56PM +0100, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2019-05-30 at 16:59 +0300, Adrian Bunk wrote:
> > There are also some other related topics that might be considered
> > on how this should develop long-term:
> > 
> > 1. How important is it to support host distributions that are not 
> > listed as supported? Not limited to uninative it can be painful
> > adding support for new distributions to stable branches.
> 
> The distros we do support were chosen to give a decent cross section of
> the Linux ecosystem. Whilst not full coverage, the delta between those
> and other systems should be relatively minimal as we have both older
> and modern in there.

I agree that it usually works on the range between the oldest and the 
newest supported host distribution.

But adding support for more recent host distributions to stable 
branches could end up being any amount of troubles if you are
unlucky.

> > 2. Does using uninative by default bring enough benefits to
> > outweight the problems with new host distributions, or should it
> > become non-default in master?
> 
> We test it heavily on the autobuilder and also benefit from it
> massively there so in my view its a significant win for us alone. We
> chose to share it with the ecosystem. You're not forced to use it.
> 
> > The sum of the two points above is especially problematic:
> > "re-use of native shared state artifacts across different host 
> > distributions" is a more exotic feature, and effectively supporting
> > this for unsupported host distributions is the problem here.
> 
> Which distros are you seeing a problem with and what kinds of problems?
> I'd hoped/believed the problems should be relatively minor unless
> they're really old.
>...

The problem is that uninative is expected to break 3 times per year, 
with every new release of gcc or glibc.

Are the problems people regularly see on bleeding-edge distributions
really offset by the benefits of having it enabled by default?

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


