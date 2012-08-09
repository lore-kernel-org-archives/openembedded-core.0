Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SzHop-0007qt-3W
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 03:45:47 +0200
Received: by ghbz2 with SMTP id z2so1403035ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 18:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WQdzymlPHpXmvvV2j+miRfa0pUtBnNVa4i6D6ICb9zg=;
	b=nd981AuQ5k2bQmr4rUr/mmVeA+P5G6mPMDkS8IGl3+rWTPertFaqjQ/1eph3BCwZhQ
	V/V1PWuu6sCzCFVfqNIZ3PTiCLKyI7f9f75jKY/6Z/2occ16mNAolGtsQhV9i0njqEt3
	a8DI3m1s18zrdC3TxcVGP4itorutDwyxRPOqojdjfTENtSiChoZDzhx8G6YHWpW7exe0
	midPiK0Zz3dECYed7tShwKd52ix4O1sjLzILw577UnKsGKaJhirQj23KtoHFsLPUN9LO
	8Ff41lly2B1GKfcfeQLOm4qmSIatMljN30TsmrKCmaKgA2alozHB+EhsXgQS1JnxAvAD
	fMKg==
MIME-Version: 1.0
Received: by 10.50.157.194 with SMTP id wo2mr654297igb.72.1344476038530; Wed,
	08 Aug 2012 18:33:58 -0700 (PDT)
Received: by 10.231.245.129 with HTTP; Wed, 8 Aug 2012 18:33:58 -0700 (PDT)
In-Reply-To: <5023062A.8050105@intel.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<5023062A.8050105@intel.com>
Date: Wed, 8 Aug 2012 21:33:58 -0400
Message-ID: <CADkTA4Po43Bj-cQN34ph3t+_=4-JYQ3gMK4OTLyEOhQG+YywWA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2012 01:45:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 8, 2012 at 8:36 PM, Darren Hart <darren.hart@intel.com> wrote:
> On 08/07/2012 08:37 PM, Liang Li wrote:
>> On 2012-08-07 22:02, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>> On Fri, 2012-08-03 at 23:43 +0800, Liang Li wrote:
>>>> Via EXTRA_CFLAGS, we can pass the sysroot include directory to perf to
>>>> provide slang.h rather than hardcoded host dir in perf's Makefile.
>>>>
>>>> Pass WERROR=0 to perf's Makefile to avoid warnings being treated
>>>> as errors. Warnings are not fatal, and while they will be fixed in the
>>>> future, there's no need for them to break the build.
>>>
>>> No mention of the additional slang dependency is made here?
>>>
>>
>> Forgot mentioned it. Good catch, but the one line change that add
>> slang to DEPENDS seems clear enough for everyone, isn't? :)
>
> Nope, the patch header declares the intent of the patch.

I think the point that Liang is trying to make is that the contents of
the patch
are trying to fix a problem in perf, and that he'd prefer to focus on
the technical
issues in the body of the patch, since the header cleanup is simple enough and
something that he's used to doing when dealing with me ;)

We will make sure that the header is correct, and that the important parts are
mentioned.

Cheers,

Bruce

>
> --
> Darren
>
>>
>>>> Signed-off-by: Liang Li <liang.li@windriver.com>
>>>> ---
>>>>  meta/recipes-kernel/perf/perf_3.4.bb | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
>>>> index 505c7b8..537e926 100644
>>>> --- a/meta/recipes-kernel/perf/perf_3.4.bb
>>>> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
>>>> @@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
>>>>             ${MLPREFIX}binutils \
>>>>             ${TUI_DEPENDS} \
>>>>             ${SCRIPTING_DEPENDS} \
>>>> +           slang \
>>>>            "
>>>>
>>>>  SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
>>>> @@ -63,6 +64,8 @@ EXTRA_OEMAKE = \
>>>>             AR="${AR}" \
>>>>             prefix=/usr \
>>>>             NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
>>>> +           WERROR=0 \
>>>> +           EXTRA_CFLAGS=-I${STAGING_INCDIR} \
>>>>             '
>>>
>>> This is is not acceptable since the include directory /usr/include/slang
>>> is still being looked at and this just "hides" the error. STAGING_INCDIR
>>> is on the compilers default search path anyway.
>>
>> EXTRA_CFLAGS is processed early than the '-I/usr/include/slang', so
>> its being used here, to specify a path for slang.h. That indeed
>> 'hides' -I/usr/include/slang. And I agree that specify
>> -I/usr/include/slang blindly in Makefile should be fixed. And I've
>> discussed the fix for kernel tree several days before. However, the
>> fix for kernel tree will not conflict than this patch, I would think
>> that this patch for perf.bb would fix the issue for us for now, and
>> smooth the adoption of future fix for the Makefile.
>>
>>>
>>> So this patch is wrong in several different ways :(
>>>
>>
>> ... I can't reproduce the 'warning -> error' on my host now, but as I
>> explained above, this patch is just 'make use of existing mechanism of
>> Makefile to specify correct location of slang.h before the warning is
>> generated', even though the STAGING_INCDIR is in compilers default
>> search path, seems no hurt in case we just make it float top a bit
>> to get searched before wrong include directory is discovered, right?
>> :)
>>
>>> I've merged a temporary fix until we get this resolved properly.
>>>
>>
>> I saw that, but the fix that we've discussed several days before seems
>> is what we want:
>>
>> diff --git a/tools/perf/Makefile b/tools/perf/Makefile
>> index b7a7a87..3365ad2 100644
>> --- a/tools/perf/Makefile
>> +++ b/tools/perf/Makefile
>> @@ -496,8 +496,10 @@ else
>>               msg := $(warning newt not found, disables TUI support. Please install newt-devel or libnewt-dev);
>>               BASIC_CFLAGS += -DNO_NEWT_SUPPORT
>>       else
>> -             # Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
>> -             BASIC_CFLAGS += -I/usr/include/slang
>> +             # Some releases has /usr/include/slang/slang.h other than /usr/include/slang.h
>> +             SLANG_INC ?= -I/usr/include/slang
>> +             BASIC_CFLAGS += $(SLANG_INC)
>> +
>>               EXTLIBS += -lnewt -lslang
>>               LIB_OBJS += $(OUTPUT)ui/setup.o
>>               LIB_OBJS += $(OUTPUT)ui/browser.o
>>
>> ---
>>
>> Then we still need a patch to perf.bb to specify SLANG_INC. Moreover,
>> this patch(EXTRA_CFLAGS for perf.bb) could co-exists with patch for
>> kernel. :)
>>
>> Thanks,
>>               Liang Li
>>
>>> Cheers,
>>>
>>> Richard
>
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


