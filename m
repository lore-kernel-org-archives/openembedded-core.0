Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1FB78218
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EA60A208FB;
	Fri, 23 Jun 2017 23:41:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id OWzaAhZvhupq; Fri, 23 Jun 2017 23:41:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BFD6F204E0;
	Fri, 23 Jun 2017 23:41:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5D5CA162513; Fri, 23 Jun 2017 19:41:09 -0400 (EDT)
Date: Fri, 23 Jun 2017 19:41:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170623234109.GF28053@denix.org>
References: <20170622151404.27496-1-git@andred.net>
	<CAMKF1spVoW38edBHwvV8vGg9C00K1tQvqRC1LR2NXofZm5DkEA@mail.gmail.com>
	<1498214792.25895.23.camel@andred.net>
	<CAMKF1sowVfO=avnnSJtDhYi=nda0hU_htvcTcmtdWydCxzOqvg@mail.gmail.com>
	<20170623141737.bksn4w2qbd7fyhzs@hiutale>
	<CAMKF1spOU3HZ3JuG58CXzGrKgKmw79RcW+CzesouvQdBV+9Rjw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spOU3HZ3JuG58CXzGrKgKmw79RcW+CzesouvQdBV+9Rjw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: fix duplicate IFF_LOWER_UP DORMANT ECHO on musl
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
X-List-Received-Date: Fri, 23 Jun 2017 23:41:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 23, 2017 at 04:20:41PM -0700, Khem Raj wrote:
> On Fri, Jun 23, 2017 at 7:17 AM,  <Mikko.Rapeli@bmw.de> wrote:
> > Hi,
> >
> > I'm chipping in since I've been messing with these things a bit in upstream
> > Linux kernel.
> >
> > On Fri, Jun 23, 2017 at 06:37:52AM -0700, Khem Raj wrote:
> >> On Fri, Jun 23, 2017 at 3:46 AM, André Draszik <git@andred.net> wrote:
> >> > connman is not doing anything wrong here.
> >> >
> >>
> >> yes I am aware of this
> >>
> >> > The kernel is redefining IFF_LOWER_UP, because it thinks the libc doesn't
> >> > define it yet (and glibc doesn't).
> >> >
> >> > libc-compat.h is the way to solve these kind of issues. There also is https:
> >> > //lkml.org/lkml/2017/3/12/238 which is very similar. I'll pick that instead.
> >> >
> >> see the comment https://lkml.org/lkml/2017/3/16/121
> >> that worries me for this patch
> >
> > I'm aware of those review comments but I have not seen any patches posted which
> > fix the problem in some other way. Thus I would propose to apply these patches
> > as a workaround until upstream fixes the issues.
> >
> > These header files do not change that often either.
> 
> problem is you become incompatible ABI forever that worries me.

+1


> However if bruce is fine to carry this patch as part of linux-yocto
> I might relent. It still will be hassle where folks will have to apply
> this patch to there kernels if they are building musl based systems.

Don't forget that not everyone is using linux-yocto kernel!


> >> I am not questioning the correctness of patch too. But
> >> it would be better to get this patch accepted into kernel
> >> before applying to OE since these are kind of patches which
> >> you can get stuck with for life if upstream is not accepting it.
> >
> > Upstream-Status: Denied
> >
> > would be a correct marker for now I guess.
> 
> I would rather see some progress made to get it resolved :)
> we need to actually remove glibc'ness completely from kernel.
> and this will fix itself.

