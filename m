Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 47A8378704
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4423E2098D;
	Tue, 20 Feb 2018 16:17:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hfEHSXGkMuuc; Tue, 20 Feb 2018 16:17:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D96862073F;
	Tue, 20 Feb 2018 16:17:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 661591632C0; Tue, 20 Feb 2018 11:17:52 -0500 (EST)
Date: Tue, 20 Feb 2018 11:17:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180220161752.GA2786@denix.org>
References: <1519084455-3915-1-git-send-email-denis@denix.org>
	<CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
	<20180220012001.GZ2786@denix.org>
	<8d340a29-2016-55fa-0fd2-9847e6f9e62b@gmail.com>
	<CAP9ODKqv6LRHhnQcGaZuApppxn_j3P1Vat-pFvCvsApwrZLg=A@mail.gmail.com>
	<CA+chaQdzUAxeE-hKceogmgSjBCXvkT7-BKzDrqFV1EvpTD=oXA@mail.gmail.com>
	<CAMKF1sobCVLrT0J2ig3OP3CpJ6Rja3oE2DZTTWNypFEmrZETMA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sobCVLrT0J2ig3OP3CpJ6Rja3oE2DZTTWNypFEmrZETMA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: explicitly depend on bison-native for deterministic builds
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
X-List-Received-Date: Tue, 20 Feb 2018 16:17:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 20, 2018 at 04:08:06PM +0000, Khem Raj wrote:
> On Tue, Feb 20, 2018 at 7:41 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> > I'm OK with adding bison-native for all versions.
> 
> As long we know that there are no side effects of this dep in kernel builds

You do realize that when you build with oe-core toolchain, every package gets
bison-native dependency automatically? Regardless whether it was requested or 
not. If there were side effects, we would have seen it long time ago...


> > When we added bc-native 2+ years ago:
> > commit c067e52cffe002de3b39aa1bced308dd532859c1
> > Author: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> > Date:   Thu Oct 2 15:33:23 2014 -0500
> >
> >     kernel: Added bc-native as DEPENDS
> >
> >     The makefile checks for bc during for compilation
> >
> > it was also needed only for the latest kernel and we didn't make it
> > conditional on the kernel version. Now with RSS it's even less dangerous as
> > the bison-native will appear only in kernel's RSS and as Denys said it's
> > quite common dependency so many components pull it into RSS anyway.
> >
> > On Tue, Feb 20, 2018 at 3:53 PM, Otavio Salvador <
> > otavio.salvador@ossystems.com.br> wrote:
> >
> >> On Tue, Feb 20, 2018 at 7:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > On 2/19/18 5:20 PM, Denys Dmytriyenko wrote:
> >> >>
> >> >> On Mon, Feb 19, 2018 at 09:36:22PM -0300, Otavio Salvador wrote:
> >> >>>
> >> >>> On Mon, Feb 19, 2018 at 8:54 PM, Denys Dmytriyenko <denis@denix.org>
> >> >>> wrote:
> >> >>>>
> >> >>>> From: Denys Dmytriyenko <denys@ti.com>
> >> >>>>
> >> >>>> Explicitly depend on bison-native for deterministic builds, as it is
> >> >>>> required
> >> >>>> for the build:
> >> >>>>
> >> >>>> |   HOSTCC  scripts/basic/fixdep
> >> >>>> |   GEN     ./Makefile
> >> >>>> |   HOSTCC  scripts/kconfig/conf.o
> >> >>>> |   YACC    scripts/kconfig/zconf.tab.c
> >> >>>> | /bin/sh: bison: command not found
> >> >>>> | scripts/Makefile.lib:217: recipe for target
> >> >>>> 'scripts/kconfig/zconf.tab.c' failed
> >> >>>>
> >> >>>> In most cases, this dependency comes indirectly via toolchain
> >> >>>> dependencies,
> >> >>>> specifically binutils-cross, which pulls bison-native. Different
> >> setups,
> >> >>>> such as with external toolchain, would expose this problem, since
> >> >>>> correct
> >> >>>> dependency is not marked explicitly.
> >> >>>>
> >> >>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> >>>> ---
> >> >>>> I'm seeing this now on 4.16-rc2 with external toolchain.
> >> >>>
> >> >>>
> >> >>> I am not against the addition but in fact, it is because 4.16 stopped
> >> >>> of using pre-generated files and now requires bison to be available.
> >> >>
> >> >>
> >> >> Ok, good, I was wondering why I didn't see it before 4.16...
> >> >>
> >> >>
> >> >>> I am unsure it ought to be on kernel.bbclass at this moment.
> >> >>
> >> >>
> >> >> Why not? Because it's 4.16+ specific?
> >> >>
> >> >> By default bison-native dependency gets added implicitly when built
> >> with
> >> >> the
> >> >> toolchain from oe-core, so this doesn't add any extra dependencies,
> >> only
> >> >> makes
> >> >> it explicit.
> >> >>
> >> > it will be overcompensating for < 4.16 kernel recipes where this
> >> dependency
> >> > is not needed. it might be a legit dependency for another component,
> >> that
> >> > doesn't stage this package in kernel recipe-specific sysroot but this
> >> change
> >> > will do that. So its not completely innocent change.
> >>
> >> I'd be in favor of matching the version and adding it if it is a 4.16
> >> or newer kernel. Adding for prior versions seems wrong for me.
> >>
> >> --
> >> Otavio Salvador                             O.S. Systems
> >> http://www.ossystems.com.br        http://code.ossystems.com.br
> >> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> >>
> > --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


