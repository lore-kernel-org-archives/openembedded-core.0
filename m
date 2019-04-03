Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2590D7D24B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 06:22:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Ywx72SyJz4R;
	Wed,  3 Apr 2019 08:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554272573;
	bh=GVmJB+llHune5h8/qXIOGgbV1m6cnxJOkHilSq4IgzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSMeWzjkkOrWhh8BG6EPscfhzDzVNH4urw11Ts6rxitBHRXwRuSNCdegFlK+A0a4p
	mRsM3VQVaAUz1tbo892/JoIgQ//VcwoR+L99p1llGrPUA5lFc6UjDk0LOLna0uX866
	zE7Wyh6cRyZ2GRmm3TG0R7pBlKpy/yXOnvyM43EjCIyP781KRXBFHVzqLwhYGFdBJz
	mzcoP0kSsM8zjPN9ffE0O8V/1VNthEvGTqWR+HO2zeYP8+ngd1NPvpECyyheFdR+LT
	N0FWWo2pMpEPUy4Nw6uSj6TKrCCDC/7npXnBIo4lq+FMBpGYTpDqlmKc4WQFWO/qIn
	KbtNlJo6+v4TLzNKerJgZbgmrrbxU79sVOzPDYbdFO1BJ7Uukm26rYgnOuEbMGB/P5
	cQUdBPi8r917ywbQBMvmXNSx2aJlvGXMsGeJTpUDP6+5JeVN922hyjv0KrW2XP1HCb
	1xL0HiDVw8V+RzuOqBxZ8OuhXRrC29mJGsNnA+0AWhZ5qRWKcYTpoC1BqwJvD+WXsr
	RX8HCKcFtflZo77ukbHeUMnfpnk1p13IcNdzpM8WHQlVN0L+B2Pw33wdxZq0hL1LAl
	gdThlHghLRph7+RA8z+hiPQVYvWMyXvPj4tlD8xUjU+dC0SVMQEB0ymuNMMCgzCcLt
	RUAcQxDDC9i/o+0x9uttSvww=
Date: Wed, 3 Apr 2019 09:22:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190403062249.GB1281@localhost>
References: <cover.1554233389.git.pkj@axis.com>
	<8694f4c6a289db1fe45c24bc1ee9139458e09521.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <8694f4c6a289db1fe45c24bc1ee9139458e09521.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 03 Apr 2019 06:22:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 02, 2019 at 09:26:46PM +0100, Richard Purdie wrote:
>...
> "armv4t" is defined in the arm tune files to mean "add -march=armv4t"
> which is the convention used throughout all the tune files.
>...

Unfortunately this is not true.

OE has both armv7a and armv7at tunes.

There is no armv7a without Thumb support,
so no -march=armv7-at exists in gcc.

Both armv7a and armv7at tunes pass the same march to gcc,
but [1] is not true:
  Default to using the Thumb-2 instruction set for armv7a and above.

The hardware supports Thumb-2 in any case, the actual difference between 
the armv7a and armv7at OE tunes is whether OE tells the compiler to 
generate ARM or Thumb-2 code.

OE has both armv6 and armv6t tunes.

There is no armv6 without Thumb support
so no -march=armv6t exists in gcc.

Some v6 support only Thumb-1 and some v6 support also Thumb-2,
so what gcc does have is an -march=armv6t2.
But OE lacks tunes for that.

For matching the gcc options it would be correct to remove all
armv6t and armv7at tunes that have no coresponding gcc options,
and add armv6t2 tunes.

And that's only for the legacy 32bit platforms.

armv8 already has 21 feature modifiers in gcc 9,
and while not all 2^21 or 3^21[2] combinations are
valid the old tune approach won't scale for that.

> Cheers,
> 
> Richard

cu
Adrian

[1] https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#migration-2.6-miscellaneous-changes
[2] enable/disable/default

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


