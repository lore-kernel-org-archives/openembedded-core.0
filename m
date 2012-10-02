Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TJ9P5-0002P3-07
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 22:49:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q92KaGIr003054
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Oct 2012 13:36:16 -0700 (PDT)
Received: from msp-dhcp7.wrs.com (172.25.34.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 2 Oct 2012 13:36:15 -0700
Message-ID: <506B5040.6000703@windriver.com>
Date: Tue, 2 Oct 2012 15:36:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
	<1348335944.10108.211.camel@ted>
	<20120927083701.GC3454@jama.jama.net>
	<5064A1DB.40506@windriver.com>
	<20121002184355.GB15881@jama.jama.net>
In-Reply-To: <20121002184355.GB15881@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/5] tune-xscale, tune-arm926ejs: add OPTDEFAULTTUNE variable and use more generic DEFAULTTUNE as default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 20:49:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/12 1:43 PM, Martin Jansa wrote:
> On Thu, Sep 27, 2012 at 01:58:35PM -0500, Mark Hatle wrote:
>> Let me preface this by I have read the patch set.. Martin asked me to comment on
>> the items below...
>>
>> On 9/27/12 3:37 AM, Martin Jansa wrote:
>>> On Sat, Sep 22, 2012 at 06:45:44PM +0100, Richard Purdie wrote:
>>>> On Sat, 2012-09-22 at 18:51 +0200, Martin Jansa wrote:
>>>>> * bitbake.conf has OPTDEFAULTTUNE with weak default value of DEFAULTTUNE
>>>>> * this way xscale or arm926ejs is not used by default when some machine
>>>>>     includes its tune*.inc, but it's easy for DISTRO to say it wants
>>>>>     OPTDEFAULTTUNE for some packages or always (if they don't want to
>>>>>     share built packages between xscale and arm926ejs).
>>>>>
>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>>> ---
>>>>>    meta/conf/bitbake.conf                       | 1 +
>>>>>    meta/conf/machine/include/tune-arm926ejs.inc | 3 ++-
>>>>>    meta/conf/machine/include/tune-xscale.inc    | 3 ++-
>>>>>    3 files changed, 5 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>>>> index 9b41749..e433fcb 100644
>>>>> --- a/meta/conf/bitbake.conf
>>>>> +++ b/meta/conf/bitbake.conf
>>>>> @@ -95,6 +95,7 @@ HOST_LD_ARCH = "${TARGET_LD_ARCH}"
>>>>>    HOST_AS_ARCH = "${TARGET_AS_ARCH}"
>>>>>    HOST_EXEEXT = ""
>>>>>
>>>>> +OPTDEFAULTTUNE ??= "${DEFAULTTUNE}"
>>>>>    TUNE_ARCH ??= "INVALID"
>>>>>    TUNE_CCARGS ??= ""
>>>>>    TUNE_LDARGS ??= ""
>>>>
>>>> As I've said previously, I do not think OPTDEFAULTTUNE is clear in usage
>>>> or in meaning and we need to find a better solution. I'm therefore not
>>>> keen on this change.
>>>
>>> OK, what about the rest of patchset (without OPTDEFAULTTUNE bits) to use
>>> different PKGARCH for different TUNE_CCARGS?
>>
>> I've been an advocate for a while that the processor optimization (CCARGS) does
>> make it into the PKGARCH.  ARMPKGSFX_CPU seems like a reasonable approach to do
>> this.  It allows each tune to set something to tell people what that binary is
>> really built for, and for the 'base' tunes (i.e. armv5) it can be left off.
>>
>> The only concern I have with that is:
>>
>> +ARMPKGSFX_CPU = "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs",
>> "-arm926ejs", "", d)}"
>>
>> That probably should be a .= instead of just '='.  That way if the user loads
>> multiple compatible tunes the right ARMPKGSFX_CPU will be used.  (Alternatively
>> using the overrides would work as well for this.. i.e.
>> ARMPKGSFX_CPU_tune-arm926ejs instead...
>>
>> I see Patch 5/5 instead moves toward the ARMPKGARCH usage instead...  This is
>> fine as well, and it was designed to be overriden.. but again the .= or
>> -tune_... syntax should be used...
>
> I've updated contrib/jansa/tune-test with this.
> http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test
>
> While changing that to use e.g.
> ARMPKGARCH_tune-xscale
> I've noticed that _tune-foo are not valid OVERRIDE, so I had to add
> ARMPKGARCH = "${ARMPKGARCH_tune-${DEFAULTTUNE}}"
> in arch-arm.inc and then define ARMPKGARCH_tune-foo for every supported
> arm tune (otherwise it's expanded like this TUNE_PKGARCH (${ARMPKGARCH_tune-armv5te}te).).
>
> This makes whole
> TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
> a bit less usefull, maybe ARMPKGSFX_CPU was better approach..

I've clarified with RP on this.  Tune values are not a 'true' override because 
of evaluation time of overrides.  We want the DEFAULTTUNE to be changeable 
during the build process to allow multilibs, alternative configurations, etc.

So in the tunes to do override-like implementations, you will need:

ARMPKGARCH = "${ARMPKGARCH_tune-${DEFAULTTUNE}}"

and then in each tune fragment:

ARMPKGARCH_tune-foo = "bar"

--Mark

> Cheers,
>
>>
>> Anyway, my point in this is I like having the stuff unique, but we need to be
>> sure that you can specify more then one tune file during a build w/o clashes.
>>
>>>> I also still think this is a distro packaging issue and should be solved
>>>> by the distro, even if that means more complexity there. That is the
>>>> right place for this particular complexity IMO. I'm happy to support
>>>> that from the core but not in something as user visible and confusing as
>>>> this variable.
>>>
>>> Agreed OPTDEFAULTTUNE is to help distro configs, because complexity
>>> there will be much worse then when it's defined in tune-* files, because
>>> now will have to define DEFAULTTUNE/OPTDEFAULTTUNE for each MACHINE (or
>>> TUNE_FEATURE) it supports and it's less orthogonal (machine/distro
>>> config) then it could be.
>>
>> I really don't have a strong opinion on this either way.  I know for the stuff
>> I've done in the past (not oe-based) we've just manually configured (the
>> equivalent of the distro conf) with the information on the handful of items that
>> people wanted optimized the most...  eglibc, openssl, mysql/posgresql...
>> otherwise folks don't seem to care, and re-use works fine.
>>
>> If the list is small (i.e. less then 10 packages) that specifying it via package
>> specific overrides in the distro file should be fine.. if it's more then 10
>> (typically) then we need to start looking for another approach.
>>
>> I'd almost suggest in the distro file you could do:
>>
>> OPTDEFAULTTUNE = "$@{...}" where ... is check for something set by the BSP (or
>> elsewhere), if set use that value, otherwise using the DEFAULTTUNE value.
>>
>> DEFAULTTUNE-<pn> = "${OPTDEFAULTTUNE}"
>>
>> and then everything can be encapsulated into the distro file (and distro BSPs).
>>    The downside of this approach is that it's not the 'standard' implementation.
>>
>> --Mark
>>
>>> Cheers,
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



