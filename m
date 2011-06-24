Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qa7Sv-0001gy-Ft
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 16:34:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5OEUxnd026852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 07:31:00 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 24 Jun 2011 07:30:59 -0700
Message-ID: <4E049FA2.4040104@windriver.com>
Date: Fri, 24 Jun 2011 09:30:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
	<1308924060.20015.173.camel@rex>
In-Reply-To: <1308924060.20015.173.camel@rex>
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
X-List-Received-Date: Fri, 24 Jun 2011 14:34:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/24/11 9:01 AM, Richard Purdie wrote:
> On Fri, 2011-06-24 at 13:54 +0200, Koen Kooi wrote:
>> We discussed tune files a bit during last nights TSC meeting and Khem
>> had expressed the need before, so I'd like to get this discussion
>> started by using armv7a as an example.
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
>> * hardfp, emits VFP and/or NEON instructions, slightly faster than softfp/hw, incompatible with everything else
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
>> ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' or 'armv7a-hardfp' as package arch
>> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in package arch
>> THUMB_INTERWORK: turns on interworking, no reflection in package arch
> 
> I suspect having a variable per tune feature is going to be a recipe for
> disaster. Selecting the tune options is something a machine is likely
> going to want a good default of but some distros are going to want to
> take control over in some cases too.

We've broken the problem down to set of key variables [note these are used in
our build system, which is not derived from bitbake/OE.. so the names may clash
with current usage.. but I think it's a good example]

Arch file:
TARGET_TOOLCHAIN_ARCH -- arch family ["arm", "ia32", "power", "mips"]

ABI file:
TARGET_ARCH - minimal gnu canonical arch - arch component

TARGET_OS="linux-gnu" or "linux-eabi" [arm] [used in a gnu canonical arch]

TARGET_FUNDAMENTAL_ASFLAGS - minimum flags required by AS to assemble for this ABI

TARGET_FUNDAMENTAL_CFLAGS - minimum cflags required by CC to compile for this ABI

TARGET_FUNDAMENTAL_LDFLAGS - minimum ldflags required by LD to compile for this ABI

TARGET_LIB_DIR="lib64" - library directory for this ABI
TARGET_USERSPACE_BITS - bitsize for this ABI
TARGET_ENDIAN - endian for this ABI

CPU/ISA file & Tuning file:  (we combine this in our implementation)
TARGET_ARCH -- more descriptive canonical arch for tunings + abi
TARGET_COMMON_ASFLAGS - optional assembly flags -- tunings
TARGET_COMMON_CFLAGS - optional cflags -- tunings
TARGET_COMMON_LDFLAGS - optional ldflags -- tunings


> Given the n^2 problem we have with scale it starts to look like we'd
> need something like TUNE_FEATURES which I don't feel brilliant about but
> it likely could work well.
> 
> I'd also like to look at this from the other direction. What information
> do we need from the tune config? Its one thing to set the controls but
> we also need to consider what uses the end result and how. Currently the
> tune files should really be responsible for:
> 
> TARGET_ARCH
> TARGET_FPU
> TARGET_CC_ARCH
> PACKAGE_ARCH
> BASE_PACKAGE_ARCH
> PACKAGE_EXTRA_ARCHS
> FEED_ARCH
> 
> of which there is some duplication of data. Also, the distro config
> typically sets some of this. What we really need is the following:
> 
> * Overall compiler architecture
> * Extra libc config data (softfloat?)
> * Compiler optimisation flags
> * Name of the package "architecture" to use for the config
> * List of compatible package "architectures"
> 
> These map to:
> 
> * TARGET_ARCH
> * TARGET_FPU
> * TARGET_CC_ARCH
> * BASE_PACKAGE_ARCH
> * PACKAGE_EXTRA_ARCHS
> 
> but we do have issues of these names needing to be overridden so putting
> then in some TUNE* namespace variables initially would help clean up the
> core significantly.

I think it's key to namespace all of these things in a multilib design.  That
way it's easy to switch between them as we process the individual files.  We
have another variable (not listed above) called "VARIANT".  The variant is what
is suffixed to each variable and works very much like the current overrides in OE.

> Adding multlilib into the mix doesn't actually make the problem that
> much more complex if we followed the simple rule of making the tune
> config name an override. This would make the tune files follow the form:
> 
> TARGET_CC_ARCH_tune-armv7a = "xxx"
> BASE_PACKAGE_ARCH_tune-armv7a = "xxx"
> 
> and then we'd add tune-xxx to OVERRIDES to select a given tuning for a
> given multlilib.

Agreed.. our name space is something equivalent to:

variable_arch-<arch>
variable_abi-<abi>
variable_tune-<tune>

The arch, abi and tune are selected via a series of included files.. and
references.  So at each step of processing we resolve and inherit from the
previous step -- and then override it as necessary.  So variable_abi-<abi>
automatically gets set to:  variable_abi-<abi>=variable_arch-<arch>

Then we can override the value.  Same happens when the tune files include the
arch.  The end system only uses the values from the tune files.  All systems
have tune files, even if they're just inherited from the abi and arch files.
This also allows us to construct a list of compatible package feeds.  Since one
tune file can include another and we have a variable (not previously mentioned)
that collects together package architectures in order of inclusion.

> I'm continuing to give this some thought but those are the ideas off the
> top of my head...
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



