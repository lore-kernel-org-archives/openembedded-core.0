Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 32DE77FD69
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2020 02:58:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 484LLJ4kWvz2J;
	Sat, 25 Jan 2020 03:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579921113;
	bh=9Lzh6m1+Th9bzAJvCvWO+CNjqXm21r1942FtU8lB5io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOr+4bu3UHXnqQ0+ThI0shKBYRDPQkYyX1IBohugMBXblIoLwSa+mp6hAgEVGiimf
	zRTNAaG/EXwjYykSUveEMKLLhcXpQWQGe0+gfs8TOS9P5hjrC/MRYGvlrWPaxrkWoe
	ilz7pEr9zfzhtavqqRoCpe8WMeUCCnvhuNeY5j7pgOE5oj01fz8i0wErIqZMpIh0Nr
	DKzcaqzbJ1+4diuwbu/LTKAO+w7zCmdfOtvUItbk8tBFB04zLww6fPWedQ7+ie1ZF/
	RhLVoKZqd8ICav1TpMEM7K3+18+9R9ceQW6TIm4hWrpl1QPu3cZrvjUBpnxBX9jF7A
	Ol4O6PTu0kRDoids+XAIR0N/xMXkmjD9AzP4JF4gU+vFrEstOTRfHGZcYUdxY3wDrw
	6N9FsZesV9mdFBFsdqNU2+brM2CMWorTU9QOnnDZV62TX9ZyU22jOR+e952YgFD2qO
	X7NFDt7Z9IxK/YJO8NTwFRui9e28xDhM0IUO+QxlGpL8lOnOOKqRe4WQyatQT3wuO8
	YnxvaIcOyPuHUyjyZNf/oSX7wjhNK0mNeLUEwhvqzx7S92qX3nVYk2UkJ96+/8jKkD
	uzQ0bWHz/S1yvGZUVQf/lUr3fakOhx4vdXC8BnnPBfiH9V37CPzeLLdYWCZ6+XWO2W
	YdY9enWB6zoFVIilBFloPy0c=
Date: Sat, 25 Jan 2020 04:58:25 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200125025825.GA23824@localhost>
References: <20200116044609.3902260-1-raj.khem@gmail.com>
	<20200116131330.GA2546@localhost>
	<CAMKF1spz1u9sPwQK2wyyQBUeLJ611XXYwUWHUfK6TZXcFNXJ=Q@mail.gmail.com>
	<20200121163208.GA2836@localhost>
	<CAMKF1squtHZJDkW9Of+bmBaDEP0tsa4E_qN85_00=icDnMyYaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1squtHZJDkW9Of+bmBaDEP0tsa4E_qN85_00=icDnMyYaA@mail.gmail.com>
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
X-List-Received-Date: Sat, 25 Jan 2020 02:58:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 22, 2020 at 12:28:02PM -0800, Khem Raj wrote:
> On Tue, Jan 21, 2020 at 8:32 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, Jan 16, 2020 at 07:17:20AM -0800, Khem Raj wrote:
> > > On Thu, Jan 16, 2020 at 5:13 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Wed, Jan 15, 2020 at 08:46:09PM -0800, Khem Raj wrote:
> > > > > Clang detects that getcwd is being re-declared and signatures don't
> > > > > match, simple solution is to let clang use overloadable attribute
> > > > >...
> > > > > +Fixes
> > > > > +dcigettext.c:147:7: error: redeclaration of 'getcwd' must have the 'overloadable' attribute
> > > > >...
> > > > > +-char *getcwd ();
> > > > >...
> > > >
> > > > Looks like a bug in clang to me, and should be fixed there.
> > > >
> > > > The code does not tell anything regarding the parameters,
> > > > but clang seems to misinterpret it as "no parameters".
> > > >
> > > its conflicting with declaration from glibc system headers
> > >...
> >
> > Why did the glibc 2.31 upgrade add a not upstreamed patch from 2017 that
> > created these conflicts?
> 
> This supports building userspace with clang better and find more
> errors when fortify sources option is on.

What "errors" are you referring to?
From a semantic point of view the code is correct.

This is a relict from K&R C that novice C programmers often misinterpret, 
but I'd say gcc made the right call by not including the warning for the
more general case in -Wall.

The cases with an actual problem are being caught by a different gcc 
warning that has been included in -Wall for decades.

> this patch was already proposed to glibc and I will follow up on it.

This is an area with different semantics in C and C++.
All your "fixes" indicate that the result is C++ semantics in C code.
Which is not something you can do in the public glibc headers.

> It definitely improves fortify when using clang

What is the point of all this when you "fix" the bogus error caused by 
this patch with a function attribute like in this case for gettext?

The gettext patch is simply wrong.

> > The commit message does not mention that this patch was added,
> > and an OE-only patch that makes a compiler reject valid C code
> > is not good.
>
> I think thats my bad as it slipped my mind with numerous rebases I did
> over the life of the glibc patchset.
>...

Was the glibc upgrade sent to the mailing list for review?

cu
Adrian

