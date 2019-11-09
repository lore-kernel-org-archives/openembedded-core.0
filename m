Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AC6AC7319F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2019 20:30:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 479TKd1g4Dz1M;
	Sat,  9 Nov 2019 21:30:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573331429;
	bh=nT31y5aXOvNKf2IggHpNAm8bF3R94rmCCU2zwtUL0Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jRORyorSa7abBGHvPFv6jVjyz+Pr9TKTdzXa9nQHPig/K6k2QHKWPeTeCk7xClVQ1
	6buCPDxxORMWKApnNWdP2FWJfe7c5im1qyEJMgx8FanZmztlJAMuFGg+j+dyk5+gV9
	WQoXwiSAHdMwyTYovMxUtrA2tOH60erB5Zf2JF6RhQwhsU7WJPjVkZjCEawNZlTqvj
	Ydp0LJ/yXJXPJICGcg4CsaZ92YoS3CJuWRfp0hfwiIAlOTcqRIqFk1K7fnkE914s3E
	Il31eW8uWtvlfgP0i2L841SAd2A0lAjlsDOYWO+bCygVadbKqfJGlx6zyL98IE/7sP
	tq6Yty+lymDa47Plvmu6Sy+PXKfV9hVCmafLYUXPySkbG1T/Y7zToyVBbi31xuAvnn
	CLjjbNQqviZq87sqZiwaMGLRxDd+YxTACIESSb+oS9dbHHZZhZm+oLAAimFOG8B21Y
	Gre8OLUXthEux/ArywMVqhpbl8/c56EbdPqI089sB8kU4vW4HIIY8PDGGnRnwDAjak
	MIWQibz69GP5gkZgGB3bcx0MSXJ9v1UsWJQphawn7BqqlxHSik++0iS7LbX1lp5z8G
	KuCPAFcDEwTHggwNNJHjvNI9QS32TDZ3yfEd3WUKj0Gs4rkjeuKxDeiSPN5vyMGBwB
	6yqjrjNCpFfSWHx6Y8R78iOU=
Date: Sat, 9 Nov 2019 22:30:26 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191109203026.GA8956@localhost>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
	<CA+aJhH3s7NhB-4YspmXrvrcG4py1=i2fJXg=seWPkJzosqVFGQ@mail.gmail.com>
	<CAKmqyKNVrqT9hHQxp38=72bBkz405P=6UJFPODxr5OLt_GSqDA@mail.gmail.com>
	<20191108202438.GA21138@localhost>
	<023265d217840d956c5e54d12591d7cfdd0442b5.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <023265d217840d956c5e54d12591d7cfdd0442b5.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Sat, 09 Nov 2019 20:30:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Nov 08, 2019 at 11:07:04PM +0000, Richard Purdie wrote:
> On Fri, 2019-11-08 at 22:24 +0200, Adrian Bunk wrote:
> > Especially when looking at the arm64 situation I am wondering
> > whether the best option might be to throw away the tunes mess and let
> > the user write the compiler options directly.
> 
> OE once did that. I think anyone who lived through it would say that
> the current situation *is* an improvement over a free-for-all.
> 
> This is mainly as at least we're now consistent whereas before the same
> thing had different names in each BSP.

The BSPs should not invent names for anything, all a BSP should do would 
be to set some kind of
  TARGET_CFLAGS += "-mcpu=cortex-a53+crc+crypto+sm4+nosimd"

> I don't know what the answer is but I don't want to go back to that!

As of gcc 9 there are for arm64[1]:

6 -march= architecture levels (8.0 to 8.5)
35 -mtune= tune options
22 modifiers for -march= and -mtune=
3 different ABIs (aarch64, aarch64-ilp32, armv7)

Even ignoring the tunes you already have
  6 * 2^22
different architecture+modifier combinations.

Not all combinations are valid, but another can of worms are the
definitions what is valid and what is default amd what gets indirectly
enabled, e.g.
  fp16fml
    Enable FP16 fmla extension. This also enables FP16 extensions and 
    floating-point instructions. This option is enabled by default for 
    -march=armv8.4-a. Use of this option with architectures prior to 
    Armv8.2-A is not supported.

It can be recursive:
  Feature crypto implies aes, sha2, and simd, which implies fp. 
  Conversely, nofp implies nosimd, which implies nocrypto, noaes and nosha2. 

> Cheers,
> 
> Richard

cu
Adrian

[1] https://gcc.gnu.org/onlinedocs/gcc-9.1.0/gcc/AArch64-Options.html

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


