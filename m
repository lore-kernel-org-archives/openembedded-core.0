Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5632A7D36D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 20:24:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44ZHcf2NsRz3G;
	Wed,  3 Apr 2019 22:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554323091;
	bh=gy6Wt1b8tRopD0Z1IXytbBj+/bmhBCAGui8wysXO3HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j6qgXqDIMg9jOwvF3yVOCdJxtaMSkIW+Kco6VmS97YbZn/C2U6aAqKOJ3TQ5yIo3B
	p6UBe+GGx6N0cV7aZ5xrjFbSnAxve+TaQLWZKXwFKvHZK4VBRhC2yrgbG0tmOPYQi+
	9+AfHrNTIpkQ8AslCTvxC//UGmB+TuRe8UTSZvawdv9XqnFKvdMNHnbJUtKf+WBPLi
	lmWODi7uueXr3yRYQLBrB5djcbFMilaYt5dWfY70pYDUHwb/R3Eu+rCswbqTAwy2HU
	meVv4WP2syJHDFT8dzOFDX7FJVWqYP5wDB2/3ooRM2+r+fTcJta2s07lkxEhwZ1+Zj
	qk9yLy1yRVfmSU2RdvgLH37tF/oRMlfbDqU9yrq4K9cf/BNoUR8uNvJ7M9uU5S0qfy
	99dzYevXOiqS16z0tbNFPodoRYNdjtvKm2/mUZ89ZemLAXMnZZdlqbMVAywRBf4sBS
	9p6zM7t6KaAhZNjrlWH0tgzv/QDGkDZAx7DDHGzNNTtbgfKvfi1D29zC/w6jD6LHtK
	dxkPIKgVnWcmt7O0i8UXuXswdhD1BzoC7aj0iYeXyeSldHHdMCcUnDAJMtfHwta7C8
	agb1+Jt03XuLWuYe5Ruzobcb2t9445P90Id5YoM55y96lYY0K7IFfJlX+fHsXFBXtF
	wyelp6BqkuGHEnwPNiBEg0K8=
Date: Wed, 3 Apr 2019 23:24:48 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190403202448.GA7131@localhost>
References: <cover.1554233389.git.pkj@axis.com>
	<8694f4c6a289db1fe45c24bc1ee9139458e09521.camel@linuxfoundation.org>
	<20190403062249.GB1281@localhost>
	<CAJ86T=Wfp+1mrgWZCOG5VrhONADi08yZXd4Fm3L2Txb1euyUuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Wfp+1mrgWZCOG5VrhONADi08yZXd4Fm3L2Txb1euyUuA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Correct and improve the ARM tunings
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
X-List-Received-Date: Wed, 03 Apr 2019 20:24:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 03, 2019 at 12:29:29PM -0700, Andre McCurdy wrote:
> On Tue, Apr 2, 2019 at 11:23 PM Adrian Bunk <bunk@stusta.de> wrote:
> > On Tue, Apr 02, 2019 at 09:26:46PM +0100, Richard Purdie wrote:
> > >...
> > > "armv4t" is defined in the arm tune files to mean "add -march=armv4t"
> > > which is the convention used throughout all the tune files.
> > >...
> >
> > Unfortunately this is not true.
> >
> > OE has both armv7a and armv7at tunes.
> >
> > There is no armv7a without Thumb support,
> > so no -march=armv7-at exists in gcc.
> >
> > Both armv7a and armv7at tunes pass the same march to gcc,
> > but [1] is not true:
> >   Default to using the Thumb-2 instruction set for armv7a and above.
> >
> > The hardware supports Thumb-2 in any case, the actual difference between
> > the armv7a and armv7at OE tunes is whether OE tells the compiler to
> > generate ARM or Thumb-2 code.
> >
> > OE has both armv6 and armv6t tunes.
> >
> > There is no armv6 without Thumb support
> > so no -march=armv6t exists in gcc.
> >
> > Some v6 support only Thumb-1 and some v6 support also Thumb-2,
> > so what gcc does have is an -march=armv6t2.
> > But OE lacks tunes for that.
> >
> > For matching the gcc options it would be correct to remove all
> > armv6t and armv7at tunes that have no coresponding gcc options,
> > and add armv6t2 tunes.
> 
> Aligning the tuning options exposed via the machine config files to
> those supported by gcc seems like a worthy goal... but would be a big
> upheaval at this point.
> 
> Note that the problem isn't specific to ARM. There are similar issues
> for x86, but there we seem happy to provide a very minimal abstraction
> with no attempt to track gcc. e.g. "corei7" hasn't been a documented
> -march option since gcc 4.8 and we (somewhat arbitrarily) map it to
> -march=nehalem to hide that fact from end users.
> 
> So the high level question seems to be: should DEFAULTTUNE even
> attempt to provide a full featured mapping to the options provided by
> gcc? Are we happy to expose a limited subset without a 1:1 mapping for
> the options we do expose (current ARM approach) or is it better for
> DEFAULTTUNE to hide away all the complexity of the options provided by
> gcc (current x86 approach).

The current 32bit ARM[1] approach seems to be an attempt
of a 1:1 mapping.

For ARMv8 it is already obvious that DEFAULTTUNE is not long-term
maintainable, and duplicating all the gcc rules regarding feature
flags[2] also sounds like a pointless exercise.

What are actually the benefits of DEFAULTTUNE with all the tune files,
compared to just let the user provide a string that is passed to -march?

cu
Adrian

[1] ARM <= v7, not the differing 32bit ABI of ARMv8
[2] example:
'fp16fml'
     Enable FP16 fmla extension.  This also enables FP16 extensions and
     floating-point instructions.  This option is enabled by default for
     '-march=armv8.4-a'.  Use of this option with architectures prior to
     Armv8.2-A is not supported.


-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


