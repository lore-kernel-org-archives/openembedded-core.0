Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id B267977FEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 19:22:31 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id DE28E2E8928;
	Tue, 27 Mar 2018 14:22:31 -0500 (CDT)
Date: Tue, 27 Mar 2018 14:22:30 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180327142230.15f1abf9@seebsdell>
In-Reply-To: <CAJ86T=VtdUAahO+PE2w8BzuPHAJCM1PEyWaYwg4SSGHU6jtm=A@mail.gmail.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
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
X-List-Received-Date: Tue, 27 Mar 2018 19:22:31 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Mar 2018 12:11:22 -0700
Andre McCurdy <armccurdy@gmail.com> wrote: 
> In the readahead example, the first syscall argument is the
> 32bit file descriptor (which will be passed to the kernel in r0),
> therefore a padding argument is required to fill r1 and ensure that
> the first word of the 64bit offset gets passed in r2.

Yes.

> The above is completely specific to ARM 32bit EABI. I guess *similar*
> issues may apply to some other 32bit architectures (as suggested in
> the manpage). It's certainly not an issue with is generic to all 32bit
> targets though.

I was wondering about 64-bit EABI. The man page didn't say "32-bit
EABI", it said "EABI". The information that you don't need to do that
on at least some ARM EABI arguably makes this *worse*, rather than
*better*, from the standpoint of "how do I write correct code for
this". So this appears to be at least partially a documentation error,
although it's quite possible that the text predates the question having
come up.

But it does also mean that it should be harmless to us in this case.

> If syscall(), or a wrapper for it, *does* need to interpret the
> arguments for a particular syscall then the syscall() implementation
> would have to also agree with the interpretation of the data defined
> by the kernel.

Yes.

My basic concern is that I don't think I have enough information to
produce a Provably Correct handling for syscall arguments in the
presence of at least one architecture where argument order can change
for at least one syscall.

... That said, an actual *correct* wrapper for renameat2 turns out
to be surprisingly hard, mostly because EXCHANGE is impossible to do
with pseudo's current IPC data structure.

-s

