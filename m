Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8DDB6609AD
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 11:12:01 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id v20so3535291lbc.31
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 04:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UvzvPfLuuDH7YL0tmn0ub4bR8ysd1Pjp4YXkvOo308k=;
	b=urstDsF0Pu86iccVEztuk1CBkGY1mWepZ9yIHkw357oTc0ZUv4SxDdgdu+EZTrWtl4
	WrCuhEBYsapXUA/Z8+GnH3sUV8JAncYPuwin8L31Uvjr3DNAPdGlQW+eNQ726axGnu7f
	by1c9YuqS8sVblM1ZvK0lUm1oehuL6WWNg0Nvin0XFC55qjPn0ObarVbHx7gCW+nKUar
	41MlGzonko2AQJrTdKhvxs01Qp1UZmPofpDpIZLbrSrNin7yJjED4Mj3u/9tlur37H2b
	Fkxlk+w3vpvpomkoFfQ4NQtLh6Z1MQcKmczYQ++2p33YtP1NlyK83VlUqwUVetB/yMvW
	EWaw==
MIME-Version: 1.0
X-Received: by 10.152.44.170 with SMTP id f10mr8770941lam.68.1371553921641;
	Tue, 18 Jun 2013 04:12:01 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Tue, 18 Jun 2013 04:12:01 -0700 (PDT)
In-Reply-To: <40EAB0BD-784A-4DBB-A8E1-8A4E81E0B41C@gmail.com>
References: <A6E8629E-ED47-4DD7-8C53-B0D467BADA39@gmail.com>
	<51BFE413.2020303@windriver.com>
	<99677DAA-0C63-481C-9499-0E4F00188725@gmail.com>
	<51BFE8D9.8010002@windriver.com>
	<40EAB0BD-784A-4DBB-A8E1-8A4E81E0B41C@gmail.com>
Date: Tue, 18 Jun 2013 07:12:01 -0400
Message-ID: <CADkTA4O3CGSOgF2MqAqEAcTZJfUssF29bftdKqaky7CR9H84yg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org \(yocto@yoctoproject.org\)"
	<yocto@yoctoproject.org>,
	"<openembedded-core@lists.openembedded.org> oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Fix for kernel 3.8/gcc-4.8 segfault on qemuarm
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
X-List-Received-Date: Tue, 18 Jun 2013 11:12:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 18, 2013 at 1:25 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Jun 17, 2013, at 9:58 PM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>
>> On 13-06-18 12:41 AM, Khem Raj wrote:
>>>
>>> On Jun 17, 2013, at 9:37 PM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>>>
>>>> On 13-06-17 11:30 PM, Khem Raj wrote:
>>>>> Hi Bruce and All
>>>>>
>>>>> Finally after a long innings I have diagnosed the mystery behind the below segfault that we see on kernel 3.8 which compiled with gcc 4.8 but don't show when compiled with gcc 4.7
>>>>>
>>>>>
>>>>
>>>> There also seems to be a follow up patch:
>>>>
>>>> commit 418df63adac56841ef6b0f1fcf435bc64d4ed177
>>>> Author: Nicolas Pitre <nicolas.pitre@linaro.org>
>>>> Date:   Tue Mar 12 13:00:42 2013 +0100
>>>>
>>>>    ARM: 7670/1: fix the memset fix
>>>>
>>>>    Commit 455bd4c430b0 ("ARM: 7668/1: fix memset-related crashes caused by
>>>>    recent GCC (4.7.2) optimizations") attempted to fix a compliance issue
>>>>    with the memset return value.  However the memset itself became broken
>>>>    by that patch for misaligned pointers.
>>>>
>>>>    This fixes the above by branching over the entry code from the
>>>>    misaligned fixup code to avoid reloading the original pointer.
>>>>
>>>>    Also, because the function entry alignment is wrong in the Thumb mode
>>>>    compilation, that fixup code is moved to the end.
>>>>
>>>>    While at it, the entry instructions are slightly reworked to help dual
>>>>    issue pipelines.
>>>>
>>>>    Signed-off-by: Nicolas Pitre <nico@linaro.org>
>>>>    Tested-by: Alexander Holler <holler@ahsoftware.de>
>>>>    Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
>>>>
>>>> :100644 100644 d912e73... 94b0650... M  arch/arm/lib/memset.S
>>>>
>>>> --------
>>>>
>>>> I've staged it as well, and will do a boot test in the morning once
>>>> my build has completed. Time to call it a night here.
>>>
>>> I did not need anything other than the first patch to get over the segfault. but yes it completes the fix
>>> so having both is better
>>
>> So very strange. I got one segfault, and then this:
>>
>> Linux version 3.8.13-yocto-standard (bruce@yow-bashfiel-d2) (gcc version 4.8.1 (GCC) ) #2 PREEMPT Tue Jun 18 00:36:55 EDT 2013
>>
>> <snip>
>>
>> qemuarm login: root
>> root@qemuarm:~# uname -a
>> Linux qemuarm 3.8.13-yocto-standard #2 PREEMPT Tue Jun 18 00:36:55 EDT 2013 armv5tejl GNU/Linux
>>
>> ----------------
>>
>> Which means I may have just been unlucky on my testing with 3.10, or something
>> else is going on.
>
> Well I have been booting latest linus's (3.10-rc6) master compiled with gcc 4.8 just one patch from linux-yocto see below
>

Very odd. I would have just done the bisection myself, but my starting known
point "good" point .. was a fail. So I've instead been looking at assembly dumps
of memory management routines.

> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.8/commit/?h=standard/arm-versatile-926ejs&id=351d133943b50a9dfeee07661d44254722a19f04
>
> I wonder why this patch hasn't made upstream yet.

It was sent upstream, and rmk wanted to go to ARM ltd to rework the patch after
getting some boards specs. Looks like the process is still ongoing.

Cheers,

Bruce

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

