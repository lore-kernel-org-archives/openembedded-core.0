Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E2A7861684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 17:12:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48R7sm4nY3z1v;
	Mon, 24 Feb 2020 18:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582564349;
	bh=lXudyXFRSZbR4V8Oq05IHzXCW4R0CXeHYbnO6i0T8ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YUDjnJOp9FLzlGfLsy+VkTCMfrCC26vr/h4apN0gLDf0KhrC/LETOv6nASm8Lvdxo
	uwbhhQgfsGI9nxctZDu5M8b/2BpmTKP5iQ0fvUjPIsCsiOoMclAzaBT4sDKKjn43mG
	QIsQ61GBl1CfSFwMoQvORGzB2OJcrcp2KNihi55BuTvKwUJYgBKuMVrwgTpjUTWKxb
	Ku/bOXw86mX3dAFImJGh+JmUphVydzet+yKe8A8JVac+s3tWlctUZ+ymVcw6lW/L57
	JZtaD0s49EY1dBR6ysgSh7r8uBHASatwPPRPvwJiKi8virTMadgvLzdgNmariV+ehh
	0edtk86rtbPYbneT9pknyF6vyFYU8+Bc8mvRYEVp7G1Q3iWQUa4t4JA0G1hi/dbGv3
	pOaAXT+gk91uEKHoBy8Ftry1kcrgk8pXlWE+b8bgEywzEmivXnT7Kz7FY+f7wrnbvi
	WPLTESvHOY6ZMq+WqJxTDzWUcMap4+9J1IoA9OEl8OboF7QSQ1Ny5hMPh5xi/LD+Zx
	6cBCbyZGgCfTNq8kNmmN90M8KAuxMJ1PhEWbDB6O5MvAHa5B2jIk5vHjxMgHnihvZp
	y/c7iuarwMdAP6+Ll3sDkkYpQTTUV6VjwG+FrzFXRQJr5f8FcBRPvhSFh8ugS4NoUN
	6wziEerQJKSuIqf7dp+XWjG4=
Date: Mon, 24 Feb 2020 19:12:26 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200224171226.GF27036@localhost>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <669ba509f1df86a8f2c7ea172aa8ff23d7449744.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Mon, 24 Feb 2020 17:12:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 24, 2020 at 04:44:28PM +0000, Richard Purdie wrote:
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

This was also my guess after reading the manpage,
but no definite answer from me.

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

xz -9 needs 1.25 GB per thread.

And since xz decompression speed is linear to compressed size,
-9 is often wanted since it gives the fastest xz decompression.

> Does anyone know more about the internals and how to have this behave
> "nicely" for our needs?
> 
> FWIW we haven't seen variation on the autobuilder due to this as far as
> I know.

I assume the autobuilders have plenty of RAM per core?

For any reasonably sizes machine that doesn't OOM on larger C++ projects
the memlimit is a nop and can be dropped.

More problematic might be developers with oldish desktops/laptops with 
many cores and few RAM.

> Cheers,
> 
> Richard

cu
Adrian

