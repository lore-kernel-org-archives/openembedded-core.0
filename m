Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QJXVD-0005pr-28
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 22:56:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2011 13:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,342,1301900400"; d="scan'208";a="744692871"
Received: from doubt.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 13:53:18 -0700
Message-ID: <4DC8543F.3090501@linux.intel.com>
Date: Mon, 09 May 2011 13:53:19 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <201105090016.46391.leitl@fim.uni-passau.de>	<69719FEB-AD08-4D01-B1B0-D8291AD1DEFC@dominion.thruhere.net>	<4DC83117.8000205@linux.intel.com>
	<201105092038.15641.leitl@fim.uni-passau.de>
In-Reply-To: <201105092038.15641.leitl@fim.uni-passau.de>
Subject: Re: Patch for fixing build issues with external kernel modules.
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
X-List-Received-Date: Mon, 09 May 2011 20:56:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/09/2011 11:38 AM, Franz Leitl wrote:
> Am Montag 09 Mai 2011, 20:23:19 schrieb Darren Hart:
>> On 05/09/2011 10:53 AM, Koen Kooi wrote:
>>> Op 9 mei 2011, om 19:32 heeft Franz Leitl het volgende geschreven:
>>>> Hi,
>>>>
>>>> Am Montag 09 Mai 2011, 18:28:06 schrieben Sie:
>>>>>> I've tried to get compcache kernel module building against 2.6.34 from
>>>>>> shr- core but found some issues with kernel.bbclass and
>>>>>> module.bbclass.
>>>>>>
>>>>>> The kernel.bbclass deletes the .c files from scripts directory which
>>>>>> are later needed by make prepare to recreate bound.h and other files.
>>>>>> Compcache kernel module, for example, depends on bounds.h.
>>>>>
>>>>> The bounds.h should not need to be recreated. It is created during the
>>>>> build of the kernel, and since 2.6.26, the makefile knows not to remove
>>>>> it.
>>>>
>>>> Compache does not build without bounds.h and this file is missing in the
>>>> staging directory for what ever reason.
>>>
>>> I ran into the same and I did the following:
>>>
>>> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrumen
>>> ts/commit/?id=7bcba149f05cc9c5d8ce956ee40e2c6849601470
>>
>> Thanks Koen, I knew we had discussed this once before. In your case,
>> IIRC, you found that the "make clean" deleted bounds.h, even with the
>> fix from 2.6.26 applied.
>>
>> At the time we agreed that patching the kernel bbclasses for a bug in a
>> particular kernel version wasn't a good plan. I'm concerned that Franz
>> is hitting this with 2.6.34.
>>
>> Franz, can you confirm that bounds.h exists before the clean and does
>> not exist after the clean? Some simple instrumentation to kernel.bbclass
>> should be able to do this.
> I'll try to find out.
> 
>> If so, we need to look into why that is happening. Simply not deleting
>> the C files from the source isn't an acceptable fix to save 1 file.
> The c files are deleted by the kernel.bbclass not by "make clean" while make 
> clean deletes the bounds.h... Who is doing the wrong thing now? kernel.bbclass 
> removing the bounds.c, kernel's make clean removing the bounds.h or the module 
> author relying on modules.h?

The kernel should not remove bounds.h, that is documented in the
Makefile. If it does, it's a bug.

> 
> I don't know if/what the problem is with regenerating some things in 
> module.bbclass. It is already done with "make scripts". Cleaning up 
> things to save diskspace and recreating if needed does not seem to 
> bad to me. Am I missing something?

The scripts are regenerated as they are host specific. If you were to
use an sstate package, you don't want host-specific binaries in it. (We
aren't there yet, but we want to keep that in mind).

It's just about fixing it properly instead of applying a band-aid.
Regenerating something that shouldn't have been deleted in the first
place is a band-aid, and you can go that route in your own recipe if you
like (per Koen's patch), but that doesn't belong in the core kernel classes.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


