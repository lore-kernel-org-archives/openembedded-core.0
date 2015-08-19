Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 62B8973CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 22:52:46 +0000 (UTC)
Received: by igfj19 with SMTP id j19so1212269igf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 15:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Pfnt6N1yLS/bAXKE9D/8b2ZEsQAiNjXPWtRxmw9ZMF0=;
	b=YnmqPcV5l3RLBlC2jrM5Pir6qxM3/a0OhZNlF6rdjEW/O1rOatBtsCPlzxJ4vxnH/c
	DIfITzFoM1AIdpOTp+gcNH0nzjxJA38AJmlahdN9pYBeL1ZXDBxZDeH1jeZ7HHaQbm/f
	1i68/I88xkNQby3sizNUZSgyzYkhLoWx/pkheeRUZJDa3DUHKPhdI+7S0pdSooq7dMA+
	1Xx+Y0NfxJLnLAkcYYCIQ5Pll2URKAdUNTNaqFzBisvRGqgcMHCJ4rN+tY2GXRnIPIgA
	5rTLJ0x6nvR19N4HPpsK3GnyARH77NddhoInuKj1DXEqfJVsgUipyyEI9Y3uNUO0tL4T
	MrSw==
X-Received: by 10.50.93.102 with SMTP id ct6mr4223097igb.75.1440024766298;
	Wed, 19 Aug 2015 15:52:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 19 Aug 2015 15:52:16 -0700 (PDT)
In-Reply-To: <CAJTo0LasGyh_erWWWPPKWtOwbBi0tWVXudxKgXnZhL42SL3WWQ@mail.gmail.com>
References: <1440006296-15277-1-git-send-email-raj.khem@gmail.com>
	<55D4E00C.9060601@mentor.com>
	<CAJTo0LasGyh_erWWWPPKWtOwbBi0tWVXudxKgXnZhL42SL3WWQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Aug 2015 15:52:16 -0700
Message-ID: <CAMKF1srbSN-_26r-_9sq1uBYcioXMu3woxBQjRHvZ5TcTQtSOw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Nathan Lynch <Nathan_Lynch@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch: Force BFD kernel when using gcc for linking
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
X-List-Received-Date: Wed, 19 Aug 2015 22:52:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 19, 2015 at 1:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 19 August 2015 at 20:59, Nathan Lynch <Nathan_Lynch@mentor.com> wrote:
>>
>> On 08/19/2015 12:44 PM, Khem Raj wrote:
>> > We redefine LD to point to ld.bfd when building kernel, which works in
>> > most cases since kbuild system calls out for bare LD most of the time,
>> > however some of newer kernels e.g. 4.1+ have some code added which can
>> > call gcc directly to do the linking job e.g. arm vdso code
>> >
>> > This causes build failures when we have configured the default cross
>> > toolchain to use gold linker as default. Errors like
>> >
>> > BFD: arch/arm/vdso/vdso.so: Not enough room for program headers, try
>> > linking with -N
>> > | arm-angstrom-linux-gnueabi-objcopy:arch/arm/vdso/vdso.so[.hash]: Bad
>> > value
>> >
>> > start happening.
>> >
>> > With this patch we force gcc to choose bfd linker as well
>>
>>
>> This is fixed upstream as of:
>>
>> commit d2b30cd4b7223a96e606dfc8120626f66d81e091
>> Author: Nathan Lynch <nathan_lynch@mentor.com>
>> Date:   Wed Jun 3 00:41:15 2015 +0100
>>
>>     ARM: 8384/1: VDSO: force use of BFD linker
>>
>> which should make it to 4.1-stable soon.

it fixes one case yes, there could be many more to come. We want to
make sure that we use bfd ld through out the kernel.

>
>
>  CC'ing Bruce.
>
> I'll stage the fix from Khem in my master-unde-test branch.  Bruce: if you
> end up merging this fix into the oe-core kernels, please remind me to revert
> Khem's patch. :)

There is no need to revert it. Since it convey's what we want to do in
more comprehensive way i.e. to use bfd linker for all kernel links in
all forms.
 It covers us for future issues of similar kind

