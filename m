Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.3720.1585250426815031838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 12:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 02QJKJB4018018
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 14:20:25 -0500
Subject: Re: [OE-core] [v2 PATCH] base.bbclass: Add COMPATIBLE_OS, useful for non-Linux target recipes
To: openembedded-core@lists.openembedded.org
References: <20200326152559.64446-1-mark.hatle@kernel.crashing.org>
 <0b6612fe59631529b92e231400373b93e3396944.camel@linuxfoundation.org>
 <15FFE97B8BC33CAA.21883@lists.openembedded.org>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <0379d991-c38b-f08a-c502-5ad12a727070@kernel.crashing.org>
Date: Thu, 26 Mar 2020 14:20:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <15FFE97B8BC33CAA.21883@lists.openembedded.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I talked with RP off the list and got this working.

Below is what I ended up doing to prevent the default packages from working with
baremetal, unless they were configured to.

In my baremetal distro.conf:

COMPATOS = ""
COMPATOS_class-target = ".*-linux${LIBCEXTENSION}${ABIEXTENSION}"
COMPATIBLE_HOST ?= "${COMPATOS}"

Then in each of the baremetal -only- recipes:

COMPATIBLE_HOST = ".*-elf"
COMPATIBLE_HOST_arm = "[^-]*-[^-]*-eabi"

In the recipes for BOTH baremetal and Linux:

COMPATIBLE_HOST = "${HOST_SYS}"

(Setting to "" should work as well..)

--Mark

On 3/26/20 12:05 PM, Mark Hatle wrote:
>> On Thu, 2020-03-26 at 10:25 -0500, Mark Hatle wrote:
>>> Add the ability to generate non-Linux based components, such as
>>> baremetal, FreeRTOS, Zypher, etc, exist.  There is a need for a way
>>> to take components as specific to a given OS.
>>>
>>> This is especially important in a multiconfig build where you may be
>>> targeting different OSes which different sets of recipes in a common
>>> set of layers.
>>>
>>> Setting a default of (matching bitbake.conf's default TARGET_OS):
>>>
>>>    COMPATIBLE_OS ?= "linux${LIBCEXTENSION}${ABIEXTENSION}"
>>>
>>> will allow all existing recipes to be tagged as Linux specific, so
>>> only non-Linux recipes would need to be tagged with specific
>>> compatibility.
>>>
>>> For a baremetal recipes, the following was used to test this code:
>>>
>>>    COMPATIBLE_OS = "elf"
>>>    COMPATIBLE_OS_arm = "eabi"
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>>> ---
>>> V2:
>>> Only difference to V1 is typograhic fixes to the commit message.
>>>
>>>  meta/classes/base.bbclass    | 7 +++++++
>>>  meta/conf/documentation.conf | 1 +
>>>  2 files changed, 8 insertions(+)
>>>
>>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>>> index 45f9435fd8..c123c5dc50 100644
>>> --- a/meta/classes/base.bbclass
>>> +++ b/meta/classes/base.bbclass
>>> @@ -509,6 +509,13 @@ python () {
>>>          d.setVarFlag('do_devshell', 'fakeroot', '1')
>>>          d.appendVarFlag('do_devshell', 'depends', '
>>> virtual/fakeroot-native:do_populate_sysroot')
>>>
>>> +    need_os = d.getVar('COMPATIBLE_OS')
>>> +    if need_os and not d.getVar('PARSE_ALL_RECIPES', False):
>>> +        import re
>>> +        this_os = d.getVar('TARGET_OS')
>>> +        if not re.match(need_os, this_os):
>>> +            raise bb.parse.SkipRecipe("incompatible with os %s (not
>>> in COMPATIBLE_OS)" % this_os)
>>> +
>>>      need_machine = d.getVar('COMPATIBLE_MACHINE')
>>>      if need_machine and not d.getVar('PARSE_ALL_RECIPES', False):
>>>          import re
>>> diff --git a/meta/conf/documentation.conf
>>> b/meta/conf/documentation.conf
>>> index 0b21d1f63e..7a87540f43 100644
>>> --- a/meta/conf/documentation.conf
>>> +++ b/meta/conf/documentation.conf
>>> @@ -111,6 +111,7 @@ COMBINED_FEATURES[doc] = "A set of features
>>> common between MACHINE_FEATURES and
>>>  COMMON_LICENSE_DIR[doc] = "Points to meta/files/common-licenses in
>>> the Source Directory, which is where generic license files reside."
>>>  COMPATIBLE_HOST[doc] = "A regular expression that resolves to one or
>>> more hosts (when the recipe is native) or one or more targets (when
>>> the recipe is non-native) with which a recipe is compatible."
>>
>> How does COMPATIBLE_OS compare to COMPATIBLE_HOST (documented above)?
> 
> HOST_SYS="aarch64-oe-linux"
> 
> So the equivalent to the COMPATIBLE_OS would be:
> 
> COMPATIBLE_HOST ?= ".*-linux.*"
> 
> So it COULD be used in most cases.
> 
> When I tried this before though, I could get it to work in a multiconfig
> setting.
> 
> Specifically what I tried was setting, in my local.conf:
> 
> COMPATIBLE_HOST ?= ".*-linux${LIBCEXTENSION}${ABIEXTENSION}"
> 
> And then in the recipes:
> 
> COMPATIBLE_HOST = ".*-elf"
> COMPATIBLE_HOST_arm = ".*-eabi"
> 
> But then the second one matches the linux ABIEXTENSION and broke..
> 
> So really the issue is that I -only- ever want to match on the OS part of
> the "SYS" string.  And done to the multiple natures of the '-', it's
> difficult to get right.
> 
> I didn't try something complex like: [^-]-[^-]-eabi
> 
> --Mark
> 
>> Cheers
>>
>> Richard
>>
> 
> 
> 
> 
