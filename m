Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qbdn7-0007JD-Oc
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 21:17:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2011 12:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,438,1304319600"; d="scan'208";a="23949685"
Received: from unknown (HELO [10.255.13.106]) ([10.255.13.106])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2011 12:13:48 -0700
Message-ID: <4E0A27E9.3050300@linux.intel.com>
Date: Tue, 28 Jun 2011 12:13:45 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
	<4E0A1136.7030402@linux.intel.com>
	<68079D5A-45A4-42A9-AC3D-9CB3A21A830A@dominion.thruhere.net>
In-Reply-To: <68079D5A-45A4-42A9-AC3D-9CB3A21A830A@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Tune files and knobs to turn
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
X-List-Received-Date: Tue, 28 Jun 2011 19:17:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/28/2011 10:38 AM, Koen Kooi wrote:
> 
> Op 28 jun 2011, om 19:36 heeft Darren Hart het volgende geschreven:
> 
>>
>>
>> On 06/24/2011 04:54 AM, Koen Kooi wrote:
>>> Hi,
>>>
>>> We discussed tune files a bit during last nights TSC meeting and Khem had
>>> expressed the need before, so I'd like to get this discussion started by using
>>> armv7a as an example.
>>>
>>> For armv7a capable cores we have the following hardware features:
>>>
>>> * armv7a instruction set
>>> * thumb1 instruction set
>>> * thumb2 instruction set
>>> * VFP coprocessor
>>> * optional NEON coprocessor
>>>
>>> For the ABI we can choose the following:
>>>
>>> * softtp without hw support (e.g. no VFP instructions emitted, slow)
>>> * softfp with hw support (e.g. VFP and/or NEON instructions emitted, fast)
>>> * hardfp, emits VFP and/or NEON instructions, slightly faster than softfp/hw,
>>>  incompatible with everything else
>>>
>>> And the extra knobs:
>>>
>>> * pure thumb1, no arm instructions (limited use)
>>> * thumb1/arm interworking
>>> * pure thumb2,  no arm instructions
>>> * thumb2 interworking (not sure if that's actually usefull, thumb2 has complete coverage)
>>>
>>> In OE .dev we have the following vars:
>>>
>>> TARGET_FPU: switches between hw float and sw float, no reflection in package arch
>>> ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' or
>>>            'armv7a-hardfp' as package arch
>>> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in package arch
>>> THUMB_INTERWORK: turns on interworking, no reflection in package arch
>>>
>>> (side note, oe-core/distroless and meta-yocto/poky don't turn set TARGET_FPU
>>> for armv7a and will generate slow code, angstrom does turn it on)
>>
>>
>> oe-core tune-cortexa8.inc doesn't make use of these variables (unlike
>> meta-texasinstruments) and does make use of the neon coprocessor, but
>> still uses the softfp float-api:
>>
>> TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon
>> -mfloat-abi=softfp -fno-tree-vectorize"
> 
> Don't confuse softfp calling conventions with softfloat! The above will still emit
> vfp and neon instructions if your set TARGET_FPU = hard

Ah. So we would need to add something like:

conf/distro/include/angstrom.inc:TARGET_FPU_armv7a ?= "hard"
conf/distro/include/angstrom.inc:TARGET_FPU_armv7a-vfp ?= "hard"

to something DISTRO specific (poky.conf or similar).

It isn't clear to me why this is a distro policy decision instead of
part of the tune include or the machine config itself.

Can someone elaborate on why this goes where it does?

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


