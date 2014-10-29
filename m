Return-Path: <krirobo@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id DEB6760557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 09:24:11 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id uy5so2022445obc.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 02:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xH6JOLdkgeNi+uOQtlRe44bty9rAW5q0n5Bta5QOn9A=;
	b=O/N7Ewco2bs99H02mpoTHlCtalOxXopLcIKpgtGIKbiBCwDbgGU1XSw89dBhgSij0g
	6Nna42Gp5CiyzfGozAMsq/BP4gU1L7BqPfI1r6LR6O927q6TKk5Uq6VcBwrDKLzARBxC
	wlRkTC4dBM5l18wCe/iHXJSs/HUWTHyjdhLBtrOHZ1ED93wF5Qvc7mvZYmdozeu99q+7
	n+awGyfwT9xiPc0W1wTYE2xxlcXdNDfoR/V8kdXRREv9amv3yvfkn52jcP0ruNVmjrA/
	dT/DarddjoqabK0a/ZSvJD796ibpjuU0ODlJ+A1E0Bwban5hYlA042djjZmVImFOT/Yw
	OWIw==
MIME-Version: 1.0
X-Received: by 10.60.47.40 with SMTP id a8mr7841148oen.18.1414574651599; Wed,
	29 Oct 2014 02:24:11 -0700 (PDT)
Received: by 10.76.150.38 with HTTP; Wed, 29 Oct 2014 02:24:11 -0700 (PDT)
In-Reply-To: <1414572117.7967.179.camel@ted>
References: <1398958819.30460.86.camel@ted>
	<CAFgGSN7et4nS+yD39199rF+7mgHkfApmQ5E9M4u=Zvzw-gGSkg@mail.gmail.com>
	<1414450784.7967.112.camel@ted>
	<CAFgGSN6xBxoQpF3wSJMNnyeAnOQ-MDTAr4DqJ4adXb9MgEnEpw@mail.gmail.com>
	<CAFgGSN7R=pnPNrakJLZqG4S7ENiHx5qiaRSudb--LR-CTpELXw@mail.gmail.com>
	<CAFgGSN76NRcBXG6Z=72aek3GVX=e7VqVDQ4FhdxoJLPg1af2ig@mail.gmail.com>
	<1414534100.7967.173.camel@ted>
	<CAFgGSN5T9UDFuzCqU+vsOSVy+uiwhxUf-ApGAQ80QAdSBoUHdQ@mail.gmail.com>
	<1414572117.7967.179.camel@ted>
Date: Wed, 29 Oct 2014 10:24:11 +0100
Message-ID: <CAFgGSN7UsJ0j+0iUygwcAk+ww_jb+z9=Tyx0HnuJLjrbgp4G2A@mail.gmail.com>
From: Kristof Robot <krirobo@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 29 Oct 2014 09:24:13 -0000
Content-Type: text/plain; charset=UTF-8

[re-adding the mailinglist]

On Wed, Oct 29, 2014 at 9:41 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2014-10-29 at 07:47 +0100, Kristof Robot wrote:
>> On Tue, Oct 28, 2014 at 11:08 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Tue, 2014-10-28 at 19:11 +0100, Kristof Robot wrote:
>> >> On Tue, Oct 28, 2014 at 7:10 PM, Kristof Robot <krirobo@gmail.com> wrote:
>> >> > On Tue, Oct 28, 2014 at 11:30 AM, Kristof Robot <krirobo@gmail.com> wrote:
>> >> >> On Mon, Oct 27, 2014 at 11:59 PM, Richard Purdie
>> >> >> <richard.purdie@linuxfoundation.org> wrote:
>> >> >>> On Mon, 2014-10-27 at 20:54 +0100, Kristof Robot wrote:
>> >> >> The real world problem is a compilation of the meta-ros libfreenect
>> >> >> library [1] for a Cubieboard2 [2] - this build fails because the
>> >> >> compiler fails to find <gnu/stubs-hard.h> (only gnu/stubs-soft.h is
>> >> >> available).
>> >>
>> >> This is incorrect. The build fails because the compiler fails to find
>> >>  <gnu/stubs-soft.h> (only gnu/stubs-hard.h is available):
>> >>
>> >> /build/tmp-glibc/sysroots/cubieboard2/usr/include/gnu/stubs.h:7:29:
>> >>  fatal error: gnu/stubs-soft.h: No such file or directory
>> >
>> > In that case, I believe this is cause the -mfloat=hard option to gcc is
>> > not being passed in. That option should be set in CC= as exposed by
>> > bitbake -e and therefore if I have to guess, the software in question is
>> > "losing" the flag somewhere.
>>
>> Are you referring to the libfreenect software?
>>
>> Note that the problem is already present in the toolchain - while
>> (e)glibc seems to be built correctly with hard floating point (as can
>> be seen from the fact that gnu/stubs-hard.h is available),
>> arm-oe-linux-gnueabi-gcc is NOT built with hard floating point, but
>> with soft floating point, as indicated in my first email:
>>
>> (1) Compiling parent commit 74d8866814aec520822518cc4cb8a942f7069bf7
>> gives hard floating point support (good):
>>     $./build.good74d8/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gcc
>>  -dM -E - < /dev/null | grep -i SOFTFP
>>     $
>>
>> (2) Compiling with this patch (commit
>> ce1f3fd20d81545d6d5dfc68f86f9fddf8ac9bbf) gives soft floating point
>> support (bad):
>>     $ ./build.badce1f/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gcc
>>  -dM -E - < /dev/null | grep -i SOFTFP
>>     #define __SOFTFP__ 1
>>     $
>
> If you pass the -mfloat=hard option to the tests above, you will find
> that all of a sudden gcc behaves like a hardfloat system. All the patch
> you're changing does is change the default that gcc has, it can support
> both, depending on which flags it is passed.

Aha, it is changing the *default* of gcc - now I got it - that makes
sense. So the issue is not with gcc (or the toolchain in general).

>> This can also be seen based on the presence (or absence of) __ARM_PCS_VP
>>
>> (1) commit 74d8866814aec520822518cc4cb8a9 (good)
>>     arm-oe-linux-gnueabi-gcc -dM -E - < /dev/null | grep -i ARM_PCS
>>     #define __ARM_PCS_VFP 1
>>
>> (2) commit ce1f3fd20d81545d6d5dfc68f86f9fddf8ac9bbf (bad)
>>     arm-oe-linux-gnueabi-gcc -dM -E - < /dev/null | grep -i ARM_PCS
>>     #define __ARM_PCS 1
>>
>> Or is this expected?
>
> Expected.
>
> I still believe there is a problem in libfreenect with it not passing
> the options to the compiler that it should.

Yups, you are right. After I understood that this patch was just
changing the default gcc options, and that the issue was not with the
toolchain, I had a better look at the libfreenect software, and it
happens to have already tackled this exact issue ("Stop clobbering
CFLAGS" [1]) in a later version.

Thanks a lot for the help, and sorry for the noise!

Kristof

[1] https://github.com/OpenKinect/libfreenect/commit/0cbb86ec982d3e79ad5efa9d1b2b16724ae89bc5

