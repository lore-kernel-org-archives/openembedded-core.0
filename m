Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-10.prod.phx3.secureserver.net
	(p3plsmtpa06-10.prod.phx3.secureserver.net [173.201.192.111])
	by mail.openembedded.org (Postfix) with ESMTP id 4D86F60438
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 23:23:34 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-10.prod.phx3.secureserver.net with 
	id ePPa1o0071mTNtu01PPaXQ; Wed, 13 Aug 2014 16:23:35 -0700
Message-ID: <53EBF375.1070701@pabigot.com>
Date: Wed, 13 Aug 2014 18:23:33 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <53E9134F.7040108@pabigot.com>
	<CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>
	<53EBD76A.3010401@pabigot.com> <53EBDA75.4040101@pabigot.com>
	<CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>
In-Reply-To: <CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Wed, 13 Aug 2014 23:23:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2014 05:05 PM, Khem Raj wrote:
> On Wed, Aug 13, 2014 at 2:36 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>> In any case, Khem can you run with this?  It'd be fixed a lot better that
>> way....
> We do not configure target gcc with right matching cpu defaults,
> atomic instruction strex/ldrex are only added after armv6 but defaults
> for gcc if not specified is armv5t and hence it does not use the right
> set as expected by libstdc++ which has been cross compiled. so while
> you are at it and can reproduce it. Try to add
>
> EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a", "
> --with-cpu=armv7-a", "", d)}'
>
> to gcc-target.inc and see if resulting gcc is any better

I had to make it:

EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a", 
"--with-cpu=generic-armv7-a", "", d)}'

to get gcc to build but at runtime I then get:

beaglebone[16]$ g++ -std=c++11 -pthread test.cc && ./a.out
Assembler messages:
Error: unknown cpu `generic-armv7-a'
Error: unrecognized option -mcpu=generic-armv7-a

which indicates the flag's being passed to the assembler which doesn't 
recognize it even though g++ is happy with it.  I suppose we could hack 
binutils to substitute whatever spelling it wants to see.

(Also tried --with-cpu=arm7, but that generates assembler errors related 
to unsupported RM mode "bx lr").

The approach bothers me, though.  Instead of explicitly changing 
gcc-target to match gcc-runtime, shouldn't it be a general rule that 
gcc-runtime not apply OE-specific target flags that aren't going to be 
used by direct invocations of the compiler outside of the OE build 
environment?  That seems a little more robust, as the default target 
flags may be changed upstream or by bbappends within OE, and having to 
make them match in gcc-runtime as well would be a headache.

And would we need similar overrides for other architectures? There's 
something similar already in gcc-configure-common.inc for mips64.

Peter

