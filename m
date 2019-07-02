Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E9FAB7E86D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 13:26:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45dQ4f4JJpz4X;
	Tue,  2 Jul 2019 15:26:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562074002;
	bh=W4FR2WRWnTpTZk5LMMFpj/fzUE2UhXeWY0geIMmgf/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YO2H6ZepQOyYOpayQOL3vGPfkjMYNPQCMismburhv+TG2H934Go5uVl//u2J4C9T2
	DUSy6IF6xl2oJb4Y+hxV073oSMJiL+AE996Wetuhk/ScUN5XY/Io7KKTJ+/M/zIWhY
	eO8WfxHEhbxEzOSQKWkuH0vlXBjjNwJN2rhgRZUQNff0uuEJVEigFEpVBy0N6jpxp4
	hPR566jwR8pZpKLC4I7CXyN7MMdpnnos5u0BhntD2cfqwNQ0C2FpDlBkOWZLUX6FMG
	GWN5wz8dF5di6ki0wuSt+PAUaZ7YjIDKGXd9QRxY+ENnKUxnI7+oF+BS+CZjFQdz/X
	ZFPjZbZsLnWqxTYEA4s9af1RCMGqllFnkv+Je+UgF958GnFnnA3XDxps7WxstaZAW6
	R0a4r62csfxrf5iCd/a4hCJdIZ6E5AjKx0xjEFD2O8hENksOGw0od8I2ElwV8MhVLS
	8ki5ViW3mtY9MMQwuOiau9z0UVqaJT+K9S/Y9yczEAYSbp5N7E/0G+ukMUzGC/C5kb
	QN30R9mSFAOwi5kuHrqprV3N6sn30StaHUnD7rc5V2cg4bniDNfjGUXKEAgvpMZcOa
	DonJ2mOSljvYcgQi1XfU+5wR/izzfNQlIOWc87kZlvUQrGWDEGrsi22/aI1xAtee1w
	NW6v9FJLASUjxedi/lF/KVI0=
Date: Tue, 2 Jul 2019 16:26:40 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20190702132640.GA11644@localhost>
References: <ba3936e9-0582-4187-89d7-0a8f1dd4c550@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ba3936e9-0582-4187-89d7-0a8f1dd4c550@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: The state of reproducible Builds
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
X-List-Received-Date: Tue, 02 Jul 2019 13:26:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jul 01, 2019 at 10:58:04AM -0500, Joshua Watt wrote:
>...
> 1. HOSTTOOLS differences. There are a lot of tools listed in HOSTTOOLS, and
> unfortunately some of them have version dependent output and are used for
> target builds (the one I've currently stumbled upon is pod2man, but I'm sure
> there are others). Unfortunately, one could probably argue that HOSTTOOLS is
> somewhat antithetical to the above statement, at least in regard to target
> builds. Any host tool output that "leaks" into the target build output can
> result in a non-reproducible build across hosts, and possibly should be
> avoided; the alternative is to use (or mandate) the corresponding -native
> recipe that provides that tool as a DEPENDS so that the controlled
> internally built version is used instead. Note that this only really applies
> target builds, not -native (or nativesdk right now). -native recipes would
> obviously need more HOSTTOOLS to help bootstrap the system. I suspect this
> would require reworking how HOSTOOLS works so that they can be split into
> two categories somehow; the tools that have "ubiquitous and stable"
> interfaces and are fine for all recipes (e.g. cat, sed, true, rm, etc.) and
> those that are variable and should only be used for -native builds (e.g.
> pod2man, rpcgen(?), chrpath(?), tar(?)... others?). Anyone have thoughts on
> this?
>...

What is the goal?

1. being able to prove that a given binary has actually been 
   built from the correct sources, or
2. builds on all hosts have the same output

With 1. you can just record all host properties like installed packages
and running kernel, and it isn't a problem if different hosts result in
different output.

With 2. any kind of differences due to host differences is a problem.
You need -native for nearly everything, and then fix all other kinds of 
differences like the version of the running kernel recorded somewhere.

For detecting malicous binaries not built from the claimed sources 1. is 
sufficient. For distributions like Debian that build natively this is 
even the only option available since the host compiler is used.

Doing 2. would of course be more desirable, but it can also be done in 
a second step after all issues related to building on exactly the same
host have been sorted out.

> Joshua Watt
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


