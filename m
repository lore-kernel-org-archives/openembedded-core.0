Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1THKLf-0000tL-Q8
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 22:06:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8RJrM2d001478
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Sep 2012 12:53:22 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 27 Sep 2012 12:53:21 -0700
Message-ID: <5064AEB1.5010203@windriver.com>
Date: Thu, 27 Sep 2012 14:53:21 -0500
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
	<20120927191246.GG3454@jama.jama.net>
	<5064A66F.2000908@windriver.com>
	<20120927194059.GH3454@jama.jama.net>
In-Reply-To: <20120927194059.GH3454@jama.jama.net>
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
X-List-Received-Date: Thu, 27 Sep 2012 20:06:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/27/12 2:40 PM, Martin Jansa wrote:
> On Thu, Sep 27, 2012 at 02:18:07PM -0500, Mark Hatle wrote:
>> On 9/27/12 2:12 PM, Martin Jansa wrote:
>>> On Thu, Sep 27, 2012 at 01:58:35PM -0500, Mark Hatle wrote:
>>>> Let me preface this by I have read the patch set.. Martin asked me to comment on
>>>> the items below...
>>>>
>>>> On 9/27/12 3:37 AM, Martin Jansa wrote:
>>>>> On Sat, Sep 22, 2012 at 06:45:44PM +0100, Richard Purdie wrote:
>>>>>> On Sat, 2012-09-22 at 18:51 +0200, Martin Jansa wrote:
>>>>>>> * bitbake.conf has OPTDEFAULTTUNE with weak default value of DEFAULTTUNE
>>>>>>> * this way xscale or arm926ejs is not used by default when some machine
>>>>>>>      includes its tune*.inc, but it's easy for DISTRO to say it wants
>>>>>>>      OPTDEFAULTTUNE for some packages or always (if they don't want to
>>>>>>>      share built packages between xscale and arm926ejs).
>>>>>>>
>>>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>>>>> ---
>>>>>>>     meta/conf/bitbake.conf                       | 1 +
>>>>>>>     meta/conf/machine/include/tune-arm926ejs.inc | 3 ++-
>>>>>>>     meta/conf/machine/include/tune-xscale.inc    | 3 ++-
>>>>>>>     3 files changed, 5 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>>>>>> index 9b41749..e433fcb 100644
>>>>>>> --- a/meta/conf/bitbake.conf
>>>>>>> +++ b/meta/conf/bitbake.conf
>>>>>>> @@ -95,6 +95,7 @@ HOST_LD_ARCH = "${TARGET_LD_ARCH}"
>>>>>>>     HOST_AS_ARCH = "${TARGET_AS_ARCH}"
>>>>>>>     HOST_EXEEXT = ""
>>>>>>>
>>>>>>> +OPTDEFAULTTUNE ??= "${DEFAULTTUNE}"
>>>>>>>     TUNE_ARCH ??= "INVALID"
>>>>>>>     TUNE_CCARGS ??= ""
>>>>>>>     TUNE_LDARGS ??= ""
>>>>>>
>>>>>> As I've said previously, I do not think OPTDEFAULTTUNE is clear in usage
>>>>>> or in meaning and we need to find a better solution. I'm therefore not
>>>>>> keen on this change.
>>>>>
>>>>> OK, what about the rest of patchset (without OPTDEFAULTTUNE bits) to use
>>>>> different PKGARCH for different TUNE_CCARGS?
>>>>
>>>> I've been an advocate for a while that the processor optimization (CCARGS) does
>>>> make it into the PKGARCH.  ARMPKGSFX_CPU seems like a reasonable approach to do
>>>> this.  It allows each tune to set something to tell people what that binary is
>>>> really built for, and for the 'base' tunes (i.e. armv5) it can be left off.
>>>>
>>>> The only concern I have with that is:
>>>>
>>>> +ARMPKGSFX_CPU = "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs",
>>>> "-arm926ejs", "", d)}"
>>>>
>>>> That probably should be a .= instead of just '='.  That way if the user loads
>>>> multiple compatible tunes the right ARMPKGSFX_CPU will be used.  (Alternatively
>>>> using the overrides would work as well for this.. i.e.
>>>> ARMPKGSFX_CPU_tune-arm926ejs instead...
>>>
>>> OK.
>>>
>>>> I see Patch 5/5 instead moves toward the ARMPKGARCH usage instead...  This is
>>>> fine as well, and it was designed to be overriden.. but again the .= or
>>>> -tune_... syntax should be used...
>>>
>>> I tend to prefer ARMPKGARCH as it's shorter xscale-te/armv5te-xscale.
>>>
>>> But not sure what to do with all "lower" PACKAGE_EXTRA_ARCHS:
>>> PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
>>> do we want PACKAGE_EXTRA_ARCHS_tune-armv5teb only or also something like
>>> armv4t-xscale?
>>>
>>> Well whole PACKAGE_EXTRA_ARCHS has too many entries already (opkg update
>>> would try to download many feeds but only a few does exist).
>>
>> The PACKAGE_EXTRA_ARCHS should contain all of the 'compatible' arch names.
>> Which of course feed into the list of feeds used by the various packaging
>> systems.  I think it's up to the distribution to modify or limit the feeds
>> resolved, but I don't know if there is a clean way to do this.  I always error
>> on listing more then less, because I don't know how people are going to want to
>> mix and match things.  (And a BSP or end user can always just define what the
>> PACKAGE_EXTRA_ARCHS value should be.)
>
> Yes that's what I do now, but I'm not too happy about it :/
> SUPPORTED_EXTRA_ARCHS ?= "armv4t armv5te armv6-novfp armv7a-vfp-neon x86_64 x86"
> SUPPORTED_EXTRA_ARCHS_armv7a ?= "armv7a-vfp-neon"
> SUPPORTED_EXTRA_ARCHS_armv6 ?= "armv6-novfp"
>
>>>> Anyway, my point in this is I like having the stuff unique, but we need to be
>>>> sure that you can specify more then one tune file during a build w/o clashes.
>>>>
>>>>>> I also still think this is a distro packaging issue and should be solved
>>>>>> by the distro, even if that means more complexity there. That is the
>>>>>> right place for this particular complexity IMO. I'm happy to support
>>>>>> that from the core but not in something as user visible and confusing as
>>>>>> this variable.
>>>>>
>>>>> Agreed OPTDEFAULTTUNE is to help distro configs, because complexity
>>>>> there will be much worse then when it's defined in tune-* files, because
>>>>> now will have to define DEFAULTTUNE/OPTDEFAULTTUNE for each MACHINE (or
>>>>> TUNE_FEATURE) it supports and it's less orthogonal (machine/distro
>>>>> config) then it could be.
>>>>
>>>> I really don't have a strong opinion on this either way.  I know for the stuff
>>>> I've done in the past (not oe-based) we've just manually configured (the
>>>> equivalent of the distro conf) with the information on the handful of items that
>>>> people wanted optimized the most...  eglibc, openssl, mysql/posgresql...
>>>> otherwise folks don't seem to care, and re-use works fine.
>>>>
>>>> If the list is small (i.e. less then 10 packages) that specifying it via package
>>>> specific overrides in the distro file should be fine.. if it's more then 10
>>>> (typically) then we need to start looking for another approach.
>>>>
>>>> I'd almost suggest in the distro file you could do:
>>>>
>>>> OPTDEFAULTTUNE = "$@{...}" where ... is check for something set by the BSP (or
>>>> elsewhere), if set use that value, otherwise using the DEFAULTTUNE value.
>>>>
>>>> DEFAULTTUNE-<pn> = "${OPTDEFAULTTUNE}"
>>>
>>> Yes but first I have to say:
>>> DEFAULTTUNE_spitz = armv5te
>>> OPTDEFAULTTUNE_spitz = xscale
>>> DEFAULTTUNE_qemuarm = armv5te
>>> OPTDEFAULTTUNE_qemuarm = arm926ejs
>>> or
>>> DEFAULTTUNE_tune-xscale = armv5te
>>> OPTDEFAULTTUNE_tun_xscale = xscale
>>> DEFAULTTUNE_tune-arm926ejs = armv5te
>>> OPTDEFAULTTUNE_tune-arm926ejs = arm926ejs
>>>
>>> to know what's OPTDEFAULTTUNE and DEFAULTTUNE for given MACHINE if it's
>>> not in defined tune-xscale/tune-arm926ejs.
>>
>> I assume that a distribution will be (bb)appending, or defining their own BSPs.
>>    And in that case it's pretty easy to add both the DEFAULTTUNE and
>> OPTDEFAULTTUNE line to the BSP configuration file.  (And if someone uses a
>> different distribution, then the DEFAULT is used as that is the standard method.)
>
> Yes, but how should I .bbappend machine config? e.g. qemuarm.conf in
> oe-core?

Sorry, not bbappend in this case..  but you can do it in a distribution layer. 
(This is from memory so I might not be 100% correct.)

You should be able to have in your own layer a qemuarm.conf that looks like:

require conf/machine/qemuarm.conf
OPTDEFAULTTUNE = "something"
DEFAULTTUNE = "something_else"

It will know not to open itself in the requires.... and fall back to a previous 
layer.

(If that doesn't work, I know we did it somehow.. since we ran into a similar 
situation with our product.)

> Yes I can add that to my BSPs, but if I call it OPTDEFAULTTUNE
> then everybody else (who is interested in my BSP but has own distro)
> needs to agree on name OPTDEFAULTTUNE.
>
> That's why I wanted this defined in tune-* files which are shared in
> oe-core and used by everybody I guess.

I agree completely, this is the downside of doing it int he distro files vs the 
tune files.  But in the end it seems reasonable to make it a machine or 
distribution setting of some kind.

>>> And that's what I didn't want to include in my distro config (and then
>>> explaining to someone that when adding MACHINE foo he has to send patch
>>> for distro config).
>>
>> Ya I understand.  This is an odd situation for many embedded systems.  You want
>> to reuse packages that aren't optimally tuned -- but you still want a few tuned
>> packages.  It's certainly a usecase we need to support -- but I'm not sure in
>> the end how people end up doing this.
>>
>> I know most of my commercial customers just want everything to be tuned for the
>> target BSP.. and they build new distributions for each product they implement.
>
> Ok, but having both OPTDEFAULTTUNE and DEFAULTTUNE in tune-* allows both
> use cases to coexist without any complex configuration on distro side.

Yup, no disagreement there.

--Mark

> Thanks again for constructive comment.
>
> Cheers,
>



