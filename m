Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4E45E7D1E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 10:18:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46cxwd6P4Hz4s;
	Tue, 24 Sep 2019 12:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569320307;
	bh=vtbzy7+T2SKhKZ2mOO6tu7hhzs8JjvgcgHH43qqJIeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8xDaNOSU/GD8mVGmjgZ7pFscvAyL2r6g3m/k7eVgu7CybHnM6lZnR3cVJCDVvhI4
	ajp30sn/6ekfpCG7IyMmDGWJ76xOWJrn4AOkQd6lmtKFHoddMOg9Yc358bK+80VgMJ
	tXvjQ63fgPNKDHag57fA8Xw1wFzDR9e8xUk5ZkTx2ZZx4MT6RZVLIEf2JZANgUy65k
	uul/AbNcPDeP5GJ7DJ9Tp4QcEQ7hcz6O77ukT1T9YM/8OAegKf/Z/iCRyViMdKMsLV
	pqi2BW4NkPS+ACsJ6zU87aPacAP71jVhdnGFTVzUErYCKZmOuXZ7oblqRn500yQOnu
	/y6Ngadr62owGAM+9EE7v3Y7reM6RMmcNj51xZYo3c2pHL/f2xE4LvQ1lLZvPQXbwD
	POXCp3F9SZI4NZg6Uj3IlcHE2dpwTMCgHXn5d/tWE5MWacne7i+IhJ141dcM1+BFVm
	goYLUZK5ERBm+dnwnshnO6+/4I4vU61NgyyCoRBjclzmMQExAbYtwXjA3+JkeNlvy+
	UlPEgZ5zzlcPzcF+1HuMNH0AGUQIy5FqmWaGxwMfBd9YyVvL0Dk5r0PNwWdNmWbuKo
	U2hQ9g5E08h8Wcem1DeDjE9Efe3bDxvGvqI52QtTcDRmxo2LHlHXQndPLBfQoP0PRu
	T87WkPSA/wQPX261hh9F+99o=
Date: Tue, 24 Sep 2019 13:18:23 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Message-ID: <20190924101823.GC16793@localhost>
References: <20190924024508.9175-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190924024508.9175-1-Randy.MacLeod@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: stevenrwalter@gmail.com, cardoe@cardoe.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/3] Move rust from meta-rust to oe-core
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
X-List-Received-Date: Tue, 24 Sep 2019 10:18:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Sep 23, 2019 at 10:45:05PM -0400, Randy MacLeod wrote:
> I moved the Rust support from meta-rust to oe-core.
> 
> As you'd expect, it's still building rust-hello-world for all qemus 
> (except riscv64 which may never have worked). 
> Rust-hello-world runs for me on qemu:
>    x86-64, arm, arm64
> It may run on other machines but that's what I've tested so far.
> 
> We need a list of meta-rust issues that should be resolved 
> in order to get the code accepted in oe-core. I opened an issue 
> to track that:
>    https://github.com/meta-rust/meta-rust/issues/251
> but there haven't been any comments yet. I'd rather track
> issues in github than in the YP Bugzilla:
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=12675
> 
> Here, in no particular order, are some of
> the defects that I believe need to be fixed:
> 
> 1. build system is assumed to be linux-x86_64
>    https://github.com/meta-rust/meta-rust/issues/23
> 
> 2. Make rust-native build in parallel (it's very slow!)
>    (meta-rust issue/PR to be created by Randy)
> 
> 3. Document developer workflows such as cargo-bitbake.

Is there consensus on how libraries should be handled in general for 
various ecosystems?

Precedent with C, Python and Perl are recipes for each library,
but vendoring seems to be a popular option now.

There are also related topics like how to provide security support
for vendored libraries - this is the main reason why vendored libraries
shipped by upstream are rarely used by distributions in the C ecosystem.

> 4. Build offline ( BB_NO_NETWORK = '1' )
> 
> 5. make rust-hello-world install for qemuriscv64
>    https://github.com/meta-rust/meta-rust/issues/252

LLVM in meta-rust is too old for RISC-V.

Using an own LLVM recipe might makes sense for an external layer, but in 
oe-core the llvm recipe that is already there should be used instead of 
another copy of LLVM.

> 6. ... build rustc and cargo for target (nice to have, only).
>    https://github.com/meta-rust/meta-rust/issues/81
> 
> 7. Bootstrap from C as an option?
>    See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12675#c2
> 
> 8. Update librsvg to latest (2.46) which uses rust.

2.44 built for me a few months ago with meta-rust.

> What have I missed?
>...

9. Ensure that there are no non-optional dependencies on the target
   librsvg since users will build for targets not supported by Rust.
   The one in webkitgtk seems to be optional or obsolete.

10. Review the whole contents of the layer.
    There are several things where I hope there are better solutions,
    and I expect that what will land in oe-core will look quite 
    different from the current meta-rust.
    See item 5 above for an example.

> ../Randy
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


