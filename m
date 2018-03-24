Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 3A759605C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 02:44:45 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id E0DF72E8922;
	Fri, 23 Mar 2018 21:44:46 -0500 (CDT)
Date: Fri, 23 Mar 2018 21:44:42 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180323214442.2d13c6a4@seebsdell>
In-Reply-To: <CAJ86T=UhWm86-1KU5PWXqTOjZzHZWxOV+BVWZmp9S1o0MWQ3og@mail.gmail.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<CAJ86T=W63x0epGUXyORsaXG-KEV41fcF5xaECaEXPG6zhyox_A@mail.gmail.com>
	<20180323193625.594f2093@seebsdell>
	<CAJ86T=WYEJ_=TW-kSJbZVY42nvdJwcXStn6NYbP1HqwDw9x6mA@mail.gmail.com>
	<20180323201751.31380cef@seebsdell>
	<CAJ86T=UhWm86-1KU5PWXqTOjZzHZWxOV+BVWZmp9S1o0MWQ3og@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Mar 2018 02:44:49 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Mar 2018 18:43:12 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> Since glibc doesn't provide a wrapper for renameat2, making the
> syscall via the libc syscall() API is exactly what coreutils (actually
> gnulib) should be doing. There would certainly be grounds to complain
> if user space code were making a syscall directly, but that's not
> what's happening here - the syscall is still being made from within
> libc.

Ahh, okay, that clears it up some.

I thought coreutils was making a direct invocation of a syscall rather
than using the generic syscall wrapper. I guess my thought is that if
glibc isn't providing a wrapper for a syscall, it's probably best to
avoid that syscall unless it's impossible to run without it. And since I
*think* someone may have implemented mv(1) in the past without
renameat2(), it seems to me that switching it to use a new syscall that
libc doesn't have a wrapper for yet is perhaps premature.

There's been a lot of issues we've run into that were caused by
coreutils or something near it being very excited about switching to a
new, and preferably larger and more complicated, API. Usually to do
something that was already being done successfully and without problems;
for instance, the use of posix ACL xattrs to encode standard permission
bits even when no other ACL functionality is in use. I am not positively
impressed by this; if what you're doing can be done entirely with a
stable interface that hasn't changed in the last decade or two,
switching to a newer interface seems sort of counterproductive.

I have some concerns about the API for syscall(), and there's a lot of
behavior here that's potentially more-undefined-than-usual; for
instance, using va_arg to get more arguments than were actually passed.
But it may be we don't really have a way around it.

-s

