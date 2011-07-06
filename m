Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QeVAT-0006XY-8B
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 18:41:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Jul 2011 09:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,488,1304319600"; d="scan'208";a="24036752"
Received: from unknown (HELO [10.255.14.20]) ([10.255.14.20])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2011 09:37:49 -0700
Message-ID: <4E148F5C.4020902@linux.intel.com>
Date: Wed, 06 Jul 2011 09:37:48 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309867242.git.anders@chargestorm.se>	<406427a001cfa7c1859f54147b678f0ef647a922.1309867242.git.anders@chargestorm.se>	<1309869846.2410.3.camel@phil-desktop>	<201107051454.04409.anders@chargestorm.se>	<1309871340.20015.700.camel@rex>
	<ECF13383-E711-4CE2-8E50-222852DC392D@chargestorm.se>
In-Reply-To: <ECF13383-E711-4CE2-8E50-222852DC392D@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH 1/1] kernel.bbclass: make external module compile
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
X-List-Received-Date: Wed, 06 Jul 2011 16:41:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/05/2011 08:04 AM, Anders Darander wrote:
> 
> 
> On 5 jul 2011, at 15:09, "Richard Purdie"
> <richard.purdie@linuxfoundation.org> wrote:
> 
>> On Tue, 2011-07-05 at 14:54 +0200, Anders Darander wrote:
>>> * Phil Blundell Phil Blundell <pb@pbcl.net> [07/05/11 02:44 PM]:
>>>> On Tue, 2011-07-05 at 14:01 +0200, Anders Darander wrote:
>>>>> diff --git a/meta/classes/kernel.bbclass
>>>>> b/meta/classes/kernel.bbclass index 943252a..26ee416 100644 
>>>>> --- a/meta/classes/kernel.bbclass +++
>>>>> b/meta/classes/kernel.bbclass @@ -149,7 +149,6 @@
>>>>> kernel_do_install() {
>>>> 
>>>> # # We don't want to leave host-arch binaries in /sysroots, so 
>>>> # we clean the scripts dir while leaving the generated config
>>>> 
>>>>> # and include files. # oe_runmake -C $kerneldir
>>>>> CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
>>>>> 
>>>>> -    make -C $kerneldir _mrproper_scripts
>>>>> 
>>>>> find $kerneldir -path $kerneldir/scripts -prune -o -name
>>>>> "*.[csS]" -exec rm '{}' \; find $kerneldir/Documentation
>>>>> -name "*.txt" -exec rm '{}' \;
>>>> 
>>>> Did you verify that this doesn't introduce any new QA warnings
>>>> during packaging?  Presumably that line was originally added
>>>> for a reason and it seems a bit surprising that just deleting
>>>> it without any replacement is the right thing to do.
>>> 
>>> No, I didn't really verify that. Do I need to run with any
>>> specific options enabled, or should it be enough to just bitbake
>>> my modules recipe? (I can't test for the moment, as the latest
>>> pull from oe-core forces a rebuild of gcc etc).
>>> 
>>>> Also, if the scripts dir isn't being cleaned anymore, I guess
>>>> the preceding comment should be adjusted to match the new
>>>> reality.
>>> 
>>> That's true.
>>> 
>>> I'll wait to see if someone else has any comments, or if I find
>>> some QA warnings before I produce a version 2.
>> 
>> I'm cc'ing Darren as this is one of his favourite subjects :/.
>> 
>> Summary is that this works well in some kernel versions and not in 
>> others. We might have to start doing this conditionally based upon 
>> kernel version I guess...
> 
> Ah, well then it is worse than I thought. ( On the other hand, that
> would explain why no one has noticed the problem, until I tried using
> the wrong kernel version).
> 
> Do we have any idea at what point the kernel breaks? I guess that
> might be a question for Darren.

Hi Anders,

Please see the following commit log:

commit 3b49416fc7a7ee9bfe722f2e6089aa18df41dc58
Author: Darren Hart <dvhart@linux.intel.com>
Date:   Tue Mar 8 17:09:10 2011 -0800

    kernel/bbclass: rework kernel and module classes to allow for building out-of-tree modul
  

In particular, the following:

    Care is also taken to clean the hostprogs in scripts, and the modules are
    responsible for building them as needed. Although it is unclear to me if this is
    really necessary, especially considering that modules put these bits back as
    soon as they compile. If we are not generating an sstate package, I suspect we
    can ignore these.
    
The scripts are recreated during the build of module.bbclass derived recipes.
Are you trying to build modules independently of this method? Richard expressed
concerns about not including host specific binaries in the sstate, which was
part of the reason this approach was taken.

--
Darren

> 
> Cheers, Anders _______________________________________________ 
> Openembedded-core mailing list 
> Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--
> 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


