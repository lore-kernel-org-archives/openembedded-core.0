Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 842286003C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:50:28 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id AC1472E8928;
	Tue, 27 Mar 2018 10:50:29 -0500 (CDT)
Date: Tue, 27 Mar 2018 10:50:28 -0500
From: Seebs <seebs@seebs.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20180327105028.188e6bdc@seebsdell>
In-Reply-To: <ly370lpt0f.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<ly370lpt0f.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 27 Mar 2018 15:50:28 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Mar 2018 15:06:40 +0200
Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:

> Andre McCurdy <armccurdy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> writes:
> 
> >> Since the man page gave the ia64 example, I went and checked, and
> >> it is indeed the case that calls other than syscall(2) will
> >> clobber r10 after system calls,
> 
> I think you are misinterpreting the man-page.  In "Architecture
> calling conventions" it documents the calling convention into the
> kernel.  syscall(2) itself is an ordinary function which has to
> follow the userspace ABI; after jumping into the kernel and setting
> 'errno' in error case, it restores registers as needed.

I don't think this is what it's talking about.

> Some ABIs allow functions to clobber registers (they are not restored
> after leaving the function and do not carry a return value); e.g. on
> ARM, these are r0-r3 and r12.  That's probably the case for r10 in
> ia64 too.

Maybe you missed the previous message where I pointed out that this
behavior is, at least on MIPS, an explicit step taken by glibc's
syscall implementation (and many other system calls).

So, no matter what the kernel's internal syscall behavior does, *after*
the syscall has returned, glibc is checking whether a syscall returned
-1, and setting a register based on that. This isn't a generic clobber;
this is an explicitly specified value that the register shall have
after the completion of the call, which glibc is implementing in code.

And we don't actually know why, because as Andre has pointed out, if
you don't do that, nothing obvious breaks in the test cases we've
tried. (Admittedly, I don't think we've tried on any of the
architectures where such a convention exists.)

-s

