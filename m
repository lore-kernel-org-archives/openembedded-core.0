Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QbcHA-0004nX-0h
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 19:40:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2011 10:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,437,1304319600"; d="scan'208";a="23910103"
Received: from unknown (HELO [10.255.13.106]) ([10.255.13.106])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2011 10:36:56 -0700
Message-ID: <4E0A1136.7030402@linux.intel.com>
Date: Tue, 28 Jun 2011 10:36:54 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
In-Reply-To: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 28 Jun 2011 17:40:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/24/2011 04:54 AM, Koen Kooi wrote:
> Hi,
> 
> We discussed tune files a bit during last nights TSC meeting and Khem had
> expressed the need before, so I'd like to get this discussion started by using
> armv7a as an example.
> 
> For armv7a capable cores we have the following hardware features:
> 
> * armv7a instruction set
> * thumb1 instruction set
> * thumb2 instruction set
> * VFP coprocessor
> * optional NEON coprocessor
> 
> For the ABI we can choose the following:
> 
> * softtp without hw support (e.g. no VFP instructions emitted, slow)
> * softfp with hw support (e.g. VFP and/or NEON instructions emitted, fast)
> * hardfp, emits VFP and/or NEON instructions, slightly faster than softfp/hw,
>   incompatible with everything else
> 
> And the extra knobs:
> 
> * pure thumb1, no arm instructions (limited use)
> * thumb1/arm interworking
> * pure thumb2,  no arm instructions
> * thumb2 interworking (not sure if that's actually usefull, thumb2 has complete coverage)
> 
> In OE .dev we have the following vars:
> 
> TARGET_FPU: switches between hw float and sw float, no reflection in package arch
> ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' or
>             'armv7a-hardfp' as package arch
> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in package arch
> THUMB_INTERWORK: turns on interworking, no reflection in package arch
> 
> (side note, oe-core/distroless and meta-yocto/poky don't turn set TARGET_FPU
>  for armv7a and will generate slow code, angstrom does turn it on)


oe-core tune-cortexa8.inc doesn't make use of these variables (unlike
meta-texasinstruments) and does make use of the neon coprocessor, but
still uses the softfp float-api:

TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -fno-tree-vectorize"

Seems like the oe-core tune files need to be synced up with vendor layers?

--
Darren


> 
> Khem and I would like to start building armv7a (and armv6) in pure thumb2 mode
> but we want to have the variables to turn those knobs make sense and be
> consistent. RP has expressed his desire to sort this all out before merging
> multilib. I'm sure x86/mips/ppc/etc have a similar need, so let's get this
> discussion started.
> 
> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


