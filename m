Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id EFD55736B6;
	Wed, 11 Nov 2015 02:01:48 +0000 (UTC)
Received: by ykba77 with SMTP id a77so27701933ykb.2;
	Tue, 10 Nov 2015 18:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5eyHFJBEgHbTdd7/jgiaBJ/L0k6MD9iUksoClmqGxoE=;
	b=kcUXgFzckh+zvwzO6C4sl3neOJTFfzba4MTvvPT+OjqVtaPxFDzeg6F/YA9nw0gBN6
	V6HifFtFsQm+wEthnYUiZj5kwNJmEKkJgULq0aPMwk2Zmuxmqvd9I2Wg/xkph8UFBgA8
	AG0+ElCkgZJNimAsbwCJxwGP4XNIbgiR66ZZdb0CP5/QmjvIefFxGe+YR4bulNGlBMcH
	DYKI0WzA+DArEnNFe866EYDhb9c/5u8AhrM0+SSM5qMiWtk94YN7pduSOFg1TDQ0SAcO
	DFPJ4v4Z8f4jFfU/lRmJoqaTSd+O1/rmEQrS8wPLpFREdcph1ZKFHdFnTEiQs+X2iFtg
	hPBw==
MIME-Version: 1.0
X-Received: by 10.13.216.75 with SMTP id a72mr6443546ywe.312.1447207308724;
	Tue, 10 Nov 2015 18:01:48 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 10 Nov 2015 18:01:48 -0800 (PST)
In-Reply-To: <E48EA04B-494B-4D42-999B-A99E70ED7A0C@gmail.com>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
	<20151014193033.GD3552@dent.vctlabs.com>
	<CADkTA4MMRESA2E2H_0iruywU6AgzSwaZ8Sj03SBB25=ckGv41Q@mail.gmail.com>
	<E48EA04B-494B-4D42-999B-A99E70ED7A0C@gmail.com>
Date: Tue, 10 Nov 2015 21:01:48 -0500
Message-ID: <CADkTA4OWFTjTnHU7G0cgMeHosU6TvUOLz4xqK5RSJNHtajxX-w@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Nov 2015 02:01:51 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 10, 2015 at 4:33 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 14.10.2015 um 21:48 schrieb Bruce Ashfield <bruce.ashfield@gmail.com>:
>>
>> On Wed, Oct 14, 2015 at 3:30 PM, S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>>> http://patchwork.openembedded.org/patch/99875/
>>>
>>> Apparently this patch is still not in master, and I just ran across the
>>> problem with an externally built module (omaplfb from omap3-sgx-modules)
>>> in meta-ti layer.
>>>
>>> What's the plan for getting a correct Module.symver into shared_workdir
>>> for external modules to build against? Above patch, or does someone have
>>> an even better idea?
>>
>> Richard and I sync'd on this while in Dublin @ ELCe, and the changes
>> aren't missing
>> from master by mistake .. but more because we are still working to come up with
>> a comprehensive solution (tracked in bugzilla).
>>
>> The solution is pretty much what I described before, we are balancing
>> applications
>> and tasks that do not need kernel modules to be built, versus external modules
>> that depend on symbols from other modules. The devil is in the
>> details, and getting
>> a non-racy, task locked solution that allows the recipe writer to
>> explicitly decide
>> whether they need modules built or not .. attempts at detecting the
>> need, or forcing
>> a one size fits all solution have all lead to dead ends.
>>
>> Since we are close to a release point, I'm still working on this out
>> of the tree, and
>> will propose some changes when the tree looks stable.
>>
>> For now, you can carry the patch locally, or you can append to the kernel module
>> compilation task and do a second copy of the symvers file to the share
>> directory.
>>
>> i.e. a variant of this:
>> http://patchwork.openembedded.org/patch/94891/, done in a
>> bbappend versus the class.
>>
>> Cheers,
>>
>> Bruce
>
> This is kind of insane to try a fix duplicating a job in a probably wrong way
> (even a tiny) because of performance issue.

I have a fix already queued for this, but I'm currently out of the office ..
I swear, every time I go on vacation, someone brings this up.

I've been waiting for the smoke to clear on the 2.0 release before
posting it .. so please, just a bit more patience and I'll send out
that series.

>
> Any 3rd party kernel module depends on do_shared_workdir - so do_shared_workdir
> must wait for do_compile_kernelmodules - that's it by design (build is done
> relying on dependencies ordered in a directed, noncyclical graph.
>
> Since compile_kernelmodules is between compile and strip, I vote for
>
> $ git diff
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 5e8b6cf..49d7561 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -253,7 +253,7 @@ kernel_do_install() {
>  }
>  do_install[prefuncs] += "package_get_auto_pr"
>
> -addtask shared_workdir after do_compile before do_compile_kernelmodules
> +addtask shared_workdir after do_compile_kernelmodules before do_strip
>  addtask shared_workdir_setscene
>
>  do_shared_workdir_setscene () {
>
> But that's surely kind of smell, whether before do_strip and do_install is
> preferred. Mandatory is, that do_shared_workdir must not be processed before
> do_compile_kernelmodules finishes.
>
> There is no way to avoid it, and if those 5 seconds slow down your build,
> there is probably another thing which should be fixed.

It's not 5 seconds. It is much more on some machines and configurations.

The point is that not everyone who is building modules depends on
other modules and not everyone that is building against the kernel
may even want modules built.

The fix is to just re-copy the symbols after kernel modules are
built, and put the onus on the recipe writer to depend on the
right task/variant. By default, do_shared_workdir won't have that
dependency, but anyone with a recipe that does depend on other
module symbols will get that extra copy and dependency created.

Bruce

>
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

