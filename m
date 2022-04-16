Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <6aa10133af2f9c6a198deed7a99aab6824a68ffe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFT][PATCH v3] gcc: upgrade 11.2 -> current gcc-12 snapshot
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sat, 16 Apr 2022 09:07:49 +0100
In-Reply-To: <20220415173821.3079322-1-raj.khem@gmail.com>
References: <20220415173821.3079322-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Bernhard =?ISO-8859-1?Q?Rosenkr=E4nzer?= <bernhard.rosenkraenzer.ext@huawei.com>, Jon Mason <Jon.Mason@arm.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, Bruce Ashfield <bruce.ashfield@gmail.com>

On Fri, 2022-04-15 at 10:38 -0700, Khem Raj wrote:
> From: Bernhard Rosenkränzer <bernhard.rosenkraenzer.ext@huawei.com>
> 
> - gcc 12 is in RC stages.
> - Add patch to re-shuffle include of sched.h to fix build on musl
> 
> Signed-off-by: Bernhard Rosenkränzer <bernhard.rosenkraenzer.ext@huawei.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v3
> - Switch to own snapshot for quick turnarounds than waiting for a
>   weekly snapshot
> - Add a fix for gcc target build on musl
> - Fixed gcc for kernel build failures on arm/x86_64
> - Fixed gcc for ccache build failure

I ran this through the autobuilder as requested as it means we have a chance to
get things fixed upstream before gcc 12 is released:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3535

We see failures in:

edgerouter/edgerouter-alt in linux-yocto 5.15/5.10:
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5078
https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2965

meta-arm in linux-yocto 5.15:
https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2307

meta-intel in intel-media-driver:
https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/2770

qemuppc/qemuppc-alt in linux-yocto 5.15/5.10:
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5033
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2916

Four oe-selftest failures due to missing maintainer entries (easy fix)

A weird oe-selftest prservice.BitbakePrTests.test_import_export_override_db:
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3409/steps/14/logs/stdio

The latter is one of our infamous intermittent issues and likely not gcc 12
"""
Parsing recipes...ERROR: ParseError in None: Not all recipes parsed, parser
thread killed/died? Exiting.
ERROR: Parsing halted due to errors, see error messages above
"""

So basically you have the intel-media-driver failure in meta-intel and a number
of kernel issues. I've cc'd a few of the maintainers just so they're aware of
the status, I appreciate we'd wait for the mainline kernel to resolve things.

Cheers,

Richard





