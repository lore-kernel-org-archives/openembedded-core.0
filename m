Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 985977D0FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 10:42:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44T74751zDz2Q;
	Tue, 26 Mar 2019 11:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553596936;
	bh=srW7gfoyEpURYfO3t36B7tDEPbQTuYIBQtZxP/tqQLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gewldcfsRswZl2P3A9E6dr3QrTJB2E/q7cJ9xejwuMjvxjZcMBD3sNDa9Bstcmarc
	/rIw/e3NWWJK9+fAiJDvZmFbAwdXn5hIPw+LlEBBcSQqWyJAZ2X9b11OrCg1BDu/L6
	WnK66S43ruTcQvEXW4durGMWciOiyNFI7Tuo2txIaEMLIdrhQ785JFoLlYdyxsoIgV
	WJrqfSC0gNIm8vdXrIX3XHT/cxUmr0YYZeB4neK5u4VexKd+GcmIZf/P4dMiepJ6Aa
	ecyemo8CcFvzyep2foN/TB1za/Cdw7M4FfDfprzeh8g3y7hzbjUr1rqw7ulv2Ao4ZK
	ty8y0qBWPTDZB0SlYuNLGw7VlAifPChE9uD55efvkgngKAJTNvvuon5dQQd/aEwEqV
	irorC869/vH/l0Dc7qmRjnyaSvszzxPkBnXPSVQMq7vu5pgzc3G6z9H9DBkt43eAzv
	nszrPlJokvhq2yVYd9E1EQWHh529WpFLX/QM58bYs45m72f0BClt0WcxzYKx/Zl0ag
	/5ie4gNgPU4k5XxHrN52sMm1BwSLUL8KqickdI38w1tlXFk2dg0KmSKFXLfNtfLEKe
	LxL4NjNa2eQEOc6C60yU9br5wJaKv1W75p7NrIhqqiM2LSCUL/9F2URpAmZY1l1sUa
	MnnMwYUHH6JavRI4rBpAxbwc=
Date: Tue, 26 Mar 2019 12:42:12 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190326104212.GB19885@localhost>
References: <20190325234413.12652-1-ross.burton@intel.com>
	<CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
	<CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
	<20190326102017.GA1929@jama>
MIME-Version: 1.0
In-Reply-To: <20190326102017.GA1929@jama>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Tue, 26 Mar 2019 10:42:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 26, 2019 at 11:20:17AM +0100, Martin Jansa wrote:
> On Tue, Mar 26, 2019 at 10:00:52AM +0000, Burton, Ross wrote:
> > On Tue, 26 Mar 2019 at 01:39, Khem Raj <raj.khem@gmail.com> wrote:
> > > > This isn't a git snapshot recipe but a release that is fetched over it.  For
> > > > clarity, put the PV in the filename.
> > >
> > > I think its better to keep it as it is. since its easy to trace git log history.
> > 
> > So should I be renaming gcc-8.3.bb to gcc_http.bb?  If the argument is
> > that the filename should contain the transport protocol and PV is
> > embedded in the recipe so that git log is easier, we should be
> > applying that rule consistently.
> 
> FWIW: I agree with Khem.
> 
> http fetcher won't (usually) fetch different version just by changing 1
> variable inside the recipe and vice versa, renaming the recipe won't
> fetch different SRCREV with git.

Why should the name of the recipe depend on whatever fetcher is 
currently used?

If the same gcc release would be fetched from the upstream SVN,
would you argue that the recipe has to be renamed to gcc_svn.bb?

> If someone wants to update SRCREV in libcoms to be 10 commits behind
> 0.1.10, is he expected to rename the recipe back to libcomps_git.bb and
> re-add the PV variable (with new +git${SRCPV} suffix)?
> 
> I got used to "+git${SRCPV}" being dropped when the SRCREV matches
> exactly the git tag, but renaming the recipe and removing the PV seems
> too much, what is the benefit of doing that?

Is it actually a benefit to make it easy to switch from a release to 
some random git snapshot?

This is not something that should happen frequently.

> It's not for clarity or
> easier maintenance (at least for me), because PV next to SRCREV makes
> much more sense to me (and helps people not to forget updating both at
> the same time).

There are not only developers, but also users.

It is valuable to see from the filename whether it is a release
(and which release it is) or some VCS snapshot.

Not having the release there also loses the ability to use either
gcc_%.bbappend or gcc_8.3.0.bbappend, which are suitable for
different situations.

> Regards,

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


