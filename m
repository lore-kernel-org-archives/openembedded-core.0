Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC6A7E323
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 15:37:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458ttB5Xsxz63;
	Thu, 23 May 2019 17:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558625859;
	bh=zNjv5Sk6pQyACrXLw75oLOlUi15rMe/3Bo8YTNxawV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEqcq65XgAZkMoCxMUzATYop03qnjEGjFx1gttbPoGF4xwy86rc5DKy4tGmUzeyky
	BtpTuFq0KG7d/iN2+2CTCDtTEq/gm1y6PGjKTgGUsoOfXOEslBQIEt0BgF3yR/INJK
	e2SK1vI5mg9HklA19aNWsGS3Y4HDkZF3KpkgZLp9H0+pH8mtPZyE2wnaFKA4RYUlQH
	ncLl/pEzx2wNi4fTWWf5mtwRo3u68oFA8BV1FiLo5Gv3xAg5XvoNjXLFnA1TyorvXr
	SmxJIfjD1aE/zWAlnM4ieHCheoL7eCnDJmbAc5W3mcIzilBvUPdFxoFxVC4BRxKJBd
	s0hblz/eLFDvsYEA1Q1z4/UKvb39JnkCaBs0AdPw4s4hgXyQsNkRGzvW7+RHipxn/+
	gRzePE6gt/JNWVNA3ys/SeLB1luXs8eUo+u16N+s9cFCwW6Fh09cOZX9nUP0fjmo0Y
	MVLCCgo72uTmQemhF4krD1Aw1igh2/fghlw+ru7/SMTNl2rEfPGI8LI/DC7MpMb50f
	CzMPUSSRFQTgyZG+gLSFcSmcMQLsurcUQko9gJMLTXTcIGDD9FiBYVay9zUwJVww+n
	YvABHCTtibZGR/3iEZ+sACnKKDfp1hkD9nA9y9tGVfjMr9TPB4Rv6fr4hEn9dWY2dG
	teoAh0zjAJn1tTAD3J3tLKYI=
Date: Thu, 23 May 2019 18:37:37 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190523153737.GB3348@localhost>
References: <20190522013228.7591-1-raj.khem@gmail.com>
	<20190522013228.7591-3-raj.khem@gmail.com>
	<20190522064909.GA9621@localhost>
	<CAMKF1sqj0+y_55xVf6SRjS1czodtioUYxVv1tbWU4_7AKYrzLw@mail.gmail.com>
	<20190523061010.GA11736@localhost>
	<CAMKF1so0kA0Ugk=c9qnW2bsTo78wCxHfNEjOuMbAxQbfU+rPvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so0kA0Ugk=c9qnW2bsTo78wCxHfNEjOuMbAxQbfU+rPvA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Thu, 23 May 2019 15:37:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 23, 2019 at 06:52:23AM -0700, Khem Raj wrote:
> On Wed, May 22, 2019 at 11:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> 
> > On Wed, May 22, 2019 at 04:29:33PM -0700, Khem Raj wrote:
> > > On Tue, May 21, 2019 at 11:49 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Tue, May 21, 2019 at 06:32:28PM -0700, Khem Raj wrote:
> > > > >...
> > > > > PN and PN-binutils is not empty anymore on musl
> > > > >...
> > > > > ++#if !defined(FNM_EXTMATCH)
> > > > > ++# define FNM_EXTMATCH (1 << 5) /* Use ksh-like extended matching.
> > */
> > > > > ++#endif
> > > > >...
> > > >
> > > > This might fix the compilation, but it is horribly wrong.
> > > >
> > > > It passes a flag to a function that this function does not understand.
> > > >
> > > > In the best case the function returns with an error on unknown flags.
> > > >
> > > > In the worst case the function does silently something different from
> > > > what the caller expects it to do.
> > > >
> > >
> > > I forgot that the API is provided by libc here so mimic'ing the define
> > > infact could
> > > cause pain. I think its better to nullify it in this case where it is
> > > being used in these
> > > files.
> >
> > Just looking at the usage in src/elfcompress.c, my first impression is
> > that this tool is mostly useless without a properly working FNM_EXTMATCH.
> >
> > Are the eu-* utils actually important in the cases where space is so
> > limited that people are forced to use musl instead of glibc?
> >
> >
> They are primarily needed for testing and now we have good auto testing
> infra it would be good to build them

Known-broken code is not a good basis for testing.

When I build elfutils locally on my x86_64 desktop and run "make check"
all tests pass (with 3 skipped tests).

Adding
  #undef FNM_EXTMATCH
  #define FNM_EXTMATCH 0
to the defines in src/elfcompress.c gives me one test failure.

That could have easily been a day wasted by someone debugging why this 
test failed with musl.

If these tests are really important the fnmatch replacement from gnulib 
might help, similar to the other cases where missing functionality is 
added from gnulib to add functionality for musl builds (e.g. argp, fts).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


