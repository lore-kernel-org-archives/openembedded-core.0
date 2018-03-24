Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 182E565C8F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 17:23:58 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 353AD2E8922;
	Sat, 24 Mar 2018 12:23:59 -0500 (CDT)
Date: Sat, 24 Mar 2018 12:23:57 -0500
From: Seebs <seebs@seebs.net>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180324122357.668e6afc@seebsdell>
In-Reply-To: <CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Mar 2018 17:23:59 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Mar 2018 17:10:47 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 24 March 2018 at 12:36, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I think, at least in principle, pseudo could wrap that and intercept
> > this particular syscall, check syscall_number (the numbering having
> > its own set of issues) and then only handle the specific problem
> > case we have.
> 
> And to make things easier I think we could even just ENOTSUPP
> renameat2 in the short term (i.e. for 2.5), before looking at a more
> comprehensive intercepting
> which could solve the Go issue.

In the Go case, we would basically have to do something more like
debugger traps. They're not using libc *at all*, and unless something's
built with cgo or requires C-type libraries, it's not even going to be
dynamically linked. No dynamic linker => LD_PRELOAD is irrelevant.

> I filed a bug with coreutils yesterday.  "Just intercept syscall()"
> they said.

If they can describe a mechanism for intercepting syscall that they can
guarantee will work across all Linux architectures including possible
future architectures not yet in use, I'd love to know what it is.

See syscall(2) for some examples of the kinds of things that could be
concerns, such as the EABI calling convention. We can sort of hope for
the best if we just treat everything as a chain of unsigned longs, but
that's really *not* safe, and it should not be expected to work
reliably across architectures.

Honestly, reading it more closely, I don't think we can actually
produce behavior that precisely mimics the behavior of syscall() for
generic cases on architectures we currently run on. There's magic like
setting values in other registers, clobbering registers, and so on,
because *this function does not obey general architecture calling
conventions*. And if the wrapper does, the wrapper will break at least
some of the expected behaviors, by not behaving the same way.

Basically: I don't think we can promise that we will correctly pass
through both parameters to syscall() and returns from it in on existing
architectures we're actually running on today, for the whole set of
possible syscalls. So if we intercept syscall(), at least some
previously-valid programs break.

-s

