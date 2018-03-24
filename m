Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 33D0E719A4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 01:17:52 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 525012E892F;
	Fri, 23 Mar 2018 20:17:53 -0500 (CDT)
Date: Fri, 23 Mar 2018 20:17:51 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180323201751.31380cef@seebsdell>
In-Reply-To: <CAJ86T=WYEJ_=TW-kSJbZVY42nvdJwcXStn6NYbP1HqwDw9x6mA@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Mar 2018 01:17:52 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Mar 2018 18:10:21 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> The syscall wrapper in musl handles 6 additional arguments -
> unconditionally. Based on that you might not need to interpret
> anything - just extract 6 arguments and pass them on?
> 
> long syscall(long n, ...)
> {
>     va_list ap;
>     syscall_arg_t a,b,c,d,e,f;
>     va_start(ap, n);
>     a=va_arg(ap, syscall_arg_t);
>     b=va_arg(ap, syscall_arg_t);
>     c=va_arg(ap, syscall_arg_t);
>     d=va_arg(ap, syscall_arg_t);
>     e=va_arg(ap, syscall_arg_t);
>     f=va_arg(ap, syscall_arg_t);
>     va_end(ap);
>     return __syscall_ret(__syscall(n,a,b,c,d,e,f));
> }

That is the sort of thing which *might* work, but which is potentially
subject to arch-specific calling conventions or strangeness.

It's worth a try, I guess? But I also think it may be worth just having
all the people maintaining stuff that expects this go yell at coreutils
about bad implementation choices, like "bypass libc to make raw
syscalls when you are not, in fact, implementing libc".

-s

