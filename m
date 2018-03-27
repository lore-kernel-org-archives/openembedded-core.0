Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4BE62133
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 21:10:10 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 1A26D2E8928;
	Tue, 27 Mar 2018 16:10:12 -0500 (CDT)
Date: Tue, 27 Mar 2018 16:10:10 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180327161010.3e20edac@seebsdell>
In-Reply-To: <CAJ86T=VdHEb4cyB=oSTHytyGc9B0+wN39qOSHWuVR0g6dFTLUg@mail.gmail.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
	<20180327152026.335b4c2d@seebsdell>
	<CAJ86T=VdHEb4cyB=oSTHytyGc9B0+wN39qOSHWuVR0g6dFTLUg@mail.gmail.com>
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
X-List-Received-Date: Tue, 27 Mar 2018 21:10:11 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Mar 2018 13:52:28 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Mar 27, 2018 at 1:20 PM, Seebs <seebs@seebs.net> wrote:
> > My concern is that, strictly speaking, this is nearly all undefined
> > behavior, and that reading more arguments than you were passed
> > *does* explode on some C implementations.

> Can you give some examples?

Not specific ones off the top of my head, no.

> For every architecture I'm aware of that supports Linux, reading more
> arguments is going to mean reading more data out of the stack. It's
> not going "explode" until you read far enough to reach beyond the
> start of the stack. What other failure modes are there?

There are weird calling conventions out there. For instance, "pass
floating point values in registers, but integers on stack", or "pass
first N arguments in registers", and so on. I don't know if any of them
are active in stuff Linux supports, but I'm aware that this is an area
where you can get really strange behaviors.

It's undefined behavior for a reason.

> ALL of the implementations of libc syscall() I've looked at in both
> glibc and musl do BOTH of these things - either explicitly in C code
> or effectively the same thing in assembler.

Yes.
 
> By trying to avoid them in a wrapper, you are holding yourself to a
> higher standard than any of the underlying syscall() implementations.

Well, yes. They're part of the implementation and can make assumptions
about architecture because they're in a position to define
architecture. I'm not part of the implementation, and I don't want to
take on the workload of trying to track every possible architecture if
there's any possible way I can avoid it.

-s

