Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1A260097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 22:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9RMxCbI012585; Mon, 27 Oct 2014 22:59:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7Ri03BlNKLy8; Mon, 27 Oct 2014 22:59:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9RMx9IK012582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 27 Oct 2014 22:59:10 GMT
Message-ID: <1414450784.7967.112.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kristof Robot <krirobo@gmail.com>
Date: Mon, 27 Oct 2014 22:59:44 +0000
In-Reply-To: <CAFgGSN7et4nS+yD39199rF+7mgHkfApmQ5E9M4u=Zvzw-gGSkg@mail.gmail.com>
References: <1398958819.30460.86.camel@ted>
	<CAFgGSN7et4nS+yD39199rF+7mgHkfApmQ5E9M4u=Zvzw-gGSkg@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Oct 2014 22:59:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-10-27 at 20:54 +0100, Kristof Robot wrote:
> Richard, all,
> 
> After bisecting, I found that, since this patch, my toolchain is being
> built with soft floating point support, while it should be built with
> hard floating point support:
> 
> (1) Compiling parent commit 74d8866814aec520822518cc4cb8a942f7069bf7
> [1] gives hard floating point support (good):
>     $./build.good74d8/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gcc
>  -dM -E - < /dev/null | grep -i SOFTFP
>     $
> 
> (2) Compiling with this patch (commit
> ce1f3fd20d81545d6d5dfc68f86f9fddf8ac9bbf [2]) gives soft floating
> point support (bad):
>     $ ./build.badce1f/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gcc
>  -dM -E - < /dev/null | grep -i SOFTFP
>     #define __SOFTFP__ 1
>     $
> 
> I am using DEFAULTTUNE = "cortexa7hf-neon-vfpv4", resulting in
> following build configuration parameters:
>     TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard vfpv4 cortexa7"
>     TARGET_FPU        = "vfp-vfpv4-neon"

When building in OE, we always pass in the correct flags to gcc to
ensure the correct thing gets built. The option you're changing with the
revert just changed the default used by gcc if no option is specified on
the commandline, so the change of the above test isn't a surprise.

What is the real world problem you're seeing due to this? Is it caused
by some compiler flags not being passed in somewhere?

Note that some changes in master-next start to make the problem much
more obvious by poisoning the default sysroot option to the compiler.
When such options get lost, the failures should then be much clearer.

Cheers,

Richard


