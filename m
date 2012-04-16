Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJo24-0008O6-4e
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 17:40:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3GFUYIn007170
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 08:30:34 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 16 Apr 2012 08:30:33 -0700
Message-ID: <4F8C3B19.40400@windriver.com>
Date: Mon, 16 Apr 2012 10:30:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4F847380.6000401@windriver.com>
	<4F8489DE.1050905@opendreambox.org>
	<4F8C24CB.3080607@opendreambox.org> <1334587325.616.4.camel@ted>
	<4F8C379A.3070903@opendreambox.org>
In-Reply-To: <4F8C379A.3070903@opendreambox.org>
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
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
X-List-Received-Date: Mon, 16 Apr 2012 15:40:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/12 10:15 AM, Andreas Oberritter wrote:
> On 16.04.2012 16:42, Richard Purdie wrote:
>> On Mon, 2012-04-16 at 15:55 +0200, Andreas Oberritter wrote:
>>> On 10.04.2012 21:28, Andreas Oberritter wrote:
>>>> On 10.04.2012 19:53, Mark Hatle wrote:
>>>>> We still do not have a clean answer for how to resolve the concerns in
>>>>> the recent thread "conf/machine/include: Cleanup MIPS tunings to match
>>>>> README".  The following is in response to a request I received to
>>>>> summarize the discussion so far, and include the options to resolve the
>>>>> issue for the current OE-Core release.
>>>>>
>>>>> If you are interested in this, please be sure to read until the end
>>>>> before commenting.
>>>>>
>>>>> Background:
>>>>>
>>>>> About 2 weeks ago, in response to a number of patches sent for PowerPC
>>>>> issues, I set to the task of documenting and cleaning up the various
>>>>> tune files.  It was discovered that since they were originally
>>>>> implemented, a number of minor conflicts and defects had crept into the
>>>>> system.  The recent patch set added a number of README files and
>>>>> attempted to resolve any duplication, or confusion between items.
>>>>>
>>>>> During this work it was discovered that there were two tunings that
>>>>> produced the same package architecture:
>>>>>
>>>>> mips (tune), optimized for mips1 - o32 ABI, produced packages with a
>>>>> "mips" arch
>>>>>
>>>>> mips32 (tune), optimized for mips32 - o32 ABI, produced packages also
>>>>> with a "mips" arch.
>>>>>
>>>>> While "mips1" should work on a "mips32" system, the reverse is not
>>>>> true.  There was no way to distinguish, in a package feed, the
>>>>> difference between the two sets of binaries.
>>>>>
>>>>> I updated the MIPS tune files to resolve this issue.  The result was:
>>>>>
>>>>> mips (tune), mips1 - o32 ABI, produced packages with a "mips" arch
>>>>>
>>>>> mips32 (tune), mips32 - o32 ABI, produced packages with a "mips32" arch
>>>>>
>>>>> This lead to the thread mentioned above.  At first there were concerns
>>>>> that the GNU target arch had changed (from mips to mips32), this was not
>>>>> the case.  The only change is in the produced package arch names.  So
>>>>> the package feeds and image generation are the only components affected
>>>>> by this change.
>>>>>
>>>>> After various discussion with folks, such as Khem Raj, it is unlikely
>>>>> that anyone would be using oe-core with a "mips1" target.  There may be
>>>>> some mips3 or mips4 targets, but we find it highly unlikely based on our
>>>>> current experience. Khem suggested resolving this my simply making the
>>>>> "mips" include mips32 as the default optimization.
>>>>>
>>>>> Image generation was verified to produce the same images before and
>>>>> after this change for the qemumips target.  I am unable to verify the
>>>>> package feeds, as I do not have a suitable setup for this.
>>>>>
>>>>> So possible solutions to this particular issue, which we do need on
>>>>> prior to the upcoming release:
>>>>>
>>>>> 1) Revert the behavior and match that last release.  We have two tunes
>>>>> that produce different binaries w/ the same "mips" package arch.
>>>>>     * This preserves previous behavior, but IMHO continues to implement
>>>>> the defect
>>>>>
>>>>> mips (tune) - mips1 processor, o32 ABI - mips package arch
>>>>> mips32 (tune) - mips32 processor, o32 ABI - mips package arch
>>>>>
>>>>> 2) Keep it as it is currently checked in.  Provide the ability to build
>>>>> a basic "mips" and a more optimized "mips32" tuned target and package set.
>>>>>     * This fixes the defect and provides the opportunity for "mips" to be
>>>>> a basic common package arch, while mips32 (or additional mips3? mips4?
>>>>> mips32r2?) tunes could be used to augment this for specific systems.
>>>>>
>>>>> mips (tune) - mips1 processor, o32 ABI - mips package arch
>>>>> mips32 (tune) - mips32 processor, o32 ABI - mips32 package arch
>>>>
>>>> If the tune should reflect the optimization, then mips should be renamed
>>>> to mips1 and specified explicitly using -march=mips1, in order to
>>>> protect against changing defaults when using a newer compiler. However,
>>>> as Phil pointed out, there are many more optimization settings, e.g. -O2
>>>> vs. -Os, that aren't encoded into the package arch, so the goal to have
>>>> distinct package archs for different binaries won't be reached.
>>>>
>>>> I don't see what a common "mips" package arch would give us. Within OE,
>>>> you'd usually compile all your applications for the package arch of your
>>>> target system. Adding compatible package archs to the feed just
>>>> increases the complexity of online updates.
>>>>
>>>>> 3) Define only one mips tune, with a target package arch of "mips".
>>>>> Changing the basic mips tune, and corresponding mips package arch to
>>>>> include mips32 optimizations and instructions.
>>>>>     * This preserves the "mips" tune, but changes the behavior of the
>>>>> tune from default compiler, to mips32 optimization
>>>>>     * Anyone requiring mips3 or mips4 will need to add a tune, and that
>>>>> tune will not be compatible with "mips"
>>>>
>>>> Also, mips1 could be added back anytime if anybody starts using it.
>>>>
>>>>> mips (tune) - mips32 processor, o32 ABI - mips package arch
>>>>>
>>>>>    3a) Preserve the mips32 tune entries, but define it as being equal to
>>>>> mips
>>>>>        * Preserves the tune entries for compatibility, but is anyone
>>>>> directly using them?
>>>>>
>>>>>    3b) Remove the mips32 tune entries -- effectively eliminating mips32
>>>>> as a tune
>>>>>        * Removes the tune entries (cleans up the tunes), no compatibility
>>>>> -- but it's unlikely anyone was directly specifying "mips32" as their
>>>>> machine's DEFAULTTUNE.
>>>>
>>>> Actually I have (had) machines specifying mips32el and mips32el-nf as
>>>> their DEFAULTTUNEs, which your first patch, that got applied upstream,
>>>> broke. But I've already switched to use your latest patch using mipsel
>>>> and mipsel-nf instead, (which I prefer over the former).
>>>>
>>>>> My recommendation is either 2 or 3.  The 3a/b variation is simply an
>>>>> implementation detail to me, and I will be happy to implement it either
>>>>> way if this is the chosen direction.
>>>>
>>>> I'm fine with either way that restores mips/mipsel for mips32 targets
>>>> *before the release*, because the online update feeds broke and all
>>>> packages had to be built again from scratch.
>>>
>>> Richard, can you please state your opinion about this issue?
>>>
>>> The mips package feed (e.g. qemumips) is now broken since weeks. Can I
>>> expect this to be corrected before the release, or should anybody
>>> relying on mipsel package feeds stop using oe-core's
>>> meta/conf/machine/include/mips/arch-mips.inc?
>>
>> Sorry, I got distracted by a ton of other issues. I think the cleanup
>> did make sense and things are more correct now, its just a shame about
>> the package feed naming issue.
>>
>> There comes a point we need to try and clean up some of these things so
>> my proposal would be that people who don't want to use the new naming
>> set the following in their distro config:
>>
>> MIPSPKGSFX_VARIANT_tune-mips32el = "mipsel"
>>
>> and then should still be able to use the arch-mips.inc from OE-Core.
>> Does that work for people?
>
> I wonder why this point has to be during the stabilisation phase before
> the release, considering much less intrusive changes are not getting
> applied.

This was a bug.  That is why it was "fixed".  I agree there is argument if this 
fix is acceptable or not, but it was a fix to a bug.  We never should have been 
generating two tunings with different run-time characteristics on MIPS, with the 
same package arch.

> Setting this variable is a partial workaround. PACKAGE_EXTRA_ARCHS also
> broke for tune-mips32.inc, so this has to be set, too. The easiest thing
> for everybody would however be to revert "Cleanup MIPS tunings to match
> README" and to drop tune-mips, which was unused.

Setting it to mips/mipsel should work as the PACKAGE_EXTRA_ARCHS in mips32 
should already have "mips" or "mipsel" in them.

I would expect this would be a reasonable upgrade path as existing systems know 
only "mips".. so we rebuild with the custom "mips" setting, adding in the 
compatible extra_archs.. (hopefully adjusting the any feed management mechanisms 
at the same time)..  And then for the "next" release the mips32 goes on line, 
and the system already knows it's compatible.  [or the manual mips change 
suggested stays.]

> Maybe I would have understood why the patch "Cleanup MIPS tunings to
> match README" was applied, if the README hadn't been created just the
> same day. Usually the README should describe how something works and not
> serve as an artificial reason to break things.

The README was created in response to bugs on other architectures, primarily 
PPC.  People adding tunings (or fixing bugs in tunings) were not understanding 
what the various components of the tunes were for.  The main README was added to 
document the primary tuning settings and how they interact with the system, 
while the ARCH specific READMEs were added to add any architecture specific 
information.  These documents and changes were not intended to change behavior, 
but simply document existing and expected behaviors.  Any associated changes 
were done to sync up the tune files with those README files.

> If the overall conclusion is that optimisation settings should be
> encoded in the package architecture, I still wonder why -Os and -O2
> aren't encoded or why tune-mips still creates 'mips' and not 'mips1'
> packages.

I personally see -Os, -O2, etc are distribution settings and not processor 
related optimization settings.  In short I see the following situations:

ABI
Instruction Set
Process specific instruction set ordering
Local compiler optimizations

The first two -have- to be captured, I prefer adding the third as well.  The 
fourth becomes distribution and package centric.  It also may affect performance 
of a given app, but it will still run and be compatible.  (The third one is a 
bit tricky, processor instruction ordering can very well work around hardware 
bugs as well as provide runtime performance optimizations.  I've worked on many 
platforms over the years that instruction ordering was the "correct" workaround 
to a hardware bug.)

(On the ARM architecture I'm going to push for the same thing, but it's 
recognized that currently they expect only the first and second items to be 
captured in the package arch.)

> So, inconsistent but deployed code has been replaced by inconsistent but
> new code. And there's no time left to improve the new inconsistent code
> so short before the release, I guess.

Deployed code from 2011-1 does not change.  This change is wholly inappropriate 
to be applied to former releases.  The "next" release will contain this code.

Anything between the last stable release and the next (pending) release was 
in-progress development.  I understand that semantics changed for MIPS32 at the 
last minute, but I would have suggested/made the same change at the beginning on 
the release or in 2011-1 if I had known the problem existed.

> Sorry for the rant.

I do understand your frustration.  I hope we don't go through this again with 
anything.. but the tunings are in a much better position for the future now that 
I believe everything is consistent between packages of the same architecture.

--Mark

> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



