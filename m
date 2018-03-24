Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 1963878757
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 21:01:03 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 12CEE2E892F;
	Sat, 24 Mar 2018 16:01:04 -0500 (CDT)
Date: Sat, 24 Mar 2018 16:01:00 -0500
From: Seebs <seebs@seebs.net>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20180324160100.6906ac9c@seebsdell>
In-Reply-To: <CAJdd5Gb0VWNqUN0ci-4-w6KJ6j4E5fLvNk0Tshp_pDeKXvJ7Og@mail.gmail.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<CAJdd5Gb0VWNqUN0ci-4-w6KJ6j4E5fLvNk0Tshp_pDeKXvJ7Og@mail.gmail.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sat, 24 Mar 2018 21:01:04 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Mar 2018 15:22:47 -0500
Joshua Watt <jpewhacker@gmail.com> wrote:

> I don't think that is true. libc's syscall() must conform to the *C*
> ABI for the system... if the kernel does things that aren't in line
> with the C ABI (like return things in registers that aren't expected,
> fail to preserve registers that require preservation, or whatever),
> wouldn't the libc syscall() be *required* to paper over it so that it
> looks like a valid C call? Otherwise, it could never be safely called
> from C code.

I think this is only partially true. There's extra warnings in
syscall(2) about weird kinds of non-conformance with the usual ABI,
like the magic for 64-bit values on EABI (or possibly 32-bit EABI), and
I think the point about the extra registers or possible
register-smashing is just "at this point, you get the behavior of the
actual syscall, which may violate the ABI."

And yeah, it returns correctly, but if code's written to interact with
what syscall() is *supposed* to do, and we trample that in some way,
that's potentially bad.

I honestly have no idea how much scope there is for weird problems,
or whether I'm reading too much into the man page. But there's comments
in the man page that seem like very things to say if libc's syscall
really is just hiding all this complexity. Why on earth would the man
page need to mention those things? What is their relevance, if the
implementation covers all of that?

Practical answer: I'm probably going to attempt the thing, with
the first pass being (1) implement a wrapper for renameat2(), (2)
implement a wrapper for syscall, (3) try to change syscall's behavior
only in the case where the call is renameat2, (4) make this available
and let people try it on a variety of architectures and hope for the
best.

-s

