Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QcKj2-0002wp-SU
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 19:08:25 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QcJhM-0007Cc-9L from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 09:02:36 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 30 Jun 2011 09:02:03 -0700
Received: from [172.30.80.212] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 30 Jun 2011 09:02:35 -0700
Message-ID: <4E0C9E14.4040209@mentor.com>
Date: Thu, 30 Jun 2011 09:02:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
	<4E0A1136.7030402@linux.intel.com>
In-Reply-To: <4E0A1136.7030402@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 30 Jun 2011 16:02:03.0608 (UTC)
	FILETIME=[0D835580:01CC373F]
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
X-List-Received-Date: Thu, 30 Jun 2011 17:08:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/28/2011 10:36 AM, Darren Hart wrote:
> 
> 
> On 06/24/2011 04:54 AM, Koen Kooi wrote:
>> Hi,
>>
>> We discussed tune files a bit during last nights TSC meeting and Khem had
>> expressed the need before, so I'd like to get this discussion started by using
>> armv7a as an example.
>>
>> For armv7a capable cores we have the following hardware features:
>>
>> * armv7a instruction set
>> * thumb1 instruction set
>> * thumb2 instruction set
>> * VFP coprocessor
>> * optional NEON coprocessor
>>
>> For the ABI we can choose the following:
>>
>> * softtp without hw support (e.g. no VFP instructions emitted, slow)
>> * softfp with hw support (e.g. VFP and/or NEON instructions emitted, fast)
>> * hardfp, emits VFP and/or NEON instructions, slightly faster than softfp/hw,
>>   incompatible with everything else
>>
>> And the extra knobs:
>>
>> * pure thumb1, no arm instructions (limited use)
>> * thumb1/arm interworking
>> * pure thumb2,  no arm instructions
>> * thumb2 interworking (not sure if that's actually usefull, thumb2 has complete coverage)
>>
>> In OE .dev we have the following vars:
>>
>> TARGET_FPU: switches between hw float and sw float, no reflection in package arch
>> ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' or
>>             'armv7a-hardfp' as package arch
>> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in package arch
>> THUMB_INTERWORK: turns on interworking, no reflection in package arch
>>
>> (side note, oe-core/distroless and meta-yocto/poky don't turn set TARGET_FPU
>>  for armv7a and will generate slow code, angstrom does turn it on)
> 
> 
> oe-core tune-cortexa8.inc doesn't make use of these variables (unlike
> meta-texasinstruments) and does make use of the neon coprocessor, but
> still uses the softfp float-api:
> 
> TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon
> -mfloat-abi=softfp -fno-tree-vectorize"

What's with the -fno-tree-vectorize?  I had someone point out to me that
the TI wiki recommends turning that on, even outside of -O3 (which
enables it by default).

-- 
Tom Rini
Mentor Graphics Corporation


