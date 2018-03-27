Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 5012C71B32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 20:20:26 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 158832E892B;
	Tue, 27 Mar 2018 15:20:28 -0500 (CDT)
Date: Tue, 27 Mar 2018 15:20:26 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180327152026.335b4c2d@seebsdell>
In-Reply-To: <CAJ86T=V=b2jsSuVEicQbbgrax+8iV7HV0B=cKWDaejLq-Dh2eQ@mail.gmail.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<20180326160746.1dce7ae9@seebsdell>
	<CAJ86T=VaJyJYbBTkjR1yUTSJPCFSjgZCZZkYbyGEaTWYCg+u7A@mail.gmail.com>
	<20180326203209.2da967eb@seebsdell>
	<CAJ86T=VqLZrmyLBYD4ovQc9eNJQx5Rqp8YK+=3hPHgmjqqa55w@mail.gmail.com>
	<20180326210734.165ac038@seebsdell>
	<CAJ86T=X8bq6MKdvnq7sPFzjKN3ZgEJL70xHGCgSNBuC7ppi51w@mail.gmail.com>
	<20180326234108.4b52c066@seebsdell>
	<CAJ86T=VtdUAahO+PE2w8BzuPHAJCM1PEyWaYwg4SSGHU6jtm=A@mail.gmail.com>
	<20180327142230.15f1abf9@seebsdell>
	<CAJ86T=V=b2jsSuVEicQbbgrax+8iV7HV0B=cKWDaejLq-Dh2eQ@mail.gmail.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 27 Mar 2018 20:20:27 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Mar 2018 13:12:19 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> If you mean forwarding arguments through a wrapper without
> interpreting them then I don't know what your concern is. Forwarding
> arguments can be handled completely generically - for any architecture
> and any syscall. See the musl implementation.

My concern is that, strictly speaking, this is nearly all undefined
behavior, and that reading more arguments than you were passed *does*
explode on some C implementations. Possibly none of the ones musl is
targeting.

I'm trying to minimize assumptions that *could in principle* affect
portability, such as "it's safe to grab an arbitrary pool of arguments
with va_arg", or "it's safe to grab arguments with va_arg using
different parameter types than were used to store them". Because
assumptions like those periodically break when, for some inexplicable
reason, someone ports to an architecture that isn't a VAX 11/780.

We're already stuck with "duplicating library functions" as a risk.
But so far, I don't think I have any code which is manipulating
arguments in a way that violates the spec. Adding such code creates
an additional risk, however small that risk may be in practice right
now.

> However the good news is that code in a syscall() wrapper doesn't need
> to be any *more* aware of argument ordering than the C code calling
> syscall(). In this particular case, if the code in gnulib calling
> syscall(SYS_renameat2, ...) doesn't do anything architecture specific
> then either it's not needed (and therefore also not needed in a
> syscall() wrapper which wants interpret renameat2 syscalls) or there's
> a portability bug in gnulib. ie there is no case where architecture
> specific awareness is required in a syscall() wrapper but not in the
> original C code which calls syscall().

Yes.

Right now, I think my inclination is to make a renameat2() wrapper
which fails. We did that for renameat() originally, and it was years
before it actually came up, and I think it's premature to attempt the
wrapper at a time when I *can't* write test code which compares it to
the behavior of libc.

-s

