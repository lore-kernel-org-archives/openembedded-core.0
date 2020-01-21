Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C2F2A7FDC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:32:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 482DZy3KhCz29;
	Tue, 21 Jan 2020 17:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579624331;
	bh=d3hDcv3jPRn/cifpxqqN/4AJLlLp1kEWliTuT5nT6LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b45E26OKkgz/UhT6iqyrC8gVbhcvyLz4NUBXLp/5tl/JQrH02BMmrNN23emivTQQB
	Uwjh0a3zUt5r7ksjbFAdNfUueDcpMsFWt5oHCSYrvnapHrY8+RMyja2bVzvvmWozkL
	JGiisnxGpJkiIlqplgTa8xXG/S954EkCSgS8vgFR9Pgzp/yF/b1h4i8f3rfRP9jl9B
	E/4SMRKa1AWULyLE4D/5H6iDNk77kB+xN6hn5Ce/YYhNinmRo4+Qx/HNDpECvjumWp
	MUmQQAMjFhtSSnGGM7JvC0CnQkxhLOMU78dbul1apYOtf72tY6Oc0NPM0U7Tbrd0z5
	5nLnXvLFPubkmj0Snj+H+uXuc50fdPJalLGmzkw9vwJmRDWeS7ZaLFNJHDgDk6Lxza
	my4QBW0Rg1O5qxb/SCcaNF+JvShoF1cOOkzw6XKKgkMzYEzAHNnkU0IrUe23KTk4wh
	VSbXfJNQmwI6FRdBp6dRfb0S4Il1zx74smyverrcD3zx/BPRyR65lc4SEaPypJCyCA
	KtOsYpb9EucY4A1e+vWYQuO5sDwIQOy2+xya/MMbznj74JQDVKw0az6RCxzr48khK0
	7ygl/pdP0a4wZambSPmksTEWd0+NbzmMoNhOWiheXIVJeu7Baddo8Gp4yrRC3repNU
	jzT/Q12gy7nLYJt8Ma6/iZ3w=
Date: Tue, 21 Jan 2020 18:32:08 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200121163208.GA2836@localhost>
References: <20200116044609.3902260-1-raj.khem@gmail.com>
	<20200116131330.GA2546@localhost>
	<CAMKF1spz1u9sPwQK2wyyQBUeLJ611XXYwUWHUfK6TZXcFNXJ=Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spz1u9sPwQK2wyyQBUeLJ611XXYwUWHUfK6TZXcFNXJ=Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gettext: Fix overloadable error with clang
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
X-List-Received-Date: Tue, 21 Jan 2020 16:32:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 16, 2020 at 07:17:20AM -0800, Khem Raj wrote:
> On Thu, Jan 16, 2020 at 5:13 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Wed, Jan 15, 2020 at 08:46:09PM -0800, Khem Raj wrote:
> > > Clang detects that getcwd is being re-declared and signatures don't
> > > match, simple solution is to let clang use overloadable attribute
> > >...
> > > +Fixes
> > > +dcigettext.c:147:7: error: redeclaration of 'getcwd' must have the 'overloadable' attribute
> > >...
> > > +-char *getcwd ();
> > >...
> >
> > Looks like a bug in clang to me, and should be fixed there.
> >
> > The code does not tell anything regarding the parameters,
> > but clang seems to misinterpret it as "no parameters".
> >
> its conflicting with declaration from glibc system headers
>...

Why did the glibc 2.31 upgrade add a not upstreamed patch from 2017 that 
created these conflicts?

The commit message does not mention that this patch was added,
and an OE-only patch that makes a compiler reject valid C code
is not good.

cu
Adrian

