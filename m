Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.229.1585242309199915523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 10:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 02QH56qe010909;
	Thu, 26 Mar 2020 12:05:06 -0500
Received: (from apache@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 02QH55LI010907;
	Thu, 26 Mar 2020 12:05:05 -0500
X-Authentication-Warning: gate.crashing.org: apache set sender to mark.hatle@kernel.crashing.org using -f
Received: from 149.199.62.130
        (SquirrelMail authenticated user mark.hatle)
        by gate.crashing.org with HTTP;
        Thu, 26 Mar 2020 12:05:05 -0500 (CDT)
Message-ID: <27695.149.199.62.130.1585242305.squirrel@gate.crashing.org>
In-Reply-To: 
     <0b6612fe59631529b92e231400373b93e3396944.camel@linuxfoundation.org>
References: <20200326152559.64446-1-mark.hatle@kernel.crashing.org>
    <0b6612fe59631529b92e231400373b93e3396944.camel@linuxfoundation.org>
Date: Thu, 26 Mar 2020 12:05:05 -0500 (CDT)
Subject: Re: [OE-core] [v2 PATCH] base.bbclass: Add COMPATIBLE_OS, useful for non-Linux target recipes
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: "Mark Hatle" <mark.hatle@kernel.crashing.org>,
        openembedded-core@lists.openembedded.org
User-Agent: SquirrelMail/1.4.10a-1.fc6
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On Thu, 2020-03-26 at 10:25 -0500, Mark Hatle wrote:
>> Add the ability to generate non-Linux based components, such as
>> baremetal, FreeRTOS, Zypher, etc, exist.  There is a need for a way
>> to take components as specific to a given OS.
>>
>> This is especially important in a multiconfig build where you may be
>> targeting different OSes which different sets of recipes in a common
>> set of layers.
>>
>> Setting a default of (matching bitbake.conf's default TARGET_OS):
>>
>>    COMPATIBLE_OS ?= "linux${LIBCEXTENSION}${ABIEXTENSION}"
>>
>> will allow all existing recipes to be tagged as Linux specific, so
>> only non-Linux recipes would need to be tagged with specific
>> compatibility.
>>
>> For a baremetal recipes, the following was used to test this code:
>>
>>    COMPATIBLE_OS = "elf"
>>    COMPATIBLE_OS_arm = "eabi"
>>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>> V2:
>> Only difference to V1 is typograhic fixes to the commit message.
>>
>>  meta/classes/base.bbclass    | 7 +++++++
>>  meta/conf/documentation.conf | 1 +
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index 45f9435fd8..c123c5dc50 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -509,6 +509,13 @@ python () {
>>          d.setVarFlag('do_devshell', 'fakeroot', '1')
>>          d.appendVarFlag('do_devshell', 'depends', '
>> virtual/fakeroot-native:do_populate_sysroot')
>>
>> +    need_os = d.getVar('COMPATIBLE_OS')
>> +    if need_os and not d.getVar('PARSE_ALL_RECIPES', False):
>> +        import re
>> +        this_os = d.getVar('TARGET_OS')
>> +        if not re.match(need_os, this_os):
>> +            raise bb.parse.SkipRecipe("incompatible with os %s (not
>> in COMPATIBLE_OS)" % this_os)
>> +
>>      need_machine = d.getVar('COMPATIBLE_MACHINE')
>>      if need_machine and not d.getVar('PARSE_ALL_RECIPES', False):
>>          import re
>> diff --git a/meta/conf/documentation.conf
>> b/meta/conf/documentation.conf
>> index 0b21d1f63e..7a87540f43 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -111,6 +111,7 @@ COMBINED_FEATURES[doc] = "A set of features
>> common between MACHINE_FEATURES and
>>  COMMON_LICENSE_DIR[doc] = "Points to meta/files/common-licenses in
>> the Source Directory, which is where generic license files reside."
>>  COMPATIBLE_HOST[doc] = "A regular expression that resolves to one or
>> more hosts (when the recipe is native) or one or more targets (when
>> the recipe is non-native) with which a recipe is compatible."
>
> How does COMPATIBLE_OS compare to COMPATIBLE_HOST (documented above)?

HOST_SYS="aarch64-oe-linux"

So the equivalent to the COMPATIBLE_OS would be:

COMPATIBLE_HOST ?= ".*-linux.*"

So it COULD be used in most cases.

When I tried this before though, I could get it to work in a multiconfig
setting.

Specifically what I tried was setting, in my local.conf:

COMPATIBLE_HOST ?= ".*-linux${LIBCEXTENSION}${ABIEXTENSION}"

And then in the recipes:

COMPATIBLE_HOST = ".*-elf"
COMPATIBLE_HOST_arm = ".*-eabi"

But then the second one matches the linux ABIEXTENSION and broke..

So really the issue is that I -only- ever want to match on the OS part of
the "SYS" string.  And done to the multiple natures of the '-', it's
difficult to get right.

I didn't try something complex like: [^-]-[^-]-eabi

--Mark

> Cheers
>
> Richard
>

