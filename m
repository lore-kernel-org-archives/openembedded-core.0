Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QmrYC-0008Aq-EC
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 20:12:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6TI8Qdc011200
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 11:08:26 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 29 Jul 2011 11:08:25 -0700
Message-ID: <4E32F718.7060906@windriver.com>
Date: Fri, 29 Jul 2011 13:08:24 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20110729163912.GN15286@jama.jama.net>
	<1311959073-16925-1-git-send-email-Martin.Jansa@gmail.com>
	<20110729171007.GO15286@jama.jama.net>
In-Reply-To: <20110729171007.GO15286@jama.jama.net>
Subject: Re: [PATCH] feature-arm-thumb: respect ARM_INSTRUCTION_SET
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
X-List-Received-Date: Fri, 29 Jul 2011 18:12:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Sorry I was gone much of yesterday and not able to comment.  I'm going to break
this down into the two problems that I see people having.

1) "interworking".  I was recently told EABI requires interworking to be
enabled, and in OE-core we only support EABI.  So we should always have the
interworking enabled for the tunes that we support.

Is this correct, any objections?  If so, assume from this point forward
interworking is always enabled and we only support (in oe-core) interworking
capable ARM chips.

2) The tune naming is confusing people.

Initial design was (tune name):

armv5 = armv5 class CPU, with ARM instructions, w/ interworking enabled
armv5t = armv5 class CPU, with thumb instructions, w/ interworking enabled

The output of "armv5" was a package with the arch of "armv5", output of "armv5t"
was similarly "armv5t".  Note, the package arch produced though is NOT the same
as the tune name, it just happens to be the same in these cases.  (We could
easily call the tune names "armv5t_nothumb" and "armv5t_thumb" and still have
package arch of "armv5" and "armv5t".)

The confusion continues that people are expecting a package arch of "armv5t" to
be arbitrarily thumb or not thumb.. since the arch (to them) indicates that the
CPU is compatible with both thumb and ARM code.  That was not the intent of this
change.  Instead the _package architecture_ is designed to convey the ABI and
instruction set used when building the software in the package.

This not only helps with debugging what someone is using, but also helps with
designing filesystems that may contain both arm and thumb code.  For example a
developer is building a device.. they have the requirements of "higher"
performance in there specific application, but maximum space savings everywhere
else.  They want to start with a binary package feed, NOT the build system.  So
they will mix and match the armv5 and armv5t packages by choosing the smaller
packages for most things (usually thumb), and using the ARM instruction set
where they need performance (usually armv5 packages).

---

So having a single value that simply switches the instruction set, without
changing the package arch violates the intent of the change.  An alternative
would be something like:

feature-arm-thumb.inc:>
TUNEVALID[thumb] = "Support using thumb instructions"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb",
"${ARM_THUMB_M_OPT}", "", d)}"
ARM_THUMB_M_OPT = "${@['-mno-thumb',
'-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
OVERRIDES .= "${['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) ==
'thumb']}"

ARMPKGSFX_THUMB .= ${['', '_thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1)
== 'thumb']}"

TARGET_CC_KERNEL_ARCH += "-mno-thumb-interwork -mno-thumb"

tune-armv5.inc:

DEFAULTTUNE ?= "armv5t"

ARMPKGARCH ?= "armv5t"

TUNEVALID[armv5t] = "Enable instructions for ARMv5"
TUNE_CONFLICTS[armv5t] = "armv4"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv5t",
"-march=armv5t${ARMPKGSFX_DSP}", "", d)}"

ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5t", "dsp" ], "e",
"", d)}"

require conf/machine/include/arm/arch-armv4.inc
require conf/machine/include/arm/feature-arm-vfp.inc
require conf/machine/include/arm/feature-arm-thumb.inc

AVAILTUNES += "armv5t armv5te"
TUNE_FEATURES_tune-armv5t = "armv5 thumb"
TUNE_FEATURES_tune-armv5te = "armv5 dsp thumb"

(and some more lines for compatibility)

arch-arm.inc:

...

TUNE_PKGARCH = "${@d.getVar('ARMPKGARCH',
True)}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}${ARMPKGSFX_THUMB}"

----

When you select the tune of "armv5t" you will get classic ARM instructions with
the ability to enable thumb via ARM_INSTRUCTION_SET = thumb.

When you switch into building thumb (or out of it) the two produced package arch
will be:

armv5t
armv5t_thumb

This allows per packages switching using the ARM_INSTRUCTION_SET instead of
specific tune features, and still preserves the design of capturing the ABI &
instruction set in the package arch.

If this is reasonable, I'll work on a more complete patch set for this.

--Mark

On 7/29/11 12:10 PM, Martin Jansa wrote:
> On Fri, Jul 29, 2011 at 07:04:33PM +0200, Martin Jansa wrote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  .../conf/machine/include/arm/feature-arm-thumb.inc |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> index b580168..e7d392e 100644
>> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> @@ -5,7 +5,8 @@
>>  # but requires more instructions (140% for 70% smaller code) so may be
>>  # slower.
>>  TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
>> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthumb", "-mno-thumb", d)}"
>> +ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
>>  OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
>>  
>>  # Note armv7 will hit on armv7a as well
>> -- 
>> 1.7.6
>>
> 
> This seems to work, but be aware that _armv4t override is not respected
> anymore :/.
> 
> I was using something like this to set default ARM_INSTRUCTION_SET from
> distro config:
> 
> PREFERRED_ARM_INSTRUCTION_SET_armv4t   = "thumb"
> PREFERRED_ARM_INSTRUCTION_SET_armv5te  = "thumb"
> PREFERRED_ARM_INSTRUCTION_SET_armv5teb = "thumb"
> PREFERRED_ARM_INSTRUCTION_SET         ?=  "arm"
> ARM_INSTRUCTION_SET = "${PREFERRED_ARM_INSTRUCTION_SET}"
> 
> but from -e output it's clear that it's ignored
> # PREFERRED_ARM_INSTRUCTION_SET_armv4t=thumb
> PREFERRED_ARM_INSTRUCTION_SET_armv4t="thumb"
> # PREFERRED_ARM_INSTRUCTION_SET=arm
> PREFERRED_ARM_INSTRUCTION_SET="arm"
> # PREFERRED_ARM_INSTRUCTION_SET_armv5te=thumb
> PREFERRED_ARM_INSTRUCTION_SET_armv5te="thumb"
> # PREFERRED_ARM_INSTRUCTION_SET_armv5teb=thumb
> PREFERRED_ARM_INSTRUCTION_SET_armv5teb="thumb"
> # ARM_INSTRUCTION_SET=${PREFERRED_ARM_INSTRUCTION_SET}
> ARM_INSTRUCTION_SET="arm"
> 
> Regards,
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



