Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 93C7760626
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 17:14:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so117629wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 09:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BHjRk443i1+ss2XOPI5xzVXPa8EQwLKrMncr+f+juDc=;
	b=hqaPr6YR/0+dmLsiDEeM8fkv6hPDMpckETPHTgdTlPKFEZnDsoHG/lz03Eqry229sR
	n4cqFa0KovvzKLSJQ245lwN2yxYctAhbd/HLXZJOebiVjNUXrDIVWX9TY2e4kwlce13i
	sCTqhQK6WtagkxIE9O3Ziy1MZxBS6MU8D6Kmuw+9PigccWsFIX/RzMGkG4i7x0atv9/1
	8Cf4S4TSs+PIVM6fe9agjm+1+zDFgHJCtI2ilMw0IdG0uxRPetz66TWFIMjKZZBqTY9g
	o9CZGOtUBlarZPVCkSEF+QGnB+Z02KNLUY2L1IiMu3gmafxOYN5oTe2J1WsFPPPLnMYi
	LurQ==
X-Gm-Message-State: APjAAAU15XmktFh+9wuY9VG9v4aFW//V+soCujY6BGDP/tRDhrSzYK62
	Ih2D+3eG9gz2O/v10TD3cM8=
X-Google-Smtp-Source: APXvYqwTDANSxK+4KkBxZe/N/aEwlL+KxAeqG0ZhctbHyJ9n3XA+1ibM1HVwYEHBLyLddH9ZWUETfA==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr60331wmi.31.1582564459243;
	Mon, 24 Feb 2020 09:14:19 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g7sm20024044wrq.21.2020.02.24.09.14.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 09:14:18 -0800 (PST)
Message-ID: <23c396de32bb98414dcb2aaec178e73079e000d3.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Adrian Bunk
	<bunk@stusta.de>
Date: Mon, 24 Feb 2020 17:14:18 +0000
In-Reply-To: <669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures
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
X-List-Received-Date: Mon, 24 Feb 2020 17:14:18 -0000
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

How large were your files? Given threaded operation works by operating in
'blocks', you should have a different number of blocks in your output.
They're all compressed independently, so I don't see how the result could
be identical, unless the block size is large enough for xz to not create
as many blocks as you allowed via setting the upper limit on the # of
threads.


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
> > 
> > I assume 50% wrongly gives the same sstate signature no matter how
> > much RAM is installed on the local machine?
> 
> I did some tests locally and I could see different output checksums
> depending on how much memory I gave xz.
> 
> Perhaps we should specify a specific high amount like 1GB?

If I understand the man page right, at compression level 9 (default in OE),
each thread / block will use up to 674MiB of RAM, so a limit of 1GiB
effectively reduces parallelism to 1.


> Does anyone know more about the internals and how to have this behave
> "nicely" for our needs?

What are the needs specifically?

In my case, I have some defined builds that run on their own, so they
are allowed to use all memory and a certain (lowish) number of threads.

I also have other builds where several can run in parallel, and xz would
just be killed if all of them were allowed to use all RAM, so I have to
reduce threads and memory consumption.

This of course means slower builds...

I don't want to penalise myself or anybody else by generally forcing a
low number of threads either.

> FWIW we haven't seen variation on the autobuilder due to this as far as
> I know.

BTW, pigz and pbzip should have a similar thread related problem, according
to the man pages, if you read between the lines.

Files are split into chunks, and chunks are compressed individually in the
pbzip2 case.
pigz terminates each chunk with an empty block in the final .gz file.


Cheers,
Andre'



