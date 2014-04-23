Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 69574607FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 03:32:47 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id h3so3857269igd.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 20:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Rsk1j+DT53RYMH9RGrL4du+G+8KEqnTdwI7YI9DrN7w=;
	b=nSiQIzSJ5Rk9x9VGzENu5+3g/cPAd5k7rHa2FEH80sSpAnYDrC05fE/meq+6sfBkIw
	TKnZJpmv/vwS0fu/Q1r6UjJ73WiUbf3fOF686uacUH9H3Z3UtssZcJCLj6zovBwjm9n/
	epLT+jizqpey55A+iDQAa8LHka/NkRBjqeFVLy92vYja7jJTRTTsSucKFEkp6i1rb4Iw
	GmtMCG6LBfUT/frC5zoBTa7ofu6QlCtRb22C8cbNhAOQEceIM0FUJTO0iF9x/6+teKeg
	hTGzjieL5QckAqIJWqKwPagQDnV2oiBtHuEBzrPLJb2ZIKV2m065I51oxxaxNLAGKu5C
	pFJg==
X-Received: by 10.42.173.68 with SMTP id q4mr40082604icz.41.1398223968323;
	Tue, 22 Apr 2014 20:32:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 22 Apr 2014 20:32:18 -0700 (PDT)
In-Reply-To: <1398178648.16672.47.camel@ted>
References: <1398178648.16672.47.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Apr 2014 20:32:18 -0700
Message-ID: <CAMKF1sqeFdRY_CbitddTt=pXzYb=i0tq08nQeKVz2w=a+ASZ3w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Arch specific compilers (instead of tune specific)
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
X-List-Received-Date: Wed, 23 Apr 2014 03:32:48 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 22, 2014 at 7:57 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Right now we build multiple different versions of gcc-cross, effectively
> one per target tune. This is somewhat inefficient and the problem just
> gets worse when you bring multilibs into the equation.

I fundamentally agree with this approach and have been thinking
vaguely on these lines too and actually treat cross recipes no
different than native recipes. After all they run on build host.

>
> In theory at least, we can actually use the same cross binaries
> (binutils/gcc/gdb) for all tunes for a given architecture. We've already
> proven this is possible with the changes to the -cross-canadian
> variants.

Yes, although I think we should tend tunes towards machines and keep
arch fairly least common denominator
to achieve this.

>
> There are some things we don't currently support well too such as
> multilib SDKs and 64 bit kernels with 32 bit userspace.
>
> In the 1.7 timeframe I'd therefore like to propose we re-work the
> gcc-cross recipes to have common architecture specific binaries. The
> advantage would be fewer builds of gcc, better sstate cache reuse (and
> size) and faster turnaround when switching tunes.
>
> I've already experimented with patches for this and have something that
> roughly works at:
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t67&id=9c10238df1b2a5d818b289f85d2b9a13e2a886e9
>

I will take a good look at it sometimes this week.

> This patch makes the cross recipes more like native ones with a new arch
> suffix to the cross recipe.
>
> At the practical level there are some challenges:
>
> a) We need to split out a libgcc-initial from gcc-cross-intial since
> this is target specific.
> b) We need to stop gcc-cross and -initial from building libgcc but we
> still need the unwind.h header it installs.

yes, (although this can turn out to be quite hairy), what we would
need is multilibbing libgcc and gcc crt

> c) We need to remove references to tunes from the arch specific parts.
> This includes the gcc float option code.
> d) Need to remove the sstate dependency of gcc-cross-${TARGET_ARCH} on
> libc


> e) To allow libgcc-initial to work, we need to save out the
> gcc-cross-initial artefacts. I'm hoping we can slim these down a little
> (for gcc-cross too).
>

Somehow if we could totally make it independent and not have to save
prebuilt tree etc.
would free it up nicely and we could even then build runtimes
specifically optimized for tunes

> I'll split that patch into a number of patches and alter it to better
> reuse the libgcc code now I have an idea what I'm aiming for.
>
> I'd also note that this change doesn't yet optimise the multilib
> toolchain build but that should be an easy step from this patch.
>
> We may need to end up listing a hard list of "aliases" for the toolchain
> on each arch rather than some of the funky multilib parsing we currently
> do for simplicity. There are only a finite set of permutations supported
> anyway.

I think gcc has a good separation of multilibs on its own. We should
look into it and drive that to packaging end
for gcc runtime support.

>
> The purpose of the email is to give people a headsup this is coming and
> let people take a look at the preliminary code.
>
> Khem: Particularly interested in your thoughts! :)
>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

