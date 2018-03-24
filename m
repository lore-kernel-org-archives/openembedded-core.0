Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id BDC7D78596
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 18:22:50 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 8B5FF2E892F;
	Sat, 24 Mar 2018 13:22:51 -0500 (CDT)
Date: Sat, 24 Mar 2018 13:22:46 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180324132246.28c2f8cd@seebsdell>
In-Reply-To: <CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Mar 2018 18:22:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Mar 2018 11:12:20 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> If you can successfully intercept the libc syscall() API and return
> ENOTSUPP for the one specific case of renameat2 but pass on all other
> callers transparently then haven't you've already solved the bulk of
> the problem (for the non-Go case)?

> Or are you suggesting unconditionally returning ENOTSUPP for every
> syscall called via the libc syscall() API?

I have no idea what happens if we try to ENOTSUPP things. I would be
wary of it.

> It's basically exactly what the musl syscall() wrapper does. ie fetch
> 6 register sized vaargs values from the caller and pass them on in the
> same order to the next syscall().

Yes. That might well work in most cases?

> None of that matters if you don't need to interpret the arguments -
> you just need to pass them on in the same order you received them.

That is not necessarily true in every ABI.

But I'm more concerned about the comments about *returns* and special
register usage.
 
> I don't see any evidence to support all this doom and gloom, but if
> there is a corner case which fails then it will also fail when running
> on musl - so at least you won't be debugging it on your own :-)

Possibly? I've never encountered musl, and don't know how broad their
coverage is.

But I'm put in mind of a quote from some years back:

"This guy I know says you can't just carry the ball in basketball, but
I got a basketball and tried it, and it worked fine."

I'm not saying this will necessarily fail immediately. I'm saying
there's nothing even *like* a guarantee that it will work, or that it
will keep working. And I am concerned about the fairly unbounded
possible risk cases.

Every other function we wrap *has* a meaningful prototype, with
arguments in a knowable order. But look at the EABI example; if we want
to actually *process* renameat2(), it's not enough to pass arguments on
blindly, we have to be sure we know exactly which arguments are which.
If the pointers can be 64-bit pointers, though, that may mean that
we have to expect the incoming arguments to be (olddirfd, 0, oldpathhi,
oldpathlo, newdirfd, 0, newpathhi, newpathlo, flags), but only on some
architectures, where others would use (olddirfd, oldpath, newdirfd,
newpath, flags).

Do we have any 64-bit pointer EABI? Heck if I know, I don't track that,
because this is the only time I can think of where I'd have had to.

> Since the libc syscall() API is only going to be used for syscalls
> which don't have an libc wrapper,

I'm not sure I'd bet on that. If it exists, people will sometimes use
it, and sometimes use it poorly.

-s

