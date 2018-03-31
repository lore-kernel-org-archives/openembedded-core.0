Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7F0746A1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 05:06:35 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 374F72E8922;
	Sat, 31 Mar 2018 00:06:36 -0500 (CDT)
Date: Sat, 31 Mar 2018 00:06:31 -0500
From: Seebs <seebs@seebs.net>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180331000631.5f050451@seebsdell>
In-Reply-To: <CAJ86T=WcgEo8SFRLPeRXyFXU-tRwXn0bXdYjiV4D9G19BOWuDg@mail.gmail.com>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
	<CAJTo0LZUdMAtWKtGnPstotRGiHUPwZ_80PmuSzj5wpAFWGcN0Q@mail.gmail.com>
	<CAJ86T=WcgEo8SFRLPeRXyFXU-tRwXn0bXdYjiV4D9G19BOWuDg@mail.gmail.com>
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
X-List-Received-Date: Sat, 31 Mar 2018 05:06:36 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Mar 2018 21:15:18 -0700
Andre McCurdy <armccurdy@gmail.com> wrote:
> Arguments passed by the caller will be put on the stack before any
> stack frame is created by the callee. You can argue about which way a
> stack grows (up or down) but however you define it, reading past the
> end of the arguments passed on the stack by the caller is never going
> to read into the stack frame created by the callee, so this can't have
> the intended affect.

I definitely think it's Probably Purely Superstitious, but I'm not sure
about this. I seem to recall at least one environment in which
consecutive parameters had increasing addresses, and local variables
had addresses higher still, so that somewhere past the address of the
Nth argument would be the address of a local variable. Given how many
insane calling conventions there are, I can't rule it out. (I do think
you're right about the compiler probably optimizing it away, although
they are not always as aggressive about that as you might expect them
to be.)

> This is probably going to work, but if the goal is to avoid reading
> more from the stack than the generic C code would do, it doesn't
> succeed.

I'm aware. The purpose is to (1) use the thing most expressive of
intent, (2) make sure that people know that this is not expected to be
portable. "__builtin_apply()" is fairly clear as to its *intent*, and
is unlikely to exist in a compatible calling convention in other
compilers.

> The "size" parameter to __builtin_apply() seems to simply
> specify how much argument data to copy from the stack frame passed
> byIt is not always simple to compute the proper value for size. the
> caller. Setting it to sizeof(long long) * 7 is safe (ie it will copy
> at least enough data from the stack frame passed by the caller, never
> less) as it covers both the corner cases where registers are long
> long (such as x32) and where _no_ arguments are passed in registers
> and everything needs to be copied from the stack. However, on 32bit
> targets (where registers are smaller than long long) and on any
> target where _some_ arguments are passed via registers, it will cause
> more data to be read from the stack than the generic C code would.

Yes, it will. As the documentation says: "It is not always simple to
compute the proper value for size."

I do think this is currently too large; specifically, it looks as
though right now there's a hard limit of 6 register-sized things, and
anything that takes off_t or similar types has fewer than 6 arguments.

So 6 * sizeof(off_t) or so is probably actually sufficient, if that
stays true, but I don't see a feature test macro for it...

> e.g. on 32bit ARM where the first 4 integer arguments are passed via
> registers, the optimum value for __builtin_apply() "size" in order to
> pass through 1 syscall number and 6 additional register sized
> arguments would be sizeof(long) * 3.

That seems probable, yes.

> typedef long syscall_arg_t; /* fixme: wrong for x32 */

Yes.

That's the problem: There's no sane way to express "the size that you
would have gotten for these arguments of unknown types", so I
intentionally went with something that may well be too long, but will
not be too short.

> (Note in the code was compiled with -mfloat-abi=soft to avoid
> __builtin_apply() needing to save and restore all floating point
> registers - which doesn't affect the amount of data read from the
> stack, but makes the assembler more than twice as long...).

And I don't *think* any syscalls take float arguments, but I don't
know that this is not only true now, but going to stay true.

-s

