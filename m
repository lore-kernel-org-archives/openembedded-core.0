Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id EC7737571F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jun 2015 20:30:04 +0000 (UTC)
Received: by ykfr66 with SMTP id r66so44442828ykf.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jun 2015 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=E0kkXx3IdxnfrfGqE0CphMFpqqkTmBjDjbMXPiV9Ahc=;
	b=p5igvhgw1wj3cL2iVamd9iH/Q5pflpKTe3awrkOnmh9J4ZsFXeOcdoG3FgystXCTrr
	GUDPw8pLxIppN5L0YaqbPI6xdehBUr0/LLxmKMcuKPy1Szu0fMEUoCuUP7gQN8jYhX4I
	i+hZPqRA65krVovho+p5uxuCxgJsKTjoTpY/IbGzz1/xQtYPpVN9WXy0aAP7TjDCa1Ii
	qif7R+RxT7L1bY+MOdJlM6zIoJfRfpSwAH64BrKaC9P5X91xQfWOoEBIMc1FxlcT/DUJ
	tMI0lWplc4Ow3iYnI2I5tpEEUlXV3qaXzjbeIejhJR5BgQKkE1MCVOjPr/9maqOi0FIC
	TCvQ==
MIME-Version: 1.0
X-Received: by 10.170.55.143 with SMTP id 137mr14884488ykx.16.1433709005088;
	Sun, 07 Jun 2015 13:30:05 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Sun, 7 Jun 2015 13:30:05 -0700 (PDT)
In-Reply-To: <1433544787.28975.48.camel@linuxfoundation.org>
References: <20150605171815.GA20636@windriver.com>
	<1433544787.28975.48.camel@linuxfoundation.org>
Date: Sun, 7 Jun 2015 16:30:05 -0400
Message-ID: <CADkTA4N3qYx5=7NZ69_dvV-2aoqX-sg49U25bWVhQ6K3EZ66sg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] External modules fail to load due to unknown symbols
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
X-List-Received-Date: Sun, 07 Jun 2015 20:30:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 5, 2015 at 6:53 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2015-06-05 at 13:18 -0400, Amy Fong wrote:
>> From da12fa5e6daca0c0b7bb15df030b1c79fbefa089 Mon Sep 17 00:00:00 2001
>> From: Amy Fong <amy.fong@windriver.com>
>> Date: Mon, 1 Jun 2015 13:16:20 -0400
>> Subject: [PATCH] External modules fail to load due to unknown symbols
>>
>> When building external kernel modules, a failure can happen
>> when the module has dependencies on other kernel modules.
>> In such cases, the build looks at Module.symvers to do
>> symbol lookups of the other kernel modules that it depends on.
>>
>> Module.symvers gets copied by do_shared_workdir
>> after do_compile and Module.symvers gets updated during
>> do_compile_kernelmodules.
>>
>> do_compile_kernelmodules is modified to explicitly copy Module.symvers
>> to the shared workdir.
>>
>> Signed-off-by: Amy Fong <amy.fong@windriver.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/classes/kernel.bbclass | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 4f22cde..4a177b1 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -215,6 +215,14 @@ do_compile_kernelmodules() {
>>       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>>       if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>>               oe_runmake ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>> +
>> +             # Module.symvers gets updated during the
>> +             # building of the kernel modules. We need to
>> +             # update this in the shared workdir since some
>> +             # external kernel modules has a dependency on
>> +             # other kernel modules and will look at this
>> +             # file to do symbol lookups
>> +             cp Module.symvers ${STAGING_KERNEL_BUILDDIR}
>>       else
>>               bbnote "no modules to compile"
>>       fi
>
> Sadly this will give rise to a race. shared_workdir is defined as:
>
> addtask shared_workdir after do_compile before do_compile_kernelmodule
>
> and other modules depend on the shared_workdir task. Your other modules
> could therefore compile before the code in compile_kernelmodule has run.
>
> At a guess you will next suggest we change shared_workdir to be after
> compile_kernelmodules. The problem there is one of performance. We had
> bug reports from the community and Wind River people about the fact that
> shared_workdir executes when building kernel modules and doesn't come
> from sstate. Forcing shared_workdir to run more tasks every time isn't
> going to make people happy either :(

:) Actually no, we wouldn't suggest the above, since I already talked Amy out
of a similar patch.

In this case, I was shooting for it to at least be correct, in such that the
symbol file was copied out after the modules built .. and then the plan
was to simply put the rest of the responsibility onto the recipe maintainer.
If they know they depend on symbols from other modules, depend on
do_compile_kernelmodules .. otherwise, the default dependency kicks in
and keeps things sane.

But if we still have a race between the modules building and the copy out,
then we aren't any further ahead.

Bruce

>
> So I'm not sure how we solve this but it is going to need more thought
> and the above patch isn't right.
>
> Cheers,
>
> Richard
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

