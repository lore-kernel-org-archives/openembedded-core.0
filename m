Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa11-08.prod.phx3.secureserver.net
	(p3plsmtpa11-08.prod.phx3.secureserver.net [68.178.252.109])
	by mail.openembedded.org (Postfix) with ESMTP id A5C6262252
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 12:26:57 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa11-08.prod.phx3.secureserver.net with 
	id l0Sv1o0081mTNtu010Swzs; Sat, 30 Aug 2014 05:26:58 -0700
Message-ID: <5401C30F.5090408@pabigot.com>
Date: Sat, 30 Aug 2014 07:26:55 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <540148D5.2040808@pabigot.com> <1409384965.29296.214.camel@ted>
In-Reply-To: <1409384965.29296.214.camel@ted>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: armv6k support in OE for raspberrypi and s3c6410
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
X-List-Received-Date: Sat, 30 Aug 2014 12:26:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2014 02:49 AM, Richard Purdie wrote:
> On Fri, 2014-08-29 at 22:45 -0500, Peter A. Bigot wrote:
>> Unlike normal builds of a gcc toolchain, OE builds the runtime libraries
>> separately in gcc-runtime and using the machine's tuning flags which
>> include the architecture.  The flags affect how atomic operations are
>> implemented in the libraries.
> Which are you trying to fix? The on target gcc or the SDK one?

On-target.

I want compiler invocations like "g++ -std=c++1y -pthread test.cc" with 
the on-target OE-supplied gcc to work at least as well as the same 
invocation using the same version of gcc built on-target.  For this to 
happen, the OE gcc default architecture must be compatible with flags 
used to build the OE gcc-runtime library, just as gcc built on-target is 
compatible with gcc libraries built on-target.

There are at least two ways to make that happen: change the compiler 
default architecture to match the target-specific flags used for 
gcc-runtime, or remove the target-specific flags when building 
gcc-runtime.  The latter approach makes things more consistent with how 
gcc is built and used outside of OE, but is not how OE has traditionally 
done things so the impact of the change might be significant.  We've 
been trying the former solution, which also makes the on-target compiler 
generate native-optimized code by default (a bonus, fixing the bug you 
mention below).

> On target is harder however the on target gcc is compiled to a specific
> PACKAGE_ARCH so we should be able to put specific tuning into that gcc.
> It does sound like the changes to gcc-configure-common.inc were not the
> way to resolve this though, I'd misunderstood what the patches were
> doing.

It may still be the right way to solve it.  It breaks with 
meta-raspberrypi because that arm1176jzf-s is not optimally 
DEFAULTTUNE="armv6" that it's currently using: -mtune=arm1176jzf-s 
-march=armv6 is not the same as -mtune=arm1176jzf-s alone.  It should be 
DEFAULTTUNE="armv6k", but OE doesn't have that as an option.  If it did 
we could build gcc --with-arch=armv6k and it'd work as well as the 
armv7a platforms.

Unfortunately, I think this would have to end up with creating new 
armv6k-vfp-poky-linux-gnueabi packages, which probably wouldn't fly.  So 
it might be necessary to remove the TUNE_CCARGS flags from gcc-runtime 
after all.

> Can we fix this by adjusting gcc itself (the on target version)?

Maybe.  It makes me uncomfortable to have the on-target compiler use 
different target configuration options than the cross-compilers: I'd 
expect that to produce even more hidden inconsistencies.

I suspect there are issues with statically linked SDK-built applications 
with libstdc++ because the SDK gcc runtime libraries aren't built with 
the same TUNE_CCARGS flags applied by gcc-runtime for the on-target 
libraries, though maybe not because in that case they're built without 
target-specific assumptions.

> Its even a very old bug:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=139
>
> but we've not actually hit issues due to this before or at least they've
> not been reported in these terms.

Yes, but that bug relates to not generating target-optimized code by 
default: programs work, but aren't as fast as they could be.  Now that 
people are using concurrent programs and the compilers are better, we're 
hitting the issues related to inconsistently identifying which 
instructions are available on the target.

Peter

