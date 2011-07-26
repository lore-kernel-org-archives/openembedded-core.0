Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qlkx6-00019a-V3
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 18:57:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QGrcjO010987
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 09:53:38 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 26 Jul 2011 09:53:34 -0700
Message-ID: <4E2EF10A.2030705@windriver.com>
Date: Tue, 26 Jul 2011 11:53:30 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E2ED5F2.3090306@windriver.com> <1311698198.2344.279.camel@rex>
In-Reply-To: <1311698198.2344.279.camel@rex>
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Tue, 26 Jul 2011 16:57:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/26/11 11:36 AM, Richard Purdie wrote:
> On Tue, 2011-07-26 at 09:57 -0500, Mark Hatle wrote:
>> On 7/26/11 7:44 AM, Richard Purdie wrote:
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 +++++++++++++++++++-
>>>  meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
>>>  meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
>>>  meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
>>>  meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
>>>  meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
>>>  6 files changed, 88 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> index 17ace32..3f7befb 100644
>>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> @@ -1,3 +1,44 @@
>>> -TUNE_ARCH = "powerpc"
>>> +# Power Architecture definition
>>> +# Four defined ABIs, all combinations of:
>>> +# *) Hard/Soft Floating Point
>>> +# *) 32-bit/64-bit
>>> +
>>> +DEFAULTTUNE ?= "powerpc"
>>> +
>>> +TUNEVALID[m32] = "Power ELF32 standard ABI"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
>>> +
>>> +TUNEVALID[m32-arch] = "Enable powerpc package architecture"
>>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m32-arch" ], "powerpc", "", d)}"
>>> +
>>> +TUNEVALID[m64] = "Power ELF64 standard ABI"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-m64", "", d)}"
>>> +
>>> +TUNEVALID[m64-arch] = "Enable powerpc64 package architecture"
>>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64-arch" ], "powerpc64", "", d)}"
>>
>> Why m32-arch and m64-arch?  If m32 or m64 is selected then it should mean
>> powerpc or powerpc64.
> 
> I've gotten confused here and mixed up TUNE_ARCH and TUNE_PKGARCH but
> there was a reason.
> 
> The missing piece is 
> 
> TUNE_PKGARCH ?= "${TUNE_ARCH}"
> 
> and the trouble comes when a tune file wants to change this only when
> its tune config is in action.
> 
> I'm thinking ahead to trying a mixed ppc 32 and 64 bit build where
> TUNE_PKGARCH needs to take on the values for both configs.

As far as I can tell, in all cases m32 = powerpc and m64 = powerpc64..  There is
no way to mix a build of ppc32 and ppc64 w/o using the multilib code.

The m32/m64 is the ABI, so only one can be present in the TUNE_FEATURES.. and
passed via gcc through the TUNE_CCARGS.

>>> +TUNEVALID[fpu-hard] = "Use hardware FPU."
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"
>>> +
>>> +TUNEVALID[fpu-soft] = "Use software FPU."
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-msoft-float", "", d)}"
>>> +TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"
>>
>> Why specify both fpu-hard and fpu-soft?  The "unusual" ABI is fpu-soft.  It
>> would simplify it to only have to specify one, and you get the other automatically.
> 
> The trouble is the spe pieces which seemed to imply TARGET_FPU should
> take on a value of other than "soft". Setting it to "soft" if fpu-hard
> isn't in TUNE_FEATURES therefore wasn't enough...

Can you do something like:

TARGET_FPU = "${@...if "fpu" is not in TUNE_FEATURES..., "hard"}"
TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"

Then later in the tune's that have unique spe units..

TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "e500", "fpu-spe" ],
"ppc-efs", "", d)}"

TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "e500", "fpu-spe" ],
"ppc-efd", "", d)}"

>>> +TUNEVALID[spe] = "Enable SPE ABI extensions"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
>>> +
>>> +ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
>>
>> SPE instructions are specific to certain processors and not generic across all
>> of PPC.  I would move this to each of the tunes where it may be used.
> 
> I guess this should be a feature file like thumb on arm?

Unfortunately it's SoC specific on PowerPC.  There is no uniform definition of
an SPE unit.. (SPE stands for Special Purpose Execution..  by spec, the SPE can
use any instruction set, and do any set of operations.. the individual cores
define what the SPE instructions do.  The e500 and e500v2 have their own unique
SPEs that do math-like functionality.  Other cores use the SPE instructions for
encryption services, multimedia, etc...)

Thats why the SPE settings need to be in the individual tune files, they are
unique to each core.

>> Also I see the ABIEXTENSION, but where is it being set?
> 
> I'm just migrating the existing code in that regard, I'm also puzzled as
> to where that is getting set currently.

I think this is something we need to fix.  The ABIEXTENSION contents look
reasonable, but again, I believe it's really core specific.

>>> +# Basic tune definitions
>>> +AVAILTUNES += "powerpc powerpc-nf" 
>>> +TUNE_FEATURES_tune-powerpc ?= "m32 m32-arch fpu-hard"
>>> +BASE_LIB_tune-powerpc = "lib"
>>> +TUNE_FEATURES_tune-powerpc-nf ?= "m32 m32-arch fpu-soft"
>>> +BASE_LIB_tune-powerpc-nf = "lib"
>>> +
>>> +AVAILTUNES += "powerpc64 powerpc64-nf"
>>> +TUNE_FEATURES_tune-powerpc64 ?= "m64 m64-arch fpu-hard"
>>> +BASE_LIB_tune-powerpc64 = "lib64"
>>> +TUNE_FEATURES_tune-powerpc64-nf ?= "m64 m64-arch fpu-soft"
>>> +BASE_LIB_tune-powerpc64-nf = "lib64"
>>>  
>>> -ABIEXTENSION = "${@['','spe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
>>> diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
>>> index 61c0669..6991ae0 100644
>>> --- a/meta/conf/machine/include/tune-ppc603e.inc
>>> +++ b/meta/conf/machine/include/tune-ppc603e.inc
>>> @@ -1,5 +1,11 @@
>>> +DEFAULTTUNE ?= "ppc603e"
>>> +
>>>  require conf/machine/include/powerpc/arch-powerpc.inc
>>>  
>>> -TUNE_CCARGS = "-mcpu=603e  -mhard-float"
>>> -TUNE_PKGARCH = "ppc603e"
>>> -PACKAGE_EXTRA_ARCHS = "powerpc ppc603e"
>>> +TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
>>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "", d)}"
>>> +
>>> +AVAILTUNES += "ppc603e"
>>> +TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
>>> +PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
>>
>> Going back to my original comment, the m32-arch is missing... or m32 should mean
>> "powerpc" (my suggestion).
> 
> No, TUNE_ARCH should be TUNE_PKGARCH above, then this makes more
> sense...

Yes, I understand.. TUNE_ARCH is the canonical arch, TUNE_PKGARCH is what to
call the packages generated.

So in the above features, if TUNE_ARCH is used as implemented m32-arch is
missing -- but on Power there are only two current options and the m32/m64
should be able to switch them.

>>> diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
>>> index a38e97c..652422f 100644
>>> --- a/meta/conf/machine/include/tune-ppce300c2.inc
>>> +++ b/meta/conf/machine/include/tune-ppce300c2.inc
>>> @@ -1,5 +1,11 @@
>>> +DEFAULTTUNE ?= "ppce300"
>>> +
>>>  require conf/machine/include/powerpc/arch-powerpc.inc
>>>  
>>> -TUNE_CCARGS = "-mcpu=e300c2 -msoft-float"
>>> -TUNE_PKGARCH = "ppce300"
>>> -PACKAGE_EXTRA_ARCHS = "powerpc ppce300"
>>> +TUNEVALID[ppce300] = "Enable ppce300 specific processor optimizations"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300", "-mcpu=e300c2", "", d)}"
>>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300", "ppce300", "", d)}"
>>> +
>>> +AVAILTUNES += "ppce300"
>>> +TUNE_FEATURES_tune-ppce300 = "m32 fpu-soft ppce300"
>>> +PACKAGE_EXTRA_ARCHS_tune-ppce300 = "powerpc ppce300"
>>
>> There is also a ppce300 as well as the e300c2, so I'd change the option to be
>> fully qualified.  (One has floating point one doesn't..)
> 
> Fair enough.
> 
>>> diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
>>> index 22208f0..fe62445 100644
>>> --- a/meta/conf/machine/include/tune-ppce500.inc
>>> +++ b/meta/conf/machine/include/tune-ppce500.inc
>>> @@ -1,6 +1,11 @@
>>> +DEFAULTTUNE ?= "ppce500"
>>> +
>>>  require conf/machine/include/powerpc/arch-powerpc.inc
>>>  
>>> -TUNE_CCARGS = "-mcpu=8540"
>>> -BASE_PACKAGE_ARCH = "ppce500"
>>> -TUNE_PKGARCH = "ppce500"
>>> -PACKAGE_EXTRA_ARCHS = "powerpc ppce500"
>>> +TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
>>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppce500", "", d)}"
>>> +
>>> +AVAILTUNES += "ppce500"
>>> +TUNE_FEATURES_tune-ppce500 = "m32 ppce500"
>>> +PACKAGE_EXTRA_ARCHS_tune-ppce500 = "powerpc ppce500"
>>
>> This is the single precision e500 -- it should be specifying it's floating point
>> type.
> 
> which is? :)

Based on the above, ppc-efs..  (I believe these names are completely arbitrary...)

Ohh didn't notice before, but once you enable the spe floating point, the
registers are used and it's no longer soft-float anymore.. (hard-float = classic
PPC floating point unit).  So the PACKAGE_EXTRA_ARCHS_tune-ppce500 should be
simply "ppce500"

>>> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
>>> index 182d019..0d3640f 100644
>>> --- a/meta/conf/machine/include/tune-ppce500mc.inc
>>> +++ b/meta/conf/machine/include/tune-ppce500mc.inc
>>> @@ -1,5 +1,11 @@
>>> +DEFAULTTUNE ?= "ppce500mc"
>>> +
>>>  require conf/machine/include/powerpc/arch-powerpc.inc
>>>  
>>> -TUNE_CCARGS = "-mcpu=e500mc"
>>> -TUNE_PKGARCH = "ppce500mc"
>>> -PACKAGE_EXTRA_ARCHS = "powerpc ppce500mc"
>>> +TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
>>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "", d)}"
>>> +
>>> +AVAILTUNES += "ppce500mc"
>>> +TUNE_FEATURES_tune-ppce500mc = "m32 ppce500mc"
>>> +PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
>>
>> e500mc using the classic "hard-float" floating point unit.
> 
> ok, so its hard-fpu...

That is my understanding.  Hopefully someone can verify this...

>>> diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
>>> index daf2d58..e6b48a2 100644
>>> --- a/meta/conf/machine/include/tune-ppce500v2.inc
>>> +++ b/meta/conf/machine/include/tune-ppce500v2.inc
>>> @@ -1,5 +1,11 @@
>>> +DEFAULTTUNE ?= "ppce500v2"
>>> +
>>>  require conf/machine/include/powerpc/arch-powerpc.inc
>>>  
>>> -TUNE_CCARGS = "-mcpu=8548 -mabi=spe -mspe"
>>> -TUNE_PKGARCH = "ppce500v2"
>>> -PACKAGE_EXTRA_ARCHS = "powerpc ppce500v2"
>>> +TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
>>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "ppce500v2", "", d)}"
>>> +
>>> +AVAILTUNES += "ppce500v2"
>>> +TUNE_FEATURES_tune-ppce500v2 = "m32 spe ppce500v2"
>>> +PACKAGE_EXTRA_ARCHS_tune-ppce500v2 = "powerpc ppce500v2"
>>
>> This one is double precision.
> 
> so hard-fpu?

Nope.. this is the ppc-efd.  Note, again not compatible w/ "powerpc".. and NOT
compatible with "ppce500".  (Since they're different SPE units, the call passing
is different..)

Fun with extensible architectures.. :P

--Mark

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



