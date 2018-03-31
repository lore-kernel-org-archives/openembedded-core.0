Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 8A39271C07
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 15:35:28 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 03C592E8928;
	Sat, 31 Mar 2018 10:35:29 -0500 (CDT)
Date: Sat, 31 Mar 2018 10:35:28 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180331103528.1e462033@seebsdell>
In-Reply-To: <CAJ86T=UOuOWaOtQ8Y7bDc1170kckLvgg+FAfLx_sHT68r=mJRA@mail.gmail.com>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
	<CAJTo0LZUdMAtWKtGnPstotRGiHUPwZ_80PmuSzj5wpAFWGcN0Q@mail.gmail.com>
	<CAJ86T=WcgEo8SFRLPeRXyFXU-tRwXn0bXdYjiV4D9G19BOWuDg@mail.gmail.com>
	<20180331000631.5f050451@seebsdell>
	<CAJ86T=UOuOWaOtQ8Y7bDc1170kckLvgg+FAfLx_sHT68r=mJRA@mail.gmail.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Sat, 31 Mar 2018 15:35:29 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Mar 2018 23:02:29 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Mar 30, 2018 at 10:06 PM, Seebs <seebs@seebs.net> wrote:
> > That's the problem: There's no sane way to express "the size that
> > you would have gotten for these arguments of unknown types"
> 
> And there I think lies the key point that you still haven't grasped.

I think you're right, but also you're being sorta rude about it. I
think you're missing the distinction between "broad enough experience
with weird edge cases to be possibly-unduly cautious" and "has no idea
which end of a compiler is up".

> The arguments are not of unknown types - they are all of types which
> are the same size as integer registers.

It turns out, in C, "the same size" is *not enough information* to
determine where an argument goes. It is probably enough information for
the subset of arguments that syscall is using, on these architectures,
but I say "probably" because I have no spec to point to that says it's
necessarily the case.

> The syscall manpage very
> clearly documents the fact that all arguments to Linux syscalls are
> passed to the kernel in registers. I think you even asked me why that
> was important or useful.

I'm still honestly not totally sure why it has to say *which*
registers, specifically. Under what circumstances will my invocation of
syscall(2) be changed by the knowledge that argument 5 to an OABI ARM
system gets passed in v1? The information being present implies that I
might need to know this to invoke syscall(2) correctly, but the only
examples given are not actually specific to that information.

> If there's any user space code out there which calls libc syscall()
> and does not pass variables which libc syscall() (or a wrapper for it)
> can unconditionally treat as a type which fits into integer registers
> than it's a bug the caller. End of story.

This raises an interesting point. The man page says that the dummy 0
argument is needed for SYS_readahead because of an alignment issue, to
force the value into r2/r3. It does not say that the manual split of the
64-bit value into two halves is needed, it just does that. Is that
actually required anyway, or only because of the need to pad the
argument list? (For instance, look at sync_file_range2(), which
reorders the arguments to sync_file_range() for efficiency.

... Oh, wow. I went and checked on readahead():

>> On some 32-bit architectures, the calling signature for this
>> system call differs, for the reasons described in syscall(2).

Note how they don't specify what the alternative calling signature is.

-s

