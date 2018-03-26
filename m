Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC357848D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 21:07:46 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id ED47C2E895A;
	Mon, 26 Mar 2018 16:07:47 -0500 (CDT)
Date: Mon, 26 Mar 2018 16:07:46 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180326160746.1dce7ae9@seebsdell>
In-Reply-To: <CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
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
X-List-Received-Date: Mon, 26 Mar 2018 21:07:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Mar 2018 13:12:44 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> That's based on your assumption that a C wrapper needs to care about
> results in architecture specific registers, which I contend is not a
> correct interpretation of the syscall manpage.

My observation is: If this doesn't matter, why is glibc doing it? It
seems really weird to mention this thing, and bother doing it, if it
*never* matters. So possibly it does matter. Sometimes. When?

I don't feel comfortable assuming I understand the code if it's doing
something like that, I can't see when it would affect anything, and the
code hasn't been removed to improve performance. I'd be a lot more
comfortable disregarding the weird return values and register
specifications if I could look at real-world examples of how that
information is used.

> Did you find any evidence to support your interpretation? e.g. Did you
> find any examples of callers to the libc syscall() API which use
> architecture specific assembler to examine the result of the syscall?

I have seen exactly one use of syscall() in the wild at all, that being
the recent addition to coreutils.

The evidence for my interpretation that you *could* need to know about
arch-specific behavior is the EABI example, which clearly indicates the
*possibility* that code in C has to care about architectural variance
in non-obvious ways. I don't know what ways those might be, and this
call is so rarely used that I'm not sure it would be reasonable to
generalize about it. (I also don't know whether it's still true on
64-bit ARM, and whether it also applies to pointer values or only to
integer values, or...)

> The gnulib code calling syscall(SYS_renameat2, ...) certainly doesn't
> do that - it just checks the C function return value and errno. Since
> there's no architecture specific code to examine the syscall() result,
> do you expect coreutils mv to now incorrectly detect errors on ia64?

No. But I don't know whether *anyone* is using syscall(), other than
this one single example I've seen identified. I also don't know how
widely tested the code in question is, or on what architectures.

Testing on non-x86 architectures has often been sporadic in the open
source community, and I think that's improved, but I don't know how
much. If I'm looking at something that's almost never used, and I don't
have specific information that the existing usage is being fully tested
on "obscure" targets (such as mips, arm, etc), I am going to be at
least a little distrustful.

-s

