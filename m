Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4FCD07FC81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 19:56:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Mvmf6Wpqz4Y;
	Tue, 26 Nov 2019 20:56:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574798195;
	bh=2fup/pOpfbbHbcRN//uofdY1WQEs3GTBNxuCmZpihY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7qEOySXHh1uXkWehIMWK6F/ujZo9RKxRZPV05GiFU9vwZlja4xaHiygE6vgav5RE
	q0Ay2mPt1C40fx5CaLbbISqOmY9vRF47Cug+FQ7lNtt1WP2x2Xv764U7zgaSaejLMv
	iNsnlKawMD6sX+0o251zaXPcYfMc/pIDzo0nzojCfhxHuPE6O3q0hk61GBVGjXYIx2
	6f4f7/mxCmu2WMc95Sq43L1hOmh+7TEXfbqc4zZQlERXw1JM51igKNqt485sP+5bSv
	x3+uKHws5ToZ9zu2yVdWrmFGDybc/RnD6Bk+ROk5p11dUWWwgBh72MQ9XHqwggI+cY
	Z6cqv7cmm+I3kHE0SmqtLlzniE5vxFsvctAyW0HjppNNZmppb6Ojx46CscJVySLkb0
	BydzYGzhtJR4HCAZEPxSlI7l6iFc+k4IPVE3i1SovCc2ZDBFkSjXNdcTlPYiA9h+u5
	YuLMQwxfZnK8MkCsiaDZgoog8fSGR2d7v/FmprqEr/xuE1M1UlO8rbbG0fs1ur6abo
	sCjFx2cOlP+LOLcW8juG+1bjYhupgNSGt0M8GRE7txYn+3CGQKRYwIKYQ9//ZW6upu
	OPTyEMCzEztWZZNhayp+CmdRDFMI1ldcLfUZJKGJ003Yg+yWcvU+R5zoapuco19RCK
	cmpJWr6DH4+enfhCltK//PlY=
Date: Tue, 26 Nov 2019 21:56:32 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191126195632.GA27863@localhost>
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<20191125211027.GA32080@localhost>
	<0c6015a022140c820803a3963ef33af984f19c8c.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0c6015a022140c820803a3963ef33af984f19c8c.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Tue, 26 Nov 2019 19:56:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 26, 2019 at 10:17:09AM -0800, Khem Raj wrote:
> On Mon, 2019-11-25 at 23:10 +0200, Adrian Bunk wrote:
> > On Mon, Nov 25, 2019 at 07:26:58PM +0000, Ross Burton wrote:
> > > On 25/11/2019 18:37, Ankur Tyagi wrote:
> > > > Hi,
> > > > 
> > > > Based upon "thud" branch, I created core-image-minimal for
> > > > am335x-evm
> > > > board and resulting image size is very big(71M)
> > > 
> > > If disk size is important then a good first step is to use musl
> > > instead of
> > > glibc:
> > > 
> > > TCLIBC = "musl"
> > > ...
> > 
> > musl is mainly useful for tiny systems, a 40 MB partition is such a
> > huge
> > amount of space that the size of the C library no longer matters
> > much.
> > 
> > The size benefit of replacing glibc with musl is around 2 MB.
> 
> I would refrain from labeling as useful for tiny systems. since
> static size is one thing, there is DRAM behaviour which is equally
> important, how malloc and other resource oriented algorithms behave is
> important as well.

It is not a clear picture once you ignore "glibc is old and bloated" 
claims, and I am not aware of any reliable objective general overview in 
which cases which C library (or a 3rd party memory allocator) is better.

> secondly, if I have 40MB partition, one might rather want to use extra
> space for implementing features in their product than spend it for
> enabling the system if they can.

If it ain't broken don't fix it.

For the case in question there was already the point that two copies
of libstdc++ were installed, which is a size penalty on the order of 
magnitude of the glibc/musl difference.

And for such huge partitions -Os should bring more benefits than musl,
so that's a more reasonable first choice for size optimization.

> there are many other design considerations where musl might make more
> sense

Which of these are not covered by linking only your application
with musl?

It is not clear that all this outweights the constant pains of forcing 
people to fix the steady stream of new musl issues for all recipes.

> > A partition with an -Os build of Yocto with glibc+systemd (sic)
> > is around 9 MB, together with bootloader and kernel this all
> > fits in a 16 MB flash. Use compression for kernel and root
> > filesystem and everything fits in a 8 MB flash.
> 
> -Os is not as well tested option as -O2 is. So we should always
> recommend it with grain of salt, speaking from experience there are
> bugs that will show up with Os which you wont see with O2 and leave a
> bad taste for user

Where is the grain of salt when recommending musl?

I would consider -Os less risky than musl, especially considering some
of the OE-only patching for software noone else tries to use with musl.
But neither is a huge risk as long as you stay away from known-broken 
musl cases like systemd or elfutils.

On a more general note it is weird how much effort is spent on getting 
things to work with musl, but noone seems to care that this builds and 
works with -Os.

The combinations that are most relevant in practice are:
- normal: -O2 + glibc + systemd
- tiny: -Os + musl + busybox init

Using musl with -O2 or with systemd is far from the primary usecase
of using musl for size benefits.

The other advantage of -Os is that it is also useful for non-tiny 
systems since the benefits scale with the size of the filesystem.
It is a nice knob to fix kernel or userspace space problems that
does not change the API or ABI.

cu
Adrian

