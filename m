Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 195706E5D0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 02:48:33 +0000 (UTC)
Received: by ykeo23 with SMTP id o23so24779396yke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 19:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oXj8etIGwc3PqGS5IRmw9jGcqbrS9G8OgKJEUlHF4n4=;
	b=Lwkxd9V/LTdRkRHnZgGOK9Oq+u8WurjtoO56D4/TEmrP8bb50SuWTwaUcQ11NJ7Nn/
	PrU6L3dPeVB4EEtlIxMGPWYmkygg1XixfZekXX9yFbC1wVKYipRQsSlaaA86A71urafx
	+FYeUCHLjLvChA9Dhd+BP3aGzfqyUvK8PhFAWrJhyEyuPH77NSfGelnVUTrjrNuVT0Ml
	6tWrB+8RTwe6l+qNf1RGVqWTfGGZHqauOOouDJUC891cTP/dQeGbCMC/J9J6M761H29C
	CfcT9gFEFxLC+eLo03hyQkmy8OX9yM7LN8Dz/npUqphx7OttD08sh4OZCLSBTD3QLW3B
	ycoQ==
MIME-Version: 1.0
X-Received: by 10.13.232.83 with SMTP id r80mr6964157ywe.16.1438742913644;
	Tue, 04 Aug 2015 19:48:33 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Tue, 4 Aug 2015 19:48:33 -0700 (PDT)
In-Reply-To: <CADkTA4MPP3KiV9Nq_wi-_qx26mGEkX+uzXvv4ZXfM0YpMEccKw@mail.gmail.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<55C0E631.7070703@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D46F3@ORSMSX109.amr.corp.intel.com>
	<55C0F729.5000908@windriver.com>
	<CADkTA4MPP3KiV9Nq_wi-_qx26mGEkX+uzXvv4ZXfM0YpMEccKw@mail.gmail.com>
Date: Tue, 4 Aug 2015 23:48:33 -0300
Message-ID: <CADkTA4PchJT4R5tmzeYwOWQLf_4OnuD0KtU08z=Yjf0zfEwM0A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Support for VirtualBox guest additions
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
X-List-Received-Date: Wed, 05 Aug 2015 02:48:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 4, 2015 at 11:43 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Tue, Aug 4, 2015 at 2:32 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 8/4/15 12:25 PM, Bystricky, Juro wrote:
>>> I agree, the name "kernel-headers" may not be the most fortunate, "linux-headers"
>>> is probably more fitting.  The recipe installs the files in a similar fashion that is done by
>>>
>>> apt-get install linux-headers-$(uname -r)
>>>
>>> Typical contents can be viewed for example here:
>>> https://www.archlinux.org/packages/core/i686/linux-headers/
>>>
>>> These files are needed to allow building  of kernel drivers against the running
>>> Linux kernel. In a way, it is a subset of kernel-devsrc, but including
>>>  ".config" file used for the actual running kernel.
>>
>> Again this is part of the purpose of the existing kernel-devsrc package.  So
>> what is missing preventing this from working.  It likely needs to be added to
>> the kernel-devsrc package instead (or a sub package that is created by the
>> kernel-devsrc recipe.)
>
> Peeking in on vacation.
>
> At a minimum, we need to figure out why the existing package wasn't
> able to build the use case in question here .. I've built pretty much everything
> against it at one point .. so I'd like to learn more.
>
> And yes, what we don't need is more sets of rules that copy and package
> parts of the kernel build. We are already doing that in our do_shared_workdir
> and that is pretty much the minimum to build against the kernel. If that
> directory structure needs more for this purpose (or less), then update it.
>
> But we need to do all of this in the existing classes, to keep everything in
> one place, not more recipes that are grabbing chunks of the same source
> tree.

FYI: exiting thoughts are here:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7095

So as you can see, we aren't offended by a 'headers' package, but it has
to make sense with the existing packages, and needs to be generating
from our existing bits of the system.

Cheers,

Bruce

>
> Bruce
>
>
>>
>>> Having these files installed, it is possible  to compile additional
>>> kernel drivers that are not part of the kernel-devsrc .
>>>  VirtualBox compiles some of their own drivers this way, others as well.
>>> There are many other scenarios where you may want to add a new kernel
>>> driver to an already installed Linux kernel.
>>
>> Yes, this was part of the design behind the kernel-devsrc, make sure the sources
>> and components used to build the running kernel were made available to the
>> target so that out-of-tree/external kernel modules could be built to match the
>> running system -- as well as the ability to reconfigure and rebuild the kernel
>> itself.
>>
>> Bruce is on vacation this week and may not be around to respond, but adding yet
>> another package is not the right answer here.  Lets fix what may be broken in
>> what we have.
>>
>> --Mark
>>
>>> Juro
>>>
>>>
>>>
>>>> -----Original Message-----
>>>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>>>> Sent: Tuesday, August 4, 2015 9:20 AM
>>>> To: Bystricky, Juro; openembedded-core@lists.openembedded.org;
>>>> jurobystricky@hotmail.com
>>>> Cc: Purdie, Richard
>>>> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest additions
>>>>
>>>> On 8/3/15 3:35 PM, Juro Bystricky wrote:
>>>>> In order to support VirtualBox guest additions, kernel headers need to
>>>>> be present in the VM. I am aware we already have two packages/recipes
>>>>> that are somewhat similar (kernel-devsrc.bb, linux-libc-headers), but none
>>>> of them is suitable for this purpose.
>>>>> Besides the kernel headers, some additional files (scripts, Makefiles,
>>>>> .config, etc) are also required.
>>>>
>>>> linux-libc-headers is only for building applications.  kernel-devsrc is for
>>>> building modules on the target.
>>>>
>>>> What do these specific modules need that are not present in kernel-devsrc?
>>>> (I really don't want 'yet another' confusing package added to the system.)
>>>>
>>>>> The new recipe "kernel-headers.bb" can in principle be used by other
>>>> images as well.
>>>>> It is not limited to the Build Appliance and hence is not a part of
>>>>> the Build Appliance recipe.
>>>>
>>>> I think kernel-headers is a bad name for a package.  It could be confusing.
>>>>
>>>> --Mark
>>>>
>>>>> Juro Bystricky (2):
>>>>>   kernel-headers: linux kernel headers
>>>>>   build-appliance-image: support for VirtualBox guest addtions
>>>>>
>>>>>  .../README_vbox_guest_additions.txt                | 78
>>>> ++++++++++++++++++++++
>>>>>  .../images/build-appliance-image_12.0.1.bb         |  4 +-
>>>>>  meta/recipes-kernel/linux/kernel-headers.bb        | 66
>>>> ++++++++++++++++++
>>>>>  3 files changed, 147 insertions(+), 1 deletion(-)  create mode 100644
>>>>> meta/recipes-core/images/build-appliance-
>>>> image/README_vbox_guest_addit
>>>>> ions.txt  create mode 100644
>>>>> meta/recipes-kernel/linux/kernel-headers.bb
>>>>>
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

