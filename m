Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 12A457BD72
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 21:53:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44RZ6B6GhMz5h;
	Sat, 23 Mar 2019 22:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553378019;
	bh=OZgRYTDvMFKskT5goTBWJJFEZZfrAbF+3kxj5oVcjzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeCZsHii7wTDOuF4qVG1vS1U0gB3iOw0mllk4jD/WvaPURY1aXdyP8Ni8YJNcFzq4
	3nzt4WSo/8m+FMJdXUUuEwfIloGdyomoYuFaHK1szN/tKE/uicBv3NQxz3cnof2tep
	1ESovx1ZBwyLBr0xDEHXK6q1SVfD594Op9/LMlz9xldHq9oQH8Mg9DpDcDEwW279BX
	45ZkxqmqZKNoID/2SKt1yq/g6CrDgn5XDBBbpwdj1gtz8IsBmYepINzv7LFimKcAcD
	ziFuklddKp3NTN3rBTIWAq/N4G7+W8AxPMgU8j6ZSfDy4fEq+/yoI/dNiXL8WxbLvR
	9kXbVDt9vDZG+IwZ/FFxFzwB0NG8mhpSne2RmAiQ7+CR//TZU08hGX6q6UOYKtq27H
	jqXLAyL7MHmzrW5lZyj3juekWcSRk5MqDdg6j8A/h8QmP6LTDmx0QKGYnIlPUjMwGS
	NlEzpJG6qGu8Bz/ckEuc2I/UbmquOmLWnUjmR8w9ZP3Co7SGDTT8p4x4p3FbA69+au
	RIfAmo1mxuVO7cGnCiU8N274FQbsPDQr90vOAAs4tU3D76yW2a9Sc9+4//ryJGJzfo
	gUopIpzw9QCFkfc+GjExsDqg7/JfhXzdNxN5qMDK5tCXn5QQmX1fOu0XrKenjQ03JF
	vd6NbKUkozSL0qoHTHezf3Z0=
Date: Sat, 23 Mar 2019 23:53:36 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190323215336.GA22469@localhost>
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Sat, 23 Mar 2019 21:53:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Mar 23, 2019 at 10:22:15PM +0100, Andreas Müller wrote:
> On Sat, Mar 23, 2019 at 10:16 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
> > >...
> > > There are certain design aspects of musl which are actually turning
> > > out to be good
> > > e.g. there is no __MUSL__ define, so non-portable code can not be
> > > hidden which is a good thing,
> > >...
> >
> > Please take a closer look at some of the musl changes to NM that made
> > upgrading NM so hard for Andreas.
> >
> > +#if defined(__GLIBC__)
> >  #include <net/ethernet.h>
> > +#else /* musl libc */
> > +#define ETH_ALEN       6               /* Octets in one ethernet addr   */
> > +#endif
> >
> > Using __GLIBC__ in workarounds for bugs in musl is wrong,
> > and cannot be upstreamed since it would do the wrong thing
> > on other non-broken C libraries.
> >
> > > While the eyes may hurt
> > > to see them, it does serve a
> > > good reminder of whats needed for a given package.
> > >...
> >
> > Who is responsible for fixing the root causes of such bugs in musl,
> > so that the workaround patches can be dropped from packages like NM?
> >
> > cu
> > Adrian
> If I am not mistaken nobody is responsible. It is recipe wise: Sending
> out a patch that fails for musl is rejected usually.

As you have experienced, it does create a huge technical debt to ship 
workaround patches in several recipes instead of fixing the bug in musl.

> The last example could be fixed easily at musl shipping a ethernet.h containing
> #define ETH_ALEN       6
>...

That's already shipped by musl.

But there seems to be some incompatibility between musl and the 
kernel headers used by musl.

This has to be sorted out in musl and/or the kernel headers.

> Andreas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


