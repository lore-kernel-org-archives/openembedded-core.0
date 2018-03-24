Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 61BC778803
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 19:50:44 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 38FE72E8938;
	Sat, 24 Mar 2018 14:50:46 -0500 (CDT)
Date: Sat, 24 Mar 2018 14:50:44 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180324145044.168f7e3f@seebsdell>
In-Reply-To: <CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
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
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Mar 2018 19:50:45 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Mar 2018 12:42:45 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> Right. The musl example is to show how it's possible to transparently
> intercept and pass on any call to the syscall() ABI without
> interpreting anything.

Yes, if you don't need to interpret things, and aren't making
additional other unrelated system calls after doing so.

> Those details are all taken care of within the libc implementation of
> syscall(). It's not something we need to care about at all in a
> wrapper for it.

I don't think that's correct.

musl's call sequence:
	real_syscall() // sets a3
	return

pseudo's call sequence:
	various_setup()
	real_syscall() // sets a3
	other system calls // also set a3
	return

In the case where pseudo is actually *disabled*, we just return
right away after the real call. In every other case, we're making
other calls some of which imply system calls, and those system calls
could potentially overwrite things that the libc implementation of
syscall took care of. (Mutex and signal mask operations.)

So for that to work, I would in principle have to stash the value
stored in, for instance, "a3", wait until after the other system calls,
and then restore it. Unless *only* syscall() itself actually sets
that register, and other system calls don't, and nothing else is
using it either.

-s

