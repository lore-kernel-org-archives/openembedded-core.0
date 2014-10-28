Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 085D26AC47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 11:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9SBUVcu011508; Tue, 28 Oct 2014 11:30:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zvzu6sg8ARkn; Tue, 28 Oct 2014 11:30:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9SBUSHr011504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 28 Oct 2014 11:30:29 GMT
Message-ID: <1414495863.7967.142.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kristof Robot <krirobo@gmail.com>
Date: Tue, 28 Oct 2014 11:31:03 +0000
In-Reply-To: <CAFgGSN6xBxoQpF3wSJMNnyeAnOQ-MDTAr4DqJ4adXb9MgEnEpw@mail.gmail.com>
References: <1398958819.30460.86.camel@ted>
	<CAFgGSN7et4nS+yD39199rF+7mgHkfApmQ5E9M4u=Zvzw-gGSkg@mail.gmail.com>
	<1414450784.7967.112.camel@ted>
	<CAFgGSN6xBxoQpF3wSJMNnyeAnOQ-MDTAr4DqJ4adXb9MgEnEpw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-common: Only apply fpu settings to target gcc
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
X-List-Received-Date: Tue, 28 Oct 2014 11:31:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-10-28 at 11:30 +0100, Kristof Robot wrote:
> On Mon, Oct 27, 2014 at 11:59 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2014-10-27 at 20:54 +0100, Kristof Robot wrote:
> >> Richard, all,
> >>
> >> After bisecting, I found that, since this patch, my toolchain is being
> >> built with soft floating point support, while it should be built with
> >> hard floating point support:
> >>
> [snip]
> >> I am using DEFAULTTUNE = "cortexa7hf-neon-vfpv4", resulting in
> >> following build configuration parameters:
> >>     TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard vfpv4 cortexa7"
> >>     TARGET_FPU        = "vfp-vfpv4-neon"
> >
> > When building in OE, we always pass in the correct flags to gcc to
> > ensure the correct thing gets built. The option you're changing with the
> > revert just changed the default used by gcc if no option is specified on
> > the commandline, so the change of the above test isn't a surprise.
> >
> > What is the real world problem you're seeing due to this? Is it caused
> > by some compiler flags not being passed in somewhere?
> 
> The real world problem is a compilation of the meta-ros libfreenect
> library [1] for a Cubieboard2 [2] - this build fails because the
> compiler fails to find <gnu/stubs-hard.h> (only gnu/stubs-soft.h is
> available).
> In other words, somehow libfreenect (correctly) expects hard floating
> point, but then runs into troubles as the toolchain is (incorrectly)
> compiled using soft floating point.
> See also [3], which describes a similar problem, and [4], which seems
> to provide relevant info.
> 
> More generally, I would actually assume that everything is being built
> hard floating point, as a result of the provided DEFAULTTUNE =
> "cortexa7hf-neon-vfpv4".
>
> Isn't this the correct way to force hard floating point?

There is something wrong somewhere by the sounds of it but I'm not 100%
sure where. With that tune, bitbake -e | grep CC= should show that CC is
something along the lines of:

CC="arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon-vfpv4 -mtune=cortex-a7 --sysroot=X"

the key part being -mfloat-abi=hard. When (e)glibc is built, which
should be built specifically for this configuration, it should see that
setting in the various flags and should generate headers like:

./image/usr/include/gnu/stubs-hard.h
./image/usr/include/gnu/stubs.h

i.e. it should build a C library that matches this configuration and has
the right headers. When libfreenect is built, the right headers should
then be available.

So, I'd suggest checking that the compiler flags in CC are what you'd
expect and then that the C library is built with the right format
headers. Something, somewhere isn't honouring the flags correctly as far
as I can tell but I don't know what.

Also, I'd be aware of the fact that we build one cross compiler
(gcc-cross) for arm which is meant to work for all arm targets. If you
build a softfloat something, then a hardfloat machine, it may be that
something bad is creeping into the build process and a straight revert
may not reproduce the bug you're seeing.

Cheers,

Richard


