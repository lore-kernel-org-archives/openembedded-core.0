Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id A3A2C7858E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 19:24:32 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 53FF82E892B;
	Sat, 24 Mar 2018 14:24:32 -0500 (CDT)
Date: Sat, 24 Mar 2018 14:24:27 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180324142427.53da953d@seebsdell>
In-Reply-To: <CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Sat, 24 Mar 2018 19:24:32 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Mar 2018 11:59:27 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> The EABI example applies to 64bit values on 32bit architectures. Since
> pointers are 32bit values on 32bit architectures the example doesn't
> apply to renameat2 (which only passes int's and pointers - nothing
> which would be a 64bit value on a 32bit architecture). ie there is
> never any "oldpathhi, oldpathlo", only "oldpath", etc.

I didn't see a qualifier about it being only on a 32-bit architecture,
it just says "EABI".

But in general, this is the reason that musl's ability to work doesn't
buy us guarantees; musl doesn't have to *interpret* the arguments. So
for instance, they could just pass "the same arguments" for
SYS_readahead, we couldn't. (If we needed it, which I don't think we
do.)

Similarly, they don't have to do Fancy Complicated Fixups around their
system calls which can break weird register conventions. Consider:

> >        On a few architectures, a register is used to indicate
> > simple boolean failure of the system call:  ia64
> > uses r10 for this purpose, and mips uses a3.

I have no evidence that these registers are being reliably saved
through all the *other* code pseudo has in and around wrapper
functions. By the time we get into wrap_foo(), we've already done a ton
of other things, including made system calls, and we make *more* system
calls on the way back out.

So to handle that reliably, we'd need an extra special fancy wrapper
function which bypasses everything for all the non-renameat2 cases,
and even then, what would we do for renameat2? I can't write C code
which stashes r10-on-ia64-or-a3-on-mips on its way out of the wrapper,
then restores them after everything else is done.

I can try writing the code, and it might well work, but I want to make
it clear that this is a case where there's no guarantees at *all* that
any code that can be written in remotely-sane C without assembly can
actually do the thing correctly. The musl code is not trying to deal
with a case where there's multiple other syscalls after the real
syscall has been called, but before returning.

This is not "we definitely can't", this is warning that there's reason
to think it may not work, or may require a great deal more magic than
anything else does.

> If there _were_ some architecture dependent ordering of the renameat2
> arguments passed into the syscall() ABI then it would have to be
> reflected in the code which originally calls syscall(), e.g. the code
> in gnulib.

Yeah. But about all my crystal ball will tell me about possible future
changes or syscalls or ABI choices is that there might be some.

-s

