Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web09.33700.1607947807680359176
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 04:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 0BEC9eGH002699
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 14 Dec 2020 06:10:00 -0600
Subject: Re: [OE-core] [PATCH] file /etc/ethertypes conflicts between netbase-1:6.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64
To: Outback Dingo <outbackdingo@gmail.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20201214103248.2227-1-outbackdingo@gmail.com>
 <CANNYZj_EoiG+MXJ-fjsZ8YsxwRhD6SSwv9xXLTzw3PMTvBqXdA@mail.gmail.com>
 <CAKYr3zyZ2N=VHuy+qDwHo4QkR7DNweusO3RrBj+A2zziBHKaDw@mail.gmail.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <1801279e-ec5b-b025-aa45-1338ae835f98@kernel.crashing.org>
Date: Mon, 14 Dec 2020 06:09:39 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAKYr3zyZ2N=VHuy+qDwHo4QkR7DNweusO3RrBj+A2zziBHKaDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The version in netbase is the correct one.

For a comparison, see the followng for the netbase version:

https://salsa.debian.org/md/netbase/-/blob/master/etc/ethertypes

and see the following for the ebtables version:

http://git.netfilter.org/ebtables/tree/ethertypes?h=ebtables-2.0.10-4

So the correct fix for this would be to remove ethertypes from the ebtables
recipe in meta-oe.

Additionally, it looks like there is a MUCH newer version of ebtables.  (2.0.10
was released 6 year ago, while 2.0.11 was released about 1 year ago.)

(Even 2.0.11 has an older version of the ethertypes file then what netbase has.)

--Mark

On 12/14/20 4:55 AM, Outback Dingo wrote:
> On Mon, Dec 14, 2020 at 5:39 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>>
>> Sorry, but you need to explain why the file from from ebtables (an optional package from a 3rd party layer) takes precedence over file from netbase (which is a core item).
> 
> further to the previous note, it conflicts with ebtables in meta-oe
> from what i can tell
> 
> commit c71a08cea8477f69ee3bc511f1f14d99e09c0a49
> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> Date:   Mon Dec 3 15:30:40 2012 +0000
> 
>     ebtables: add from OE-Classic, update and tidy up
> 
>     * Update to 2.0.10-4
>     * Handle hardcoded paths in initscript
>     * Add LIC_FILES_CHKSUM
>     * Set SUMMARY (which sets DESCRIPTION)
>     * Drop PRIORITY
>     * Minor formatting/ordering tweaks
> 
>     Based on a patch by Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
> 
>     Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> 
>>
>> Alex
>>
>> On Mon, 14 Dec 2020 at 11:33, Outback Dingo <outbackdingo@gmail.com> wrote:
>>>
>>> ---
>>>  meta/recipes-core/netbase/netbase_6.2.bb | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/netbase/netbase_6.2.bb b/meta/recipes-core/netbase/netbase_6.2.bb
>>> index a54d2e7764..262b2cf1bc 100644
>>> --- a/meta/recipes-core/netbase/netbase_6.2.bb
>>> +++ b/meta/recipes-core/netbase/netbase_6.2.bb
>>> @@ -19,5 +19,4 @@ do_install () {
>>>         install -m 0644 ${S}/etc/rpc ${D}${sysconfdir}/rpc
>>>         install -m 0644 ${S}/etc/protocols ${D}${sysconfdir}/protocols
>>>         install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
>>> -       install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
>>>  }
>>> --
>>> 2.20.1
>>>
>>>
>>>
>>>
>>>
>>>
>>> 
>>>
