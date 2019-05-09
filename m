Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B12127DFEF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 14:31:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450G4V58Rpz5c;
	Thu,  9 May 2019 16:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557412299;
	bh=679l9ZQoIsqV540uY1mZEZdqwzk5Sy8Hrn82QcW6cRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPuH4r/kLmkO8TsFqwFX3aY++NoBgFAO6ELIjkVNg9ni640pJM0whU2gIG4fbEPKZ
	qedtZAn/lgojSWKOVqAmjGHkVX8dIqMBrOlB1zVfXZ49i0gzWlemdKIQ2AHpKP0IJW
	1RGgqJOBp+tbFUQT4ReDs6qyrZhzJxDTM/JeBkTcALNjcgVIPRzUMcT+sdnynOQdGk
	CiGqHqlV92C8hNZCbvnWw386g3wq5OZKHPYHS8DU9nGa5F+J65Y6+Tih/N1MqVVJV6
	55dsgTDEv4eCbOWTEvY7xGAzhXYwqlniQ8OCJoeyuQYJB7yv2QJgAimcYhlncCvLF8
	FVmWFJvGOLwSL4sMue7SIsaXEYT8Lhn4oKp2NbsMDSSMd62eWzxR+lDiL580kbQonz
	j0nHULLoFM1xtMY+mkHBj28PSF2ZYW6Onu8XER7ftOWzzcZPrlPRXOQRzFc7BsUmZT
	ZvTp16Saau8xkOI0rk+WxClPrQyubCRiHZAgcGW6N0LnG+SXJRmFOqY9fhV+R6wqPq
	9MaIIuHJc2cCZHfq7cMHiVk7nTQS1wcPSDS2Pi96LKihRh2hgQqlqk+ukFnLFsTuy5
	3Iz1l2SlhOFwVhGAHw+Rt5kCr80Vvokdy7Hy6kst7fP2R1ptacfyLuABf2yviukzVs
	vHuGTnQVuKYMOpNp9mgobOoI=
Date: Thu, 9 May 2019 17:31:35 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190509143135.GA25228@localhost>
References: <20190508115836.15758-1-paul@betafive.co.uk>
	<20190508115836.15758-3-paul@betafive.co.uk>
	<20190508130249.GA25917@localhost>
	<7a1b1694-9c7c-40eb-a998-343879c0283d@www.fastmail.com>
	<ba43a2fb-4c12-4b35-bb40-b58ccf18ad83@www.fastmail.com>
	<74876e92becd2c2b04831dc4776faabd87fc53c9.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <74876e92becd2c2b04831dc4776faabd87fc53c9.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] strace: Fix aarch64 build with musl
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
X-List-Received-Date: Thu, 09 May 2019 14:31:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 09, 2019 at 02:43:54PM +0100, Richard Purdie wrote:
> On Thu, 2019-05-09 at 08:08 -0400, Paul Barker wrote:
>...
> > So alpine fixes this by patching the linux headers: 
> > https://git.alpinelinux.org/aports/tree/main/linux-headers/fix-aarch64-asm-ptrace.patch
> > 
> > I think that should be acceptable here if we just do it when building
> > with musl libc.
> > 
> > Any thoughts on that before I work up a v2 patch?
> 
> This really needs to get fixed upstream. I don't mind a patch but only
> if its gone upstream, we don't want to be carrying patches to libc-
> headers.

The root problem is that musl upstream has the opinion that the kernel 
headers are unfixably broken, and therefore the musl headers contain
own definitions of structs that are part of the kernel<->userspace ABI:
  https://wiki.musl-libc.org/faq.html#Q:-Why-am-I-getting-

The kernel headers were in a bad state 20 years ago, but are pretty 
usable today - which doesn't help since musl won't even try to be
cooperative and work towards using everything from the kernel headers
that belongs there.

And the lack of a __MUSL__ define makes it impossible to work around all
this musl-specific breakage in an upstreamable way in the kernel headers.
There are actually workarounds for musl in the upstream kernel headers,
but they can break depending on the #include order.

The FAQ above suggests using the patched headers from sabotage linux,
but they are from kernel 3.12.

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


