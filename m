Received: from forward4-smtp.messagingengine.com (forward4-smtp.messagingengine.com [66.111.4.238])
 by mx.groups.io with SMTP id smtpd.web12.4732.1595045390203220791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 21:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=vRqQof/a;
 spf=neutral (domain: iki.fi, ip: 66.111.4.238, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailforward.nyi.internal (Postfix) with ESMTP id 727F9194092C;
	Sat, 18 Jul 2020 00:09:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 18 Jul 2020 00:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=VyiI/5+6uMxYIYrVc91Rpl62m2hRaW1XnJEE6trF7
	ak=; b=vRqQof/anA+egLKtmvPpDsPRHqoAJdNkv3185+2cEawx73WMUVQMydj7G
	7fCgHGs6UVgXiZZmyKKwavmAic/v1ZDMdLxxcYsG3+k7kKhA0WG+qzShE6OT7JZB
	wT++SNTLigyRjZesOn0qRxvbv/MTuwhtSJRg7UI9g0EaqU4No8C4xZO6ocEpgW6v
	OpFjUbTtKst/f2nl3JRWwgy4c+S0oQUEleHDk3SngSPTFzx39DqQiGyTGkaRGhvv
	RyZ7sxtE0Bh7iBLwQcW8NrJ41V0mURKxND8F398Y0Yd97y3uAOHXa57eGwuUQvWz
	aKx0KZqy449F+Emenfa4Ay8+MCWyg==
X-ME-Sender: <xms:DHYSX5zkfLMiSMGWBhA1ea8F4ms4wx7d6R_HxzrD8JrUpIEtvtXHeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfeekgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghnuhcu
    mfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucggtffrrghtthgvrhhnpe
    ffkeevteegfedvhfdugeelfeekgefhtdfhvdffhffhvdfgveduleeileeitdelkeenucff
    ohhmrghinhepghhithhhuhgsrdgtohhmpdhmuhhslhdqlhhisggtrdhorhhgpdhprghtrh
    gvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukfhppeekvddruddtvddrvddt
    rddujeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:DHYSX5SaV_F5i5rgG-HuCkIHzPbxZnCv9EHef42rBmYL2H-uZUSizg>
    <xmx:DHYSXzUh_kY_6m2CxJR54wYnBcb-5GptVHQPZSe51i8kCIoosaKSvA>
    <xmx:DHYSX7gtyWOY6-3cnTXvx5_BYJx7WsSZJD2lAcnBVUzosHVob1tQ2A>
    <xmx:DXYSX-pPWN3No5j8eLFbLPE4-1elqsseh7moezJ6JZMBSjF9Hl3JXg>
Received: from laptop (unknown [82.102.20.179])
	by mail.messagingengine.com (Postfix) with ESMTPA id CF74B306005F;
	Sat, 18 Jul 2020 00:09:47 -0400 (EDT)
Message-ID: <19166ade6eac9f5daabf54754e03433ccadc3b5e.camel@iki.fi>
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>, Stefan Ghinea
 <stefan.ghinea@windriver.com>,  OE Core mailing list
 <openembedded-core@lists.openembedded.org>
Date: Sat, 18 Jul 2020 07:09:44 +0300
In-Reply-To: <CAJ86T=Vw_DtkogqtQ8tW_y9A4ULgpkOJHULV-FkU5MGWgdmebA@mail.gmail.com>
References: <20200326152629.29272-1-stefan.ghinea@windriver.com>
	 <20200326191628.GC5401@localhost>
	 <CAJ86T=WJ4+8Ly59gxj6maeLQC5NAcZiM-G+uKqhTTi3u9C_FtQ@mail.gmail.com>
	 <20200326202650.GA14127@localhost>
	 <CAJ86T=ULPheVBCFMQd8-rF5v6YyCpO6phPZqeYW88NtL=f=t+g@mail.gmail.com>
	 <eb355d2835cfd5f5525216b8544a5384dcb9ad6c.camel@iki.fi>
	 <CAJ86T=Vw_DtkogqtQ8tW_y9A4ULgpkOJHULV-FkU5MGWgdmebA@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-17 at 12:19 -0700, Andre McCurdy wrote:
> On Fri, Jul 17, 2020 at 3:09 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > On Thu, 2020-03-26 at 14:23 -0700, Andre McCurdy wrote:
> > > On Thu, Mar 26, 2020 at 1:26 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > On Thu, Mar 26, 2020 at 12:53:08PM -0700, Andre McCurdy wrote:
> > > > > On Thu, Mar 26, 2020 at 12:16 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > > > On Thu, Mar 26, 2020 at 05:26:29PM +0200, Stefan Ghinea wrote:
> > > > > > > ...
> > > > > > > When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> > > > > > > since the Thumb frame pointer in r7
> > > > > > > ...
> > > > > > 
> > > > > > How are you reproducing the problem in pulseaudio?
> > > > > > 
> > > > > > This sounds like a workaround for a bug in musl that was fixed 2 years ago.
> > > > > 
> > > > > The problem can show up anywhere that inline asm is trying to use r7.
> > > > > In this case it looks like:
> > > > > 
> > > > >   https://github.com/pulseaudio/pulseaudio/blob/master/src/pulsecore/remap_neon.c#L50
> > > > > ...
> > > > 
> > > > After looking at the pulseaudio code I suspected the patch description
> > > > claiming pulseaudio syscall code would be the problem was rubbish, and
> > > > that this NEON code was the problem.
> > > 
> > > Yes, the comment looks like it was copied and pasted and doesn't
> > > really apply in this case (since pulseaudio isn't making syscalls).
> > > That should be updated.
> > > 
> > > > But when I tried to reproduce the problem it built for me with both
> > > > glibc and musl in master (the patch didn't mention that this was a
> > > > musl-only problem).
> > > > 
> > > > Then I saw that this was fixed in musl upstream 2 years ago:
> > > > https://git.musl-libc.org/cgit/musl/commit/?id=e3c682ab5257aaa6739ef242a9676d897370e78e
> > > 
> > > Right, it's not related to musl or glibc. I suspect it can be
> > > reproduced by building for an ARM target which supports NEON, ensuring
> > > that DEFAULTTUNE doesn't forcefully disable Thumb (e.g. it should be
> > > armv7vethf-neon, not armv7vehf-neon), setting ARM_INSTRUCTION_SET to
> > > thumb and then compiling with frame pointers enabled (e.g. by adding
> > > -fno-omit-frame-pointer to CFLAGS).
> > > 
> > > In terms of a fix, then changing the code to use r12 instead of r7 is
> > > probably the best solution (assuming it works), but would need careful
> > > testing. Appending -fomit-frame-pointer to CFLAGS for ARM machines
> > > building for Thumb is safe and should fix the issue too. Presumably
> > > limiting the -fomit-frame-pointer workaround to ARM machines which
> > > support NEON building for Thumb would be an even more targeted
> > > solution.
> > 
> > I finally found time to test fixing the assembly code to use r12
> > instead of r7. Seems to work fine (I was first baffled by incorrect
> > behaviour, because I changed "{r4-r7}" to "{r4-r12}" without realizing
> > that "r4-r12" meant a range of all registers from r4 to r12).
> > 
> > Can you enlighten me: why did you choose r12 instead of r8? Why did the
> > original author use registers r4-r7 instead of r0-r3? Is it somehow
> > advisable to avoid registers r0-r3 and r8-r11? The code seems to work
> > fine with any set of registers, except r7.
> 
> The compiler will work around whichever set of registers you want to
> use (apart from r7 in some cases) so it's expected that other
> combinations will work fine. Some combinations will be more efficient
> than others (ie the compiler will need to do less shuffling values
> between registers or saving register values to the stack in order to
> make registers you specify available to you). Using r12 instead of r8
> is just an educated guess about the combination will allow the
> compiler to generate the most efficient code.
> 
> Registers r0-r3 and r12 can be used within a function without needing
> to preserve their previous contents, so if a function needs registers
> it's more efficient to use these registers first. Other registers need
> to be preserved (ie saved to the stack) before use.
> 
> Registers r0-r3 are also used to pass non-floating point arguments to
> a function, so if a function takes 4 or more non-floating point
> arguments, then r0-r3 will already contain values which the function
> will need to use.
> 
> Note that in this particular function, the first argument (ie the
> pointer m) is never actually used, so it may be that using r0, r4, r5
> and r12 will give the best result. The function is pretty trivial
> though so I guess with a recent compiler just writing the whole thing
> in C will give close to the optimal result too without all the
> maintenance issues.

Thanks for explaining!

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

