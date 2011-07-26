Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QllIj-0001uO-2V
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 19:20:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QHFxEo015214
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 10:15:59 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 26 Jul 2011 10:15:50 -0700
Message-ID: <4E2EF641.5050204@windriver.com>
Date: Tue, 26 Jul 2011 12:15:45 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E2ED5F2.3090306@windriver.com> <1311698198.2344.279.camel@rex>
	<4E2EF10A.2030705@windriver.com> <1311699937.2344.289.camel@rex>
In-Reply-To: <1311699937.2344.289.camel@rex>
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
X-List-Received-Date: Tue, 26 Jul 2011 17:20:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/26/11 12:05 PM, Richard Purdie wrote:
> On Tue, 2011-07-26 at 11:53 -0500, Mark Hatle wrote:
>> On 7/26/11 11:36 AM, Richard Purdie wrote:
>>> On Tue, 2011-07-26 at 09:57 -0500, Mark Hatle wrote:
>>>> On 7/26/11 7:44 AM, Richard Purdie wrote:
>>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>> ---
>>>>>  meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 +++++++++++++++++++-
>>>>>  meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
>>>>>  meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
>>>>>  meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
>>>>>  meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
>>>>>  meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
>>>>>  6 files changed, 88 insertions(+), 18 deletions(-)
>>>>>
>>>>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>>>> index 17ace32..3f7befb 100644
>>>>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>>>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>>>> @@ -1,3 +1,44 @@
>>>>> -TUNE_ARCH = "powerpc"
>>>>> +# Power Architecture definition
>>>>> +# Four defined ABIs, all combinations of:
>>>>> +# *) Hard/Soft Floating Point
>>>>> +# *) 32-bit/64-bit
>>>>> +
>>>>> +DEFAULTTUNE ?= "powerpc"
>>>>> +
>>>>> +TUNEVALID[m32] = "Power ELF32 standard ABI"
>>>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
>>>>> +
>>>>> +TUNEVALID[m32-arch] = "Enable powerpc package architecture"
>>>>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m32-arch" ], "powerpc", "", d)}"
>>>>> +
>>>>> +TUNEVALID[m64] = "Power ELF64 standard ABI"
>>>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-m64", "", d)}"
>>>>> +
>>>>> +TUNEVALID[m64-arch] = "Enable powerpc64 package architecture"
>>>>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64-arch" ], "powerpc64", "", d)}"
>>>>
>>>> Why m32-arch and m64-arch?  If m32 or m64 is selected then it should mean
>>>> powerpc or powerpc64.
>>>
>>> I've gotten confused here and mixed up TUNE_ARCH and TUNE_PKGARCH but
>>> there was a reason.
>>>
>>> The missing piece is 
>>>
>>> TUNE_PKGARCH ?= "${TUNE_ARCH}"
>>>
>>> and the trouble comes when a tune file wants to change this only when
>>> its tune config is in action.
>>>
>>> I'm thinking ahead to trying a mixed ppc 32 and 64 bit build where
>>> TUNE_PKGARCH needs to take on the values for both configs.
>>
>> As far as I can tell, in all cases m32 = powerpc and m64 = powerpc64..  There is
>> no way to mix a build of ppc32 and ppc64 w/o using the multilib code.
>>
>> The m32/m64 is the ABI, so only one can be present in the TUNE_FEATURES.. and
>> passed via gcc through the TUNE_CCARGS.
> 
> Ok, say I use tune-ppcXXX and it sets TUNE_PKGARCH:
> 
> TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "", d)}"
> 
> and I want a multilib config using this as the m32 ABI and also have
> powerpc64 as my other multilib. I can't select that as it will get
> TUNE_PKGARCH wrong in the 64 bit case since:
> 
> TUNE_PKGARCH ?= "${TUNE_ARCH}"
> 
> is overwritten. I guess we could do:
> 
> TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "${TUNE_ARCH}", d)}"

ppc603e is the new option.. (lets say for argument it can run in 64-bit mode, in
reality it can't and is an invalid config....)

TUNEVALID[ppc603e] = "PowerPC 603e Optimization"

# Note the TUNE_NAME is used differently from the TUNE_FEATURES
TUNE_NAME ?= "ppc603e"

TUNE_FEATURES_ppc603e = "m32 ppc603e"
TUNE_FEATURES_ppc603e-64 = "m64 ppc603e"

The if you include the tune-ppc603e.inc the default is the 32-bit version (what
I'd consider the reasonable default...)  If you wanted the 64-bit version
instead you'd simply change set the TUNE_NAME to "ppc603e-64" and the properly
tuned set of features is set for you.

TUNE_PKGARCH_ppc603e = "ppc603e"
TUNE_PKGARCH_ppc603e-64 = "ppc603e-64"

etc...

in the default (ppc603e) case, the TUNE_ARCH should always be "powerpc", and in
the ppc603e-64 case (if manually enabled), it would be "powerpc64"...

This is what was done in the ARM cases and I believe the core2 case in ia32.

--Mark

> ?
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



