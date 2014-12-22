Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE4772533
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 03:38:14 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id p9so3207235lbv.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 19:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ga1M7XeiBD4mUugUqNprjwnCwjxM0OBc8z4BmjtCyEA=;
	b=YPH1DZqk5T2jfbhMqh478Vg/lj5RVxQ5lMn/F69f+HXMUPXYur1lFr3mWDj7Nbb3OV
	qGyNMLbkT0r6onN0+OMpj5dPKU7iBLHIvkI3ue/2Oja53ltoUfkouu5AgQWeOI8GaRen
	71AWDD1fYHz9r2/n6P4Ciy0tIpFRzzI+Aq8vyQeOA80wCsWQFD1lsDp0deag++NEnbJZ
	V3E+RgR7r0vEB3ywuUgsbPcTiRnj7xAa5BBgXgA8Fet0HLM/gOt0M6PzeNKVAIk5uKiG
	39mPtJnkYcB93Am97DJrfJuYC9tbJgCRL8u3jGAuchAoT3t/MCFn6QuTgxunCCAK4SlA
	Q1Pg==
MIME-Version: 1.0
X-Received: by 10.152.238.1 with SMTP id vg1mr19995391lac.83.1419219494613;
	Sun, 21 Dec 2014 19:38:14 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Sun, 21 Dec 2014 19:38:14 -0800 (PST)
In-Reply-To: <1419161257.13316.49.camel@linuxfoundation.org>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
	<54942326.8080806@windriver.com>
	<1418994949.13316.16.camel@linuxfoundation.org>
	<1419074109.13316.31.camel@linuxfoundation.org>
	<54959211.9020504@windriver.com>
	<1419115211.13316.47.camel@linuxfoundation.org>
	<54962AAB.9040800@windriver.com>
	<1419161257.13316.49.camel@linuxfoundation.org>
Date: Sun, 21 Dec 2014 23:38:14 -0400
Message-ID: <CADkTA4OqBfqUrubjS_QOtGq5Z3ZugZiw+LMd=P4WpKfrACsPEg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Mon, 22 Dec 2014 03:38:17 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 21, 2014 at 7:27 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2014-12-20 at 21:04 -0500, Bruce Ashfield wrote:
>> On 2014-12-20 5:40 PM, Richard Purdie wrote:
>> > On Sat, 2014-12-20 at 10:13 -0500, Bruce Ashfield wrote:
>> >> On 2014-12-20 6:15 AM, Richard Purdie wrote:
>> >>> So where are we at?
>> >>>
>> >>> Thanks to some great help from Ross, we have a number of patches merged
>> >>> and many of the issues in my last email have been addressed. I'm
>> >>> continuing to struggle with the kernel series. The last build on the
>> >>> autobuilder highlighted that:
>> >>>
>> >>> * there are problems in boot-directdisk.bbclass (have a fix)
>> >>> * there is a do_rootfs/do_package_qa race (have a fix)
>> >>> * the report-error.bbclass tasks could crash (have a fix)
>> >>> * the kernelmodule sanity tests were failing (have a fix)
>> >>> * qemumips gdb is failing to compile, probably due to new kernel
>> >>>     headers (no fix as yet)
>> >>> * systemd sanity QA tests continue to fail on xorg and systemd-login
>> >>>     (no fix as yet)
>> >>> * there are continuing problems with linux-imx from meta-fsl-arm, I
>> >>>     thought these were addressed but clearly not :(
>> >>>
>> >>> Ideally I'd like to take some time off over the holidays but I can't see
>> >>> that happening until the patch queues are under some kind of control :(.
>> >>
>> >> Let me know if there are one of these that you want me to take. I'm all
>> >> for pitching in and getting everyone some down time.
>> >
>> > Looks like I spoke too soon:
>> >
>> > https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/132/steps/BuildImages_1/logs/stdio
>>
>> Amazing how those race conditions pop out on the builders .. I probably
>> built this 100 times, and never managed to trigger these.
>
> We also have one more:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/134/steps/Running%20Sanity%20Tests/logs/stdio
>
> On target module building for ppc fails.
>
>> > which seems to be a race over the kernel source directory. I'm guessing
>> > the file in question is a temporary build artefact of lttng-modules
>> > which was running at the same time? Any way we can avoid temp files in
>> > the kernel source dir?
>>
>> Hmm. The modules should already have their output directory set to their
>> own source (not the kernel), so they really shouldn't be dropping down
>> any temp files.
>>
>> I was only using the cpio method to copy the source since that is what
>> was already being used .. and it is a bit faster. The stat of the
>> files to the pipe is what is catching us here.
>>
>> The question is .. do we really care ? A straight copy of the files wouldn't
>> be so sensitive to this, or we could explicitly exclude then in the
>> existing cpio pipe. That would buy some time to track down what is
>> touching down the tmp file in the kernel build process, and I can't see
>> how the dual use of that staged directory will cause us a problem on
>> the copied kernel source side (we do clean things up before packaging).
>
> Well, I think we need to get to the bottom of this. I made some
> experiments. The best results were from hacking scripts/Kbuild.include
> where these .tmp files get created, I hacked it not to remove them.

back online after a 10 jaunt in the car.

I definitely agree that we needed to understand and fix this .. just that
I would be away from my keyboard for about 24 hours, so putting something
in place for the short term was the thought.

>
> When you do that, it becomes clear that do_make_scripts is the task
> which is causing the problem.
>
> The world has changed since we last visited the scripts problem, we
> could move that task to the main kernel build now and have the modules
> and kernel-devsrc depend on it? The function in module.bbclass would
> then become a placeholder?

We can do that, and it makes sense there. Since both have a dependency
on them being created .. moving it to a single place solves our issue and
I don't see a bad side effect of the move.

Bruce

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

