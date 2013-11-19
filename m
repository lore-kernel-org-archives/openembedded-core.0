Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id BE5AA6CC8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 22:37:12 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id ep20so6525827lab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 14:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qqegH/SC8wcioDc7I1wnutJwtulu03J3NiT0TugyZDE=;
	b=LYLjZiX4SNuxmRg0KycnbmceiSDYzMImn1c2Bxat5eB5WxTQ+L49yANrSWIb2EzkZ6
	xcpxzEEHxcpErxWcSDiftdAReSj5MDp8BP4X+YZY03L515/aCN/Ify01hkfgiFug0pXO
	/dTClMg/tFEd2RW2L7FXAYh4wbjiL2lxNZ9Svi5WdD6aH0dfed6ZoeIab1Pa6qLQO1eK
	ovCm1nDlMOPSi91rCHNKzYc5grGIW4e/x93QBOTyHCwrvAKKEYLUIPq6ovouyanBVZEq
	zEh0HrCTODXzcwl1kvC7g5lDNK8/hZkWaeEH7BT/ZMlbhBi3pQ/mMndlQBDJ8PFa8Dla
	SK9A==
MIME-Version: 1.0
X-Received: by 10.112.205.164 with SMTP id lh4mr19371727lbc.15.1384900632723; 
	Tue, 19 Nov 2013 14:37:12 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Tue, 19 Nov 2013 14:37:12 -0800 (PST)
In-Reply-To: <5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
	<CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
	<CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
	<5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
Date: Tue, 19 Nov 2013 17:37:12 -0500
Message-ID: <CADkTA4ODwRaRMVehxmjjoA=iozbH2LhBKqiHyNLwvB_9n_D_mg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Tue, 19 Nov 2013 22:37:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 19, 2013 at 5:29 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Nov 19, 2013, at 10:17 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>> Adding Khem.
>>
>> Khem .. see below.
>>
>> On Tue, Nov 19, 2013 at 12:54 PM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>> On Tue, Nov 19, 2013 at 12:46 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>> On Tue, 2013-11-19 at 17:37 +0000, Mike Crowe wrote:
>>>>> On Tuesday 08 October 2013 at 17:12:54 -0400, Bruce Ashfield wrote:
>>>>>> When building against the sysroot, out of tree modules can require modpost
>>>>>> and other utilities normally found in the kernel's scripts directory. For
>>>>>> the kernel source in the staging dir, these scripts have been removed to
>>>>>> avoid mixing archiectures when packaging kernel-dev (among other things).
>>>>>>
>>>>>> Rather than further complicate the kernel's install rule, or its packaging,
>>>>>> we can restore the scripts by building them in the kernel staging directory
>>>>>> after the sstate is installed, making them available to packages that need them.
>>>>>>
>>>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>>>> ---
>>>>>> meta/classes/kernel.bbclass | 11 +++++++++++
>>>>>> 1 file changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>>>> index 4acfb7e..d5fa801 100644
>>>>>> --- a/meta/classes/kernel.bbclass
>>>>>> +++ b/meta/classes/kernel.bbclass
>>>>>> @@ -292,6 +292,17 @@ kernel_do_install() {
>>>>>> }
>>>>>> do_install[prefuncs] += "package_get_auto_pr"
>>>>>>
>>>>>> +
>>>>>> +SSTATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
>>>>>> +kernelscripts_sstate_postinst () {
>>>>>> +   if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
>>>>>> +           (
>>>>>> +             cd ${STAGING_KERNEL_DIR}
>>>>>> +             oe_runmake scripts
>>>>>> +           )
>>>>>> +   fi
>>>>>> +}
>>>>>> +
>>>>>> sysroot_stage_all_append() {
>>>>>>    sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>>>>>> }
>>>>>
>>>>> This sstate_postinst fails for me when the compiler isn't already present
>>>>> in the sysroot.
>>>>>
>>>>> Also, I notice that the environment and parameters passed to oe_runmake are
>>>>> not the same as those used by kernel_do_compile etc.
>>>>
>>>> Also note that module.bbclass already does "make scripts" before
>>>> do_compile() so out-of-tree modules should already have access to all
>>>> the files that they need.
>>>
>>> Ah, but they didn't. Otherwise we wouldn't have mucked about in the routines.
>>> Khem was building out of the sysroot and the support scripts weren't present,
>>> something which we were able to consistently reproduce.
>>>
>>> Perhaps the whole problem was just a misordering of the tasks. I'll take another
>>> look.
>>>
>>> But yes, we need one way or the other .. not both. I'd prefer to not fiddle with
>>> sstate, so I'll go back and see why the module.bbclass code wasn't working
>>> for the reported error.
>>
>> Khem: I wasn't working from a bugzilla when making these changes, so I
>> can't find your original reproducer for the missing recordmcount script.
>>
>> Do you recall what it was ? I'm revisiting this and would like to understand
>> why the make scripts in module-base.bbclass wasn't properly restoring
>> the support scripts for your build.
>>
>> I'm leaning towards reverting the whole mess, but without the reproducing
>> case, I can't be sure that I'm not breaking you again.
>
> Well reproducer case is that build from sstate but such that an external module needs to be rebuilt
> if external module also comes from sstate then it all is fine. Its only when everything is coming from
> sstate except this external module which needs to be rebuilt then you see this problem.
>

Right.

> now, I see the code in module-base.class
>
> #
> # Ensure the hostprogs are available for module compilation. Modules that
> # inherit this recipe and override do_compile() should be sure to call
> # do_make_scripts() or ensure the scripts are built independently.
> #
> do_make_scripts() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>                    -C ${STAGING_KERNEL_DIR} scripts
> }
>
> so it expects that, do_make_scripts is explicitly called by external module recipes
>

Exactly. And I had windriver bug with the same symptoms as yours. It
was a package
that built its own modules, and hence never called this either.

> and my recipes did override module_do_compile task but not do_compile like below
>
> module_do_compile() {
>         oe_runmake
> }
>
> so, is comment wrong there should it say module_do_compile instead ?
>
> will it work with sstate always ?
>
> it will be OK to revert it if thats the case.

I'll come up with something that works in all cases. The sstate fix is
better from the point
of view that it is transparent to the recipes, and they don't need to
do anything special
for the support.

So my proposal is this:

 - fix the new bug at hand by making the sstate change depend on the
toolchain (I agree
   that patching the scripts to not reference the target toolchain
isn't a good idea since not
  all kernels get the rix).

 - remove the modules-base.bbclass scripts recreation, so we only have
one scripts
   restore in the tree.

Alternatively, recipes need to be fixed to call the
modules-base.bbclass routine to restore
scripts, and I think it is obvious that won't work in all cases.

I'll wait for comments/concensus before sending a new patch (which
needs to be tested
on all the cases), but in the meantime, the patches to the list to fix
the sstate solution
are good to be applied.

Cheers,

Bruce

>
>>
>> Bruce
>>
>>>
>>> Bruce
>>>
>>>
>>>>
>>>> If we're going to make a policy decision that the kernel is responsible
>>>> for making scripts then I guess that's fine (modulo the implementation
>>>> problems that Mike describes) but in that case the code in
>>>> module{-base}.bbclass is redundant and ought to be removed.
>>>>
>>>> p.
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

