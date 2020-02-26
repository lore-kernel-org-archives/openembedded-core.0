Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5859861608
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:26:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f15so2738068wml.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 07:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WOA4r7O05+eylaOnsUl7UrND0u5lLYnfQzeUSJltEfo=;
	b=LolsnUXJRG9yIRdVOu9UaKLeNTdKFeuloIXgpBtN7Nzh70WeXD3nTCn62jH+5skgQV
	tnuii24Q5Zj48KdAiggGBtofPG+k/AIEI1pS0cW4ehnfSuiLUFLTqpoVOHABbfDk/cHi
	qGKOzACj/Yzg+0Zmf3+X52aWrVfF1ED24CwpmEpbJw/uoeMIlrr84HB88BVRkGgzk9lA
	zwFw5U0Pxd0cwXxC2w8BgEsmby0le8jwdBpwNMp61YAaNpGEIkvwuMndZfWgHPTLgKH7
	vIBbYbWHt/3/XcxTl9U5DCStbUA/SdRnYC+vYArmGNrH7k5+AJreZ9USu+9tTp6t9Row
	mQUQ==
X-Gm-Message-State: APjAAAVoSPj5XT9EL/IM67bIddAwtwWFX9dCkywTzjknglZX7Apbm4y5
	ZRA40ILhpoKO4EXEx/CYPfk=
X-Google-Smtp-Source: APXvYqzrjjh7ltq8ywdBMpiyF8kgTZDbeNr96LRpIguxmZG/L5snk9sPozrG3wXuD+wNXgCnqw7vEg==
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr5997664wmc.74.1582730767960; 
	Wed, 26 Feb 2020 07:26:07 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id l6sm3761280wrn.26.2020.02.26.07.26.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 26 Feb 2020 07:26:07 -0800 (PST)
Message-ID: <0d393be75384a6d858d2a23f73ee5b3535d3868c.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Adrian Bunk
	<bunk@stusta.de>
Date: Wed, 26 Feb 2020 15:26:06 +0000
In-Reply-To: <669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: xz threads / memlimit behaviour (was: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures)
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
X-List-Received-Date: Wed, 26 Feb 2020 15:26:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-02-24 at 16:44 +0000, Richard Purdie wrote:
> On Mon, 2020-02-24 at 15:40 +0200, Adrian Bunk wrote:
> > On Mon, Feb 24, 2020 at 12:59:55PM +0000, André Draszik wrote:
> > > The number of threads used, and the amount of memory allowed
> > > to be used, should not affect sstate signatures, as they
> > > don't affect the result.
> > 
> > Unfortunately they can affect the result.
> 
> I looked into this a bit and its complicated. The threads are used to
> compress chunks and their compression should be deterministic whether
> done serially or in parallel.
> 
> I did some tests and:
> 
> xz <file>
> gave equivalent output to:
> xz <file> --threads=1
> 
> and
> 
> xz <file> --threads=2
> xz <file> --threads=5
> xz <file> --threads=50
> 
> all give different identical output.
> 
> So if we force --threads >=2 we should have determinism?

I did another test...

Even single threaded compression gives the same result as multi-threaded,
if single threaded is a result of xz scaling down the memory usage due
to --memlimit, ie:

xz -f -c -9 --threads=2 --memlimit=2000M --keep --verbose --verbose xztest > xztest2_down_to_1.xz
  xz: Filter chain: --lzma2=dict=64MiB,lc=3,lp=0,pb=2,mode=normal,nice=64,mf=bt4,depth=0
  xz: Using up to 2 threads.
  xz: 2499 MiB of memory is required. The limit is 2000 MiB.
  xz: Decompression will need 65 MiB of memory.
  xz: Adjusted the number of threads from 2 to 1 to not exceed the memory usage limit of 2000 MiB

is different from

xz -f -c -9 --threads=1 --memlimit=2000M --verbose --verbose xztest > xztest1.xz
  xz: Filter chain: --lzma2=dict=64MiB,lc=3,lp=0,pb=2,mode=normal,nice=64,mf=bt4,depth=0
  xz: 674 MiB of memory is required. The limit is 2000 MiB.
  xz: Decompression will need 65 MiB of memory.


There even is a comment in the xz sources about this. This simplifies things a bit...


> > > Otherwise, it becomes impossible to re-use sstate from
> > > automated builders on developer's machines (as the former
> > > might execute bitbake with certain constraints different
> > > compared to developer's machines).
> > > ...
> > > -XZ_DEFAULTS ?= "--memlimit=50% --threads=${@oe.utils.cpu_count()}"
> > > ...
> > 
> > Threaded compression can result in slightly worse compression
> > than single-threaded compression.
> > 
> > With memlimit the problem is actually the opposite way,
> > and worse than what you were trying to fix:
> > 
> > When a developer hits memlimit during compression, the documented
> > behavour of xz is to scale down the compression level.

This is not what is actually happening - it appears the documentation only
talks about single-threaded mode.
If you look at the code and look at command output, xz only ever
tries to reduce the number of threads if multi-threading was enabled. In
that case, it will *never* even attempt to change the compression level.

If it can't satisfy the memory limit by reducing the number of threads,
it just errors out.

So as long as all builders have at least 2 cores, i.e. --threads >= 2, memlimit
doesn't ever affect the outcome (except that it can make the operation fail as
a whole).


Cheers,
Andre'



