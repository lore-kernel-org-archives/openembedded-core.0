Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B2A527F9A5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2019 16:08:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 479zTM5Nd2z5k;
	Sun, 10 Nov 2019 17:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573402137;
	bh=496ZU0WfzqHHxdPLoCUse+k66EO7/JIvoSUNbZUyN38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwg4vG/oCDBgDstNC1k/rIJICZbAqUvy23Ps/kwB+hk6EGkfSQRI+ZCkl99XEGTn0
	aM9jGpF2O0tf7uHulC8yXkNI7qis2vF8SnbA4SiqMbirD3AaOeRJD77K59CRq+dbpf
	cWWN23yZBYxVNR8GisP5GYaGUObB5CIXqjHw40Iz7DsgvS0Kjm42egapyJMy95pW2G
	bQ4MsoSdvYuVVl44VPdjCAVNaPueRFg8oSS0iaBqnzDvRuqq9hBEMS1Ow5Ltzff9bf
	rSNe3g7UFzZv+NsXXGRvXBqNpdOJSvL/Lws/XwsjzdUMFo74oUwvKkEgojt8MhQ2rH
	lWemLzu/l1cYxx+2lNVikNR4yiUlN/NSGMDZ6iKo4z3yNYs1xKR2ICWP0UHMKZuQgS
	LaXUIzK1DKD+KQ7rWMQMqWkj4zpvdbJr+Haaur3cBVscGqaWn8BaK5On34ziV8xy1X
	+WH+nv2Q7HxjDC6pyaOZuixNA7Po4AZwC4FKszsdFMsRp8fVzujQV3XQ+1pOjl3AsH
	i4KUiBiWecZ5gsb+XLK5ambiVBqMasrf6ZbZ/ajN8KBsMqzWjSggc5FPqvRe6eDsiY
	Vm6VjOzaHvmxr6HOJwxNmn88CDb1XaGYgCSJu0JcmuehyYGjZDlQS2C/1sF0+CtxuN
	fQuzJCKEQHR3TdlluZXlr23k=
Date: Sun, 10 Nov 2019 18:08:53 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191110160853.GB8956@localhost>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
	<CA+aJhH3s7NhB-4YspmXrvrcG4py1=i2fJXg=seWPkJzosqVFGQ@mail.gmail.com>
	<CAKmqyKNVrqT9hHQxp38=72bBkz405P=6UJFPODxr5OLt_GSqDA@mail.gmail.com>
	<20191108202438.GA21138@localhost>
	<023265d217840d956c5e54d12591d7cfdd0442b5.camel@linuxfoundation.org>
	<20191109203026.GA8956@localhost>
	<b3c2b3459bc731eb44ea7247d52f2a8179b443d9.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <b3c2b3459bc731eb44ea7247d52f2a8179b443d9.camel@linuxfoundation.org>
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
X-List-Received-Date: Sun, 10 Nov 2019 16:08:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Nov 09, 2019 at 10:05:22PM +0000, Richard Purdie wrote:
> On Sat, 2019-11-09 at 22:30 +0200, Adrian Bunk wrote:
> > On Fri, Nov 08, 2019 at 11:07:04PM +0000, Richard Purdie wrote:
> > > On Fri, 2019-11-08 at 22:24 +0200, Adrian Bunk wrote:
> > > > Especially when looking at the arm64 situation I am wondering
> > > > whether the best option might be to throw away the tunes mess and
> > > > let
> > > > the user write the compiler options directly.
> > > 
> > > OE once did that. I think anyone who lived through it would say
> > > that
> > > the current situation *is* an improvement over a free-for-all.
> > > 
> > > This is mainly as at least we're now consistent whereas before the
> > > same
> > > thing had different names in each BSP.
> > 
> > The BSPs should not invent names for anything, all a BSP should do
> > would be to set some kind of
> >   TARGET_CFLAGS += "-mcpu=cortex-a53+crc+crypto+sm4+nosimd"
> 
> What is the name of the package feed these binaries would go into?

The name of whatever is passed to the compiler,
or an artificial name chosen by the distribution.

> > > I don't know what the answer is but I don't want to go back to
> > > that!
> > 
> > As of gcc 9 there are for arm64[1]:
> > 
> > 6 -march= architecture levels (8.0 to 8.5)
> > 35 -mtune= tune options
> > 22 modifiers for -march= and -mtune=
> > 3 different ABIs (aarch64, aarch64-ilp32, armv7)
> > 
> > Even ignoring the tunes you already have
> >   6 * 2^22
> > different architecture+modifier combinations.
> > 
> > Not all combinations are valid, but another can of worms are the
> > definitions what is valid and what is default amd what gets
> > indirectly
> > enabled, e.g.
> >   fp16fml
> >     Enable FP16 fmla extension. This also enables FP16 extensions
> > and 
> >     floating-point instructions. This option is enabled by default
> > for 
> >     -march=armv8.4-a. Use of this option with architectures prior to 
> >     Armv8.2-A is not supported.
> > 
> > It can be recursive:
> >   Feature crypto implies aes, sha2, and simd, which implies fp. 
> >   Conversely, nofp implies nosimd, which implies nocrypto, noaes and
> > nosha2. 
> 
> I'd advocate that we add the combinations which people need and use.
> The tune structure doesn't require every combination be there.

Does any person volunteer to be the "we"?

This is nothing that will just work, and for arm64 we are talking about 
30+ tune file each with a sizeable number of tune combintations.

The few tunes that currently exist do not even expose the fact that
there are already 6 architecture levels with one-way compatibility.

And how do you determine "combinations which people need and use"?

It is up to the SoC designer which features to buy from ARM,
and new combinations appear all the time.

Like how will it work in practice if a user asks today for a tune for
a Cortex A55 without sha3 but with sm4 enabled for warrior?

I understand what you want, but I am worried that in practice this might
just be a huge mess.

And it is a lot more complex than the few combinations currently
available on RISC-V.

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


