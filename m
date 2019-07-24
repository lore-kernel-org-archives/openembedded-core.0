Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 80EAA7F0F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 14:58:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45tz486W8Bz28;
	Wed, 24 Jul 2019 16:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563980297;
	bh=jdxwVVebFLEErTTFFuAvAeI3+TC48KtGMWwVluxaC3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXA0R1BbCvwCU2VRZ+j7Mn51ZflA6roYu2lGQAsmIB5byZ9SiaZztfMA0gJ+WB+mb
	4IyqPn4mupdXQzBkC7huYdrdibNG+mOP95GN4mPryBKDn0IVVEnEASwzuYjldIgG7y
	7Yrr/AfUd1mYqCsoDGKPWhgxx1dWP1JiHLOngEpW5YZ/dPz9bCoVjuqUKlf07sm93J
	Z1NDLUna+9lyTdoYJx9TKfagnbL8y8wI9/8XsdLNBatjzewaiRJFw07X+R7l/LiK9z
	rgD2JfPm6mZKphTd5CS5x+LIwllT9VRoBsVQIyNFB7VsWekijzGpwH8yEHvydFpy+F
	aRjBCRaskvOYsGHh2xNc69RETpwK1hCw4L4KYG9QBtuFgAh2bQQAXMEExZNPV+q123
	2wDo+qtehuMvqy+Va1f9Y0EFZqb8Dw3BNy+H1BWLpRBXEQ6sw4axKrvICA0CtiFMMY
	ru6IFmkg2jW8byXOK6v6rlMxhvth4IBeoEsksgL2XbdwxwO+MJZlrzaS8yw4HgEbPe
	JYxoPrpmef2ozmhuZVwqIb9ICQZykFdq0p+4Us6ItUQmf2wdkOEbw5XgP1D4n+/XVx
	c68aYLC6uFTikRP7+PKUK7wp8VVaUgGkvHnDS0SeXL5FLjaRRgU/hM2iCDh5j8gTeM
	8fYO7I0OX0nwqHFjT8pmVQuI=
Date: Wed, 24 Jul 2019 17:58:14 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190724145814.GB626@localhost>
References: <20190720180058.10672-1-raj.khem@gmail.com>
	<20190720180058.10672-3-raj.khem@gmail.com>
	<20190721152022.GA5474@localhost>
	<531504ebcdae52b7ce1fe8221417d4026c0f9ceb.camel@linuxfoundation.org>
	<CAMKF1sqhkL7moib2Z0N8+quptPW7fEx9ez_MBE0zZAjr-A-kgg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqhkL7moib2Z0N8+quptPW7fEx9ez_MBE0zZAjr-A-kgg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 3/4] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Wed, 24 Jul 2019 14:58:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 24, 2019 at 06:39:16AM -0700, Khem Raj wrote:
> On Wed, Jul 24, 2019 at 1:24 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
> > On Sun, 2019-07-21 at 18:20 +0300, Adrian Bunk wrote:
> > > On Sat, Jul 20, 2019 at 11:00:57AM -0700, Khem Raj wrote:
> > > > ...
> > > > ++#if !defined(FNM_EXTMATCH)
> > > > ++# define FNM_EXTMATCH (0)
> > > > ++#endif
> > > > ...
> > >
> > > As already said in [1] this is expected to result in broken code,
> > > and the upstream testsuite also confirms this.
> >
> > I've taken the patches as they don't make things worse. I am a bit
> > concerned about a few places musl is building up problematic patches
> > though (systemd, elfutils, ltp come to mind).
> >
> 
> Yes I am aware of this I think LTP we are upstreaming and I hope this will
> be better in future
> Systemd we might have to re-evaluate but I think few patches are worthy of
> upstreaming elfutils I don’t know yet

elfutils and the same bogus change in ifupdown might need the 
implementation from glibc added as an own package, similar to
what you've already done for argp and obstack.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


