Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6B20D77025;
	Wed, 11 Nov 2015 12:49:28 +0000 (UTC)
Received: by ykdv3 with SMTP id v3so46231818ykd.0;
	Wed, 11 Nov 2015 04:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ppf6n8GRPBJ6aJ99oV6WNhRFcsAtKuMsRmig6bxAQ5E=;
	b=JBlv/DlGXrXIvjnPdHdMjlH6Y44a21dBN0UceF+BIe1aR3HlHvZB76jIXybzqSBeWZ
	VEmvaWQ8HS8KWo2MJi1pHcj8TTbnWGs2YXsSjYEjSOMVTSwZ0GNlH2Zu9jdcwdOTatHd
	jfxgpS2d93M9S0bBP273NLEiDzimTQa4DKw/ErxXrMMOpxuno88IfUZsEKbR1LkoNM4d
	kyzrs6b8ZW9/odLyzMji/qiD9AS+OBfYr3NocLaMA0sJ9VkUfG5lVLndKWP7yx3VwXHR
	5PnQ/XALFVyumLQYvDZ3A4w2XOFLDEdAo49NT+u6Qo+766bn/JYsbo595YRnUgJwPq8v
	ZGOg==
MIME-Version: 1.0
X-Received: by 10.13.215.87 with SMTP id z84mr10026479ywd.304.1447246169159;
	Wed, 11 Nov 2015 04:49:29 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Wed, 11 Nov 2015 04:49:29 -0800 (PST)
In-Reply-To: <A9347ED0-D839-4DD8-B710-52432690DA43@gmail.com>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
	<20151014193033.GD3552@dent.vctlabs.com>
	<CADkTA4MMRESA2E2H_0iruywU6AgzSwaZ8Sj03SBB25=ckGv41Q@mail.gmail.com>
	<E48EA04B-494B-4D42-999B-A99E70ED7A0C@gmail.com>
	<CADkTA4OWFTjTnHU7G0cgMeHosU6TvUOLz4xqK5RSJNHtajxX-w@mail.gmail.com>
	<A9347ED0-D839-4DD8-B710-52432690DA43@gmail.com>
Date: Wed, 11 Nov 2015 07:49:29 -0500
Message-ID: <CADkTA4Mx1uYVia7A76b0sbE7me2ALUDy=9sgBa9Yjh5Umxdx1Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [oe] kernel.bbclass: Fix do_shared_workdir task ordering
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
X-List-Received-Date: Wed, 11 Nov 2015 12:49:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 11, 2015 at 4:00 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 11.11.2015 um 03:01 schrieb Bruce Ashfield <bruce.ashfield@gmail.com>:
>>
>> On Tue, Nov 10, 2015 at 4:33 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>
>>>> Am 14.10.2015 um 21:48 schrieb Bruce Ashfield <bruce.ashfield@gmail.com>:
>>>>
>>>> On Wed, Oct 14, 2015 at 3:30 PM, S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>>>>> http://patchwork.openembedded.org/patch/99875/
>>>>>
>>>>> Apparently this patch is still not in master, and I just ran across the
>>>>> problem with an externally built module (omaplfb from omap3-sgx-modules)
>>>>> in meta-ti layer.
>>>>>
>>>>> What's the plan for getting a correct Module.symver into shared_workdir
>>>>> for external modules to build against? Above patch, or does someone have
>>>>> an even better idea?
>>>>
>>>> Richard and I sync'd on this while in Dublin @ ELCe, and the changes
>>>> aren't missing
>>>> from master by mistake .. but more because we are still working to come up with
>>>> a comprehensive solution (tracked in bugzilla).
>>>>
>>>> The solution is pretty much what I described before, we are balancing
>>>> applications
>>>> and tasks that do not need kernel modules to be built, versus external modules
>>>> that depend on symbols from other modules. The devil is in the
>>>> details, and getting
>>>> a non-racy, task locked solution that allows the recipe writer to
>>>> explicitly decide
>>>> whether they need modules built or not .. attempts at detecting the
>>>> need, or forcing
>>>> a one size fits all solution have all lead to dead ends.
>>>>
>>>> Since we are close to a release point, I'm still working on this out
>>>> of the tree, and
>>>> will propose some changes when the tree looks stable.
>>>>
>>>> For now, you can carry the patch locally, or you can append to the kernel module
>>>> compilation task and do a second copy of the symvers file to the share
>>>> directory.
>>>>
>>>> i.e. a variant of this:
>>>> http://patchwork.openembedded.org/patch/94891/, done in a
>>>> bbappend versus the class.
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>
>>> This is kind of insane to try a fix duplicating a job in a probably wrong way
>>> (even a tiny) because of performance issue.
>>
>> I have a fix already queued for this,
>
> I've seen the fix you referred at http://patchwork.openembedded.org/patch/94891/,
> this is broken.

No that isn't it. But also, no, that isn't broken. It works, but there is a
potential for a race, which is what we've been fixing.

Can you elaborate on why you'd declare that broken ?

>
>> but I'm currently out of the office ..
>> I swear, every time I go on vacation, someone brings this up.
>>
>> I've been waiting for the smoke to clear on the 2.0 release before
>> posting it .. so please, just a bit more patience and I'll send out
>> that series.
>
> Maybe giving us an impression whether it's correct or just work for you(tm) :P

For everyone. Richard wouldn't exactly take my series and kernel
updates if they were only just for me. :)

>
>>> Any 3rd party kernel module depends on do_shared_workdir - so do_shared_workdir
>>> must wait for do_compile_kernelmodules - that's it by design (build is done
>>> relying on dependencies ordered in a directed, noncyclical graph.
>>>
>>> Since compile_kernelmodules is between compile and strip, I vote for
>>>
>>> $ git diff
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 5e8b6cf..49d7561 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -253,7 +253,7 @@ kernel_do_install() {
>>> }
>>> do_install[prefuncs] += "package_get_auto_pr"
>>>
>>> -addtask shared_workdir after do_compile before do_compile_kernelmodules
>>> +addtask shared_workdir after do_compile_kernelmodules before do_strip
>>> addtask shared_workdir_setscene
>>>
>>> do_shared_workdir_setscene () {
>>>
>>> But that's surely kind of smell, whether before do_strip and do_install is
>>> preferred. Mandatory is, that do_shared_workdir must not be processed before
>>> do_compile_kernelmodules finishes.
>>>
>>> There is no way to avoid it, and if those 5 seconds slow down your build,
>>> there is probably another thing which should be fixed.
>>
>> It's not 5 seconds. It is much more on some machines and configurations.
>
> Depends on your build machine and much more, your sstate cache,
> changes to kernel and why you do a full build after each kernel
> change instead of just deploying the kernel.

Sure. I've been at this for years now .. and I've seen and used lots
of configs. We are trying to give a choice on what level of building
triggers.

>
>> The point is that not everyone who is building modules depends on
>> other modules and not everyone that is building against the kernel
>> may even want modules built.
>
> That's only build time. How often do you recompile your kernel that
> this dependency really matters?

I rebuild the kernel a lot .. I'm doing kernel and kernel tools maintenance
after all :)

>
>> The fix is to just re-copy the symbols after kernel modules are
>> built, and put the onus on the recipe writer to depend on the
>> right task/variant. By default, do_shared_workdir won't have that
>> dependency, but anyone with a recipe that does depend on other
>> module symbols will get that extra copy and dependency created.
>
> This is simply wrong, period. Because (I already explained that)
> module-base.bbclass adds a configure-stage dependency to do_shared_workdir.
>

And I explained that I didn't need that explanation.

There's really no need to escalate your language. It isn't needed.

> You can avoid the mistake by adding a sane stage for redo_shared_workdir
> after do_compile_kernelmodules before do_strip and reassign the 3rd
> party module bbclass to depend on redo_shared_workdir.
>
> OTOH I think, build performance isn't worth a however sophisticated
> fragile patch. Let's apply Stefan's patch and be my guest for sending
> an performance optimized one when you figured it out.
>
> @Richard - isn't it worth use the correct, even if slow, patch and
> let Bruce anytime in not to distant future provide an optimized one
> which can be settled and backported for 2.0.1?
>
> Isn't release time soon enough?
>
> @Stefan - would you agree to "addtask shared_workdir after do_compile_kernelmodules before do_strip"
> instead of "addtask shared_workdir after do_compile_kernelmodules before do_install"?
>

I'm checking out of the conversation, since I'm on vacation and shouldn't
be near a computer.

I indicated months ago that RP has the final say, and he can merge any
variants of the patches he wants, since they don't break anything and
fix the problem.

RP: I'll ack either patch that has been posted. I'll will revisit all of this
when I'm working on my 2.1 kernel packaging changes anyway, so
there's no need to wait.

Cheers,

Bruce


> Best regards
> --
> Jens Rehsack - rehsack@gmail.com
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

