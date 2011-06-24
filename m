Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qa7Ai-0007xh-4Z
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 16:15:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5OECAHo023999
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 07:12:10 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 24 Jun 2011 07:12:09 -0700
Message-ID: <4E049B38.5000506@windriver.com>
Date: Fri, 24 Jun 2011 09:12:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
In-Reply-To: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 24 Jun 2011 14:15:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

A few, what I suspect are corrections.  (I'm going to be a bit pedantic here.)

On 6/24/11 6:54 AM, Koen Kooi wrote:
> Hi,
> 
> We discussed tune files a bit during last nights TSC meeting and Khem had expressed the need before, so I'd like to get this discussion started by using armv7a as an example.
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
> * hardfp, emits VFP and/or NEON instructions, slightly faster than softfp/hw, incompatible with everything else

Actually on ARM there are three ABIs possible but those are not it.

OABI - softfp
OABI - hardfp
EABI

As far as I know nobody uses OABI anymore, and I doubt we should support it.

The above are really instructions used within the ABI.

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
> ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' or 'armv7a-hardfp' as package arch
> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in package arch
> THUMB_INTERWORK: turns on interworking, no reflection in package arch
> 
> (side note, oe-core/distroless and meta-yocto/poky don't turn set TARGET_FPU for armv7a and will generate slow code, angstrom does turn it on)
> 
> Khem and I would like to start building armv7a (and armv6) in pure thumb2 mode but we want to have the variables to turn those knobs make sense and be consistent. RP has expressed his desire to sort this all out before merging multilib. I'm sure x86/mips/ppc/etc have a similar need, so let's get this discussion started.

Below is a quick step to capture what all I know of for various architectures,
inluding ARM.  Note the "tunings" are where I'm a bit sketchy on some
architectures.  (I think below also point out why I think this needs to be
hierarchical..  so it's really easy to inherit common stuff, and override only
the pieces you need to..  specifically the tunings.)

Arch Family: ARM

ABI:
- EABI little endian
- EABI big endian
  - canonical os=linux-eabi
  - library directory is "lib"

CPU/ISA:
- all use EABI
  - traditional arm instructions
  - thumb1, no arm instructions
  - thumb1/arm, interworking
  - thumb2, no arm instructions
  - thumb2, interworking (note, our customers do use this.. I'm not sure how
much though)

Tunings:
- armv4 (both big & little endian)
- armv5 (both big & little endian)
- armv5 + vfp
- armv6 + vfp
- armv7a + vfp + neon (supports thumb) (little endian)
- armv7a + be8 (supports thumb) (big endian)

---

Arch Family: IA32

ABI:
- x86_32
  - There is a soft-fp variant but it's not really used anymore
  - hardfp
  - defined as an LSB standard
  - library directory is "lib"
- x86_64
  - hardfp only
  - defined as an LSB standard
  - library directory is "lib64"
- (x32)
  - new experimental ABI
  - library directory is "libx32"

CPU/ISA:
- x86_32
  - all use x86_32
  - i586 -> core2 -> corei7
- x86_64
  - only 64-bit chips supported
- x32
  - only 64-bit chips supported

Tunings:
- i586, i686, core2, etc..
- MMX, MMX2, AVX, etc..

---

Arch Family: MIPS

ABI:
- MIPS o32 - soft float - big endian
- MIPS o32 - hard float - big endian
- MIPS o32 - soft float - little endian
- MIPS o32 - hard float - little endian
  - old 32-bit mips library
  - library path is "lib"

- MIPS n32 - soft float - big endian
- MIPS n32 - hard float - big endian
- MIPS n32 - soft float - little endian
- MIPS n32 - hard float - little endian
  - new 32-bit MIPS64 library
  - library path is "lib32"

- MIPS n64 - soft float - big endian
- MIPS n64 - hard float - big endian
- MIPS n64 - soft float - little endian
- MIPS n64 - hard float - big endian
  - new 64-bit MIPS64 library
  - library path is "lib64"

CPU/ISA:
- MIPS32
  - Various
- MIPS64
  - Various

Tunings:
- MIPS32
  - Various
- MIPS64
  - Various

---

Arch Family: Power

ABI:
- ppc32 - hard float
   - ABI defined by LSB
   - library path is "lib"
- ppc32 - soft float
- ppc32 - e500v1 (soft-float variant -- likely not needed)
- ppc32 - e500v2 (soft-float variant)
  - library path is "lib"
- ppc64 - hard float
  - library path is "lib64"
  - ABI defined by LSB

CPU/ISA:
- ppc32 - hard float
  - ppc603e
- ppc32 - soft float
  - ppc603ec
- ppc32 - e500v1 (soft-float variant)
  - -mfloat-gprs=single -mspe=yes -mabi=spe
- ppc32 - e500v2 (soft-float variant)
  - -mfloat-gprs=double -mspe=yes -mabi=spe
- ppc64 - hard float
  - PowerPC 970

Tunings:
- ppc603e
- ppc750
- ppc7400
- e300c2
- ppc405
 - ppc405fp for hard float
- ppc440
 - ppc440fp for hard float
- ppc476
 - ppc476fp
- e500mc
- 8540
- 8548
- -maltivec or -mno-altivec


