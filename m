Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-07.prod.phx3.secureserver.net
	(p3plsmtpa06-07.prod.phx3.secureserver.net [173.201.192.108])
	by mail.openembedded.org (Postfix) with ESMTP id 27E3670703
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 03:45:30 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-07.prod.phx3.secureserver.net with 
	id krlS1o0051mTNtu01rlSCw; Fri, 29 Aug 2014 20:45:28 -0700
Message-ID: <540148D5.2040808@pabigot.com>
Date: Fri, 29 Aug 2014 22:45:25 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: armv6k support in OE for raspberrypi and s3c6410
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
X-List-Received-Date: Sat, 30 Aug 2014 03:45:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The topic from 
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095830.html 
is causing trouble again, specifically with meta-raspberrypi and 
boost-1.56.  Here're the details:

For the purposes of defining preprocessor symbols like 
__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 gcc 4.9.1 partitions ARM (non-M) 
architectures into three groups:

1) armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te 
iwmmxt iwmmxt2
2) armv6 armv6j armv6t2 armv6z
3) armv6k armv6zk armv7-a armv7-r armv7ve armv8-a armv8-a+crc

These indicate increasing levels of support for atomic instructions, and 
perhaps other differences. (There are other preprocessor defines like 
__ARCH_ARM_FOO that distinguish within these groups; here I'm focusing 
only on a specific known problem using __GCC_-prefixed symbols.)

Unlike normal builds of a gcc toolchain, OE builds the runtime libraries 
separately in gcc-runtime and using the machine's tuning flags which 
include the architecture.  The flags affect how atomic operations are 
implemented in the libraries.

Concurrrent applications built to link against the libraries must be 
compiled to use compatible atomic operations, or they do not work. While 
this happens naturally for applications built under OE that use the 
machine-specific tuning flags, it does not occur for on-target builds or 
for builds using the OE toolchain outside of the OE environment, which 
instead normally default to the least capable set of features.

The patch I added to gcc-configure-common.inc attempted to fix this by 
configuring the compiler using --with-arch=foo in cases where the target 
used -march=foo.

This turns out to be unstable as the rules for inferring defaults are 
complex.  From gcc/config/arm/arm.h:

/* Support for a compile-time default CPU, et cetera.  The rules are:
    --with-arch is ignored if -march or -mcpu are specified.
    --with-cpu is ignored if -march or -mcpu are specified, and is 
overridden
     by --with-arch.
    --with-tune is ignored if -mtune or -mcpu are specified (but not 
affected
      by -march).
    --with-float is ignored if -mfloat-abi is specified.
    --with-fpu is ignored if -mfpu is specified.
    --with-abi is ignored if -mabi is specified.
    --with-tls is ignored if -mtls-dialect is specified. */

As an example, while -mtune=arm1176jzf-s by itself would imply 
-march=armv6zk for a normally-built gcc, when gcc is built with 
--with-arch=armv6 the more capable implied architecture is not selected: 
the --with-arch setting takes precedence.

Which would be fine, except that meta-raspberrypi calls the arm1176jzf-s 
(which is armv6zk) an armv6 chip so gcc was built targeting a 
less-capable architecture. You have to explicitly add -march=armv6zk (or 
-march=armv6k) to make it work.

So it appears that, in order to correctly support the Raspberry PI, OE 
needs to have meta/conf/machine/include/arm/arch-armv7a.inc refactored 
to pull out armv6k, and any overrides related to atomic instructions 
updated to include armv6k as an option.

Or possibly meta-raspberrypi could just claim to be an armv7a platform, 
but that seems wrong.

Anybody have a better idea?  Is there somebody who can step up and bell 
this cat?  I'm stretching the limits of my cross-ARM familiarity here 
and really don't feel comfortable taking on this one.

Peter

PS: Lest anybody think this is a new issue that's the fault of gcc 4.9: 
it's not.  It was there with gcc-4.8 and maybe even gcc 4.7 as well, but 
only a few people noticed and none of them told OE about it. 
https://groups.google.com/forum/#!msg/automatak-dnp3/Jisp_zGhd5I/qJy1jHLFQoUJ

